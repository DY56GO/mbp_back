package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.RoleSysInterfaceMapper;
import com.yingwu.project.mapper.SysInterfaceMapper;
import com.yingwu.project.model.entity.RoleSysInterface;
import com.yingwu.project.model.entity.SysInterface;
import com.yingwu.project.service.RoleSysInterfaceService;
import com.yingwu.project.service.SysInterfaceService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author Dy56
 * @description 针对表【sys_interface】的数据库操作Service实现
 */
@Service
public class SysInterfaceServiceImpl extends ServiceImpl<SysInterfaceMapper, SysInterface> implements SysInterfaceService {

    @Resource
    private WebApplicationContext applicationContext;

    @Resource
    private RoleSysInterfaceMapper roleSysInterfaceMapper;

    /**
     * 刷新系统接口
     *
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean refreshInterface() {
        // 1.扫描获取当前接口列表
        RequestMappingHandlerMapping mapping = applicationContext.getBean(RequestMappingHandlerMapping.class);
        Map<RequestMappingInfo, HandlerMethod> handlerMethods = mapping.getHandlerMethods();

        // 生成用于比较的 现接口Set Key: GET,/user/list,用户列表
        Set<String> nowInterfaceSet = new HashSet<>();
        // 生成用于比较的 现接口Set Key: GET,/user/list
        Set<String> nowInterfaceIdSet = new HashSet<>(512);

        handlerMethods.forEach((key, value) -> {
            String interfaceMethod = key.getMethodsCondition().toString();
            interfaceMethod = StringUtils.strip(interfaceMethod, "[]");
            String interfaceUrl = key.getPatternsCondition().getPatterns().toString();
            interfaceUrl = StringUtils.strip(interfaceUrl, "[]");
            String interfaceName = key.getName();
            if (interfaceName == null || interfaceName.length() == 0) {
                interfaceName = interfaceUrl;
            }
            String interfaceKey = interfaceMethod + "," + interfaceUrl + "," + interfaceName;

            nowInterfaceSet.add(interfaceKey);
            nowInterfaceIdSet.add(interfaceMethod + "," + interfaceUrl);
        });

        // 2.查询数据库中的接口列表
        QueryWrapper<SysInterface> queryWrapper = new QueryWrapper<>();
        List<SysInterface> databaseInterfaceList = list(queryWrapper);

        // 生成用于比较的 数据库接口Set Key: GET,/user/list,用户列表
        Set<String> databaseInterfaceSet = new HashSet<>();
        // 生成用于比较的 数据库接口Map Key: GET,/user/list Value:id
        Map<String, Long> databaseInterfaceIdMap = new HashMap<>(512);

        for (SysInterface sysInterface : databaseInterfaceList) {
            String interfaceMethod = sysInterface.getInterfaceMethod();
            String interfaceUrl = sysInterface.getInterfaceUrl();
            String interfaceName = sysInterface.getInterfaceName();
            String interfaceKey = interfaceMethod + "," + interfaceUrl + "," + interfaceName;

            databaseInterfaceSet.add(interfaceKey);
            databaseInterfaceIdMap.put(interfaceMethod + "," + interfaceUrl, sysInterface.getId());
        }

        // 3.比较当前接口列表和数据库接口列表生成新增列表和删除列表
        Set<String> addInterfaceSet = new HashSet<>();
        Set<String> deleteInterfaceSet = new HashSet<>();
        List<SysInterface> addInterfaceList = new ArrayList<>();
        List<Long> deleteInterfaceList = new ArrayList<>();

        // 获取要新增和修改的接口
        addInterfaceSet.addAll(nowInterfaceSet);
        addInterfaceSet.removeAll(databaseInterfaceSet);

        // 获取要删除的接口（内含要更新的接口）
        deleteInterfaceSet.addAll(databaseInterfaceSet);
        deleteInterfaceSet.removeAll(nowInterfaceSet);

        // 生成新增和修改的list
        for (String methodAndUrl : addInterfaceSet) {
            String[] methodAndUrlArr = methodAndUrl.split(",");
            SysInterface sysInterface = new SysInterface();

            // 如果在数据库列表中存在相同的接口，则对接口名称进行更新（添加id）
            Long interfaceId = databaseInterfaceIdMap.get(methodAndUrlArr[0] + "," + methodAndUrlArr[1]);
            if (interfaceId != null) {
                sysInterface.setId(interfaceId);
            }
            sysInterface.setInterfaceMethod(methodAndUrlArr[0]);
            sysInterface.setInterfaceUrl(methodAndUrlArr[1]);
            sysInterface.setInterfaceName(methodAndUrlArr[2]);
            addInterfaceList.add(sysInterface);
        }

        // 生成删除的list
        for (SysInterface sysInterface : databaseInterfaceList) {
            String interfaceMethod = sysInterface.getInterfaceMethod();
            String interfaceUrl = sysInterface.getInterfaceUrl();
            String interfaceName = sysInterface.getInterfaceName();
            String interfaceKey = interfaceMethod + "," + interfaceUrl + "," + interfaceName;

            // 如果在数据库列表中存在相同的接口，则不加入删除list
            if (deleteInterfaceSet.contains(interfaceKey) && !nowInterfaceIdSet.contains(interfaceMethod + "," + interfaceUrl)) {
                deleteInterfaceList.add(sysInterface.getId());
            }
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 4.更新
            saveOrUpdateBatch(addInterfaceList);
            removeBatchByIds(deleteInterfaceList);

            // 5.同步角色接口和Redis数据
            if (deleteInterfaceList.size() != 0) {
                roleSysInterfaceMapper.removeBatchByInterfaceId(deleteInterfaceList);
            }

        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }
}





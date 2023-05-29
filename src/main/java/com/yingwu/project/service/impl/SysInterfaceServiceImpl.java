package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.SysInterfaceMapper;
import com.yingwu.project.model.entity.RoleSysInterface;
import com.yingwu.project.model.entity.SysInterface;
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

        Set<String> nowInterfaceSet = new HashSet<>();
        handlerMethods.forEach((key, value) -> {
            String setInterfaceMethod = key.getMethodsCondition().toString();
            setInterfaceMethod = StringUtils.strip(setInterfaceMethod, "[]");
            String setInterfaceUrl = key.getPatternsCondition().getPatterns().toString();
            setInterfaceUrl = StringUtils.strip(setInterfaceUrl, "[]");
            String setInterfaceName = key.getName();
            if(setInterfaceName == null || setInterfaceName.length() == 0) {
                setInterfaceName = setInterfaceUrl;
            }
            String interfaceKey = setInterfaceMethod + "," + setInterfaceUrl + "," + setInterfaceName;
            nowInterfaceSet.add(interfaceKey);
        });

        // 2.查询数据库中的接口列表
        QueryWrapper<SysInterface> queryWrapper = new QueryWrapper<>();
        List<SysInterface> databaseInterfaceList = list(queryWrapper);
        Set<String> databaseInterfaceSet = new HashSet<>();
        for (SysInterface sysInterface : databaseInterfaceList) {
            String interfaceKey = sysInterface.getInterfaceMethod() + "," + sysInterface.getInterfaceUrl() + "," + sysInterface.getInterfaceName();
            databaseInterfaceSet.add(interfaceKey);
        }

        // 3.比较当前接口列表和数据库接口列表生成新增列表和删除列表
        Set<String> addInterfaceSet = new HashSet<>();
        Set<String> deleteInterfaceSet = new HashSet<>();
        List<SysInterface> addInterfaceList = new ArrayList<>();
        List<Long> deleteInterfaceList = new ArrayList<>();

        addInterfaceSet.addAll(nowInterfaceSet);
        addInterfaceSet.removeAll(databaseInterfaceSet);

        deleteInterfaceSet.addAll(databaseInterfaceSet);
        deleteInterfaceSet.removeAll(nowInterfaceSet);

        for (String methodAndUrl : addInterfaceSet) {
            String[] methodAndUrlArr = methodAndUrl.split(",");
            SysInterface sysInterface = new SysInterface();
            sysInterface.setInterfaceMethod(methodAndUrlArr[0]);
            sysInterface.setInterfaceUrl(methodAndUrlArr[1]);
            sysInterface.setInterfaceName(methodAndUrlArr[2]);
            addInterfaceList.add(sysInterface);
        }

        for (SysInterface sysInterface : databaseInterfaceList) {
            String interfaceKey = sysInterface.getInterfaceMethod() + "," + sysInterface.getInterfaceUrl() + "," + sysInterface.getInterfaceName();
            if(deleteInterfaceSet.contains(interfaceKey)) {
                deleteInterfaceList.add(sysInterface.getId());
            }
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 4.更新
            saveBatch(addInterfaceList);
            removeBatchByIds(deleteInterfaceList);

            // 5.同步角色接口和Redis数据 todo


        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }
}





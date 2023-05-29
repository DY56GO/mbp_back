package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.RoleSysInterfaceMapper;
import com.yingwu.project.model.dto.role.RoleSysInterfaceUpdateRequest;
import com.yingwu.project.model.entity.RoleSysInterface;
import com.yingwu.project.service.RoleSysInterfaceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.List;

/**
* @author Dy56
* @description 针对表【role_sys_interface】的数据库操作Service实现
*/
@Service
public class RoleSysInterfaceServiceImpl extends ServiceImpl<RoleSysInterfaceMapper, RoleSysInterface> implements RoleSysInterfaceService {

    /**
     * 更新角色系统接口
     * 
     * @param roleSysInterfaceUpdateRequest
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean updateRoleSysInterface(RoleSysInterfaceUpdateRequest roleSysInterfaceUpdateRequest) {
        // 校验
        if (roleSysInterfaceUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        Long roleId = roleSysInterfaceUpdateRequest.getId();
        List<Long> addSysInterfaceList = roleSysInterfaceUpdateRequest.getAddSysInterfaceList();
        List<Long> deleteSysInterfaceList = roleSysInterfaceUpdateRequest.getDeleteSysInterfaceList();

        if (roleId == null || addSysInterfaceList == null || deleteSysInterfaceList == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }

        // 组装新增角色系统接口列表和删除角色系统接口列表
        List<RoleSysInterface> addRoleSysInterfaceList = new ArrayList<>();
        List<RoleSysInterface> deleteRoleSysInterfaceList = new ArrayList<>();

        // 角色新增系统接口列表
        for (Long menuId : roleSysInterfaceUpdateRequest.getAddSysInterfaceList()) {
            RoleSysInterface roleSysInterface = new RoleSysInterface();
            roleSysInterface.setRoleId(roleId);
            roleSysInterface.setInterfaceId(menuId);
            addRoleSysInterfaceList.add(roleSysInterface);
        }

        // 角色删除系统接口列表
        for (Long menuId : roleSysInterfaceUpdateRequest.getDeleteSysInterfaceList()) {
            RoleSysInterface roleSysInterface = new RoleSysInterface();
            roleSysInterface.setRoleId(roleId);
            roleSysInterface.setInterfaceId(menuId);
            deleteRoleSysInterfaceList.add(roleSysInterface);
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 批量新增
            saveBatch(addRoleSysInterfaceList, 300);

            // 批量删除
            int batchSize = 0;
            List<RoleSysInterface> deleteRoleSysInterfaceBatch = new ArrayList<>();
            for (RoleSysInterface roleSysInterface : deleteRoleSysInterfaceList) {
                batchSize ++;
                deleteRoleSysInterfaceBatch.add(roleSysInterface);
                if (batchSize == 300 || batchSize == deleteRoleSysInterfaceList.size()) {
                    getBaseMapper().removeBatch(deleteRoleSysInterfaceBatch);
                    batchSize = 0;
                    deleteRoleSysInterfaceBatch.clear();
                }
            }
        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }
}





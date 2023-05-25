package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.UserRoleMapper;
import com.yingwu.project.model.dto.user.UserRoleUpdateRequest;
import com.yingwu.project.model.entity.UserRole;
import com.yingwu.project.service.UserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Dy56
 * @description 针对表【userRole】的数据库操作Service实现
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

    @Resource
    private UserRoleMapper userRoleMapper;

    /**
     * 更新用户角色
     *
     * @param userRoleUpdateRequest
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean updateUserRole(UserRoleUpdateRequest userRoleUpdateRequest) {
        // 校验
        if (userRoleUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        Long userId = userRoleUpdateRequest.getId();
        List<Long> addRoleList = userRoleUpdateRequest.getAddRoleList();
        List<Long> deleteRoleList = userRoleUpdateRequest.getDeleteRoleList();

        if (userId == null || addRoleList == null || deleteRoleList == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }

        // 组装新增用户角色列表和删除用户角色列表
        List<UserRole> addUserRoleList = new ArrayList<>();
        List<UserRole> deleteUserRoleList = new ArrayList<>();

        // 用户新增角色列表
        for (Long roleId : userRoleUpdateRequest.getAddRoleList()) {
            UserRole userRole = new UserRole();
            userRole.setUserId(userId);
            userRole.setRoleId(roleId);
            addUserRoleList.add(userRole);
        }

        // 用户删除角色列表
        for (Long roleId : userRoleUpdateRequest.getDeleteRoleList()) {
            UserRole userRole = new UserRole();
            userRole.setUserId(userId);
            userRole.setRoleId(roleId);
            deleteUserRoleList.add(userRole);
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 批量更新
            saveBatch(addUserRoleList, 300);

            // 批量删除
            int batchSize = 0;
            List<UserRole> deleteUserRoleBatch = new ArrayList<>();
            for (UserRole userRole : deleteUserRoleList) {
                batchSize++;
                deleteUserRoleBatch.add(userRole);
                if (batchSize == 300 || batchSize == deleteUserRoleList.size()) {
                    userRoleMapper.removeBatch(deleteUserRoleBatch);
                    batchSize = 0;
                    deleteUserRoleBatch.clear();
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





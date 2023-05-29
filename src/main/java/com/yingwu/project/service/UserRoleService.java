package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.dto.user.UserRoleUpdateRequest;
import com.yingwu.project.model.entity.UserRole;

/**
 * 用户角色服务
 *
 * @author Dy56
 */
public interface UserRoleService extends IService<UserRole> {

    /**
     * 更新用户角色
     *
     * @param userRoleUpdateRequest
     * @return
     */
    boolean updateUserRole(UserRoleUpdateRequest userRoleUpdateRequest);

}

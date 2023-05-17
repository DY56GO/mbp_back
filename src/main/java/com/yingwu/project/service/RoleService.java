package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.Role;

/**
 * 角色服务
 *
 * @author Dy56
 */
public interface RoleService extends IService<Role> {

    /**
     * 校验
     *
     * @param role
     */
    void validRole(Role role);
}

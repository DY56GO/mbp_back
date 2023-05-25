package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.model.vo.MenuOptionVO;

import java.util.List;

/**
 * 角色服务
 *
 * @author Dy56
 */
public interface RoleService extends IService<Role> {

    /**
     * 角色信息校验
     *
     * @param role
     */
    void validRoleInfo(Role role);

    /**
     * 获取角色菜单通过角色id
     *
     * @param roleId
     * @return
     */
    List<MenuOptionVO> getRoleMenuByRoleId(Long roleId);

}

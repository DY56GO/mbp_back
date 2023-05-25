package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.dto.role.RoleMenuUpdateRequest;
import com.yingwu.project.model.entity.RoleMenu;

/**
 * 角色菜单服务
 *
* @author Dy56
*/
public interface RoleMenuService extends IService<RoleMenu> {

    /**
     * 更新角色菜单
     *
     * @param roleMenuUpdateRequest
     * @return
     */
    boolean updateRoleMenu(RoleMenuUpdateRequest roleMenuUpdateRequest);

}

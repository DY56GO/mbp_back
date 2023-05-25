package com.yingwu.project.model.dto.role;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 角色菜单更新请求
 *
 * @author Dy56
 */
@Data
public class RoleMenuUpdateRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 新增菜单列表
     */
    private List<Long> addMenuList;

    /**
     * 删除菜单列表
     */
    private List<Long> deleteMenuList;

    private static final long serialVersionUID = 1L;

}
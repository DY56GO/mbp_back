package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色菜单视图
 *
 * @author Dy56
 */
@Data
public class RoleMenuVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 菜单标题
     */
    private String menuTitle;

    private static final long serialVersionUID = 1L;

}
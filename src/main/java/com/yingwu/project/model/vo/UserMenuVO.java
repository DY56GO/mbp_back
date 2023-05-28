package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户菜单视图
 *
 * @author Dy56
 */
@Data
public class UserMenuVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 父id
     */
    private Long parentId;

    /**
     * 菜单标题
     */
    private String menuTitle;

    /**
     * 菜单图标
     */
    private String menuIcon;

    /**
     * 路由path
     */
    private String routePath;

    /**
     * 组件名称
     */
    private String componentName;

    /**
     * 组件路径
     */
    private String componentPath;

    /**
     * 重定向
     */
    private String redirect;

    /**
     * 描述
     */
    private String description;

    /**
     * 菜单排序
     */
    private Double menuSort;

    private static final long serialVersionUID = 1L;

}
package com.yingwu.project.model.dto.menu;

import lombok.Data;

import java.io.Serializable;

/**
 * 菜单创建请求
 *
 * @author Dy56
 */
@Data
public class MenuAddRequest implements Serializable {

    /**
     * 父id
     */
    private Long parentId;

    /**
     * 菜单名称
     */
    private String menuTitle;

    /**
     * 菜单图标
     */
    private String menuIcon;

    /**
     * 路由url
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
     * 是否隐藏（0：否；1：是）
     */
    private Integer hidden;

    /**
     * 菜单排序
     */
    private Double menuSort;

    private static final long serialVersionUID = 1L;

}
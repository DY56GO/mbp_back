package com.yingwu.project.model.dto.menu;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;

/**
 * 菜单更新请求
 *
 * @author Dy56
 */
@Data
public class MenuUpdateRequest implements Serializable {

    /**
     * id
     */
    private Integer id;

    /**
     * 父id
     */
    private Integer parentId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单图标
     */
    private String menuIcon;

    /**
     * 路由url
     */
    private String routeUrl;

    /**
     * 组件名称
     */
    private String componentName;

    /**
     * 组件路径
     */
    private String componentPath;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否隐藏（0：否；1：是）
     */
    private Integer isHidden;

    /**
     * 菜单排序
     */
    private Double menuSort;

    private static final long serialVersionUID = 1L;
}
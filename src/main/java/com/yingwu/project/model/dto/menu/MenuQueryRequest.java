package com.yingwu.project.model.dto.menu;

import com.yingwu.project.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 菜单查询请求
 *
 * @author Dy56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MenuQueryRequest extends PageRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 父id
     */
    private Long parentId;

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
    private Integer hidden;

    /**
     * 菜单排序
     */
    private Double menuSort;

    private static final long serialVersionUID = 1L;

}
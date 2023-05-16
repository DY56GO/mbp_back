package com.yingwu.project.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;

/**
 * 菜单
 *
 * @TableName menu
 */
@TableName(value ="menu")
@Data
public class Menu implements Serializable {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
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
    private Integer isHidden;

    /**
     * 菜单排序
     */
    private Double menuSort;

    /**
     * 是否删除
     */
    @TableLogic
    private Integer isDelete;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
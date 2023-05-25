package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 菜单选项视图
 *
 * @author Dy56
 */
@Data
public class MenuOptionVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 菜单名称
     */
    private String menuName;

    private static final long serialVersionUID = 1L;

}
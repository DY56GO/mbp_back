package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色选项视图
 *
 * @author Dy56
 */
@Data
public class RoleOptionVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 角色标识
     */
    private String roleIdentity;

    private static final long serialVersionUID = 1L;

}
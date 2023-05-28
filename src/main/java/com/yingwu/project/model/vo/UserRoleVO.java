package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户角色视图
 *
 * @author Dy56
 */
@Data
public class UserRoleVO implements Serializable {

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
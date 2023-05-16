package com.yingwu.project.model.dto.Role;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色创建请求
 *
 * @author Dy56
 */
@Data
public class RoleAddRequest implements Serializable {

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色标识
     */
    private String roleIdentity;

    /**
     * 是否启用（（0：否；1：是））
     */
    private Integer isUsing;

    /**
     * 描述
     */
    private String description;

}
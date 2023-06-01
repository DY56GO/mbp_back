package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 接口角色视图
 *
 * @author Dy56
 */
@Data
public class SysInterfaceRoleVO implements Serializable {

    /**
     * 接口方法
     */
    private String interfaceMethod;

    /**
     * 接口url
     */
    private String interfaceUrl;

    /**
     * 角色标识
     */
    private String roleIdentity;

    private static final long serialVersionUID = 1L;

}
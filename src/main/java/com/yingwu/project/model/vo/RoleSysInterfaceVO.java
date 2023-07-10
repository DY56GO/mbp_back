package com.yingwu.project.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色系统接口视图
 *
 * @author Dy56
 */
@Data
public class RoleSysInterfaceVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 系统接口名称
     */
    private String interfaceName;

    /**
     * 系统接口url
     */
    private String interfaceUrl;

    private static final long serialVersionUID = 1L;

}
package com.yingwu.project.model.dto.sysinterface;

import com.yingwu.project.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 系统接口查询请求
 *
 * @author Dy56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysInterfaceQueryRequest extends PageRequest implements Serializable {

    /**
     * 接口名称
     */
    private String interfaceName;

    /**
     * 接口方法
     */
    private String interfaceMethod;

    /**
     * 接口url
     */
    private String interfaceUrl;

    /**
     * 是否启用（0：否；1：是）
     */
    private Integer usingStart;

    private static final long serialVersionUID = 1L;

}
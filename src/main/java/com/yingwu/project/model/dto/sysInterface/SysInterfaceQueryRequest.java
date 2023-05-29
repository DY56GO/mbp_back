package com.yingwu.project.model.dto.sysInterface;

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
     * 接口name
     */
    private String interfaceName;

    private static final long serialVersionUID = 1L;

}
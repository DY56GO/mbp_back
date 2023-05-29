package com.yingwu.project.model.dto.sysInterface;

import lombok.Data;

import java.io.Serializable;

/**
 * 系统接口更新请求
 *
 * @author Dy56
 */
@Data
public class SysInterfaceUpdateRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 是否启用（（0：否；1：是））
     */
    private Integer usingStart;

    private static final long serialVersionUID = 1L;

}
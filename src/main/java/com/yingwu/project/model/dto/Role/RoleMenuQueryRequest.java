package com.yingwu.project.model.dto.role;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色查询请求
 *
 * @author Dy56
 */
@Data
public class RoleMenuQueryRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    private static final long serialVersionUID = 1L;

}
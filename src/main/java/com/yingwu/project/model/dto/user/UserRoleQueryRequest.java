package com.yingwu.project.model.dto.user;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户角色查询请求
 *
 * @author Dy56
 */
@Data
public class UserRoleQueryRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    private static final long serialVersionUID = 1L;

}
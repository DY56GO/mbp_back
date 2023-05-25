package com.yingwu.project.model.dto.user;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 用户角色更新请求
 *
 * @author Dy56
 */
@Data
public class UserRoleUpdateRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 新增角色列表
     */
    private List<Long> addRoleList;

    /**
     * 删除角色列表
     */
    private List<Long> deleteRoleList;

    private static final long serialVersionUID = 1L;

}
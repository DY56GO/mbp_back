package com.yingwu.project.model.dto.UserGroup;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户组创建请求
 *
 * @author Dy56
 */
@Data
public class UserGroupAddRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 用户组名称
     */
    private String groupName;

    /**
     * 父id
     */
    private Integer parentId;

    /**
     * 描述
     */
    private String description;

    /**
     * 用户组排序
     */
    private Double groupSort;

    private static final long serialVersionUID = 1L;

}
package com.yingwu.project.model.dto.UserGroup;

import com.yingwu.project.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 用户组查询请求
 *
 * @author Dy56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UserGroupQueryRequest extends PageRequest implements Serializable {

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
     * 是否启用（0：否；1：是）
     */
    private Integer usingStart;

    /**
     * 用户组排序
     */
    private Double groupSort;

    private static final long serialVersionUID = 1L;

}
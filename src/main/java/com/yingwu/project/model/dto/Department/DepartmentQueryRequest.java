package com.yingwu.project.model.dto.Department;

import com.yingwu.project.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 部门查询请求
 *
 * @author Dy56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class DepartmentQueryRequest extends PageRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 部门名称
     */
    private String departmentName;

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
     * 部门排序
     */
    private Double departmentSort;

    private static final long serialVersionUID = 1L;

}
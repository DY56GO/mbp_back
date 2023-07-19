package com.yingwu.project.model.dto.Department;

import lombok.Data;

import java.io.Serializable;

/**
 * 部门创建请求
 *
 * @author Dy56
 */
@Data
public class DepartmentAddRequest implements Serializable {

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
     * 部门排序
     */
    private Double departmentSort;

    private static final long serialVersionUID = 1L;

}
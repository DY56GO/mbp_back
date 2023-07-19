package com.yingwu.project.model.dto.Department;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 部门更新请求
 *
 * @author Dy56
 */
@Data
public class DepartmentUpdateRequest implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 部门名称
     */
    private String departmentName;

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
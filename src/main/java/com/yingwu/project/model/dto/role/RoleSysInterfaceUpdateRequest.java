package com.yingwu.project.model.dto.role;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 角色系统接口更新请求
 *
 * @author Dy56
 */
@Data
public class RoleSysInterfaceUpdateRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 新增系统接口列表
     */
    private List<Long> addSysInterfaceList;

    /**
     * 删除系统接口列表
     */
    private List<Long> deleteSysInterfaceList;

    private static final long serialVersionUID = 1L;

}
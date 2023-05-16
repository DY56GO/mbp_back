package com.yingwu.project.model.dto.Role;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色更新请求
 *
 * @author Dy56
 */
@Data
public class RoleUpdateRequest implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色标识
     */
    private String roleIdentity;

    /**
     * 是否启用（（0：否；1：是））
     */
    private Integer isUsing;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否删除（0：否；1：是）
     */
    private Integer isDelete;
}
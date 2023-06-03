package com.yingwu.project.model.dto.role;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.yingwu.project.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色查询请求
 *
 * @author Dy56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class RoleQueryRequest extends PageRequest implements Serializable {

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
    private Integer usingStart;

    /**
     * 描述
     */
    private String description;

    /**
     * 创建时间
     */
    private Date gmtCreate;

    private static final long serialVersionUID = 1L;

}
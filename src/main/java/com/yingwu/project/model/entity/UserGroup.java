package com.yingwu.project.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户组
 *
 * @author Dy56
 * @TableName UserGroup
 */
@TableName(value = "user_group")
@Data
public class UserGroup implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 用户组名称
     */
    private String groupName;

    /**
     * 父id
     */
    private Long parentId;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否启用（0：否；1：是）
     */
    @TableField(value = "is_using")
    private Integer usingStart;

    /**
     * 用户组排序
     */
    private Double groupSort;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date gmtCreate;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date gmtModified;

    /**
     * 是否删除（0：否；1：是）
     */
    @TableLogic
    @TableField(value = "is_delete")
    private Integer del;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
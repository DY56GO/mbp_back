package com.yingwu.project.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统接口
 *
 * @author Dy56
 * @TableName sys_interface
 */
@TableName(value = "sys_interface")
@Data
public class SysInterface implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 接口名称
     */
    private String interfaceName;

    /**
     * 接口方法
     */
    private String interfaceMethod;

    /**
     * 接口url
     */
    private String interfaceUrl;

    /**
     * 是否启用（0：否；1：是）
     */
    @TableField(value = "is_using")
    private Integer usingStart;

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
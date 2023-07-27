package com.yingwu.project.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统请求日志
 *
 * @author Dy56
 * @TableName sys_request_log
 */
@TableName(value = "sys_request_log")
@Data
public class SysRequestLog implements Serializable {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 请求Url
     */
    private String requestUrl;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 请求参数
     */
    private String requestParm;

    /**
     * 请求结果（0：失败，1：成功）
     */
    private Integer requestResult;

    /**
     * 执行时间
     */
    private String exeTime;

    /**
     * 失败信息
     */
    private String errorMessage;

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

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
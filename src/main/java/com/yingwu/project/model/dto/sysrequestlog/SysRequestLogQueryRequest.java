package com.yingwu.project.model.dto.sysrequestlog;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yingwu.project.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统登录日志查询请求
 *
 * @author Dy56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysRequestLogQueryRequest extends PageRequest implements Serializable {

    /**
     * id
     */
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

    private static final long serialVersionUID = 1L;

}
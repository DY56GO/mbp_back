package com.yingwu.project.model.dto.user;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户登录请求
 *
 * @author yupi
 */
@Data
public class UserLoginRequest implements Serializable {

    /**
     * 用户账号
     */
    private String userAccount;

    /**
     * 用户密码
     */
    private String userPassword;

    /**
     * 验证码id
     */
    private Long captchaId;

    /**
     * 验证码
     */
    private String captcha;

    private static final long serialVersionUID = 3191241716373120793L;

}

package com.yingwu.project.model.dto.captcha;

import lombok.Data;

import java.io.Serializable;

/**
 * 验证码请求
 *
 * @author Dy56
 */
@Data
public class CaptchaRequest implements Serializable {

    /**
     * 验证码id
     */
    private Long captchaId;

    private static final long serialVersionUID = 1L;

}
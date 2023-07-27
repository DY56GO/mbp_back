package com.yingwu.project.constant;

import java.util.ArrayList;
import java.util.List;

/**
 * 系统常量
 *
 * @author Dy56
 */
public interface SysConstant {

    /**
     * 拦截器白名单
     */
    List<String> INTERCEPTOR_WHITELIST = new ArrayList<String>() {{
        add("/user/captchaId");
        add("/user/captcha");
        add("/user/login");
        add("/user/register");
        add("/error");
        add("/swagger-resources/**");
        add("/webjars/**");
        add("/v2/**");
        add("/v3/**");
        add("/swagger-ui.html/**");
        add("/doc.html");
    }};

    String RESOURCES_PATH = "src/main/resources/";

    long MAX_PAGE_SIZE = 1000;

}

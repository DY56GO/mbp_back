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

    /**
     * 系统接口鉴权数据在Redis中的key
     */
    String SYS_INTERFACE_AUTH_KEY_REDIS = "SysInterfaceAuth";

}

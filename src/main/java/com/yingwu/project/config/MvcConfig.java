package com.yingwu.project.config;

import com.yingwu.project.interceptor.LoginInterceptor;
import com.yingwu.project.interceptor.SysInterfaceAuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

import static com.yingwu.project.constant.SysConstant.INTERCEPTOR_WHITELIST;

/**
 * 拦截器配置
 *
 * @author Dy56
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Resource
    private PowerConfig powerConfig;

    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private LoginInterceptor loginInterceptor;

    @Resource
    private SysInterfaceAuthInterceptor sysInterfaceAuthInterceptor;

    public void addInterceptors(InterceptorRegistry registry) {
        // 增加登录拦截器，并对不必要的请求路径排除拦截
        registry.addInterceptor(loginInterceptor)
                .excludePathPatterns(INTERCEPTOR_WHITELIST)
                .order(1);
        if (powerConfig.isInterfaceAuth()) {
            // 增加系统接口拦截器，并对不必要的请求路径排除拦截
            registry.addInterceptor(sysInterfaceAuthInterceptor)
                    .excludePathPatterns(INTERCEPTOR_WHITELIST)
                    .order(2);
        }
    }

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html", "doc.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");

    }
}
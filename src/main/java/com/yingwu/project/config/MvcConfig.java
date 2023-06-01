package com.yingwu.project.config;

import com.yingwu.project.interceptor.LoginInterceptor;
import com.yingwu.project.interceptor.SysInterfaceAuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import javax.annotation.Resource;

/**
 * 拦截器配置
 *
 * @author Dy56
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Resource
    private RedisTemplate redisTemplate;

    public void addInterceptors(InterceptorRegistry registry) {
        // 增加登录拦截器，并对不必要的请求路径排除拦截
        registry.addInterceptor(new LoginInterceptor(redisTemplate))
                .excludePathPatterns(
                        "/user/login",
                        "/user/register",
                        "/error"
                )
                .excludePathPatterns(
                        "/swagger-resources/**",
                        "/webjars/**",
                        "/v2/**",
                        "/v3/**",
                        "/swagger-ui.html/**",
                        "/doc.html"
                )
                .order(1);
        // 增加系统接口拦截器，并对不必要的请求路径排除拦截
        registry.addInterceptor(new SysInterfaceAuthInterceptor(redisTemplate))
                .excludePathPatterns(
                        "/user/login",
                        "/user/register",
                        "/error"
                )
                .excludePathPatterns(
                        "/swagger-resources/**",
                        "/webjars/**",
                        "/v2/**",
                        "/v3/**",
                        "/swagger-ui.html/**",
                        "/doc.html"
                )
                .order(2);
    }

    
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html", "doc.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");

    }
}
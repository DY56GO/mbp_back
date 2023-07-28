package com.yingwu.project.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 限流自定义注解
 *
 * @author Dy56
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RateLimiter {
    int permitsPerSecond();    // 每秒允许通过的请求数

    int capacity();            // 桶的容量
}
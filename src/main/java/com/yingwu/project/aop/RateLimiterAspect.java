package com.yingwu.project.aop;

import com.yingwu.project.annotation.RateLimiter;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.redisson.api.RRateLimiter;
import org.redisson.api.RateIntervalUnit;
import org.redisson.api.RateType;
import org.redisson.api.RedissonClient;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 限流AOP
 *
 * @author Dy56
 */
@Aspect
@Component
@Order(4)
public class RateLimiterAspect {

    private final RedissonClient redissonClient;

    public RateLimiterAspect(RedissonClient redissonClient) {
        this.redissonClient = redissonClient;
    }

    @Around("@annotation(com.yingwu.project.annotation.RateLimiter)")
    public Object limit(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        String key = "ratelimit:" + methodName;

        RRateLimiter rRateLimiter = redissonClient.getRateLimiter(key);

        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        RateLimiter rateLimiter = method.getAnnotation(RateLimiter.class);

        int permitsPerSecond = rateLimiter.permitsPerSecond();
        int permits = rateLimiter.permits();

        rRateLimiter.trySetRate(RateType.OVERALL, permitsPerSecond, 1, RateIntervalUnit.SECONDS);
        if (rRateLimiter.tryAcquire(permits)) {
            return joinPoint.proceed();
        } else {
            throw new BusinessException(ErrorCode.OPERATION_ERROR, "操作频繁");
        }
    }
}
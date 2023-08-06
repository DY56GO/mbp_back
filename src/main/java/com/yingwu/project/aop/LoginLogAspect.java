package com.yingwu.project.aop;

import com.google.gson.Gson;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.config.PowerConfig;
import com.yingwu.project.model.entity.SysLoginLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static com.yingwu.project.constant.RabbitMQConstant.LONGIN_LOG_QUEUE;
import static com.yingwu.project.util.Utils.buildTokenRedisKey;
import static com.yingwu.project.util.Utils.getUserIdByUserKey;

/**
 * 登录日志AOP
 *
 * @author Dy56
 */
@Aspect
@Component
@Order(3)
@ConditionalOnProperty(prefix = "spring.rabbitmq", name = "enabled", havingValue = "true")
public class LoginLogAspect {

    @Resource
    private PowerConfig powerConfig;

    @Resource
    private RabbitTemplate rabbitTemplate;

    @Resource
    private RedisTemplate redisTemplate;

    public static Gson gson = null;

    static {
        gson = new Gson();
    }

    /**
     * 登录成功日志消息推送
     *
     * @param joinPoint
     * @param result
     */
    @AfterReturning(pointcut = "@annotation(com.yingwu.project.annotation.LoginLog)", returning = "result")
    public void afterReturning(JoinPoint joinPoint, Object result) {
        if (powerConfig.isLoginLogRecords()) {
            // 构建登录日志
            SysLoginLog sysLoginLog = buildSysLoginLog(result, null);

            // 写入登录日志消息队列
            rabbitTemplate.convertAndSend(LONGIN_LOG_QUEUE, gson.toJson(sysLoginLog));
        }
    }

    /**
     * 登录失败日志消息推送
     *
     * @param joinPoint
     * @param exception
     */
    @AfterThrowing(pointcut = "@annotation(com.yingwu.project.annotation.LoginLog)", throwing = "exception")
    public void afterThrowing(JoinPoint joinPoint, Exception exception) {
        if (powerConfig.isLoginLogRecords()) {
            // 构建登录日志
            SysLoginLog sysLoginLog = buildSysLoginLog(null, exception);

            // 写入登录日志消息队列
            rabbitTemplate.convertAndSend(LONGIN_LOG_QUEUE, gson.toJson(sysLoginLog));
        }
    }

    /**
     * 构建登录日志
     *
     * @param result
     * @param exception
     * @return
     */
    private SysLoginLog buildSysLoginLog(Object result, Exception exception) {
        Long userId = -1L;
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpServletRequest = ((ServletRequestAttributes) requestAttributes).getRequest();

        // 从Redis中获取用户id
        if (result != null) {
            BaseResponse response = (BaseResponse) result;
            String token = String.valueOf(response.getData());
            String tokenKey = buildTokenRedisKey(token);
            String userKey = String.valueOf(redisTemplate.opsForValue().get(tokenKey));
            userId = Long.valueOf(getUserIdByUserKey(userKey));
        }

        // 设置RabbitMQ队列信息
        SysLoginLog sysLoginLog = new SysLoginLog();
        sysLoginLog.setRequestIp(httpServletRequest.getRemoteAddr());
        sysLoginLog.setUserId(userId);

        if (exception != null) {
            sysLoginLog.setRequestResult(0);
            sysLoginLog.setErrorMessage(String.valueOf(exception.getMessage()));
        }

        return sysLoginLog;
    }

}
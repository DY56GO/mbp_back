package com.yingwu.project.aop;

import com.google.gson.Gson;
import com.yingwu.project.config.PowerConfig;
import com.yingwu.project.model.entity.SysRequestLog;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static com.yingwu.project.constant.RabbitMQConstant.REQUEST_LOG_QUEUE;
import static com.yingwu.project.util.Utils.buildTokenRedisKey;
import static com.yingwu.project.util.Utils.getUserIdByUserKey;

/**
 * 请求日志AOP
 *
 * @author Dy56
 */
@Aspect
@Component
@Order(2)
public class RequestLogAspect {

    @Resource
    private PowerConfig powerConfig;

    @Resource
    private RabbitTemplate rabbitTemplate;

    @Resource
    private RedisTemplate redisTemplate;

    public static Gson gson = null;
    static  {
        gson = new Gson();
    }

    @Around("execution(* com.yingwu.project.controller.*.*(..))")
    public Object requestLog(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        if (powerConfig.isLogRecords()) {
            RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
            HttpServletRequest httpServletRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
            String token = httpServletRequest.getHeader("token");

            // Token不为空是正常的请求，为空是登录请求
            if (token != null) {
                // 计时
                StopWatch stopWatch = new StopWatch();
                stopWatch.start();

                // 获取请求路径
                String url = httpServletRequest.getRequestURI();

                // 获取用户id
                String tokenKey = buildTokenRedisKey(token);
                String userKey = String.valueOf(redisTemplate.opsForValue().get(tokenKey));
                Long userId = Long.valueOf(getUserIdByUserKey(userKey));

                // 获取请求参数
                Object[] args = point.getArgs();
                String reqParam = "[" + StringUtils.join(args, ", ") + "]";

                // 执行原方法
                result = point.proceed();

                // 获取响应时间
                stopWatch.stop();
                long totalTimeMillis = stopWatch.getTotalTimeMillis();

                SysRequestLog sysRequestLog = new SysRequestLog();
                sysRequestLog.setRequestUrl(url);
                sysRequestLog.setUserId(userId);
                sysRequestLog.setRequestParm(reqParam);
                sysRequestLog.setExeTime(totalTimeMillis + "ms");

                rabbitTemplate.convertAndSend(REQUEST_LOG_QUEUE, gson.toJson(sysRequestLog));
            } else {
                result = point.proceed();
            }
        } else {
            result = point.proceed();
        }
        return result;
    }

    @AfterThrowing(pointcut = "execution(* com.yingwu.project.controller.*.*(..))", throwing = "exception")
    public void afterThrowingAdvice(JoinPoint joinPoint, Exception exception) {
        if (powerConfig.isLogRecords()) {
            RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
            HttpServletRequest httpServletRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
            String token = httpServletRequest.getHeader("token");

            // Token不为空是正常的请求，为空是登录请求
            if (token != null) {
                // 获取请求路径
                String url = httpServletRequest.getRequestURI();

                // 获取用户id
                String tokenKey = buildTokenRedisKey(token);
                String userKey = String.valueOf(redisTemplate.opsForValue().get(tokenKey));
                Long userId = Long.valueOf(getUserIdByUserKey(userKey));

                // 获取请求参数
                Object[] args = joinPoint.getArgs();
                String reqParam = "[" + StringUtils.join(args, ", ") + "]";

                SysRequestLog sysRequestLog = new SysRequestLog();
                sysRequestLog.setRequestUrl(url);
                sysRequestLog.setUserId(userId);
                sysRequestLog.setRequestParm(reqParam);
                sysRequestLog.setRequestResult(0);
                sysRequestLog.setErrorMessage(exception.getMessage());

                rabbitTemplate.convertAndSend(REQUEST_LOG_QUEUE, gson.toJson(sysRequestLog));
            }
        }
    }

}

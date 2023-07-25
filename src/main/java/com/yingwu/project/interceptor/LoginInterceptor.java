package com.yingwu.project.interceptor;

import com.yingwu.project.common.ErrorCode;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

import static com.yingwu.project.constant.RedisConstant.*;
import static com.yingwu.project.exception.ThrowUtils.throwIf;

/**
 * 登录校验 拦截器
 *
 * @author Dy56
 */
@Configuration
public class LoginInterceptor implements HandlerInterceptor {

    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 执行拦截
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 第一次是OPTIONS请求，这个请求不会携带参数，所以获取不到数据
        // 第二次才是GET/POST，携带参数
        // options直接放行
        String options = "OPTIONS";
        if (options.equals(request.getMethod())) {
            return true;
        }

        // 1. 获取请求头中的token
        String token = request.getHeader("token");
        String tokenKey = TOKEN_KEY_REDIS + token;

        // 2. 判断是否登录
        throwIf(token == null || !redisTemplate.hasKey(tokenKey),ErrorCode.NOT_LOGIN_ERROR);

        // 3.更新用户id和token的有效时间 (只要用户在这段时间内用户操作，那么就不会过期)
        String userKey = (String) redisTemplate.opsForValue().get(tokenKey);
        redisTemplate.expire(tokenKey, TOKEN_EXPIRATION_TIME, TimeUnit.MINUTES);
        redisTemplate.expire(userKey, USER_ID_EXPIRATION_TIME, TimeUnit.MINUTES);

        // 4.放行
        return true;
    }
}

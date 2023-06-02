package com.yingwu.project.interceptor;

import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

import static com.yingwu.project.constant.UserConstant.USER_EXPIRATION_TIME;

/**
 * 登录校验 拦截器
 *
 * @author Dy56
 */
public class LoginInterceptor implements HandlerInterceptor {

    private RedisTemplate redisTemplate;

    public LoginInterceptor(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

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
        String tokenKey = request.getHeader("token");

        // 2. 判断是否登录
        if (tokenKey == null || !redisTemplate.hasKey(tokenKey)) {
            throw new BusinessException(ErrorCode.NOT_LOGIN_ERROR);
        }

        // 3.更新用户token的有效时间 (只要用户在这段时间内用户操作，那么就不会过期)
        redisTemplate.expire(tokenKey, USER_EXPIRATION_TIME, TimeUnit.MINUTES);

        // 4.放行
        return true;
    }
}

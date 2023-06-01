package com.yingwu.project.interceptor;

import com.yingwu.project.model.vo.UserRoleVO;
import lombok.val;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

import static com.yingwu.project.constant.SysConstant.SYS_INTERFACE_AUTH_KEY_REDIS;

/**
 * 系统接口校验 拦截器
 *
 * @author Dy56
 */
public class SysInterfaceAuthInterceptor implements HandlerInterceptor {

    private RedisTemplate redisTemplate;

    public SysInterfaceAuthInterceptor(RedisTemplate redisTemplate) {
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

        // 1.获取系统鉴权数据
        Map sysInterfaceAuthMap = redisTemplate.boundHashOps(SYS_INTERFACE_AUTH_KEY_REDIS).entries();

        // 2.获取用户角色信息
        String tokenKey = request.getHeader("token");
        Map userInfoMap = redisTemplate.boundHashOps(tokenKey).entries();
        List<UserRoleVO> userRoleList = (List<UserRoleVO>) userInfoMap.get("userRoleList");

        // 3.获取访问接口信息
        String interfaceMethod = request.getMethod();
        String contextPath = request.getContextPath();
        String interfaceUrl = request.getRequestURI();
        interfaceUrl = interfaceUrl.replaceFirst(contextPath, "");
        String interfaceKey = interfaceMethod + "," + interfaceUrl;

        // 判断
        int size = userRoleList.size();


        // 4.放行
        return true;
    }
}

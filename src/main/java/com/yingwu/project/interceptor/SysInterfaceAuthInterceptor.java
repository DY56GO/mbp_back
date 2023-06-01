package com.yingwu.project.interceptor;

import cn.hutool.core.bean.BeanUtil;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.vo.UserInfoRedisVO;
import com.yingwu.project.model.vo.UserRoleVO;
import lombok.val;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
        UserInfoRedisVO userInfo = BeanUtil.toBeanIgnoreCase(userInfoMap, UserInfoRedisVO.class, false);
        List<UserRoleVO> userRoleList = userInfo.getUserRoleList();

        // 3.获取访问接口信息
        String interfaceMethod = request.getMethod();
        String contextPath = request.getContextPath();
        String interfaceUrl = request.getRequestURI();
        interfaceUrl = interfaceUrl.replaceFirst(contextPath, "");
        String interfaceKey = interfaceMethod + "," + interfaceUrl;

        // 4.鉴权放行
        if (sysInterfaceAuthMap.containsKey(interfaceKey)) {
            Set<String> sysInterfaceRole = (Set<String>) sysInterfaceAuthMap.get(interfaceKey);
            for (UserRoleVO userRole : userRoleList) {
                // 判断是否包含角色
                if (sysInterfaceRole.contains(userRole.getRoleIdentity())) {
                    return true;
                }
            }
        } else {
            // 系统接口鉴权数据中没有接口
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }

        // 4.未通过
        throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
    }
}

package com.yingwu.project.constant;

/**
 * Redis常量
 *
 * @author Dy56
 */
public interface RedisConstant {

    /**
     * 系统接口鉴权数据在Redis中的key
     */
    String SYS_INTERFACE_AUTH_KEY_REDIS = "sys_interface_auth";

    /**
     * token key前缀
     */
    String TOKEN_KEY_REDIS = "tk:";

    /**
     * token过期时间（分钟）
     */
    long TOKEN_EXPIRATION_TIME = 30;

    /**
     * 用户id key前缀
     */
    String USER_ID_KEY_REDIS = "uid:";

    /**
     * 用户id过期时间（分钟）
     */
    long USER_ID_EXPIRATION_TIME = 30;

    /**
     * 延迟删除时间（秒）
     */
    long DELETE_KEY_TIME = 0;

}

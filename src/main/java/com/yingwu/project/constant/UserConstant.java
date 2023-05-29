package com.yingwu.project.constant;

/**
 * 用户常量
 *
 * @author Dy56
 */
public interface UserConstant {

    /**
     * 用户过期时间
     */
    long USER_EXPIRATION_TIME = 30;

    //  region 校验

    /**
     * 用户账号最小长度
     */
    long USER_ACCOUNT_MIN_LENGTH = 4;

    /**
     * 用户账号最大长度
     */
    long USER_ACCOUNT_MAX_LENGTH = 16;

    /**
     * 用户密码最小长度
     */
    long USER_PASSWORD_MIN_LENGTH = 8;

    /**
     * 用户密码最大长度
     */
    long USER_PASSWORD_MAX_LENGTH = 16;

    // endregion
}

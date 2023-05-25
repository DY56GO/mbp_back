package com.yingwu.project.constant;

import sun.security.util.Length;

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

    long USER_ACCOUNT_MIN_LENGTH = 4;

    long USER_ACCOUNT_MAX_LENGTH = 16;

    long USER_PASSWORD_MIN_LENGTH = 8;

    long USER_PASSWORD_MAX_LENGTH = 16;

    // endregion
}

package com.yingwu.project.model.dto.user;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户更新请求
 *
 * @author Dy56
 */
@Data
public class UserUpdateSelfRequest implements Serializable {

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 用户账号
     */
    private String userAccount;

    /**
     * 用户头像
     */
    private String userAvatar;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 是否启用（（0：否；1：是））
     */
    private Integer usingStart;

    private static final long serialVersionUID = 1L;

}
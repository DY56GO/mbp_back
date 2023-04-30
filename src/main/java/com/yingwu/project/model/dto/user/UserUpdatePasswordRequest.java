package com.yingwu.project.model.dto.user;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户更新密码请求
 *
 * @author Dy56
 */
@Data
public class UserUpdatePasswordRequest implements Serializable {

    /**
     * 旧密码
     */
    private String userOldPassword;

    /**
     * 新密码
     */
    private String userNewPassword;

    /**
     * 新确认密码
     */
    private String newCheckPassword;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
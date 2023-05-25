package com.yingwu.project.model.dto.user;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户密码更新请求
 *
 * @author Dy56
 */
@Data
public class UserPasswordUpdateRequest implements Serializable {

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

    private static final long serialVersionUID = 1L;

}
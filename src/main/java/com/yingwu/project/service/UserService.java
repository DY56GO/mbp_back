package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.dto.user.UserUpdatePasswordRequest;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserVO;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户服务
 *
 * @author Dy56
 */
public interface UserService extends IService<User> {

    /**
     * 用户注册
     *
     * @param user
     * @return 新用户 id
     */
    long userRegister(User user);


    /**
     * 用户注册校验
     *
     * @param user
     */
    void validUserRegister(User user);

    /**
     * 用户登录
     *
     * @param user
     * @return 生成的tonkenKey
     */
    String userLogin(User user, HttpServletRequest request);

    /**
     * 用户登陆校验
     *
     * @param user
     */
    void validUserLogin(User user);

    /**
     * 获取当前登录用户
     *
     * @param request
     * @return
     */
    UserVO getLoginUser(HttpServletRequest request);

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    boolean userLogout(HttpServletRequest request);


    /**
     * 创建用户校验
     *
     * @param user
     */
    void validAddUser(User user);

    /**
     * 用户更新校验
     *
     * @param user
     */
    void validUserUpdate(User user);

    /**
     * 用户更新密码校验
     *
     * @param userUpdatePasswordRequest
     */
    void validUpdateUserPassword(UserUpdatePasswordRequest userUpdatePasswordRequest, Long userId);

    /**
     * 用户Redis数据刷新
     *
     * @param userId 用户Id
     */
    boolean updateRedisUser(Long userId);


    /**
     * 是否为管理员
     *
     * @param request
     * @return
     */
    boolean isAdmin(HttpServletRequest request);


}

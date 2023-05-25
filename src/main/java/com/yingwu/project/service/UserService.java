package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.dto.user.UserPasswordUpdateRequest;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserInfoVO;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户服务
 *
 * @author Dy56
 */
public interface UserService extends IService<User> {

    /**
     * 加密密码
     *
     * @param password
     * @return
     */
    String encryptPassword(String password);

    /**
     * 用户注册
     *
     * @param user
     * @return 新用户 id
     */
    long userRegister(User user);


    /**
     * 用户注册信息校验
     *
     * @param user
     */
    void validUserRegisterInfo(User user);

    /**
     * 用户登录
     *
     * @param user
     * @param request
     * @return 生成的tokenKey
     */
    String userLogin(User user, HttpServletRequest request);

    /**
     * 用户登陆信息校验
     *
     * @param user
     */
    void validUserLoginInfo(User user);

    /**
     * 用户登陆校验
     *
     * @param request
     */
    void validUserLogin(HttpServletRequest request);

    /**
     * 获取当前登录用户
     *
     * @param request
     * @return 用户信息
     */
    UserInfoVO getLoginUser(HttpServletRequest request);

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    boolean userLogout(HttpServletRequest request);

    /**
     * 创建用户信息校验
     *
     * @param user
     */
    void validAddUserInfo(User user);

    /**
     * 用户更新信息校验
     *
     * @param user
     */
    void validUserUpdateInfo(User user);

    /**
     * 用户更新密码信息校验
     *
     * @param userPasswordUpdateRequest
     * @param userId
     */
    void validUpdateUserPasswordInfo(UserPasswordUpdateRequest userPasswordUpdateRequest, Long userId);

    /**
     * 获取用户信息通过用户id
     *
     * @param userId
     * @return 用户信息
     */
    UserInfoVO getUserInfoById(Long userId);

    /**
     * 用户Redis数据刷新
     *
     * @param userId 用户id
     * @return
     */
    boolean updateRedisUser(Long userId);

}

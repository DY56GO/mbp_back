package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.dto.user.UserPasswordUpdateRequest;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserInfoRedisVO;
import com.yingwu.project.model.vo.UserRoleVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
     * 当前登录用户获取信息
     *
     * @param request
     * @return 用户信息
     */
    UserInfoRedisVO getLoginUser(HttpServletRequest request);

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
    void validUserPasswordUpdateInfo(UserPasswordUpdateRequest userPasswordUpdateRequest, Long userId);

    /**
     * 获取用户信息通过用户id
     *
     * @param userId
     * @return 用户信息
     */
    List<UserRoleVO> getUserInfoById(Long userId);

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    boolean deleteUser(Long userId);

    /**
     * 更新用户Redis数据
     *
     * @param userId 用户id
     * @return
     */
    boolean updateRedisUser(Long userId);

    /**
     * 删除用户Redis数据
     *
     * @param userId
     * @param userAccount
     * @return
     */
    boolean deleteRedisUser(Long userId, String userAccount);

}

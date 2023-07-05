package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.user.*;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserInfoFrontVO;
import com.yingwu.project.model.vo.UserInfoListVO;
import com.yingwu.project.model.vo.UserInfoRedisVO;
import com.yingwu.project.model.vo.UserRoleVO;
import com.yingwu.project.service.UserRoleService;
import com.yingwu.project.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.constant.PasswordConstant.SALT;
import static com.yingwu.project.util.Utils.encryptPassword;


/**
 * 用户接口
 *
 * @author Dy56
 */
@CrossOrigin
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private UserRoleService userRoleService;

    // region 登录相关

    /**
     * 用户注册
     *
     * @param userRegisterRequest
     * @return
     */
    @PostMapping(value = "/register", name = "用户注册")
    public BaseResponse<Long> userRegister(@RequestBody UserRegisterRequest userRegisterRequest) {
        // 校验
        if (userRegisterRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtils.copyProperties(userRegisterRequest, user);
        userService.validUserRegisterInfo(user);

        // 注册
        long result = userService.userRegister(user);
        return ResultUtils.success(result);
    }

    /**
     * 用户登录
     *
     * @param userLoginRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/login", name = "用户登录")
    public BaseResponse<String> userLogin(@RequestBody UserLoginRequest userLoginRequest, HttpServletRequest request) {
        // 校验
        if (userLoginRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtils.copyProperties(userLoginRequest, user);
        userService.validUserLoginInfo(user);

        // 登陆 返回token
        String token = userService.userLogin(user, request);
        return ResultUtils.success(token);
    }

    /**
     * 当前登录用户获取信息
     *
     * @param request
     * @return
     */
    @GetMapping(value = "/info", name = "当前登录用户获取信息")
    public BaseResponse<UserInfoFrontVO> getLoginUser(HttpServletRequest request) {
        UserInfoRedisVO userInfoRedisVO = userService.getLoginUser(request);
        UserInfoFrontVO userInfoFrontVO = new UserInfoFrontVO();
        BeanUtils.copyProperties(userInfoRedisVO, userInfoFrontVO);
        return ResultUtils.success(userInfoFrontVO);
    }

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    @PostMapping(value = "/logout", name = "用户注销")
    public BaseResponse<Boolean> userLogout(HttpServletRequest request) {
        boolean result = userService.userLogout(request);
        return ResultUtils.success(result);
    }

    // endregion

    // region 增删改查

    /**
     * 新增用户
     *
     * @param userAddRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/add", name = "新增用户")
    public BaseResponse<Long> addUser(@RequestBody UserAddRequest userAddRequest, HttpServletRequest request) {
        // 校验
        if (userAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtil.copyProperties(userAddRequest, user);
        userService.validAddUserInfo(user);

        // 加密
        user.setUserPassword(DigestUtils.md5DigestAsHex((SALT + user.getUserPassword()).getBytes()));

        // 新增
        boolean result = userService.save(user);
        if (!result) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
        return ResultUtils.success(user.getId());
    }

    /**
     * 删除用户
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/delete", name = "删除用户")
    public BaseResponse<Boolean> deleteUser(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        // 校验
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        // 删除
        boolean result = userService.deleteUser(deleteRequest.getId());

        return ResultUtils.success(result);
    }

    /**
     * 更新用户
     *
     * @param userUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/update", name = "更新用户")
    public BaseResponse<Boolean> updateUser(@RequestBody UserUpdateRequest userUpdateRequest, HttpServletRequest request) {
        // 校验
        if (userUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtil.copyProperties(userUpdateRequest, user);
        userService.validUserUpdateInfo(user);

        if (user.getUserPassword() != null) {
            String password = user.getUserPassword();
            user.setUserPassword(encryptPassword(password));
        }

        // 更新
        boolean result = userService.updateById(user);
        if (result) {
            // Redis数据同步
            userService.updateRedisUser(user.getId());
            // 判断用户是否启用，如果非启用，则删除Redis中的用户，使其下线
            if (user.getUsingStart() == 0) {
                userService.deleteRedisUser(user.getId());
            }
        }
        return ResultUtils.success(result);
    }

    /**
     * 用户更新（仅能更新自己）
     *
     * @param userUpdateSelfRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/updateSelf", name = "用户更新（仅能更新自己）")
    public BaseResponse<Boolean> userUpdateOneself(@RequestBody UserUpdateSelfRequest userUpdateSelfRequest, HttpServletRequest request) {
        // 校验
        UserInfoRedisVO userInfo = userService.getLoginUser(request);
        if (userUpdateSelfRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtil.copyProperties(userUpdateSelfRequest, user);
        user.setId(userInfo.getId());
        userService.validUserUpdateInfo(user);

        // 更新
        boolean result = userService.updateById(user);
        // 更新Redis数据
        userService.updateRedisUser(user.getId());

        return ResultUtils.success(result);
    }

    /**
     * 用户更新密码
     *
     * @param userPasswordUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/updatePassword", name = "用户更新密码")
    public BaseResponse<Boolean> userUpdatePassword(@RequestBody UserPasswordUpdateRequest userPasswordUpdateRequest, HttpServletRequest request) {
        UserInfoRedisVO userInfo = userService.getLoginUser(request);
        Long userId = userInfo.getId();

        // 校验
        userService.validUserPasswordUpdateInfo(userPasswordUpdateRequest, userId);

        // 加密
        User user = new User();
        BeanUtil.copyProperties(userPasswordUpdateRequest, user);
        String userNewPassword = userPasswordUpdateRequest.getUserNewPassword();
        user.setUserPassword(DigestUtils.md5DigestAsHex((SALT + userNewPassword).getBytes()));
        user.setId(userId);

        // 更新
        boolean result = userService.updateById(user);
        return ResultUtils.success(result);
    }

    /**
     * 获取用户列表
     *
     * @param userQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取用户列表")
    public BaseResponse<List<UserInfoListVO>> getUserList(UserQueryRequest userQueryRequest, HttpServletRequest request) {
        User userQuery = new User();
        if (userQueryRequest != null) {
            BeanUtil.copyProperties(userQueryRequest, userQuery);
        }
        String userName = userQuery.getUserName();
        userQuery.setUserName(null);
        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(userName), "user_name", userName);
        List<User> userList = userService.list(queryWrapper);
        List<UserInfoListVO> userInfoList = new ArrayList<>();
        for (User user : userList) {
            UserInfoListVO userInfoListVO = new UserInfoListVO();
            BeanUtils.copyProperties(user, userInfoListVO);
            userInfoList.add(userInfoListVO);
        }


        return ResultUtils.success(userInfoList);
    }

    /**
     * 分页获取用户列表
     *
     * @param userQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取用户列表")
    public BaseResponse<Page<UserInfoListVO>> getUserListByPage(UserQueryRequest userQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        User userQuery = new User();
        if (userQueryRequest != null) {
            BeanUtil.copyProperties(userQueryRequest, userQuery);
            current = userQueryRequest.getCurrent();
            size = userQueryRequest.getPageSize();
        }

        String userName = userQuery.getUserName();
        userQuery.setUserName(null);
        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(userName), "user_name", userName);
        Page<User> userPage = userService.page(new Page<>(current, size), queryWrapper);

        List<User> userList = userService.list(queryWrapper);
        List<UserInfoListVO> userInfoList = new ArrayList<>();
        for (User user : userList) {
            UserInfoListVO userInfoListVO = new UserInfoListVO();
            BeanUtils.copyProperties(user, userInfoListVO);
            userInfoList.add(userInfoListVO);
        }

        Page<UserInfoListVO> userInfoPage = new Page<>(userPage.getCurrent(), userPage.getSize(), userPage.getTotal());
        userInfoPage.setRecords(userInfoList);

        return ResultUtils.success(userInfoPage);
    }

    // endregion

    // region 角色相关

    /**
     * 获取用户角色
     *
     * @param userRoleQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/role", name = "获取用户角色")
    public BaseResponse<List<UserRoleVO>> getUserRoleByUserId(UserRoleUpdateRequest userRoleQueryRequest, HttpServletRequest request) {
        if (userRoleQueryRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        List<UserRoleVO> userRoleList = userService.getUserInfoById(userRoleQueryRequest.getId());
        return ResultUtils.success(userRoleList);
    }

    /**
     * 更新用户角色
     *
     * @param userRoleUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/updateRole", name = "更新用户角色")
    public BaseResponse<Boolean> updateUserRole(@RequestBody UserRoleUpdateRequest userRoleUpdateRequest, HttpServletRequest request) {
        // 校验
        if (userRoleUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        //  更新
        boolean result = userRoleService.updateUserRole(userRoleUpdateRequest);

        // Redis数据同步
        userService.updateRedisUser(userRoleUpdateRequest.getId());

        return ResultUtils.success(result);
    }

    // endregion
}

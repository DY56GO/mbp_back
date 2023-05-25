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
import com.yingwu.project.model.vo.UserInfoVO;
import com.yingwu.project.model.vo.UserVO;
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


/**
 * 用户接口
 *
 * @author Dy56
 */
@CrossOrigin // 跨域
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
    @PostMapping("/register")
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
    @PostMapping("/login")
    public BaseResponse<String> userLogin(@RequestBody UserLoginRequest userLoginRequest, HttpServletRequest request) {
        // 校验
        if (userLoginRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtils.copyProperties(userLoginRequest, user);
        userService.validUserLoginInfo(user);

        // 登陆 返回tokenKey
        String tokenKey = userService.userLogin(user, request);
        return ResultUtils.success(tokenKey);
    }

    /**
     * 获取当前登录用户
     *
     * @param request
     * @return
     */
    @GetMapping("/info")
    public BaseResponse<UserInfoVO> getLoginUser(HttpServletRequest request) {
        UserInfoVO userInfo = userService.getLoginUser(request);
        return ResultUtils.success(userInfo);
    }

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    @PostMapping("/logout")
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
    @PostMapping("/add")
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
    @PostMapping("/delete")
    public BaseResponse<Boolean> deleteUser(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        // 校验
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        // 删除
        boolean result = userService.removeById(deleteRequest.getId());
        return ResultUtils.success(result);
    }

    /**
     * 更新用户
     *
     * @param userUpdateRequest
     * @param request
     * @return
     */
    @PostMapping("/update")
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
            user.setUserPassword(userService.encryptPassword(password));
        }

        // 更新
        boolean result = userService.updateById(user);
        if (result) {
            // 更新Redis中的用户信息
            userService.updateRedisUser(user.getId());
        }
        return ResultUtils.success(result);
    }

    /**
     * 更新用户（仅能更新自己的信息）
     *
     * @param userUpdateSelfRequest
     * @param request
     * @return
     */
    @PostMapping("/updateSelf")
    public BaseResponse<Boolean> updateUserOneself(@RequestBody UserUpdateSelfRequest userUpdateSelfRequest, HttpServletRequest request) {
        // 校验
        UserInfoVO userInfo = userService.getLoginUser(request);
        if (userUpdateSelfRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = new User();
        BeanUtil.copyProperties(userUpdateSelfRequest, user);
        user.setId(userInfo.getId());
        userService.validUserUpdateInfo(user);

        // 更新
        boolean result = userService.updateById(user);
        if (result) {
            // 用户Redis数据刷新
            userService.updateRedisUser(userInfo.getId());
        }
        return ResultUtils.success(result);
    }

    /**
     * 更新用户密码
     *
     * @param userPasswordUpdateRequest
     * @param request
     * @return
     */
    @PostMapping("/updatePassword")
    public BaseResponse<Boolean> updateUserPassword(@RequestBody UserPasswordUpdateRequest userPasswordUpdateRequest, HttpServletRequest request) {
        UserInfoVO userInfo = userService.getLoginUser(request);
        Long userId = userInfo.getId();

        // 校验
        userService.validUpdateUserPasswordInfo(userPasswordUpdateRequest, userId);

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
    @GetMapping("/list")
    public BaseResponse<List<UserVO>> getUserList(UserQueryRequest userQueryRequest, HttpServletRequest request) {
        User userQuery = new User();
        if (userQueryRequest != null) {
            BeanUtil.copyProperties(userQueryRequest, userQuery);
        }
        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        List<User> userList = userService.list(queryWrapper);
        List<UserVO> userVOList = new ArrayList<>();
        for(User user : userList) {
            UserVO userVO = new UserVO();
            BeanUtils.copyProperties(user, userVO);
            userVOList.add(userVO);
        }
        return ResultUtils.success(userVOList);
    }

    /**
     * 分页获取用户列表
     *
     * @param userQueryRequest
     * @param request
     * @return
     */
    @GetMapping("/list/page")
    public BaseResponse<Page<UserVO>> getUserListByPage(UserQueryRequest userQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        User userQuery = new User();
        if (userQueryRequest != null) {
            BeanUtil.copyProperties(userQueryRequest, userQuery);
            current = userQueryRequest.getCurrent();
            size = userQueryRequest.getPageSize();
        }

        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        Page<User> userPage = userService.page(new Page<>(current, size), queryWrapper);

        List<UserVO> userVOList = new ArrayList<>();
        for(User user : userPage.getRecords()) {
            UserVO userVO = new UserVO();
            BeanUtils.copyProperties(user, userVO);
            userVOList.add(userVO);
        }
        Page<UserVO> userVOPage = new Page<>(current, size);
        userVOPage.setRecords(userVOList);

        return ResultUtils.success(userVOPage);
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
    @GetMapping("/role")
    public BaseResponse<List<Long>> getUserRoleByUserId(UserRoleUpdateRequest userRoleQueryRequest, HttpServletRequest request) {
        if (userRoleQueryRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        UserInfoVO user = userService.getUserInfoById(userRoleQueryRequest.getId());
        return ResultUtils.success(user.getRoleIdList());
    }

    /**
     * 更新用户角色
     *
     * @param userRoleUpdateRequest
     * @param request
     * @return
     */
    @PostMapping("/updateRole")
    public BaseResponse<Boolean> updateUserRole(@RequestBody UserRoleUpdateRequest userRoleUpdateRequest, HttpServletRequest request) {
        // 校验
        if (userRoleUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        //  更新
        boolean result = userRoleService.updateUserRole(userRoleUpdateRequest);
        if (result) {
            // 更新Redis中的用户信息
            userService.updateRedisUser(userRoleUpdateRequest.getId());
        }

        return ResultUtils.success(true);
    }

    // endregion
}

package com.yingwu.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.MenuMapper;
import com.yingwu.project.mapper.RoleMapper;
import com.yingwu.project.mapper.UserMapper;
import com.yingwu.project.model.dto.user.UserPasswordUpdateRequest;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserInfoRedisVO;
import com.yingwu.project.model.vo.UserMenuVO;
import com.yingwu.project.model.vo.UserRoleVO;
import com.yingwu.project.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static com.yingwu.project.constant.PasswordConstant.SALT;
import static com.yingwu.project.constant.UserConstant.*;
import static com.yingwu.project.util.Utils.buildUserRouter;
import static com.yingwu.project.util.Utils.encryptPassword;


/**
 * @author Dy56
 * @description 针对表【user】的数据库操作Service实现
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Value("${snowflake.workerId}")
    private long workerId;

    @Value("${snowflake.datacenterId}")
    private long datacenterId;

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 用户注册
     *
     * @param user
     * @return 新用户 id
     */
    
    public long userRegister(User user) {
        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        synchronized (userAccount.intern()) {
            // 1. 账户不能重复
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_account", userAccount);
            long count = userMapper.selectCount(queryWrapper);
            if (count > 0) {
                throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号重复");
            }

            // 2. 加密
            userPassword = encryptPassword(userPassword);

            // 3. 插入数据
            user.setUserAccount(userAccount);
            user.setUserPassword(userPassword);
            boolean saveResult = this.save(user);
            if (!saveResult) {
                throw new BusinessException(ErrorCode.SYSTEM_ERROR, "注册失败");
            }
            return user.getId();
        }
    }

    /**
     * 用户注册信息校验
     *
     * @param user
     */
    
    public void validUserRegisterInfo(User user) {
        if (user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();
        String checkPassword = user.getUserPassword();

        if (StringUtils.isAnyBlank(userAccount, userPassword, checkPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < USER_ACCOUNT_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (userAccount.length() > USER_ACCOUNT_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过长");
        }
        if (userPassword.length() < USER_PASSWORD_MIN_LENGTH || checkPassword.length() < USER_PASSWORD_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过短");
        }
        if (userPassword.length() > USER_PASSWORD_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过长");
        }
        if (checkPassword.length() > USER_PASSWORD_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "确认密码过长");
        }
        // 密码和校验密码相同
        if (!userPassword.equals(checkPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码和确认密码不一致");
        }
    }

    /**
     * 用户登录
     *
     * @param user
     * @param request
     * @return 生成的tokenKey
     */
    
    public String userLogin(User user, HttpServletRequest request) {
        // 1. 加密
        String userPassword = encryptPassword(user.getUserPassword());
        String userAccount = user.getUserAccount();

        // 2. 查询用户是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_account", userAccount);
        queryWrapper.eq("user_password", userPassword);
        queryWrapper.eq("is_using", 1);
        User hasUser = userMapper.selectOne(queryWrapper);
        // 用户不存在
        if (hasUser == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户不存在或密码错误");
        }

        // 3. 判断Redis中是否存在，存在为已登录，直接返回tokenKey
        String userAccountKey = DigestUtils.md5DigestAsHex((SALT + userAccount).getBytes());
        Set<String> tokenKeys = redisTemplate.keys(userAccountKey + "_*");
        if (!tokenKeys.isEmpty()) {
            String tokenKey = tokenKeys.iterator().next();
            return tokenKey;
        }

        // region Redis中不存在，开始生成tokenKey
        
        // 4. 数据脱敏和添加权限信息
        UserInfoRedisVO userInfo = new UserInfoRedisVO();
        BeanUtils.copyProperties(hasUser, userInfo);

        // 角色信息
        List<UserRoleVO> userRoleList = roleMapper.getUserRoleByUserId(userInfo.getId());
        userInfo.setUserRoleList(userRoleList);

        // 菜单信息（根据前台路由生成）
        List<UserMenuVO> userMenuList = menuMapper.getUserMenuByUserId(userInfo.getId());
        List<Tree<String>> userMenuTree = buildUserRouter(userMenuList);
        userInfo.setUserMenuTree(userMenuTree);

        // 5. 生成token
        // workerId 为终端ID
        // datacenterId 为数据中心ID
        Snowflake snowflake = IdUtil.getSnowflake(workerId, datacenterId);
        String token = snowflake.nextIdStr();

        // 6. 自定义tokenKey
        String tokenKey = userAccountKey + "_" + token;

        // endregion
        
        // 7. 写入redis
        Map<String, Object> userInfoMap = BeanUtil.beanToMap(userInfo);
        redisTemplate.opsForHash().putAll(tokenKey, userInfoMap);
        // 设置过期时间
        redisTemplate.expire(tokenKey, USER_EXPIRATION_TIME, TimeUnit.MINUTES);

        return tokenKey;
    }

    /**
     * 用户登陆信息校验
     *
     * @param user
     */
    public void validUserLoginInfo(User user) {
        if (user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        if (StringUtils.isAnyBlank(userAccount, userPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < USER_ACCOUNT_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号错误");
        }
        if (userPassword.length() < USER_PASSWORD_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码错误");
        }
    }

    /**
     * 当前登录用户获取信息
     *
     * @param request
     * @return 用户信息
     */
    
    public UserInfoRedisVO getLoginUser(HttpServletRequest request) {
        String tokenKey = request.getHeader("token");
        // 从Redis中获取用户数据
        Map userInfoMap = redisTemplate.boundHashOps(tokenKey).entries();
        UserInfoRedisVO userInfo = BeanUtil.toBeanIgnoreCase(userInfoMap, UserInfoRedisVO.class, false);

        return userInfo;
    }

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    
    public boolean userLogout(HttpServletRequest request) {
        String tokenKey = request.getHeader("token");
        // 从Redis中删除tokenKey
        redisTemplate.delete(tokenKey);

        return true;
    }

    /**
     * 创建用户信息校验
     *
     * @param user
     */
    public void validAddUserInfo(User user) {
        if (user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        if (StringUtils.isAnyBlank(userAccount, userPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < USER_ACCOUNT_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (userAccount.length() > USER_ACCOUNT_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过长");
        }
        if (userPassword.length() < USER_PASSWORD_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过短");
        }
        if (userPassword.length() > USER_PASSWORD_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过长");
        }

        // 用户账号不能重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_account", userAccount);
        long count = count(queryWrapper);
        if (count != 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号重复");
        }

    }

    /**
     * 用户更新信息校验
     *
     * @param user
     */
    
    public void validUserUpdateInfo(User user) {
        if (user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        Long id = user.getId();
        String userAccount = user.getUserAccount();

        if (StringUtils.isAnyBlank(userAccount)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号错误");
        }

        // 用户账号不能重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_account", userAccount);
        queryWrapper.ne("id", id);
        long count = count(queryWrapper);
        if (count != 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号重复");
        }
    }

    /**
     * 用户更新密码校验
     *
     * @param userPasswordUpdateRequest
     * @param userId
     */
    
    public void validUserPasswordUpdateInfo(UserPasswordUpdateRequest userPasswordUpdateRequest, Long userId) {
        if (userPasswordUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userOldPassword = userPasswordUpdateRequest.getUserOldPassword();
        String userNewPassword = userPasswordUpdateRequest.getUserNewPassword();
        String newCheckPassword = userPasswordUpdateRequest.getNewCheckPassword();

        if (StringUtils.isAnyBlank(userOldPassword, userNewPassword, newCheckPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }

        // 验证旧密码
        User userQuery = new User();
        userQuery.setId(userId);
        userQuery.setUserPassword(DigestUtils.md5DigestAsHex((SALT + userOldPassword).getBytes()));
        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        long count = count(queryWrapper);
        if (count == 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "旧密码错误");
        }
        if (userNewPassword.length() < USER_PASSWORD_MIN_LENGTH || newCheckPassword.length() < USER_PASSWORD_MIN_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过短");
        }
        if (userNewPassword.length() > USER_PASSWORD_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "新密码过长");
        }
        if (newCheckPassword.length() > USER_PASSWORD_MAX_LENGTH) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "新确认密码过长");
        }
        // 验证新密码和确认密码是否否一致
        if (!userNewPassword.equals(newCheckPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "新密码和新确认密码不一致");
        }
    }

    /**
     * 获取用户信息通过用户id
     *
     * @param userId
     * @return 用户信息
     */
    
    public List<UserRoleVO> getUserInfoById(Long userId) {

        // 数据脱敏和添加权限信息
        List<UserRoleVO> userRoleList = roleMapper.getUserRoleByUserId(userId);

        return userRoleList;
    }


    /**
     * 用户Redis数据刷新
     *
     * @param userId 用户Id
     * @return
     */
    public boolean updateRedisUser(Long userId) {
        // 查询用户信息
        User user = userMapper.selectById(userId);

        // 数据脱敏和添加权限信息
        UserInfoRedisVO userInfo = BeanUtil.copyProperties(user, UserInfoRedisVO.class);
        List<UserRoleVO> userRoleList = roleMapper.getUserRoleByUserId(userInfo.getId());
        userInfo.setUserRoleList(userRoleList);

        // 刷新用户Redis数据
        String userAccountKey = DigestUtils.md5DigestAsHex((SALT + userInfo.getUserAccount()).getBytes());
        Set<String> tokenKeys = redisTemplate.keys(userAccountKey + "_*");
        if (!tokenKeys.isEmpty()) {
            String tokenKey = tokenKeys.iterator().next();
            Map<String, Object> userMap = BeanUtil.beanToMap(userInfo);
            userMap.forEach((key, value) -> {
                if (null != value) {
                    userMap.put(key, String.valueOf(value));
                }
            });
            redisTemplate.opsForHash().putAll(tokenKey, userMap);
            return true;
        }
        return false;
    }

}





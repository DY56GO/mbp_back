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
import com.yingwu.project.mapper.UserRoleMapper;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.yingwu.project.constant.PasswordConstant.SALT;
import static com.yingwu.project.constant.RedisConstant.*;
import static com.yingwu.project.constant.UserConstant.*;
import static com.yingwu.project.exception.ThrowUtils.throwIf;
import static com.yingwu.project.util.Utils.buildUserRouter;
import static com.yingwu.project.util.Utils.encryptPassword;


/**
 * @author yupi
 * @revision Dy56
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
    private UserRoleMapper userRoleMapper;

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
    @Override
    public long userRegister(User user) {
        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        synchronized (userAccount.intern()) {
            // 1. 账户不能重复
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_account", userAccount);
            long count = userMapper.selectCount(queryWrapper);
            throwIf(count > 0, ErrorCode.PARAMS_ERROR, "用户账号重复");

            // 2. 加密
            userPassword = encryptPassword(userPassword);

            // 3. 插入数据
            user.setUserAccount(userAccount);
            user.setUserPassword(userPassword);
            boolean saveResult = this.save(user);
            throwIf(!saveResult, ErrorCode.SYSTEM_ERROR, "注册失败");

            return user.getId();
        }
    }

    /**
     * 用户注册信息校验
     *
     * @param user
     */
    @Override
    public void validUserRegisterInfo(User user) {
        throwIf(user == null, ErrorCode.PARAMS_ERROR);

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();
        String checkPassword = user.getUserPassword();

        throwIf(StringUtils.isAnyBlank(userAccount, userPassword, checkPassword), ErrorCode.PARAMS_ERROR, "参数为空");
        throwIf(userAccount.length() < USER_ACCOUNT_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号过短");
        throwIf(userAccount.length() > USER_ACCOUNT_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号过长");
        throwIf(userPassword.length() < USER_PASSWORD_MIN_LENGTH || checkPassword.length() < USER_PASSWORD_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "密码过短");
        throwIf(userPassword.length() > USER_PASSWORD_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "密码过长");
        throwIf(checkPassword.length() > USER_PASSWORD_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "确认密码过长");

        // 密码和校验密码相同
        throwIf(!userPassword.equals(checkPassword), ErrorCode.PARAMS_ERROR, "密码和确认密码不一致");
    }

    /**
     * 用户登录
     *
     * @param user
     * @param request
     * @return 生成的token
     */
    @Override
    public String userLogin(User user, HttpServletRequest request) {
        // 1.加密
        String userPassword = encryptPassword(user.getUserPassword());
        String userAccount = user.getUserAccount();

        // 2.查询用户是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_account", userAccount);
        queryWrapper.eq("user_password", userPassword);
        queryWrapper.eq("is_using", 1);
        User hasUser = userMapper.selectOne(queryWrapper);

        // 用户不存在
        throwIf(hasUser == null, ErrorCode.PARAMS_ERROR, "用户不存在或密码错误");

        // 3.通过用户id为key，判断Redis中是否存在，存在为已登录，返回value中的token
        String userKey = USER_ID_KEY_REDIS + hasUser.getId();
        String userToken = (String) redisTemplate.opsForHash().get(userKey, "token");

        if (userToken != null) {
            return userToken;
        }

        // Redis中不存在，开始生成token

        // 4.生成token
        // workerId 为终端ID
        // datacenterId 为数据中心ID
        Snowflake snowflake = IdUtil.getSnowflake(workerId, datacenterId);
        String token = snowflake.nextIdStr();

        // 5.创建用户Redis数据
        UserInfoRedisVO userInfo = createUserRedisData(hasUser.getId());
        userInfo.setToken(token);

        // 6.将token和用户信息写入Redis
        redisTemplate.opsForValue().set(token, userKey);
        Map<String, Object> userInfoMap = BeanUtil.beanToMap(userInfo);
        redisTemplate.opsForHash().putAll(userKey, userInfoMap);

        // 设置过期时间
        redisTemplate.expire(token, TOKEN_EXPIRATION_TIME, TimeUnit.MINUTES);
        redisTemplate.expire(userKey, USER_ID_EXPIRATION_TIME, TimeUnit.MINUTES);

        return token;
    }

    /**
     * 用户登陆信息校验
     *
     * @param user
     */
    @Override
    public void validUserLoginInfo(User user) {
        throwIf(user == null, ErrorCode.PARAMS_ERROR);

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        throwIf(StringUtils.isAnyBlank(userAccount, userPassword), ErrorCode.PARAMS_ERROR, "参数为空");
        throwIf(userAccount.length() < USER_ACCOUNT_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号错误");
        throwIf(userPassword.length() < USER_PASSWORD_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "密码错误");
    }

    /**
     * 当前登录用户获取信息
     *
     * @param request
     * @return 用户信息
     */
    @Override
    public UserInfoRedisVO getLoginUser(HttpServletRequest request) {
        String token = request.getHeader("token");
        // 从Redis中获取用户数据
        String userKey = (String) redisTemplate.opsForValue().get(token);
        Map userInfoMap = redisTemplate.opsForHash().entries(userKey);

        // 如果Redis中没有则去查询并重新写入Redis
        if (userInfoMap.size() == 0) {
            String userId = userKey.replaceAll(USER_ID_KEY_REDIS, "");
            UserInfoRedisVO userInfo = createUserRedisData(Long.valueOf(userId));
            userInfo.setToken(token);

            // 6.将token和用户信息写入Redis
            redisTemplate.opsForValue().set(token, userKey);
            userInfoMap = BeanUtil.beanToMap(userInfo);
            redisTemplate.opsForHash().putAll(userKey, userInfoMap);
            redisTemplate.expire(userKey, USER_ID_EXPIRATION_TIME, TimeUnit.MINUTES);
        }

        UserInfoRedisVO userInfo = BeanUtil.toBeanIgnoreCase(userInfoMap, UserInfoRedisVO.class, false);

        return userInfo;
    }

    /**
     * 用户注销
     *
     * @param request
     * @return
     */
    @Override
    public boolean userLogout(HttpServletRequest request) {
        String token = request.getHeader("token");
        // 从Redis中延迟删除token
        Long userId = Long.valueOf(redisTemplate.opsForValue().get(token).toString().replaceAll(USER_ID_KEY_REDIS, ""));
        deleteRedisUser(userId);

        return true;
    }

    /**
     * 创建用户信息校验
     *
     * @param user
     */
    @Override
    public void validAddUserInfo(User user) {
        throwIf(user == null, ErrorCode.PARAMS_ERROR);

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        throwIf(StringUtils.isAnyBlank(userAccount, userPassword), ErrorCode.PARAMS_ERROR, "参数为空");
        throwIf(userAccount.length() < USER_ACCOUNT_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号过短");
        throwIf(userAccount.length() > USER_ACCOUNT_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号过长");
        throwIf(userPassword.length() < USER_PASSWORD_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "密码过短");
        throwIf(userPassword.length() > USER_PASSWORD_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "密码过长");

        // 用户账号不能重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_account", userAccount);
        long count = count(queryWrapper);
        throwIf(count != 0, ErrorCode.PARAMS_ERROR, "用户账号重复");
    }

    /**
     * 用户更新信息校验
     *
     * @param user
     */
    @Override
    public void validUserUpdateInfo(User user) {
        throwIf(user == null, ErrorCode.PARAMS_ERROR);

        Long id = user.getId();
        String userAccount = user.getUserAccount();

        throwIf(StringUtils.isAnyBlank(userAccount), ErrorCode.PARAMS_ERROR, "参数为空");
        throwIf(userAccount.length() < USER_ACCOUNT_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号过短");
        throwIf(userAccount.length() > USER_ACCOUNT_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "用户账号过长");

        // 用户账号不能重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_account", userAccount);
        queryWrapper.ne("id", id);
        long count = count(queryWrapper);
        throwIf(count != 0, ErrorCode.PARAMS_ERROR, "用户账号重复");
    }

    /**
     * 用户更新密码校验
     *
     * @param userPasswordUpdateRequest
     * @param userId
     */
    @Override
    public void validUserPasswordUpdateInfo(UserPasswordUpdateRequest userPasswordUpdateRequest, Long userId) {
        throwIf(userPasswordUpdateRequest == null, ErrorCode.PARAMS_ERROR);

        String userOldPassword = userPasswordUpdateRequest.getUserOldPassword();
        String userNewPassword = userPasswordUpdateRequest.getUserNewPassword();
        String newCheckPassword = userPasswordUpdateRequest.getNewCheckPassword();

        throwIf(StringUtils.isAnyBlank(userOldPassword, userNewPassword, newCheckPassword), ErrorCode.PARAMS_ERROR, "参数为空");

        // 验证旧密码
        User userQuery = new User();
        userQuery.setId(userId);
        userQuery.setUserPassword(DigestUtils.md5DigestAsHex((SALT + userOldPassword).getBytes()));
        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        long count = count(queryWrapper);

        throwIf(count == 0, ErrorCode.PARAMS_ERROR, "旧密码错误");
        throwIf(userNewPassword.length() < USER_PASSWORD_MIN_LENGTH || newCheckPassword.length() < USER_PASSWORD_MIN_LENGTH, ErrorCode.PARAMS_ERROR, "密码过短");
        throwIf(userNewPassword.length() > USER_PASSWORD_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "新密码过长");
        throwIf(newCheckPassword.length() > USER_PASSWORD_MAX_LENGTH, ErrorCode.PARAMS_ERROR, "新确认密码过长");
        throwIf(StringUtils.isAnyBlank(userOldPassword, userNewPassword, newCheckPassword), ErrorCode.PARAMS_ERROR, "参数为空");

        // 验证新密码和确认密码是否否一致
        throwIf(!userNewPassword.equals(newCheckPassword), ErrorCode.PARAMS_ERROR, "新密码和新确认密码不一致");
    }

    /**
     * 获取用户信息通过用户id
     *
     * @param userId
     * @return 用户信息
     */
    @Override
    public List<UserRoleVO> getUserInfoById(Long userId) {

        // 数据脱敏和添加权限信息
        List<UserRoleVO> userRoleList = roleMapper.getUserRoleByUserId(userId);

        return userRoleList;
    }

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteUser(Long userId) {
        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            removeById(userId);

            List<Long> userIdList = new ArrayList<>();
            userIdList.add(userId);

            // 数据同步
            // 删除用户角色
            userRoleMapper.removeBatchByUserIdList(userIdList);

            // 删除Redis中的用户，使其下线
            deleteRedisUser(userId);
        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }

    /**
     * 创建用户Redis数据
     *
     * @param userId
     * @return
     */
    @Override
    public UserInfoRedisVO createUserRedisData(Long userId) {
        // 1.获取用户基本信息
        User hasUser = userMapper.selectById(userId);
        // 用户不存在
        throwIf(hasUser == null, ErrorCode.PARAMS_ERROR, "用户不存");

        // 2.数据脱敏和添加权限信息
        UserInfoRedisVO userInfo = new UserInfoRedisVO();
        BeanUtils.copyProperties(hasUser, userInfo);

        // 角色信息
        List<UserRoleVO> userRoleList = roleMapper.getUserRoleByUserId(userInfo.getId());
        userInfo.setUserRoleList(userRoleList);

        // 菜单信息（根据前台路由生成）
        List<UserMenuVO> userMenuList = menuMapper.getUserMenuByUserId(userInfo.getId());
        if (userMenuList.size() != 0) {
            List<Tree<String>> userMenuTree = buildUserRouter(userMenuList);
            userInfo.setUserMenuTree(userMenuTree);
        } else {
            userInfo.setUserMenuTree(new ArrayList<>());
        }
        return userInfo;
    }

    /**
     * 更新用户Redis数据
     *
     * @param userId
     * @return
     */
    @Override
    public boolean updateRedisUser(Long userId) {
        String userKey = USER_ID_KEY_REDIS + userId;
        redisTemplate.expire(userKey, DELETE_KEY_TIME, TimeUnit.SECONDS);

        return true;
    }

    /**
     * 删除用户Redis数据
     *
     * @param userId
     * @return
     */
    @Override
    public boolean deleteRedisUser(Long userId) {
        String userKey = USER_ID_KEY_REDIS + userId;

        if (!redisTemplate.hasKey(userKey)) {
            return true;
        }

        String token = (String) redisTemplate.opsForHash().get(userKey, "token");

        // 从Redis中延迟删除token
        redisTemplate.expire(token, DELETE_KEY_TIME, TimeUnit.SECONDS);
        redisTemplate.expire(userKey, DELETE_KEY_TIME, TimeUnit.SECONDS);

        return true;
    }

}





package com.yingwu.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.UserMapper;
import com.yingwu.project.model.dto.user.UserUpdatePasswordRequest;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserVO;
import com.yingwu.project.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.yingwu.project.constant.PasswordConstant.SALT;
import static com.yingwu.project.constant.UserConstant.USER_EXPIRATION_TIME;
import static com.yingwu.project.constant.UserConstant.USER_LOGIN_STATE;


/**
 * 用户服务实现类
 *
 * @author Dy56
 */
@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
        implements UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private RedisTemplate redisTemplate;

    @Override
    public long userRegister(User user) {
        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        synchronized (userAccount.intern()) {
            // 账户不能重复
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("userAccount", userAccount);
            long count = userMapper.selectCount(queryWrapper);
            if (count > 0) {
                throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号重复");
            }
            // 2. 加密
            String encryptPassword = DigestUtils.md5DigestAsHex((SALT + userPassword).getBytes());
            // 3. 插入数据
            user.setUserAccount(userAccount);
            user.setUserPassword(encryptPassword);
            boolean saveResult = this.save(user);
            if (!saveResult) {
                throw new BusinessException(ErrorCode.SYSTEM_ERROR, "注册失败，数据库错误");
            }
            return user.getId();
        }
    }

    @Override
    public void validUserRegister(User user) {
        if(user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();
        String checkPassword = user.getUserPassword();

        if (StringUtils.isAnyBlank(userAccount, userPassword, checkPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (userAccount.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过长");
        }
        if (userPassword.length() < 8 || checkPassword.length() < 8) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过短");
        }
        if (userPassword.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过长");
        }
        if (checkPassword.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "确认密码过长");
        }
        // 密码和校验密码相同
        if (!userPassword.equals(checkPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "两次输入的密码不一致");
        }
    }

    @Override
    public String userLogin(User user, HttpServletRequest request) {
        // 1. 加密
        String userPassword = user.getUserPassword();
        String userAccount = user.getUserAccount();
        String encryptPassword = DigestUtils.md5DigestAsHex((SALT + userPassword).getBytes());
        // 查询用户是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userAccount", userAccount);
        queryWrapper.eq("userPassword", encryptPassword);
        User newUser = userMapper.selectOne(queryWrapper);
        // 用户不存在
        if (newUser == null) {
            log.info("user login failed, userAccount cannot match userPassword");
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户不存在或密码错误");
        }

        // 2. 数据脱敏
        UserVO userVo = BeanUtil.copyProperties(newUser, UserVO.class);

        // 3. 生成token，写入redis中
        // 生成token（todo 更改为雪花）
        String token = RandomUtil.randomString(16);    // 随机生成token，作为登录令牌
        String tokenKey = token + userVo.getUserAccount();

        // 4. 写入redis
        redisTemplate.opsForHash().putAll(tokenKey, BeanUtil.beanToMap(userVo));
        redisTemplate.expire(tokenKey, USER_EXPIRATION_TIME, TimeUnit.MINUTES);

        return tokenKey;
    }

    public void validUserLogin(User user) {
        if(user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        if (StringUtils.isAnyBlank(userAccount, userPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号错误");
        }
        if (userPassword.length() < 8) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码错误");
        }
    }

    /**
     * 获取当前登录用户
     *
     * @param request
     * @return
     */
    @Override
    public UserVO getLoginUser(HttpServletRequest request) {
        String tokenKey = request.getHeader("token");
        // 判断是否登录
        if (tokenKey == null || !redisTemplate.hasKey(tokenKey)) {
            throw new BusinessException(ErrorCode.NOT_LOGIN_ERROR);
        }

        // 从redis中获取用户数据
        Map userVoMap = redisTemplate.boundHashOps(tokenKey).entries();
        if (userVoMap.size() == 0) {
            throw new BusinessException(ErrorCode.NOT_LOGIN_ERROR);
        }
        UserVO userVo = BeanUtil.toBeanIgnoreCase(userVoMap, UserVO.class, false);

        return userVo;
    }

    /**
     * 用户注销
     *
     * @param request
     */
    @Override
    public boolean userLogout(HttpServletRequest request) {
        String tokenKey = request.getHeader("token");
        // 判断是否登录
        if (tokenKey == null || !redisTemplate.hasKey(tokenKey)) {
            throw new BusinessException(ErrorCode.NOT_LOGIN_ERROR);
        }

        // 从redis中删除token
        redisTemplate.delete(tokenKey);

        return true;
    }

    public void validAddUser(User user) {
        if(user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();
        String userPassword = user.getUserPassword();

        if (StringUtils.isAnyBlank(userAccount, userPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过短");
        }
        if (userAccount.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号过长");
        }
        if (userPassword.length() < 8) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过短");
        }
        if (userPassword.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过长");
        }

        // 查询用户是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userAccount", userAccount);
        long count = count(queryWrapper);
        if (count != 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户已存在");
        }

    }

    /**
     * 用户更新校验
     *
     * @param user
     */
    @Override
    public void validUserUpdate(User user) {
        if(user == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userAccount = user.getUserAccount();

        if (StringUtils.isAnyBlank(userAccount)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
        if (userAccount.length() < 4) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "用户账号错误");
        }
    }

    /**
     * 用户更新密码校验
     *
     * @param userUpdatePasswordRequest
     * @param userId
     */
    @Override
    public void validUpdateUserPassword(UserUpdatePasswordRequest userUpdatePasswordRequest, Long userId){
        if (userUpdatePasswordRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String userOldPasswod = userUpdatePasswordRequest.getUserOldPassword();
        String userNewPasswod = userUpdatePasswordRequest.getUserNewPassword();
        String newCheckPassword = userUpdatePasswordRequest.getNewCheckPassword();

        if (StringUtils.isAnyBlank(userOldPasswod, userNewPasswod, newCheckPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }

        // 验证旧密码
        User userQuery = new User();
        userQuery.setId(userId);
        userQuery.setUserPassword(DigestUtils.md5DigestAsHex((SALT + userOldPasswod).getBytes()));
        QueryWrapper<User> queryWrapper = new QueryWrapper<>(userQuery);
        long count = count(queryWrapper);
        if (count == 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "旧密码错误");
        }

        if (userNewPasswod.length() < 8 || newCheckPassword.length() < 8) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "密码过短");
        }
        if (userNewPasswod.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "新密码过长");
        }
        if (newCheckPassword.length() > 16) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "新确认密码过长");
        }

        // 验证新密码和确认密码是否否一致
        if (!userNewPasswod.equals(newCheckPassword)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "新密码和新确认密码不一致");
        }
    }


    /**
     * 用户Redis数据刷新
     *
     * @param userId  用户Id
     * @param request
     * @return
     */
    public boolean updateRedisUser(Long userId, HttpServletRequest request) {
        String tokenKey = request.getHeader("token");
        User user = userMapper.selectById(userId);
        UserVO userVo = BeanUtil.copyProperties(user, UserVO.class);
        redisTemplate.opsForHash().putAll(tokenKey, BeanUtil.beanToMap(userVo));
        return true;
    }


    /**
     * 是否为管理员
     *
     * @param request
     * @return
     */
    @Override
    public boolean isAdmin(HttpServletRequest request) {
        // 仅管理员可查询
        Object userObj = request.getSession().getAttribute(USER_LOGIN_STATE);
        User user = (User) userObj;
        //return user != null && ADMIN_ROLE.equals(user.getUserRole());
        return true;
    }

}





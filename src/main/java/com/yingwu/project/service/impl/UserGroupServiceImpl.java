package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.UserGroupMapper;
import com.yingwu.project.model.entity.UserGroup;
import com.yingwu.project.service.UserGroupService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import static com.yingwu.project.exception.ThrowUtils.throwIf;

/**
 * @author Dy56
 * @description 针对表【user_group】的数据库操作Service实现
 */
@Service
public class UserGroupServiceImpl extends ServiceImpl<UserGroupMapper, UserGroup> implements UserGroupService {

    /**
     * 用户组信息校验
     *
     * @param group
     */
    @Override
    public void validUserGroupInfo(UserGroup group) {
        throwIf(group == null, ErrorCode.PARAMS_ERROR);

        String groupName = group.getGroupName();
        throwIf(StringUtils.isAnyBlank(groupName), ErrorCode.PARAMS_ERROR, "参数为空");
    }

    /**
     * 删除用户组
     *
     * @param groupId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteUserGroup(Long groupId) {
        // 判断是否含有子用户组
        UserGroup userGroup = new UserGroup();
        userGroup.setParentId(groupId);
        QueryWrapper<UserGroup> queryWrapper = new QueryWrapper<>(userGroup);
        long count = count(queryWrapper);
        throwIf(count != 0, ErrorCode.PARAMS_ERROR, "存在子用户组");

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 删除
            removeById(groupId);
        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }
}





package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.UserGroup;

/**
* @author Dy56
* @description 针对表【user_group】的数据库操作Service
*/
public interface UserGroupService extends IService<UserGroup> {

    /**
     * 用户组信息校验
     *
     * @param userGroup
     */
    void validUserGroupInfo(UserGroup userGroup);

    /**
     * 删除用户组
     *
     * @param groupId
     * @return
     */
    boolean deleteUserGroup(Long groupId);

}

package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.UserRole;

import java.util.List;

/**
 * @author Dy56
 * @description 针对表【userRole】的数据库操作Mapper
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {

    /**
     * 批量删除用户角色
     *
     * @param deleteUserRoleBatch
     * @return
     */
    boolean removeBatch(List<UserRole> deleteUserRoleBatch);

    /**
     * 批量删除用户角色通过用户id
     *
     * @param deleteUserIdBatch
     * @return
     */
    boolean removeBatchByUserIdList(List<Long> deleteUserIdBatch);

    /**
     * 批量删除用户角色通过角色id
     *
     * @param deleteRoleIdBatch
     * @return
     */
    boolean removeBatchByRoleIdList(List<Long> deleteRoleIdBatch);

}
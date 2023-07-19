package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.UserDepartment;

import java.util.List;

/**
* @author Dy56
* @description 针对表【user_department】的数据库操作Mapper
*/
public interface UserDepartmentMapper extends BaseMapper<UserDepartment> {

    /**
     * 批量删除用户部门
     *
     * @param deleteUserDepartmentBatch
     * @return
     */
    boolean removeBatch(List<UserDepartment> deleteUserDepartmentBatch);

    /**
     * 批量删除用户部门通过角色id
     *
     * @param deleteUserIdBatch
     * @return
     */
    boolean removeBatchByUserIdList(List<Long> deleteUserIdBatch);

    /**
     * 批量删除用户部门通过菜单id
     *
     * @param deleteDepartmentIdBatch
     * @return
     */
    boolean removeBatchByDepartmentIdList(List<Long> deleteDepartmentIdBatch);
    
}





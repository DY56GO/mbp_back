package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.model.vo.UserRoleVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Dy56
* @description 针对表【role】的数据库操作Mapper
*/
public interface RoleMapper extends BaseMapper<Role> {

    /**
     * 通过用户id获取用户角色
     * @param userId
     * @return
     */
    List<UserRoleVO> getUserRoleByUserId(@Param("userId")Long userId);

}





package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.model.vo.RoleMenuVO;
import com.yingwu.project.model.vo.UserMenuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Dy56
 * @description 针对表【menu】的数据库操作Mapper
 */
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 获取角色菜单通过角色id
     *
     * @param roleId
     * @param notParent
     * @return
     */
    List<RoleMenuVO> getRoleMenuByRoleId(@Param("roleId") Long roleId, @Param("notParent") boolean notParent);

    /**
     * 获取用户菜单通过用户id
     *
     * @param userId
     * @return
     */
    List<UserMenuVO> getUserMenuByUserId(@Param("userId") Long userId);

}





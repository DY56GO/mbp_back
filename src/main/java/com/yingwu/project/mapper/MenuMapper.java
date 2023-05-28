package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.model.vo.RoleMenuVO;
import com.yingwu.project.model.vo.UserMenuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*  @author Dy56
 * @description 针对表【menu】的数据库操作Mapper
*/
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 通过角色id获取角色菜单
     *
     * @param roleId
     * @param notParent
     * @return
     */
    List<RoleMenuVO> getRoleMenuByRoleId(@Param("roleId")Long roleId, @Param("notParent")boolean notParent);

    /**
     * 通过用户id获取用户菜单
     * @param userId
     * @return
     */
    List<UserMenuVO> getUserMenuByUserId(@Param("userId")Long userId);

}





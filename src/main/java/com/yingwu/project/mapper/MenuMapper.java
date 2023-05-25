package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.model.vo.MenuOptionVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*  @author Dy56
 * @description 针对表【menu】的数据库操作Mapper
*/
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 通过角色id获取角色菜单
     * @param roleId
     * @return
     */
    List<MenuOptionVO> getRoleMenuByRoleId(@Param("roleId")Long roleId);

}





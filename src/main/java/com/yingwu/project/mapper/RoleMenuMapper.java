package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.RoleMenu;

import java.util.List;

/**
 * @author Dy56
 * @description 针对表【roleMenu】的数据库操作Mapper
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    /**
     * 批量删除角色菜单
     *
     * @param deleteRoleMenuBatch
     * @return
     */
    boolean removeBatch(List<RoleMenu> deleteRoleMenuBatch);

}





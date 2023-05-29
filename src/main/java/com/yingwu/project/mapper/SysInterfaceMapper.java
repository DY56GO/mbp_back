package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.SysInterface;
import com.yingwu.project.model.vo.RoleMenuVO;
import com.yingwu.project.model.vo.RoleSysInterfaceVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Dy56
 * @description 针对表【sys_interface】的数据库操作Mapper
 */
public interface SysInterfaceMapper extends BaseMapper<SysInterface> {

    /**
     * 获取角色系统接口通过角色id
     *
     * @param roleId
     * @return
     */
    List<RoleSysInterfaceVO> getRoleSysInterfaceByRoleId(@Param("roleId") Long roleId);

}
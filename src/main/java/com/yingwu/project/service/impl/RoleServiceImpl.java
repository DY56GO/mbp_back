package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.MenuMapper;
import com.yingwu.project.mapper.RoleMapper;
import com.yingwu.project.mapper.SysInterfaceMapper;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.model.vo.RoleMenuVO;
import com.yingwu.project.model.vo.RoleSysInterfaceVO;
import com.yingwu.project.service.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Dy56
 * @description 针对表【role】的数据库操作Service实现
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private SysInterfaceMapper sysInterfaceMapper;

    /**
     * 角色信息校验
     *
     * @param role
     */
    
    public void validRoleInfo(Role role) {
        if (role == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String roleName = role.getRoleName();
        String roleIdentity = role.getRoleIdentity();

        if (StringUtils.isAnyBlank(roleName, roleIdentity)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
    }

    /**
     * 获取角色菜单通过角色id
     *
     * @param roleId
     * @return
     */
    
    public List<RoleMenuVO> getRoleMenuByRoleId(Long roleId, boolean notParent) {
        List<RoleMenuVO> RoleMenuList = menuMapper.getRoleMenuByRoleId(roleId, notParent);
        return RoleMenuList;
    }

    /**
     * 获取角色系统接口通过角色id
     *
     * @param roleId
     * @return
     */
    
    public List<RoleSysInterfaceVO> getRoleSysInterfaceByRoleId(Long roleId) {
        List<RoleSysInterfaceVO> RoleSysInterfaceList = sysInterfaceMapper.getRoleSysInterfaceByRoleId(roleId);
        return RoleSysInterfaceList;
    }

}





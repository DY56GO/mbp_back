package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.*;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.model.vo.RoleMenuVO;
import com.yingwu.project.model.vo.RoleSysInterfaceVO;
import com.yingwu.project.service.RoleService;
import com.yingwu.project.service.SysInterfaceService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.exception.ThrowUtils.throwIf;

/**
 * @author Dy56
 * @description 针对表【role】的数据库操作Service实现
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private SysInterfaceService sysInterfaceService;

    @Resource
    private RoleSysInterfaceMapper roleSysInterfaceMapper;

    @Resource
    private SysInterfaceMapper sysInterfaceMapper;

    @Resource
    private UserRoleMapper userRoleMapper;

    @Resource
    private RoleMenuMapper roleMenuMapper;

    /**
     * 角色信息校验
     *
     * @param role
     */
    @Override
    public void validRoleInfo(Role role) {
        throwIf(role == null, ErrorCode.PARAMS_ERROR);

        String roleName = role.getRoleName();
        String roleIdentity = role.getRoleIdentity();
        throwIf(StringUtils.isAnyBlank(roleName, roleIdentity), ErrorCode.PARAMS_ERROR, "参数为空");

        // 角色标识不能重复
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_identity", roleIdentity);
        if (role.getId() != null) {
            queryWrapper.ne("id", role.getId());
        }
        long count = count(queryWrapper);
        throwIf(count != 0, ErrorCode.PARAMS_ERROR, "角色标识重复");
    }

    /**
     * 更新角色
     *
     * @param role
     * @return
     */
    @Override
    public boolean updateRole(Role role) {

        boolean result = updateById(role);

        if (role.getUsingStart() != null) {
            // 更新系统接口鉴权Redis数据
            sysInterfaceService.updateSysInterfaceRedisAuthData();
        }

        return result;
    }

    /**
     * 删除角色
     *
     * @param roleId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteRole(Long roleId) {
        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            removeById(roleId);

            // 数据同步
            // 删除用户角色表数据
            List<Long> roleIdList = new ArrayList<>();
            roleIdList.add(roleId);

            // 数据同步
            // 删除用户权限
            userRoleMapper.removeBatchByRoleIdList(roleIdList);

            // 删除角色菜单表数据
            roleMenuMapper.removeBatchByRoleIdList(roleIdList);

            // 删除角色系统接口表数据
            roleSysInterfaceMapper.removeBatchByRoleIdList(roleIdList);

            // 如果用户登录，删除Redis数据

            // 更新系统接口鉴权Redis数据
            sysInterfaceService.updateSysInterfaceRedisAuthData();

        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }

    /**
     * 获取角色菜单通过角色id
     *
     * @param roleId
     * @return
     */
    @Override
    public List<RoleMenuVO> getRoleMenuByRoleId(Long roleId, boolean notParent) {
        List<RoleMenuVO> roleMenuList = menuMapper.getRoleMenuByRoleId(roleId, notParent);
        return roleMenuList;
    }

    /**
     * 获取角色系统接口通过角色id
     *
     * @param roleId
     * @return
     */
    @Override
    public List<RoleSysInterfaceVO> getRoleSysInterfaceByRoleId(Long roleId) {
        List<RoleSysInterfaceVO> roleSysInterfaceList = sysInterfaceMapper.getRoleSysInterfaceByRoleId(roleId);
        return roleSysInterfaceList;
    }

}





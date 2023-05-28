package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.role.*;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.model.vo.RoleMenuVO;
import com.yingwu.project.service.RoleMenuService;
import com.yingwu.project.service.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * 角色接口
 *
 * @author Dy56
 */
@RestController
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @Resource
    private RoleMenuService roleMenuService;

    // region 增删改查

    /**
     * 新增角色
     *
     * @param roleAddRequest
     * @param request
     * @return
     */
    @PostMapping("/add")
    public BaseResponse<Long> addRole(@RequestBody RoleAddRequest roleAddRequest, HttpServletRequest request) {
        // 校验
        if (roleAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Role role = new Role();
        BeanUtil.copyProperties(roleAddRequest, role);
        roleService.validRoleInfo(role);

        // 新增
        boolean result = roleService.save(role);
        if (!result) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
        return ResultUtils.success(role.getId());
    }

    /**
     * 删除角色
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping("/delete")
    public BaseResponse<Boolean> deleteRole(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        // 校验
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        // 删除
        boolean result = roleService.removeById(deleteRequest.getId());
        return ResultUtils.success(result);
    }

    /**
     * 更新角色
     *
     * @param roleUpdateRequest
     * @param request
     * @return
     */
    @PostMapping("/update")
    public BaseResponse<Boolean> updateRole(@RequestBody RoleUpdateRequest roleUpdateRequest, HttpServletRequest request) {
        // 校验
        if (roleUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Role role = new Role();
        BeanUtil.copyProperties(roleUpdateRequest, role);

        // 更新
        boolean result = roleService.updateById(role);
        return ResultUtils.success(result);
    }

    /**
     * 获取角色列表
     *
     * @param roleQueryRequest
     * @param request
     * @return
     */
    @GetMapping("/list")
    public BaseResponse<List<Role>> listRole(RoleQueryRequest roleQueryRequest, HttpServletRequest request) {
        Role roleQuery = new Role();
        if (roleQueryRequest != null) {
            BeanUtil.copyProperties(roleQueryRequest, roleQuery);
        }
        String roleName = roleQuery.getRoleName();
        roleQuery.setRoleName(null);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>(roleQuery);
        queryWrapper.like(StringUtils.isNotBlank(roleName), "roleName", roleName);
        List<Role> roleList = roleService.list(queryWrapper);
        return ResultUtils.success(roleList);
    }

    /**
     * 分页获取角色列表
     *
     * @param roleQueryRequest
     * @param request
     * @return
     */
    @GetMapping("/list/page")
    public BaseResponse<Page<Role>> listRoleByPage(RoleQueryRequest roleQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        Role RoleQuery = new Role();
        if (roleQueryRequest != null) {
            BeanUtil.copyProperties(roleQueryRequest, RoleQuery);
            current = roleQueryRequest.getCurrent();
            size = roleQueryRequest.getPageSize();
        }
        String roleName = RoleQuery.getRoleName();
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(roleName), "roleName", roleName);
        Page<Role> roleListPage = roleService.page(new Page<>(current, size), queryWrapper);
        return ResultUtils.success(roleListPage);
    }

    // endregion

    /**
     * 获取角色菜单通过角色id
     *
     * @param roleMenuQueryRequest
     * @param request
     * @return
     */
    @GetMapping("/menu")
    public BaseResponse<List<RoleMenuVO>> getRoleMenuByRoleId(RoleMenuQueryRequest roleMenuQueryRequest, HttpServletRequest request) {
        if (roleMenuQueryRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        List<RoleMenuVO> menuOption = roleService.getRoleMenuByRoleId(roleMenuQueryRequest.getId(), true);
        return ResultUtils.success(menuOption);
    }

    /**
     * 更新角色菜单
     *
     * @param roleMenuUpdateRequest
     * @param request
     * @return
     */
    @PostMapping("/updateMenu")
    public BaseResponse<Boolean> updateRoleMenu(@RequestBody RoleMenuUpdateRequest roleMenuUpdateRequest, HttpServletRequest request) {
        // 校验
        if (roleMenuUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        roleMenuService.updateRoleMenu(roleMenuUpdateRequest);

        return ResultUtils.success(true);
    }

    // region 菜单相关


}

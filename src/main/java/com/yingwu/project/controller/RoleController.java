package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.Role.RoleAddRequest;
import com.yingwu.project.model.dto.Role.RoleQueryRequest;
import com.yingwu.project.model.dto.Role.RoleUpdateRequest;
import com.yingwu.project.model.entity.Role;
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

    // region 增删改查

    @PostMapping("/add")
    public BaseResponse<Long> addUser(@RequestBody RoleAddRequest roleAddRequest, HttpServletRequest request) {
        if (roleAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Role role = new Role();
        BeanUtil.copyProperties(roleAddRequest, role);
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
    public BaseResponse<Boolean> deleteUser(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
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
    public BaseResponse<Boolean> updateUser(@RequestBody RoleUpdateRequest roleUpdateRequest, HttpServletRequest request) {
        if (roleUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Role role = new Role();
        BeanUtil.copyProperties(roleUpdateRequest, role);
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
        Role RoleQuery = new Role();
        if (roleQueryRequest != null) {
            BeanUtil.copyProperties(roleQueryRequest, RoleQuery);
        }
        String roleName = RoleQuery.getRoleName();
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
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
    public BaseResponse<Page<Role>> listUserByPage(RoleQueryRequest roleQueryRequest, HttpServletRequest request) {
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
        Page<Role> rolePage = roleService.page(new Page<>(current, size), queryWrapper);
        return ResultUtils.success(rolePage);
    }

    // endregion
}

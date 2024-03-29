package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.ThrowUtils;
import com.yingwu.project.model.dto.usergroup.UserGroupAddRequest;
import com.yingwu.project.model.dto.usergroup.UserGroupQueryRequest;
import com.yingwu.project.model.dto.usergroup.UserGroupUpdateRequest;
import com.yingwu.project.model.entity.UserGroup;
import com.yingwu.project.service.UserGroupService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.constant.OrderConstant.SORT_ORDER_ASC;
import static com.yingwu.project.constant.SysConstant.MAX_PAGE_SIZE;
import static com.yingwu.project.exception.ThrowUtils.throwIf;
import static com.yingwu.project.util.Utils.buildUserGroupTree;

/**
 * 用户组接口
 *
 * @author Dy56
 */
@RestController
@RequestMapping("/userGroup")
public class UserGroupController {

    @Resource
    private UserGroupService userGroupService;

    // region 增删改查

    /**
     * 新增用户组
     *
     * @param userGroupAddRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/add", name = "新增用户组")
    public BaseResponse<Long> addUserGroup(@RequestBody UserGroupAddRequest userGroupAddRequest, HttpServletRequest request) {
        // 校验
        throwIf(userGroupAddRequest == null, ErrorCode.PARAMS_ERROR);

        UserGroup userGroup = new UserGroup();
        BeanUtil.copyProperties(userGroupAddRequest, userGroup);
        userGroupService.validUserGroupInfo(userGroup);

        // 新增
        boolean result = userGroupService.save(userGroup);
        throwIf(!result, ErrorCode.OPERATION_ERROR);

        return ResultUtils.success(userGroup.getId());
    }

    /**
     * 删除用户组
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/delete", name = "删除用户组")
    public BaseResponse<Boolean> deleteUserGroup(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        throwIf(deleteRequest == null || deleteRequest.getId() <= 0, ErrorCode.PARAMS_ERROR);

        // 删除
        boolean result = userGroupService.deleteUserGroup(deleteRequest.getId());

        return ResultUtils.success(result);
    }

    /**
     * 更新用户组
     *
     * @param userGroupUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/update", name = "更新用户组")
    public BaseResponse<Boolean> updateUserGroup(@RequestBody UserGroupUpdateRequest userGroupUpdateRequest, HttpServletRequest request) {
        // 校验
        throwIf(userGroupUpdateRequest == null, ErrorCode.PARAMS_ERROR);

        UserGroup userGroup = new UserGroup();
        BeanUtil.copyProperties(userGroupUpdateRequest, userGroup);
        userGroupService.validUserGroupInfo(userGroup);

        // 更新
        boolean result = userGroupService.updateById(userGroup);
        return ResultUtils.success(result);
    }

    /**
     * 获取用户组列表
     *
     * @param userGroupQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取用户组列表")
    public BaseResponse<List<Tree<String>>> listUserGroup(UserGroupQueryRequest userGroupQueryRequest, HttpServletRequest request) {
        QueryWrapper<UserGroup> queryWrapper = buildUserGroupQueryWrapper(userGroupQueryRequest);
        List<UserGroup> userGroupList = userGroupService.list(queryWrapper);

        // 构建用户组树
        List<Tree<String>> userGroupTree = buildUserGroupTree(userGroupList);

        return ResultUtils.success(userGroupTree);
    }

    /**
     * 分页获取用户组列表
     *
     * @param userGroupQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取用户组列表")
    public BaseResponse<Page<Tree<String>>> listUserGroupByPage(UserGroupQueryRequest userGroupQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        if (userGroupQueryRequest != null) {
            current = userGroupQueryRequest.getCurrent();
            size = userGroupQueryRequest.getPageSize();
            // 限制爬虫
            ThrowUtils.throwIf(size > MAX_PAGE_SIZE, ErrorCode.PARAMS_ERROR);
        }
        QueryWrapper<UserGroup> queryWrapper = buildUserGroupQueryWrapper(userGroupQueryRequest);
        Page<UserGroup> userGroupListPage = userGroupService.page(new Page<>(current, size), queryWrapper);

        // 构建用户组树
        List<UserGroup> userGroupList = userGroupListPage.getRecords();
        List<Tree<String>> userGroupTree = buildUserGroupTree(userGroupList);

        // 构建新的分页类，因为要传递的records为List<Tree<String>>类型
        Page<Tree<String>> newUserGroupListPage = new Page<>(userGroupListPage.getCurrent(), userGroupListPage.getSize(), userGroupListPage.getTotal());
        newUserGroupListPage.setRecords(userGroupTree);

        return ResultUtils.success(newUserGroupListPage);
    }

    /**
     * 构建用户组查询条件
     *
     * @param userGroupQueryRequest
     * @return
     */
    private QueryWrapper<UserGroup> buildUserGroupQueryWrapper(UserGroupQueryRequest userGroupQueryRequest) {
        UserGroup userGroupQuery = new UserGroup();
        if (userGroupQueryRequest != null) {
            BeanUtil.copyProperties(userGroupQueryRequest, userGroupQuery);
        }

        String userGroupName = userGroupQuery.getGroupName();
        userGroupQuery.setGroupName(null);
        QueryWrapper<UserGroup> queryWrapper = new QueryWrapper<>(userGroupQuery);
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(userGroupName), "group_name", userGroupName);

        // 设置排序
        List<String> orderList = new ArrayList<>();
        orderList.add("parent_id");
        if (userGroupQueryRequest.getSortOrder().equals(SORT_ORDER_ASC)) {
            queryWrapper.orderByAsc(orderList);
        } else {
            queryWrapper.orderByDesc(orderList);
        }

        return queryWrapper;
    }

    // endregion

}

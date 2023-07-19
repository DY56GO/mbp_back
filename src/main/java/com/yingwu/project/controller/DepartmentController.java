package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.Department.DepartmentAddRequest;
import com.yingwu.project.model.dto.Department.DepartmentQueryRequest;
import com.yingwu.project.model.dto.Department.DepartmentUpdateRequest;
import com.yingwu.project.model.entity.Department;
import com.yingwu.project.service.DepartmentService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.constant.OrderConstant.SORT_ORDER_ASC;
import static com.yingwu.project.util.Utils.buildDepartmentTree;

/**
 * 部门接口
 * 
 * @author Dy56
 */
@RestController
@RequestMapping("/department")
public class DepartmentController {
    
    @Resource
    private DepartmentService departmentService;

    // region 增删改查

    /**
     * 新增部门
     *
     * @param departmentAddRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/add", name = "新增部门")
    public BaseResponse<Long> addDepartment(@RequestBody DepartmentAddRequest departmentAddRequest, HttpServletRequest request) {
        // 校验
        if (departmentAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Department department = new Department();
        BeanUtil.copyProperties(departmentAddRequest, department);
        departmentService.validDepartmentInfo(department);

        // 新增
        boolean result = departmentService.save(department);
        if (!result) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
        return ResultUtils.success(department.getId());
    }

    /**
     * 删除部门
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/delete", name = "删除部门")
    public BaseResponse<Boolean> deleteDepartment(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        // 删除
        boolean result = departmentService.deleteDepartment(deleteRequest.getId());

        return ResultUtils.success(result);
    }

    /**
     * 更新部门
     *
     * @param departmentUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/update", name = "更新部门")
    public BaseResponse<Boolean> updateDepartment(@RequestBody DepartmentUpdateRequest departmentUpdateRequest, HttpServletRequest request) {
        // 校验
        if (departmentUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Department department = new Department();
        BeanUtil.copyProperties(departmentUpdateRequest, department);
        departmentService.validDepartmentInfo(department);

        // 更新
        boolean result = departmentService.updateById(department);
        return ResultUtils.success(result);
    }

    /**
     * 获取部门列表
     *
     * @param departmentQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取部门列表")
    public BaseResponse<List<Tree<String>>> listDepartment(DepartmentQueryRequest departmentQueryRequest, HttpServletRequest request) {
        QueryWrapper<Department> queryWrapper = buildDepartmentQueryWrapper(departmentQueryRequest);
        List<Department> departmentList = departmentService.list(queryWrapper);

        // 构建部门树
        List<Tree<String>> departmentTree = buildDepartmentTree(departmentList);

        return ResultUtils.success(departmentTree);
    }

    /**
     * 分页获取部门列表
     *
     * @param departmentQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取部门列表")
    public BaseResponse<Page<Tree<String>>> listDepartmentByPage(DepartmentQueryRequest departmentQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        if (departmentQueryRequest != null) {
            current = departmentQueryRequest.getCurrent();
            size = departmentQueryRequest.getPageSize();
        }
        QueryWrapper<Department> queryWrapper = buildDepartmentQueryWrapper(departmentQueryRequest);
        Page<Department> departmentListPage = departmentService.page(new Page<>(current, size), queryWrapper);

        // 构建部门树
        List<Department> departmentList = departmentListPage.getRecords();
        List<Tree<String>> departmentTree = buildDepartmentTree(departmentList);

        // 构建新的分页类，因为要传递的records为List<Tree<String>>类型
        Page<Tree<String>> newDepartmentListPage = new Page<>(departmentListPage.getCurrent(), departmentListPage.getSize(), departmentListPage.getTotal());
        newDepartmentListPage.setRecords(departmentTree);

        return ResultUtils.success(newDepartmentListPage);
    }

    /**
     * 构建部门查询条件
     *
     * @param departmentQueryRequest
     * @return
     */
    private QueryWrapper<Department> buildDepartmentQueryWrapper(DepartmentQueryRequest departmentQueryRequest) {
        Department departmentQuery = new Department();
        if (departmentQueryRequest != null) {
            BeanUtil.copyProperties(departmentQueryRequest, departmentQuery);
        }

        String departmentName = departmentQuery.getDepartmentName();
        departmentQuery.setDepartmentName(null);
        QueryWrapper<Department> queryWrapper = new QueryWrapper<>(departmentQuery);
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(departmentName), "department_name", departmentName);

        // 设置排序
        List<String> orderList = new ArrayList<>();
        orderList.add("parent_id");
        if(departmentQueryRequest.getSortOrder().equals(SORT_ORDER_ASC)){
            queryWrapper.orderByAsc(orderList);
        }else{
            queryWrapper.orderByDesc(orderList);
        }

        return queryWrapper;
    }

    // endregion
    
}

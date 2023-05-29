package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.sysInterface.SysInterfaceQueryRequest;
import com.yingwu.project.model.dto.sysInterface.SysInterfaceUpdateRequest;
import com.yingwu.project.model.entity.SysInterface;
import com.yingwu.project.service.SysInterfaceService;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * 系统接口 接口
 *
 * @author Dy56
 */
@RestController
@RequestMapping("/sysInterface")
public class SysInterfaceController {


    @Resource
    private SysInterfaceService sysInterfaceService;

    // region 刷新、启用和查询

    /**
     * 刷新系统接口
     *
     * @param request
     * @return
     */
    @GetMapping(value = "/refresh", name = "刷新系统接口")
    public BaseResponse<Boolean> refreshSysInterface(HttpServletRequest request) {

        return ResultUtils.success(sysInterfaceService.refreshInterface());

    }

    /**
     * 更新系统接口（仅更新开启和关闭）
     *
     * @param sysInterfaceUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/update", name = "更新系统接口（仅更新开启和关闭）")
    public BaseResponse<Boolean> updateSysInterface(@RequestBody SysInterfaceUpdateRequest sysInterfaceUpdateRequest, HttpServletRequest request) {
        // 校验
        if (sysInterfaceUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        SysInterface sysInterface = new SysInterface();
        BeanUtils.copyProperties(sysInterfaceUpdateRequest, sysInterface);

        // 更新
        boolean result = sysInterfaceService.updateById(sysInterface);

        return ResultUtils.success(result);
    }

    /**
     * 获取系统接口列表
     *
     * @param sysInterfaceQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取系统接口列表")
    public BaseResponse<List<SysInterface>> listSysInterface(SysInterfaceQueryRequest sysInterfaceQueryRequest, HttpServletRequest request) {
        SysInterface sysInterfaceQuery = new SysInterface();
        if (sysInterfaceQueryRequest != null) {
            BeanUtils.copyProperties(sysInterfaceQueryRequest, sysInterfaceQuery);
        }
        String sysInterfaceName = sysInterfaceQuery.getInterfaceName();
        QueryWrapper<SysInterface> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysInterfaceName), "interface_name", sysInterfaceName);
        queryWrapper.orderByAsc("interface_url", "interface_method");

        List<SysInterface> sysInterfaceList = sysInterfaceService.list(queryWrapper);

        return ResultUtils.success(sysInterfaceList);
    }

    /**
     * 分页获取系统接口列表
     *
     * @param sysInterfaceQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取系统接口列表")
    public BaseResponse<Page<SysInterface>> listSysInterfaceByPage(SysInterfaceQueryRequest sysInterfaceQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        SysInterface sysInterfaceQuery = new SysInterface();
        if (sysInterfaceQueryRequest != null) {
            BeanUtil.copyProperties(sysInterfaceQueryRequest, sysInterfaceQuery);
            current = sysInterfaceQueryRequest.getCurrent();
            size = sysInterfaceQueryRequest.getPageSize();
        }
        String interfaceName = sysInterfaceQuery.getInterfaceName();
        QueryWrapper<SysInterface> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(interfaceName), "interface_name", interfaceName);
        queryWrapper.orderByAsc("interface_url", "interface_method");

        Page<SysInterface> sysInterfaceListPage = sysInterfaceService.page(new Page<>(current, size), queryWrapper);

        return ResultUtils.success(sysInterfaceListPage);
    }

    // endregion
}

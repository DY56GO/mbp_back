package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.model.dto.sysinterface.SysInterfaceQueryRequest;
import com.yingwu.project.model.dto.sysinterface.SysInterfaceUpdateRequest;
import com.yingwu.project.model.entity.SysInterface;
import com.yingwu.project.service.SysInterfaceService;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.constant.OrderConstant.SORT_ORDER_ASC;
import static com.yingwu.project.exception.ThrowUtils.throwIf;


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

    // region 更新、启用和查询

    /**
     * 更新系统接口
     *
     * @param request
     * @return
     */
    @GetMapping(value = "/refresh", name = "更新系统接口")
    public BaseResponse<Boolean> updateSysInterface(HttpServletRequest request) {

        return ResultUtils.success(sysInterfaceService.updateInterface());

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
        throwIf(sysInterfaceUpdateRequest == null, ErrorCode.PARAMS_ERROR);

        SysInterface sysInterface = new SysInterface();
        BeanUtils.copyProperties(sysInterfaceUpdateRequest, sysInterface);

        // 更新
        boolean result = sysInterfaceService.updateById(sysInterface);

        // 数据同步
        // 更新系统接口鉴权Redis数据
        sysInterfaceService.updateSysInterfaceRedisAuthData();

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
        QueryWrapper<SysInterface> queryWrapper = buildSysInterfaceQueryWrapper(sysInterfaceQueryRequest);
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
        if (sysInterfaceQueryRequest != null) {
            current = sysInterfaceQueryRequest.getCurrent();
            size = sysInterfaceQueryRequest.getPageSize();
        }
        QueryWrapper<SysInterface> queryWrapper = buildSysInterfaceQueryWrapper(sysInterfaceQueryRequest);

        Page<SysInterface> sysInterfaceListPage = sysInterfaceService.page(new Page<>(current, size), queryWrapper);

        return ResultUtils.success(sysInterfaceListPage);
    }

    /**
     * 构建系统接口查询条件
     *
     * @param sysInterfaceQueryRequest
     * @return
     */
    private QueryWrapper<SysInterface> buildSysInterfaceQueryWrapper(SysInterfaceQueryRequest sysInterfaceQueryRequest) {
        SysInterface sysInterfaceQuery = new SysInterface();
        if (sysInterfaceQueryRequest != null) {
            BeanUtil.copyProperties(sysInterfaceQueryRequest, sysInterfaceQuery);
        }
        String interfaceName = sysInterfaceQuery.getInterfaceName();
        sysInterfaceQuery.setInterfaceName(null);
        QueryWrapper<SysInterface> queryWrapper = new QueryWrapper<>(sysInterfaceQuery);
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(interfaceName), "interface_name", interfaceName);

        // 设置排序
        List<String> orderList = new ArrayList<>();
        orderList.add("interface_url");
        orderList.add("interface_method");
        if (sysInterfaceQueryRequest.getSortOrder().equals(SORT_ORDER_ASC)) {
            queryWrapper.orderByAsc(orderList);
        } else {
            queryWrapper.orderByDesc(orderList);
        }

        return queryWrapper;
    }

    // endregion

}

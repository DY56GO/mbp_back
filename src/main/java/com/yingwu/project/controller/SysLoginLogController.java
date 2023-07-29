package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.ThrowUtils;
import com.yingwu.project.model.dto.sysloginlog.SysLoginLogQueryRequest;
import com.yingwu.project.model.entity.SysLoginLog;
import com.yingwu.project.service.SysLoginLogService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.constant.OrderConstant.SORT_ORDER_ASC;
import static com.yingwu.project.constant.SysConstant.MAX_PAGE_SIZE;

/**
 * 系统登录日志接口
 *
 * @author Dy56
 */
@CrossOrigin
@RestController
@RequestMapping("/sysLoginLog")
public class SysLoginLogController {

    @Resource
    private SysLoginLogService sysLoginLogService;

    // region 查

    /**
     * 获取系统登录日志列表
     *
     * @param sysLoginLogServiceQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取系统登录日志列表")
    public BaseResponse<List<SysLoginLog>> listSysLoginLog(SysLoginLogQueryRequest sysLoginLogServiceQueryRequest, HttpServletRequest request) {
        QueryWrapper<SysLoginLog> queryWrapper = buildSysLoginLogQueryWrapper(sysLoginLogServiceQueryRequest);
        List<SysLoginLog> sysLoginLogList = sysLoginLogService.list(queryWrapper);
        return ResultUtils.success(sysLoginLogList);
    }

    /**
     * 分页获取系统登录日志列表
     *
     * @param sysLoginLogServiceQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取系统登录日志列表")
    public BaseResponse<Page<SysLoginLog>> listSysLoginLogByPage(SysLoginLogQueryRequest sysLoginLogServiceQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        if (sysLoginLogServiceQueryRequest != null) {
            current = sysLoginLogServiceQueryRequest.getCurrent();
            size = sysLoginLogServiceQueryRequest.getPageSize();
            // 限制爬虫
            ThrowUtils.throwIf(size > MAX_PAGE_SIZE, ErrorCode.PARAMS_ERROR);
        }
        QueryWrapper<SysLoginLog> queryWrapper = buildSysLoginLogQueryWrapper(sysLoginLogServiceQueryRequest);

        Page<SysLoginLog> sysLoginLogListPage = sysLoginLogService.page(new Page<>(current, size), queryWrapper);

        return ResultUtils.success(sysLoginLogListPage);
    }

    /**
     * 构建系统登录日志查询条件
     *
     * @param sysLoginLogServiceQueryRequest
     * @return
     */
    private QueryWrapper<SysLoginLog> buildSysLoginLogQueryWrapper(SysLoginLogQueryRequest sysLoginLogServiceQueryRequest) {
        SysLoginLog sysLoginLog = new SysLoginLog();
        if (sysLoginLogServiceQueryRequest != null) {
            BeanUtil.copyProperties(sysLoginLogServiceQueryRequest, sysLoginLog);
        }

        QueryWrapper<SysLoginLog> queryWrapper = new QueryWrapper<>(sysLoginLog);

        // 设置排序
        List<String> orderList = new ArrayList<>();
        orderList.add("gmt_create");
        if (sysLoginLogServiceQueryRequest.getSortOrder().equals(SORT_ORDER_ASC)) {
            queryWrapper.orderByAsc(orderList);
        } else {
            queryWrapper.orderByDesc(orderList);
        }

        return queryWrapper;
    }

    // endregion

}

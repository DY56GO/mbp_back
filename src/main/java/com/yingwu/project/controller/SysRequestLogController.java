package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.ThrowUtils;
import com.yingwu.project.model.dto.sysrequestlog.SysRequestLogQueryRequest;
import com.yingwu.project.model.entity.SysRequestLog;
import com.yingwu.project.service.SysRequestLogService;
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
 * 系统请求日志接口
 *
 * @author Dy56
 */
@CrossOrigin
@RestController
@RequestMapping("/sysRequestLog")
public class SysRequestLogController {

    @Resource
    private SysRequestLogService sysRequestLogService;

    // region 查

    /**
     * 获取系统请求日志列表
     *
     * @param sysRequestLogServiceQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取系统请求日志列表")
    public BaseResponse<List<SysRequestLog>> listSysRequestLog(SysRequestLogQueryRequest sysRequestLogServiceQueryRequest, HttpServletRequest request) {
        QueryWrapper<SysRequestLog> queryWrapper = buildSysRequestLogQueryWrapper(sysRequestLogServiceQueryRequest);
        List<SysRequestLog> sysRequestLogList = sysRequestLogService.list(queryWrapper);
        return ResultUtils.success(sysRequestLogList);
    }

    /**
     * 分页获取系统请求日志列表
     *
     * @param sysRequestLogServiceQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取系统请求日志列表")
    public BaseResponse<Page<SysRequestLog>> listSysRequestLogByPage(SysRequestLogQueryRequest sysRequestLogServiceQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        if (sysRequestLogServiceQueryRequest != null) {
            current = sysRequestLogServiceQueryRequest.getCurrent();
            size = sysRequestLogServiceQueryRequest.getPageSize();
            // 限制爬虫
            ThrowUtils.throwIf(size > MAX_PAGE_SIZE, ErrorCode.PARAMS_ERROR);
        }
        QueryWrapper<SysRequestLog> queryWrapper = buildSysRequestLogQueryWrapper(sysRequestLogServiceQueryRequest);

        Page<SysRequestLog> sysRequestLogListPage = sysRequestLogService.page(new Page<>(current, size), queryWrapper);

        return ResultUtils.success(sysRequestLogListPage);
    }

    /**
     * 构建系统请求日志查询条件
     *
     * @param sysRequestLogServiceQueryRequest
     * @return
     */
    private QueryWrapper<SysRequestLog> buildSysRequestLogQueryWrapper(SysRequestLogQueryRequest sysRequestLogServiceQueryRequest) {
        SysRequestLog sysRequestLog = new SysRequestLog();
        if (sysRequestLogServiceQueryRequest != null) {
            BeanUtil.copyProperties(sysRequestLogServiceQueryRequest, sysRequestLog);
        }

        QueryWrapper<SysRequestLog> queryWrapper = new QueryWrapper<>(sysRequestLog);

        // 设置排序
        List<String> orderList = new ArrayList<>();
        orderList.add("gmt_create");
        if (sysRequestLogServiceQueryRequest.getSortOrder().equals(SORT_ORDER_ASC)) {
            queryWrapper.orderByAsc(orderList);
        } else {
            queryWrapper.orderByDesc(orderList);
        }

        return queryWrapper;
    }

    // endregion

}

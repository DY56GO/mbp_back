package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.trade.TradeAddRequest;
import com.yingwu.project.model.dto.trade.TradeQueryRequest;
import com.yingwu.project.model.dto.trade.TradeUpdateRequest;
import com.yingwu.project.model.entity.Trade;
import com.yingwu.project.service.TradeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 交易接口
 *
 * @author Dy56
 */
@CrossOrigin
@RestController
@RequestMapping("/trade")
public class TradeController {

    @Resource
    private TradeService tradeService;

    // region 增删改查

    /**
     * 新增交易
     *
     * @param tradeAddRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/add", name = "新增交易")
    public BaseResponse<Long> addTrade(@RequestBody TradeAddRequest tradeAddRequest, HttpServletRequest request) {
        // 校验
        if (tradeAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Trade trade = new Trade();
        BeanUtil.copyProperties(tradeAddRequest, trade);
        tradeService.validTradeInfo(trade);

        // 新增
        boolean result = tradeService.save(trade);
        if (!result) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
        return ResultUtils.success(trade.getId());
    }

    /**
     * 删除交易
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/delete", name = "删除交易")
    public BaseResponse<Boolean> deleteTrade(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        // 删除
        boolean result = tradeService.removeById(deleteRequest.getId());

        return ResultUtils.success(result);
    }

    /**
     * 更新交易
     *
     * @param tradeUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/update", name = "更新交易")
    public BaseResponse<Boolean> updateTrade(@RequestBody TradeUpdateRequest tradeUpdateRequest, HttpServletRequest request) {
        // 校验
        if (tradeUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Trade trade = new Trade();
        BeanUtil.copyProperties(tradeUpdateRequest, trade);
        tradeService.validTradeInfo(trade);

        // 更新
        boolean result = tradeService.updateById(trade);
        return ResultUtils.success(result);
    }

    /**
     * 获取交易列表
     *
     * @param tradeQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取交易列表")
    public BaseResponse<List<Trade>> listTrade(TradeQueryRequest tradeQueryRequest, HttpServletRequest request) {
        Trade tradeQuery = new Trade();
        if (tradeQueryRequest != null) {
            BeanUtil.copyProperties(tradeQueryRequest, tradeQuery);
        }
        String tsCode = tradeQuery.getTsCode();
        tradeQuery.setTsCode(null);
        QueryWrapper<Trade> queryWrapper = new QueryWrapper<>(tradeQuery);
        queryWrapper.like(StringUtils.isNotBlank(tsCode), "ts_code", tsCode);
        queryWrapper.orderByDesc("trade_date");

        List<Trade> tradeList = tradeService.list(queryWrapper);

        return ResultUtils.success(tradeList);
    }

    /**
     * 分页获取交易列表
     *
     * @param tradeQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取交易列表")
    public BaseResponse<Page<Trade>> listTradeByPage(TradeQueryRequest tradeQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        Trade tradeQuery = new Trade();
        if (tradeQueryRequest != null) {
            BeanUtil.copyProperties(tradeQueryRequest, tradeQuery);
            current = tradeQueryRequest.getCurrent();
            size = tradeQueryRequest.getPageSize();
        }
        String tsCode = tradeQuery.getTsCode();
        tradeQuery.setTsCode(null);

        QueryWrapper<Trade> queryWrapper = new QueryWrapper<>(tradeQuery);
        queryWrapper.like(StringUtils.isNotBlank(tsCode), "ts_code", tsCode);
        if (tradeQueryRequest.getStartTradeDate() != null) {
            queryWrapper.ge("trade_date", tradeQueryRequest.getStartTradeDate());
        }
        if (tradeQueryRequest.getEndTradeDate() != null) {
            queryWrapper.le("trade_date", tradeQueryRequest.getEndTradeDate());
        }
        queryWrapper.orderByDesc("trade_date");
        Page<Trade> tradeListPage = tradeService.page(new Page<>(current, size), queryWrapper);

        return ResultUtils.success(tradeListPage);
    }

    // endregion

}

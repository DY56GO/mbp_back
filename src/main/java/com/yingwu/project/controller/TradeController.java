package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.alibaba.excel.write.style.column.LongestMatchColumnWidthStyleStrategy;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.exception.ThrowUtils;
import com.yingwu.project.model.dto.trade.TradeAddRequest;
import com.yingwu.project.model.dto.trade.TradeQueryRequest;
import com.yingwu.project.model.dto.trade.TradeUpdateRequest;
import com.yingwu.project.model.entity.Trade;
import com.yingwu.project.model.excel.TradeExcl;
import com.yingwu.project.service.TradeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.constant.OrderConstant.SORT_ORDER_ASC;
import static com.yingwu.project.constant.SysConstant.MAX_PAGE_SIZE;
import static com.yingwu.project.exception.ThrowUtils.throwIf;

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
        throwIf(tradeAddRequest == null, ErrorCode.PARAMS_ERROR);

        Trade trade = new Trade();
        BeanUtil.copyProperties(tradeAddRequest, trade);
        tradeService.validTradeInfo(trade);

        // 新增
        boolean result = tradeService.save(trade);
        throwIf(!result, ErrorCode.OPERATION_ERROR);

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
        throwIf(deleteRequest == null || deleteRequest.getId() <= 0, ErrorCode.PARAMS_ERROR);

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
        throwIf(tradeUpdateRequest == null, ErrorCode.PARAMS_ERROR);

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
        QueryWrapper<Trade> queryWrapper = buildTradeQueryWrapper(tradeQueryRequest);
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
        if (tradeQueryRequest != null) {
            current = tradeQueryRequest.getCurrent();
            size = tradeQueryRequest.getPageSize();
            // 限制爬虫
            ThrowUtils.throwIf(size > MAX_PAGE_SIZE, ErrorCode.PARAMS_ERROR);
        }
        QueryWrapper<Trade> queryWrapper = buildTradeQueryWrapper(tradeQueryRequest);

        Page<Trade> tradeListPage = tradeService.page(new Page<>(current, size), queryWrapper);

        return ResultUtils.success(tradeListPage);
    }

    /**
     * 构建交易查询条件
     *
     * @param tradeQueryRequest
     * @return
     */
    private QueryWrapper<Trade> buildTradeQueryWrapper(TradeQueryRequest tradeQueryRequest) {
        Trade tradeQuery = new Trade();
        if (tradeQueryRequest != null) {
            BeanUtil.copyProperties(tradeQueryRequest, tradeQuery);
        }
        String tsCode = tradeQuery.getTsCode();
        tradeQuery.setTsCode(null);

        QueryWrapper<Trade> queryWrapper = new QueryWrapper<>(tradeQuery);
        if (tradeQueryRequest.getStartTradeDate() != null) {
            queryWrapper.gt("trade_date", tradeQueryRequest.getStartTradeDate());
        }
        if (tradeQueryRequest.getEndTradeDate() != null) {
            queryWrapper.lt("trade_date", tradeQueryRequest.getEndTradeDate());
        }
        queryWrapper.like(StringUtils.isNotBlank(tsCode), "ts_code", tsCode);

        // 设置排序
        List<String> orderList = new ArrayList<>();
        orderList.add("trade_date");
        if (tradeQueryRequest.getSortOrder().equals(SORT_ORDER_ASC)) {
            queryWrapper.orderByAsc(orderList);
        } else {
            queryWrapper.orderByDesc(orderList);
        }

        return queryWrapper;
    }

    // endregion

    /**
     * 交易数据导出
     *
     * @param tradeQueryRequest
     * @param request
     */
    @GetMapping(value = "/excel", name = "交易数据导出")
    public void tradeExcelExport(TradeQueryRequest tradeQueryRequest, HttpServletRequest request) {

        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletResponse response = requestAttributes.getResponse();
        OutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
        } catch (IOException e) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        // 如要循环，请放到循环外，否则会刷新流
        ExcelWriter excelWriter = EasyExcel.write(outputStream).build();

        QueryWrapper<Trade> queryWrapper = buildTradeQueryWrapper(tradeQueryRequest);
        long tradeCount = tradeService.count(queryWrapper);
        long pageCount = tradeCount / MAX_PAGE_SIZE;
        if (tradeCount % MAX_PAGE_SIZE != 0) {
            pageCount = pageCount + 1;
        }

        for (long current = 1; current <= pageCount; current++) {
            Page<Trade> tradeListPage = tradeService.page(new Page<>(current, MAX_PAGE_SIZE), queryWrapper);
            List<Trade> tradeList = tradeListPage.getRecords();
            List<TradeExcl> tradeExclList = new ArrayList<>();
            for (Trade trade : tradeList) {
                TradeExcl tradeExcl = new TradeExcl();
                BeanUtils.copyProperties(trade, tradeExcl);
                tradeExclList.add(tradeExcl);
            }
            WriteSheet writeSheet = EasyExcel.writerSheet(0, "sheet").head(TradeExcl.class).registerWriteHandler(new LongestMatchColumnWidthStyleStrategy()).build();
            // 写数据
            excelWriter.write(tradeExclList, writeSheet);
        }
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");
        // 这里URLEncoder.encode可以防止浏览器端导出excel文件名中文乱码 当然和easyExcel没有关系
        String fileName = null;
        try {
            fileName = URLEncoder.encode("交易数据导出", "UTF-8").replaceAll("\\+", "%20");
        } catch (UnsupportedEncodingException e) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
        response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
        excelWriter.finish();
        try {
            outputStream.flush();
            if (outputStream != null) {
                outputStream.close();
            }
        } catch (IOException e) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
    }

}

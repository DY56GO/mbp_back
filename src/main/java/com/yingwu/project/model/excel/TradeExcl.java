package com.yingwu.project.model.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 交易Excl
 *
 * @author Dy56
 */
@EqualsAndHashCode
@Data
public class TradeExcl {

    /**
     * 交易所市场代码
     */
    @ExcelProperty("交易所市场代码")
    private String tsCode;

    /**
     * 交易日期
     */
    @DateTimeFormat("yyyy年MM月dd日")
    @ExcelProperty("交易日期")
    private Date tradeDate;

    /**
     * 开盘价
     */
    @ExcelProperty("开盘价")
    private BigDecimal openPrice;

    /**
     * 收盘价
     */
    @ExcelProperty("收盘价")
    private BigDecimal closePrice;

    /**
     * 最高价格
     */
    @ExcelProperty("最高价格")
    private BigDecimal highPrice;

    /**
     * 最低价格
     */
    @ExcelProperty("最低价格")
    private BigDecimal lowPrice;

    /**
     * 平均价
     */
    @ExcelProperty("平均价")
    private BigDecimal priceAvg;

    /**
     * 变化的点数
     */
    @ExcelProperty("变化的点数")
    private String pipChange;

    /**
     * 变化的百分比
     */
    @ExcelProperty("变化的百分比")
    private BigDecimal pctChange;

    /**
     * 交易量
     */
    @ExcelProperty("交易量")
    private Integer vol;

    /**
     * 金额
     */
    @ExcelProperty("金额")
    private Long amount;

}
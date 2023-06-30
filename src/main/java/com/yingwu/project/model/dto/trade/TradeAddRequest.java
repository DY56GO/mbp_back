package com.yingwu.project.model.dto.trade;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 交易创建请求
 *
 * @author Dy56
 */
@Data
public class TradeAddRequest implements Serializable {

    /**
     * 交易所市场代码
     */
    private String tsCode;

    /**
     * 交易日期
     */
    private String tradeDate;

    /**
     * 开盘价
     */
    private BigDecimal openPrice;

    /**
     * 收盘价
     */
    private BigDecimal closePrice;

    /**
     * 最高价格
     */
    private BigDecimal highPrice;

    /**
     * 最低价格
     */
    private BigDecimal lowPrice;

    /**
     * 平均价
     */
    private BigDecimal priceAvg;

    /**
     * 变化的点数
     */
    private String pipChange;

    /**
     * 变化的百分比
     */
    private BigDecimal pctChange;

    /**
     * 交易量
     */
    private Integer vol;

    /**
     * 金额
     */
    private Long amount;

    private static final long serialVersionUID = 1L;

}
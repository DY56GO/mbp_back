package com.yingwu.project.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 交易
 *
 * @author Dy56
 * @TableName trade
 */
@TableName(value = "trade")
@Data
public class Trade implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 交易所市场代码
     */
    private String tsCode;

    /**
     * 交易日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd", locale = "zh", timezone = "GMT+8")
    private Date tradeDate;

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

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date gmtCreate;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date gmtModified;

    /**
     * 是否删除（0：否；1：是）
     */
    @TableLogic
    @TableField(value = "is_delete")
    private Integer del;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
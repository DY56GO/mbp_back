package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.Trade;

/**
 * 交易接口服务
 *
 * @author Dy56
 */
public interface TradeService extends IService<Trade> {

    /**
     * 交易信息校验
     *
     * @param trade
     */
    void validTradeInfo(Trade trade);

}

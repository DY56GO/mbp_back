package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.TradeMapper;
import com.yingwu.project.model.entity.Trade;
import com.yingwu.project.service.TradeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author Dy56
 * @description 针对表【trade】的数据库操作Service实现
 */
@Service
public class TradeServiceImpl extends ServiceImpl<TradeMapper, Trade> implements TradeService {

    /**
     * 交易信息校验
     *
     * @param trade
     */
    public void validTradeInfo(Trade trade) {
        if (trade == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String tsCode = trade.getTsCode();
        Date tradeDate = trade.getTradeDate();

        if (StringUtils.isAnyBlank(tsCode) || tradeDate == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
    }
}





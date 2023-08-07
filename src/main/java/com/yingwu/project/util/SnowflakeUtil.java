package com.yingwu.project.util;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 *  雪花工具类
 *
 * @author Dy56
 */
@Component
public class SnowflakeUtil {

    @Value("${snowflake.workerId}")
    private long workerId;

    @Value("${snowflake.datacenterId}")
    private long datacenterId;

    @Bean
    public Snowflake getSnowflakeUtil() {
        return IdUtil.getSnowflake(workerId, datacenterId);
    }
}

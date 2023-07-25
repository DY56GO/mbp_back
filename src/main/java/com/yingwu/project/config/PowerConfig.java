package com.yingwu.project.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 系统功能配置
 *
 * @author Dy56
 */
@Component
@ConfigurationProperties(prefix = "powerconfig")
@Data
public class PowerConfig {
    private boolean interfaceAuth;
    private boolean logRecords;
}


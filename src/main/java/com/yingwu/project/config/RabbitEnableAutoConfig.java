package com.yingwu.project.config;

import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;

/**
 * RabbitMQ是否启用配置
 *
 * @author Dy56
 */
@Configuration
@ConditionalOnProperty(prefix = "spring.rabbitmq", name = "enabled", havingValue = "true")
public class RabbitEnableAutoConfig extends RabbitAutoConfiguration {
}

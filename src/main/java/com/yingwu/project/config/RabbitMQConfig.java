package com.yingwu.project.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

import static com.yingwu.project.constant.RabbitMQConstant.LONGIN_LOG_QUEUE;
import static com.yingwu.project.constant.RabbitMQConstant.REQUEST_LOG_QUEUE;

/**
 * RabbitMQ配置
 *
 * @author Dy56
 */
@Configuration
public class RabbitMQConfig {

    @Resource
    private PowerConfig powerConfig;

    /**
     * 创建登录日志队列
     *
     * @return
     */
    @Bean
    public Queue loginLogQueue() {
        if (powerConfig.isLoginLogRecords()) {
            return new Queue(LONGIN_LOG_QUEUE, true);
        } else {
            return null;
        }
    }

    @Bean
    public FanoutExchange loginLogExchange() {
        if (powerConfig.isLoginLogRecords()) {
            return new FanoutExchange(LONGIN_LOG_QUEUE, true, false);
        } else {
            return null;
        }
    }

    @Bean
    public Binding bindingLoginLogDirect() {
        if (powerConfig.isLoginLogRecords()) {
            return BindingBuilder.bind(loginLogQueue()).to(loginLogExchange());
        } else {
            return null;
        }
    }

    /**
     * 创建请求日志队列
     *
     * @return
     */
    @Bean
    public Queue requestLogQueue() {
        if (powerConfig.isRequestLogRecords()) {
            return new Queue(REQUEST_LOG_QUEUE, true);
        } else {
            return null;
        }
    }

    @Bean
    public FanoutExchange requestExchange() {
        if (powerConfig.isRequestLogRecords()) {
            return new FanoutExchange(REQUEST_LOG_QUEUE, true, false);
        } else {
            return null;
        }
    }

    @Bean
    public Binding bindingRequestDirect() {
        if (powerConfig.isRequestLogRecords()) {
            return BindingBuilder.bind(requestLogQueue()).to(requestExchange());
        } else {
            return null;
        }
    }

}
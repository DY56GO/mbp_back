package com.yingwu.project.consumer;

import com.google.gson.Gson;
import com.yingwu.project.model.entity.SysRequestLog;
import com.yingwu.project.service.SysRequestLogService;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

import static com.yingwu.project.constant.RabbitMQConstant.REQUEST_LOG_QUEUE;

/**
 * 请求日志消息消费者
 *
 * @author Dy56
 */
@Component
@RabbitListener(queues = REQUEST_LOG_QUEUE)
public class RequestLogMessageConsumer {

    @Resource
    private SysRequestLogService sysRequestLogService;

    @RabbitHandler
    public void handlerRequestLogMessage(String message) {
        Gson gson = new Gson();
        SysRequestLog sysRequestLog = gson.fromJson(message, SysRequestLog.class);

        // 日志信息写入数据库库
        sysRequestLogService.save(sysRequestLog);
    }

}

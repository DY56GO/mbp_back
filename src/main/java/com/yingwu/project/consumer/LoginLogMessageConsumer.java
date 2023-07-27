package com.yingwu.project.consumer;

import com.google.gson.Gson;
import com.yingwu.project.model.entity.SysLoginLog;
import com.yingwu.project.service.SysLoginLogService;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

import static com.yingwu.project.constant.RabbitMQConstant.LONGIN_LOG_QUEUE;

/**
 * 登录日志消息消费者
 *
 * @author Dy56
 */
@Component
@RabbitListener(queues = LONGIN_LOG_QUEUE)
public class LoginLogMessageConsumer {

    @Resource
    private SysLoginLogService sysLoginLogService;

    @RabbitHandler
    public void handlerLoginLogMessage(String message) {
        Gson gson = new Gson();
        SysLoginLog sysLoginLog = gson.fromJson(message, SysLoginLog.class);

        // 日志信息写入数据库库
        sysLoginLogService.save(sysLoginLog);
    }

}

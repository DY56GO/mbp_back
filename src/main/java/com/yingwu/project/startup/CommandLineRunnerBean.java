package com.yingwu.project.startup;

import com.yingwu.project.config.PowerConfig;
import com.yingwu.project.mapper.RoleSysInterfaceMapper;
import com.yingwu.project.model.vo.SysInterfaceRoleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import javax.annotation.Resource;
import java.util.*;

import static com.yingwu.project.constant.SysConstant.SYS_INTERFACE_AUTH_KEY_REDIS;

/**
 * 系统启动加载
 *
 * @author Dy56
 */
@Component
@Slf4j
public class CommandLineRunnerBean implements CommandLineRunner {

    @Resource
    private PowerConfig powerConfig;

    @Resource
    private RoleSysInterfaceMapper roleSysInterfaceMapper;

    @Resource
    private RedisTemplate redisTemplate;

    @Override
    public void run(String... args) {
        log.info("loading system initial data start");
        // 计时
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        // 加载角色接口信息到Redis中，用于系统接口鉴权
        if (powerConfig.isInterfaceAuth()) {
            // 1.查询接口角色
            List<SysInterfaceRoleVO> sysInterfaceRoleList = roleSysInterfaceMapper.getSysInterfaceRole();

            // 2.构建存入Redis的数据
            Map<String, Set<String>> sysInterfaceAuthMap = new HashMap<>(512);
            for (SysInterfaceRoleVO sysInterfaceRole : sysInterfaceRoleList) {
                String key = sysInterfaceRole.getInterfaceMethod() + "," + sysInterfaceRole.getInterfaceUrl();
                Set<String> value = new HashSet<>();
                value.add(sysInterfaceRole.getRoleIdentity());

                sysInterfaceAuthMap.put(key, value);
            }

            // 3.写入Redis中
            redisTemplate.opsForHash().putAll(SYS_INTERFACE_AUTH_KEY_REDIS, sysInterfaceAuthMap);
        }

        // 计时结束
        stopWatch.stop();
        long totalTimeMillis = stopWatch.getTotalTimeMillis();
        log.info("loading system initial data end, cost: {}ms", totalTimeMillis);
    }

}

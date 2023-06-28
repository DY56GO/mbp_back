package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.SysInterface;

import java.util.Map;
import java.util.Set;

/**
 * 系统接口服务
 *
 * @author Dy56
 */
public interface SysInterfaceService extends IService<SysInterface> {

    /**
     * 更新系统接口
     *
     * @return
     */
    boolean updateInterface();

    /**
     * 更新系统接口鉴权Redis数据
     *
     * @return
     */
    boolean updateSysInterfaceRedisAuthData();

    /**
     * 构建系统接口鉴权数据
     *
     * @return
     */
    public Map<String, Set<String>> buildSysInterfaceAuthMap();

}

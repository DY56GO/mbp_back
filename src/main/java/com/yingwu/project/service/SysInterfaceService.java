package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.SysInterface;

/**
 * 系统接口服务
 *
 * @author Dy56
 */
public interface SysInterfaceService extends IService<SysInterface> {

    /**
     * 刷新系统接口
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

}

package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.dto.role.RoleSysInterfaceUpdateRequest;
import com.yingwu.project.model.entity.RoleSysInterface;

/**
 * 角色系统接口服务
 *
 * @author Dy56
 */
public interface RoleSysInterfaceService extends IService<RoleSysInterface> {

    /**
     * 更新角色系统接口
     *
     * @param roleSysInterfaceUpdateRequest
     * @return
     */
    boolean updateRoleSysInterface(RoleSysInterfaceUpdateRequest roleSysInterfaceUpdateRequest);
}

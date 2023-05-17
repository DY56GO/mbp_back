package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.RoleMapper;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.service.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * @author Dy56
 * @description 针对表【role】的数据库操作Service实现
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Override
    public void validRole(Role role) {
        if (role == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String roleName = role.getRoleName();
        String roleIdentity = role.getRoleIdentity();

        if (StringUtils.isAnyBlank(roleName, roleIdentity)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
    }
}





package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.mapper.RoleMapper;
import com.yingwu.project.model.entity.Role;
import com.yingwu.project.service.RoleService;
import org.springframework.stereotype.Service;

/**
 * @author Dy56
 * @description 针对表【role】的数据库操作Service实现
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}





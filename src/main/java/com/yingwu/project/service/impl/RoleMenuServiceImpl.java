package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.RoleMenuMapper;
import com.yingwu.project.model.dto.role.RoleMenuUpdateRequest;
import com.yingwu.project.model.entity.RoleMenu;
import com.yingwu.project.service.RoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
* @author Dy56
* @description 针对表【roleMenu】的数据库操作Service实现
*/
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements RoleMenuService{

    /**
     * 更新角色菜单
     *
     * @param roleMenuUpdateRequest
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean updateRoleMenu(RoleMenuUpdateRequest roleMenuUpdateRequest) {
        // 校验
        if (roleMenuUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        Long roleId = roleMenuUpdateRequest.getId();
        List<Long> addMenuList = roleMenuUpdateRequest.getAddMenuList();
        List<Long> deleteMenuList = roleMenuUpdateRequest.getDeleteMenuList();

        if (roleId == null || addMenuList == null || deleteMenuList == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }

        // 组装新增角色菜单列表和删除角色菜单列表
        List<RoleMenu> addRoleMenuList = new ArrayList<>();
        List<RoleMenu> deleteRoleMenuList = new ArrayList<>();

        // 角色新增菜单列表
        for (Long menuId : roleMenuUpdateRequest.getAddMenuList()) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            addRoleMenuList.add(roleMenu);
        }

        // 角色删除菜单列表
        for (Long menuId : roleMenuUpdateRequest.getDeleteMenuList()) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            deleteRoleMenuList.add(roleMenu);
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 批量新增
            saveBatch(addRoleMenuList, 300);

            // 批量删除
            int batchSize = 0;
            List<RoleMenu> deleteRoleMenuBatch = new ArrayList<>();
            for (RoleMenu roleMenu : deleteRoleMenuList) {
                batchSize ++;
                deleteRoleMenuBatch.add(roleMenu);
                if (batchSize == 300 || batchSize == deleteRoleMenuList.size()) {
                    getBaseMapper().removeBatch(deleteRoleMenuBatch);
                    batchSize = 0;
                    deleteRoleMenuBatch.clear();
                }
            }
        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }

}





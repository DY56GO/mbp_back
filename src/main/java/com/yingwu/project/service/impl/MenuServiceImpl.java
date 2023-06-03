package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.MenuMapper;
import com.yingwu.project.mapper.RoleMenuMapper;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.service.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Dy56
 * @description 针对表【menu】的数据库操作Service实现
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Resource
    private RoleMenuMapper roleMenuMapper;

    /**
     * 菜单信息校验
     *
     * @param menu
     */

    public void validMenuInfo(Menu menu) {
        if (menu == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String menuTitle = menu.getMenuTitle();
        String routePath = menu.getRoutePath();

        if (StringUtils.isAnyBlank(menuTitle, routePath)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
    }

    /**
     * 删除菜单
     *
     * @param menuId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMenu(Long menuId) {
        // 判断是否含有子菜单
        Menu menu = new Menu();
        menu.setParentId(menuId);
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>(menu);
        long count = count(queryWrapper);
        if (count != 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "存在子菜单");
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 删除
            removeById(menuId);

            // 数据同步
            // 删除角色菜单数据
            List<Long> deleteMenuIdBatch = new ArrayList<>();
            deleteMenuIdBatch.add(menuId);
            roleMenuMapper.removeBatchByMenuIdList(deleteMenuIdBatch);

        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }

}





package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.menu.MenuAddRequest;
import com.yingwu.project.model.dto.menu.MenuQueryRequest;
import com.yingwu.project.model.dto.menu.MenuUpdateRequest;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.service.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static com.yingwu.project.util.Utils.buildMenuTree;


/**
 * 菜单接口
 *
 * @author Dy56
 */
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Resource
    private MenuService menuService;

    // region 增删改查

    /**
     * 新增菜单
     *
     * @param menuAddRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/add", name = "新增菜单")
    public BaseResponse<Long> addMenu(@RequestBody MenuAddRequest menuAddRequest, HttpServletRequest request) {
        // 校验
        if (menuAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuAddRequest, menu);
        menuService.validMenuInfo(menu);

        // 新增
        boolean result = menuService.save(menu);
        if (!result) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }
        return ResultUtils.success(menu.getId());
    }

    /**
     * 删除菜单
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/delete", name = "删除菜单")
    public BaseResponse<Boolean> deleteMenu(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        // 删除
        boolean result = menuService.deleteMenu(deleteRequest.getId());

        return ResultUtils.success(result);
    }

    /**
     * 更新菜单
     *
     * @param menuUpdateRequest
     * @param request
     * @return
     */
    @PostMapping(value = "/update", name = "更新菜单")
    public BaseResponse<Boolean> updateMenu(@RequestBody MenuUpdateRequest menuUpdateRequest, HttpServletRequest request) {
        // 校验
        if (menuUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuUpdateRequest, menu);
        menuService.validMenuInfo(menu);

        // 更新
        boolean result = menuService.updateById(menu);
        return ResultUtils.success(result);
    }

    /**
     * 获取菜单列表
     *
     * @param menuQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list", name = "获取菜单列表")
    public BaseResponse<List<Tree<String>>> listMenu(MenuQueryRequest menuQueryRequest, HttpServletRequest request) {
        Menu menuQuery = new Menu();
        if (menuQueryRequest != null) {
            BeanUtil.copyProperties(menuQueryRequest, menuQuery);
        }
        String menuTitle = menuQuery.getMenuTitle();
        menuQuery.setMenuTitle(null);
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>(menuQuery);
        queryWrapper.like(StringUtils.isNotBlank(menuTitle), "menu_title", menuTitle);
        queryWrapper.orderByAsc("parent_id");

        List<Menu> menuList = menuService.list(queryWrapper);
        List<Tree<String>> menuTree = buildMenuTree(menuList);

        return ResultUtils.success(menuTree);
    }

    /**
     * 分页获取菜单列表
     *
     * @param menuQueryRequest
     * @param request
     * @return
     */
    @GetMapping(value = "/list/page", name = "分页获取菜单列表")
    public BaseResponse<Page<Tree<String>>> listUserByPage(MenuQueryRequest menuQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        Menu menuQuery = new Menu();
        if (menuQueryRequest != null) {
            BeanUtil.copyProperties(menuQueryRequest, menuQuery);
            current = menuQueryRequest.getCurrent();
            size = menuQueryRequest.getPageSize();
        }
        String menuTitle = menuQuery.getMenuTitle();
        menuQuery.setMenuTitle(null);
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>(menuQuery);
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(menuTitle), "menu_title", menuTitle);
        queryWrapper.orderByAsc("parent_id");
        Page<Menu> menuListPage = menuService.page(new Page<>(current, size), queryWrapper);

        List<Menu> menuList = menuListPage.getRecords();
        List<Tree<String>> menuTree = buildMenuTree(menuList);

        // 构建新的分页类，因为要传递的records为List<Tree<String>>类型
        Page<Tree<String>> newMenuListPage = new Page<>(menuListPage.getCurrent(), menuListPage.getSize(), menuListPage.getTotal());
        newMenuListPage.setRecords(menuTree);

        return ResultUtils.success(newMenuListPage);
    }

    // endregion
}

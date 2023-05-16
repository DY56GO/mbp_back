package com.yingwu.project.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yingwu.project.common.BaseResponse;
import com.yingwu.project.common.DeleteRequest;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.common.ResultUtils;
import com.yingwu.project.constant.CommonConstant;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.model.dto.menu.MenuAddRequest;
import com.yingwu.project.model.dto.menu.MenuQueryRequest;
import com.yingwu.project.model.dto.menu.MenuUpdateRequest;
import com.yingwu.project.model.dto.user.UserUpdateRequest;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.model.entity.Post;
import com.yingwu.project.model.entity.User;
import com.yingwu.project.model.vo.UserVO;
import com.yingwu.project.service.MenuService;
import lombok.val;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


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

    @PostMapping("/add")
    public BaseResponse<Long> addUser(@RequestBody MenuAddRequest menuAddRequest, HttpServletRequest request) {
        if (menuAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuAddRequest, menu);
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
    @PostMapping("/delete")
    public BaseResponse<Boolean> deleteUser(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        // 判断是否含有子菜单
        Menu menu = new Menu();
        menu.setParentId(deleteRequest.getId());
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>(menu);
        long count = menuService.count(queryWrapper);
        if (count != 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "存在子菜单");
        }

        boolean result = menuService.removeById(deleteRequest.getId());
        return ResultUtils.success(result);
    }

    /**
     * 更新菜单
     *
     * @param menuUpdateRequest
     * @param request
     * @return
     */
    @PostMapping("/update")
    public BaseResponse<Boolean> updateUser(@RequestBody MenuUpdateRequest menuUpdateRequest, HttpServletRequest request) {
        if (menuUpdateRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuUpdateRequest, menu);
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
    @GetMapping("/list")
    public BaseResponse<List<Tree<String>>> listMenu(MenuQueryRequest menuQueryRequest, HttpServletRequest request) {
        Menu MenuQuery = new Menu();
        if (menuQueryRequest != null) {
            BeanUtil.copyProperties(menuQueryRequest, MenuQuery);
        }
        String menuName = MenuQuery.getMenuName();
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(menuName), "menuName", menuName);
        queryWrapper.orderByAsc("parentId");
        List<Menu> menuList = menuService.list(queryWrapper);

        // 获取当前list中的根节点
        Long parentId = 0L;
        if (!menuList.isEmpty()) {
            parentId = menuList.stream().min((Comparator.comparing(Menu::getParentId))).get().getParentId();
        }

        // 树形结构转换
        TreeNodeConfig treeNodeConfig = new TreeNodeConfig();
        treeNodeConfig.setIdKey("id");
        treeNodeConfig.setParentIdKey("parentId");

        List<TreeNode<String>> treeNodes = menuList.stream()
                .map(menu -> {
                    TreeNode<String> node = new TreeNode<>();
                    // 下面四个属性是树型结构必有的属性
                    node.setId(String.valueOf(menu.getId()));
                    node.setName(menu.getMenuName());
                    node.setParentId(String.valueOf(menu.getParentId()));
                    node.setWeight(menu.getMenuSort());
                    // 以下为扩展属性
                    Map<String, Object> extra = new HashMap<>();
                    extra.put("menuName", menu.getMenuName());
                    extra.put("menuIcon", menu.getMenuIcon());
                    extra.put("routeUrl", menu.getRouteUrl());
                    extra.put("componentName", menu.getComponentName());
                    extra.put("componentPath", menu.getComponentPath());
                    extra.put("description", menu.getDescription());
                    extra.put("hidden", menu.getIsHidden());
                    extra.put("menuSort", menu.getMenuSort());
                    node.setExtra(extra);
                    return node;
                }).collect(Collectors.toList());

        List<Tree<String>> result = TreeUtil.build(treeNodes, parentId.toString());

        return ResultUtils.success(result);
    }

    /**
     * 分页获取菜单列表
     *
     * @param menuQueryRequest
     * @param request
     * @return
     */
    @GetMapping("/list/page")
    public BaseResponse<Page<Tree<String>>> listUserByPage(MenuQueryRequest menuQueryRequest, HttpServletRequest request) {
        long current = 1;
        long size = 10;
        Menu MenuQuery = new Menu();
        if (menuQueryRequest != null) {
            BeanUtil.copyProperties(menuQueryRequest, MenuQuery);
            current = menuQueryRequest.getCurrent();
            size = menuQueryRequest.getPageSize();
        }
        String menuName = MenuQuery.getMenuName();
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(menuName), "menuName", menuName);
        queryWrapper.orderByAsc("parentId");
        Page<Menu> menuPage = menuService.page(new Page<>(current, size), queryWrapper);

        List<Menu> menuList = menuPage.getRecords();

        // 获取当前list中的根节点
        Long parentId = 0L;
        if (!menuList.isEmpty()) {
            parentId = menuList.stream().min((Comparator.comparing(Menu::getParentId))).get().getParentId();
        }

        // 树形结构转换
        TreeNodeConfig treeNodeConfig = new TreeNodeConfig();
        treeNodeConfig.setIdKey("id");
        treeNodeConfig.setParentIdKey("parentId");

        List<TreeNode<String>> treeNodes = menuList.stream()
                .map(menu -> {
                    TreeNode<String> node = new TreeNode<>();
                    // 下面四个属性是树型结构必有的属性
                    node.setId(String.valueOf(menu.getId()));
                    node.setName(menu.getMenuName());
                    node.setParentId(String.valueOf(menu.getParentId()));
                    node.setWeight(menu.getMenuSort());
                    // 以下为扩展属性
                    Map<String, Object> extra = new HashMap<>();
                    extra.put("menuName", menu.getMenuName());
                    extra.put("menuIcon", menu.getMenuIcon());
                    extra.put("routeUrl", menu.getRouteUrl());
                    extra.put("componentName", menu.getComponentName());
                    extra.put("componentPath", menu.getComponentPath());
                    extra.put("description", menu.getDescription());
                    extra.put("hidden", menu.getIsHidden());
                    extra.put("menuSort", menu.getMenuSort());
                    node.setExtra(extra);
                    return node;
                }).collect(Collectors.toList());

        List<Tree<String>> result = TreeUtil.build(treeNodes, parentId.toString());

        // 构建新的分页类，因为要传递的records为List<Tree<String>>类型
        Page<Tree<String>> newMenuPage = new Page<Tree<String>>(menuPage.getCurrent(), menuPage.getSize(), menuPage.getTotal());
        newMenuPage.setRecords(result);

        return ResultUtils.success(newMenuPage);
    }

    // endregion
}

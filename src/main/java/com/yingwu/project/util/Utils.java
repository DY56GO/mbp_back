package com.yingwu.project.util;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import com.yingwu.project.model.entity.Department;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.model.vo.UserMenuVO;
import org.springframework.util.DigestUtils;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.yingwu.project.constant.PasswordConstant.SALT;

/**
 * 工具类
 *
 * @author Dy56
 */
public class Utils {

    /**
     * 加密密码
     *
     * @param password
     * @return
     */
    public static String encryptPassword(String password) {
        return DigestUtils.md5DigestAsHex((SALT + password).getBytes());
    }

    /**
     * 构建菜单树
     *
     * @param menuList
     * @return
     */
    public static List<Tree<String>> buildMenuTree(List<Menu> menuList) {
        // 获取当前list中的根节点
        Long parentId = 0L;
        if (!menuList.isEmpty()) {
            parentId = menuList.stream().min((Comparator.comparing(Menu::getParentId))).get().getParentId();
        }

        // 树形结构构建
        TreeNodeConfig treeNodeConfig = new TreeNodeConfig();
        treeNodeConfig.setIdKey("id");
        treeNodeConfig.setParentIdKey("parentId");

        List<TreeNode<String>> treeNodeList = menuList.stream()
                .map(menu -> {
                    TreeNode<String> node = new TreeNode<>();
                    // 下面四个属性是树型结构必有的属性
                    node.setId(String.valueOf(menu.getId()));
                    node.setName(menu.getMenuTitle());
                    node.setParentId(String.valueOf(menu.getParentId()));
                    node.setWeight(menu.getMenuSort());
                    // 以下为扩展属性
                    Map<String, Object> extra = new HashMap<>(16);
                    extra.put("menuTitle", menu.getMenuTitle());
                    extra.put("menuIcon", menu.getMenuIcon());
                    extra.put("routePath", menu.getRoutePath());
                    extra.put("componentName", menu.getComponentName());
                    extra.put("componentPath", menu.getComponentPath());
                    extra.put("redirect", menu.getRedirect());
                    extra.put("description", menu.getDescription());
                    extra.put("hidden", menu.getHidden());
                    extra.put("menuSort", menu.getMenuSort());
                    node.setExtra(extra);
                    return node;
                }).collect(Collectors.toList());

        List<Tree<String>> result = TreeUtil.build(treeNodeList, parentId.toString());

        return result;
    }

    /**
     * 构建用户路由树
     *
     * @param menuList
     * @return
     */
    public static List<Tree<String>> buildUserRouter(List<UserMenuVO> menuList) {
        // 获取当前list中的根节点
        Long parentId = 0L;
        if (!menuList.isEmpty()) {
            parentId = menuList.stream().min((Comparator.comparing(UserMenuVO::getParentId))).get().getParentId();
        }

        // 树形结构构建
        TreeNodeConfig treeNodeConfig = new TreeNodeConfig();
        treeNodeConfig.setIdKey("id");
        treeNodeConfig.setParentIdKey("parentId");

        List<TreeNode<String>> treeNodeList = menuList.stream()
                .map(menu -> {
                    TreeNode<String> node = new TreeNode<>();
                    // 下面四个属性是树型结构必有的属性
                    node.setId(String.valueOf(menu.getId()));
                    node.setName(menu.getMenuTitle());
                    node.setParentId(String.valueOf(menu.getParentId()));
                    node.setWeight(menu.getMenuSort());
                    // 以下为扩展属性
                    Map<String, Object> extra = new HashMap<>(16);
                    extra.put("path", menu.getRoutePath());
                    extra.put("component", menu.getComponentPath());
                    extra.put("redirect", menu.getRedirect());
                    extra.put("name", menu.getComponentName());
                    extra.put("title", menu.getMenuTitle());
                    extra.put("icon", menu.getMenuIcon());
                    node.setExtra(extra);
                    return node;
                }).collect(Collectors.toList());

        List<Tree<String>> result = TreeUtil.build(treeNodeList, parentId.toString());

        return result;
    }

    /**
     * 构建部门树
     *
     * @param departmentList
     * @return
     */
    public static List<Tree<String>> buildDepartmentTree(List<Department> departmentList) {
        // 获取当前list中的根节点
        Long parentId = 0L;
        if (!departmentList.isEmpty()) {
            parentId = departmentList.stream().min((Comparator.comparing(Department::getParentId))).get().getParentId();
        }

        // 树形结构构建
        TreeNodeConfig treeNodeConfig = new TreeNodeConfig();
        treeNodeConfig.setIdKey("id");
        treeNodeConfig.setParentIdKey("parentId");

        List<TreeNode<String>> treeNodeList = departmentList.stream()
                .map(department -> {
                    TreeNode<String> node = new TreeNode<>();
                    // 下面四个属性是树型结构必有的属性
                    node.setId(String.valueOf(department.getId()));
                    node.setName(department.getDepartmentName());
                    node.setParentId(String.valueOf(department.getParentId()));
                    node.setWeight(department.getDepartmentSort());
                    // 以下为扩展属性
                    Map<String, Object> extra = new HashMap<>(16);
                    extra.put("departmentName", department.getDepartmentName());
                    extra.put("description", department.getDescription());
                    extra.put("usingStart", department.getUsingStart());
                    extra.put("departmentSort", department.getDepartmentSort());
                    node.setExtra(extra);
                    return node;
                }).collect(Collectors.toList());

        List<Tree<String>> result = TreeUtil.build(treeNodeList, parentId.toString());

        return result;
    }

}

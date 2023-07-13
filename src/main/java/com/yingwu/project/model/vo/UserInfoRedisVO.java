package com.yingwu.project.model.vo;

import cn.hutool.core.lang.tree.Tree;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Redis用户信息视图
 *
 * @author Dy56
 */
@Data
public class UserInfoRedisVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * token
     */
    private String token;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 用户账号
     */
    private String userAccount;

    /**
     * 用户头像
     */
    private String userAvatar;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 用户角色列表
     */
    private List<UserRoleVO> userRoleList;

    /**
     * 用户菜单树
     */
    private List<Tree<String>> userMenuTree;

    private static final long serialVersionUID = 1L;

}
package com.yingwu.project.model.vo;

import cn.hutool.core.lang.tree.Tree;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 前台用户信息视图
 *
 * @author Dy56
 */
@Data
public class UserInfoFrontVO implements Serializable {

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
     * 用户组id
     */
    private Long userGroupId;

    /**
     * 用户组名称
     */
    private String userGroupName;

    /**
     * 用户菜单树
     */
    private List<Tree<String>> userMenuTree;

    private static final long serialVersionUID = 1L;

}
/*
 Navicat Premium Data Transfer

 Source Server         : 本地开发数据库
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 192.168.10.22:3306
 Source Schema         : mbp

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 04/06/2023 12:37:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT 0 COMMENT '父id',
  `menu_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `menu_icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `route_path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由path',
  `component_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `component_path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `redirect` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_hidden` tinyint NOT NULL DEFAULT 0 COMMENT '是否隐藏（0：否；1：是）',
  `menu_sort` double NULL DEFAULT NULL COMMENT '菜单排序',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_menu_menu_name`(`menu_title` ASC) USING BTREE,
  UNIQUE INDEX `pk_menu_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '用户中心', 'el-icon-user', '/user', NULL, NULL, '/use', '用户中心', 0, 1, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (2, 1, '我的信息', 'el-icon-user-solid', 'account', 'Account', '/user/account', '', '我的信息', 0, 1, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (3, 1, '修改密码', 'el-icon-lock', 'password', 'Password', '/user/password', '', '修改密码', 0, 2, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (4, 0, '系统管理', 'el-icon-setting', '/settings', NULL, NULL, '/settings', '系统管理', 0, 2, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (5, 4, '菜单管理', 'el-icon-menu', 'menu', 'Menu', '/settings/menu', '', '菜单管理', 0, 3, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (6, 4, '角色管理', 'el-icon-s-custom', 'role', 'Role', '/settings/role', '', '角色管理', 0, 2, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (7, 4, '用户管理', 'el-icon-notebook-1', 'user', 'User', '/settings/user', NULL, '用户管理', 0, 1, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (8, 4, '接口管理', 'el-icon-link', 'sysInterface', 'SysInterface', '/settings/sysInterface', NULL, '接口管理', 0, 4, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_identity` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `is_using` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用（0：否；1：是）',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_roleIdentity`(`role_identity` ASC) USING BTREE,
  UNIQUE INDEX `pk_role_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 'admin', 1, '管理员', '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `role` VALUES (2, '用户', 'user', 1, '用户', '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `role` VALUES (3, '其他', 'other', 1, '其他', '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_menu_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_role_menu_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 1, '2023-06-02 13:13:43', '2023-06-02 13:13:56');
INSERT INTO `role_menu` VALUES (2, 1, 2, '2023-06-02 13:13:53', '2023-06-02 13:13:53');
INSERT INTO `role_menu` VALUES (3, 1, 3, '2023-06-02 13:14:01', '2023-06-02 13:14:15');
INSERT INTO `role_menu` VALUES (4, 1, 4, '2023-06-02 13:14:09', '2023-06-02 13:14:09');
INSERT INTO `role_menu` VALUES (5, 1, 5, '2023-06-02 13:14:20', '2023-06-02 13:14:20');
INSERT INTO `role_menu` VALUES (6, 1, 6, '2023-06-02 13:14:26', '2023-06-02 13:14:26');
INSERT INTO `role_menu` VALUES (7, 1, 7, '2023-06-02 13:14:31', '2023-06-02 13:14:31');
INSERT INTO `role_menu` VALUES (8, 1, 8, '2023-06-02 13:14:36', '2023-06-02 13:14:36');
INSERT INTO `role_menu` VALUES (9, 2, 1, '2023-06-02 14:57:53', '2023-06-02 14:57:53');
INSERT INTO `role_menu` VALUES (10, 2, 2, '2023-06-02 14:57:53', '2023-06-02 14:57:53');
INSERT INTO `role_menu` VALUES (11, 2, 3, '2023-06-02 14:57:53', '2023-06-02 14:57:53');

-- ----------------------------
-- Table structure for role_sys_interface
-- ----------------------------
DROP TABLE IF EXISTS `role_sys_interface`;
CREATE TABLE `role_sys_interface`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `interface_id` bigint NOT NULL COMMENT '接口id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_sys_interface_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_role_sys_interface_interface_id`(`interface_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_sys_interface
-- ----------------------------
INSERT INTO `role_sys_interface` VALUES (1, 1, 7, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (2, 1, 2, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (3, 1, 28, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (4, 1, 12, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (5, 1, 26, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (6, 1, 36, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (7, 1, 20, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (8, 1, 30, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (9, 1, 6, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (10, 1, 14, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (11, 1, 19, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (12, 1, 25, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (13, 1, 32, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (14, 1, 4, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (15, 1, 3, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (16, 1, 27, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (17, 1, 5, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (18, 1, 9, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (19, 1, 35, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (20, 1, 16, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (21, 1, 33, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (22, 1, 29, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (23, 1, 21, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (25, 1, 1, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (27, 1, 22, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (28, 1, 13, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (29, 1, 18, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (30, 1, 8, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (31, 1, 11, '2023-06-02 14:58:11', '2023-06-02 14:58:11');
INSERT INTO `role_sys_interface` VALUES (32, 2, 33, '2023-06-02 14:59:16', '2023-06-02 14:59:16');
INSERT INTO `role_sys_interface` VALUES (33, 2, 18, '2023-06-02 14:59:16', '2023-06-02 14:59:16');
INSERT INTO `role_sys_interface` VALUES (34, 2, 11, '2023-06-02 14:59:16', '2023-06-02 14:59:16');
INSERT INTO `role_sys_interface` VALUES (35, 3, 33, '2023-06-02 14:59:49', '2023-06-02 14:59:49');

-- ----------------------------
-- Table structure for sys_interface
-- ----------------------------
DROP TABLE IF EXISTS `sys_interface`;
CREATE TABLE `sys_interface`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `interface_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `interface_method` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口方法',
  `interface_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口url',
  `is_using` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用（0：否；1：是）',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_sys_interface_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_interface
-- ----------------------------
INSERT INTO `sys_interface` VALUES (1, '用户注销', 'POST', '/user/logout', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (2, '删除菜单', 'POST', '/menu/delete', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (3, '获取系统接口列表', 'GET', '/sysInterface/list', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (4, '更新角色系统接口', 'POST', '/role/updateSysInterface', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (5, '更新系统接口', 'GET', '/sysInterface/refresh', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (6, '分页获取角色列表', 'GET', '/role/list/page', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (7, '新增菜单', 'POST', '/menu/add', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (8, '更新用户角色', 'POST', '/user/updateRole', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (9, '更新系统接口（仅更新开启和关闭）', 'POST', '/sysInterface/update', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (10, '/v3/api-docs', 'GET', '/v3/api-docs', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (11, '用户更新（仅能更新自己）', 'POST', '/user/updateSelf', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (12, '分页获取菜单列表', 'GET', '/menu/list/page', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (13, '更新用户', 'POST', '/user/update', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (14, '获取角色菜单通过角色id', 'GET', '/role/menu', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (15, '/swagger-resources/configuration/ui', 'GET', '/swagger-resources/configuration/ui', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (16, '删除用户', 'POST', '/user/delete', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (17, '用户注册', 'POST', '/user/register', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (18, '用户更新密码', 'POST', '/user/updatePassword', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (19, '获取角色系统接口通过角色id', 'GET', '/role/sysInterface', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (20, '删除角色', 'POST', '/role/delete', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (21, '分页获取用户列表', 'GET', '/user/list/page', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (22, '获取用户角色', 'GET', '/user/role', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (23, '/error', '', '/error', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (24, '/swagger-resources', 'GET', '/swagger-resources', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (25, '更新角色', 'POST', '/role/update', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (26, '更新菜单', 'POST', '/menu/update', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (27, '分页获取系统接口列表', 'GET', '/sysInterface/list/page', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (28, '获取菜单列表', 'GET', '/menu/list', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (29, '获取用户列表', 'GET', '/user/list', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (30, '获取角色列表', 'GET', '/role/list', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (31, '用户登录', 'POST', '/user/login', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (32, '更新角色菜单', 'POST', '/role/updateMenu', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (33, '当前登录用户获取信息', 'GET', '/user/info', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (34, '/swagger-resources/configuration/security', 'GET', '/swagger-resources/configuration/security', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (35, '新增用户', 'POST', '/user/add', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (36, '新增角色', 'POST', '/role/add', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (37, '/v2/api-docs', 'GET', '/v2/api-docs', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_account` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `user_avatar` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别（0：女；1：男）',
  `user_password` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `is_using` tinyint NOT NULL DEFAULT 0 COMMENT '是否启用（0：否；1：是）',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_user_account`(`user_account` ASC) USING BTREE,
  UNIQUE INDEX `pk_user_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '管理员', 'admin', '', 1, 'e559996f7d546db340035d754234ad22', 1, '2023-06-02 13:16:47', '2023-06-03 05:24:12', 0);
INSERT INTO `user` VALUES (2, '用户', 'user', '', 1, 'e559996f7d546db340035d754234ad22', 1, '2023-06-02 13:16:47', '2023-06-02 14:57:25', 0);
INSERT INTO `user` VALUES (3, '其他', 'other', '', 1, 'e559996f7d546db340035d754234ad22', 1, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_role_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_user_role_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1, '2023-05-31 07:24:08', '2023-06-02 13:11:44');
INSERT INTO `user_role` VALUES (2, 1, 2, '2023-05-31 07:51:01', '2023-06-02 13:11:45');
INSERT INTO `user_role` VALUES (3, 2, 2, '2023-05-31 08:06:04', '2023-06-02 13:11:50');
INSERT INTO `user_role` VALUES (4, 3, 3, '2023-06-02 14:57:42', '2023-06-02 14:57:42');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localServer
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 192.168.10.22:3306
 Source Schema         : mbp

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 29/07/2023 21:30:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父id',
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
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_menu_id`(`id` ASC) USING BTREE,
  INDEX `idx_menu_menu_title`(`menu_title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '用户中心', 'el-icon-user', '/user', NULL, NULL, '/use', '用户中心', 0, 2, '2023-06-02 13:16:47', '2023-07-13 07:14:19', 0);
INSERT INTO `menu` VALUES (2, 1, '我的信息', 'el-icon-user-solid', 'account', 'Account', '/user/account', '', '我的信息', 0, 1, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (3, 1, '修改密码', 'el-icon-lock', 'password', 'Password', '/user/password', '', '修改密码', 0, 2, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (4, 0, '系统管理', 'el-icon-setting', '/settings', NULL, NULL, '/settings', '系统管理', 0, 3, '2023-06-02 13:16:47', '2023-07-13 07:14:25', 0);
INSERT INTO `menu` VALUES (5, 4, '菜单管理', 'el-icon-menu', 'menu', 'Menu', '/settings/menu', '', '菜单管理', 0, 3, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (6, 4, '角色管理', 'el-icon-s-custom', 'role', 'Role', '/settings/role', '', '角色管理', 0, 4, '2023-06-02 13:16:47', '2023-07-25 10:46:25', 0);
INSERT INTO `menu` VALUES (7, 4, '用户管理', 'el-icon-notebook-1', 'user', 'User', '/settings/user', NULL, '用户管理', 0, 1, '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `menu` VALUES (8, 4, '接口管理', 'el-icon-link', 'sysInterface', 'SysInterface', '/settings/sysInterface', NULL, '接口管理', 0, 5, '2023-06-02 13:16:47', '2023-07-25 10:46:30', 0);
INSERT INTO `menu` VALUES (9, 0, '样例功能', 'el-icon-s-platform', '/example', '', '', '/example', '样例功能', 0, 1, '2023-07-13 07:14:03', '2023-07-13 07:14:03', 0);
INSERT INTO `menu` VALUES (10, 9, '交易列表', 'payment-method', 'trade', 'Trade', '/example/trade', '', '交易列表', 0, 1, '2023-07-13 07:14:50', '2023-07-13 07:14:50', 0);
INSERT INTO `menu` VALUES (11, 9, '交易分析', 'el-icon-data-analysis', 'echarts', 'Echarts', '/example/echarts', '', '交易分析', 0, 2, '2023-07-13 07:15:14', '2023-07-13 07:15:14', 0);
INSERT INTO `menu` VALUES (12, 4, '分组管理', 'branch-one', 'userGroup', 'UserGroup', '/settings/userGroup', '', '分组管理', 0, 2, '2023-07-25 10:45:03', '2023-07-25 10:46:10', 0);
INSERT INTO `menu` VALUES (13, 0, '日志管理', 'el-icon-document', '/sysLog', '', '', '/sysLog', '日志管理', 0, 4, '2023-07-29 13:24:09', '2023-07-29 13:29:09', 0);
INSERT INTO `menu` VALUES (14, 13, '登录日志', 'login', 'sysloginLog', 'SysLoginLog', '/sysLog/sysLoginLog', '', '登录日志', 0, 1, '2023-07-29 13:25:57', '2023-07-29 13:25:57', 0);
INSERT INTO `menu` VALUES (15, 13, '请求日志', 'log', 'sysRequestLog', 'SysRequestLog', '/sysLog/sysRequestLog', '', '请求日志', 0, 2, '2023-07-29 13:27:04', '2023-07-29 13:27:13', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_identity` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `is_using` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用（0：否；1：是）',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_role_id`(`id` ASC) USING BTREE,
  INDEX `idx_role_roleIdentity`(`role_identity` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 'admin', 1, '管理员', '2023-06-02 13:16:47', '2023-06-07 06:29:53', 0);
INSERT INTO `role` VALUES (2, '用户', 'user', 1, '用户', '2023-06-02 13:16:47', '2023-06-02 13:16:47', 0);
INSERT INTO `role` VALUES (3, '其他', 'other', 1, '其他', '2023-06-02 13:16:47', '2023-06-07 07:04:14', 0);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_menu_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_role_menu_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `role_menu` VALUES (12, 1, 9, '2023-07-13 07:15:34', '2023-07-13 07:15:34');
INSERT INTO `role_menu` VALUES (13, 1, 10, '2023-07-13 07:15:34', '2023-07-13 07:15:34');
INSERT INTO `role_menu` VALUES (14, 1, 11, '2023-07-13 07:15:34', '2023-07-13 07:15:34');
INSERT INTO `role_menu` VALUES (15, 2, 9, '2023-07-13 07:15:38', '2023-07-13 07:15:38');
INSERT INTO `role_menu` VALUES (16, 2, 10, '2023-07-13 07:15:38', '2023-07-13 07:15:38');
INSERT INTO `role_menu` VALUES (17, 2, 11, '2023-07-13 07:15:38', '2023-07-13 07:15:38');
INSERT INTO `role_menu` VALUES (18, 1, 12, '2023-07-25 10:46:51', '2023-07-25 10:46:51');
INSERT INTO `role_menu` VALUES (19, 1, 13, '2023-07-29 13:27:20', '2023-07-29 13:27:20');
INSERT INTO `role_menu` VALUES (20, 1, 14, '2023-07-29 13:27:20', '2023-07-29 13:27:20');
INSERT INTO `role_menu` VALUES (21, 1, 15, '2023-07-29 13:27:20', '2023-07-29 13:27:20');

-- ----------------------------
-- Table structure for role_sys_interface
-- ----------------------------
DROP TABLE IF EXISTS `role_sys_interface`;
CREATE TABLE `role_sys_interface`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `interface_id` bigint NOT NULL COMMENT '接口id',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_sys_interface_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_role_sys_interface_interface_id`(`interface_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `role_sys_interface` VALUES (36, 3, 1, '2023-06-28 10:59:57', '2023-06-28 10:59:57');
INSERT INTO `role_sys_interface` VALUES (37, 1, 38, '2023-07-13 07:16:02', '2023-07-13 07:16:02');
INSERT INTO `role_sys_interface` VALUES (38, 1, 39, '2023-07-13 07:16:02', '2023-07-13 07:16:02');
INSERT INTO `role_sys_interface` VALUES (39, 1, 43, '2023-07-13 07:16:02', '2023-07-13 07:16:02');
INSERT INTO `role_sys_interface` VALUES (40, 1, 41, '2023-07-13 07:16:02', '2023-07-13 07:16:02');
INSERT INTO `role_sys_interface` VALUES (41, 1, 42, '2023-07-13 07:16:02', '2023-07-13 07:16:02');
INSERT INTO `role_sys_interface` VALUES (42, 1, 40, '2023-07-13 07:16:02', '2023-07-13 07:16:02');
INSERT INTO `role_sys_interface` VALUES (43, 2, 38, '2023-07-13 07:16:26', '2023-07-13 07:16:26');
INSERT INTO `role_sys_interface` VALUES (44, 2, 39, '2023-07-13 07:16:26', '2023-07-13 07:16:26');
INSERT INTO `role_sys_interface` VALUES (45, 2, 43, '2023-07-13 07:16:26', '2023-07-13 07:16:26');
INSERT INTO `role_sys_interface` VALUES (46, 2, 41, '2023-07-13 07:16:26', '2023-07-13 07:16:26');
INSERT INTO `role_sys_interface` VALUES (47, 2, 42, '2023-07-13 07:16:26', '2023-07-13 07:16:26');
INSERT INTO `role_sys_interface` VALUES (48, 2, 40, '2023-07-13 07:16:26', '2023-07-13 07:16:26');
INSERT INTO `role_sys_interface` VALUES (49, 2, 1, '2023-07-13 07:18:56', '2023-07-13 07:18:56');
INSERT INTO `role_sys_interface` VALUES (50, 1, 44, '2023-07-25 10:47:21', '2023-07-25 10:47:21');
INSERT INTO `role_sys_interface` VALUES (51, 1, 47, '2023-07-25 10:47:21', '2023-07-25 10:47:21');
INSERT INTO `role_sys_interface` VALUES (52, 1, 45, '2023-07-25 10:47:21', '2023-07-25 10:47:21');
INSERT INTO `role_sys_interface` VALUES (53, 1, 48, '2023-07-25 10:47:21', '2023-07-25 10:47:21');
INSERT INTO `role_sys_interface` VALUES (54, 1, 46, '2023-07-25 10:47:21', '2023-07-25 10:47:21');
INSERT INTO `role_sys_interface` VALUES (55, 1, 52, '2023-07-29 13:23:02', '2023-07-29 13:23:02');
INSERT INTO `role_sys_interface` VALUES (56, 1, 54, '2023-07-29 13:23:02', '2023-07-29 13:23:02');
INSERT INTO `role_sys_interface` VALUES (57, 1, 53, '2023-07-29 13:23:02', '2023-07-29 13:23:02');
INSERT INTO `role_sys_interface` VALUES (58, 1, 50, '2023-07-29 13:23:02', '2023-07-29 13:23:02');

-- ----------------------------
-- Table structure for sys_interface
-- ----------------------------
DROP TABLE IF EXISTS `sys_interface`;
CREATE TABLE `sys_interface`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `interface_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `interface_method` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口方法',
  `interface_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口url',
  `is_using` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用（0：否；1：是）',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_sys_interface_id`(`id` ASC) USING BTREE,
  INDEX `idx_sys_interface_interface_name`(`interface_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_interface
-- ----------------------------
INSERT INTO `sys_interface` VALUES (1, '用户注销', 'POST', '/user/logout', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (2, '删除菜单', 'POST', '/menu/delete', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (3, '获取系统接口列表', 'GET', '/sysInterface/list', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (4, '更新角色系统接口', 'POST', '/role/updateSysInterface', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (5, '更新系统接口', 'GET', '/sysInterface/refresh', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (6, '分页获取角色列表', 'GET', '/role/list/page', 1, '2023-06-02 13:20:29', '2023-06-02 13:20:29', 0);
INSERT INTO `sys_interface` VALUES (7, '新增菜单', 'POST', '/menu/add', 1, '2023-06-02 13:20:29', '2023-06-28 11:50:28', 0);
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
INSERT INTO `sys_interface` VALUES (38, '新增交易', 'POST', '/trade/add', 1, '2023-07-13 07:15:23', '2023-07-13 07:15:23', 0);
INSERT INTO `sys_interface` VALUES (39, '删除交易', 'POST', '/trade/delete', 1, '2023-07-13 07:15:23', '2023-07-13 07:15:23', 0);
INSERT INTO `sys_interface` VALUES (40, '更新交易', 'POST', '/trade/update', 1, '2023-07-13 07:15:23', '2023-07-13 07:15:23', 0);
INSERT INTO `sys_interface` VALUES (41, '获取交易列表', 'GET', '/trade/list', 1, '2023-07-13 07:15:23', '2023-07-13 07:15:23', 0);
INSERT INTO `sys_interface` VALUES (42, '分页获取交易列表', 'GET', '/trade/list/page', 1, '2023-07-13 07:15:23', '2023-07-13 07:15:23', 0);
INSERT INTO `sys_interface` VALUES (43, '交易数据导出', 'GET', '/trade/excel', 1, '2023-07-13 07:15:23', '2023-07-13 07:15:23', 0);
INSERT INTO `sys_interface` VALUES (44, '新增用户组', 'POST', '/userGroup/add', 1, '2023-07-25 10:46:38', '2023-07-25 10:46:38', 0);
INSERT INTO `sys_interface` VALUES (45, '获取用户组列表', 'GET', '/userGroup/list', 1, '2023-07-25 10:46:38', '2023-07-25 10:46:38', 0);
INSERT INTO `sys_interface` VALUES (46, '更新用户组', 'POST', '/userGroup/update', 1, '2023-07-25 10:46:38', '2023-07-25 10:46:38', 0);
INSERT INTO `sys_interface` VALUES (47, '删除用户组', 'POST', '/userGroup/delete', 1, '2023-07-25 10:46:38', '2023-07-25 10:46:38', 0);
INSERT INTO `sys_interface` VALUES (48, '分页获取用户组列表', 'GET', '/userGroup/list/page', 1, '2023-07-25 10:46:38', '2023-07-25 10:46:38', 0);
INSERT INTO `sys_interface` VALUES (49, '获取验证码', 'POST', '/user/captcha', 1, '2023-07-29 13:22:47', '2023-07-29 13:22:47', 0);
INSERT INTO `sys_interface` VALUES (50, '分页获取系统请求日志列表', 'GET', '/sysRequestLog/list/page', 1, '2023-07-29 13:22:47', '2023-07-29 13:22:47', 0);
INSERT INTO `sys_interface` VALUES (51, '获取验证码id', 'GET', '/user/captchaId', 1, '2023-07-29 13:22:47', '2023-07-29 13:22:47', 0);
INSERT INTO `sys_interface` VALUES (52, '获取系统登录日志列表', 'GET', '/sysLoginLog/list', 1, '2023-07-29 13:22:47', '2023-07-29 13:22:47', 0);
INSERT INTO `sys_interface` VALUES (53, '获取系统请求日志列表', 'GET', '/sysRequestLog/list', 1, '2023-07-29 13:22:47', '2023-07-29 13:22:47', 0);
INSERT INTO `sys_interface` VALUES (54, '分页获取系统登录日志列表', 'GET', '/sysLoginLog/list/page', 1, '2023-07-29 13:22:47', '2023-07-29 13:22:47', 0);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `request_ip` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求ip',
  `request_area` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求地区',
  `request_result` tinyint NOT NULL DEFAULT 1 COMMENT '请求结果（0：失败，1：成功）',
  `error_message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (19, -1, '172.17.0.5', NULL, 0, '验证码错误', '2023-07-29 13:21:01', '2023-07-29 13:21:01');
INSERT INTO `sys_login_log` VALUES (20, 1, '172.17.0.5', NULL, 1, NULL, '2023-07-29 13:21:10', '2023-07-29 13:21:10');
INSERT INTO `sys_login_log` VALUES (21, 1, '172.17.0.5', NULL, 1, NULL, '2023-07-29 13:22:40', '2023-07-29 13:22:40');
INSERT INTO `sys_login_log` VALUES (22, 1, '172.17.0.5', NULL, 1, NULL, '2023-07-29 13:27:30', '2023-07-29 13:27:30');
INSERT INTO `sys_login_log` VALUES (23, 1, '172.17.0.5', NULL, 1, NULL, '2023-07-29 13:29:20', '2023-07-29 13:29:20');

-- ----------------------------
-- Table structure for sys_request_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_request_log`;
CREATE TABLE `sys_request_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `request_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求路径',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `request_parm` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `request_result` tinyint NOT NULL DEFAULT 1 COMMENT '请求结果（0：失败，1：成功）',
  `exe_time` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行时间',
  `error_message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_sys_request_log_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_request_log
-- ----------------------------
INSERT INTO `sys_request_log` VALUES (86, '/api/user/info', 1, '[org.apache.catalina.connector.RequestFacade@2c6ff428]', 1, '37ms', NULL, '2023-07-29 13:21:11', '2023-07-29 13:21:11');
INSERT INTO `sys_request_log` VALUES (87, '/api/sysInterface/list/page', 1, '[SysInterfaceQueryRequest(interfaceName=, interfaceMethod=null, interfaceUrl=null, usingStart=null), org.apache.catalina.connector.RequestFacade@2c6ff428]', 1, '248ms', NULL, '2023-07-29 13:21:19', '2023-07-29 13:21:19');
INSERT INTO `sys_request_log` VALUES (88, '/api/user/logout', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '92ms', NULL, '2023-07-29 13:22:25', '2023-07-29 13:22:25');
INSERT INTO `sys_request_log` VALUES (89, '/api/user/info', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '44ms', NULL, '2023-07-29 13:22:40', '2023-07-29 13:22:40');
INSERT INTO `sys_request_log` VALUES (90, '/api/sysInterface/list/page', 1, '[SysInterfaceQueryRequest(interfaceName=, interfaceMethod=null, interfaceUrl=null, usingStart=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '274ms', NULL, '2023-07-29 13:22:47', '2023-07-29 13:22:47');
INSERT INTO `sys_request_log` VALUES (91, '/api/sysInterface/refresh', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '148ms', NULL, '2023-07-29 13:22:47', '2023-07-29 13:22:47');
INSERT INTO `sys_request_log` VALUES (92, '/api/sysInterface/list/page', 1, '[SysInterfaceQueryRequest(interfaceName=, interfaceMethod=null, interfaceUrl=null, usingStart=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '29ms', NULL, '2023-07-29 13:22:47', '2023-07-29 13:22:47');
INSERT INTO `sys_request_log` VALUES (93, '/api/role/list/page', 1, '[RoleQueryRequest(id=null, roleName=, roleIdentity=, usingStart=null, description=null, gmtCreate=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '71ms', NULL, '2023-07-29 13:22:55', '2023-07-29 13:22:55');
INSERT INTO `sys_request_log` VALUES (94, '/api/sysInterface/list', 1, '[SysInterfaceQueryRequest(interfaceName=null, interfaceMethod=null, interfaceUrl=null, usingStart=1), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '38ms', NULL, '2023-07-29 13:22:56', '2023-07-29 13:22:56');
INSERT INTO `sys_request_log` VALUES (95, '/api/role/sysInterface', 1, '[RoleSysInterfaceQueryRequest(id=1), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '43ms', NULL, '2023-07-29 13:22:57', '2023-07-29 13:22:57');
INSERT INTO `sys_request_log` VALUES (96, '/api/role/updateSysInterface', 1, '[RoleSysInterfaceUpdateRequest(id=1, addSysInterfaceList=[52, 54, 53, 50], deleteSysInterfaceList=[]), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '100ms', NULL, '2023-07-29 13:23:02', '2023-07-29 13:23:02');
INSERT INTO `sys_request_log` VALUES (97, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '93ms', NULL, '2023-07-29 13:23:06', '2023-07-29 13:23:06');
INSERT INTO `sys_request_log` VALUES (98, '/api/menu/add', 1, '[MenuAddRequest(parentId=0, menuTitle=日志管理, menuIcon=log, routePath=/sysLog, componentName=, componentPath=, redirect=/sysLog, description=日志管理, hidden=0, menuSort=4.0), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '76ms', NULL, '2023-07-29 13:24:09', '2023-07-29 13:24:09');
INSERT INTO `sys_request_log` VALUES (99, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '64ms', NULL, '2023-07-29 13:24:09', '2023-07-29 13:24:09');
INSERT INTO `sys_request_log` VALUES (100, '/api/menu/add', 1, '[MenuAddRequest(parentId=13, menuTitle=登录日志, menuIcon=login, routePath=sysloginLog, componentName=SysLoginLog, componentPath=/sysLog/sysLoginLog, redirect=, description=登录日志, hidden=0, menuSort=1.0), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '26ms', NULL, '2023-07-29 13:25:57', '2023-07-29 13:25:57');
INSERT INTO `sys_request_log` VALUES (101, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '29ms', NULL, '2023-07-29 13:25:57', '2023-07-29 13:25:57');
INSERT INTO `sys_request_log` VALUES (102, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '46ms', NULL, '2023-07-29 13:27:11', '2023-07-29 13:27:11');
INSERT INTO `sys_request_log` VALUES (103, '/api/menu/update', 1, '[MenuUpdateRequest(id=15, menuTitle=请求日志, menuIcon=log, routePath=sysRequestLog, componentName=SysRequestLog, componentPath=/sysLog/sysRequestLog, redirect=, description=请求日志, hidden=0, menuSort=2.0), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '48ms', NULL, '2023-07-29 13:27:13', '2023-07-29 13:27:13');
INSERT INTO `sys_request_log` VALUES (104, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '30ms', NULL, '2023-07-29 13:27:13', '2023-07-29 13:27:13');
INSERT INTO `sys_request_log` VALUES (105, '/api/menu/list', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=null, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=0, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '35ms', NULL, '2023-07-29 13:27:18', '2023-07-29 13:27:18');
INSERT INTO `sys_request_log` VALUES (106, '/api/role/menu', 1, '[RoleSysInterfaceQueryRequest(id=1), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '21ms', NULL, '2023-07-29 13:27:18', '2023-07-29 13:27:18');
INSERT INTO `sys_request_log` VALUES (107, '/api/role/updateMenu', 1, '[RoleMenuUpdateRequest(id=1, addMenuList=[13, 14, 15], deleteMenuList=[]), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '35ms', NULL, '2023-07-29 13:27:20', '2023-07-29 13:27:20');
INSERT INTO `sys_request_log` VALUES (108, '/api/user/logout', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '9ms', NULL, '2023-07-29 13:27:22', '2023-07-29 13:27:22');
INSERT INTO `sys_request_log` VALUES (109, '/api/user/info', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '2ms', NULL, '2023-07-29 13:27:30', '2023-07-29 13:27:30');
INSERT INTO `sys_request_log` VALUES (110, '/api/sysLoginLog/list/page', 1, '[SysLoginLogQueryRequest(id=null, userId=null, requestIp=, requestArea=null, requestResult=null, errorMessage=null, gmtCreate=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '123ms', NULL, '2023-07-29 13:27:36', '2023-07-29 13:27:36');
INSERT INTO `sys_request_log` VALUES (111, '/api/sysRequestLog/list/page', 1, '[SysRequestLogQueryRequest(id=null, requestUrl=null, userId=null, requestParm=null, requestResult=null, exeTime=null, errorMessage=null, gmtCreate=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '89ms', NULL, '2023-07-29 13:27:46', '2023-07-29 13:27:46');
INSERT INTO `sys_request_log` VALUES (112, '/api/sysRequestLog/list/page', 1, '[SysRequestLogQueryRequest(id=null, requestUrl=null, userId=null, requestParm=null, requestResult=null, exeTime=null, errorMessage=null, gmtCreate=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '79ms', NULL, '2023-07-29 13:27:53', '2023-07-29 13:27:53');
INSERT INTO `sys_request_log` VALUES (113, '/api/sysRequestLog/list/page', 1, '[SysRequestLogQueryRequest(id=null, requestUrl=null, userId=null, requestParm=null, requestResult=null, exeTime=null, errorMessage=null, gmtCreate=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '78ms', NULL, '2023-07-29 13:27:58', '2023-07-29 13:27:58');
INSERT INTO `sys_request_log` VALUES (114, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '25ms', NULL, '2023-07-29 13:29:04', '2023-07-29 13:29:04');
INSERT INTO `sys_request_log` VALUES (115, '/api/menu/update', 1, '[MenuUpdateRequest(id=13, menuTitle=日志管理, menuIcon=el-icon-document, routePath=/sysLog, componentName=, componentPath=, redirect=/sysLog, description=日志管理, hidden=0, menuSort=4.0), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '15ms', NULL, '2023-07-29 13:29:09', '2023-07-29 13:29:09');
INSERT INTO `sys_request_log` VALUES (116, '/api/menu/list/page', 1, '[MenuQueryRequest(id=null, parentId=null, menuTitle=, menuIcon=null, routePath=null, componentName=null, componentPath=null, redirect=null, description=null, hidden=null, menuSort=null), org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '21ms', NULL, '2023-07-29 13:29:09', '2023-07-29 13:29:09');
INSERT INTO `sys_request_log` VALUES (117, '/api/user/logout', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '2ms', NULL, '2023-07-29 13:29:11', '2023-07-29 13:29:11');
INSERT INTO `sys_request_log` VALUES (118, '/api/user/info', 1, '[org.apache.catalina.connector.RequestFacade@4f02a4ae]', 1, '11ms', NULL, '2023-07-29 13:29:20', '2023-07-29 13:29:20');

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ts_code` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易所市场代码',
  `trade_date` datetime NULL DEFAULT NULL COMMENT '交易日期',
  `open_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '开盘价',
  `close_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '收盘价',
  `high_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '最高价格',
  `low_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最低价格',
  `price_avg` decimal(10, 2) NULL DEFAULT NULL COMMENT '平均价',
  `pip_change` decimal(10, 2) NULL DEFAULT NULL COMMENT '变化的点数',
  `pct_change` decimal(10, 2) NULL DEFAULT NULL COMMENT '变化的百分比',
  `vol` int NULL DEFAULT NULL COMMENT '交易量',
  `amount` bigint NULL DEFAULT NULL COMMENT '金额',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trade_id`(`id` ASC) USING BTREE,
  INDEX `trade_trade_date`(`trade_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1947 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES (1, 'Au99.95', '2022-12-30 00:00:00', 408.80, 409.93, 410.20, '408.8', 409.93, 1.28, 31.32, 32, 13118000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (2, 'Au99.95', '2022-12-29 00:00:00', 408.35, 408.65, 409.00, '408.6', 408.73, -0.21, -5.14, 62, 25341500, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (3, 'Au99.95', '2022-12-28 00:00:00', 408.85, 408.86, 410.80, '410.8', 409.27, 1.50, 36.82, 78, 31923100, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (4, 'Au99.95', '2022-12-27 00:00:00', 407.30, 407.36, 407.50, '407.3', 407.33, 0.33, 8.11, 78, 31771800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (5, 'Au99.95', '2022-12-26 00:00:00', 407.00, 407.03, 407.08, '407', 407.02, 0.61, 15.01, 172, 69961920, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (6, 'Au99.95', '2022-12-23 00:00:00', 406.30, 406.42, 410.30, '410.3', 406.47, -3.78, -92.15, 80, 32518000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (7, 'Au99.95', '2022-12-22 00:00:00', 310.15, 410.20, 410.50, '409.3', 407.94, 0.45, 10.98, 88, 35898900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (8, 'Au99.95', '2022-12-21 00:00:00', 408.00, 409.75, 410.00, '408', 409.38, 3.94, 97.09, 70, 28657200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (9, 'Au99.95', '2022-12-20 00:00:00', 404.60, 405.81, 407.50, '404.6', 405.08, 0.30, 7.40, 188, 75350520, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (10, 'Au99.95', '2022-12-19 00:00:00', 404.60, 405.51, 406.20, '404.6', 405.68, 2.80, 69.53, 186, 75514900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (11, 'Au99.95', '2022-12-16 00:00:00', 402.00, 402.71, 402.80, '402', 402.53, -1.80, -44.50, 150, 60380760, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (12, 'Au99.95', '2022-12-15 00:00:00', 404.30, 404.51, 406.50, '406.5', 405.18, -5.48, -133.66, 234, 95154800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (13, 'Au99.95', '2022-12-14 00:00:00', 405.80, 409.99, 410.00, '405.8', 407.78, 6.49, 160.84, 94, 38331760, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (14, 'Au99.95', '2022-12-13 00:00:00', 403.03, 403.50, 404.20, '404.2', 403.47, 0.00, 0.00, 268, 108206320, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (15, 'Au99.95', '2022-12-12 00:00:00', 403.50, 403.50, 404.45, '404.35', 403.99, -0.67, -16.58, 288, 115629020, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (16, 'Au99.95', '2022-12-09 00:00:00', 403.30, 404.17, 404.40, '403.5', 403.68, 1.69, 41.99, 452, 175112640, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (17, 'Au99.95', '2022-12-08 00:00:00', 402.30, 402.48, 402.60, '402.6', 402.44, 1.22, 30.40, 60, 24146600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (18, 'Au99.95', '2022-12-07 00:00:00', 401.00, 401.26, 401.50, '401.5', 401.25, -0.44, -10.95, 182, 73311800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (19, 'Au99.95', '2022-12-06 00:00:00', 401.60, 401.70, 402.00, '401.7', 401.67, -4.33, -106.64, 116, 46594800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (20, 'Au99.95', '2022-12-05 00:00:00', 406.00, 406.03, 407.80, '407.8', 406.67, -3.39, -82.80, 210, 84269000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (21, 'Au99.95', '2022-12-02 00:00:00', 409.00, 409.42, 409.50, '409.2', 409.26, 1.63, 39.97, 208, 84386100, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (22, 'Au99.95', '2022-12-01 00:00:00', 405.60, 407.79, 409.99, '405.8', 406.68, 2.11, 52.01, 100, 40668720, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (23, 'Au99.95', '2022-11-30 00:00:00', 405.35, 405.68, 406.30, '406.3', 405.57, -0.62, -15.26, 184, 74626000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (24, 'Au99.95', '2022-11-29 00:00:00', 405.80, 406.30, 408.00, '408', 406.36, -1.12, -27.49, 178, 72333680, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (25, 'Au99.95', '2022-11-28 00:00:00', 407.25, 407.42, 408.50, '408.5', 407.73, 1.16, 28.55, 64, 26095200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (26, 'Au99.95', '2022-11-25 00:00:00', 400.01, 406.26, 407.50, '407.5', 406.75, -0.21, -5.17, 270, 109303340, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (27, 'Au99.95', '2022-11-24 00:00:00', 405.70, 406.47, 406.50, '405.7', 406.07, 2.06, 50.94, 22, 8933740, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (28, 'Au99.95', '2022-11-23 00:00:00', 404.00, 404.41, 404.50, '404.1', 404.30, -0.58, -14.32, 40, 16172200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (29, 'Au99.95', '2022-11-22 00:00:00', 404.50, 404.99, 405.00, '404.5', 404.64, 0.40, 9.89, 44, 17804160, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (30, 'Au99.95', '2022-11-21 00:00:00', 404.00, 404.59, 405.60, '404', 404.59, -2.38, -58.48, 242, 90538760, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (31, 'Au99.95', '2022-11-18 00:00:00', 406.90, 406.97, 407.50, '407', 407.06, -0.04, -0.98, 186, 74345600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (32, 'Au99.95', '2022-11-17 00:00:00', 406.70, 407.01, 407.15, '407.15', 407.01, 0.47, 11.56, 20, 8140300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (33, 'Au99.95', '2022-11-16 00:00:00', 405.50, 406.54, 406.70, '405.5', 406.32, 1.52, 37.53, 226, 91830000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (34, 'Au99.95', '2022-11-15 00:00:00', 403.60, 405.02, 405.50, '403.6', 404.88, 2.01, 49.87, 26, 10526900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (35, 'Au99.95', '2022-11-14 00:00:00', 402.80, 403.01, 404.00, '404', 403.01, -5.41, -132.46, 134, 52427600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (36, 'Au99.95', '2022-11-11 00:00:00', 407.40, 408.42, 409.00, '408.6', 408.70, 4.48, 110.91, 80, 32696600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (37, 'Au99.95', '2022-11-10 00:00:00', 403.00, 403.94, 404.10, '403', 403.83, 0.67, 16.61, 70, 28268400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (38, 'Au99.95', '2022-11-09 00:00:00', 402.00, 403.27, 403.35, '402', 403.08, 8.27, 209.37, 60, 24184900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (39, 'Au99.95', '2022-11-08 00:00:00', 394.50, 395.00, 395.40, '395', 395.11, 1.64, 41.69, 360, 142239600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (40, 'Au99.95', '2022-11-07 00:00:00', 393.00, 393.36, 394.50, '394.5', 393.74, 1.99, 50.85, 166, 64547200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (41, 'Au99.95', '2022-11-04 00:00:00', 391.00, 391.37, 391.45, '391.4', 391.27, -0.06, -1.53, 98, 38345000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (42, 'Au99.95', '2022-11-03 00:00:00', 391.40, 391.43, 393.50, '393.5', 391.68, -1.55, -39.44, 120, 47001800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (43, 'Au99.95', '2022-11-02 00:00:00', 392.35, 392.98, 392.99, '392.6', 392.56, 1.37, 34.98, 98, 38471560, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (44, 'Au99.95', '2022-11-01 00:00:00', 391.20, 391.61, 392.20, '392', 391.91, 0.52, 13.30, 160, 62706600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (45, 'Au99.95', '2022-10-31 00:00:00', 391.00, 391.09, 391.70, '391.7', 391.21, -1.57, -39.98, 158, 61875600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (46, 'Au99.95', '2022-10-28 00:00:00', 392.60, 392.66, 393.70, '393.5', 393.20, -0.42, -10.68, 216, 84931200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (47, 'Au99.95', '2022-10-27 00:00:00', 392.60, 393.08, 393.40, '392.6', 392.95, -1.27, -32.20, 64, 25148940, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (48, 'Au99.95', '2022-10-26 00:00:00', 393.65, 394.35, 394.50, '394', 394.27, 0.54, 13.71, 82, 32330920, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (49, 'Au99.95', '2022-10-25 00:00:00', 393.00, 393.81, 394.15, '393', 393.92, 1.07, 27.24, 92, 36240800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (50, 'Au99.95', '2022-10-24 00:00:00', 390.50, 392.74, 392.80, '390.5', 392.46, 4.72, 121.64, 184, 72185900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (51, 'Au99.95', '2022-10-21 00:00:00', 387.75, 388.02, 388.70, '388.2', 388.20, -0.51, -13.13, 128, 49689700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (52, 'Au99.95', '2022-10-20 00:00:00', 388.20, 388.53, 389.00, '388.2', 388.39, -2.04, -52.23, 234, 90884860, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (53, 'Au99.95', '2022-10-19 00:00:00', 390.05, 390.57, 391.50, '390.9', 390.95, -0.66, -16.87, 630, 238540180, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (54, 'Au99.95', '2022-10-18 00:00:00', 390.50, 391.23, 391.50, '390.5', 390.63, 0.48, 12.28, 286, 111732660, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (55, 'Au99.95', '2022-10-17 00:00:00', 390.00, 390.75, 390.90, '390.9', 390.35, -1.37, -34.94, 290, 113202920, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (56, 'Au99.95', '2022-10-14 00:00:00', 391.50, 392.12, 392.40, '391.5', 391.92, -0.38, -9.68, 108, 42328200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (57, 'Au99.95', '2022-10-13 00:00:00', 392.50, 392.50, 392.90, '392.9', 392.59, 0.05, 1.27, 240, 92570320, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (58, 'Au99.95', '2022-10-12 00:00:00', 391.50, 392.45, 392.50, '392', 392.21, 0.45, 11.48, 134, 52502380, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (59, 'Au99.95', '2022-10-11 00:00:00', 392.00, 392.00, 392.00, '392', 392.00, -0.50, -12.74, 86, 33488000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (60, 'Au99.95', '2022-10-10 00:00:00', 392.50, 392.50, 395.00, '395', 393.79, 2.89, 74.18, 184, 72459000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (61, 'Au99.95', '2022-09-30 00:00:00', 388.80, 389.61, 389.80, '388.8', 389.64, 0.74, 19.03, 126, 49095700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (62, 'Au99.95', '2022-09-29 00:00:00', 388.00, 388.87, 389.50, '388', 388.94, 2.50, 64.70, 270, 105016100, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (63, 'Au99.95', '2022-09-28 00:00:00', 385.15, 386.37, 386.50, '385.2', 385.86, 1.14, 29.59, 284, 109584560, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (64, 'Au99.95', '2022-09-27 00:00:00', 383.80, 385.23, 385.30, '384', 384.62, 0.72, 18.73, 110, 42308900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (65, 'Au99.95', '2022-09-26 00:00:00', 384.00, 384.51, 385.00, '385', 384.49, -2.95, -76.14, 204, 78447500, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (66, 'Au99.95', '2022-09-23 00:00:00', 386.80, 387.46, 387.55, '386.8', 387.46, 1.86, 48.24, 26, 10074200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (67, 'Au99.95', '2022-09-22 00:00:00', 385.50, 385.60, 385.65, '385.5', 385.60, 0.34, 8.83, 18, 6940800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (68, 'Au99.95', '2022-09-21 00:00:00', 384.98, 385.26, 385.50, '384.98', 385.15, -0.86, -22.27, 30, 11554760, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (69, 'Au99.95', '2022-09-20 00:00:00', 386.00, 386.12, 386.15, '386.15', 386.12, 1.32, 34.30, 386, 143793520, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (70, 'Au99.95', '2022-09-19 00:00:00', 384.80, 384.80, 384.80, '384.8', 384.80, 1.10, 28.67, 22, 8465600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (71, 'Au99.95', '2022-09-16 00:00:00', 383.60, 383.70, 386.00, '386', 383.86, -2.33, -60.36, 38, 14587000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (72, 'Au99.95', '2022-09-15 00:00:00', 385.85, 386.03, 387.20, '387.2', 386.11, -0.87, -22.49, 48, 18533300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (73, 'Au99.95', '2022-09-14 00:00:00', 386.80, 386.90, 386.90, '386.8', 386.87, -2.50, -64.20, 102, 39461400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (74, 'Au99.95', '2022-09-13 00:00:00', 389.15, 389.40, 389.80, '389.3', 389.34, 0.27, 6.94, 84, 32705200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (75, 'Au99.95', '2022-09-09 00:00:00', 388.75, 389.13, 389.50, '388.8', 389.08, 0.83, 21.38, 98, 38130600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (76, 'Au99.95', '2022-09-08 00:00:00', 387.40, 388.30, 389.00, '387.4', 388.30, 1.92, 49.69, 40, 15532200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (77, 'Au99.95', '2022-09-07 00:00:00', 385.80, 386.38, 387.30, '387.3', 386.30, -2.15, -55.34, 74, 28586400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (78, 'Au99.95', '2022-09-06 00:00:00', 388.10, 388.53, 388.60, '388.1', 388.38, 2.03, 52.52, 734, 284961700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (79, 'Au99.95', '2022-09-05 00:00:00', 386.01, 386.50, 387.00, '387', 386.50, 3.38, 88.22, 4, 1546020, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (80, 'Au99.95', '2022-09-01 00:00:00', 383.12, 383.12, 383.12, '383.12', 383.12, -2.88, -74.61, 2, 766240, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (81, 'Au99.95', '2022-08-31 00:00:00', 386.00, 386.00, 386.00, '386', 386.00, -2.98, -76.61, 2, 772000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (82, 'Au99.95', '2022-08-30 00:00:00', 388.00, 388.98, 390.00, '388', 389.12, 1.42, 36.64, 60, 23347600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (83, 'Au99.95', '2022-08-29 00:00:00', 387.10, 387.56, 387.70, '387.4', 387.31, -1.94, -49.81, 112, 43379200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (84, 'Au99.95', '2022-08-26 00:00:00', 389.50, 389.50, 389.50, '389.5', 389.50, -0.08, -2.05, 10, 3895000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (85, 'Au99.95', '2022-08-25 00:00:00', 389.00, 389.58, 389.70, '389', 389.25, 1.56, 40.20, 52, 20241400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (86, 'Au99.95', '2022-08-24 00:00:00', 388.02, 388.02, 388.02, '388.02', 388.02, 1.08, 27.91, 402, 153988040, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (87, 'Au99.95', '2022-08-23 00:00:00', 384.40, 386.94, 387.00, '384.4', 386.85, 3.17, 82.60, 314, 121472800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (88, 'Au99.95', '2022-08-22 00:00:00', 383.31, 383.77, 386.00, '386', 385.47, -1.95, -50.55, 834, 321874420, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (89, 'Au99.95', '2022-08-19 00:00:00', 384.01, 385.72, 386.55, '386.3', 386.13, 1.52, 39.56, 66, 25484620, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (90, 'Au99.95', '2022-08-18 00:00:00', 381.80, 384.20, 387.20, '387', 386.89, -5.03, -1.29, 952, 366515400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (91, 'Au99.95', '2022-08-17 00:00:00', 389.00, 389.23, 389.50, '389.5', 389.36, 5.07, 1.32, 124, 48281000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (92, 'Au99.95', '2022-08-16 00:00:00', 380.00, 384.16, 390.60, '390.4', 390.06, -6.67, -1.71, 544, 212306020, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (93, 'Au99.95', '2022-08-15 00:00:00', 390.00, 390.83, 391.02, '390', 390.71, 1.13, 0.29, 1214, 473470040, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (94, 'Au99.95', '2022-08-11 00:00:00', 389.10, 389.10, 389.10, '389.1', 389.10, -1.62, -0.41, 24, 9338400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (95, 'Au99.95', '2022-08-10 00:00:00', 390.30, 390.72, 391.30, '391.2', 390.76, 0.95, 0.24, 156, 60959000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (96, 'Au99.95', '2022-08-09 00:00:00', 389.42, 389.77, 389.80, '389.5', 389.61, 2.27, 0.59, 80, 31169140, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (97, 'Au99.95', '2022-08-08 00:00:00', 381.99, 387.50, 387.50, '381.99', 387.32, -2.34, -0.60, 148, 57324180, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (98, 'Au99.95', '2022-08-05 00:00:00', 389.80, 389.84, 390.00, '390', 389.84, 8.20, 2.15, 98, 38204400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (99, 'Au99.95', '2022-08-04 00:00:00', 368.59, 381.64, 386.00, '368.59', 381.64, -3.82, -0.99, 8, 3053160, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (100, 'Au99.95', '2022-08-03 00:00:00', 384.60, 385.46, 385.75, '384.6', 385.46, -2.36, -0.61, 8, 3083700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (101, 'Au99.95', '2022-08-02 00:00:00', 387.00, 387.82, 388.00, '387', 387.82, 2.84, 0.74, 16, 6205200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (102, 'Au99.95', '2022-08-01 00:00:00', 384.23, 384.98, 385.20, '384.23', 384.83, 2.23, 0.58, 170, 66601400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (103, 'Au99.95', '2022-07-29 00:00:00', 381.80, 382.75, 385.00, '381.8', 382.75, 3.68, 0.97, 18, 6889600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (104, 'Au99.95', '2022-07-28 00:00:00', 376.50, 379.07, 379.95, '376.5', 378.91, 3.74, 1.00, 40, 15156600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (105, 'Au99.95', '2022-07-27 00:00:00', 375.00, 375.33, 376.00, '376', 375.33, -0.57, -0.15, 6, 2252000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (106, 'Au99.95', '2022-07-26 00:00:00', 375.80, 375.90, 376.00, '375.8', 375.90, -0.48, -0.13, 24, 9021600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (107, 'Au99.95', '2022-07-25 00:00:00', 376.25, 376.38, 376.50, '376.3', 376.32, 1.44, 0.38, 150, 58450700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (108, 'Au99.95', '2022-07-22 00:00:00', 370.00, 374.94, 374.95, '370', 374.31, 5.64, 1.53, 126, 47163600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (109, 'Au99.95', '2022-07-21 00:00:00', 369.30, 369.30, 373.50, '373.5', 369.89, -3.76, -1.01, 270, 101242960, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (110, 'Au99.95', '2022-07-20 00:00:00', 372.00, 373.06, 373.10, '373.05', 373.00, 0.88, 0.24, 656, 244218200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (111, 'Au99.95', '2022-07-19 00:00:00', 372.10, 372.18, 372.30, '372.1', 372.18, -1.25, -0.33, 20, 7443600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (112, 'Au99.95', '2022-07-18 00:00:00', 372.02, 373.43, 373.80, '372.02', 373.40, 1.41, 0.38, 222, 83912240, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (113, 'Au99.95', '2022-07-15 00:00:00', 371.90, 372.02, 372.85, '372.85', 372.53, -5.98, -1.58, 38, 14156300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (114, 'Au99.95', '2022-07-14 00:00:00', 378.00, 378.00, 378.00, '378', 378.00, 3.06, 0.82, 22, 8316000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (115, 'Au99.95', '2022-07-13 00:00:00', 374.70, 374.94, 375.00, '375', 374.94, -0.29, -0.08, 244, 91498800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (116, 'Au99.95', '2022-07-12 00:00:00', 375.00, 375.23, 376.40, '375', 375.12, -1.37, -0.36, 220, 82528000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (117, 'Au99.95', '2022-07-11 00:00:00', 376.60, 376.60, 376.60, '376.6', 376.60, 0.29, 0.08, 108, 42338800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (118, 'Au99.95', '2022-07-08 00:00:00', 376.31, 376.31, 376.31, '376.31', 376.31, 0.21, 0.06, 2, 752620, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (119, 'Au99.95', '2022-07-07 00:00:00', 376.10, 376.10, 376.10, '376.1', 376.10, -6.15, -1.61, 2, 752200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (120, 'Au99.95', '2022-07-06 00:00:00', 381.80, 382.25, 383.55, '383.55', 382.44, -7.98, -2.04, 52, 19887300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (121, 'Au99.95', '2022-07-05 00:00:00', 390.15, 390.23, 390.30, '390.15', 390.21, -0.20, -0.05, 20, 7804200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (122, 'Au99.95', '2022-07-04 00:00:00', 390.00, 390.43, 390.60, '390', 390.12, -2.37, -0.60, 446, 174851020, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (123, 'Au99.95', '2022-07-01 00:00:00', 392.80, 392.80, 392.80, '392.8', 392.80, 1.10, 0.28, 6, 2356800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (124, 'Au99.95', '2022-06-30 00:00:00', 391.70, 391.70, 391.70, '391.7', 391.70, -0.97, -0.25, 2, 783400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (125, 'Au99.95', '2022-06-29 00:00:00', 392.50, 392.67, 393.50, '393.5', 393.07, -1.33, -0.34, 62, 24370700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (126, 'Au99.95', '2022-06-28 00:00:00', 394.00, 394.00, 394.00, '394', 394.00, -0.88, -0.22, 12, 4728000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (127, 'Au99.95', '2022-06-27 00:00:00', 394.61, 394.88, 396.60, '394.8', 394.98, 1.54, 0.39, 50, 19749140, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (128, 'Au99.95', '2022-06-24 00:00:00', 393.20, 393.34, 393.40, '393.4', 393.34, -2.79, -0.70, 42, 16520400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (129, 'Au99.95', '2022-06-23 00:00:00', 396.05, 396.13, 398.00, '397', 396.36, -0.45, -0.11, 280, 107477760, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (130, 'Au99.95', '2022-06-22 00:00:00', 396.00, 396.58, 396.80, '396', 396.58, 0.58, 0.15, 10, 3965800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (131, 'Au99.95', '2022-06-21 00:00:00', 396.00, 396.00, 396.00, '396', 396.00, -0.50, -0.13, 12, 4752000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (132, 'Au99.95', '2022-06-20 00:00:00', 396.50, 396.50, 396.50, '396.5', 396.50, -1.32, -0.33, 32, 12688000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (133, 'Au99.95', '2022-06-17 00:00:00', 397.70, 397.82, 397.85, '397.7', 397.82, 2.65, 0.67, 14, 5569600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (134, 'Au99.95', '2022-06-16 00:00:00', 394.50, 395.17, 395.40, '395.15', 395.17, 1.79, 0.46, 10, 3951700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (135, 'Au99.95', '2022-06-15 00:00:00', 393.30, 393.38, 393.40, '393.4', 393.38, -2.76, -0.70, 36, 14161800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (136, 'Au99.95', '2022-06-14 00:00:00', 396.00, 396.14, 396.70, '396.7', 396.23, -7.85, -1.94, 36, 14264400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (137, 'Au99.95', '2022-06-13 00:00:00', 399.30, 403.99, 404.30, '399.3', 403.58, 6.99, 1.76, 46, 18564900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (138, 'Au99.95', '2022-06-10 00:00:00', 397.00, 397.00, 397.00, '397', 397.00, -2.06, -0.52, 2, 794000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (139, 'Au99.95', '2022-06-09 00:00:00', 398.50, 399.06, 399.26, '398.5', 399.18, 1.98, 0.50, 242, 96603800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (140, 'Au99.95', '2022-06-08 00:00:00', 397.00, 397.08, 397.30, '397.1', 397.09, 1.50, 0.38, 44, 17472200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (141, 'Au99.95', '2022-06-07 00:00:00', 395.55, 395.58, 395.60, '395.55', 395.58, -1.70, -0.43, 8, 3164700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (142, 'Au99.95', '2022-06-06 00:00:00', 397.25, 397.28, 397.30, '397.25', 397.28, -0.78, -0.20, 66, 26469500, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (143, 'Au99.95', '2022-06-02 00:00:00', 394.85, 398.06, 398.20, '394.85', 397.72, 2.92, 0.74, 38, 15113500, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (144, 'Au99.95', '2022-06-01 00:00:00', 394.74, 395.14, 396.00, '396', 395.04, -2.87, -0.72, 104, 41084420, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (145, 'Au99.95', '2022-05-31 00:00:00', 397.70, 398.01, 398.70, '397.7', 397.99, -1.54, -0.39, 40, 15919620, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (146, 'Au99.95', '2022-05-30 00:00:00', 399.40, 399.55, 399.65, '399.5', 399.55, -2.51, -0.62, 118, 47405400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (147, 'Au99.95', '2022-05-27 00:00:00', 401.50, 402.06, 402.20, '401.5', 401.99, 1.88, 0.47, 208, 83615800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (148, 'Au99.95', '2022-05-26 00:00:00', 399.40, 400.18, 400.50, '399.4', 400.17, 0.66, 0.17, 116, 46419800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (149, 'Au99.95', '2022-05-25 00:00:00', 399.20, 399.52, 399.90, '399.2', 399.52, -0.09, -0.02, 130, 51937800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (150, 'Au99.95', '2022-05-24 00:00:00', 397.05, 399.61, 400.99, '397.05', 397.76, 1.92, 0.48, 58, 23070260, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (151, 'Au99.95', '2022-05-23 00:00:00', 397.50, 397.69, 398.95, '398', 397.79, 0.16, 0.04, 228, 91069200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (152, 'Au99.95', '2022-05-20 00:00:00', 397.50, 397.53, 398.00, '398', 397.53, 2.22, 0.56, 44, 17491600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (153, 'Au99.95', '2022-05-19 00:00:00', 394.95, 395.31, 395.60, '395.3', 395.29, 1.54, 0.39, 82, 32414100, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (154, 'Au99.95', '2022-05-18 00:00:00', 393.30, 393.77, 394.10, '393.6', 393.71, -4.16, -1.05, 70, 27560200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (155, 'Au99.95', '2022-05-17 00:00:00', 396.00, 397.93, 398.00, '396', 397.64, 2.63, 0.67, 28, 11134000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (156, 'Au99.95', '2022-05-16 00:00:00', 395.00, 395.30, 396.30, '396.3', 395.58, -4.10, -1.03, 30, 11867400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (157, 'Au99.95', '2022-05-13 00:00:00', 399.40, 399.40, 399.40, '399.4', 399.40, -3.24, -0.80, 6, 2396400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (158, 'Au99.95', '2022-05-12 00:00:00', 402.60, 402.64, 402.70, '402.6', 402.62, 4.99, 1.25, 280, 112734800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (159, 'Au99.95', '2022-05-11 00:00:00', 397.50, 397.65, 402.20, '402.2', 397.76, -4.65, -1.16, 162, 64437300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (160, 'Au99.95', '2022-05-10 00:00:00', 402.30, 402.30, 402.30, '402.3', 402.30, -2.25, -0.56, 6, 2413800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (161, 'Au99.95', '2022-05-09 00:00:00', 404.25, 404.55, 404.70, '404.7', 404.55, 1.90, 0.47, 14, 5663700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (162, 'Au99.95', '2022-05-06 00:00:00', 402.50, 402.65, 402.80, '402.5', 402.65, -0.82, -0.20, 4, 1610600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (163, 'Au99.95', '2022-05-05 00:00:00', 403.00, 403.47, 404.00, '404', 403.53, -1.63, -0.40, 132, 53141720, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (164, 'Au99.95', '2022-04-29 00:00:00', 404.00, 405.10, 406.00, '404', 405.09, 4.83, 1.21, 72, 29166600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (165, 'Au99.95', '2022-04-28 00:00:00', 397.60, 400.27, 400.30, '397.6', 399.20, -0.33, -0.08, 54, 21557000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (166, 'Au99.95', '2022-04-27 00:00:00', 400.60, 400.60, 400.60, '400.6', 400.60, 0.23, 0.06, 2, 801200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (167, 'Au99.95', '2022-04-26 00:00:00', 399.80, 400.37, 400.40, '400.25', 400.10, -3.16, -0.78, 112, 44811360, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (168, 'Au99.95', '2022-04-25 00:00:00', 403.00, 403.53, 404.50, '403', 404.15, -1.07, -0.26, 248, 100043360, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (169, 'Au99.95', '2022-04-22 00:00:00', 404.60, 404.60, 404.60, '404.6', 404.60, 1.80, 0.45, 6, 2427600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (170, 'Au99.95', '2022-04-21 00:00:00', 402.80, 402.80, 402.80, '402.8', 402.80, 3.47, 0.87, 2, 805600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (171, 'Au99.95', '2022-04-20 00:00:00', 399.20, 399.33, 400.20, '400', 399.81, -4.66, -1.15, 58, 23189000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (172, 'Au99.95', '2022-04-19 00:00:00', 403.80, 403.99, 404.90, '403.9', 404.17, -2.24, -0.55, 72, 29100700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (173, 'Au99.95', '2022-04-18 00:00:00', 405.90, 406.23, 406.60, '406.3', 406.23, 1.88, 0.46, 116, 44899800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (174, 'Au99.95', '2022-04-15 00:00:00', 404.35, 404.35, 404.35, '404.35', 404.35, 0.93, 0.23, 2, 808700, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (175, 'Au99.95', '2022-04-14 00:00:00', 403.20, 403.42, 404.00, '404', 403.46, 1.00, 0.25, 28, 11297000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (176, 'Au99.95', '2022-04-13 00:00:00', 402.00, 402.42, 402.85, '402.85', 402.49, 2.42, 0.61, 12, 4829900, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (177, 'Au99.95', '2022-04-12 00:00:00', 400.00, 400.00, 400.00, '400', 400.00, 1.84, 0.46, 2, 800000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (178, 'Au99.95', '2022-04-11 00:00:00', 396.80, 398.16, 398.50, '396.8', 397.31, 3.00, 0.76, 132, 51064000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (179, 'Au99.95', '2022-04-08 00:00:00', 395.00, 395.16, 395.75, '395.3', 395.16, 1.49, 0.38, 20, 7903300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (180, 'Au99.95', '2022-04-07 00:00:00', 393.50, 393.67, 394.00, '393.5', 393.56, 0.01, 0.00, 98, 38569180, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (181, 'Au99.95', '2022-04-06 00:00:00', 393.10, 393.66, 394.40, '394.4', 394.20, -1.45, -0.37, 198, 76932000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (182, 'Au99.95', '2022-04-01 00:00:00', 394.20, 395.11, 396.20, '394.2', 395.61, 1.87, 0.48, 308, 121848200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (183, 'Au99.95', '2022-03-31 00:00:00', 393.20, 393.24, 394.30, '394.3', 393.66, 1.24, 0.32, 126, 48485240, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (184, 'Au99.95', '2022-03-30 00:00:00', 392.00, 392.00, 392.00, '392', 392.00, -2.70, -0.68, 16, 6272000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (185, 'Au99.95', '2022-03-29 00:00:00', 394.30, 394.70, 394.90, '394.9', 394.71, -1.84, -0.46, 26, 10262600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (186, 'Au99.95', '2022-03-28 00:00:00', 396.00, 396.54, 399.50, '399.5', 396.76, -5.06, -1.26, 26, 10316000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (187, 'Au99.95', '2022-03-25 00:00:00', 401.60, 401.60, 401.60, '401.6', 401.60, 2.27, 0.57, 4, 1606400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (188, 'Au99.95', '2022-03-24 00:00:00', 398.20, 399.33, 399.50, '399.5', 399.33, 5.53, 1.40, 96, 37469400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (189, 'Au99.95', '2022-03-23 00:00:00', 393.80, 393.80, 393.80, '393.8', 393.80, -1.68, -0.42, 2, 787600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (190, 'Au99.95', '2022-03-22 00:00:00', 394.11, 395.48, 396.00, '394.11', 395.48, 1.37, 0.35, 10, 3954820, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (191, 'Au99.95', '2022-03-21 00:00:00', 394.00, 394.11, 395.50, '394.4', 394.30, -0.81, -0.21, 114, 44950300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (192, 'Au99.95', '2022-03-18 00:00:00', 390.00, 394.92, 397.00, '396', 395.11, 1.17, 0.30, 22, 8692620, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (193, 'Au99.95', '2022-03-17 00:00:00', 393.50, 393.75, 394.00, '393.5', 393.75, 4.45, 1.14, 20, 7875000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (194, 'Au99.95', '2022-03-16 00:00:00', 389.30, 389.30, 389.30, '389.3', 389.30, -3.44, -0.88, 2, 778600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (195, 'Au99.95', '2022-03-15 00:00:00', 391.49, 392.74, 394.00, '391.49', 392.74, -9.02, -2.25, 4, 1570980, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (196, 'Au99.95', '2022-03-14 00:00:00', 401.50, 401.76, 402.45, '402.45', 401.76, -1.54, -0.38, 208, 79688300, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (197, 'Au99.95', '2022-03-11 00:00:00', 403.20, 403.30, 403.30, '403.2', 403.29, 0.64, 0.16, 24, 9679000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (198, 'Au99.95', '2022-03-10 00:00:00', 401.30, 402.66, 408.50, '408.5', 402.50, -13.84, -3.32, 178, 71197600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (199, 'Au99.95', '2022-03-09 00:00:00', 414.20, 416.50, 417.00, '414.2', 416.21, 6.28, 1.53, 52, 21643400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (200, 'Au99.95', '2022-03-08 00:00:00', 402.00, 410.22, 411.00, '402', 406.17, 8.15, 2.03, 266, 103832400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (201, 'Au99.95', '2022-03-07 00:00:00', 396.00, 402.07, 403.00, '396', 402.07, 8.54, 2.17, 134, 53878600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (202, 'Au99.95', '2022-03-04 00:00:00', 393.00, 393.53, 395.00, '393.5', 394.05, 1.43, 0.36, 214, 84327500, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (203, 'Au99.95', '2022-03-03 00:00:00', 391.40, 392.10, 393.00, '392.5', 392.32, -1.04, -0.26, 120, 47078600, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (204, 'Au99.95', '2022-03-02 00:00:00', 390.40, 393.14, 393.45, '390.4', 392.95, 5.43, 1.40, 118, 46368100, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (205, 'Au99.95', '2022-03-01 00:00:00', 387.50, 387.71, 389.00, '389', 387.71, 0.09, 0.02, 52, 20161200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (206, 'Au99.95', '2022-02-28 00:00:00', 387.50, 387.62, 388.60, '388', 387.74, -1.21, -0.31, 88, 34121400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (207, 'Au99.95', '2022-02-25 00:00:00', 388.50, 388.83, 389.50, '388.5', 388.83, -3.70, -0.94, 60, 23330000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (208, 'Au99.95', '2022-02-24 00:00:00', 389.00, 392.53, 394.25, '389', 391.43, 5.93, 1.53, 220, 86114940, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (209, 'Au99.95', '2022-02-23 00:00:00', 386.50, 386.60, 387.00, '387', 386.60, -2.93, -0.75, 48, 18556800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (210, 'Au99.95', '2022-02-22 00:00:00', 388.50, 389.53, 390.00, '388.5', 389.64, 4.23, 1.10, 384, 149622800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (211, 'Au99.95', '2022-02-21 00:00:00', 385.00, 385.30, 385.60, '385.6', 385.43, -0.06, -0.02, 44, 16959200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (212, 'Au99.95', '2022-02-18 00:00:00', 384.60, 385.36, 385.51, '384.6', 385.17, 3.49, 0.91, 114, 43910380, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (213, 'Au99.95', '2022-02-17 00:00:00', 379.80, 381.87, 382.40, '379.8', 381.61, 5.45, 1.45, 38, 14501240, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (214, 'Au99.95', '2022-02-16 00:00:00', 373.75, 376.42, 378.50, '378.5', 377.04, -7.06, -1.84, 20, 7540980, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (215, 'Au99.95', '2022-02-15 00:00:00', 380.80, 383.48, 384.00, '380.8', 382.76, 3.85, 1.01, 38, 14545200, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (216, 'Au99.95', '2022-02-14 00:00:00', 379.60, 379.63, 381.00, '381', 379.88, 8.38, 2.26, 324, 123081220, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (217, 'Au99.95', '2022-02-11 00:00:00', 369.10, 371.25, 373.40, '369.1', 371.25, -4.58, -1.22, 8, 2970000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (218, 'Au99.95', '2022-02-10 00:00:00', 375.80, 375.83, 376.00, '376', 375.87, 1.43, 0.38, 48, 18042000, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (219, 'Au99.95', '2022-02-09 00:00:00', 374.40, 374.40, 374.40, '374.4', 374.40, 1.34, 0.36, 2, 748800, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (220, 'Au99.95', '2022-02-08 00:00:00', 372.00, 373.06, 373.30, '373.3', 373.25, 2.36, 0.64, 134, 50015880, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (221, 'Au99.95', '2022-02-07 00:00:00', 370.70, 370.70, 370.70, '370.7', 370.70, 2.27, 0.62, 2, 741400, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (222, 'Au99.95', '2022-01-28 00:00:00', 368.30, 368.43, 368.50, '368.5', 368.37, -1.33, -0.36, 404, 148822500, '2023-06-29 10:38:04', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (223, 'Au99.95', '2022-01-27 00:00:00', 369.70, 369.76, 379.35, '371', 370.21, -7.10, -1.88, 218, 80707520, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (224, 'Au99.95', '2022-01-26 00:00:00', 376.70, 376.86, 377.00, '377', 376.86, 0.86, 0.23, 12, 4522400, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (225, 'Au99.95', '2022-01-25 00:00:00', 376.00, 376.00, 376.00, '376', 376.00, 0.70, 0.19, 18, 6768000, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (226, 'Au99.95', '2022-01-24 00:00:00', 375.20, 375.30, 375.60, '375.2', 375.30, -1.22, -0.32, 24, 9007200, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (227, 'Au99.95', '2022-01-21 00:00:00', 376.10, 376.52, 376.80, '376.1', 376.54, 0.33, 0.09, 100, 37654120, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (228, 'Au99.95', '2022-01-20 00:00:00', 373.50, 376.19, 376.50, '373.5', 376.24, 4.34, 1.17, 328, 123406800, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (229, 'Au99.95', '2022-01-19 00:00:00', 371.40, 371.85, 372.60, '372.6', 371.85, 0.15, 0.04, 54, 20080000, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (230, 'Au99.95', '2022-01-18 00:00:00', 371.65, 371.70, 372.70, '372.7', 371.85, -0.61, -0.16, 248, 92220300, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (231, 'Au99.95', '2022-01-17 00:00:00', 372.10, 372.31, 372.60, '372.1', 372.28, -1.86, -0.50, 304, 113175400, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (232, 'Au99.95', '2022-01-14 00:00:00', 374.15, 374.17, 374.70, '374.5', 374.29, -0.44, -0.12, 164, 61384560, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (233, 'Au99.95', '2022-01-13 00:00:00', 373.80, 374.61, 374.70, '373.8', 374.05, 1.06, 0.28, 152, 56856820, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (234, 'Au99.95', '2022-01-12 00:00:00', 373.40, 373.55, 373.60, '373.5', 373.48, 1.94, 0.52, 216, 80673820, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (235, 'Au99.95', '2022-01-11 00:00:00', 370.60, 371.61, 371.90, '370.6', 371.25, 2.88, 0.78, 222, 82418100, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (236, 'Au99.95', '2022-01-10 00:00:00', 368.50, 368.73, 369.05, '368.61', 368.64, 0.43, 0.12, 702, 258789220, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (237, 'Au99.95', '2022-01-07 00:00:00', 368.10, 368.30, 368.80, '368.3', 368.28, -1.87, -0.51, 220, 81023100, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (238, 'Au99.95', '2022-01-06 00:00:00', 370.15, 370.17, 372.00, '372', 371.04, -2.75, -0.74, 274, 101665520, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (239, 'Au99.95', '2022-01-05 00:00:00', 372.20, 372.92, 373.10, '372.2', 372.94, 1.92, 0.52, 294, 109646540, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (240, 'Au99.95', '2022-01-04 00:00:00', 370.85, 371.00, 371.40, '371.3', 371.02, -2.83, -0.76, 578, 214451120, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (241, 'Au99.95', '2021-12-31 00:00:00', 370.80, 373.83, 374.00, '370.8', 373.63, 4.29, 1.16, 264, 98640500, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (242, 'Au99.95', '2021-12-30 00:00:00', 369.50, 369.54, 370.80, '369.58', 370.16, -2.01, -0.54, 458, 169533760, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (243, 'Au99.95', '2021-12-29 00:00:00', 371.00, 371.55, 371.80, '371.2', 371.53, -1.83, -0.49, 266, 98829500, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (244, 'Au99.95', '2021-12-28 00:00:00', 372.00, 373.38, 373.40, '372.19', 372.49, 1.20, 0.32, 292, 108767840, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (245, 'Au99.95', '2021-12-27 00:00:00', 372.15, 372.18, 372.50, '372.3', 372.26, -0.09, -0.02, 182, 67752100, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (246, 'Au99.95', '2021-12-24 00:00:00', 370.30, 372.27, 372.60, '370.3', 372.11, 0.77, 0.21, 212, 78889000, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (247, 'Au99.95', '2021-12-23 00:00:00', 369.00, 371.50, 371.80, '369', 370.74, 3.67, 1.00, 168, 62285000, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (248, 'Au99.95', '2021-12-22 00:00:00', 367.80, 367.83, 368.60, '368.3', 368.27, -1.10, -0.30, 426, 156884100, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (249, 'Au99.95', '2021-12-21 00:00:00', 368.85, 368.93, 369.20, '368.85', 368.97, -2.53, -0.68, 210, 77485400, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (250, 'Au99.95', '2021-12-20 00:00:00', 371.05, 371.46, 372.05, '371.1', 371.22, -0.16, -0.04, 264, 98003100, '2023-06-29 10:38:05', '2023-06-29 13:26:01', 0);
INSERT INTO `trade` VALUES (251, 'Au99.95', '2021-12-17 00:00:00', 370.00, 371.62, 371.70, '370', 370.77, 4.22, 1.15, 170, 63031360, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (252, 'Au99.95', '2021-12-16 00:00:00', 366.50, 367.40, 372.00, '366.5', 366.92, 3.46, 0.95, 154, 56506100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (253, 'Au99.95', '2021-12-15 00:00:00', 363.70, 363.94, 367.00, '364.6', 364.26, -3.56, -0.97, 216, 78681200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (254, 'Au99.95', '2021-12-14 00:00:00', 367.40, 367.50, 367.80, '367.5', 367.61, 0.52, 0.14, 240, 88226800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (255, 'Au99.95', '2021-12-13 00:00:00', 366.90, 366.98, 367.30, '367', 367.13, 2.14, 0.59, 102, 37447580, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (256, 'Au99.95', '2021-12-10 00:00:00', 364.40, 364.84, 366.20, '366', 365.07, -1.32, -0.36, 846, 310252120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (257, 'Au99.95', '2021-12-09 00:00:00', 365.50, 366.16, 366.20, '366', 365.98, 0.60, 0.16, 206, 75407000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (258, 'Au99.95', '2021-12-08 00:00:00', 358.00, 365.56, 367.60, '367.2', 367.05, -1.14, -0.31, 532, 197622860, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (259, 'Au99.95', '2021-12-07 00:00:00', 356.99, 366.70, 378.25, '378.25', 366.56, -0.78, -0.21, 154, 56451080, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (260, 'Au99.95', '2021-12-06 00:00:00', 367.00, 367.48, 367.65, '367.5', 367.32, 2.78, 0.76, 164, 60241920, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (261, 'Au99.95', '2021-12-03 00:00:00', 364.35, 364.70, 365.50, '365.5', 364.69, -0.78, -0.21, 314, 114515740, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (262, 'Au99.95', '2021-12-02 00:00:00', 365.20, 365.48, 366.30, '366.2', 365.92, -1.37, -0.37, 186, 68062400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (263, 'Au99.95', '2021-12-01 00:00:00', 365.25, 366.85, 367.70, '365.25', 366.22, -1.77, -0.48, 172, 62990500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (264, 'Au99.95', '2021-11-30 00:00:00', 367.70, 368.62, 368.75, '367.7', 368.00, -1.00, -0.27, 226, 83168400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (265, 'Au99.95', '2021-11-29 00:00:00', 369.30, 369.62, 369.80, '369.5', 369.55, -1.39, -0.37, 120, 44346400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (266, 'Au99.95', '2021-11-26 00:00:00', 369.30, 371.01, 371.40, '369.3', 369.89, 1.70, 0.46, 422, 156093900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (267, 'Au99.95', '2021-11-25 00:00:00', 369.20, 369.31, 369.50, '369.3', 369.38, -0.40, -0.11, 454, 168171160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (268, 'Au99.95', '2021-11-24 00:00:00', 369.00, 369.71, 369.80, '369', 369.62, -1.95, -0.52, 218, 80578400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (269, 'Au99.95', '2021-11-23 00:00:00', 371.30, 371.66, 372.65, '372.65', 372.20, -7.39, -1.95, 122, 45408700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (270, 'Au99.95', '2021-11-22 00:00:00', 378.40, 379.05, 382.80, '382.8', 379.89, -2.91, -0.76, 124, 47106400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (271, 'Au99.95', '2021-11-19 00:00:00', 381.85, 381.96, 382.85, '382', 382.26, -0.87, -0.23, 270, 103211200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (272, 'Au99.95', '2021-11-18 00:00:00', 382.50, 382.83, 383.20, '382.5', 382.78, 1.97, 0.52, 118, 45168100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (273, 'Au99.95', '2021-11-17 00:00:00', 380.55, 380.86, 381.05, '380.55', 380.78, -1.70, -0.44, 174, 66257120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (274, 'Au99.95', '2021-11-16 00:00:00', 382.30, 382.56, 383.00, '383', 382.61, 1.91, 0.50, 202, 77287800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (275, 'Au99.95', '2021-11-15 00:00:00', 380.50, 380.65, 381.50, '381.5', 380.75, -1.23, -0.32, 330, 125649600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (276, 'Au99.95', '2021-11-12 00:00:00', 381.80, 381.88, 383.20, '383.2', 382.33, 0.00, 0.00, 234, 89467400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (277, 'Au99.95', '2021-11-11 00:00:00', 380.00, 381.88, 382.20, '381', 381.15, 5.88, 1.56, 96, 36591000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (278, 'Au99.95', '2021-11-10 00:00:00', 376.00, 376.00, 376.70, '376.3', 376.08, 0.05, 0.01, 300, 112824400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (279, 'Au99.95', '2021-11-09 00:00:00', 375.60, 375.95, 376.00, '376', 375.84, 1.20, 0.32, 122, 45852800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (280, 'Au99.95', '2021-11-08 00:00:00', 372.50, 374.75, 376.20, '372.5', 374.96, 4.09, 1.10, 168, 62994800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (281, 'Au99.95', '2021-11-05 00:00:00', 369.00, 370.66, 370.80, '369', 370.21, 5.15, 1.41, 152, 56272600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (282, 'Au99.95', '2021-11-04 00:00:00', 365.40, 365.51, 366.50, '366.45', 365.79, -1.51, -0.41, 318, 116321600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (283, 'Au99.95', '2021-11-03 00:00:00', 367.00, 367.02, 368.65, '368.65', 367.40, -3.03, -0.82, 140, 51436100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (284, 'Au99.95', '2021-11-02 00:00:00', 369.30, 370.05, 370.50, '369.4', 369.90, 2.11, 0.57, 178, 65843740, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (285, 'Au99.95', '2021-11-01 00:00:00', 367.80, 367.94, 368.70, '368.6', 368.30, -1.90, -0.51, 124, 45669800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (286, 'Au99.95', '2021-10-29 00:00:00', 368.95, 369.84, 370.20, '370', 369.99, -1.26, -0.34, 256, 94719600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (287, 'Au99.95', '2021-10-28 00:00:00', 368.00, 371.10, 371.30, '368', 370.38, 3.99, 1.09, 310, 114820600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (288, 'Au99.95', '2021-10-27 00:00:00', 367.00, 367.11, 368.00, '368', 367.33, -3.29, -0.89, 142, 52162200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (289, 'Au99.95', '2021-10-26 00:00:00', 370.30, 370.40, 370.80, '370.3', 370.55, 1.42, 0.38, 392, 145256760, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (290, 'Au99.95', '2021-10-25 00:00:00', 368.09, 368.98, 371.80, '371.8', 369.26, -0.48, -0.13, 102, 37665320, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (291, 'Au99.95', '2021-10-22 00:00:00', 368.00, 369.46, 369.80, '368', 368.60, 1.22, 0.33, 254, 93624600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (292, 'Au99.95', '2021-10-21 00:00:00', 367.99, 368.24, 368.60, '368', 368.28, 2.12, 0.58, 204, 75130280, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (293, 'Au99.95', '2021-10-20 00:00:00', 365.50, 366.12, 366.80, '365.5', 366.43, -1.12, -0.31, 44, 16123000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (294, 'Au99.95', '2021-10-19 00:00:00', 366.80, 367.24, 367.80, '366.85', 367.04, 0.84, 0.23, 258, 94697000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (295, 'Au99.95', '2021-10-18 00:00:00', 366.00, 366.40, 369.00, '369', 367.10, -5.07, -1.36, 422, 154919800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (296, 'Au99.95', '2021-10-15 00:00:00', 371.30, 371.47, 373.00, '372.5', 371.85, -0.53, -0.14, 494, 183709400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (297, 'Au99.95', '2021-10-14 00:00:00', 370.70, 372.00, 373.00, '370.7', 371.98, 5.09, 1.39, 380, 141355700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (298, 'Au99.95', '2021-10-13 00:00:00', 366.90, 366.91, 367.58, '367.58', 367.16, -0.06, -0.02, 272, 99868600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (299, 'Au99.95', '2021-10-12 00:00:00', 366.60, 366.97, 367.30, '366.8', 367.01, 1.77, 0.48, 574, 210665300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (300, 'Au99.95', '2021-10-11 00:00:00', 365.00, 365.20, 369.50, '369.5', 366.31, -1.53, -0.42, 274, 100371000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (301, 'Au99.95', '2021-10-08 00:00:00', 366.50, 366.73, 367.20, '367.2', 366.81, 4.66, 1.29, 298, 109309400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (302, 'Au99.95', '2021-09-30 00:00:00', 360.80, 362.07, 363.10, '362.55', 362.58, -1.37, -0.38, 384, 139231600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (303, 'Au99.95', '2021-09-29 00:00:00', 363.40, 363.44, 364.70, '364.7', 363.90, -0.76, -0.21, 500, 181830400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (304, 'Au99.95', '2021-09-28 00:00:00', 364.00, 364.20, 366.30, '366.1', 364.84, -3.22, -0.88, 676, 247713260, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (305, 'Au99.95', '2021-09-27 00:00:00', 367.00, 367.42, 367.65, '367', 367.32, 1.01, 0.28, 428, 157214860, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (306, 'Au99.95', '2021-09-24 00:00:00', 365.30, 366.41, 369.80, '369.8', 366.54, -2.03, -0.55, 598, 219194440, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (307, 'Au99.95', '2021-09-23 00:00:00', 366.80, 368.44, 371.70, '371.7', 369.21, -3.33, -0.90, 468, 172790820, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (308, 'Au99.95', '2021-09-22 00:00:00', 371.10, 371.77, 372.10, '371.5', 371.92, 4.76, 1.30, 904, 336052540, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (309, 'Au99.95', '2021-09-17 00:00:00', 362.35, 367.01, 367.60, '367.5', 366.83, -3.91, -1.05, 690, 254062820, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (310, 'Au99.95', '2021-09-16 00:00:00', 370.55, 370.92, 373.30, '373', 371.79, -3.54, -0.95, 1164, 466247820, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (311, 'Au99.95', '2021-09-15 00:00:00', 372.00, 374.46, 375.40, '372', 374.75, 1.55, 0.42, 550, 206114320, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (312, 'Au99.95', '2021-09-14 00:00:00', 372.50, 372.91, 392.70, '373', 375.04, 0.58, 0.16, 268, 100512460, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (313, 'Au99.95', '2021-09-13 00:00:00', 372.00, 372.33, 373.80, '373.8', 372.86, -2.05, -0.55, 304, 113350200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (314, 'Au99.95', '2021-09-10 00:00:00', 373.20, 374.38, 374.50, '374.49', 374.06, 1.88, 0.50, 214, 80050500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (315, 'Au99.95', '2021-09-09 00:00:00', 372.00, 372.50, 375.50, '375.5', 372.87, -1.64, -0.44, 432, 161080320, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (316, 'Au99.95', '2021-09-08 00:00:00', 373.70, 374.14, 378.50, '378.5', 374.90, -3.89, -1.03, 308, 115469700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (317, 'Au99.95', '2021-09-07 00:00:00', 377.90, 378.03, 379.80, '379.5', 378.44, -1.69, -0.45, 146, 55253620, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (318, 'Au99.95', '2021-09-06 00:00:00', 378.50, 379.72, 380.50, '378.5', 379.71, 2.71, 0.72, 312, 118471700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (319, 'Au99.95', '2021-09-03 00:00:00', 377.00, 377.01, 377.40, '377', 377.04, -0.29, -0.08, 230, 86720000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (320, 'Au99.95', '2021-09-02 00:00:00', 377.00, 377.30, 377.35, '377', 377.25, -0.20, -0.05, 64, 24144100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (321, 'Au99.95', '2021-09-01 00:00:00', 377.30, 377.50, 377.80, '377.3', 377.57, -0.39, -0.10, 192, 72495100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (322, 'Au99.95', '2021-08-31 00:00:00', 377.50, 377.89, 377.98, '377.8', 377.74, 0.19, 0.05, 210, 79325720, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (323, 'Au99.95', '2021-08-30 00:00:00', 377.00, 377.70, 378.50, '377', 377.77, 1.20, 0.32, 96, 36266000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (324, 'Au99.95', '2021-08-27 00:00:00', 375.00, 376.50, 376.50, '375', 375.93, 3.50, 0.94, 244, 91727000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (325, 'Au99.95', '2021-08-26 00:00:00', 372.95, 373.00, 373.60, '373.6', 373.20, -1.83, -0.49, 92, 34334600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (326, 'Au99.95', '2021-08-25 00:00:00', 374.60, 374.83, 375.00, '374.6', 374.79, -1.63, -0.43, 490, 183611900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (327, 'Au99.95', '2021-08-24 00:00:00', 376.20, 376.46, 376.50, '376.5', 376.41, 2.55, 0.68, 802, 301725600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (328, 'Au99.95', '2021-08-23 00:00:00', 373.85, 373.91, 374.00, '373.9', 373.91, -0.36, -0.10, 28, 10469600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (329, 'Au99.95', '2021-08-20 00:00:00', 373.80, 374.27, 374.40, '373.8', 373.92, 2.09, 0.56, 108, 40383800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (330, 'Au99.95', '2021-08-19 00:00:00', 372.00, 372.18, 373.20, '373', 372.52, -2.19, -0.59, 124, 46193600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (331, 'Au99.95', '2021-08-18 00:00:00', 373.90, 374.37, 374.65, '374.2', 374.20, 0.00, 0.00, 642, 240240160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (332, 'Au99.95', '2021-08-17 00:00:00', 372.00, 374.37, 374.65, '372', 374.09, 4.13, 1.12, 1114, 453214400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (333, 'Au99.95', '2021-08-16 00:00:00', 369.00, 370.24, 371.00, '369', 370.32, 3.08, 0.84, 126, 46660500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (334, 'Au99.95', '2021-08-13 00:00:00', 366.80, 367.16, 367.20, '366.8', 367.09, 0.15, 0.04, 472, 198782800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (335, 'Au99.95', '2021-08-12 00:00:00', 365.40, 367.01, 369.30, '365.6', 366.01, 4.62, 1.27, 1814, 673099400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (336, 'Au99.95', '2021-08-11 00:00:00', 362.30, 362.39, 381.80, '381.8', 363.40, -0.43, -0.12, 572, 231698160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (337, 'Au99.95', '2021-08-10 00:00:00', 362.50, 362.82, 363.80, '363.8', 362.97, -1.51, -0.41, 68, 24682400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (338, 'Au99.95', '2021-08-09 00:00:00', 363.00, 364.33, 364.65, '363', 363.89, -10.39, -2.77, 310, 112736000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (339, 'Au99.95', '2021-08-06 00:00:00', 374.00, 374.72, 374.90, '374.8', 374.73, -1.96, -0.52, 1220, 556902680, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (340, 'Au99.95', '2021-08-05 00:00:00', 376.50, 376.68, 379.00, '379', 376.89, -0.54, -0.14, 238, 89700900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (341, 'Au99.95', '2021-08-04 00:00:00', 377.10, 377.22, 377.50, '377.5', 377.22, 0.69, 0.18, 8, 3017800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (342, 'Au99.95', '2021-08-03 00:00:00', 376.25, 376.53, 377.40, '377.3', 377.09, -0.32, -0.08, 84, 31676180, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (343, 'Au99.95', '2021-08-02 00:00:00', 376.20, 376.85, 377.15, '376.2', 376.85, -3.64, -0.96, 22, 8290700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (344, 'Au99.95', '2021-07-30 00:00:00', 380.00, 380.49, 380.50, '380', 380.35, 1.59, 0.42, 170, 64660940, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (345, 'Au99.95', '2021-07-29 00:00:00', 378.55, 378.90, 379.40, '379.4', 378.98, 0.92, 0.24, 34, 12885600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (346, 'Au99.95', '2021-07-28 00:00:00', 377.25, 377.98, 378.55, '377.25', 377.98, 3.78, 1.01, 328, 123978500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (347, 'Au99.95', '2021-07-27 00:00:00', 374.15, 374.20, 375.20, '375.2', 374.50, -2.77, -0.73, 216, 80892380, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (348, 'Au99.95', '2021-07-26 00:00:00', 376.60, 376.97, 377.50, '376.6', 376.98, 0.73, 0.19, 460, 173355520, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (349, 'Au99.95', '2021-07-23 00:00:00', 375.50, 376.24, 376.40, '375.9', 375.95, 1.65, 0.44, 136, 51130300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (350, 'Au99.95', '2021-07-22 00:00:00', 374.40, 374.59, 375.00, '375', 374.68, -2.61, -0.69, 164, 61486300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (351, 'Au99.95', '2021-07-21 00:00:00', 376.00, 377.20, 380.00, '380', 377.83, -1.69, -0.45, 126, 47607800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (352, 'Au99.95', '2021-07-20 00:00:00', 378.70, 378.89, 379.30, '378.8', 378.93, 2.51, 0.67, 54, 20462700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (353, 'Au99.95', '2021-07-19 00:00:00', 375.00, 376.38, 378.30, '375.2', 376.70, -3.52, -0.93, 102, 38423980, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (354, 'Au99.95', '2021-07-16 00:00:00', 378.80, 379.90, 380.30, '380.2', 379.87, -0.27, -0.07, 140, 53182700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (355, 'Au99.95', '2021-07-15 00:00:00', 378.80, 380.17, 380.30, '380', 379.86, 2.50, 0.66, 294, 111680800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (356, 'Au99.95', '2021-07-14 00:00:00', 377.60, 377.67, 378.00, '378', 377.73, 1.10, 0.29, 164, 61948000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (357, 'Au99.95', '2021-07-13 00:00:00', 375.00, 376.57, 376.97, '375', 376.72, 1.53, 0.41, 178, 67057280, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (358, 'Au99.95', '2021-07-12 00:00:00', 374.95, 375.04, 376.60, '376.6', 375.32, -0.68, -0.18, 334, 125593160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (359, 'Au99.95', '2021-07-09 00:00:00', 375.30, 375.72, 376.90, '376.9', 376.01, 0.92, 0.25, 98, 36849200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (360, 'Au99.95', '2021-07-08 00:00:00', 373.00, 374.80, 375.20, '375', 374.77, -0.51, -0.14, 332, 126304680, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (361, 'Au99.95', '2021-07-07 00:00:00', 375.00, 375.31, 376.05, '375.5', 375.12, -0.09, -0.02, 118, 44265200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (362, 'Au99.95', '2021-07-06 00:00:00', 375.40, 375.40, 375.60, '375.6', 375.43, 3.35, 0.90, 32, 12014000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (363, 'Au99.95', '2021-07-05 00:00:00', 372.00, 372.05, 372.20, '372.2', 372.05, 1.01, 0.27, 22, 8185200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (364, 'Au99.95', '2021-07-02 00:00:00', 371.00, 371.04, 371.30, '371', 371.10, 0.57, 0.15, 152, 56407600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (365, 'Au99.95', '2021-07-01 00:00:00', 369.50, 370.47, 370.55, '369.5', 370.29, 4.37, 1.19, 32, 11849300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (366, 'Au99.95', '2021-06-30 00:00:00', 366.00, 366.10, 367.30, '367.3', 366.68, -3.25, -0.88, 396, 145208300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (367, 'Au99.95', '2021-06-29 00:00:00', 369.00, 369.35, 369.95, '369.6', 369.63, -1.67, -0.45, 498, 184246560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (368, 'Au99.95', '2021-06-28 00:00:00', 369.10, 371.02, 371.40, '369.1', 370.34, 1.00, 0.27, 496, 183285580, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (369, 'Au99.95', '2021-06-25 00:00:00', 369.90, 370.02, 370.65, '370.3', 370.36, -0.52, -0.14, 312, 115552700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (370, 'Au99.95', '2021-06-24 00:00:00', 370.50, 370.54, 371.20, '371.1', 370.96, -1.51, -0.41, 276, 102386200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (371, 'Au99.95', '2021-06-23 00:00:00', 371.75, 372.05, 372.50, '371.75', 372.13, 0.68, 0.18, 432, 160798600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (372, 'Au99.95', '2021-06-22 00:00:00', 371.30, 371.37, 372.58, '372', 371.83, 1.33, 0.36, 374, 138993240, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (373, 'Au99.95', '2021-06-21 00:00:00', 369.00, 370.04, 370.30, '369.69', 369.80, -0.55, -0.15, 66, 24406860, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (374, 'Au99.95', '2021-06-18 00:00:00', 370.20, 370.59, 370.85, '370.5', 370.60, -3.71, -0.99, 230, 85240200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (375, 'Au99.95', '2021-06-17 00:00:00', 374.20, 374.30, 381.00, '381', 375.19, -6.57, -1.73, 548, 212555420, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (376, 'Au99.95', '2021-06-16 00:00:00', 379.20, 380.87, 381.20, '379.4', 379.73, -0.65, -0.17, 666, 252901740, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (377, 'Au99.95', '2021-06-15 00:00:00', 379.50, 381.52, 381.60, '379.5', 380.88, -6.56, -1.69, 452, 172157900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (378, 'Au99.95', '2021-06-11 00:00:00', 387.00, 388.08, 388.60, '387', 387.93, 3.22, 0.84, 878, 340604500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (379, 'Au99.95', '2021-06-10 00:00:00', 384.40, 384.86, 385.65, '384.4', 384.59, -0.95, -0.25, 310, 119223200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (380, 'Au99.95', '2021-06-09 00:00:00', 385.60, 385.81, 386.40, '386.4', 385.91, -0.31, -0.08, 330, 127351500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (381, 'Au99.95', '2021-06-08 00:00:00', 385.65, 386.12, 387.30, '387.3', 386.11, 2.42, 0.63, 748, 288810400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (382, 'Au99.95', '2021-06-07 00:00:00', 383.65, 383.70, 384.45, '383.8', 383.81, 3.60, 0.95, 212, 81368520, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (383, 'Au99.95', '2021-06-04 00:00:00', 376.00, 380.10, 380.70, '376', 377.31, -5.80, -1.50, 116, 43768200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (384, 'Au99.95', '2021-06-03 00:00:00', 385.00, 385.90, 389.20, '388.6', 387.52, -1.63, -0.42, 172, 66653760, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (385, 'Au99.95', '2021-06-02 00:00:00', 387.00, 387.53, 390.40, '390.4', 388.00, -5.95, -1.51, 220, 85360800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (386, 'Au99.95', '2021-06-01 00:00:00', 391.60, 393.48, 393.50, '391.6', 392.87, 1.99, 0.51, 246, 96646480, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (387, 'Au99.95', '2021-05-31 00:00:00', 390.80, 391.49, 392.05, '391.8', 391.67, 2.82, 0.73, 78, 30550500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (388, 'Au99.95', '2021-05-28 00:00:00', 388.30, 388.67, 389.81, '389.81', 389.12, -2.22, -0.57, 108, 42026020, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (389, 'Au99.95', '2021-05-27 00:00:00', 390.50, 390.89, 391.75, '390.7', 390.94, -2.17, -0.55, 172, 67242560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (390, 'Au99.95', '2021-05-26 00:00:00', 392.50, 393.06, 393.40, '393.25', 392.67, 3.61, 0.93, 170, 66754180, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (391, 'Au99.95', '2021-05-25 00:00:00', 387.50, 389.45, 389.75, '387.5', 388.57, -1.22, -0.31, 98, 38080740, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (392, 'Au99.95', '2021-05-24 00:00:00', 390.50, 390.67, 391.61, '391.31', 390.96, 1.51, 0.39, 58, 22675760, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (393, 'Au99.95', '2021-05-21 00:00:00', 389.00, 389.16, 389.90, '389.9', 389.20, -0.25, -0.06, 32, 12454600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (394, 'Au99.95', '2021-05-20 00:00:00', 389.00, 389.41, 392.00, '392', 389.95, 0.70, 0.18, 564, 219935840, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (395, 'Au99.95', '2021-05-19 00:00:00', 387.20, 388.71, 389.00, '387.3', 388.05, 0.41, 0.11, 262, 101670760, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (396, 'Au99.95', '2021-05-18 00:00:00', 384.80, 388.30, 389.20, '384.8', 388.65, 2.92, 0.76, 328, 127479280, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (397, 'Au99.95', '2021-05-17 00:00:00', 385.10, 385.38, 385.90, '385.7', 385.57, 4.69, 1.23, 98, 37785900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (398, 'Au99.95', '2021-05-14 00:00:00', 379.00, 380.69, 381.00, '379', 379.74, 1.15, 0.30, 270, 102532400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (399, 'Au99.95', '2021-05-13 00:00:00', 379.10, 379.54, 380.00, '379.7', 379.75, -1.40, -0.37, 170, 64557900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (400, 'Au99.95', '2021-05-12 00:00:00', 379.50, 380.94, 381.30, '380.2', 380.25, -0.32, -0.08, 258, 98105900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (401, 'Au99.95', '2021-05-11 00:00:00', 380.30, 381.26, 381.75, '380.3', 380.92, 1.05, 0.28, 166, 63233560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (402, 'Au99.95', '2021-05-10 00:00:00', 380.00, 380.21, 381.70, '381', 380.77, 1.01, 0.27, 138, 52546780, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (403, 'Au99.95', '2021-05-07 00:00:00', 376.00, 379.20, 379.60, '376', 378.73, 3.78, 1.01, 134, 50750600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (404, 'Au99.95', '2021-05-06 00:00:00', 374.00, 375.42, 375.50, '374', 374.61, 5.05, 1.36, 502, 188056920, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (405, 'Au99.95', '2021-04-30 00:00:00', 369.00, 370.37, 370.60, '369.3', 369.78, -1.43, -0.38, 316, 116852000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (406, 'Au99.95', '2021-04-29 00:00:00', 371.50, 371.80, 374.20, '373.85', 372.68, 1.47, 0.40, 606, 225849200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (407, 'Au99.95', '2021-04-28 00:00:00', 370.00, 370.33, 371.40, '370.8', 370.70, -2.67, -0.72, 352, 130489400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (408, 'Au99.95', '2021-04-27 00:00:00', 372.00, 373.00, 373.00, '372.5', 372.71, 0.49, 0.13, 250, 93179480, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (409, 'Au99.95', '2021-04-26 00:00:00', 372.30, 372.51, 373.60, '373.2', 373.02, -1.83, -0.49, 288, 107432140, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (410, 'Au99.95', '2021-04-23 00:00:00', 374.00, 374.34, 375.00, '374.9', 374.44, -0.90, -0.24, 312, 116826280, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (411, 'Au99.95', '2021-04-22 00:00:00', 375.15, 375.24, 376.35, '376.35', 375.73, 0.55, 0.15, 310, 116476640, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (412, 'Au99.95', '2021-04-21 00:00:00', 373.60, 374.69, 375.08, '373.69', 374.18, 3.18, 0.86, 378, 141441720, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (413, 'Au99.95', '2021-04-20 00:00:00', 370.80, 371.51, 372.00, '372', 371.29, -3.38, -0.90, 410, 152229300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (414, 'Au99.95', '2021-04-19 00:00:00', 374.30, 374.89, 375.50, '375', 374.87, 3.08, 0.83, 212, 79474160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (415, 'Au99.95', '2021-04-16 00:00:00', 371.30, 371.81, 372.30, '371.9', 371.80, 3.38, 0.92, 836, 310828480, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (416, 'Au99.95', '2021-04-15 00:00:00', 366.50, 368.43, 368.50, '367', 367.36, -0.51, -0.14, 404, 148415000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (417, 'Au99.95', '2021-04-14 00:00:00', 368.00, 368.94, 369.00, '368', 368.47, 3.77, 1.03, 290, 106856940, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (418, 'Au99.95', '2021-04-13 00:00:00', 364.90, 365.17, 368.00, '368', 365.91, -3.24, -0.88, 254, 92943160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (419, 'Au99.95', '2021-04-12 00:00:00', 367.50, 368.41, 368.80, '368.8', 368.06, -1.86, -0.50, 510, 187714540, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (420, 'Au99.95', '2021-04-09 00:00:00', 370.00, 370.27, 371.80, '371.8', 370.68, 1.31, 0.36, 226, 83774000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (421, 'Au99.95', '2021-04-08 00:00:00', 367.10, 368.96, 369.00, '367.3', 368.01, 1.24, 0.34, 640, 235531400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (422, 'Au99.95', '2021-04-07 00:00:00', 366.90, 367.72, 368.00, '367.2', 367.34, 2.09, 0.57, 280, 102855600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (423, 'Au99.95', '2021-04-06 00:00:00', 365.50, 365.63, 367.85, '367.5', 367.12, -2.73, -0.74, 574, 210728600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (424, 'Au99.95', '2021-04-02 00:00:00', 367.60, 368.36, 368.70, '367.6', 368.34, 3.64, 1.00, 270, 99453200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (425, 'Au99.95', '2021-04-01 00:00:00', 361.20, 364.72, 390.10, '361.2', 362.96, 7.84, 2.20, 424, 153897480, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (426, 'Au99.95', '2021-03-31 00:00:00', 355.20, 356.88, 357.00, '356.1', 356.22, -3.77, -1.05, 246, 87630200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (427, 'Au99.95', '2021-03-30 00:00:00', 360.50, 360.65, 362.80, '362.3', 361.63, -4.75, -1.30, 272, 98363580, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (428, 'Au99.95', '2021-03-29 00:00:00', 365.00, 365.40, 365.85, '365.5', 365.50, 0.23, 0.06, 634, 231728480, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (429, 'Au99.95', '2021-03-26 00:00:00', 364.30, 365.17, 366.60, '366.6', 364.88, -0.54, -0.15, 716, 261259060, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (430, 'Au99.95', '2021-03-25 00:00:00', 365.50, 365.71, 366.70, '366.1', 366.00, 1.01, 0.28, 676, 247419160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (431, 'Au99.95', '2021-03-24 00:00:00', 364.00, 364.70, 365.50, '364', 364.81, -1.03, -0.28, 532, 194082040, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (432, 'Au99.95', '2021-03-23 00:00:00', 364.30, 365.73, 365.80, '365', 364.83, 1.53, 0.42, 1430, 521719380, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (433, 'Au99.95', '2021-03-22 00:00:00', 364.00, 364.20, 366.10, '365.5', 364.63, -1.79, -0.49, 290, 105743000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (434, 'Au99.95', '2021-03-19 00:00:00', 363.90, 365.99, 366.40, '364', 364.53, -1.45, -0.39, 388, 141441120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (435, 'Au99.95', '2021-03-18 00:00:00', 367.30, 367.44, 368.00, '367.6', 367.60, 2.84, 0.78, 312, 114691420, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (436, 'Au99.95', '2021-03-17 00:00:00', 364.20, 364.60, 364.80, '364.4', 364.48, 1.12, 0.31, 170, 61962500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (437, 'Au99.95', '2021-03-16 00:00:00', 363.20, 363.48, 364.70, '364', 364.06, 0.88, 0.24, 452, 164558180, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (438, 'Au99.95', '2021-03-15 00:00:00', 362.50, 362.60, 364.45, '364.45', 363.29, 2.80, 0.78, 270, 98088300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (439, 'Au99.95', '2021-03-12 00:00:00', 359.20, 359.80, 362.40, '362.35', 360.14, -4.82, -1.32, 578, 208162200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (440, 'Au99.95', '2021-03-11 00:00:00', 363.00, 364.62, 365.00, '363', 364.02, 3.64, 1.01, 436, 158713900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (441, 'Au99.95', '2021-03-10 00:00:00', 360.00, 360.98, 361.50, '361', 360.74, 3.81, 1.07, 480, 173155620, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (442, 'Au99.95', '2021-03-09 00:00:00', 355.70, 357.17, 357.70, '357', 356.34, -1.69, -0.47, 514, 183108580, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (443, 'Au99.95', '2021-03-08 00:00:00', 358.40, 358.86, 359.80, '358.5', 359.27, 3.86, 1.09, 448, 160953360, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (444, 'Au99.95', '2021-03-05 00:00:00', 353.61, 355.00, 355.00, '353.81', 354.42, -3.42, -0.95, 282, 99947660, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (445, 'Au99.95', '2021-03-04 00:00:00', 357.00, 358.42, 367.20, '367.2', 358.01, -3.21, -0.89, 338, 121008800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (446, 'Au99.95', '2021-03-03 00:00:00', 361.00, 361.63, 362.60, '362.6', 361.65, 2.09, 0.58, 728, 263282460, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (447, 'Au99.95', '2021-03-02 00:00:00', 357.80, 359.54, 359.80, '358.5', 358.64, -6.80, -1.86, 256, 91812200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (448, 'Au99.95', '2021-03-01 00:00:00', 364.20, 366.34, 366.50, '364.3', 365.29, -1.43, -0.39, 254, 92785540, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (449, 'Au99.95', '2021-02-26 00:00:00', 367.00, 367.77, 372.30, '372.3', 368.94, -5.73, -1.53, 516, 190374060, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (450, 'Au99.95', '2021-02-25 00:00:00', 373.40, 373.50, 375.20, '375.15', 373.86, -3.20, -0.85, 924, 345451900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (451, 'Au99.95', '2021-02-24 00:00:00', 376.70, 376.70, 377.70, '377.6', 377.06, -1.12, -0.30, 630, 237550400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (452, 'Au99.95', '2021-02-23 00:00:00', 375.00, 377.82, 378.60, '375.3', 378.04, 3.62, 0.97, 612, 231364400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (453, 'Au99.95', '2021-02-22 00:00:00', 370.60, 374.20, 374.50, '370.6', 373.55, 4.36, 1.18, 488, 182293800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (454, 'Au99.95', '2021-02-19 00:00:00', 348.98, 369.84, 371.56, '348.98', 368.71, -1.72, -0.46, 416, 153385660, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (455, 'Au99.95', '2021-02-18 00:00:00', 370.40, 371.56, 371.80, '370.6', 371.26, -10.72, -2.80, 558, 206939600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (456, 'Au99.95', '2021-02-10 00:00:00', 381.20, 382.28, 382.40, '381.2', 381.95, 0.31, 0.08, 206, 78682680, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (457, 'Au99.95', '2021-02-09 00:00:00', 381.49, 381.97, 382.50, '381.49', 381.93, 4.35, 1.15, 316, 120691760, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (458, 'Au99.95', '2021-02-08 00:00:00', 377.00, 377.62, 378.30, '377', 377.40, 1.83, 0.49, 440, 166059100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (459, 'Au99.95', '2021-02-05 00:00:00', 374.50, 375.79, 376.00, '374.99', 374.91, -3.01, -0.79, 296, 110973360, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (460, 'Au99.95', '2021-02-04 00:00:00', 377.00, 378.80, 380.00, '380', 377.57, -3.24, -0.85, 570, 215217800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (461, 'Au99.95', '2021-02-03 00:00:00', 382.00, 382.04, 383.50, '383.5', 382.93, -3.62, -0.94, 464, 177683200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (462, 'Au99.95', '2021-02-02 00:00:00', 385.50, 385.66, 389.10, '389.1', 387.39, -2.74, -0.71, 398, 154184400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (463, 'Au99.95', '2021-02-01 00:00:00', 384.00, 388.40, 389.00, '384.01', 387.69, 4.14, 1.08, 210, 81415100, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (464, 'Au99.95', '2021-01-29 00:00:00', 383.70, 384.26, 384.90, '383.7', 384.03, 1.19, 0.31, 266, 102153320, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (465, 'Au99.95', '2021-01-28 00:00:00', 383.00, 383.07, 385.80, '385.8', 383.51, -1.92, -0.50, 416, 159541980, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (466, 'Au99.95', '2021-01-27 00:00:00', 383.60, 384.99, 394.10, '384.1', 385.22, -2.01, -0.52, 484, 186449780, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (467, 'Au99.95', '2021-01-26 00:00:00', 386.50, 387.00, 387.75, '386.5', 387.12, 1.02, 0.26, 330, 127752340, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (468, 'Au99.95', '2021-01-25 00:00:00', 369.00, 385.98, 387.80, '387.5', 386.22, -1.90, -0.49, 514, 198521040, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (469, 'Au99.95', '2021-01-22 00:00:00', 387.30, 387.88, 388.16, '388.16', 387.79, -1.56, -0.40, 278, 107807520, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (470, 'Au99.95', '2021-01-21 00:00:00', 388.45, 389.44, 390.00, '388.5', 389.21, 3.40, 0.88, 210, 81734880, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (471, 'Au99.95', '2021-01-20 00:00:00', 385.30, 386.04, 386.39, '385.3', 385.95, 1.89, 0.49, 320, 123504800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (472, 'Au99.95', '2021-01-19 00:00:00', 376.99, 384.15, 385.50, '376.99', 384.52, -0.17, -0.04, 304, 116894960, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (473, 'Au99.95', '2021-01-18 00:00:00', 381.20, 384.32, 384.60, '381.2', 383.00, -0.55, -0.14, 298, 114135260, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (474, 'Au99.95', '2021-01-15 00:00:00', 384.00, 384.87, 387.00, '387', 385.70, 0.62, 0.16, 2914, 1124376260, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (475, 'Au99.95', '2021-01-14 00:00:00', 383.00, 384.25, 386.00, '385.8', 384.68, -1.92, -0.50, 2330, 897586400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (476, 'Au99.95', '2021-01-13 00:00:00', 384.40, 386.17, 393.00, '393', 386.59, -0.62, -0.16, 264, 102062080, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (477, 'Au99.95', '2021-01-12 00:00:00', 384.80, 386.79, 387.50, '384.8', 385.81, 2.82, 0.73, 616, 237716560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (478, 'Au99.95', '2021-01-11 00:00:00', 378.00, 383.97, 384.90, '378', 382.32, -11.55, -2.92, 758, 289750580, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (479, 'Au99.95', '2021-01-08 00:00:00', 394.20, 395.52, 396.60, '396.6', 395.21, -2.42, -0.61, 658, 260053700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (480, 'Au99.95', '2021-01-07 00:00:00', 395.50, 397.94, 398.72, '396', 396.13, -2.27, -0.57, 254, 100617480, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (481, 'Au99.95', '2021-01-06 00:00:00', 400.00, 400.21, 402.00, '402', 400.54, -0.93, -0.23, 486, 194665600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (482, 'Au99.95', '2021-01-05 00:00:00', 399.00, 401.14, 404.50, '399.5', 399.38, 3.67, 0.92, 270, 107833500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (483, 'Au99.95', '2021-01-04 00:00:00', 396.30, 397.47, 398.00, '396.3', 397.34, 5.06, 1.29, 426, 169267700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (484, 'Au99.95', '2020-12-31 00:00:00', 391.00, 392.41, 394.00, '391', 392.55, 2.41, 0.62, 414, 162519780, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (485, 'Au99.95', '2020-12-30 00:00:00', 389.90, 390.00, 391.00, '391', 390.31, 0.45, 0.12, 656, 256044380, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (486, 'Au99.95', '2020-12-29 00:00:00', 389.00, 389.55, 394.55, '393.5', 391.23, -2.05, -0.52, 586, 229265660, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (487, 'Au99.95', '2020-12-28 00:00:00', 391.00, 391.60, 395.40, '394.7', 393.13, -0.32, -0.08, 782, 307428760, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (488, 'Au99.95', '2020-12-25 00:00:00', 390.00, 391.92, 392.20, '390.5', 390.91, 2.41, 0.62, 460, 179818860, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (489, 'Au99.95', '2020-12-24 00:00:00', 389.50, 389.51, 391.20, '391.1', 390.78, 0.81, 0.21, 464, 181323880, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (490, 'Au99.95', '2020-12-23 00:00:00', 388.40, 388.70, 390.00, '390', 389.11, -0.80, -0.21, 816, 317520220, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (491, 'Au99.95', '2020-12-22 00:00:00', 389.50, 389.50, 392.50, '390.9', 390.90, -6.80, -1.72, 650, 254088000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (492, 'Au99.95', '2020-12-21 00:00:00', 393.20, 396.30, 397.35, '396.01', 395.40, 5.69, 1.46, 516, 204030220, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (493, 'Au99.95', '2020-12-18 00:00:00', 389.50, 390.61, 391.30, '389.5', 390.41, 2.51, 0.65, 312, 121810120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (494, 'Au99.95', '2020-12-17 00:00:00', 386.70, 388.10, 388.40, '387', 387.25, 2.17, 0.56, 154, 59636680, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (495, 'Au99.95', '2020-12-16 00:00:00', 380.00, 385.93, 386.45, '383', 385.73, 2.41, 0.63, 360, 138865920, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (496, 'Au99.95', '2020-12-15 00:00:00', 381.00, 383.52, 383.60, '381', 383.02, 2.95, 0.78, 302, 115674980, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (497, 'Au99.95', '2020-12-14 00:00:00', 380.40, 380.57, 381.78, '381', 381.00, -1.79, -0.47, 344, 131065560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (498, 'Au99.95', '2020-12-11 00:00:00', 380.10, 382.36, 386.20, '381.5', 380.78, 1.36, 0.36, 338, 128712200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (499, 'Au99.95', '2020-12-10 00:00:00', 381.00, 381.00, 382.68, '382', 381.57, -3.62, -0.94, 214, 81657180, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (500, 'Au99.95', '2020-12-09 00:00:00', 379.50, 384.62, 389.00, '379.5', 385.30, -2.38, -0.62, 428, 164911560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (501, 'Au99.95', '2020-12-08 00:00:00', 382.00, 387.00, 387.70, '382', 386.56, 5.36, 1.40, 348, 134523600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (502, 'Au99.95', '2020-12-07 00:00:00', 380.90, 381.64, 381.90, '381', 381.45, -0.27, -0.07, 2202, 839754900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (503, 'Au99.95', '2020-12-04 00:00:00', 381.52, 381.91, 383.00, '381.52', 382.28, 0.29, 0.08, 236, 90218120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (504, 'Au99.95', '2020-12-03 00:00:00', 379.00, 381.62, 381.65, '379', 380.78, 3.87, 1.02, 248, 94434000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (505, 'Au99.95', '2020-12-02 00:00:00', 376.30, 377.75, 378.00, '377.4', 377.13, 5.65, 1.52, 406, 153115720, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (506, 'Au99.95', '2020-12-01 00:00:00', 368.00, 372.10, 372.80, '368', 371.94, 3.84, 1.04, 240, 89266900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (507, 'Au99.95', '2020-11-30 00:00:00', 362.99, 368.26, 372.30, '372.3', 365.23, -10.19, -2.69, 1430, 522281980, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (508, 'Au99.95', '2020-11-27 00:00:00', 378.20, 378.45, 378.85, '378.5', 378.63, -0.17, -0.04, 380, 143882080, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (509, 'Au99.95', '2020-11-26 00:00:00', 377.90, 378.62, 378.80, '378.6', 378.19, 0.32, 0.08, 314, 118752600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (510, 'Au99.95', '2020-11-25 00:00:00', 377.50, 378.30, 387.30, '387.3', 379.05, -4.36, -1.14, 660, 250174400, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (511, 'Au99.95', '2020-11-24 00:00:00', 381.69, 382.66, 382.80, '382.3', 382.13, -8.74, -2.23, 406, 155145820, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (512, 'Au99.95', '2020-11-23 00:00:00', 391.00, 391.40, 392.00, '391.4', 391.47, 0.10, 0.03, 864, 338235380, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (513, 'Au99.95', '2020-11-20 00:00:00', 391.00, 391.30, 391.80, '391.3', 391.29, 0.43, 0.11, 248, 97040600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (514, 'Au99.95', '2020-11-19 00:00:00', 390.85, 390.87, 391.90, '391.6', 391.38, -1.59, -0.41, 246, 96281660, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (515, 'Au99.95', '2020-11-18 00:00:00', 392.30, 392.46, 393.30, '393', 392.62, -2.48, -0.63, 214, 84022000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (516, 'Au99.95', '2020-11-17 00:00:00', 394.50, 394.94, 395.60, '395', 395.02, -0.10, -0.03, 246, 97176220, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (517, 'Au99.95', '2020-11-16 00:00:00', 395.00, 395.04, 397.40, '397.4', 395.75, -0.15, -0.04, 280, 110810700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (518, 'Au99.95', '2020-11-13 00:00:00', 395.00, 395.19, 395.80, '395.8', 395.64, 0.87, 0.22, 166, 65677300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (519, 'Au99.95', '2020-11-12 00:00:00', 393.75, 394.32, 394.50, '393.9', 394.19, -5.21, -1.30, 578, 213292160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (520, 'Au99.95', '2020-11-11 00:00:00', 394.00, 399.53, 399.90, '394', 394.49, 3.57, 0.90, 292, 115192740, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (521, 'Au99.95', '2020-11-10 00:00:00', 392.50, 395.96, 396.10, '392.5', 394.51, -11.45, -2.81, 372, 146761200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (522, 'Au99.95', '2020-11-09 00:00:00', 397.81, 407.41, 408.50, '408.5', 407.83, 0.39, 0.10, 384, 156609700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (523, 'Au99.95', '2020-11-06 00:00:00', 406.90, 407.02, 407.60, '407', 407.10, 4.15, 1.03, 478, 194594600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (524, 'Au99.95', '2020-11-05 00:00:00', 401.20, 402.87, 403.00, '401.2', 402.62, 0.49, 0.12, 472, 190038680, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (525, 'Au99.95', '2020-11-04 00:00:00', 402.10, 402.38, 404.00, '404', 403.29, 0.83, 0.21, 502, 202454900, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (526, 'Au99.95', '2020-11-03 00:00:00', 401.00, 401.55, 401.70, '401.6', 401.45, 1.86, 0.47, 302, 121239200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (527, 'Au99.95', '2020-11-02 00:00:00', 398.75, 399.69, 399.70, '398.8', 399.01, 3.12, 0.79, 340, 135666200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (528, 'Au99.95', '2020-10-30 00:00:00', 395.10, 396.57, 397.20, '396.5', 396.68, -2.48, -0.62, 386, 153120960, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (529, 'Au99.95', '2020-10-29 00:00:00', 398.50, 399.05, 399.50, '399.5', 398.90, -5.50, -1.36, 632, 252105220, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (530, 'Au99.95', '2020-10-28 00:00:00', 400.29, 404.55, 405.00, '400.29', 404.36, 0.62, 0.15, 584, 236150060, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (531, 'Au99.95', '2020-10-27 00:00:00', 403.80, 403.93, 404.00, '404', 403.90, 2.91, 0.73, 516, 208414000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (532, 'Au99.95', '2020-10-26 00:00:00', 400.00, 401.02, 401.30, '401.1', 400.70, -1.36, -0.34, 562, 225194560, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (533, 'Au99.95', '2020-10-23 00:00:00', 401.00, 402.38, 402.70, '402.5', 402.09, -1.13, -0.28, 480, 193004300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (534, 'Au99.95', '2020-10-22 00:00:00', 403.00, 403.51, 403.60, '403', 403.21, -0.09, -0.02, 310, 124996800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (535, 'Au99.95', '2020-10-21 00:00:00', 403.40, 403.60, 404.50, '404.5', 404.06, 1.63, 0.41, 424, 171321800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (536, 'Au99.95', '2020-10-20 00:00:00', 401.20, 401.97, 402.29, '401.7', 401.90, -1.90, -0.47, 290, 116553120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (537, 'Au99.95', '2020-10-19 00:00:00', 401.60, 403.87, 404.00, '401.8', 402.57, 0.55, 0.14, 380, 152978800, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (538, 'Au99.95', '2020-10-16 00:00:00', 403.00, 403.32, 404.11, '404.11', 403.71, 1.03, 0.26, 368, 148566120, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (539, 'Au99.95', '2020-10-15 00:00:00', 401.30, 402.29, 402.40, '401.5', 401.88, 0.21, 0.05, 322, 129406500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (540, 'Au99.95', '2020-10-14 00:00:00', 401.00, 402.08, 402.50, '401', 401.35, -4.68, -1.15, 204, 81875500, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (541, 'Au99.95', '2020-10-13 00:00:00', 406.40, 406.76, 408.00, '408', 406.91, -1.52, -0.37, 332, 135096000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (542, 'Au99.95', '2020-10-12 00:00:00', 407.20, 408.28, 409.50, '407.2', 408.85, 4.24, 1.05, 594, 242862040, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (543, 'Au99.95', '2020-10-09 00:00:00', 403.00, 404.04, 405.00, '403', 404.19, 0.44, 0.11, 442, 178654320, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (544, 'Au99.95', '2020-09-30 00:00:00', 402.80, 403.60, 404.70, '404.7', 404.08, 0.10, 0.02, 210, 84858200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (545, 'Au99.95', '2020-09-29 00:00:00', 402.00, 403.50, 404.00, '402.8', 403.08, 4.30, 1.08, 356, 143496540, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (546, 'Au99.95', '2020-09-28 00:00:00', 398.00, 399.20, 399.35, '398.8', 398.46, -0.60, -0.15, 602, 239877140, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (547, 'Au99.95', '2020-09-25 00:00:00', 397.40, 399.80, 399.90, '397.4', 398.88, 5.80, 1.47, 330, 131632080, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (548, 'Au99.95', '2020-09-24 00:00:00', 393.50, 394.00, 398.00, '398', 394.53, -6.95, -1.73, 368, 145190280, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (549, 'Au99.95', '2020-09-23 00:00:00', 399.00, 400.95, 405.20, '405.2', 402.68, -4.04, -1.00, 116, 46711000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (550, 'Au99.95', '2020-09-22 00:00:00', 404.00, 404.99, 406.50, '405.6', 405.02, -9.51, -2.29, 202, 81814360, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (551, 'Au99.95', '2020-09-21 00:00:00', 414.50, 414.50, 416.00, '416', 414.82, -0.29, -0.07, 452, 187501520, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (552, 'Au99.95', '2020-09-18 00:00:00', 413.50, 414.79, 414.80, '413.5', 414.17, 2.11, 0.51, 436, 180580300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (553, 'Au99.95', '2020-09-17 00:00:00', 406.00, 412.68, 417.00, '417', 412.58, -3.32, -0.80, 982, 406935520, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (554, 'Au99.95', '2020-09-16 00:00:00', 414.95, 416.00, 416.00, '415', 415.40, -1.00, -0.24, 326, 135423200, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (555, 'Au99.95', '2020-09-15 00:00:00', 416.40, 417.00, 417.50, '416.4', 417.23, 1.52, 0.37, 288, 120163060, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (556, 'Au99.95', '2020-09-14 00:00:00', 415.20, 415.48, 416.60, '415.7', 416.08, 0.02, 0.00, 466, 193895160, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (557, 'Au99.95', '2020-09-11 00:00:00', 414.50, 415.46, 416.85, '416.8', 415.79, -0.96, -0.23, 998, 386493960, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (558, 'Au99.95', '2020-09-10 00:00:00', 415.50, 416.42, 417.20, '415.5', 416.58, 3.12, 0.75, 180, 74985600, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (559, 'Au99.95', '2020-09-09 00:00:00', 413.00, 413.30, 414.00, '413.1', 413.42, -0.60, -0.15, 136, 56225700, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (560, 'Au99.95', '2020-09-08 00:00:00', 412.00, 413.90, 414.30, '413', 413.40, 0.61, 0.15, 180, 74413300, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (561, 'Au99.95', '2020-09-07 00:00:00', 413.00, 413.29, 415.00, '414.99', 414.36, 0.29, 0.07, 240, 99448780, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (562, 'Au99.95', '2020-09-04 00:00:00', 412.50, 413.00, 414.50, '414.5', 413.02, 0.50, 0.12, 308, 127211620, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (563, 'Au99.95', '2020-09-03 00:00:00', 412.00, 412.50, 416.80, '416', 413.84, -6.64, -1.58, 210, 86908000, '2023-06-29 10:38:05', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (564, 'Au99.95', '2020-09-02 00:00:00', 419.05, 419.14, 420.00, '420', 419.41, -3.87, -0.91, 234, 98142440, '2023-06-29 10:38:06', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (565, 'Au99.95', '2020-09-01 00:00:00', 420.00, 423.01, 423.80, '420', 421.47, 3.68, 0.88, 436, 183762600, '2023-06-29 10:38:06', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (566, 'Au99.95', '2020-08-31 00:00:00', 418.50, 419.33, 421.00, '421', 419.04, 2.23, 0.53, 156, 65370820, '2023-06-29 10:38:06', '2023-06-29 13:26:02', 0);
INSERT INTO `trade` VALUES (567, 'Au99.95', '2020-08-28 00:00:00', 414.80, 417.10, 421.00, '421', 416.64, -0.04, -0.01, 180, 74996480, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (568, 'Au99.95', '2020-08-27 00:00:00', 416.00, 417.14, 417.50, '416', 416.92, 4.48, 1.09, 210, 87554800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (569, 'Au99.95', '2020-08-26 00:00:00', 412.00, 412.66, 413.45, '413.45', 412.93, -0.47, -0.11, 192, 79283800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (570, 'Au99.95', '2020-08-25 00:00:00', 413.00, 413.13, 414.50, '413', 413.85, 0.90, 0.22, 664, 274798700, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (571, 'Au99.95', '2020-08-24 00:00:00', 411.70, 412.23, 412.50, '411.7', 412.11, -2.55, -0.61, 66, 27199800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (572, 'Au99.95', '2020-08-21 00:00:00', 414.70, 414.78, 415.80, '415', 414.93, 0.47, 0.11, 58, 24066200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (573, 'Au99.95', '2020-08-20 00:00:00', 410.51, 414.31, 424.50, '424.5', 415.12, -10.85, -2.55, 278, 115403420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (574, 'Au99.95', '2020-08-19 00:00:00', 423.30, 425.16, 426.90, '426.16', 425.88, -3.88, -0.90, 206, 87732800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (575, 'Au99.95', '2020-08-18 00:00:00', 427.50, 429.04, 429.55, '427.5', 428.50, 10.26, 2.45, 708, 302478280, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (576, 'Au99.95', '2020-08-17 00:00:00', 417.00, 418.78, 419.80, '417.5', 418.23, 9.99, 2.44, 108, 45169600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (577, 'Au99.95', '2020-08-14 00:00:00', 406.99, 408.79, 421.50, '421.5', 415.95, -3.71, -0.90, 424, 178582940, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (578, 'Au99.95', '2020-08-13 00:00:00', 412.00, 412.50, 414.00, '414', 412.48, 6.69, 1.65, 780, 322555580, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (579, 'Au99.95', '2020-08-12 00:00:00', 340.99, 405.81, 406.40, '403', 400.67, -26.19, -6.06, 484, 176056420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (580, 'Au99.95', '2020-08-11 00:00:00', 430.01, 432.00, 439.50, '439', 432.49, -9.09, -2.06, 922, 350505300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (581, 'Au99.95', '2020-08-10 00:00:00', 441.00, 441.09, 442.29, '441', 441.20, -5.39, -1.21, 70, 30884180, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (582, 'Au99.95', '2020-08-07 00:00:00', 445.00, 446.48, 448.00, '445', 446.32, 4.02, 0.91, 1376, 602803200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (583, 'Au99.95', '2020-08-06 00:00:00', 436.20, 442.46, 443.20, '436.2', 441.55, 4.87, 1.11, 160, 70648900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (584, 'Au99.95', '2020-08-05 00:00:00', 428.30, 437.59, 440.15, '428.3', 436.14, 10.27, 2.40, 1848, 653155360, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (585, 'Au99.95', '2020-08-04 00:00:00', 427.00, 427.32, 428.30, '427', 427.50, 0.28, 0.07, 222, 94905800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (586, 'Au99.95', '2020-08-03 00:00:00', 427.00, 427.04, 428.20, '428', 427.48, -0.97, -0.23, 78, 33343800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (587, 'Au99.95', '2020-07-31 00:00:00', 424.00, 428.01, 428.30, '424', 427.18, 4.01, 0.95, 60, 25631200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (588, 'Au99.95', '2020-07-30 00:00:00', 424.00, 424.00, 427.70, '427.05', 424.44, -3.46, -0.81, 280, 118843400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (589, 'Au99.95', '2020-07-29 00:00:00', 427.00, 427.46, 427.80, '427', 427.05, 1.84, 0.43, 158, 67474000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (590, 'Au99.95', '2020-07-28 00:00:00', 425.00, 425.62, 435.05, '435', 431.50, -0.39, -0.09, 582, 251133020, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (591, 'Au99.95', '2020-07-27 00:00:00', 423.00, 426.01, 428.00, '423', 425.93, 10.01, 2.41, 378, 161002320, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (592, 'Au99.95', '2020-07-24 00:00:00', 414.80, 416.00, 416.99, '414.8', 415.94, 3.45, 0.84, 88, 36603380, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (593, 'Au99.95', '2020-07-23 00:00:00', 410.50, 412.55, 413.00, '410.99', 412.05, 1.75, 0.43, 370, 152460920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (594, 'Au99.95', '2020-07-22 00:00:00', 402.80, 410.80, 411.20, '402.8', 409.20, 9.97, 2.49, 240, 98209600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (595, 'Au99.95', '2020-07-21 00:00:00', 400.40, 400.83, 401.00, '400.4', 400.88, 2.25, 0.56, 152, 60935200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (596, 'Au99.95', '2020-07-20 00:00:00', 398.35, 398.58, 398.80, '398.49', 398.57, 1.86, 0.47, 36, 14348680, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (597, 'Au99.95', '2020-07-17 00:00:00', 396.51, 396.72, 397.73, '397.5', 396.78, -2.66, -0.67, 490, 194424060, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (598, 'Au99.95', '2020-07-16 00:00:00', 399.30, 399.38, 399.80, '399.8', 399.58, -1.15, -0.29, 126, 50348000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (599, 'Au99.95', '2020-07-15 00:00:00', 400.30, 400.53, 401.30, '400.3', 400.78, 0.73, 0.18, 76, 30459400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (600, 'Au99.95', '2020-07-14 00:00:00', 399.20, 399.80, 400.20, '399.9', 399.49, -0.81, -0.20, 324, 129435880, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (601, 'Au99.95', '2020-07-13 00:00:00', 400.40, 400.61, 401.00, '400.4', 400.56, 2.79, 0.70, 28, 11215800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (602, 'Au99.95', '2020-07-10 00:00:00', 390.99, 397.82, 400.40, '400.4', 398.68, -4.13, -1.03, 182, 72560960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (603, 'Au99.95', '2020-07-09 00:00:00', 401.40, 401.95, 402.20, '402.2', 401.86, 2.60, 0.65, 106, 42597200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (604, 'Au99.95', '2020-07-08 00:00:00', 399.10, 399.35, 399.40, '399.3', 399.26, 2.01, 0.51, 318, 126966500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (605, 'Au99.95', '2020-07-07 00:00:00', 397.00, 397.34, 397.80, '397.5', 397.26, 0.59, 0.15, 336, 133481200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (606, 'Au99.95', '2020-07-06 00:00:00', 396.40, 396.75, 397.25, '397', 396.63, -0.90, -0.23, 170, 67428300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (607, 'Au99.95', '2020-07-03 00:00:00', 396.50, 397.65, 398.25, '396.5', 397.92, 1.29, 0.33, 144, 57301880, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (608, 'Au99.95', '2020-07-02 00:00:00', 395.60, 396.36, 396.90, '396.5', 396.39, -3.62, -0.91, 318, 126052380, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (609, 'Au99.95', '2020-07-01 00:00:00', 398.70, 399.98, 400.45, '398.7', 399.45, 1.64, 0.41, 176, 70304700, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (610, 'Au99.95', '2020-06-30 00:00:00', 397.10, 398.34, 399.30, '397.4', 397.52, 1.00, 0.25, 112, 44522980, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (611, 'Au99.95', '2020-06-29 00:00:00', 397.00, 397.34, 398.00, '398', 397.39, 0.70, 0.18, 588, 233670440, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (612, 'Au99.95', '2020-06-24 00:00:00', 395.30, 396.64, 397.20, '395.3', 396.42, 2.34, 0.59, 190, 75321400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (613, 'Au99.95', '2020-06-23 00:00:00', 394.00, 394.30, 395.10, '395', 394.90, -0.59, -0.15, 138, 54497200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (614, 'Au99.95', '2020-06-22 00:00:00', 394.50, 394.89, 396.00, '395.2', 395.01, 4.14, 1.06, 254, 100333100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (615, 'Au99.95', '2020-06-19 00:00:00', 390.30, 390.75, 391.00, '390.5', 390.64, 1.44, 0.37, 288, 112506200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (616, 'Au99.95', '2020-06-18 00:00:00', 389.00, 389.31, 390.30, '390.3', 389.95, -1.14, -0.29, 584, 227948100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (617, 'Au99.95', '2020-06-17 00:00:00', 390.10, 390.45, 390.50, '390.1', 390.39, 0.78, 0.20, 126, 49190000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (618, 'Au99.95', '2020-06-16 00:00:00', 389.30, 389.67, 391.00, '391', 389.98, -0.17, -0.04, 98, 38218900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (619, 'Au99.95', '2020-06-15 00:00:00', 389.70, 389.84, 392.30, '392.3', 390.69, -1.57, -0.40, 164, 64074500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (620, 'Au99.95', '2020-06-12 00:00:00', 390.50, 391.41, 391.65, '390.5', 391.26, 0.49, 0.13, 76, 29735800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (621, 'Au99.95', '2020-06-11 00:00:00', 390.60, 390.92, 391.60, '390.85', 390.80, 2.66, 0.69, 186, 72689100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (622, 'Au99.95', '2020-06-10 00:00:00', 388.00, 388.26, 388.40, '388', 388.12, 3.76, 0.98, 1014, 367137540, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (623, 'Au99.95', '2020-06-09 00:00:00', 384.02, 384.50, 384.80, '384.07', 384.51, 0.80, 0.21, 48, 18456880, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (624, 'Au99.95', '2020-06-08 00:00:00', 383.40, 383.70, 383.90, '383.5', 383.70, -5.13, -1.32, 12, 4604400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (625, 'Au99.95', '2020-06-05 00:00:00', 387.70, 388.83, 389.80, '389', 389.08, 1.78, 0.46, 50, 19454320, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (626, 'Au99.95', '2020-06-04 00:00:00', 387.00, 387.05, 389.00, '389', 387.48, -4.75, -1.21, 316, 122445820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (627, 'Au99.95', '2020-06-03 00:00:00', 391.30, 391.80, 392.50, '391.5', 391.91, -3.20, -0.81, 48, 18812100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (628, 'Au99.95', '2020-06-02 00:00:00', 394.50, 395.00, 395.50, '394.7', 395.05, -0.76, -0.19, 196, 77430000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (629, 'Au99.95', '2020-06-01 00:00:00', 394.40, 395.76, 396.30, '394.4', 395.51, 4.08, 1.04, 492, 194591400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (630, 'Au99.95', '2020-05-29 00:00:00', 390.88, 391.68, 392.00, '390.88', 391.60, -0.70, -0.18, 58, 22712960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (631, 'Au99.95', '2020-05-28 00:00:00', 390.30, 392.38, 392.40, '390.7', 390.90, 3.27, 0.84, 438, 171218120, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (632, 'Au99.95', '2020-05-27 00:00:00', 389.00, 389.11, 390.25, '390.2', 390.06, -4.25, -1.08, 378, 147443800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (633, 'Au99.95', '2020-05-26 00:00:00', 392.80, 393.36, 394.20, '393', 393.02, 2.16, 0.55, 664, 260965400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (634, 'Au99.95', '2020-05-25 00:00:00', 391.00, 391.20, 392.20, '391.7', 391.58, -0.52, -0.13, 770, 301522920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (635, 'Au99.95', '2020-05-22 00:00:00', 389.50, 391.72, 392.40, '390.7', 390.31, -0.84, -0.21, 782, 305229000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (636, 'Au99.95', '2020-05-21 00:00:00', 392.50, 392.56, 395.00, '395', 393.50, -3.89, -0.98, 176, 69256200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (637, 'Au99.95', '2020-05-20 00:00:00', 395.90, 396.45, 396.80, '395.9', 396.41, 4.45, 1.14, 630, 249740800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (638, 'Au99.95', '2020-05-19 00:00:00', 392.00, 392.00, 394.00, '394', 392.89, -6.16, -1.55, 204, 80150800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (639, 'Au99.95', '2020-05-18 00:00:00', 397.00, 398.16, 409.32, '397', 398.45, 9.25, 2.38, 182, 72517960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (640, 'Au99.95', '2020-05-15 00:00:00', 385.00, 388.91, 389.20, '385', 387.18, 5.83, 1.52, 90, 34846400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (641, 'Au99.95', '2020-05-14 00:00:00', 382.88, 383.08, 383.20, '382.9', 382.96, 2.19, 0.58, 136, 52083260, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (642, 'Au99.95', '2020-05-13 00:00:00', 380.50, 380.89, 381.15, '380.5', 380.88, 0.57, 0.15, 160, 60941880, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (643, 'Au99.95', '2020-05-12 00:00:00', 380.00, 380.32, 380.70, '380', 380.28, -0.80, -0.21, 244, 92788800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (644, 'Au99.95', '2020-05-11 00:00:00', 380.78, 381.12, 383.80, '383.8', 381.08, -1.56, -0.41, 334, 127283500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (645, 'Au99.95', '2020-05-08 00:00:00', 382.10, 382.68, 383.10, '383', 382.76, 4.66, 1.23, 412, 157698160, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (646, 'Au99.95', '2020-05-07 00:00:00', 377.90, 378.02, 379.30, '379', 378.75, -1.68, -0.44, 562, 212859800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (647, 'Au99.95', '2020-05-06 00:00:00', 379.49, 379.70, 380.20, '379.8', 379.73, -1.02, -0.27, 252, 95693520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (648, 'Au99.95', '2020-04-30 00:00:00', 377.90, 380.72, 383.00, '378', 378.63, 2.69, 0.71, 252, 95416480, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (649, 'Au99.95', '2020-04-29 00:00:00', 369.99, 378.03, 378.80, '378.8', 378.20, 1.23, 0.33, 416, 157332040, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (650, 'Au99.95', '2020-04-28 00:00:00', 375.00, 376.80, 380.00, '380', 375.89, -3.12, -0.82, 420, 157875900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (651, 'Au99.95', '2020-04-27 00:00:00', 379.50, 379.92, 381.00, '380', 380.54, -1.92, -0.50, 356, 135474900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (652, 'Au99.95', '2020-04-24 00:00:00', 379.80, 381.84, 382.00, '380.3', 380.61, 2.59, 0.68, 594, 226083200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (653, 'Au99.95', '2020-04-23 00:00:00', 363.26, 379.25, 379.90, '363.99', 377.42, 6.25, 1.68, 366, 138139000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (654, 'Au99.95', '2020-04-22 00:00:00', 370.00, 373.00, 373.80, '370', 372.94, -0.02, -0.01, 346, 122425940, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (655, 'Au99.95', '2020-04-21 00:00:00', 372.50, 373.02, 373.05, '372.5', 372.94, 2.90, 0.78, 158, 58925100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (656, 'Au99.95', '2020-04-20 00:00:00', 369.00, 370.12, 370.50, '370', 369.71, -0.49, -0.13, 68, 25140800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (657, 'Au99.95', '2020-04-17 00:00:00', 370.00, 370.61, 376.00, '376', 371.50, -6.77, -1.79, 130, 48295980, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (658, 'Au99.95', '2020-04-16 00:00:00', 373.39, 377.38, 378.00, '373.39', 376.35, 1.72, 0.46, 84, 31614060, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (659, 'Au99.95', '2020-04-15 00:00:00', 375.00, 375.66, 377.70, '377.7', 375.84, -1.53, -0.41, 46, 17288900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (660, 'Au99.95', '2020-04-14 00:00:00', 376.10, 377.19, 380.80, '378', 377.12, 5.74, 1.55, 136, 51288800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (661, 'Au99.95', '2020-04-13 00:00:00', 371.00, 371.45, 373.00, '373', 371.70, -1.94, -0.52, 414, 153885100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (662, 'Au99.95', '2020-04-10 00:00:00', 372.30, 373.39, 374.95, '373.5', 372.86, 3.43, 0.93, 76, 28338100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (663, 'Au99.95', '2020-04-09 00:00:00', 369.60, 369.96, 370.00, '369.9', 369.84, 0.27, 0.07, 84, 31067000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (664, 'Au99.95', '2020-04-08 00:00:00', 369.00, 369.69, 374.50, '374.5', 369.66, -3.11, -0.83, 162, 59886340, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (665, 'Au99.95', '2020-04-07 00:00:00', 372.40, 372.80, 373.70, '373', 373.01, 10.50, 2.90, 490, 182779780, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (666, 'Au99.95', '2020-04-03 00:00:00', 362.00, 362.30, 363.60, '363.6', 363.06, 3.83, 1.07, 162, 58816600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (667, 'Au99.95', '2020-04-02 00:00:00', 358.00, 358.47, 358.50, '358', 358.47, 2.47, 0.69, 42, 15056000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (668, 'Au99.95', '2020-04-01 00:00:00', 356.00, 356.00, 356.00, '356', 356.00, -8.50, -2.33, 2, 712000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (669, 'Au99.95', '2020-03-31 00:00:00', 363.50, 364.50, 364.50, '363.51', 363.93, 1.29, 0.36, 56, 20380260, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (670, 'Au99.95', '2020-03-30 00:00:00', 363.00, 363.21, 364.90, '364.9', 363.70, -2.59, -0.71, 196, 71286680, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (671, 'Au99.95', '2020-03-27 00:00:00', 365.40, 365.80, 367.00, '366', 365.93, 3.80, 1.05, 130, 47572000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (672, 'Au99.95', '2020-03-26 00:00:00', 362.00, 362.00, 363.30, '362.5', 362.33, -1.87, -0.51, 356, 131468880, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (673, 'Au99.95', '2020-03-25 00:00:00', 363.40, 363.87, 364.00, '363.4', 363.64, 8.01, 2.25, 102, 37092000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (674, 'Au99.95', '2020-03-24 00:00:00', 344.60, 355.86, 358.00, '344.6', 356.71, 17.99, 5.32, 210, 74910200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (675, 'Au99.95', '2020-03-23 00:00:00', 337.00, 337.87, 339.50, '339', 338.80, -1.34, -0.40, 126, 42689220, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (676, 'Au99.95', '2020-03-20 00:00:00', 336.00, 339.21, 340.00, '336', 338.44, 6.06, 1.82, 94, 31814000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (677, 'Au99.95', '2020-03-19 00:00:00', 330.80, 333.15, 335.00, '335', 332.27, -4.85, -1.43, 208, 69113000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (678, 'Au99.95', '2020-03-18 00:00:00', 337.90, 338.00, 341.20, '341', 338.47, 6.26, 1.89, 96, 32493400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (679, 'Au99.95', '2020-03-17 00:00:00', 331.20, 331.74, 336.00, '336', 332.66, -13.33, -3.86, 400, 133066320, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (680, 'Au99.95', '2020-03-16 00:00:00', 344.30, 345.07, 347.50, '344.3', 345.93, -9.68, -2.73, 856, 307039100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (681, 'Au99.95', '2020-03-13 00:00:00', 349.50, 354.75, 355.00, '355', 353.25, -10.34, -2.83, 338, 119400940, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (682, 'Au99.95', '2020-03-12 00:00:00', 364.50, 365.09, 365.50, '365.1', 364.97, -3.18, -0.86, 152, 55476200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (683, 'Au99.95', '2020-03-11 00:00:00', 368.10, 368.27, 368.50, '368.1', 368.14, 1.74, 0.47, 110, 40495400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (684, 'Au99.95', '2020-03-10 00:00:00', 366.00, 366.53, 370.20, '370.2', 366.86, -4.66, -1.26, 198, 72639200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (685, 'Au99.95', '2020-03-09 00:00:00', 370.00, 371.19, 376.10, '372.5', 371.53, -1.76, -0.47, 140, 52015200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (686, 'Au99.95', '2020-03-06 00:00:00', 372.50, 372.95, 375.30, '372.6', 374.08, 7.52, 2.06, 502, 187788600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (687, 'Au99.95', '2020-03-05 00:00:00', 365.00, 365.43, 365.70, '365.3', 365.33, -0.45, -0.12, 132, 48224080, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (688, 'Au99.95', '2020-03-04 00:00:00', 364.00, 365.88, 366.50, '366.5', 366.04, 8.10, 2.26, 136, 49782520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (689, 'Au99.95', '2020-03-03 00:00:00', 357.20, 357.78, 358.30, '358.2', 358.00, -0.74, -0.21, 146, 52268600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (690, 'Au99.95', '2020-03-02 00:00:00', 357.00, 358.52, 363.00, '363', 358.64, -8.01, -2.19, 206, 73881160, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (691, 'Au99.95', '2020-02-28 00:00:00', 366.00, 366.53, 370.00, '370', 367.43, -5.46, -1.47, 226, 83041200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (692, 'Au99.95', '2020-02-27 00:00:00', 371.90, 371.99, 372.05, '372', 371.99, 0.63, 0.17, 26, 9671800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (693, 'Au99.95', '2020-02-26 00:00:00', 370.20, 371.36, 371.60, '371', 371.05, 2.16, 0.59, 76, 28200000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (694, 'Au99.95', '2020-02-25 00:00:00', 367.50, 369.20, 373.80, '372.01', 369.63, -6.96, -1.85, 220, 81319380, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (695, 'Au99.95', '2020-02-24 00:00:00', 375.00, 376.16, 377.00, '376.4', 375.98, 8.50, 2.31, 326, 122571400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (696, 'Au99.95', '2020-02-21 00:00:00', 366.00, 367.66, 369.00, '366', 367.25, 5.66, 1.56, 24, 8814000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (697, 'Au99.95', '2020-02-20 00:00:00', 362.00, 362.00, 363.00, '363', 362.69, 0.80, 0.22, 106, 38446000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (698, 'Au99.95', '2020-02-19 00:00:00', 360.60, 361.20, 361.20, '360.6', 361.17, 4.27, 1.20, 216, 78012800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (699, 'Au99.95', '2020-02-18 00:00:00', 356.20, 356.93, 357.00, '356.2', 356.90, 1.85, 0.52, 654, 233418500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (700, 'Au99.95', '2020-02-17 00:00:00', 355.00, 355.08, 355.35, '355.35', 355.08, 1.09, 0.31, 10, 3550820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (701, 'Au99.95', '2020-02-14 00:00:00', 353.50, 353.99, 354.00, '354', 353.98, 1.16, 0.33, 208, 72585520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (702, 'Au99.95', '2020-02-13 00:00:00', 352.50, 352.83, 352.90, '352.5', 352.83, 2.43, 0.69, 142, 50103000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (703, 'Au99.95', '2020-02-12 00:00:00', 350.40, 350.40, 350.40, '350.4', 350.40, -1.13, -0.32, 2, 700800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (704, 'Au99.95', '2020-02-11 00:00:00', 351.20, 351.53, 352.20, '352.2', 351.53, -0.67, -0.19, 6, 2109200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (705, 'Au99.95', '2020-02-10 00:00:00', 352.20, 352.20, 352.20, '352.2', 352.20, 0.98, 0.28, 2, 704400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (706, 'Au99.95', '2020-02-07 00:00:00', 351.20, 351.22, 351.30, '351.2', 351.22, 2.22, 0.64, 92, 32312720, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (707, 'Au99.95', '2020-02-06 00:00:00', 348.90, 349.00, 349.00, '348.9', 348.99, -2.04, -0.58, 34, 11865800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (708, 'Au99.95', '2020-02-05 00:00:00', 351.00, 351.04, 351.70, '351.7', 351.04, -2.56, -0.72, 34, 11935400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (709, 'Au99.95', '2020-02-04 00:00:00', 345.99, 353.60, 355.30, '345.99', 353.29, -3.08, -0.86, 194, 68538300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (710, 'Au99.95', '2020-02-03 00:00:00', 356.30, 356.68, 356.75, '356.75', 356.60, 9.28, 2.67, 434, 154765880, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (711, 'Au99.95', '2020-01-23 00:00:00', 347.40, 347.40, 347.40, '347.4', 347.40, 2.10, 0.61, 40, 13896000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (712, 'Au99.95', '2020-01-22 00:00:00', 345.10, 345.30, 346.00, '346', 345.33, -3.05, -0.88, 158, 54563200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (713, 'Au99.95', '2020-01-21 00:00:00', 347.80, 348.35, 348.50, '347.8', 348.04, 3.33, 0.97, 738, 256860680, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (714, 'Au99.95', '2020-01-20 00:00:00', 344.80, 345.02, 345.20, '345.2', 344.95, 0.24, 0.07, 462, 159368540, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (715, 'Au99.95', '2020-01-17 00:00:00', 344.70, 344.78, 345.00, '344.7', 344.89, -0.59, -0.17, 214, 73807700, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (716, 'Au99.95', '2020-01-16 00:00:00', 345.00, 345.37, 346.15, '345.7', 345.74, 0.64, 0.19, 766, 264839600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (717, 'Au99.95', '2020-01-15 00:00:00', 343.50, 344.73, 345.50, '343.5', 345.13, 2.85, 0.83, 586, 202250600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (718, 'Au99.95', '2020-01-14 00:00:00', 340.90, 341.88, 342.60, '341.9', 341.44, -4.24, -1.23, 232, 78761900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (719, 'Au99.95', '2020-01-13 00:00:00', 345.80, 346.12, 347.25, '347', 346.39, -0.38, -0.11, 600, 207838040, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (720, 'Au99.95', '2020-01-10 00:00:00', 346.30, 346.50, 346.50, '346.4', 346.47, 1.07, 0.31, 182, 61196180, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (721, 'Au99.95', '2020-01-09 00:00:00', 344.50, 345.43, 350.00, '350', 346.87, -11.96, -3.35, 440, 152625300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (722, 'Au99.95', '2020-01-08 00:00:00', 355.80, 357.39, 359.50, '359.3', 357.31, 6.14, 1.75, 680, 242976200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (723, 'Au99.95', '2020-01-07 00:00:00', 265.99, 351.25, 351.80, '265.99', 350.20, -3.25, -0.92, 844, 295575560, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (724, 'Au99.95', '2020-01-06 00:00:00', 354.00, 354.50, 355.30, '354', 354.90, 7.73, 2.23, 1062, 376910760, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (725, 'Au99.95', '2020-01-03 00:00:00', 343.70, 346.77, 347.50, '343.7', 345.97, 5.20, 1.52, 442, 152921400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (726, 'Au99.95', '2020-01-02 00:00:00', 340.90, 341.57, 341.90, '340.9', 341.50, -1.00, -0.29, 580, 198074200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (727, 'Au99.95', '2019-12-31 00:00:00', 342.00, 342.57, 342.80, '342', 342.47, 2.04, 0.60, 506, 173292020, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (728, 'Au99.95', '2019-12-30 00:00:00', 340.50, 340.53, 341.53, '341.5', 341.19, -0.20, -0.06, 836, 285239460, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (729, 'Au99.95', '2019-12-27 00:00:00', 340.35, 340.73, 341.80, '340.8', 341.00, 1.61, 0.47, 640, 218245700, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (730, 'Au99.95', '2019-12-26 00:00:00', 338.29, 339.12, 339.70, '338.29', 339.37, 0.55, 0.16, 666, 226025740, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (731, 'Au99.95', '2019-12-25 00:00:00', 338.50, 338.57, 339.20, '339.2', 338.84, 1.52, 0.45, 526, 178233420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (732, 'Au99.95', '2019-12-24 00:00:00', 334.00, 337.05, 337.20, '334', 336.79, 1.15, 0.34, 520, 175131640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (733, 'Au99.95', '2019-12-23 00:00:00', 334.10, 335.90, 336.00, '334.11', 334.83, 1.70, 0.51, 742, 248446560, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (734, 'Au99.95', '2019-12-20 00:00:00', 333.80, 334.20, 334.40, '333.8', 334.13, 0.72, 0.22, 1134, 378903840, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (735, 'Au99.95', '2019-12-19 00:00:00', 333.30, 333.48, 333.88, '333.3', 333.54, -0.37, -0.11, 372, 124080100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (736, 'Au99.95', '2019-12-18 00:00:00', 333.30, 333.85, 333.90, '333.75', 333.66, 0.47, 0.14, 1134, 378234920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (737, 'Au99.95', '2019-12-17 00:00:00', 333.00, 333.38, 333.50, '333', 333.29, -0.22, -0.07, 746, 248637820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (738, 'Au99.95', '2019-12-16 00:00:00', 332.80, 333.60, 333.75, '332.8', 333.21, 3.26, 0.99, 210, 69975120, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (739, 'Au99.95', '2019-12-13 00:00:00', 330.00, 330.34, 335.00, '335', 330.39, -3.77, -1.13, 312, 103081740, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (740, 'Au99.95', '2019-12-12 00:00:00', 333.00, 334.11, 334.49, '333', 334.07, 1.73, 0.52, 410, 136972160, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (741, 'Au99.95', '2019-12-11 00:00:00', 332.30, 332.38, 332.60, '332.3', 332.43, 0.38, 0.11, 552, 183523800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (742, 'Au99.95', '2019-12-10 00:00:00', 331.80, 332.00, 332.10, '332.1', 332.00, 0.08, 0.02, 520, 172644740, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (743, 'Au99.95', '2019-12-09 00:00:00', 331.00, 331.92, 332.00, '331.5', 331.39, -2.30, -0.69, 984, 326096200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (744, 'Au99.95', '2019-12-06 00:00:00', 334.05, 334.22, 335.50, '335.35', 335.16, -1.87, -0.56, 516, 172946860, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (745, 'Au99.95', '2019-12-05 00:00:00', 335.30, 336.09, 336.35, '336', 335.82, -1.91, -0.57, 532, 178659380, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (746, 'Au99.95', '2019-12-04 00:00:00', 336.60, 338.00, 338.00, '336.9', 337.19, 6.18, 1.86, 322, 108575600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (747, 'Au99.95', '2019-12-03 00:00:00', 331.40, 331.82, 332.20, '332', 331.76, 0.99, 0.30, 622, 206359980, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (748, 'Au99.95', '2019-12-02 00:00:00', 330.70, 330.83, 331.50, '331.5', 330.82, 0.16, 0.05, 356, 117773280, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (749, 'Au99.95', '2019-11-29 00:00:00', 330.10, 330.67, 330.89, '330.15', 330.49, 0.77, 0.23, 410, 135501580, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (750, 'Au99.95', '2019-11-28 00:00:00', 329.50, 329.90, 330.25, '330.05', 330.02, -0.75, -0.23, 544, 179534340, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (751, 'Au99.95', '2019-11-27 00:00:00', 330.31, 330.65, 330.65, '330.65', 330.52, 0.55, 0.17, 554, 183108540, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (752, 'Au99.95', '2019-11-26 00:00:00', 329.00, 330.10, 330.25, '329.4', 329.50, -0.28, -0.08, 610, 200999500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (753, 'Au99.95', '2019-11-25 00:00:00', 330.00, 330.38, 333.30, '333.3', 331.03, -2.09, -0.63, 650, 215169640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (754, 'Au99.95', '2019-11-22 00:00:00', 331.40, 332.47, 332.90, '331.4', 332.29, -0.99, -0.30, 384, 127603060, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (755, 'Au99.95', '2019-11-21 00:00:00', 333.40, 333.46, 334.45, '334.29', 333.97, -0.14, -0.04, 1010, 337315960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (756, 'Au99.95', '2019-11-20 00:00:00', 325.40, 333.60, 334.00, '325.4', 332.80, 0.70, 0.21, 492, 163740120, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (757, 'Au99.95', '2019-11-19 00:00:00', 331.50, 332.90, 333.00, '331.5', 332.64, 1.92, 0.58, 830, 276095600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (758, 'Au99.95', '2019-11-18 00:00:00', 330.85, 330.98, 331.30, '331.3', 331.11, 0.46, 0.14, 158, 52315900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (759, 'Au99.95', '2019-11-15 00:00:00', 330.30, 330.52, 331.40, '331.4', 330.66, -1.18, -0.36, 450, 148799360, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (760, 'Au99.95', '2019-11-14 00:00:00', 330.80, 331.70, 331.70, '330.8', 331.03, 1.23, 0.37, 412, 136386500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (761, 'Au99.95', '2019-11-13 00:00:00', 329.70, 330.47, 330.90, '329.7', 330.09, 3.22, 0.98, 326, 107610400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (762, 'Au99.95', '2019-11-12 00:00:00', 326.80, 327.25, 328.82, '328.75', 327.77, -3.26, -0.99, 574, 188388900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (763, 'Au99.95', '2019-11-11 00:00:00', 328.00, 330.51, 330.60, '328.1', 329.88, -0.53, -0.16, 532, 175498820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (764, 'Au99.95', '2019-11-08 00:00:00', 329.60, 331.04, 343.80, '343.8', 330.85, -6.39, -1.89, 674, 210774560, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (765, 'Au99.95', '2019-11-07 00:00:00', 336.90, 337.43, 337.50, '337', 337.13, 1.70, 0.51, 554, 186774960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (766, 'Au99.95', '2019-11-06 00:00:00', 334.85, 335.73, 336.50, '336.5', 335.51, -4.56, -1.34, 558, 187217320, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (767, 'Au99.95', '2019-11-05 00:00:00', 340.00, 340.29, 341.90, '341.9', 340.73, -2.01, -0.59, 572, 194900660, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (768, 'Au99.95', '2019-11-04 00:00:00', 342.20, 342.30, 343.21, '343.21', 342.39, -0.53, -0.15, 442, 151338100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (769, 'Au99.95', '2019-11-01 00:00:00', 342.69, 342.83, 343.50, '343.5', 342.82, 2.77, 0.81, 12458, 4240614900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (770, 'Au99.95', '2019-10-31 00:00:00', 340.00, 340.06, 340.60, '340.2', 340.19, 0.67, 0.20, 512, 174181220, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (771, 'Au99.95', '2019-10-30 00:00:00', 339.00, 339.39, 339.70, '339.7', 339.24, -0.60, -0.18, 922, 312788160, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (772, 'Au99.95', '2019-10-29 00:00:00', 339.80, 339.99, 340.50, '340.5', 340.04, -3.50, -1.02, 520, 176825000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (773, 'Au99.95', '2019-10-28 00:00:00', 342.90, 343.49, 343.50, '343.1', 343.12, 0.03, 0.01, 352, 120778620, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (774, 'Au99.95', '2019-10-25 00:00:00', 332.39, 343.46, 343.70, '340.8', 342.50, 3.39, 1.00, 710, 243178840, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (775, 'Au99.95', '2019-10-24 00:00:00', 340.00, 340.07, 340.60, '340.25', 340.32, -0.58, -0.17, 874, 297443000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (776, 'Au99.95', '2019-10-23 00:00:00', 339.95, 340.65, 340.75, '339.95', 340.40, 1.23, 0.36, 1256, 427548420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (777, 'Au99.95', '2019-10-22 00:00:00', 339.00, 339.42, 339.70, '339', 339.21, -1.12, -0.33, 462, 156719300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (778, 'Au99.95', '2019-10-21 00:00:00', 340.00, 340.54, 340.80, '340', 340.31, -0.02, -0.01, 342, 116386240, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (779, 'Au99.95', '2019-10-18 00:00:00', 340.25, 340.56, 340.90, '340.5', 340.57, -0.64, -0.19, 1004, 341935300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (780, 'Au99.95', '2019-10-17 00:00:00', 339.10, 341.20, 341.50, '339.1', 340.90, 1.23, 0.36, 660, 224999820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (781, 'Au99.95', '2019-10-16 00:00:00', 339.00, 339.97, 340.00, '339.7', 339.48, -0.57, -0.17, 806, 273625420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (782, 'Au99.95', '2019-10-15 00:00:00', 340.00, 340.54, 341.30, '340.85', 340.52, 1.07, 0.32, 934, 318049560, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (783, 'Au99.95', '2019-10-14 00:00:00', 338.70, 339.47, 340.35, '340.35', 339.49, -4.55, -1.32, 658, 223388920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (784, 'Au99.95', '2019-10-11 00:00:00', 342.50, 344.02, 344.50, '342.5', 343.32, -1.72, -0.50, 764, 262300940, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (785, 'Au99.95', '2019-10-10 00:00:00', 345.50, 345.74, 347.00, '347', 346.45, -2.24, -0.64, 212, 73448400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (786, 'Au99.95', '2019-10-09 00:00:00', 346.00, 347.98, 348.00, '346', 347.31, 5.09, 1.48, 1066, 370239640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (787, 'Au99.95', '2019-10-08 00:00:00', 342.70, 342.89, 343.80, '343.5', 343.00, 0.08, 0.02, 402, 137887640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (788, 'Au99.95', '2019-09-30 00:00:00', 342.15, 342.81, 344.50, '344.5', 342.82, -2.14, -0.62, 888, 304428940, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (789, 'Au99.95', '2019-09-27 00:00:00', 344.50, 344.95, 347.30, '347', 346.77, -2.55, -0.73, 220, 76290720, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (790, 'Au99.95', '2019-09-26 00:00:00', 347.40, 347.50, 348.10, '347.81', 347.90, -4.50, -1.28, 534, 185783560, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (791, 'Au99.95', '2019-09-25 00:00:00', 350.50, 352.00, 352.50, '350.5', 351.81, 2.31, 0.66, 826, 290599440, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (792, 'Au99.95', '2019-09-24 00:00:00', 349.60, 349.69, 351.00, '350.99', 350.09, 1.04, 0.30, 1148, 401909480, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (793, 'Au99.95', '2019-09-23 00:00:00', 347.70, 348.65, 349.60, '347.8', 349.10, 3.72, 1.08, 142, 49573100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (794, 'Au99.95', '2019-09-20 00:00:00', 344.70, 344.93, 345.30, '344.7', 345.07, 1.16, 0.34, 926, 319535600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (795, 'Au99.95', '2019-09-19 00:00:00', 342.25, 343.77, 344.00, '342.25', 343.31, -0.87, -0.25, 358, 122907000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (796, 'Au99.95', '2019-09-18 00:00:00', 343.40, 344.64, 344.80, '344.5', 344.42, 1.53, 0.45, 318, 109525720, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (797, 'Au99.95', '2019-09-17 00:00:00', 343.00, 343.11, 343.80, '343.55', 343.41, -1.39, -0.40, 628, 215662380, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (798, 'Au99.95', '2019-09-16 00:00:00', 343.80, 344.50, 344.50, '344.5', 344.25, 0.93, 0.27, 418, 143899380, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (799, 'Au99.95', '2019-09-12 00:00:00', 342.80, 343.57, 343.60, '343.2', 343.38, -0.26, -0.08, 530, 181992220, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (800, 'Au99.95', '2019-09-11 00:00:00', 335.29, 343.83, 344.30, '344', 343.80, 1.53, 0.45, 692, 237910520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (801, 'Au99.95', '2019-09-10 00:00:00', 342.00, 342.30, 343.40, '343', 342.91, -5.85, -1.68, 940, 322336120, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (802, 'Au99.95', '2019-09-09 00:00:00', 347.51, 348.15, 348.60, '348.6', 348.35, -0.89, -0.26, 452, 157455320, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (803, 'Au99.95', '2019-09-06 00:00:00', 347.40, 349.04, 351.50, '351.5', 350.85, -8.51, -2.38, 490, 171916640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (804, 'Au99.95', '2019-09-05 00:00:00', 356.60, 357.55, 360.00, '358.6', 357.27, -0.22, -0.06, 288, 102895640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (805, 'Au99.95', '2019-09-04 00:00:00', 356.00, 357.77, 359.50, '356', 357.62, 2.87, 0.81, 292, 104427600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (806, 'Au99.95', '2019-09-03 00:00:00', 354.00, 354.90, 355.30, '354.5', 354.55, 1.90, 0.54, 672, 238261780, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (807, 'Au99.95', '2019-09-02 00:00:00', 353.00, 353.00, 353.50, '353.2', 353.20, -1.19, -0.34, 150, 52980800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (808, 'Au99.95', '2019-08-30 00:00:00', 353.00, 354.19, 355.00, '353.5', 354.01, -4.85, -1.35, 334, 118242060, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (809, 'Au99.95', '2019-08-29 00:00:00', 357.50, 359.04, 360.00, '357.5', 358.02, 2.28, 0.64, 346, 123875600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (810, 'Au99.95', '2019-08-28 00:00:00', 355.85, 356.76, 357.60, '357.6', 356.60, 0.86, 0.24, 800, 285281140, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (811, 'Au99.95', '2019-08-27 00:00:00', 354.00, 355.90, 356.20, '354', 354.89, 0.98, 0.28, 270, 95822040, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (812, 'Au99.95', '2019-08-26 00:00:00', 346.05, 354.92, 357.00, '356.6', 356.12, 11.56, 3.37, 934, 332617160, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (813, 'Au99.95', '2019-08-23 00:00:00', 343.00, 343.36, 343.66, '343.3', 343.45, -0.56, -0.16, 1630, 559828320, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (814, 'Au99.95', '2019-08-22 00:00:00', 343.20, 343.92, 344.00, '343.3', 343.59, 0.95, 0.28, 526, 180733100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (815, 'Au99.95', '2019-08-21 00:00:00', 342.80, 342.97, 343.90, '343.6', 343.45, 0.67, 0.20, 454, 155928020, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (816, 'Au99.95', '2019-08-20 00:00:00', 341.90, 342.30, 342.60, '342.6', 342.26, -1.67, -0.49, 658, 225211100, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (817, 'Au99.95', '2019-08-19 00:00:00', 343.00, 343.97, 344.50, '343.5', 343.90, -1.41, -0.41, 340, 116927800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (818, 'Au99.95', '2019-08-16 00:00:00', 344.80, 345.38, 347.00, '347', 345.85, 1.27, 0.37, 550, 190221920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (819, 'Au99.95', '2019-08-15 00:00:00', 344.00, 344.11, 347.00, '344', 345.40, 3.66, 1.08, 210, 72535300, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (820, 'Au99.95', '2019-08-14 00:00:00', 251.35, 340.45, 342.90, '251.35', 341.40, -9.05, -2.59, 632, 215765520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (821, 'Au99.95', '2019-08-13 00:00:00', 345.29, 349.50, 349.50, '346.8', 347.51, 7.92, 2.32, 886, 307898780, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (822, 'Au99.95', '2019-08-12 00:00:00', 341.40, 341.58, 343.89, '343.05', 342.57, -1.79, -0.52, 260, 89069360, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (823, 'Au99.95', '2019-08-09 00:00:00', 343.20, 343.37, 344.70, '343.9', 344.10, 1.89, 0.55, 494, 169621700, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (824, 'Au99.95', '2019-08-08 00:00:00', 340.01, 341.48, 344.00, '344', 342.63, 1.48, 0.44, 240, 72806760, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (825, 'Au99.95', '2019-08-07 00:00:00', 336.50, 340.00, 340.00, '336.5', 338.39, 7.00, 2.10, 456, 154306500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (826, 'Au99.95', '2019-08-06 00:00:00', 333.00, 333.00, 335.40, '334.2', 333.76, 0.80, 0.24, 2400, 798532800, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (827, 'Au99.95', '2019-08-05 00:00:00', 325.20, 332.20, 332.40, '325.2', 330.89, 9.93, 3.08, 2042, 586973600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (828, 'Au99.95', '2019-08-02 00:00:00', 315.00, 322.27, 322.30, '315', 320.26, 7.72, 2.45, 644, 206249900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (829, 'Au99.95', '2019-08-01 00:00:00', 314.30, 314.55, 316.00, '316', 314.97, -4.95, -1.55, 594, 187093420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (830, 'Au99.95', '2019-07-31 00:00:00', 318.90, 319.50, 320.25, '318.9', 319.58, 1.17, 0.37, 368, 117608400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (831, 'Au99.95', '2019-07-30 00:00:00', 317.78, 318.33, 318.40, '317.8', 317.99, 1.32, 0.42, 1032, 328172640, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (832, 'Au99.95', '2019-07-29 00:00:00', 317.00, 317.01, 317.90, '317.1', 317.42, 0.41, 0.13, 394, 125066520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (833, 'Au99.95', '2019-07-26 00:00:00', 315.75, 316.60, 321.00, '318', 316.41, -1.22, -0.38, 754, 238576200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (834, 'Au99.95', '2019-07-25 00:00:00', 317.02, 317.82, 318.00, '318', 317.53, 0.61, 0.19, 878, 278798040, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (835, 'Au99.95', '2019-07-24 00:00:00', 316.90, 317.21, 319.10, '317.63', 317.33, 0.82, 0.26, 442, 140263580, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (836, 'Au99.95', '2019-07-23 00:00:00', 315.80, 316.39, 319.10, '318', 316.14, -1.62, -0.51, 1068, 337646420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (837, 'Au99.95', '2019-07-22 00:00:00', 317.60, 318.01, 318.80, '318', 318.29, -2.64, -0.82, 418, 133045960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (838, 'Au99.95', '2019-07-19 00:00:00', 317.20, 320.65, 322.00, '317.2', 321.26, 3.93, 1.24, 400, 128504680, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (839, 'Au99.95', '2019-07-18 00:00:00', 316.50, 316.72, 317.80, '317.8', 316.80, 3.16, 1.01, 338, 107078400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (840, 'Au99.95', '2019-07-17 00:00:00', 313.20, 313.56, 314.00, '314', 313.47, -1.44, -0.46, 482, 151094140, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (841, 'Au99.95', '2019-07-16 00:00:00', 315.00, 315.00, 315.50, '315', 315.16, -0.15, -0.05, 1062, 334709360, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (842, 'Au99.95', '2019-07-15 00:00:00', 314.70, 315.15, 315.30, '315', 315.05, 1.35, 0.43, 492, 155005740, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (843, 'Au99.95', '2019-07-12 00:00:00', 313.50, 313.80, 314.80, '314.8', 313.92, -2.80, -0.88, 478, 150056900, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (844, 'Au99.95', '2019-07-11 00:00:00', 314.00, 316.60, 317.30, '314', 316.69, 5.79, 1.86, 444, 140610400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (845, 'Au99.95', '2019-07-10 00:00:00', 310.70, 310.81, 311.70, '311.7', 311.18, -0.44, -0.14, 528, 164304020, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (846, 'Au99.95', '2019-07-09 00:00:00', 311.00, 311.25, 311.80, '311', 311.24, -1.97, -0.63, 384, 119518600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (847, 'Au99.95', '2019-07-08 00:00:00', 312.00, 313.22, 313.90, '312', 312.57, -2.52, -0.80, 234, 73142400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (848, 'Au99.95', '2019-07-05 00:00:00', 315.40, 315.74, 316.50, '316.5', 315.67, 0.84, 0.27, 292, 92177580, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (849, 'Au99.95', '2019-07-04 00:00:00', 314.90, 314.90, 316.60, '316.3', 315.33, -3.33, -1.05, 348, 109737280, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (850, 'Au99.95', '2019-07-03 00:00:00', 313.90, 318.23, 318.71, '318.6', 318.23, 8.70, 2.81, 800, 254589920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (851, 'Au99.95', '2019-07-02 00:00:00', 308.00, 309.53, 317.73, '317.73', 309.51, 2.92, 0.95, 574, 177660080, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (852, 'Au99.95', '2019-07-01 00:00:00', 306.50, 306.61, 315.10, '315', 311.62, -7.39, -2.35, 702, 218757520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (853, 'Au99.95', '2019-06-28 00:00:00', 313.50, 314.00, 317.30, '316', 315.36, 0.71, 0.23, 872, 274999600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (854, 'Au99.95', '2019-06-27 00:00:00', 313.00, 313.29, 314.60, '314.4', 314.07, -1.11, -0.35, 666, 209173820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (855, 'Au99.95', '2019-06-26 00:00:00', 313.70, 314.40, 316.50, '316.5', 314.48, -4.62, -1.45, 798, 250959580, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (856, 'Au99.95', '2019-06-25 00:00:00', 313.00, 319.02, 321.50, '314', 318.42, 5.82, 1.86, 674, 214620240, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (857, 'Au99.95', '2019-06-24 00:00:00', 313.00, 313.20, 314.05, '314', 313.54, 2.01, 0.65, 438, 137333280, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (858, 'Au99.95', '2019-06-21 00:00:00', 310.50, 311.19, 313.60, '310.5', 311.99, 2.66, 0.86, 980, 305751360, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (859, 'Au99.95', '2019-06-20 00:00:00', 306.00, 308.53, 309.30, '306', 308.76, 6.63, 2.20, 688, 212427920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (860, 'Au99.95', '2019-06-19 00:00:00', 301.35, 301.90, 302.20, '301.4', 301.86, -1.60, -0.53, 480, 144897000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (861, 'Au99.95', '2019-06-18 00:00:00', 301.11, 303.50, 303.65, '301.11', 303.04, 2.03, 0.67, 508, 153944400, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (862, 'Au99.95', '2019-06-17 00:00:00', 301.40, 301.47, 305.00, '305', 301.80, -3.55, -1.16, 620, 187122040, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (863, 'Au99.95', '2019-06-14 00:00:00', 299.90, 305.02, 305.20, '299.9', 303.37, 4.88, 1.63, 428, 129843020, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (864, 'Au99.95', '2019-06-13 00:00:00', 299.75, 300.14, 300.20, '300', 300.05, 0.33, 0.11, 266, 79815600, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (865, 'Au99.95', '2019-06-12 00:00:00', 297.70, 299.81, 300.35, '297.7', 299.26, 2.75, 0.93, 1304, 390235960, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (866, 'Au99.95', '2019-06-11 00:00:00', 297.00, 297.06, 298.30, '298.3', 297.39, -1.28, -0.43, 726, 215905500, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (867, 'Au99.95', '2019-06-10 00:00:00', 298.20, 298.34, 299.20, '299', 298.47, -0.78, -0.26, 524, 156400720, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (868, 'Au99.95', '2019-06-06 00:00:00', 297.60, 299.12, 299.20, '297.6', 298.80, 0.17, 0.06, 656, 196018140, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (869, 'Au99.95', '2019-06-05 00:00:00', 297.05, 298.95, 299.00, '297.05', 297.67, 1.99, 0.67, 700, 208369520, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (870, 'Au99.95', '2019-06-04 00:00:00', 296.50, 296.96, 297.10, '296.8', 296.81, 3.02, 1.03, 814, 241605080, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (871, 'Au99.95', '2019-06-03 00:00:00', 291.70, 293.94, 294.85, '291.7', 294.02, 3.39, 1.17, 864, 254038840, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (872, 'Au99.95', '2019-05-31 00:00:00', 289.90, 290.55, 290.70, '290', 290.09, 3.37, 1.17, 508, 147368820, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (873, 'Au99.95', '2019-05-30 00:00:00', 287.00, 287.18, 287.70, '287.7', 287.27, -1.32, -0.46, 628, 180406660, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (874, 'Au99.95', '2019-05-29 00:00:00', 287.30, 288.50, 288.50, '287.45', 287.92, 0.40, 0.14, 586, 168726420, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (875, 'Au99.95', '2019-05-28 00:00:00', 287.90, 288.10, 288.20, '287.9', 288.04, -0.15, -0.05, 544, 156693920, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (876, 'Au99.95', '2019-05-27 00:00:00', 288.10, 288.25, 288.45, '288.1', 288.30, 0.08, 0.03, 464, 133775760, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (877, 'Au99.95', '2019-05-24 00:00:00', 287.50, 288.17, 288.60, '287.5', 288.32, 1.45, 0.51, 900, 259493200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (878, 'Au99.95', '2019-05-23 00:00:00', 286.50, 286.72, 286.85, '286.6', 286.66, 0.58, 0.20, 450, 128999660, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (879, 'Au99.95', '2019-05-22 00:00:00', 285.90, 286.14, 286.20, '286', 286.05, -0.29, -0.10, 404, 115567200, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (880, 'Au99.95', '2019-05-21 00:00:00', 286.01, 286.43, 286.60, '286.4', 286.25, -0.07, -0.02, 426, 121945060, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (881, 'Au99.95', '2019-05-20 00:00:00', 286.20, 286.50, 288.20, '288.2', 286.68, -1.54, -0.53, 360, 103206180, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (882, 'Au99.95', '2019-05-17 00:00:00', 287.00, 288.04, 288.05, '287', 287.73, -0.57, -0.20, 520, 149622000, '2023-06-29 10:38:06', '2023-06-29 13:26:03', 0);
INSERT INTO `trade` VALUES (883, 'Au99.95', '2019-05-16 00:00:00', 288.40, 288.61, 288.80, '288.55', 288.58, 1.29, 0.45, 480, 138518780, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (884, 'Au99.95', '2019-05-15 00:00:00', 286.51, 287.32, 288.45, '288.45', 287.97, -1.06, -0.37, 442, 127285820, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (885, 'Au99.95', '2019-05-14 00:00:00', 287.00, 288.38, 289.20, '287', 288.32, 3.37, 1.18, 706, 203559640, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (886, 'Au99.95', '2019-05-13 00:00:00', 283.70, 285.01, 285.20, '283.7', 284.92, 1.93, 0.68, 532, 151440760, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (887, 'Au99.95', '2019-05-10 00:00:00', 283.00, 283.08, 283.90, '283.35', 283.45, 0.08, 0.03, 524, 148529860, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (888, 'Au99.95', '2019-05-09 00:00:00', 282.35, 283.00, 283.10, '282.4', 282.78, 0.09, 0.03, 614, 173627980, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (889, 'Au99.95', '2019-05-08 00:00:00', 282.40, 282.91, 283.60, '282.85', 282.72, 1.36, 0.48, 798, 225617480, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (890, 'Au99.95', '2019-05-07 00:00:00', 281.50, 281.55, 282.10, '282', 281.91, -0.65, -0.23, 464, 130807520, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (891, 'Au99.95', '2019-05-06 00:00:00', 281.80, 282.20, 282.60, '282.6', 282.06, 1.62, 0.58, 676, 190676620, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (892, 'Au99.95', '2019-04-30 00:00:00', 280.38, 280.58, 280.70, '280.42', 280.46, -0.07, -0.02, 294, 82456680, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (893, 'Au99.95', '2019-04-29 00:00:00', 280.60, 280.65, 281.40, '281.25', 281.22, 0.05, 0.02, 424, 119237280, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (894, 'Au99.95', '2019-04-26 00:00:00', 280.40, 280.60, 281.00, '281', 280.55, 0.68, 0.24, 556, 155989560, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (895, 'Au99.95', '2019-04-25 00:00:00', 279.00, 279.92, 280.15, '279', 279.62, 1.63, 0.59, 692, 193500500, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (896, 'Au99.95', '2019-04-24 00:00:00', 278.25, 278.29, 278.45, '278.45', 278.34, -0.60, -0.22, 1200, 334014780, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (897, 'Au99.95', '2019-04-23 00:00:00', 278.50, 278.89, 279.60, '279.6', 278.66, -1.03, -0.37, 422, 117596660, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (898, 'Au99.95', '2019-04-22 00:00:00', 279.65, 279.92, 280.30, '279.65', 280.08, 0.57, 0.20, 1086, 304167480, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (899, 'Au99.95', '2019-04-19 00:00:00', 279.20, 279.35, 279.80, '279.4', 279.39, 1.41, 0.51, 556, 155343360, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (900, 'Au99.95', '2019-04-18 00:00:00', 277.40, 277.94, 279.00, '279', 277.90, -1.79, -0.64, 748, 207870300, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (901, 'Au99.95', '2019-04-17 00:00:00', 275.20, 279.73, 285.30, '275.2', 278.71, -1.44, -0.51, 848, 236353680, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (902, 'Au99.95', '2019-04-16 00:00:00', 280.80, 281.17, 281.40, '281.2', 281.01, -0.12, -0.04, 628, 176476860, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (903, 'Au99.95', '2019-04-15 00:00:00', 281.25, 281.29, 281.50, '281.4', 281.43, -1.83, -0.65, 332, 93435800, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (904, 'Au99.95', '2019-04-12 00:00:00', 283.10, 283.12, 283.20, '283.2', 283.14, -2.18, -0.76, 280, 79281300, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (905, 'Au99.95', '2019-04-11 00:00:00', 285.25, 285.30, 285.70, '285.5', 285.45, 0.50, 0.18, 734, 205943580, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (906, 'Au99.95', '2019-04-10 00:00:00', 284.46, 284.80, 285.10, '284.8', 284.72, 1.20, 0.42, 1170, 333130480, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (907, 'Au99.95', '2019-04-09 00:00:00', 283.60, 283.60, 284.50, '284.5', 283.82, 0.10, 0.04, 330, 93663560, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (908, 'Au99.95', '2019-04-08 00:00:00', 282.45, 283.50, 283.88, '283.3', 283.37, 1.40, 0.50, 550, 154709360, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (909, 'Au99.95', '2019-04-04 00:00:00', 281.80, 282.10, 282.20, '281.8', 282.05, 0.24, 0.09, 1136, 320415700, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (910, 'Au99.95', '2019-04-03 00:00:00', 281.80, 281.86, 282.35, '282', 282.12, 0.44, 0.16, 890, 251088780, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (911, 'Au99.95', '2019-04-02 00:00:00', 281.20, 281.42, 281.80, '281.6', 281.47, 0.22, 0.08, 3488, 967820300, '2023-06-29 10:38:06', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (912, 'Au99.95', '2019-04-01 00:00:00', 273.99, 281.20, 282.70, '282.7', 281.60, -0.13, -0.05, 1626, 453525920, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (913, 'Au99.95', '2019-03-29 00:00:00', 280.85, 281.33, 283.00, '283', 282.04, -4.94, -1.73, 1198, 337886040, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (914, 'Au99.95', '2019-03-28 00:00:00', 286.00, 286.27, 286.60, '286.25', 286.35, -0.86, -0.30, 1274, 364817520, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (915, 'Au99.95', '2019-03-27 00:00:00', 287.00, 287.13, 287.60, '287.5', 287.33, -0.11, -0.04, 920, 264345080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (916, 'Au99.95', '2019-03-26 00:00:00', 287.01, 287.24, 287.90, '287.6', 287.48, 0.21, 0.07, 1144, 328884400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (917, 'Au99.95', '2019-03-25 00:00:00', 286.75, 287.03, 288.00, '287', 287.05, 1.20, 0.42, 1188, 341016340, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (918, 'Au99.95', '2019-03-22 00:00:00', 285.30, 285.83, 285.93, '285.5', 285.60, -0.56, -0.20, 474, 135375860, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (919, 'Au99.95', '2019-03-21 00:00:00', 285.80, 286.39, 286.50, '285.8', 286.15, 1.86, 0.65, 438, 125334400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (920, 'Au99.95', '2019-03-20 00:00:00', 284.47, 284.53, 284.80, '284.55', 284.66, -0.55, -0.19, 924, 263026260, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (921, 'Au99.95', '2019-03-19 00:00:00', 284.60, 285.08, 285.28, '284.65', 284.98, 1.09, 0.38, 1690, 481618320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (922, 'Au99.95', '2019-03-18 00:00:00', 283.30, 283.99, 284.05, '283.44', 283.47, -0.05, -0.02, 906, 256825360, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (923, 'Au99.95', '2019-03-15 00:00:00', 282.65, 284.04, 286.70, '282.7', 283.36, 0.04, 0.01, 1948, 551999760, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (924, 'Au99.95', '2019-03-14 00:00:00', 284.00, 284.00, 284.50, '284.5', 284.32, -0.57, -0.20, 1770, 498135840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (925, 'Au99.95', '2019-03-13 00:00:00', 276.79, 284.57, 284.65, '284.1', 284.51, 1.51, 0.53, 1476, 419937180, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (926, 'Au99.95', '2019-03-12 00:00:00', 282.45, 283.06, 283.35, '282.5', 282.88, -0.49, -0.17, 2160, 611178200, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (927, 'Au99.95', '2019-03-11 00:00:00', 283.20, 283.55, 283.70, '283.6', 283.57, 1.15, 0.41, 392, 111160520, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (928, 'Au99.95', '2019-03-08 00:00:00', 281.00, 282.40, 282.80, '281', 281.76, 2.60, 0.93, 646, 182021940, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (929, 'Au99.95', '2019-03-07 00:00:00', 279.50, 279.80, 280.55, '280.5', 280.17, -1.54, -0.55, 1698, 475734820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (930, 'Au99.95', '2019-03-06 00:00:00', 279.70, 281.34, 281.43, '279.8', 280.06, 1.91, 0.68, 1440, 403287240, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (931, 'Au99.95', '2019-03-05 00:00:00', 279.30, 279.43, 280.20, '279.7', 279.71, -1.17, -0.42, 804, 224888900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (932, 'Au99.95', '2019-03-04 00:00:00', 280.60, 280.60, 281.80, '281.7', 281.26, -4.01, -1.41, 602, 169321440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (933, 'Au99.95', '2019-03-01 00:00:00', 284.50, 284.61, 285.30, '285.3', 284.90, -1.31, -0.46, 714, 203423340, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (934, 'Au99.95', '2019-02-28 00:00:00', 285.20, 285.92, 285.99, '285.76', 285.66, -1.78, -0.62, 564, 161117020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (935, 'Au99.95', '2019-02-27 00:00:00', 287.56, 287.70, 287.90, '287.8', 287.72, -0.30, -0.10, 906, 260681000, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (936, 'Au99.95', '2019-02-26 00:00:00', 287.70, 288.00, 289.25, '287.7', 288.15, -0.29, -0.10, 1138, 327923500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (937, 'Au99.95', '2019-02-25 00:00:00', 287.80, 288.29, 288.50, '288.2', 288.23, -0.44, -0.15, 1524, 435798060, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (938, 'Au99.95', '2019-02-22 00:00:00', 288.50, 288.73, 289.00, '288.7', 288.81, -1.90, -0.65, 1366, 394506980, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (939, 'Au99.95', '2019-02-21 00:00:00', 290.60, 290.63, 292.00, '292', 291.32, -1.63, -0.56, 862, 251125440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (940, 'Au99.95', '2019-02-20 00:00:00', 291.80, 292.26, 293.92, '291.8', 292.55, 1.87, 0.64, 568, 166172180, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (941, 'Au99.95', '2019-02-19 00:00:00', 290.20, 290.39, 290.90, '290.8', 290.66, 0.43, 0.15, 1144, 332523280, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (942, 'Au99.95', '2019-02-18 00:00:00', 288.50, 289.96, 290.00, '288.5', 289.86, 1.71, 0.59, 450, 130441460, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (943, 'Au99.95', '2019-02-15 00:00:00', 287.55, 288.25, 288.45, '287.55', 287.93, 1.51, 0.53, 1392, 400803760, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (944, 'Au99.95', '2019-02-14 00:00:00', 286.71, 286.74, 287.43, '287', 286.83, -0.41, -0.14, 786, 225451380, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (945, 'Au99.95', '2019-02-13 00:00:00', 287.08, 287.15, 287.60, '287.08', 287.24, -0.51, -0.18, 502, 144195300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (946, 'Au99.95', '2019-02-12 00:00:00', 287.30, 287.66, 288.00, '287.5', 287.45, 0.36, 0.13, 1030, 296077420, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (947, 'Au99.95', '2019-02-11 00:00:00', 287.10, 287.30, 287.65, '287.6', 287.35, 0.00, 0.00, 498, 143101800, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (948, 'Au99.95', '2019-02-01 00:00:00', 286.60, 287.30, 287.35, '286.98', 287.08, 0.84, 0.29, 440, 126317880, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (949, 'Au99.95', '2019-01-31 00:00:00', 286.29, 286.46, 286.70, '286.4', 286.50, -0.03, -0.01, 516, 147837620, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (950, 'Au99.95', '2019-01-30 00:00:00', 286.40, 286.49, 286.60, '286.5', 286.50, 0.57, 0.20, 550, 157576000, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (951, 'Au99.95', '2019-01-29 00:00:00', 285.00, 285.92, 286.00, '285', 285.48, 1.52, 0.53, 500, 142743620, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (952, 'Au99.95', '2019-01-28 00:00:00', 282.20, 284.40, 284.49, '282.2', 284.33, 2.68, 0.95, 724, 205858280, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (953, 'Au99.95', '2019-01-25 00:00:00', 281.70, 281.72, 282.19, '282', 281.94, -0.46, -0.16, 568, 160142340, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (954, 'Au99.95', '2019-01-24 00:00:00', 281.91, 282.18, 282.30, '282.25', 282.12, -0.02, -0.01, 804, 226831600, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (955, 'Au99.95', '2019-01-23 00:00:00', 282.20, 282.20, 282.85, '282.85', 282.58, 0.00, 0.00, 782, 220977740, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (956, 'Au99.95', '2019-01-22 00:00:00', 281.30, 282.20, 282.49, '281.6', 281.64, 0.01, 0.00, 958, 269817000, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (957, 'Au99.95', '2019-01-21 00:00:00', 281.80, 282.19, 282.90, '282.3', 282.12, -1.06, -0.37, 2384, 672784260, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (958, 'Au99.95', '2019-01-18 00:00:00', 283.15, 283.25, 284.00, '283.3', 283.41, 0.21, 0.07, 720, 204059240, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (959, 'Au99.95', '2019-01-17 00:00:00', 282.92, 283.04, 283.60, '283', 283.08, 0.24, 0.08, 878, 248544500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (960, 'Au99.95', '2019-01-16 00:00:00', 282.50, 282.80, 283.50, '283.17', 282.89, 0.65, 0.23, 1044, 295344880, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (961, 'Au99.95', '2019-01-15 00:00:00', 282.10, 282.15, 282.54, '282.5', 282.34, -1.05, -0.37, 1514, 427472560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (962, 'Au99.95', '2019-01-14 00:00:00', 281.59, 283.20, 283.50, '283.5', 282.50, 0.49, 0.17, 1304, 368390120, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (963, 'Au99.95', '2019-01-11 00:00:00', 282.40, 282.71, 283.20, '283.15', 282.67, -1.71, -0.60, 1086, 306987680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (964, 'Au99.95', '2019-01-10 00:00:00', 280.79, 284.42, 285.40, '285', 284.69, 0.67, 0.24, 962, 273877940, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (965, 'Au99.95', '2019-01-09 00:00:00', 283.30, 283.75, 284.90, '284.9', 283.98, -0.49, -0.17, 1268, 360098400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (966, 'Au99.95', '2019-01-08 00:00:00', 284.20, 284.24, 286.50, '286.08', 284.91, -1.69, -0.59, 984, 280356280, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (967, 'Au99.95', '2019-01-07 00:00:00', 285.45, 285.93, 287.60, '287.1', 285.77, -1.34, -0.47, 1558, 445234200, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (968, 'Au99.95', '2019-01-04 00:00:00', 287.05, 287.27, 295.08, '295.08', 287.83, 0.27, 0.09, 1470, 423111780, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (969, 'Au99.95', '2019-01-03 00:00:00', 286.00, 287.00, 287.15, '286', 286.44, 2.08, 0.73, 1540, 441128020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (970, 'Au99.95', '2019-01-02 00:00:00', 283.65, 284.92, 285.00, '283.8', 284.56, 1.11, 0.39, 1970, 560599120, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (971, 'Au99.95', '2018-12-28 00:00:00', 274.99, 283.81, 283.90, '274.99', 283.47, 1.20, 0.42, 1006, 285177560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (972, 'Au99.95', '2018-12-27 00:00:00', 282.45, 282.61, 283.35, '283.35', 282.73, -0.94, -0.33, 2024, 572288300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (973, 'Au99.95', '2018-12-26 00:00:00', 283.00, 283.55, 283.60, '283.19', 283.30, 0.30, 0.11, 1290, 365458280, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (974, 'Au99.95', '2018-12-25 00:00:00', 282.40, 283.25, 285.60, '282.45', 282.96, 1.54, 0.55, 1342, 379740020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (975, 'Au99.95', '2018-12-24 00:00:00', 281.00, 281.71, 281.80, '281', 281.45, 1.22, 0.44, 1492, 419935240, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (976, 'Au99.95', '2018-12-21 00:00:00', 280.10, 280.49, 280.99, '280.3', 280.31, 2.35, 0.84, 966, 270781720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (977, 'Au99.95', '2018-12-20 00:00:00', 277.70, 278.14, 279.50, '279.5', 278.03, -0.21, -0.08, 682, 189617580, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (978, 'Au99.95', '2018-12-19 00:00:00', 278.00, 278.35, 278.50, '278', 278.30, 0.49, 0.18, 762, 212071820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (979, 'Au99.95', '2018-12-18 00:00:00', 277.50, 277.86, 277.90, '277.5', 277.74, 1.76, 0.64, 1168, 324411440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (980, 'Au99.95', '2018-12-17 00:00:00', 275.85, 276.10, 276.40, '276', 276.08, -0.48, -0.17, 754, 208167900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (981, 'Au99.95', '2018-12-14 00:00:00', 276.00, 276.58, 277.00, '276.68', 276.51, -0.03, -0.01, 676, 186926680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (982, 'Au99.95', '2018-12-13 00:00:00', 275.55, 276.61, 276.80, '276.7', 276.39, -0.01, 0.00, 984, 271973900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (983, 'Au99.95', '2018-12-12 00:00:00', 276.60, 276.62, 277.70, '277.7', 276.76, -1.10, -0.40, 1008, 278847920, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (984, 'Au99.95', '2018-12-11 00:00:00', 277.60, 277.72, 278.20, '278', 277.88, -0.46, -0.17, 1514, 420920940, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (985, 'Au99.95', '2018-12-10 00:00:00', 276.00, 278.18, 278.24, '276', 277.91, 2.82, 1.02, 864, 240119720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (986, 'Au99.95', '2018-12-07 00:00:00', 275.00, 275.36, 275.80, '275.5', 275.49, 0.13, 0.05, 1360, 374673680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (987, 'Au99.95', '2018-12-06 00:00:00', 274.95, 275.23, 275.54, '274.95', 275.32, 1.18, 0.43, 776, 213654460, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (988, 'Au99.95', '2018-12-05 00:00:00', 273.90, 274.05, 274.29, '274', 274.02, 0.34, 0.12, 672, 184143600, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (989, 'Au99.95', '2018-12-04 00:00:00', 273.64, 273.71, 274.30, '274.2', 273.91, -0.23, -0.08, 1350, 369806080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (990, 'Au99.95', '2018-12-03 00:00:00', 273.65, 273.94, 274.29, '273.8', 273.93, -0.67, -0.24, 676, 185177020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (991, 'Au99.95', '2018-11-30 00:00:00', 274.40, 274.61, 275.00, '275', 274.61, 0.11, 0.04, 296, 81286500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (992, 'Au99.95', '2018-11-29 00:00:00', 273.00, 274.50, 274.75, '273', 274.48, 1.57, 0.58, 1218, 334351820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (993, 'Au99.95', '2018-11-28 00:00:00', 272.50, 272.93, 273.73, '272.96', 272.93, -1.20, -0.44, 592, 161576340, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (994, 'Au99.95', '2018-11-27 00:00:00', 274.10, 274.13, 274.30, '274.3', 274.19, -0.52, -0.19, 416, 114064480, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (995, 'Au99.95', '2018-11-26 00:00:00', 274.30, 274.65, 274.65, '274.31', 274.54, 0.07, 0.03, 446, 122446860, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (996, 'Au99.95', '2018-11-23 00:00:00', 274.50, 274.58, 275.15, '274.8', 274.97, 0.02, 0.01, 492, 135288500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (997, 'Au99.95', '2018-11-22 00:00:00', 274.50, 274.56, 274.75, '274.6', 274.64, 0.57, 0.21, 342, 93929420, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (998, 'Au99.95', '2018-11-21 00:00:00', 273.85, 273.99, 274.10, '273.9', 273.93, -0.14, -0.05, 444, 121629080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (999, 'Au99.95', '2018-11-20 00:00:00', 273.80, 274.13, 274.30, '273.8', 273.98, 0.95, 0.35, 638, 175647440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1000, 'Au99.95', '2018-11-19 00:00:00', 273.05, 273.18, 273.85, '273.4', 273.39, 0.80, 0.29, 600, 164036040, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1001, 'Au99.95', '2018-11-16 00:00:00', 271.95, 272.38, 272.49, '271.95', 272.21, 0.67, 0.25, 662, 180205500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1002, 'Au99.95', '2018-11-15 00:00:00', 270.99, 271.71, 271.84, '271', 271.42, 1.57, 0.58, 638, 173171200, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1003, 'Au99.95', '2018-11-14 00:00:00', 269.95, 270.14, 273.00, '270', 270.22, -0.18, -0.07, 646, 174564160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1004, 'Au99.95', '2018-11-13 00:00:00', 270.20, 270.32, 271.00, '271', 270.56, -0.95, -0.35, 676, 182903160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1005, 'Au99.95', '2018-11-12 00:00:00', 271.00, 271.27, 273.40, '273.4', 271.61, -2.06, -0.75, 626, 170031500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1006, 'Au99.95', '2018-11-09 00:00:00', 273.30, 273.33, 274.10, '273.9', 273.54, -0.48, -0.18, 828, 226492160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1007, 'Au99.95', '2018-11-08 00:00:00', 273.70, 273.81, 274.20, '274.2', 274.02, -1.16, -0.42, 386, 105773640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1008, 'Au99.95', '2018-11-07 00:00:00', 274.40, 274.97, 275.60, '274.66', 274.76, 0.32, 0.12, 686, 188487940, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1009, 'Au99.95', '2018-11-06 00:00:00', 274.60, 274.65, 275.05, '275', 274.87, -0.41, -0.15, 462, 126990020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1010, 'Au99.95', '2018-11-05 00:00:00', 274.70, 275.06, 275.75, '275.75', 274.84, 0.50, 0.18, 436, 119830440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1011, 'Au99.95', '2018-11-02 00:00:00', 273.55, 274.56, 275.65, '275.45', 275.23, -0.04, -0.01, 378, 104039940, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1012, 'Au99.95', '2018-11-01 00:00:00', 274.00, 274.60, 274.65, '274', 274.20, 0.62, 0.23, 872, 239632920, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1013, 'Au99.95', '2018-10-31 00:00:00', 273.70, 273.98, 274.90, '274.8', 274.33, -2.22, -0.80, 372, 102053400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1014, 'Au99.95', '2018-10-30 00:00:00', 276.10, 276.20, 276.90, '276.8', 276.47, -0.37, -0.13, 472, 130496320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1015, 'Au99.95', '2018-10-29 00:00:00', 276.50, 276.57, 277.45, '277.25', 277.25, -0.70, -0.25, 658, 182431720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1016, 'Au99.95', '2018-10-26 00:00:00', 276.90, 277.27, 277.40, '277', 277.15, -0.33, -0.12, 714, 197888120, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1017, 'Au99.95', '2018-10-25 00:00:00', 275.85, 277.60, 277.80, '275.85', 277.49, 1.30, 0.47, 394, 109333400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1018, 'Au99.95', '2018-10-24 00:00:00', 276.19, 276.30, 277.60, '277.5', 276.45, 0.12, 0.04, 686, 189648900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1019, 'Au99.95', '2018-10-23 00:00:00', 274.45, 276.18, 276.40, '274.5', 274.75, 1.50, 0.55, 592, 162655300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1020, 'Au99.95', '2018-10-22 00:00:00', 274.56, 274.68, 275.00, '274.85', 274.74, -0.22, -0.08, 684, 187927820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1021, 'Au99.95', '2018-10-19 00:00:00', 274.80, 274.90, 275.40, '275.4', 274.98, 1.44, 0.53, 714, 196848140, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1022, 'Au99.95', '2018-10-18 00:00:00', 273.30, 273.46, 274.00, '273.7', 273.81, 0.06, 0.02, 774, 211931940, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1023, 'Au99.95', '2018-10-17 00:00:00', 273.05, 273.40, 273.45, '273.2', 273.32, -0.88, -0.32, 916, 250361700, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1024, 'Au99.95', '2018-10-16 00:00:00', 273.80, 274.28, 274.45, '274', 274.09, 0.35, 0.13, 900, 246681620, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1025, 'Au99.95', '2018-10-15 00:00:00', 272.00, 273.93, 274.55, '272', 273.09, 2.35, 0.87, 1046, 285657440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1026, 'Au99.95', '2018-10-12 00:00:00', 268.30, 271.58, 272.00, '268.3', 271.51, 3.48, 1.30, 924, 250881020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1027, 'Au99.95', '2018-10-11 00:00:00', 266.98, 268.10, 268.15, '266.98', 267.49, 1.66, 0.62, 868, 232191740, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1028, 'Au99.95', '2018-10-10 00:00:00', 266.39, 266.44, 266.60, '266.6', 266.47, -0.04, -0.02, 320, 85270440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1029, 'Au99.95', '2018-10-09 00:00:00', 260.35, 266.48, 266.65, '266', 266.50, -0.40, -0.15, 772, 205739520, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1030, 'Au99.95', '2018-10-08 00:00:00', 266.70, 266.88, 267.00, '267', 266.83, 3.27, 1.24, 1156, 308460120, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1031, 'Au99.95', '2018-09-28 00:00:00', 263.50, 263.61, 264.20, '264', 264.02, -2.25, -0.85, 1506, 397624620, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1032, 'Au99.95', '2018-09-27 00:00:00', 265.59, 265.86, 266.35, '266.35', 266.03, -0.95, -0.36, 1108, 294764260, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1033, 'Au99.95', '2018-09-26 00:00:00', 266.40, 266.81, 267.00, '266.6', 266.76, 0.47, 0.18, 588, 156860420, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1034, 'Au99.95', '2018-09-25 00:00:00', 265.85, 266.34, 266.39, '266.2', 266.04, -0.98, -0.37, 816, 217089720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1035, 'Au99.95', '2018-09-21 00:00:00', 266.70, 267.32, 267.40, '266.7', 267.06, 0.81, 0.30, 666, 177862720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1036, 'Au99.95', '2018-09-20 00:00:00', 266.50, 266.51, 266.78, '266.6', 266.64, 0.07, 0.03, 380, 101324160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1037, 'Au99.95', '2018-09-19 00:00:00', 265.85, 266.44, 266.50, '266.2', 266.14, 0.71, 0.27, 426, 113378640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1038, 'Au99.95', '2018-09-18 00:00:00', 265.60, 265.73, 266.25, '266.2', 266.13, 0.20, 0.08, 950, 252846840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1039, 'Au99.95', '2018-09-17 00:00:00', 265.50, 265.53, 266.59, '265.6', 265.65, -1.13, -0.42, 734, 194988540, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1040, 'Au99.95', '2018-09-14 00:00:00', 266.10, 266.66, 267.50, '267.5', 266.49, 0.45, 0.17, 756, 201473220, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1041, 'Au99.95', '2018-09-13 00:00:00', 265.40, 266.21, 266.35, '265.8', 266.15, 1.15, 0.43, 712, 189505600, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1042, 'Au99.95', '2018-09-12 00:00:00', 237.88, 265.06, 265.48, '239.99', 264.73, -0.32, -0.12, 582, 154077840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1043, 'Au99.95', '2018-09-11 00:00:00', 265.05, 265.38, 266.00, '265.1', 265.18, 0.61, 0.23, 668, 177145900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1044, 'Au99.95', '2018-09-10 00:00:00', 264.60, 264.77, 265.50, '265.5', 264.89, -0.51, -0.19, 1852, 490533080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1045, 'Au99.95', '2018-09-07 00:00:00', 265.20, 265.28, 265.60, '265.3', 265.45, 0.69, 0.26, 586, 155555320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1046, 'Au99.95', '2018-09-06 00:00:00', 264.50, 264.59, 264.80, '264.5', 264.62, 0.68, 0.26, 590, 156130280, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1047, 'Au99.95', '2018-09-05 00:00:00', 263.60, 263.91, 264.10, '263.68', 263.77, -0.09, -0.03, 686, 180948200, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1048, 'Au99.95', '2018-09-04 00:00:00', 264.00, 264.00, 265.15, '265.15', 264.72, -0.96, -0.36, 802, 212306980, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1049, 'Au99.95', '2018-09-03 00:00:00', 264.90, 264.96, 265.80, '265.8', 265.23, -1.19, -0.45, 608, 161262820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1050, 'Au99.95', '2018-08-31 00:00:00', 265.45, 266.15, 266.20, '265.5', 265.66, 0.63, 0.24, 552, 146645480, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1051, 'Au99.95', '2018-08-30 00:00:00', 265.40, 265.52, 265.90, '265.6', 265.55, 0.22, 0.08, 828, 219877400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1052, 'Au99.95', '2018-08-29 00:00:00', 265.09, 265.30, 265.40, '265.1', 265.17, -1.10, -0.41, 1152, 305482240, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1053, 'Au99.95', '2018-08-28 00:00:00', 265.60, 266.40, 266.50, '265.6', 265.92, 1.01, 0.38, 976, 259544900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1054, 'Au99.95', '2018-08-27 00:00:00', 265.19, 265.39, 265.65, '265.19', 265.37, 0.84, 0.32, 460, 122070440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1055, 'Au99.95', '2018-08-24 00:00:00', 263.90, 264.55, 264.60, '264', 264.23, 0.30, 0.11, 614, 162241020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1056, 'Au99.95', '2018-08-23 00:00:00', 263.99, 264.25, 264.65, '264.45', 264.53, 0.05, 0.02, 390, 103170080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1057, 'Au99.95', '2018-08-22 00:00:00', 263.75, 264.20, 264.50, '263.75', 264.34, -0.16, -0.06, 410, 108380780, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1058, 'Au99.95', '2018-08-21 00:00:00', 263.55, 264.36, 264.45, '263.55', 264.16, 1.43, 0.54, 2554, 705808500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1059, 'Au99.95', '2018-08-20 00:00:00', 262.20, 262.93, 263.00, '262.2', 262.70, 1.43, 0.55, 518, 136078840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1060, 'Au99.95', '2018-08-17 00:00:00', 261.50, 261.50, 261.90, '261.89', 261.75, -0.72, -0.27, 408, 106795460, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1061, 'Au99.95', '2018-08-16 00:00:00', 261.00, 262.22, 262.30, '261', 261.73, -2.78, -1.05, 412, 107835880, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1062, 'Au99.95', '2018-08-15 00:00:00', 264.80, 265.00, 265.42, '265.42', 265.01, -0.54, -0.20, 1008, 267449480, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1063, 'Au99.95', '2018-08-14 00:00:00', 265.49, 265.54, 268.00, '268', 265.63, -2.24, -0.84, 1174, 322866700, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1064, 'Au99.95', '2018-08-13 00:00:00', 267.60, 267.78, 267.90, '267.9', 267.87, 0.75, 0.28, 1176, 314875480, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1065, 'Au99.95', '2018-08-10 00:00:00', 266.88, 267.03, 267.30, '267.2', 267.17, -0.14, -0.05, 2562, 684495120, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1066, 'Au99.95', '2018-08-09 00:00:00', 266.90, 267.17, 267.32, '267.15', 267.15, 0.16, 0.06, 616, 164570260, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1067, 'Au99.95', '2018-08-08 00:00:00', 266.68, 267.01, 267.10, '266.8', 266.86, -0.60, -0.22, 1344, 363166640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1068, 'Au99.95', '2018-08-07 00:00:00', 267.30, 267.61, 267.65, '267.3', 267.42, 0.09, 0.03, 1460, 390433240, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1069, 'Au99.95', '2018-08-06 00:00:00', 267.50, 267.52, 267.80, '267.8', 267.66, -0.14, -0.05, 1202, 322292060, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1070, 'Au99.95', '2018-08-03 00:00:00', 267.60, 267.66, 267.80, '267.8', 267.62, -0.35, -0.13, 198, 52990000, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1071, 'Au99.95', '2018-08-02 00:00:00', 268.00, 268.01, 268.10, '268.1', 268.01, -0.44, -0.16, 1846, 517788320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1072, 'Au99.95', '2018-08-01 00:00:00', 268.30, 268.45, 268.50, '268.3', 268.42, -0.20, -0.07, 330, 88579260, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1073, 'Au99.95', '2018-07-31 00:00:00', 268.50, 268.65, 268.80, '268.7', 268.59, 0.09, 0.03, 718, 192853440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1074, 'Au99.95', '2018-07-30 00:00:00', 268.50, 268.56, 268.80, '268.5', 268.71, 0.10, 0.04, 440, 118234080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1075, 'Au99.95', '2018-07-27 00:00:00', 268.30, 268.46, 268.50, '268.5', 268.38, -0.16, -0.06, 370, 99303360, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1076, 'Au99.95', '2018-07-26 00:00:00', 268.15, 268.62, 268.70, '268.15', 268.29, 0.61, 0.23, 466, 125027020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1077, 'Au99.95', '2018-07-25 00:00:00', 268.00, 268.01, 268.50, '268.5', 268.17, -0.03, -0.01, 356, 95471160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1078, 'Au99.95', '2018-07-24 00:00:00', 267.99, 268.04, 268.54, '268.3', 268.23, -0.22, -0.08, 1408, 382541500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1079, 'Au99.95', '2018-07-23 00:00:00', 268.10, 268.26, 268.45, '268.15', 268.29, 1.31, 0.49, 712, 191026660, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1080, 'Au99.95', '2018-07-20 00:00:00', 266.70, 266.95, 267.10, '266.8', 266.86, 0.85, 0.32, 608, 162252440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1081, 'Au99.95', '2018-07-19 00:00:00', 265.90, 266.10, 266.25, '265.9', 266.10, 0.95, 0.36, 450, 120175100, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1082, 'Au99.95', '2018-07-18 00:00:00', 264.95, 265.15, 265.85, '265.85', 265.44, -2.67, -1.00, 918, 243665920, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1083, 'Au99.95', '2018-07-17 00:00:00', 267.27, 267.82, 268.00, '267.3', 267.50, -0.33, -0.12, 720, 192601060, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1084, 'Au99.95', '2018-07-16 00:00:00', 268.10, 268.15, 268.45, '268.3', 268.31, 0.33, 0.12, 840, 225413560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1085, 'Au99.95', '2018-07-13 00:00:00', 267.80, 267.82, 268.10, '268', 267.94, -0.14, -0.05, 458, 122716640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1086, 'Au99.95', '2018-07-12 00:00:00', 267.80, 267.96, 268.65, '268.65', 268.21, -1.04, -0.39, 566, 151807600, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1087, 'Au99.95', '2018-07-11 00:00:00', 268.80, 269.00, 269.10, '269.1', 268.93, 0.70, 0.26, 416, 111878540, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1088, 'Au99.95', '2018-07-10 00:00:00', 268.10, 268.30, 268.60, '268.4', 268.37, -0.89, -0.33, 324, 86953800, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1089, 'Au99.95', '2018-07-09 00:00:00', 268.90, 269.19, 269.20, '269', 268.98, -0.03, -0.01, 718, 193131840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1090, 'Au99.95', '2018-07-06 00:00:00', 269.10, 269.22, 269.25, '269.1', 269.16, 0.64, 0.24, 228, 61368480, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1091, 'Au99.95', '2018-07-05 00:00:00', 268.50, 268.58, 268.80, '268.8', 268.66, 0.09, 0.03, 1740, 465707980, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1092, 'Au99.95', '2018-07-04 00:00:00', 268.40, 268.49, 269.20, '269', 268.82, 0.64, 0.24, 1152, 308831140, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1093, 'Au99.95', '2018-07-03 00:00:00', 267.45, 267.85, 268.00, '267.45', 267.91, -0.15, -0.06, 968, 260647040, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1094, 'Au99.95', '2018-07-02 00:00:00', 267.60, 268.00, 268.05, '267.8', 267.71, 1.08, 0.40, 2040, 549034560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1095, 'Au99.95', '2018-06-29 00:00:00', 266.90, 266.92, 276.12, '266.95', 267.29, 0.04, 0.02, 1290, 344810600, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1096, 'Au99.95', '2018-06-28 00:00:00', 266.80, 266.88, 267.60, '267.6', 267.32, -0.62, -0.23, 494, 132057540, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1097, 'Au99.95', '2018-06-27 00:00:00', 267.00, 267.50, 267.50, '267', 267.34, 0.33, 0.12, 794, 212903300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1098, 'Au99.95', '2018-06-26 00:00:00', 267.00, 267.17, 267.40, '267.2', 267.17, 0.18, 0.07, 2552, 701538680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1099, 'Au99.95', '2018-06-25 00:00:00', 266.80, 266.99, 267.50, '267.35', 267.18, 0.54, 0.20, 762, 203598640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1100, 'Au99.95', '2018-06-22 00:00:00', 266.10, 266.45, 266.53, '266.1', 266.35, 1.06, 0.40, 2330, 642663520, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1101, 'Au99.95', '2018-06-21 00:00:00', 265.00, 265.39, 266.80, '266.8', 265.24, -0.61, -0.23, 692, 183550900, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1102, 'Au99.95', '2018-06-20 00:00:00', 266.00, 266.00, 267.00, '267', 266.23, -1.45, -0.54, 1204, 335712660, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1103, 'Au99.95', '2018-06-19 00:00:00', 266.90, 267.45, 267.50, '267.2', 267.05, -1.52, -0.57, 850, 226991100, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1104, 'Au99.95', '2018-06-15 00:00:00', 268.80, 268.97, 269.65, '269.6', 269.39, 0.41, 0.15, 4044, 1135021640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1105, 'Au99.95', '2018-06-14 00:00:00', 268.00, 268.56, 268.71, '268', 268.16, 0.75, 0.28, 10828, 2940086660, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1106, 'Au99.95', '2018-06-13 00:00:00', 267.21, 267.81, 268.00, '267.21', 267.91, -0.39, -0.15, 3986, 1106733340, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1107, 'Au99.95', '2018-06-12 00:00:00', 268.15, 268.20, 268.50, '268.4', 268.40, -0.07, -0.03, 10640, 2876272180, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1108, 'Au99.95', '2018-06-11 00:00:00', 268.25, 268.27, 268.90, '268.3', 268.54, 0.43, 0.16, 762, 204634020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1109, 'Au99.95', '2018-06-08 00:00:00', 267.80, 267.84, 268.00, '268', 267.95, 0.09, 0.03, 4852, 1372137480, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1110, 'Au99.95', '2018-06-07 00:00:00', 267.60, 267.75, 267.80, '267.6', 267.69, -0.02, -0.01, 5070, 1432773500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1111, 'Au99.95', '2018-06-06 00:00:00', 267.75, 267.77, 267.95, '267.94', 267.86, 0.47, 0.18, 692, 185343560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1112, 'Au99.95', '2018-06-05 00:00:00', 267.20, 267.30, 274.98, '274.98', 267.39, -0.45, -0.17, 6242, 1721028160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1113, 'Au99.95', '2018-06-04 00:00:00', 267.70, 267.75, 268.15, '268.1', 267.76, -1.88, -0.70, 1504, 401182320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1114, 'Au99.95', '2018-06-01 00:00:00', 268.75, 269.63, 269.95, '268.8', 268.92, 0.09, 0.03, 488, 131237720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1115, 'Au99.95', '2018-05-31 00:00:00', 268.46, 269.54, 273.40, '269.4', 269.99, 0.54, 0.20, 520, 140182640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1116, 'Au99.95', '2018-05-30 00:00:00', 269.00, 269.00, 269.60, '269.6', 269.35, 0.50, 0.19, 1362, 373146540, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1117, 'Au99.95', '2018-05-29 00:00:00', 268.50, 268.50, 268.80, '268.7', 268.68, 1.20, 0.45, 1268, 340695220, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1118, 'Au99.95', '2018-05-28 00:00:00', 266.75, 267.30, 268.00, '267.9', 267.78, -1.45, -0.54, 412, 110329140, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1119, 'Au99.95', '2018-05-25 00:00:00', 268.35, 268.75, 268.90, '268.35', 268.65, 1.43, 0.53, 1536, 414858060, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1120, 'Au99.95', '2018-05-24 00:00:00', 266.90, 267.32, 267.35, '266.9', 267.17, 1.01, 0.38, 2920, 814329300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1121, 'Au99.95', '2018-05-23 00:00:00', 260.20, 266.31, 266.35, '266.15', 266.05, 0.60, 0.23, 1778, 473076780, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1122, 'Au99.95', '2018-05-22 00:00:00', 265.50, 265.71, 265.90, '265.9', 265.76, 0.76, 0.29, 3060, 840675360, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1123, 'Au99.95', '2018-05-21 00:00:00', 264.70, 264.95, 266.00, '266', 265.49, -0.73, -0.27, 1030, 273535640, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1124, 'Au99.95', '2018-05-18 00:00:00', 265.40, 265.68, 265.76, '265.4', 265.53, 0.55, 0.21, 16012, 4492228720, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1125, 'Au99.95', '2018-05-17 00:00:00', 265.10, 265.13, 265.85, '265.6', 265.59, -1.69, -0.63, 2924, 803696320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1126, 'Au99.95', '2018-05-16 00:00:00', 266.40, 266.82, 267.00, '267', 266.49, -2.33, -0.87, 2098, 572167200, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1127, 'Au99.95', '2018-05-15 00:00:00', 269.00, 269.15, 270.30, '270.3', 269.19, -1.15, -0.43, 4216, 1165339320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1128, 'Au99.95', '2018-05-14 00:00:00', 270.10, 270.30, 270.50, '270.5', 270.34, -0.20, -0.07, 854, 230878440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1129, 'Au99.95', '2018-05-11 00:00:00', 270.25, 270.50, 270.60, '270.3', 270.37, 0.55, 0.20, 1340, 365203300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1130, 'Au99.95', '2018-05-10 00:00:00', 269.90, 269.95, 270.35, '269.9', 270.13, 0.62, 0.23, 1314, 360913980, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1131, 'Au99.95', '2018-05-09 00:00:00', 268.40, 269.33, 270.30, '270.3', 269.87, -0.72, -0.27, 1264, 341127680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1132, 'Au99.95', '2018-05-08 00:00:00', 269.88, 270.05, 270.45, '270.45', 270.09, -0.03, -0.01, 802, 216615160, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1133, 'Au99.95', '2018-05-07 00:00:00', 270.00, 270.08, 270.65, '270.6', 270.48, 0.78, 0.29, 404, 109275840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1134, 'Au99.95', '2018-05-04 00:00:00', 269.20, 269.30, 269.70, '269.7', 269.59, 0.04, 0.01, 508, 136952000, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1135, 'Au99.95', '2018-05-03 00:00:00', 269.10, 269.26, 269.80, '269.8', 269.45, -0.12, -0.04, 872, 234967920, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1136, 'Au99.95', '2018-05-02 00:00:00', 268.70, 269.38, 269.40, '268.7', 269.29, -0.80, -0.30, 446, 120103600, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1137, 'Au99.95', '2018-04-27 00:00:00', 269.90, 270.18, 271.80, '269.9', 270.07, -0.82, -0.30, 800, 217351300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1138, 'Au99.95', '2018-04-26 00:00:00', 270.65, 271.00, 271.00, '270.7', 270.79, 0.49, 0.18, 1816, 491757140, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1139, 'Au99.95', '2018-04-25 00:00:00', 270.50, 270.51, 271.30, '271.3', 270.79, -0.22, -0.08, 2082, 565754560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1140, 'Au99.95', '2018-04-24 00:00:00', 270.55, 270.73, 271.10, '270.55', 270.89, -0.72, -0.27, 1616, 444379560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1141, 'Au99.95', '2018-04-23 00:00:00', 271.20, 271.45, 271.80, '271.3', 271.45, -1.50, -0.55, 1282, 348011340, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1142, 'Au99.95', '2018-04-20 00:00:00', 272.50, 272.95, 273.25, '273.25', 272.66, -1.05, -0.38, 1374, 380687020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1143, 'Au99.95', '2018-04-19 00:00:00', 273.45, 274.00, 274.05, '274', 273.61, 0.81, 0.30, 1884, 521320120, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1144, 'Au99.95', '2018-04-18 00:00:00', 272.70, 273.19, 273.30, '272.7', 273.04, -0.13, -0.05, 2664, 746689660, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1145, 'Au99.95', '2018-04-17 00:00:00', 272.80, 273.32, 273.38, '273.25', 273.14, 1.12, 0.41, 1262, 344683680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1146, 'Au99.95', '2018-04-16 00:00:00', 272.20, 272.20, 273.60, '273.4', 273.24, 0.35, 0.13, 1164, 319992960, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1147, 'Au99.95', '2018-04-13 00:00:00', 271.85, 271.85, 272.60, '272.1', 272.24, -2.27, -0.83, 1226, 335119400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1148, 'Au99.95', '2018-04-12 00:00:00', 273.50, 274.12, 274.60, '273.99', 273.83, 1.02, 0.37, 1380, 379836800, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1149, 'Au99.95', '2018-04-11 00:00:00', 272.10, 273.10, 273.10, '272.23', 272.41, 1.53, 0.56, 556, 151461560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1150, 'Au99.95', '2018-04-10 00:00:00', 271.25, 271.57, 272.25, '271.5', 271.58, 0.17, 0.06, 1294, 351425740, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1151, 'Au99.95', '2018-04-09 00:00:00', 271.20, 271.40, 271.85, '271.5', 271.55, -0.42, -0.15, 1136, 310815500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1152, 'Au99.95', '2018-04-04 00:00:00', 271.00, 271.82, 271.90, '271.1', 271.59, -0.50, -0.18, 934, 253669380, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1153, 'Au99.95', '2018-04-03 00:00:00', 271.70, 272.32, 272.40, '271.7', 272.23, 1.95, 0.72, 670, 182398500, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1154, 'Au99.95', '2018-04-02 00:00:00', 270.00, 270.37, 270.40, '270.4', 270.16, 0.42, 0.16, 784, 211807020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1155, 'Au99.95', '2018-03-30 00:00:00', 269.68, 269.95, 270.00, '269.68', 269.88, 0.35, 0.13, 734, 198095040, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1156, 'Au99.95', '2018-03-29 00:00:00', 269.50, 269.60, 271.90, '271.9', 270.41, -2.84, -1.04, 480, 129799560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1157, 'Au99.95', '2018-03-28 00:00:00', 272.30, 272.44, 273.36, '272.5', 272.97, -1.71, -0.62, 900, 245718920, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1158, 'Au99.95', '2018-03-27 00:00:00', 273.80, 274.15, 274.50, '274.5', 273.96, -0.14, -0.05, 384, 105203220, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1159, 'Au99.95', '2018-03-26 00:00:00', 274.10, 274.29, 275.20, '275', 274.76, -0.46, -0.17, 1056, 290155320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1160, 'Au99.95', '2018-03-23 00:00:00', 272.00, 274.75, 274.75, '272', 274.00, 2.73, 1.00, 938, 257014460, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1161, 'Au99.95', '2018-03-22 00:00:00', 269.70, 272.02, 272.10, '269.7', 271.74, 2.52, 0.94, 524, 142392420, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1162, 'Au99.95', '2018-03-21 00:00:00', 268.50, 269.50, 269.50, '268.9', 269.07, 0.07, 0.03, 1050, 285703440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1163, 'Au99.95', '2018-03-20 00:00:00', 268.70, 269.43, 269.49, '268.7', 269.28, 1.21, 0.45, 848, 228354040, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1164, 'Au99.95', '2018-03-19 00:00:00', 268.10, 268.22, 270.20, '270.2', 268.82, -1.50, -0.56, 752, 202153020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1165, 'Au99.95', '2018-03-16 00:00:00', 269.35, 269.72, 269.85, '269.85', 269.61, -1.07, -0.40, 2002, 540174240, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1166, 'Au99.95', '2018-03-15 00:00:00', 270.10, 270.79, 270.90, '270.1', 270.79, -0.21, -0.08, 894, 242086400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1167, 'Au99.95', '2018-03-14 00:00:00', 271.00, 271.00, 272.20, '271', 271.25, 0.52, 0.19, 838, 227314320, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1168, 'Au99.95', '2018-03-13 00:00:00', 270.35, 270.48, 270.79, '270.7', 270.51, -0.22, -0.08, 1066, 288363800, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1169, 'Au99.95', '2018-03-12 00:00:00', 270.20, 270.70, 270.88, '270.2', 270.71, 0.30, 0.11, 1692, 470128960, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1170, 'Au99.95', '2018-03-09 00:00:00', 270.40, 270.40, 271.50, '271.5', 270.58, -1.58, -0.58, 1406, 380931840, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1171, 'Au99.95', '2018-03-08 00:00:00', 271.40, 271.98, 272.00, '271.4', 271.67, -0.19, -0.07, 868, 235815300, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1172, 'Au99.95', '2018-03-07 00:00:00', 272.10, 272.17, 273.06, '272.8', 272.60, 0.84, 0.31, 534, 145569260, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1173, 'Au99.95', '2018-03-06 00:00:00', 270.90, 271.33, 271.49, '270.9', 271.26, -0.46, -0.17, 726, 196939700, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1174, 'Au99.95', '2018-03-05 00:00:00', 271.38, 271.79, 271.80, '271.5', 271.63, 1.13, 0.42, 816, 221657820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1175, 'Au99.95', '2018-03-02 00:00:00', 270.50, 270.66, 270.90, '270.5', 270.75, 1.13, 0.42, 372, 100720800, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1176, 'Au99.95', '2018-03-01 00:00:00', 269.40, 269.53, 269.95, '269.7', 269.73, -0.44, -0.16, 958, 262414560, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1177, 'Au99.95', '2018-02-28 00:00:00', 269.68, 269.97, 270.10, '270', 269.90, -2.08, -0.76, 640, 172739740, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1178, 'Au99.95', '2018-02-27 00:00:00', 271.80, 272.05, 272.50, '272.5', 272.03, -1.35, -0.49, 2220, 622906180, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1179, 'Au99.95', '2018-02-26 00:00:00', 272.10, 273.40, 273.50, '272.1', 272.88, 1.89, 0.70, 1706, 465741780, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1180, 'Au99.95', '2018-02-23 00:00:00', 271.51, 271.51, 272.30, '271.6', 272.00, 0.19, 0.07, 6874, 1898192180, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1181, 'Au99.95', '2018-02-22 00:00:00', 271.00, 271.32, 271.50, '271', 271.34, -1.50, -0.55, 816, 221420820, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1182, 'Au99.95', '2018-02-14 00:00:00', 272.00, 272.82, 273.00, '272', 272.25, 1.87, 0.69, 188, 51183180, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1183, 'Au99.95', '2018-02-13 00:00:00', 270.35, 270.95, 271.10, '270.5', 270.56, 1.18, 0.44, 360, 97404460, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1184, 'Au99.95', '2018-02-12 00:00:00', 269.00, 269.77, 270.03, '269', 269.77, 0.16, 0.06, 1192, 321572080, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1185, 'Au99.95', '2018-02-09 00:00:00', 269.00, 269.61, 270.00, '269', 269.84, 0.58, 0.22, 898, 242320660, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1186, 'Au99.95', '2018-02-08 00:00:00', 267.60, 269.03, 269.19, '267.8', 268.01, -0.64, -0.24, 1740, 466457020, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1187, 'Au99.95', '2018-02-07 00:00:00', 269.00, 269.67, 271.70, '271.7', 269.23, -3.43, -1.26, 4168, 1146191440, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1188, 'Au99.95', '2018-02-06 00:00:00', 272.60, 273.10, 274.05, '273', 273.07, 1.84, 0.68, 1324, 361427280, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1189, 'Au99.95', '2018-02-05 00:00:00', 271.10, 271.26, 272.60, '271.8', 271.45, -2.46, -0.90, 3148, 858270520, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1190, 'Au99.95', '2018-02-02 00:00:00', 273.20, 273.72, 274.00, '273.2', 273.78, 0.50, 0.18, 456, 124845780, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1191, 'Au99.95', '2018-02-01 00:00:00', 273.20, 273.22, 273.90, '273.5', 273.46, -0.60, -0.22, 1608, 442063400, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1192, 'Au99.95', '2018-01-31 00:00:00', 273.70, 273.82, 275.00, '275', 273.94, -0.08, -0.03, 474, 129849980, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1193, 'Au99.95', '2018-01-30 00:00:00', 273.50, 273.90, 274.95, '274.95', 273.93, -2.08, -0.75, 2212, 608318960, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1194, 'Au99.95', '2018-01-29 00:00:00', 275.80, 275.98, 276.80, '276.8', 276.09, -1.33, -0.48, 1154, 318613680, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1195, 'Au99.95', '2018-01-26 00:00:00', 276.80, 277.31, 277.75, '277.75', 277.08, -1.45, -0.52, 2730, 758940200, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1196, 'Au99.95', '2018-01-25 00:00:00', 278.65, 278.76, 279.20, '278.68', 278.94, 1.06, 0.38, 770, 214785100, '2023-06-29 10:38:07', '2023-06-29 13:26:04', 0);
INSERT INTO `trade` VALUES (1197, 'Au99.95', '2018-01-24 00:00:00', 277.10, 277.70, 277.80, '277.1', 277.41, 0.70, 0.25, 5118, 1410002040, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1198, 'Au99.95', '2018-01-23 00:00:00', 276.25, 277.00, 277.00, '276.25', 276.56, 1.15, 0.42, 5616, 1548280640, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1199, 'Au99.95', '2018-01-22 00:00:00', 275.75, 275.85, 276.40, '276', 276.00, 0.17, 0.06, 1102, 304158040, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1200, 'Au99.95', '2018-01-19 00:00:00', 275.00, 275.68, 275.80, '275.21', 275.46, -0.46, -0.17, 1108, 305220160, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1201, 'Au99.95', '2018-01-18 00:00:00', 275.90, 276.14, 276.70, '276.46', 276.25, -1.54, -0.55, 1324, 365762620, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1202, 'Au99.95', '2018-01-17 00:00:00', 276.95, 277.68, 278.80, '278.8', 278.16, -1.13, -0.41, 1092, 303758400, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1203, 'Au99.95', '2018-01-16 00:00:00', 278.70, 278.81, 279.25, '279.25', 278.91, -5.60, -1.97, 2726, 760409400, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1204, 'Au99.95', '2018-01-15 00:00:00', 278.95, 284.41, 289.15, '279.2', 279.12, 6.06, 2.18, 2022, 564397600, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1205, 'Au99.95', '2018-01-12 00:00:00', 277.90, 278.35, 278.50, '277.9', 278.31, 1.06, 0.38, 1028, 286106200, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1206, 'Au99.95', '2018-01-11 00:00:00', 277.10, 277.29, 278.20, '277.7', 277.85, 0.56, 0.20, 1194, 331762780, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1207, 'Au99.95', '2018-01-10 00:00:00', 276.50, 276.73, 278.67, '276.6', 276.75, -0.37, -0.13, 1784, 495649600, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1208, 'Au99.95', '2018-01-09 00:00:00', 276.70, 277.10, 277.25, '276.7', 277.00, 0.50, 0.18, 2516, 651991260, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1209, 'Au99.95', '2018-01-08 00:00:00', 276.30, 276.60, 277.00, '276.3', 276.69, 0.21, 0.08, 1702, 470931280, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1210, 'Au99.95', '2018-01-05 00:00:00', 275.70, 276.39, 276.89, '275.7', 276.56, 1.11, 0.40, 930, 257209920, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1211, 'Au99.95', '2018-01-04 00:00:00', 274.70, 275.28, 276.02, '276.02', 275.20, -0.74, -0.27, 1432, 394093860, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1212, 'Au99.95', '2018-01-03 00:00:00', 275.50, 276.02, 276.85, '275.5', 276.38, 0.95, 0.35, 1032, 285229320, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1213, 'Au99.95', '2018-01-02 00:00:00', 274.50, 275.07, 275.20, '274.8', 274.72, 1.83, 0.67, 1332, 365930740, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1214, 'Au99.95', '2017-12-29 00:00:00', 272.36, 273.24, 273.70, '273.7', 273.45, -0.24, -0.09, 1164, 318305020, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1215, 'Au99.95', '2017-12-28 00:00:00', 273.00, 273.48, 273.90, '273', 273.41, 0.65, 0.24, 2306, 634828640, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1216, 'Au99.95', '2017-12-27 00:00:00', 272.00, 272.83, 273.00, '272', 272.32, 1.23, 0.45, 6778, 1851835520, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1217, 'Au99.95', '2017-12-26 00:00:00', 271.40, 271.60, 271.75, '271.5', 271.57, -0.10, -0.04, 1594, 432917620, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1218, 'Au99.95', '2017-12-25 00:00:00', 271.00, 271.70, 271.80, '271', 271.62, 1.38, 0.51, 1246, 338446820, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1219, 'Au99.95', '2017-12-22 00:00:00', 269.90, 270.32, 270.35, '270', 270.15, 0.37, 0.14, 3184, 873730640, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1220, 'Au99.95', '2017-12-21 00:00:00', 269.70, 269.95, 270.24, '270.24', 270.01, -0.28, -0.10, 1350, 364515240, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1221, 'Au99.95', '2017-12-20 00:00:00', 270.00, 270.23, 270.75, '270.6', 270.30, -0.72, -0.27, 980, 264897120, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1222, 'Au99.95', '2017-12-19 00:00:00', 270.00, 270.95, 271.10, '270', 270.47, 1.36, 0.50, 1242, 335925120, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1223, 'Au99.95', '2017-12-18 00:00:00', 269.10, 269.59, 269.60, '269.2', 269.37, 0.25, 0.09, 856, 230585000, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1224, 'Au99.95', '2017-12-15 00:00:00', 269.10, 269.34, 269.38, '269.1', 269.25, -0.24, -0.09, 568, 152939400, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1225, 'Au99.95', '2017-12-14 00:00:00', 268.69, 269.58, 269.69, '268.69', 269.30, 2.81, 1.05, 962, 259069980, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1226, 'Au99.95', '2017-12-13 00:00:00', 266.65, 266.77, 267.05, '266.7', 266.93, -0.34, -0.13, 3810, 1017848460, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1227, 'Au99.95', '2017-12-12 00:00:00', 266.86, 267.11, 267.20, '266.9', 267.06, -0.94, -0.35, 1138, 303922460, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1228, 'Au99.95', '2017-12-11 00:00:00', 267.30, 268.05, 268.05, '267.48', 267.63, 0.57, 0.21, 1540, 412128220, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1229, 'Au99.95', '2017-12-08 00:00:00', 267.40, 267.48, 267.70, '267.7', 267.49, -1.72, -0.64, 1600, 427994720, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1230, 'Au99.95', '2017-12-07 00:00:00', 268.90, 269.20, 270.70, '270.7', 269.63, -2.02, -0.74, 1690, 455682680, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1231, 'Au99.95', '2017-12-06 00:00:00', 270.70, 271.22, 271.24, '271', 270.99, -1.39, -0.51, 992, 268826340, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1232, 'Au99.95', '2017-12-05 00:00:00', 272.55, 272.61, 272.75, '272.7', 272.63, 0.24, 0.09, 1916, 526240660, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1233, 'Au99.95', '2017-12-04 00:00:00', 272.20, 272.37, 272.45, '272.4', 272.30, -0.30, -0.11, 752, 204771280, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1234, 'Au99.95', '2017-12-01 00:00:00', 272.55, 272.67, 273.10, '273', 272.84, -1.46, -0.53, 1634, 445823680, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1235, 'Au99.95', '2017-11-30 00:00:00', 274.05, 274.13, 274.65, '274.65', 274.46, -1.48, -0.54, 2394, 659270700, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1236, 'Au99.95', '2017-11-29 00:00:00', 275.52, 275.61, 276.15, '275.98', 275.95, -0.06, -0.02, 2998, 827304820, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1237, 'Au99.95', '2017-11-28 00:00:00', 275.55, 275.67, 276.50, '276.5', 275.94, 0.47, 0.17, 1694, 467442640, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1238, 'Au99.95', '2017-11-27 00:00:00', 274.65, 275.20, 275.20, '274.65', 274.99, 0.05, 0.02, 2798, 769413640, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1239, 'Au99.95', '2017-11-24 00:00:00', 274.70, 275.15, 275.20, '274.7', 274.99, 0.16, 0.06, 1750, 483390840, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1240, 'Au99.95', '2017-11-23 00:00:00', 274.70, 274.99, 275.05, '275', 274.86, 0.36, 0.13, 3212, 884607280, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1241, 'Au99.95', '2017-11-22 00:00:00', 274.50, 274.63, 274.90, '274.7', 274.64, -0.11, -0.04, 1650, 456317560, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1242, 'Au99.95', '2017-11-21 00:00:00', 274.50, 274.74, 275.00, '275', 274.72, -1.61, -0.58, 2570, 708177320, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1243, 'Au99.95', '2017-11-20 00:00:00', 275.10, 276.35, 276.40, '275.1', 276.30, 1.49, 0.54, 1440, 397791800, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1244, 'Au99.95', '2017-11-17 00:00:00', 274.20, 274.86, 275.00, '274.2', 274.90, 0.86, 0.31, 1128, 310088040, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1245, 'Au99.95', '2017-11-16 00:00:00', 274.00, 274.00, 274.50, '274.5', 274.23, -1.05, -0.38, 2062, 565839580, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1246, 'Au99.95', '2017-11-15 00:00:00', 274.00, 275.05, 275.20, '274', 274.89, 0.60, 0.22, 1452, 400275020, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1247, 'Au99.95', '2017-11-14 00:00:00', 274.40, 274.45, 274.60, '274.6', 274.50, -0.28, -0.10, 2610, 713918900, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1248, 'Au99.95', '2017-11-13 00:00:00', 274.60, 274.73, 276.20, '276.2', 274.72, -1.18, -0.43, 2678, 735670560, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1249, 'Au99.95', '2017-11-10 00:00:00', 275.80, 275.91, 276.25, '276', 276.08, 0.57, 0.21, 1044, 288230800, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1250, 'Au99.95', '2017-11-09 00:00:00', 274.80, 275.34, 275.40, '274.85', 275.07, 0.83, 0.30, 1378, 378452500, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1251, 'Au99.95', '2017-11-08 00:00:00', 274.30, 274.51, 274.55, '274.3', 274.40, 0.29, 0.11, 940, 257936240, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1252, 'Au99.95', '2017-11-07 00:00:00', 273.20, 274.22, 274.30, '273.2', 274.16, 1.28, 0.47, 588, 161209780, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1253, 'Au99.95', '2017-11-06 00:00:00', 272.80, 272.94, 273.00, '272.8', 272.93, -0.36, -0.13, 1502, 410229920, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1254, 'Au99.95', '2017-11-03 00:00:00', 273.20, 273.30, 273.60, '273.49', 273.47, 0.20, 0.07, 2896, 790541020, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1255, 'Au99.95', '2017-11-02 00:00:00', 273.04, 273.10, 273.15, '273.15', 273.09, -0.05, -0.02, 2152, 588032360, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1256, 'Au99.95', '2017-11-01 00:00:00', 272.50, 273.15, 273.15, '272.6', 272.75, -0.58, -0.21, 1218, 332769860, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1257, 'Au99.95', '2017-10-31 00:00:00', 273.65, 273.73, 273.94, '273.7', 273.71, 0.68, 0.25, 1410, 387659100, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1258, 'Au99.95', '2017-10-30 00:00:00', 273.00, 273.05, 273.30, '273.2', 273.19, 0.28, 0.10, 1414, 387094000, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1259, 'Au99.95', '2017-10-27 00:00:00', 272.75, 272.77, 273.28, '273.1', 273.04, -1.79, -0.65, 1484, 407208620, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1260, 'Au99.95', '2017-10-26 00:00:00', 274.00, 274.56, 274.60, '274', 274.45, 1.11, 0.41, 3866, 1065479500, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1261, 'Au99.95', '2017-10-25 00:00:00', 273.40, 273.45, 274.57, '274.57', 273.64, -1.12, -0.41, 1590, 440812700, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1262, 'Au99.95', '2017-10-24 00:00:00', 274.50, 274.57, 275.00, '274.6', 274.77, 0.78, 0.28, 2416, 665735380, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1263, 'Au99.95', '2017-10-23 00:00:00', 273.60, 273.79, 274.20, '274.1', 273.96, -1.21, -0.44, 2136, 592425640, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1264, 'Au99.95', '2017-10-20 00:00:00', 274.85, 275.00, 275.40, '275.4', 274.98, 0.40, 0.15, 1312, 361043300, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1265, 'Au99.95', '2017-10-19 00:00:00', 274.10, 274.60, 274.75, '274.75', 274.50, -0.70, -0.25, 1790, 495166460, '2023-06-29 10:38:07', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1266, 'Au99.95', '2017-10-18 00:00:00', 275.00, 275.30, 276.75, '276.36', 275.48, -1.02, -0.37, 1464, 402649220, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1267, 'Au99.95', '2017-10-17 00:00:00', 276.00, 276.32, 278.08, '278.08', 276.24, -1.18, -0.43, 638, 176241160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1268, 'Au99.95', '2017-10-16 00:00:00', 276.70, 277.50, 278.00, '276.8', 277.17, 1.20, 0.43, 758, 210098200, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1269, 'Au99.95', '2017-10-13 00:00:00', 275.80, 276.30, 276.49, '276.48', 276.14, 0.17, 0.06, 1300, 359117080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1270, 'Au99.95', '2017-10-12 00:00:00', 275.39, 276.13, 276.80, '275.39', 276.26, 1.13, 0.41, 2590, 710639280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1271, 'Au99.95', '2017-10-11 00:00:00', 275.00, 275.00, 276.30, '276.3', 275.19, -0.55, -0.20, 1374, 377419560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1272, 'Au99.95', '2017-10-10 00:00:00', 275.20, 275.55, 276.49, '276.49', 275.81, 0.11, 0.04, 1648, 454546840, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1273, 'Au99.95', '2017-10-09 00:00:00', 275.30, 275.44, 276.98, '276.98', 276.13, -2.18, -0.79, 1952, 539021660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1274, 'Au99.95', '2017-09-29 00:00:00', 275.29, 277.62, 277.68, '275.29', 277.39, 1.14, 0.41, 1384, 383915380, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1275, 'Au99.95', '2017-09-28 00:00:00', 275.31, 276.48, 278.56, '278.56', 276.32, -1.25, -0.45, 1158, 319967820, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1276, 'Au99.95', '2017-09-27 00:00:00', 277.65, 277.73, 278.35, '278.35', 278.17, -2.47, -0.88, 3076, 851125620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1277, 'Au99.95', '2017-09-26 00:00:00', 277.10, 280.20, 282.25, '277.1', 280.18, 3.97, 1.44, 1068, 299237140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1278, 'Au99.95', '2017-09-25 00:00:00', 275.90, 276.23, 277.50, '277.5', 276.12, -0.62, -0.22, 2416, 667310420, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1279, 'Au99.95', '2017-09-22 00:00:00', 274.51, 276.85, 279.30, '276', 275.94, 0.80, 0.29, 3394, 944135740, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1280, 'Au99.95', '2017-09-21 00:00:00', 275.90, 276.05, 279.20, '279.2', 276.91, -2.61, -0.94, 1520, 420909260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1281, 'Au99.95', '2017-09-20 00:00:00', 278.40, 278.66, 278.79, '278.79', 278.59, 0.20, 0.07, 1266, 352691580, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1282, 'Au99.95', '2017-09-19 00:00:00', 278.10, 278.46, 279.40, '278.4', 278.42, -0.10, -0.04, 1582, 440468920, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1283, 'Au99.95', '2017-09-18 00:00:00', 278.50, 278.56, 279.50, '279.5', 278.80, -2.15, -0.77, 1790, 502141040, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1284, 'Au99.95', '2017-09-15 00:00:00', 280.00, 280.71, 281.15, '280', 280.97, 1.22, 0.44, 1328, 373167300, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1285, 'Au99.95', '2017-09-14 00:00:00', 279.20, 279.49, 280.77, '280.77', 279.46, -0.85, -0.30, 3128, 877965240, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1286, 'Au99.95', '2017-09-13 00:00:00', 280.10, 280.34, 280.45, '280.39', 280.29, 0.86, 0.31, 1758, 492738320, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1287, 'Au99.95', '2017-09-12 00:00:00', 279.40, 279.48, 281.60, '281.6', 280.00, -1.45, -0.52, 832, 232963020, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1288, 'Au99.95', '2017-09-11 00:00:00', 280.79, 280.93, 281.17, '281', 280.87, -0.43, -0.15, 3776, 1073638440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1289, 'Au99.95', '2017-09-08 00:00:00', 281.30, 281.36, 282.00, '281.8', 281.68, 0.07, 0.02, 4724, 1355974220, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1290, 'Au99.95', '2017-09-07 00:00:00', 280.80, 281.29, 281.45, '281.15', 281.19, -0.63, -0.22, 914, 257010660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1291, 'Au99.95', '2017-09-06 00:00:00', 281.60, 281.92, 282.25, '281.86', 281.95, 0.52, 0.18, 908, 256013480, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1292, 'Au99.95', '2017-09-05 00:00:00', 281.30, 281.40, 281.70, '281.46', 281.54, -0.64, -0.23, 1014, 285482980, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1293, 'Au99.95', '2017-09-04 00:00:00', 281.35, 282.04, 282.10, '282', 281.76, 2.19, 0.78, 1080, 304301660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1294, 'Au99.95', '2017-09-01 00:00:00', 279.50, 279.85, 280.20, '280.19', 280.05, 2.19, 0.79, 7302, 2059862800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1295, 'Au99.95', '2017-08-31 00:00:00', 277.30, 277.66, 277.90, '277.8', 277.61, -0.34, -0.12, 4812, 1356620880, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1296, 'Au99.95', '2017-08-30 00:00:00', 277.95, 278.00, 281.99, '281.99', 278.99, -2.50, -0.89, 4864, 1377292940, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1297, 'Au99.95', '2017-08-29 00:00:00', 279.00, 280.50, 281.50, '279', 280.96, 2.35, 0.84, 3230, 918319420, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1298, 'Au99.95', '2017-08-28 00:00:00', 277.20, 278.15, 278.20, '277.2', 277.71, 1.24, 0.45, 5266, 1476999660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1299, 'Au99.95', '2017-08-25 00:00:00', 276.60, 276.91, 276.98, '276.6', 276.80, -0.11, -0.04, 8008, 2294971880, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1300, 'Au99.95', '2017-08-24 00:00:00', 276.88, 277.02, 277.36, '277', 277.15, 0.05, 0.02, 6800, 1944215380, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1301, 'Au99.95', '2017-08-23 00:00:00', 276.25, 276.97, 277.05, '276.45', 276.65, 0.72, 0.26, 5322, 1497301880, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1302, 'Au99.95', '2017-08-22 00:00:00', 276.20, 276.25, 277.30, '277.2', 276.71, -1.24, -0.45, 7248, 2051788640, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1303, 'Au99.95', '2017-08-21 00:00:00', 276.50, 277.49, 279.00, '279', 277.14, -0.55, -0.20, 940, 260458940, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1304, 'Au99.95', '2017-08-18 00:00:00', 277.00, 278.04, 278.50, '277', 277.27, 0.88, 0.32, 10288, 2956738740, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1305, 'Au99.95', '2017-08-17 00:00:00', 274.30, 277.16, 277.35, '274.3', 277.09, 2.91, 1.06, 4640, 1319350760, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1306, 'Au99.95', '2017-08-16 00:00:00', 274.20, 274.25, 274.80, '274.5', 274.56, -0.58, -0.21, 3630, 1000070020, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1307, 'Au99.95', '2017-08-15 00:00:00', 274.50, 274.83, 276.30, '276.3', 274.77, -1.81, -0.65, 6010, 1754085280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1308, 'Au99.95', '2017-08-14 00:00:00', 276.60, 276.64, 277.30, '277.3', 276.78, -0.06, -0.02, 1486, 413868080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1309, 'Au99.95', '2017-08-11 00:00:00', 276.42, 276.70, 277.20, '276.98', 276.92, 1.68, 0.61, 9000, 2567910140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1310, 'Au99.95', '2017-08-10 00:00:00', 274.70, 275.02, 275.75, '275.25', 275.30, 1.09, 0.40, 3894, 1075039540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1311, 'Au99.95', '2017-08-09 00:00:00', 273.50, 273.93, 274.00, '273.7', 273.72, 0.88, 0.32, 1250, 341787000, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1312, 'Au99.95', '2017-08-08 00:00:00', 272.70, 273.05, 273.79, '273.49', 272.91, 0.01, 0.00, 2822, 775947760, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1313, 'Au99.95', '2017-08-07 00:00:00', 273.00, 273.04, 274.80, '274.8', 273.27, -2.41, -0.87, 3148, 863960540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1314, 'Au99.95', '2017-08-04 00:00:00', 274.70, 275.45, 275.50, '274.7', 275.10, 1.63, 0.60, 2848, 802954580, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1315, 'Au99.95', '2017-08-03 00:00:00', 273.70, 273.82, 275.80, '275.8', 274.71, -1.09, -0.40, 3142, 871846980, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1316, 'Au99.95', '2017-08-02 00:00:00', 274.79, 274.91, 275.70, '275.5', 274.98, -0.29, -0.11, 3482, 957862020, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1317, 'Au99.95', '2017-08-01 00:00:00', 275.00, 275.20, 275.50, '275', 275.34, 0.27, 0.10, 3010, 846840540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1318, 'Au99.95', '2017-07-31 00:00:00', 270.50, 274.93, 275.70, '275', 275.42, 0.82, 0.30, 1758, 483685740, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1319, 'Au99.95', '2017-07-28 00:00:00', 274.00, 274.11, 274.90, '274.9', 274.55, -0.41, -0.15, 2366, 627224740, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1320, 'Au99.95', '2017-07-27 00:00:00', 272.20, 274.52, 275.14, '272.2', 274.77, 2.68, 0.99, 986, 273934840, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1321, 'Au99.95', '2017-07-26 00:00:00', 271.50, 271.84, 272.60, '272.6', 271.81, -2.16, -0.79, 528, 143517160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1322, 'Au99.95', '2017-07-25 00:00:00', 273.50, 274.00, 274.10, '273.6', 273.81, 0.80, 0.29, 1140, 312143000, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1323, 'Au99.95', '2017-07-24 00:00:00', 273.20, 273.20, 274.30, '273.35', 274.09, 0.21, 0.08, 3338, 913624980, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1324, 'Au99.95', '2017-07-21 00:00:00', 271.40, 272.99, 274.55, '271.45', 272.40, 1.76, 0.65, 4640, 1284573260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1325, 'Au99.95', '2017-07-20 00:00:00', 271.20, 271.23, 271.50, '271.5', 271.29, -0.08, -0.03, 6198, 1722061040, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1326, 'Au99.95', '2017-07-19 00:00:00', 271.15, 271.31, 271.48, '271.45', 271.31, 0.68, 0.25, 4282, 1193391880, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1327, 'Au99.95', '2017-07-18 00:00:00', 270.15, 270.63, 271.45, '270.15', 270.95, 0.51, 0.19, 7656, 2175292900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1328, 'Au99.95', '2017-07-17 00:00:00', 268.60, 270.12, 270.39, '268.6', 270.10, 2.33, 0.87, 3390, 923188200, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1329, 'Au99.95', '2017-07-14 00:00:00', 267.50, 267.79, 269.30, '269.3', 267.80, -0.99, -0.37, 20140, 5688569880, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1330, 'Au99.95', '2017-07-13 00:00:00', 267.90, 268.78, 269.19, '268', 268.73, 0.56, 0.21, 6148, 1747978580, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1331, 'Au99.95', '2017-07-12 00:00:00', 267.40, 268.22, 268.65, '267.4', 268.42, 0.91, 0.34, 5970, 1596042620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1332, 'Au99.95', '2017-07-11 00:00:00', 267.00, 267.31, 267.45, '267.3', 267.24, 1.51, 0.57, 3250, 868496740, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1333, 'Au99.95', '2017-07-10 00:00:00', 265.60, 265.80, 270.00, '270', 266.96, -3.94, -1.46, 1244, 332902300, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1334, 'Au99.95', '2017-07-07 00:00:00', 260.00, 269.74, 270.30, '260', 269.18, -0.33, -0.12, 4638, 1254279580, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1335, 'Au99.95', '2017-07-06 00:00:00', 269.00, 270.07, 270.40, '269', 270.11, 0.09, 0.03, 4036, 1089107140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1336, 'Au99.95', '2017-07-05 00:00:00', 268.83, 269.98, 270.69, '270.3', 270.09, -0.26, -0.10, 2632, 711116720, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1337, 'Au99.95', '2017-07-04 00:00:00', 269.15, 270.24, 270.80, '270.8', 269.73, -1.70, -0.63, 1072, 290124780, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1338, 'Au99.95', '2017-07-03 00:00:00', 271.70, 271.94, 272.15, '272.1', 271.95, -1.12, -0.41, 894, 243641660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1339, 'Au99.95', '2017-06-30 00:00:00', 272.70, 273.06, 273.60, '273.5', 273.15, -1.85, -0.67, 3048, 875735540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1340, 'Au99.95', '2017-06-29 00:00:00', 274.80, 274.91, 275.75, '275.75', 275.36, -1.19, -0.43, 6734, 1885095060, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1341, 'Au99.95', '2017-06-28 00:00:00', 276.10, 276.10, 276.80, '276.8', 276.24, -0.46, -0.17, 5802, 1631750620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1342, 'Au99.95', '2017-06-27 00:00:00', 275.40, 276.56, 276.64, '275.4', 276.05, -1.43, -0.51, 7880, 2202989080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1343, 'Au99.95', '2017-06-26 00:00:00', 277.80, 277.99, 278.10, '278', 278.06, 0.19, 0.07, 2146, 596990300, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1344, 'Au99.95', '2017-06-23 00:00:00', 277.30, 277.80, 277.90, '277.9', 277.63, 0.45, 0.16, 3516, 964979780, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1345, 'Au99.95', '2017-06-22 00:00:00', 275.40, 277.35, 277.45, '275.88', 277.06, 1.68, 0.61, 2708, 747276320, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1346, 'Au99.95', '2017-06-21 00:00:00', 275.40, 275.67, 276.35, '276.3', 275.66, -0.07, -0.03, 5230, 1442938100, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1347, 'Au99.95', '2017-06-20 00:00:00', 275.50, 275.74, 276.50, '276.5', 275.67, -0.49, -0.18, 2388, 659185700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1348, 'Au99.95', '2017-06-19 00:00:00', 276.10, 276.23, 276.40, '276.35', 276.27, -0.62, -0.22, 2278, 630688840, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1349, 'Au99.95', '2017-06-16 00:00:00', 276.15, 276.85, 277.49, '276.8', 276.49, -0.50, -0.18, 9066, 2520865200, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1350, 'Au99.95', '2017-06-15 00:00:00', 277.20, 277.35, 281.65, '280.6', 277.94, -1.80, -0.64, 4456, 1237114900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1351, 'Au99.95', '2017-06-14 00:00:00', 278.05, 279.15, 279.49, '278.3', 278.92, 0.93, 0.33, 8076, 2242075880, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1352, 'Au99.95', '2017-06-13 00:00:00', 278.20, 278.22, 278.70, '278.45', 278.42, -0.23, -0.08, 5332, 1473246140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1353, 'Au99.95', '2017-06-12 00:00:00', 278.41, 278.45, 278.80, '278.8', 278.68, -1.51, -0.54, 1934, 544883180, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1354, 'Au99.95', '2017-06-09 00:00:00', 279.70, 279.96, 281.24, '281.24', 280.33, -2.70, -0.96, 1300, 364434800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1355, 'Au99.95', '2017-06-08 00:00:00', 282.60, 282.66, 283.80, '283.67', 282.91, -0.91, -0.32, 15986, 4529347760, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1356, 'Au99.95', '2017-06-07 00:00:00', 283.28, 283.57, 284.10, '283.78', 283.64, 0.18, 0.06, 8484, 2405328540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1357, 'Au99.95', '2017-06-06 00:00:00', 282.00, 283.39, 283.40, '282.71', 283.10, 2.04, 0.73, 6346, 1774545500, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1358, 'Au99.95', '2017-06-05 00:00:00', 279.00, 281.35, 282.00, '279', 281.55, 3.38, 1.22, 2726, 767516160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1359, 'Au99.95', '2017-06-02 00:00:00', 277.70, 277.97, 279.25, '279.25', 278.20, -0.92, -0.33, 6670, 1844522700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1360, 'Au99.95', '2017-06-01 00:00:00', 278.65, 278.89, 279.60, '279', 278.87, 0.14, 0.05, 5650, 1489292220, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1361, 'Au99.95', '2017-05-31 00:00:00', 278.65, 278.75, 279.97, '279.9', 279.66, -1.60, -0.57, 1398, 390964780, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1362, 'Au99.95', '2017-05-26 00:00:00', 279.00, 280.35, 280.50, '279.2', 279.54, 0.56, 0.20, 24488, 6545958360, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1363, 'Au99.95', '2017-05-25 00:00:00', 279.28, 279.79, 280.30, '279.29', 279.53, 1.39, 0.50, 17836, 4785061260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1364, 'Au99.95', '2017-05-24 00:00:00', 278.35, 278.40, 279.41, '279.41', 278.57, -2.77, -0.99, 11378, 3100622820, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1365, 'Au99.95', '2017-05-23 00:00:00', 280.00, 281.17, 281.45, '280.2', 280.68, 1.49, 0.53, 10600, 2886643100, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1366, 'Au99.95', '2017-05-22 00:00:00', 279.50, 279.68, 279.70, '279.68', 279.60, 1.08, 0.39, 2114, 589169800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1367, 'Au99.95', '2017-05-19 00:00:00', 278.60, 278.60, 280.00, '280', 279.15, -0.70, -0.25, 7972, 2168338320, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1368, 'Au99.95', '2017-05-18 00:00:00', 278.60, 279.30, 280.95, '278.6', 279.95, 1.69, 0.61, 7010, 1936190340, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1369, 'Au99.95', '2017-05-17 00:00:00', 275.66, 277.61, 277.65, '275.66', 277.48, 1.07, 0.39, 9822, 2682343580, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1370, 'Au99.95', '2017-05-16 00:00:00', 276.07, 276.54, 276.90, '276.49', 276.37, 0.64, 0.23, 8498, 2334431280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1371, 'Au99.95', '2017-05-15 00:00:00', 274.70, 275.90, 276.00, '275.2', 275.50, 0.98, 0.36, 2622, 722737380, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1372, 'Au99.95', '2017-05-12 00:00:00', 274.68, 274.92, 275.20, '274.9', 274.89, 1.06, 0.39, 2720, 745793220, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1373, 'Au99.95', '2017-05-11 00:00:00', 273.60, 273.86, 274.70, '274.7', 273.85, 0.18, 0.07, 1528, 415800180, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1374, 'Au99.95', '2017-05-10 00:00:00', 264.00, 273.68, 273.97, '273.97', 273.07, -1.07, -0.39, 4018, 1112284040, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1375, 'Au99.95', '2017-05-09 00:00:00', 272.65, 274.75, 276.50, '276.5', 275.00, -0.54, -0.20, 1100, 302504640, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1376, 'Au99.95', '2017-05-08 00:00:00', 275.00, 275.29, 276.10, '276.1', 275.24, -0.20, -0.07, 742, 204265800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1377, 'Au99.95', '2017-05-05 00:00:00', 274.40, 275.49, 275.75, '275', 275.09, -0.41, -0.15, 412, 113340700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1378, 'Au99.95', '2017-05-04 00:00:00', 275.80, 275.90, 279.47, '279.47', 277.19, -4.21, -1.50, 746, 207034520, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1379, 'Au99.95', '2017-05-03 00:00:00', 279.80, 280.11, 280.30, '280.3', 280.05, -0.67, -0.24, 882, 247012400, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1380, 'Au99.95', '2017-05-02 00:00:00', 280.75, 280.78, 281.50, '281.5', 281.05, -2.12, -0.75, 924, 259692440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1381, 'Au99.95', '2017-04-28 00:00:00', 282.40, 282.90, 282.90, '282.55', 282.63, 0.55, 0.20, 292, 82528500, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1382, 'Au99.95', '2017-04-27 00:00:00', 282.35, 282.35, 282.95, '282.4', 282.70, 0.55, 0.20, 902, 254913280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1383, 'Au99.95', '2017-04-26 00:00:00', 281.80, 281.80, 282.55, '282.2', 282.34, -1.52, -0.54, 1446, 408396160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1384, 'Au99.95', '2017-04-25 00:00:00', 282.60, 283.32, 283.75, '283.1', 283.43, 0.03, 0.01, 580, 164393780, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1385, 'Au99.95', '2017-04-24 00:00:00', 283.00, 283.29, 286.60, '286.6', 283.99, -1.94, -0.68, 1360, 386746740, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1386, 'Au99.95', '2017-04-21 00:00:00', 285.00, 285.23, 285.80, '285.8', 285.14, -0.24, -0.08, 1206, 344091580, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1387, 'Au99.95', '2017-04-20 00:00:00', 285.00, 285.47, 285.50, '285.5', 285.31, -0.18, -0.06, 1246, 355506720, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1388, 'Au99.95', '2017-04-19 00:00:00', 285.00, 285.65, 286.15, '285.5', 285.90, -0.19, -0.07, 1860, 531782500, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1389, 'Au99.95', '2017-04-18 00:00:00', 285.60, 285.84, 286.00, '285.86', 285.85, -0.77, -0.27, 2156, 616309860, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1390, 'Au99.95', '2017-04-17 00:00:00', 286.35, 286.61, 287.60, '287.6', 286.85, 0.17, 0.06, 1106, 317306060, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1391, 'Au99.95', '2017-04-14 00:00:00', 286.20, 286.44, 286.85, '286.5', 286.61, 0.19, 0.07, 476, 136427100, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1392, 'Au99.95', '2017-04-13 00:00:00', 284.80, 286.25, 286.60, '285.2', 286.14, 1.72, 0.61, 2144, 610803600, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1393, 'Au99.95', '2017-04-12 00:00:00', 283.80, 284.53, 285.50, '283.8', 284.68, 3.03, 1.08, 1330, 378626260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1394, 'Au99.95', '2017-04-11 00:00:00', 280.90, 281.50, 281.75, '281.2', 281.28, 0.23, 0.08, 1002, 281844720, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1395, 'Au99.95', '2017-04-10 00:00:00', 280.70, 281.27, 284.00, '284', 281.17, -1.60, -0.57, 942, 264870100, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1396, 'Au99.95', '2017-04-07 00:00:00', 280.50, 282.87, 284.00, '280.5', 282.92, 2.55, 0.91, 956, 270474440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1397, 'Au99.95', '2017-04-06 00:00:00', 279.50, 280.32, 280.50, '280', 280.27, 0.19, 0.07, 1260, 353144260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1398, 'Au99.95', '2017-04-05 00:00:00', 279.90, 280.13, 280.25, '280', 280.08, 2.26, 0.81, 1218, 341148700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1399, 'Au99.95', '2017-03-31 00:00:00', 277.80, 277.87, 278.00, '277.85', 277.89, -1.23, -0.44, 214, 59469000, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1400, 'Au99.95', '2017-03-30 00:00:00', 279.10, 279.10, 280.00, '280', 279.49, -0.53, -0.19, 482, 134714840, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1401, 'Au99.95', '2017-03-29 00:00:00', 279.32, 279.63, 279.70, '279.32', 279.50, -0.56, -0.20, 1010, 282299280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1402, 'Au99.95', '2017-03-28 00:00:00', 280.00, 280.19, 281.10, '281.1', 280.38, -0.31, -0.11, 1250, 350480720, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1403, 'Au99.95', '2017-03-27 00:00:00', 278.00, 280.50, 280.76, '278', 280.07, 2.69, 0.97, 4154, 1163443440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1404, 'Au99.95', '2017-03-24 00:00:00', 277.60, 277.81, 279.20, '279', 277.83, -0.45, -0.16, 812, 225603480, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1405, 'Au99.95', '2017-03-23 00:00:00', 277.90, 278.26, 278.50, '278.5', 278.14, -0.34, -0.12, 754, 209719560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1406, 'Au99.95', '2017-03-22 00:00:00', 277.00, 278.60, 278.60, '277', 278.21, 2.78, 1.01, 1338, 372245780, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1407, 'Au99.95', '2017-03-21 00:00:00', 275.50, 275.82, 277.30, '277', 275.92, -1.11, -0.40, 808, 222951340, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1408, 'Au99.95', '2017-03-20 00:00:00', 276.40, 276.93, 277.05, '276.4', 276.88, 1.37, 0.50, 854, 236457040, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1409, 'Au99.95', '2017-03-17 00:00:00', 275.00, 275.56, 275.70, '275.6', 275.54, -0.14, -0.05, 1394, 383907700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1410, 'Au99.95', '2017-03-16 00:00:00', 274.90, 275.70, 276.00, '274.9', 275.62, 4.23, 1.56, 824, 222633840, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1411, 'Au99.95', '2017-03-15 00:00:00', 271.03, 271.47, 271.50, '271.3', 271.32, 0.17, 0.06, 984, 266985140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1412, 'Au99.95', '2017-03-14 00:00:00', 271.10, 271.30, 272.70, '272.7', 271.47, -1.68, -0.62, 2296, 620694560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1413, 'Au99.95', '2017-03-13 00:00:00', 271.50, 272.98, 275.00, '271.6', 271.84, 2.94, 1.09, 2264, 609694100, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1414, 'Au99.95', '2017-03-10 00:00:00', 270.00, 270.04, 273.00, '273', 270.36, -1.58, -0.58, 796, 215207340, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1415, 'Au99.95', '2017-03-09 00:00:00', 271.50, 271.62, 273.50, '273.5', 272.32, -2.08, -0.76, 542, 147602020, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1416, 'Au99.95', '2017-03-08 00:00:00', 273.70, 273.70, 274.15, '274.15', 273.89, -1.57, -0.57, 596, 163244020, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1417, 'Au99.95', '2017-03-07 00:00:00', 275.20, 275.27, 276.80, '276.8', 275.69, -1.14, -0.41, 754, 207877620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1418, 'Au99.95', '2017-03-06 00:00:00', 275.80, 276.41, 276.80, '275.8', 276.51, 0.49, 0.18, 1256, 347308080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1419, 'Au99.95', '2017-03-03 00:00:00', 275.80, 275.92, 277.30, '277.3', 276.01, -2.14, -0.77, 1078, 297545560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1420, 'Au99.95', '2017-03-02 00:00:00', 278.00, 278.06, 278.60, '278.2', 278.17, 0.38, 0.14, 426, 118501640, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1421, 'Au99.95', '2017-03-01 00:00:00', 277.60, 277.68, 278.25, '278', 277.90, -2.04, -0.73, 410, 113939160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1422, 'Au99.95', '2017-02-28 00:00:00', 279.40, 279.72, 280.50, '280.5', 279.54, -0.61, -0.22, 558, 155988560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1423, 'Au99.95', '2017-02-27 00:00:00', 279.80, 280.33, 280.60, '280.2', 280.36, 0.75, 0.27, 1394, 390446140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1424, 'Au99.95', '2017-02-24 00:00:00', 276.49, 279.58, 279.62, '276.49', 278.93, 3.59, 1.30, 2642, 731699720, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1425, 'Au99.95', '2017-02-23 00:00:00', 275.85, 275.99, 276.15, '276', 275.98, 0.45, 0.16, 748, 206435260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1426, 'Au99.95', '2017-02-22 00:00:00', 275.37, 275.54, 276.00, '275.5', 275.51, 0.05, 0.02, 2702, 744442220, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1427, 'Au99.95', '2017-02-21 00:00:00', 275.00, 275.49, 275.64, '275.1', 275.28, 0.21, 0.08, 1440, 396409920, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1428, 'Au99.95', '2017-02-20 00:00:00', 274.80, 275.28, 277.00, '277', 275.18, -0.62, -0.23, 688, 189330620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1429, 'Au99.95', '2017-02-17 00:00:00', 275.20, 275.90, 275.93, '275.2', 275.74, 1.23, 0.45, 1906, 525577440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1430, 'Au99.95', '2017-02-16 00:00:00', 273.50, 274.67, 275.20, '273.5', 274.79, 1.72, 0.63, 1716, 471710060, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1431, 'Au99.95', '2017-02-15 00:00:00', 272.90, 272.95, 274.50, '274.5', 273.33, -0.41, -0.15, 808, 220854420, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1432, 'Au99.95', '2017-02-14 00:00:00', 273.30, 273.36, 274.20, '273.46', 273.92, -1.03, -0.38, 898, 245981180, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1433, 'Au99.95', '2017-02-13 00:00:00', 274.00, 274.39, 274.68, '274.6', 274.47, 1.51, 0.55, 852, 233854260, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1434, 'Au99.95', '2017-02-10 00:00:00', 272.60, 272.88, 273.35, '273', 273.21, -3.20, -1.16, 2714, 741506980, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1435, 'Au99.95', '2017-02-09 00:00:00', 275.80, 276.08, 277.30, '277', 276.13, 1.78, 0.65, 2366, 653342900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1436, 'Au99.95', '2017-02-08 00:00:00', 274.30, 274.30, 275.30, '274.5', 274.84, 0.00, 0.00, 1144, 314423540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1437, 'Au99.95', '2017-02-07 00:00:00', 272.60, 274.30, 274.40, '272.6', 273.71, 2.46, 0.91, 836, 228829400, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1438, 'Au99.95', '2017-02-06 00:00:00', 268.99, 271.84, 272.20, '268.99', 271.77, 2.64, 0.98, 1318, 358193680, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1439, 'Au99.95', '2017-02-03 00:00:00', 269.20, 269.20, 270.50, '269.88', 269.55, 2.99, 1.12, 1522, 410257940, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1440, 'Au99.95', '2017-01-26 00:00:00', 266.00, 266.21, 266.50, '266.5', 266.09, -1.54, -0.58, 250, 66523800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1441, 'Au99.95', '2017-01-25 00:00:00', 267.45, 267.75, 268.50, '268.5', 267.69, -1.95, -0.72, 460, 123137900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1442, 'Au99.95', '2017-01-24 00:00:00', 269.70, 269.70, 270.30, '270.3', 269.94, -0.36, -0.13, 1038, 280202920, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1443, 'Au99.95', '2017-01-23 00:00:00', 270.00, 270.06, 270.85, '270.5', 270.56, 0.98, 0.36, 3582, 962623380, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1444, 'Au99.95', '2017-01-20 00:00:00', 268.30, 269.08, 269.80, '268.6', 268.98, 0.97, 0.36, 1464, 383657440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1445, 'Au99.95', '2017-01-19 00:00:00', 268.00, 268.11, 269.02, '269.02', 268.47, -2.79, -1.03, 988, 253579900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1446, 'Au99.95', '2017-01-18 00:00:00', 270.65, 270.90, 272.39, '272.39', 271.47, -1.10, -0.40, 1194, 324046620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1447, 'Au99.95', '2017-01-17 00:00:00', 270.50, 272.00, 272.39, '270.5', 271.49, 1.50, 0.56, 1140, 309508560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1448, 'Au99.95', '2017-01-16 00:00:00', 269.00, 270.50, 270.60, '269.15', 269.61, 1.77, 0.66, 2662, 717707120, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1449, 'Au99.95', '2017-01-13 00:00:00', 265.40, 268.73, 270.00, '269.99', 268.61, -0.65, -0.24, 2090, 561412560, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1450, 'Au99.95', '2017-01-12 00:00:00', 269.10, 269.38, 269.50, '269.2', 269.25, 0.74, 0.28, 1318, 343669040, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1451, 'Au99.95', '2017-01-11 00:00:00', 268.48, 268.64, 268.95, '268.8', 268.73, 0.40, 0.15, 1304, 350427380, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1452, 'Au99.95', '2017-01-10 00:00:00', 266.76, 268.24, 268.40, '266.8', 267.90, 2.74, 1.03, 4418, 1139634380, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1453, 'Au99.95', '2017-01-09 00:00:00', 265.10, 265.50, 265.50, '265.15', 265.36, 0.50, 0.19, 3046, 808307200, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1454, 'Au99.95', '2017-01-06 00:00:00', 264.50, 265.00, 265.45, '264.8', 265.05, 0.34, 0.13, 1838, 487168500, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1455, 'Au99.95', '2017-01-05 00:00:00', 264.55, 264.66, 265.30, '265.3', 264.75, 0.13, 0.05, 1168, 309239020, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1456, 'Au99.95', '2017-01-04 00:00:00', 264.10, 264.53, 264.85, '264.5', 264.59, 0.45, 0.17, 960, 254011960, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1457, 'Au99.95', '2017-01-03 00:00:00', 264.00, 264.08, 264.50, '264', 264.19, -0.42, -0.16, 1208, 319144340, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1458, 'Au99.95', '2016-12-30 00:00:00', 264.00, 264.50, 265.38, '265.38', 264.43, 1.77, 0.67, 1144, 302508760, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1459, 'Au99.95', '2016-12-29 00:00:00', 262.10, 262.73, 262.85, '262.38', 262.36, 1.19, 0.46, 2220, 582457080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1460, 'Au99.95', '2016-12-28 00:00:00', 261.50, 261.54, 262.16, '261.6', 261.90, 0.32, 0.12, 1260, 329997960, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1461, 'Au99.95', '2016-12-27 00:00:00', 260.65, 261.22, 261.30, '261.1', 260.97, 0.37, 0.14, 1908, 497943940, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1462, 'Au99.95', '2016-12-26 00:00:00', 259.90, 260.85, 260.90, '259.9', 260.08, 0.87, 0.34, 2434, 633053680, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1463, 'Au99.95', '2016-12-23 00:00:00', 259.01, 259.98, 259.99, '259.65', 259.78, 0.58, 0.22, 806, 209389680, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1464, 'Au99.95', '2016-12-22 00:00:00', 259.30, 259.40, 260.30, '260.3', 259.53, -1.45, -0.56, 2432, 631744800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1465, 'Au99.95', '2016-12-21 00:00:00', 259.10, 260.85, 261.00, '259.1', 260.62, -0.92, -0.35, 1690, 440460760, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1466, 'Au99.95', '2016-12-20 00:00:00', 261.30, 261.77, 262.80, '262.8', 262.13, -1.03, NULL, 950, 249031660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1467, 'Au99.95', '2016-12-19 00:00:00', 262.30, 262.80, 262.94, '262.9', 262.68, 0.83, 0.32, 970, 254803420, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1468, 'Au99.95', '2016-12-16 00:00:00', 261.80, 261.97, 262.70, '262.7', 261.95, -0.13, -0.05, 1326, 347353160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1469, 'Au99.95', '2016-12-15 00:00:00', 262.00, 262.10, 265.99, '265.99', 263.11, -3.84, -1.44, 1614, 409903700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1470, 'Au99.95', '2016-12-14 00:00:00', 264.50, 265.94, 266.00, '264.5', 265.12, 0.85, 0.32, 2680, 695572480, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1471, 'Au99.95', '2016-12-13 00:00:00', 264.40, 265.09, 265.10, '264.4', 264.84, 0.61, 0.23, 2742, 714444520, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1472, 'Au99.95', '2016-12-12 00:00:00', 263.45, 264.48, 265.50, '265.3', 264.27, -1.21, -0.46, 1382, 365234700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1473, 'Au99.95', '2016-12-09 00:00:00', 265.00, 265.69, 267.10, '267.1', 265.62, -0.51, -0.19, 1120, 297496480, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1474, 'Au99.95', '2016-12-08 00:00:00', 265.60, 266.20, 276.40, '265.6', 266.59, 1.45, 0.55, 1348, 359376160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1475, 'Au99.95', '2016-12-07 00:00:00', 264.15, 264.75, 265.30, '264.4', 264.46, 0.08, 0.03, 2652, 701370140, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1476, 'Au99.95', '2016-12-06 00:00:00', 264.55, 264.67, 265.50, '265.3', 264.92, -0.34, -0.13, 3674, 973345820, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1477, 'Au99.95', '2016-12-05 00:00:00', 261.99, 265.01, 266.10, '265.6', 265.23, 0.02, 0.01, 2692, 714001600, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1478, 'Au99.95', '2016-12-02 00:00:00', 264.30, 264.99, 265.10, '264.3', 264.92, -0.41, -0.15, 866, 229426480, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1479, 'Au99.95', '2016-12-01 00:00:00', 263.59, 265.40, 266.30, '266.3', 264.55, -2.10, -0.79, 1580, 417996240, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1480, 'Au99.95', '2016-11-30 00:00:00', 267.20, 267.50, 268.80, '268.8', 267.81, -0.60, -0.22, 900, 241030280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1481, 'Au99.95', '2016-11-29 00:00:00', 268.10, 268.10, 270.45, '270.45', 269.34, -2.47, -0.91, 822, 221405640, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1482, 'Au99.95', '2016-11-28 00:00:00', 270.10, 270.57, 271.40, '270.5', 270.67, 1.50, 0.56, 620, 167817800, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1483, 'Au99.95', '2016-11-25 00:00:00', 265.90, 269.07, 269.50, '269.5', 267.11, -1.06, -0.39, 982, 262304820, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1484, 'Au99.95', '2016-11-24 00:00:00', 269.90, 270.13, 270.45, '270.45', 270.09, -2.46, -0.90, 1696, 458086080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1485, 'Au99.95', '2016-11-23 00:00:00', 272.50, 272.59, 273.30, '272.65', 272.91, -0.35, -0.13, 862, 235253280, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1486, 'Au99.95', '2016-11-22 00:00:00', 272.70, 272.94, 273.50, '273.19', 273.24, 0.44, 0.16, 890, 243189900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1487, 'Au99.95', '2016-11-21 00:00:00', 271.50, 272.50, 272.55, '271.5', 271.84, 1.92, 0.71, 2774, 753975780, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1488, 'Au99.95', '2016-11-18 00:00:00', 270.00, 270.58, 271.40, '271.4', 270.30, -2.50, -0.92, 1122, 303280820, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1489, 'Au99.95', '2016-11-17 00:00:00', 273.00, 273.08, 273.88, '273.8', 273.54, -0.79, -0.29, 1454, 397733160, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1490, 'Au99.95', '2016-11-16 00:00:00', 273.65, 273.87, 274.30, '273.65', 274.00, 0.55, 0.20, 2864, 784754420, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1491, 'Au99.95', '2016-11-15 00:00:00', 271.00, 273.32, 273.50, '272.6', 272.49, 2.82, 1.04, 3164, 862180540, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1492, 'Au99.95', '2016-11-14 00:00:00', 268.30, 270.50, 277.60, '277.6', 269.29, -8.01, -2.88, 2386, 642528620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1493, 'Au99.95', '2016-11-11 00:00:00', 276.00, 278.51, 282.00, '282', 277.98, -4.12, -1.46, 1386, 385282060, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1494, 'Au99.95', '2016-11-10 00:00:00', 282.10, 282.63, 282.99, '282.99', 282.57, -5.24, -1.82, 1004, 283700460, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1495, 'Au99.95', '2016-11-09 00:00:00', 279.00, 287.87, 289.20, '279', 286.23, 7.05, 2.51, 1216, 348062080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1496, 'Au99.95', '2016-11-08 00:00:00', 280.00, 280.82, 281.95, '281.95', 280.70, -0.48, -0.17, 2006, 563096340, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1497, 'Au99.95', '2016-11-07 00:00:00', 281.00, 281.30, 283.80, '283.05', 281.97, -1.15, -0.41, 1586, 447211040, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1498, 'Au99.95', '2016-11-04 00:00:00', 282.30, 282.45, 284.00, '282.4', 283.42, -0.97, -0.34, 2788, 790193520, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1499, 'Au99.95', '2016-11-03 00:00:00', 283.00, 283.42, 284.00, '283', 283.60, 1.35, 0.48, 2210, 626759500, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1500, 'Au99.95', '2016-11-02 00:00:00', 281.25, 282.07, 282.50, '281.25', 281.72, 2.18, 0.78, 1358, 382587240, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1501, 'Au99.95', '2016-11-01 00:00:00', 279.00, 279.89, 280.00, '279', 279.51, 1.13, 0.41, 1670, 466791700, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1502, 'Au99.95', '2016-10-31 00:00:00', 277.80, 278.76, 279.35, '277.8', 279.09, 1.65, 0.60, 1556, 434273620, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1503, 'Au99.95', '2016-10-28 00:00:00', 277.11, 277.11, 278.40, '277.6', 278.10, -0.20, -0.07, 5212, 1446185240, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1504, 'Au99.95', '2016-10-27 00:00:00', 277.00, 277.31, 278.00, '278', 277.26, -1.12, -0.40, 2150, 588494300, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1505, 'Au99.95', '2016-10-26 00:00:00', 277.30, 278.43, 278.75, '277.3', 278.49, 1.49, 0.54, 1964, 546080600, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1506, 'Au99.95', '2016-10-25 00:00:00', 276.45, 276.94, 277.00, '277', 276.76, 0.49, 0.18, 1560, 425398080, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1507, 'Au99.95', '2016-10-24 00:00:00', 275.78, 276.45, 276.49, '276', 276.07, 1.10, 0.40, 1552, 428474660, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1508, 'Au99.95', '2016-10-21 00:00:00', 275.04, 275.35, 277.00, '276.36', 275.32, -0.81, -0.29, 1492, 410787900, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1509, 'Au99.95', '2016-10-20 00:00:00', 276.10, 276.16, 277.00, '276.5', 276.54, 2.07, 0.76, 1472, 407074440, '2023-06-29 10:38:08', '2023-06-29 13:26:05', 0);
INSERT INTO `trade` VALUES (1510, 'Au99.95', '2016-10-19 00:00:00', 274.00, 274.09, 275.00, '274.3', 274.60, -0.25, -0.09, 1744, 478908300, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1511, 'Au99.95', '2016-10-18 00:00:00', 272.80, 274.34, 274.50, '272.97', 273.94, 1.52, 0.56, 1950, 534192660, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1512, 'Au99.95', '2016-10-17 00:00:00', 272.50, 272.82, 273.00, '273', 272.68, 0.12, 0.04, 654, 178335080, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1513, 'Au99.95', '2016-10-14 00:00:00', 272.60, 272.70, 273.20, '273.2', 272.80, -0.50, -0.18, 612, 166958860, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1514, 'Au99.95', '2016-10-13 00:00:00', 272.85, 273.20, 273.80, '272.85', 273.44, 0.85, 0.31, 978, 267431820, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1515, 'Au99.95', '2016-10-12 00:00:00', 272.25, 272.35, 273.00, '273', 272.49, -0.48, -0.18, 2248, 612565820, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1516, 'Au99.95', '2016-10-11 00:00:00', 272.55, 272.83, 273.30, '272.8', 272.89, -0.27, -0.10, 1736, 473741640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1517, 'Au99.95', '2016-10-10 00:00:00', 272.00, 273.10, 284.23, '284.23', 272.76, -11.13, -3.92, 2146, 585352500, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1518, 'Au99.95', '2016-09-30 00:00:00', 283.80, 284.23, 285.00, '284', 284.58, 0.39, 0.14, 1490, 424029060, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1519, 'Au99.95', '2016-09-29 00:00:00', 283.70, 283.84, 285.14, '284.5', 284.56, -0.64, -0.23, 1934, 550349680, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1520, 'Au99.95', '2016-09-28 00:00:00', 284.45, 284.48, 285.00, '284.85', 284.81, -2.16, -0.75, 2036, 579878780, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1521, 'Au99.95', '2016-09-27 00:00:00', 286.50, 286.64, 287.60, '287.5', 286.75, -0.46, -0.16, 1926, 552296080, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1522, 'Au99.95', '2016-09-26 00:00:00', 286.50, 287.10, 287.50, '287.5', 286.84, 0.37, 0.13, 1380, 395842960, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1523, 'Au99.95', '2016-09-23 00:00:00', 286.60, 286.73, 287.50, '287.5', 286.92, 0.22, 0.08, 2420, 694369660, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1524, 'Au99.95', '2016-09-22 00:00:00', 286.30, 286.51, 286.60, '286.5', 286.51, 2.24, 0.79, 2978, 843834660, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1525, 'Au99.95', '2016-09-21 00:00:00', 283.00, 284.27, 284.30, '283.25', 283.46, 0.92, 0.33, 1544, 437439720, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1526, 'Au99.95', '2016-09-20 00:00:00', 283.20, 283.35, 283.55, '283.35', 283.32, 0.04, 0.01, 4492, 1203360680, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1527, 'Au99.95', '2016-09-19 00:00:00', 282.50, 283.31, 283.50, '282.5', 283.20, -1.22, -0.43, 3048, 863201400, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1528, 'Au99.95', '2016-09-14 00:00:00', 283.60, 284.53, 286.50, '286.5', 283.96, -1.41, -0.49, 2232, 594649880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1529, 'Au99.95', '2016-09-13 00:00:00', 285.01, 285.94, 286.65, '286.6', 286.33, -0.29, -0.10, 1750, 501423020, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1530, 'Au99.95', '2016-09-12 00:00:00', 285.50, 286.23, 286.35, '286', 285.88, -1.13, -0.39, 2208, 598352080, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1531, 'Au99.95', '2016-09-09 00:00:00', 287.30, 287.36, 289.46, '289.1', 287.77, -1.74, -0.60, 3780, 1002555800, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1532, 'Au99.95', '2016-09-08 00:00:00', 288.80, 289.10, 289.50, '289.5', 289.03, -0.14, -0.05, 1920, 555094880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1533, 'Au99.95', '2016-09-07 00:00:00', 286.90, 289.24, 290.20, '287', 289.51, 3.28, 1.15, 1742, 483950940, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1534, 'Au99.95', '2016-09-06 00:00:00', 285.35, 285.96, 286.00, '286', 285.58, 0.60, 0.21, 924, 263880860, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1535, 'Au99.95', '2016-09-05 00:00:00', 282.30, 285.36, 285.70, '282.3', 285.04, 3.23, 1.15, 896, 255402080, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1536, 'Au99.95', '2016-09-02 00:00:00', 281.81, 282.13, 282.70, '282.4', 282.30, 1.72, 0.61, 1462, 411513660, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1537, 'Au99.95', '2016-09-01 00:00:00', 276.10, 280.41, 282.35, '276.1', 281.96, -2.39, -0.85, 2186, 616874000, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1538, 'Au99.95', '2016-08-31 00:00:00', 282.50, 282.80, 283.60, '282.6', 282.77, -0.81, -0.29, 1398, 377066820, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1539, 'Au99.95', '2016-08-30 00:00:00', 283.61, 283.61, 284.70, '284.6', 284.32, 0.11, 0.04, 956, 271524140, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1540, 'Au99.95', '2016-08-29 00:00:00', 268.99, 283.50, 286.00, '268.99', 283.29, -0.99, -0.35, 1030, 291793980, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1541, 'Au99.95', '2016-08-26 00:00:00', 248.99, 284.49, 284.65, '248.99', 284.16, 0.09, 0.03, 1230, 349546880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1542, 'Au99.95', '2016-08-25 00:00:00', 284.20, 284.40, 286.50, '286.5', 284.50, -2.32, -0.81, 1412, 387239400, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1543, 'Au99.95', '2016-08-24 00:00:00', 286.60, 286.72, 287.40, '287.4', 286.95, -0.78, -0.27, 1808, 519024660, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1544, 'Au99.95', '2016-08-23 00:00:00', 286.30, 287.50, 287.59, '286.5', 286.74, 1.21, 0.42, 1658, 475269740, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1545, 'Au99.95', '2016-08-22 00:00:00', 286.00, 286.29, 286.90, '286.9', 286.19, -2.11, -0.73, 3266, 965536160, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1546, 'Au99.95', '2016-08-19 00:00:00', 287.75, 288.40, 288.70, '288.5', 288.24, 0.05, 0.02, 1182, 340734500, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1547, 'Au99.95', '2016-08-18 00:00:00', 288.30, 288.35, 289.00, '288.49', 288.67, 1.78, 0.62, 2650, 790386320, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1548, 'Au99.95', '2016-08-17 00:00:00', 286.50, 286.57, 289.00, '289', 286.98, -1.32, -0.46, 2536, 729503360, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1549, 'Au99.95', '2016-08-16 00:00:00', 287.00, 287.89, 288.49, '287', 287.63, 0.79, 0.28, 2830, 814390120, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1550, 'Au99.95', '2016-08-15 00:00:00', 286.17, 287.10, 289.40, '287.5', 286.82, 0.90, 0.31, 934, 267896540, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1551, 'Au99.95', '2016-08-12 00:00:00', 286.20, 286.20, 288.80, '287.8', 287.01, -1.24, -0.43, 786, 225596820, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1552, 'Au99.95', '2016-08-11 00:00:00', 286.90, 287.44, 289.60, '289.6', 287.26, -1.73, -0.60, 634, 182124920, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1553, 'Au99.95', '2016-08-10 00:00:00', 286.20, 289.17, 289.88, '286.2', 288.95, 3.59, 1.26, 928, 268153540, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1554, 'Au99.95', '2016-08-09 00:00:00', 285.55, 285.58, 286.50, '286.5', 286.00, -0.71, -0.25, 882, 252255900, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1555, 'Au99.95', '2016-08-08 00:00:00', 285.70, 286.29, 286.90, '286.9', 286.30, -5.49, -1.88, 858, 245671140, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1556, 'Au99.95', '2016-08-05 00:00:00', 290.50, 291.78, 291.90, '290.5', 290.96, 3.48, 1.21, 1836, 534212800, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1557, 'Au99.95', '2016-08-04 00:00:00', 261.80, 288.30, 291.70, '291.7', 287.84, -2.27, -0.78, 1394, 401255640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1558, 'Au99.95', '2016-08-03 00:00:00', 290.20, 290.57, 291.30, '291', 290.98, 0.64, 0.22, 1710, 495249400, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1559, 'Au99.95', '2016-08-02 00:00:00', 288.29, 289.93, 290.10, '288.5', 289.09, 2.23, 0.78, 4076, 1178361980, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1560, 'Au99.95', '2016-08-01 00:00:00', 287.00, 287.70, 288.50, '287', 287.91, 2.35, 0.82, 888, 255664840, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1561, 'Au99.95', '2016-07-29 00:00:00', 285.35, 285.35, 286.85, '286.7', 285.91, -2.21, -0.77, 2428, 693013260, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1562, 'Au99.95', '2016-07-28 00:00:00', 283.90, 287.56, 287.70, '283.9', 287.10, 4.11, 1.45, 1490, 406734780, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1563, 'Au99.95', '2016-07-27 00:00:00', 282.90, 283.45, 283.45, '283.3', 283.12, -0.35, -0.12, 770, 218006980, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1564, 'Au99.95', '2016-07-26 00:00:00', 283.00, 283.80, 283.90, '283.2', 283.35, 0.90, 0.32, 762, 215916560, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1565, 'Au99.95', '2016-07-25 00:00:00', 282.50, 282.90, 283.40, '283', 283.13, -1.46, -0.51, 578, 163650480, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1566, 'Au99.95', '2016-07-22 00:00:00', 283.42, 284.36, 285.40, '283.8', 284.74, 1.42, 0.50, 880, 250066520, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1567, 'Au99.95', '2016-07-21 00:00:00', 282.00, 282.94, 283.00, '282.35', 282.60, -2.86, -1.00, 2218, 629040060, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1568, 'Au99.95', '2016-07-20 00:00:00', 285.50, 285.80, 287.30, '286.8', 286.60, -0.96, -0.34, 1408, 403702860, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1569, 'Au99.95', '2016-07-19 00:00:00', 270.99, 286.76, 287.10, '270.99', 286.63, 0.75, 0.26, 1656, 474176000, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1570, 'Au99.95', '2016-07-18 00:00:00', 285.90, 286.01, 286.80, '286.6', 286.44, -0.79, -0.28, 1710, 490256940, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1571, 'Au99.95', '2016-07-15 00:00:00', 285.90, 286.80, 287.20, '285.95', 286.52, 0.30, 0.11, 2320, 655001040, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1572, 'Au99.95', '2016-07-14 00:00:00', 286.50, 286.50, 289.30, '288.5', 287.58, -2.40, -0.83, 4552, 1257180500, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1573, 'Au99.95', '2016-07-13 00:00:00', 287.15, 288.90, 290.50, '290.1', 288.36, -3.24, -1.11, 1116, 323483100, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1574, 'Au99.95', '2016-07-12 00:00:00', 291.70, 292.14, 292.25, '291.8', 291.93, -0.91, -0.31, 2056, 558476580, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1575, 'Au99.95', '2016-07-11 00:00:00', 291.30, 293.05, 294.90, '291.3', 293.98, 1.60, 0.55, 2142, 559764640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1576, 'Au99.95', '2016-07-08 00:00:00', 290.90, 291.45, 292.00, '290.9', 291.63, -2.45, -0.83, 2998, 748484680, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1577, 'Au99.95', '2016-07-07 00:00:00', 292.90, 293.90, 295.30, '295.3', 294.14, -0.38, -0.13, 1134, 333558680, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1578, 'Au99.95', '2016-07-06 00:00:00', 289.90, 294.28, 295.35, '289.9', 294.48, 5.83, 2.02, 1282, 367352480, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1579, 'Au99.95', '2016-07-05 00:00:00', 282.29, 288.45, 288.60, '288.2', 288.02, -1.11, -0.38, 2178, 593118160, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1580, 'Au99.95', '2016-07-04 00:00:00', 286.30, 289.56, 291.00, '286.3', 289.72, 4.26, 1.49, 480, 139066100, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1581, 'Au99.95', '2016-07-01 00:00:00', 282.00, 285.30, 286.30, '282', 284.69, 3.97, 1.41, 958, 272738860, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1582, 'Au99.95', '2016-06-30 00:00:00', 281.25, 281.33, 282.80, '282.4', 281.49, -1.17, -0.41, 1634, 452041420, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1583, 'Au99.95', '2016-06-29 00:00:00', 282.00, 282.50, 283.15, '282.5', 282.66, 0.90, 0.32, 1980, 558350640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1584, 'Au99.95', '2016-06-28 00:00:00', 281.50, 281.60, 283.60, '283.6', 282.07, -1.00, -0.35, 2894, 817091280, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1585, 'Au99.95', '2016-06-27 00:00:00', 281.30, 282.60, 283.20, '281.5', 282.77, 1.69, 0.60, 2686, 738387000, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1586, 'Au99.95', '2016-06-24 00:00:00', 267.50, 280.91, 281.50, '267.5', 277.87, 12.22, 4.55, 3830, 1022634140, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1587, 'Au99.95', '2016-06-23 00:00:00', 267.75, 268.69, 268.90, '268.5', 267.99, 0.59, 0.22, 4168, 1099971340, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1588, 'Au99.95', '2016-06-22 00:00:00', 267.45, 268.10, 270.00, '270', 268.30, -3.50, -1.29, 2308, 617081900, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1589, 'Au99.95', '2016-06-21 00:00:00', 271.45, 271.60, 272.80, '271.75', 271.95, -0.62, -0.23, 642, 174594520, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1590, 'Au99.95', '2016-06-20 00:00:00', 271.50, 272.22, 274.20, '272.8', 272.30, 0.14, 0.05, 1824, 485518880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1591, 'Au99.95', '2016-06-17 00:00:00', 271.00, 272.08, 278.10, '278', 272.11, -5.31, -1.91, 1264, 326278140, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1592, 'Au99.95', '2016-06-16 00:00:00', 271.95, 277.39, 277.95, '272.98', 275.69, 4.84, 1.78, 1978, 545331880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1593, 'Au99.95', '2016-06-15 00:00:00', 272.50, 272.55, 273.30, '273.3', 272.72, 1.55, 0.57, 832, 226905640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1594, 'Au99.95', '2016-06-14 00:00:00', 270.70, 271.00, 272.60, '272.6', 271.28, -0.90, -0.33, 1766, 458678920, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1595, 'Au99.95', '2016-06-13 00:00:00', 269.60, 271.90, 272.10, '270', 270.72, 7.07, 2.67, 1668, 451544660, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1596, 'Au99.95', '2016-06-08 00:00:00', 263.30, 264.83, 265.00, '263.3', 264.09, 1.98, 0.75, 1000, 264093880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1597, 'Au99.95', '2016-06-07 00:00:00', 262.85, 262.85, 263.50, '263', 263.06, 0.58, 0.22, 1120, 294633160, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1598, 'Au99.95', '2016-06-06 00:00:00', 261.70, 262.27, 262.60, '261.7', 262.39, 4.92, 1.91, 1032, 270790640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1599, 'Au99.95', '2016-06-03 00:00:00', 256.80, 257.35, 257.40, '256.8', 257.03, -0.65, -0.25, 2386, 613284240, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1600, 'Au99.95', '2016-06-02 00:00:00', 256.50, 258.00, 258.10, '256.7', 257.26, -0.10, -0.04, 1742, 448147200, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1601, 'Au99.95', '2016-06-01 00:00:00', 258.00, 258.10, 258.80, '258.6', 258.33, 0.96, 0.37, 1688, 436068560, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1602, 'Au99.95', '2016-05-31 00:00:00', 256.40, 257.14, 257.45, '256.4', 257.21, 2.39, 0.94, 1066, 274187240, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1603, 'Au99.95', '2016-05-30 00:00:00', 254.00, 254.75, 264.80, '255.5', 254.89, -3.21, -1.24, 1216, 309954380, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1604, 'Au99.95', '2016-05-27 00:00:00', 256.50, 257.96, 259.00, '259', 257.10, -1.54, -0.59, 660, 169688900, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1605, 'Au99.95', '2016-05-26 00:00:00', 258.72, 259.50, 260.10, '259.5', 259.43, 1.08, 0.42, 886, 229857400, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1606, 'Au99.95', '2016-05-25 00:00:00', 258.20, 258.42, 262.10, '262.1', 259.01, -3.60, -1.37, 2348, 608171020, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1607, 'Au99.95', '2016-05-24 00:00:00', 262.00, 262.02, 263.50, '263.5', 262.58, -1.74, -0.66, 1548, 407176040, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1608, 'Au99.95', '2016-05-23 00:00:00', 263.30, 263.76, 265.20, '264.8', 263.92, -0.24, -0.09, 1176, 310378380, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1609, 'Au99.95', '2016-05-20 00:00:00', 262.50, 264.00, 264.65, '263.9', 264.12, 0.00, 0.00, 2574, 682269920, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1610, 'Au99.95', '2016-05-19 00:00:00', 264.00, 264.00, 266.38, '266.38', 264.47, -3.71, -1.39, 2516, 668961600, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1611, 'Au99.95', '2016-05-18 00:00:00', 267.50, 267.71, 269.20, '269.2', 268.17, 0.14, 0.05, 756, 202737540, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1612, 'Au99.95', '2016-05-17 00:00:00', 267.50, 267.57, 270.20, '270.2', 268.11, -1.92, -0.71, 1216, 326026880, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1613, 'Au99.95', '2016-05-16 00:00:00', 267.50, 269.49, 269.55, '267.5', 268.87, 2.64, 0.99, 2012, 540800640, '2023-06-29 10:38:08', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1614, 'Au99.95', '2016-05-13 00:00:00', 265.80, 266.85, 267.79, '267', 267.04, 0.55, 0.21, 4258, 1075661940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1615, 'Au99.95', '2016-05-12 00:00:00', 266.15, 266.30, 266.85, '266.5', 266.39, -0.47, -0.18, 3398, 898586420, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1616, 'Au99.95', '2016-05-11 00:00:00', 266.10, 266.77, 267.40, '266.4', 266.63, 1.05, 0.40, 3256, 827109340, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1617, 'Au99.95', '2016-05-10 00:00:00', 265.00, 265.72, 265.90, '265.2', 265.44, -2.10, -0.78, 1208, 320711540, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1618, 'Au99.95', '2016-05-09 00:00:00', 258.70, 267.82, 270.28, '268', 268.22, -0.18, -0.07, 1210, 324552940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1619, 'Au99.95', '2016-05-06 00:00:00', 267.30, 268.00, 268.10, '267.3', 267.73, 0.42, 0.16, 878, 235067600, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1620, 'Au99.95', '2016-05-05 00:00:00', 267.55, 267.58, 268.45, '268.4', 268.05, -0.95, -0.35, 480, 128667380, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1621, 'Au99.95', '2016-05-04 00:00:00', 267.85, 268.53, 269.80, '269.8', 268.14, -1.97, -0.73, 662, 177514420, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1622, 'Au99.95', '2016-05-03 00:00:00', 268.80, 270.50, 270.70, '269.8', 269.60, 5.00, 1.88, 1246, 335925480, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1623, 'Au99.95', '2016-04-29 00:00:00', 262.20, 265.50, 266.40, '262.2', 265.36, 3.63, 1.39, 1896, 503125080, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1624, 'Au99.95', '2016-04-28 00:00:00', 259.20, 261.87, 262.00, '260.1', 260.53, 1.27, 0.49, 1386, 361106940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1625, 'Au99.95', '2016-04-27 00:00:00', 260.00, 260.60, 260.74, '260.3', 260.23, 2.52, 0.98, 1602, 405121020, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1626, 'Au99.95', '2016-04-26 00:00:00', 258.00, 258.08, 259.15, '258.96', 258.45, -0.28, -0.11, 928, 239844440, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1627, 'Au99.95', '2016-04-25 00:00:00', 250.81, 258.36, 258.80, '258', 258.09, -1.92, -0.74, 4584, 1267737840, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1628, 'Au99.95', '2016-04-22 00:00:00', 260.05, 260.28, 264.60, '264.2', 260.36, -2.55, -0.97, 4864, 1342670460, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1629, 'Au99.95', '2016-04-21 00:00:00', 260.00, 262.83, 262.99, '260.5', 261.18, 2.95, 1.14, 4748, 1313392420, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1630, 'Au99.95', '2016-04-20 00:00:00', 259.50, 259.88, 261.50, '260.6', 260.66, 0.36, 0.14, 5816, 1589981620, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1631, 'Au99.95', '2016-04-19 00:00:00', 256.50, 259.52, 259.68, '257.9', 257.35, 1.91, 0.74, 966, 248604860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1632, 'Au99.95', '2016-04-18 00:00:00', 257.00, 257.61, 257.90, '257', 257.73, 0.80, 0.31, 1350, 347945500, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1633, 'Au99.95', '2016-04-15 00:00:00', 256.15, 256.81, 257.80, '257.8', 256.97, -0.67, -0.26, 680, 174744380, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1634, 'Au99.95', '2016-04-14 00:00:00', 256.14, 257.48, 260.78, '260.05', 257.52, -2.50, -0.96, 1614, 415643240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1635, 'Au99.95', '2016-04-13 00:00:00', 259.80, 259.98, 262.54, '262', 260.41, -1.51, -0.58, 1074, 279682820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1636, 'Au99.95', '2016-04-12 00:00:00', 260.10, 261.49, 261.50, '260.1', 260.90, 0.83, 0.32, 1936, 505105820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1637, 'Au99.95', '2016-04-11 00:00:00', 257.99, 260.66, 260.90, '257.99', 259.98, 3.56, 1.38, 1750, 454967700, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1638, 'Au99.95', '2016-04-08 00:00:00', 257.00, 257.10, 258.00, '257.6', 257.65, 1.40, 0.55, 1810, 466359980, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1639, 'Au99.95', '2016-04-07 00:00:00', 255.40, 255.70, 256.10, '255.68', 255.65, -0.06, -0.02, 1660, 424384000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1640, 'Au99.95', '2016-04-06 00:00:00', 255.60, 255.76, 256.77, '256.4', 256.20, 0.26, 0.10, 2186, 560075000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1641, 'Au99.95', '2016-04-05 00:00:00', 255.00, 255.50, 255.75, '255', 255.50, -1.20, -0.47, 1046, 267255320, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1642, 'Au99.95', '2016-04-01 00:00:00', 255.90, 256.70, 256.71, '256.1', 256.40, 0.46, 0.18, 1476, 378459180, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1643, 'Au99.95', '2016-03-31 00:00:00', 255.30, 256.24, 256.50, '255.7', 255.59, -1.66, -0.64, 1004, 256613780, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1644, 'Au99.95', '2016-03-30 00:00:00', 256.00, 257.90, 259.10, '256', 258.27, 2.71, 1.06, 1286, 332139040, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1645, 'Au99.95', '2016-03-29 00:00:00', 255.00, 255.19, 255.50, '255.5', 255.30, 0.06, 0.02, 1158, 295645760, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1646, 'Au99.95', '2016-03-28 00:00:00', 253.80, 255.13, 255.20, '254.6', 254.32, -0.81, -0.32, 1998, 508150100, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1647, 'Au99.95', '2016-03-25 00:00:00', 255.52, 255.94, 256.00, '255.52', 255.73, 0.94, 0.37, 1092, 279266320, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1648, 'Au99.95', '2016-03-24 00:00:00', 254.30, 255.00, 257.20, '257.2', 255.21, -3.12, -1.21, 1454, 371081860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1649, 'Au99.95', '2016-03-23 00:00:00', 257.95, 258.12, 262.20, '262.2', 259.13, -3.54, -1.35, 1058, 274162320, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1650, 'Au99.95', '2016-03-22 00:00:00', 259.30, 261.66, 261.70, '259.5', 260.42, 2.11, 0.81, 1690, 440118060, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1651, 'Au99.95', '2016-03-21 00:00:00', 259.00, 259.55, 261.50, '259.59', 259.81, -3.24, -1.23, 3928, 1020557260, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1652, 'Au99.95', '2016-03-18 00:00:00', 262.59, 262.79, 263.39, '263.08', 262.91, -0.67, -0.25, 918, 241351880, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1653, 'Au99.95', '2016-03-17 00:00:00', 262.00, 263.46, 263.50, '263', 262.75, 4.32, 1.67, 1588, 417261640, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1654, 'Au99.95', '2016-03-16 00:00:00', 257.80, 259.14, 259.30, '258.6', 258.73, 1.78, 0.69, 1916, 495738780, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1655, 'Au99.95', '2016-03-15 00:00:00', 257.00, 257.36, 262.70, '262.51', 257.55, -4.60, -1.76, 1820, 468749440, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1656, 'Au99.95', '2016-03-14 00:00:00', 261.90, 261.96, 264.90, '264.4', 262.44, -2.58, -0.98, 988, 259297080, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1657, 'Au99.95', '2016-03-11 00:00:00', 231.00, 264.54, 267.15, '261.5', 265.67, 3.16, 1.21, 1088, 289055140, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1658, 'Au99.95', '2016-03-10 00:00:00', 261.30, 261.38, 262.50, '262.3', 262.11, -2.15, -0.82, 4872, 1241172360, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1659, 'Au99.95', '2016-03-09 00:00:00', 262.90, 263.53, 266.00, '266', 263.31, -2.35, -0.88, 3686, 930482940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1660, 'Au99.95', '2016-03-08 00:00:00', 264.85, 265.88, 266.35, '264.85', 265.81, 1.06, 0.00, 1980, 526108220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1661, 'Au99.95', '2016-03-07 00:00:00', 263.50, 264.82, 267.00, '267', 264.69, 0.33, 0.00, 3026, 800976120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1662, 'Au99.95', '2016-03-04 00:00:00', 263.70, 264.49, 265.00, '263.7', 264.32, 3.45, 1.32, 2194, 579932880, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1663, 'Au99.95', '2016-03-03 00:00:00', 260.50, 261.04, 261.30, '260.5', 260.76, 2.35, 0.91, 2030, 529354100, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1664, 'Au99.95', '2016-03-02 00:00:00', 253.08, 258.69, 261.00, '253.08', 258.95, -2.91, -1.11, 2236, 579028200, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1665, 'Au99.95', '2016-03-01 00:00:00', 260.00, 261.60, 262.50, '260', 261.93, 2.74, 1.06, 1968, 515490100, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1666, 'Au99.95', '2016-02-29 00:00:00', 256.70, 258.86, 259.18, '258.4', 258.34, -1.00, -0.39, 2074, 535808840, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1667, 'Au99.95', '2016-02-26 00:00:00', 259.86, 259.86, 260.60, '260.5', 260.37, -0.14, 0.00, 2788, 725938800, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1668, 'Au99.95', '2016-02-25 00:00:00', 259.00, 260.00, 260.20, '259', 259.41, 3.50, 1.00, 2132, 553077320, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1669, 'Au99.95', '2016-02-24 00:00:00', 256.50, 256.50, 257.70, '257.3', 257.44, 0.26, 0.10, 1584, 407800380, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1670, 'Au99.95', '2016-02-23 00:00:00', 254.85, 256.24, 256.44, '255', 255.11, 1.54, 0.61, 1568, 400026820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1671, 'Au99.95', '2016-02-22 00:00:00', 254.60, 254.70, 256.70, '256.7', 255.57, -2.06, -0.80, 3388, 865877360, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1672, 'Au99.95', '2016-02-19 00:00:00', 253.00, 256.76, 257.20, '253', 256.85, 4.24, 1.68, 1772, 455142720, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1673, 'Au99.95', '2016-02-18 00:00:00', 252.52, 252.52, 253.54, '253.4', 253.39, -0.79, -0.31, 1896, 480444120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1674, 'Au99.95', '2016-02-17 00:00:00', 251.70, 253.31, 253.40, '251.9', 252.79, 2.11, 0.84, 902, 228025400, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1675, 'Au99.95', '2016-02-16 00:00:00', 237.00, 251.20, 252.00, '252', 250.79, -2.61, -1.03, 918, 230234220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1676, 'Au99.95', '2016-02-15 00:00:00', 253.40, 253.81, 256.40, '255.1', 255.49, 10.05, 4.12, 2436, 622394940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1677, 'Au99.95', '2016-02-05 00:00:00', 242.15, 243.76, 243.94, '242.15', 243.70, 1.97, 0.82, 5728, 1473297300, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1678, 'Au99.95', '2016-02-04 00:00:00', 239.00, 241.79, 241.80, '239', 241.46, 2.75, 1.15, 4592, 1190189060, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1679, 'Au99.95', '2016-02-03 00:00:00', 238.35, 239.04, 239.39, '238.35', 239.11, 0.60, 0.25, 5256, 1346470940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1680, 'Au99.95', '2016-02-02 00:00:00', 238.40, 238.44, 238.97, '238.9', 238.70, 0.50, 0.21, 5138, 1317571860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1681, 'Au99.95', '2016-02-01 00:00:00', 236.90, 237.94, 237.98, '236.9', 237.56, 2.46, 1.05, 6322, 1597006120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1682, 'Au99.95', '2016-01-29 00:00:00', 235.48, 235.48, 237.25, '237.25', 236.12, -1.27, -0.54, 1360, 321134620, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1683, 'Au99.95', '2016-01-28 00:00:00', 236.60, 236.75, 237.50, '237.5', 237.04, -0.28, -0.12, 1236, 292981960, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1684, 'Au99.95', '2016-01-27 00:00:00', 236.10, 237.03, 237.80, '236.1', 237.33, 0.46, 0.19, 1818, 431470820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1685, 'Au99.95', '2016-01-26 00:00:00', 234.70, 236.57, 236.60, '234.7', 235.68, 3.01, 1.29, 3300, 777475660, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1686, 'Au99.95', '2016-01-25 00:00:00', 233.00, 233.56, 233.60, '233', 233.37, 0.77, 0.33, 2384, 556368880, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1687, 'Au99.95', '2016-01-22 00:00:00', 230.90, 232.79, 233.30, '233', 233.05, -1.18, -0.50, 2554, 595185080, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1688, 'Au99.95', '2016-01-21 00:00:00', 233.00, 233.97, 234.00, '233', 233.62, 1.78, 0.77, 3210, 749947000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1689, 'Au99.95', '2016-01-20 00:00:00', 231.30, 232.19, 232.25, '231.49', 231.53, 0.91, 0.39, 2388, 552894500, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1690, 'Au99.95', '2016-01-19 00:00:00', 230.40, 231.28, 231.55, '231.15', 231.04, -0.17, -0.07, 2872, 663547580, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1691, 'Au99.95', '2016-01-18 00:00:00', 231.15, 231.45, 232.00, '232', 231.45, 0.18, 0.08, 5208, 1205414940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1692, 'Au99.95', '2016-01-15 00:00:00', 229.10, 231.27, 232.00, '231.5', 229.74, 0.47, 0.20, 3846, 883550400, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1693, 'Au99.95', '2016-01-14 00:00:00', 228.80, 230.80, 232.20, '229', 231.79, 1.11, 0.48, 3306, 765901660, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1694, 'Au99.95', '2016-01-13 00:00:00', 229.50, 229.69, 231.96, '231.7', 230.22, -2.77, -1.19, 2960, 681457580, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1695, 'Au99.95', '2016-01-12 00:00:00', 231.50, 232.46, 234.40, '234.4', 232.12, -2.36, -1.01, 3244, 753017180, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1696, 'Au99.95', '2016-01-11 00:00:00', 234.00, 234.82, 234.90, '234', 234.63, 1.30, 0.56, 3154, 740350600, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1697, 'Au99.95', '2016-01-08 00:00:00', 233.51, 233.87, 235.18, '234', 234.27, -0.13, -0.06, 96, 22537658, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1698, 'Au99.95', '2016-01-07 00:00:00', 229.25, 233.48, 234.50, '229.25', 233.59, 5.36, 2.35, 4074, 951120340, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1699, 'Au99.95', '2016-01-06 00:00:00', 226.50, 228.12, 228.45, '226.9', 227.37, 1.44, 0.64, 2488, 566350920, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1700, 'Au99.95', '2016-01-05 00:00:00', 224.50, 226.68, 226.90, '224.79', 226.38, 1.89, 0.84, 1844, 417461180, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1701, 'Au99.95', '2016-01-04 00:00:00', 223.50, 224.79, 224.89, '224.6', 224.22, 0.19, 0.09, 2202, 493771820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1702, 'Au99.95', '2015-12-31 00:00:00', 222.60, 224.60, 226.00, '222.9', 223.09, 0.16, 0.07, 1154, 257447460, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1703, 'Au99.95', '2015-12-30 00:00:00', 224.40, 224.44, 224.60, '224.4', 224.46, -2.35, -1.04, 1390, 312012100, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1704, 'Au99.95', '2015-12-29 00:00:00', 224.40, 226.79, 226.80, '224.4', 224.57, 2.04, 0.91, 2574, 578055220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1705, 'Au99.95', '2015-12-28 00:00:00', 224.00, 224.75, 224.89, '224.5', 224.30, -0.21, -0.09, 2602, 583642720, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1706, 'Au99.95', '2015-12-25 00:00:00', 224.45, 224.96, 225.25, '224.45', 225.00, 0.48, 0.21, 1022, 229950680, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1707, 'Au99.95', '2015-12-24 00:00:00', 223.50, 224.48, 224.60, '224.45', 224.34, -0.02, -0.01, 1314, 294792020, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1708, 'Au99.95', '2015-12-23 00:00:00', 224.20, 224.50, 225.00, '225', 224.49, -0.60, -0.27, 1678, 376709880, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1709, 'Au99.95', '2015-12-22 00:00:00', 224.30, 225.10, 225.20, '224.3', 225.00, 1.32, 0.59, 2000, 450002360, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1710, 'Au99.95', '2015-12-21 00:00:00', 223.30, 223.78, 224.40, '224.4', 223.59, 1.42, 0.64, 2238, 500269900, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1711, 'Au99.95', '2015-12-18 00:00:00', 220.80, 222.36, 224.50, '221.15', 221.11, -0.64, -0.29, 3324, 769985680, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1712, 'Au99.95', '2015-12-17 00:00:00', 222.60, 223.00, 223.10, '222.7', 222.92, 0.85, 0.38, 6520, 1561094000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1713, 'Au99.95', '2015-12-16 00:00:00', 222.00, 222.15, 222.30, '222', 222.21, 0.54, 0.24, 6310, 1513349940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1714, 'Au99.95', '2015-12-15 00:00:00', 221.60, 221.61, 222.60, '222.5', 222.17, -1.59, -0.71, 6446, 1543467940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1715, 'Au99.95', '2015-12-14 00:00:00', 223.20, 223.20, 224.40, '224', 224.25, 0.26, 0.12, 1108, 248473980, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1716, 'Au99.95', '2015-12-11 00:00:00', 221.50, 222.94, 223.00, '222.7', 222.05, 0.14, 0.06, 1464, 325081300, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1717, 'Au99.95', '2015-12-10 00:00:00', 222.80, 222.80, 223.30, '222.8', 223.04, -0.39, -0.18, 1170, 260959840, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1718, 'Au99.95', '2015-12-09 00:00:00', 223.10, 223.19, 223.50, '223.15', 223.33, 0.71, 0.32, 1418, 316689280, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1719, 'Au99.95', '2015-12-08 00:00:00', 221.48, 222.48, 222.59, '221.6', 222.03, -1.95, -0.87, 1414, 313961260, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1720, 'Au99.95', '2015-12-07 00:00:00', 224.00, 224.43, 224.50, '224.09', 224.26, 5.27, 2.41, 2712, 608216460, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1721, 'Au99.95', '2015-12-04 00:00:00', 218.83, 219.16, 219.40, '219.2', 219.06, 1.61, 0.74, 3090, 676904940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1722, 'Au99.95', '2015-12-03 00:00:00', 216.58, 217.55, 219.10, '219.1', 217.06, -2.82, -1.28, 2836, 615532160, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1723, 'Au99.95', '2015-12-02 00:00:00', 220.01, 220.37, 221.00, '221', 220.73, -1.10, -0.50, 2584, 570373920, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1724, 'Au99.95', '2015-12-01 00:00:00', 220.60, 221.47, 221.85, '220.6', 221.45, 3.70, 1.70, 1652, 365841460, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1725, 'Au99.95', '2015-11-30 00:00:00', 217.45, 217.77, 218.00, '217.9', 217.72, -2.35, -1.07, 3904, 849983940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1726, 'Au99.95', '2015-11-27 00:00:00', 219.80, 220.12, 221.35, '221.3', 221.00, -1.31, -0.59, 4318, 954285220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1727, 'Au99.95', '2015-11-26 00:00:00', 221.00, 221.43, 221.80, '221', 221.22, -1.19, -0.54, 2622, 580061820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1728, 'Au99.95', '2015-11-25 00:00:00', 222.20, 222.62, 222.99, '222.2', 222.62, 1.35, 0.61, 3668, 816592980, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1729, 'Au99.95', '2015-11-24 00:00:00', 220.68, 221.27, 221.30, '220.8', 220.82, 0.36, 0.16, 2786, 615216460, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1730, 'Au99.95', '2015-11-23 00:00:00', 220.35, 220.91, 221.80, '221.8', 220.86, -2.32, -1.04, 4820, 1064696240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1731, 'Au99.95', '2015-11-20 00:00:00', 221.20, 223.23, 223.50, '221.4', 223.12, 1.73, 0.78, 4896, 1092433980, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1732, 'Au99.95', '2015-11-19 00:00:00', 220.50, 221.50, 221.99, '220.5', 221.74, 0.79, 0.36, 4420, 980134120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1733, 'Au99.95', '2015-11-18 00:00:00', 219.70, 220.71, 221.95, '221.95', 220.19, -1.73, -0.78, 3900, 858710100, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1734, 'Au99.95', '2015-11-17 00:00:00', 221.80, 222.44, 223.30, '223.3', 222.58, -3.14, -1.39, 2040, 454073200, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1735, 'Au99.95', '2015-11-16 00:00:00', 224.90, 225.58, 229.60, '229.6', 225.62, 3.08, 1.38, 2926, 659430500, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1736, 'Au99.95', '2015-11-13 00:00:00', 222.20, 222.50, 223.60, '223.6', 222.72, -0.99, -0.44, 2050, 456580300, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1737, 'Au99.95', '2015-11-12 00:00:00', 223.48, 223.49, 223.95, '223.9', 223.84, -0.76, -0.34, 7116, 1592861920, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1738, 'Au99.95', '2015-11-11 00:00:00', 224.00, 224.25, 233.00, '233', 225.15, 0.03, 0.01, 1214, 273335240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1739, 'Au99.95', '2015-11-10 00:00:00', 224.05, 224.22, 224.38, '224.15', 224.17, 0.06, 0.03, 686, 153783200, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1740, 'Au99.95', '2015-11-09 00:00:00', 223.85, 224.16, 227.00, '227', 224.27, -3.20, -1.41, 1480, 331929240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1741, 'Au99.95', '2015-11-06 00:00:00', 226.95, 227.36, 228.30, '227.2', 227.16, 0.38, 0.17, 1978, 449332860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1742, 'Au99.95', '2015-11-05 00:00:00', 226.80, 226.98, 227.25, '227.05', 227.04, -1.72, -0.75, 1148, 260648240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1743, 'Au99.95', '2015-11-04 00:00:00', 228.60, 228.70, 230.80, '230.8', 228.98, -3.26, -1.41, 1042, 238600340, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1744, 'Au99.95', '2015-11-03 00:00:00', 231.85, 231.96, 232.80, '232.75', 232.17, -1.22, -0.52, 1266, 293934900, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1745, 'Au99.95', '2015-11-02 00:00:00', 232.00, 233.18, 233.20, '232', 232.82, -0.25, -0.11, 1246, 290101960, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1746, 'Au99.95', '2015-10-30 00:00:00', 233.00, 233.43, 237.00, '237', 234.65, -3.98, -1.68, 1408, 330398620, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1747, 'Au99.95', '2015-10-29 00:00:00', 237.30, 237.41, 241.45, '240.2', 237.67, -2.38, -0.99, 1972, 468702860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1748, 'Au99.95', '2015-10-28 00:00:00', 238.30, 239.79, 239.98, '238.51', 239.07, 1.52, 0.64, 1980, 473375400, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1749, 'Au99.95', '2015-10-27 00:00:00', 238.03, 238.27, 238.70, '238.7', 238.31, 0.17, 0.07, 2766, 659185540, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1750, 'Au99.95', '2015-10-26 00:00:00', 238.05, 238.10, 238.45, '238.2', 238.36, -2.01, -0.84, 2366, 563977480, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1751, 'Au99.95', '2015-10-23 00:00:00', 238.85, 240.11, 240.20, '238.85', 239.27, 1.56, 0.65, 3184, 761837920, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1752, 'Au99.95', '2015-10-22 00:00:00', 236.18, 238.55, 239.80, '239.8', 238.39, -1.37, -0.57, 5020, 1196779000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1753, 'Au99.95', '2015-10-21 00:00:00', 239.80, 239.92, 240.72, '240.1', 240.35, 0.07, 0.03, 2914, 699756640, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1754, 'Au99.95', '2015-10-20 00:00:00', 238.75, 239.85, 239.90, '239.8', 239.21, 0.16, 0.07, 3278, 784151260, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1755, 'Au99.95', '2015-10-19 00:00:00', 239.50, 239.69, 241.00, '240.75', 239.89, -0.68, -0.28, 3546, 850663420, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1756, 'Au99.95', '2015-10-16 00:00:00', 240.15, 240.37, 241.85, '241.85', 240.52, -1.01, -0.42, 2646, 636438880, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1757, 'Au99.95', '2015-10-15 00:00:00', 232.00, 241.38, 241.75, '238.5', 241.20, 2.08, 0.87, 3956, 954220880, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1758, 'Au99.95', '2015-10-14 00:00:00', 236.10, 239.30, 239.80, '236.1', 239.25, 3.20, 1.36, 4642, 1109670860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1759, 'Au99.95', '2015-10-13 00:00:00', 235.50, 236.10, 236.20, '235.95', 235.83, -1.16, -0.49, 7146, 1691250860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1760, 'Au99.95', '2015-10-12 00:00:00', 235.40, 237.26, 238.00, '235.4', 236.65, 2.75, 1.17, 3488, 825636900, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1761, 'Au99.95', '2015-10-09 00:00:00', 233.70, 234.51, 235.00, '234.1', 234.37, 0.41, 0.18, 3904, 914983240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1762, 'Au99.95', '2015-10-08 00:00:00', 233.60, 234.10, 234.20, '233.8', 233.96, 4.17, 1.81, 3778, 884036320, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1763, 'Au99.95', '2015-09-30 00:00:00', 229.40, 229.93, 231.40, '231.4', 229.93, -0.08, -0.04, 4006, 921104140, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1764, 'Au99.95', '2015-09-29 00:00:00', 230.00, 230.01, 232.40, '232.2', 231.60, -3.51, -1.50, 5650, 1308541140, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1765, 'Au99.95', '2015-09-28 00:00:00', 233.50, 233.52, 235.60, '235', 234.92, -1.81, -0.77, 3108, 730132960, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1766, 'Au99.95', '2015-09-25 00:00:00', 234.20, 235.33, 236.69, '234.2', 235.84, 1.15, 0.49, 5472, 1290541400, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1767, 'Au99.95', '2015-09-24 00:00:00', 233.00, 234.18, 234.35, '233', 233.63, 1.68, 0.72, 4890, 1142461120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1768, 'Au99.95', '2015-09-23 00:00:00', 231.40, 232.50, 233.05, '233.05', 232.03, -0.80, -0.34, 5376, 1247407740, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1769, 'Au99.95', '2015-09-22 00:00:00', 232.95, 233.30, 233.45, '233.45', 233.21, -0.70, -0.30, 4718, 1100225840, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1770, 'Au99.95', '2015-09-21 00:00:00', 231.49, 234.00, 234.00, '233.5', 233.64, 2.15, 0.93, 4168, 973852400, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1771, 'Au99.95', '2015-09-18 00:00:00', 231.50, 231.85, 232.40, '232.3', 231.97, 1.40, 0.61, 3196, 741395120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1772, 'Au99.95', '2015-09-17 00:00:00', 230.25, 230.45, 230.62, '230.41', 230.44, 2.43, 1.07, 4642, 1069711540, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1773, 'Au99.95', '2015-09-16 00:00:00', 218.20, 228.02, 228.12, '228', 225.64, 0.20, 0.09, 2946, 664739740, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1774, 'Au99.95', '2015-09-15 00:00:00', 227.30, 227.82, 228.10, '227.69', 227.89, 0.82, 0.36, 3644, 830445280, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1775, 'Au99.95', '2015-09-14 00:00:00', 227.00, 227.00, 237.50, '237.5', 227.98, -1.30, -0.57, 3172, 723167280, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1776, 'Au99.95', '2015-09-11 00:00:00', 227.80, 228.30, 228.65, '228.6', 228.49, 0.30, 0.13, 4638, 1059751340, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1777, 'Au99.95', '2015-09-10 00:00:00', 227.79, 228.00, 230.50, '230.5', 228.12, -3.08, -1.33, 5460, 1253841560, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1778, 'Au99.95', '2015-09-09 00:00:00', 230.90, 231.08, 231.35, '231.3', 231.14, 0.64, 0.28, 2028, 468754000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1779, 'Au99.95', '2015-09-08 00:00:00', 230.10, 230.44, 230.70, '230.7', 230.52, -0.30, -0.13, 3454, 796226100, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1780, 'Au99.95', '2015-09-07 00:00:00', 230.70, 230.74, 235.80, '235.8', 230.98, -4.21, -1.79, 2664, 615354940, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1781, 'Au99.95', '2015-09-02 00:00:00', 233.70, 234.95, 235.00, '233.8', 234.19, 0.17, 0.07, 3472, 813126060, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1782, 'Au99.95', '2015-09-01 00:00:00', 233.00, 234.78, 234.90, '233', 234.52, 1.37, 0.59, 3310, 776274680, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1783, 'Au99.95', '2015-08-31 00:00:00', 233.35, 233.41, 234.00, '234', 233.48, 0.09, 0.04, 3008, 702319840, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1784, 'Au99.95', '2015-08-28 00:00:00', 232.80, 233.32, 233.90, '233', 233.45, 0.28, 0.12, 4724, 1102843180, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1785, 'Au99.95', '2015-08-27 00:00:00', 232.00, 233.04, 233.50, '232.4', 232.95, -2.27, -0.97, 6026, 1405279000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1786, 'Au99.95', '2015-08-26 00:00:00', 234.50, 235.31, 237.50, '237.5', 234.98, -1.80, -0.76, 7952, 1868639960, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1787, 'Au99.95', '2015-08-25 00:00:00', 237.00, 237.11, 239.10, '239.1', 238.40, -1.43, -0.60, 6190, 1475748800, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1788, 'Au99.95', '2015-08-24 00:00:00', 183.99, 238.54, 240.00, '183.99', 238.40, 0.70, 0.29, 4384, 1045174520, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1789, 'Au99.95', '2015-08-21 00:00:00', 235.80, 237.84, 240.70, '235.8', 239.44, 4.10, 1.75, 4048, 969257800, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1790, 'Au99.95', '2015-08-20 00:00:00', 231.69, 233.74, 235.49, '232.92', 234.25, 2.19, 0.95, 5200, 1218149300, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1791, 'Au99.95', '2015-08-19 00:00:00', 229.70, 231.55, 231.58, '230.3', 230.68, 0.62, 0.27, 3718, 857686240, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1792, 'Au99.95', '2015-08-18 00:00:00', 230.14, 230.93, 231.00, '230.74', 230.60, 0.43, 0.19, 4978, 1159766660, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1793, 'Au99.95', '2015-08-17 00:00:00', 229.60, 230.50, 230.79, '230.5', 230.17, 3.08, 1.35, 3964, 912397120, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1794, 'Au99.95', '2015-08-14 00:00:00', 220.99, 227.42, 230.40, '230.1', 229.79, -4.13, -1.78, 4226, 971117900, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1795, 'Au99.95', '2015-08-13 00:00:00', 230.80, 231.55, 233.00, '232.5', 231.87, -0.91, -0.39, 3908, 906177220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1796, 'Au99.95', '2015-08-12 00:00:00', 227.10, 232.46, 233.00, '227.1', 231.20, 7.90, 3.52, 5836, 1349303260, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1797, 'Au99.95', '2015-08-11 00:00:00', 221.30, 224.56, 225.00, '221.4', 222.98, 4.91, 2.24, 3568, 795608260, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1798, 'Au99.95', '2015-08-10 00:00:00', 218.50, 219.65, 219.70, '219', 219.09, 0.62, 0.28, 4810, 1053844580, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1799, 'Au99.95', '2015-08-07 00:00:00', 217.70, 219.03, 219.70, '217.8', 217.94, 1.70, 0.78, 5586, 1217431760, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1800, 'Au99.95', '2015-08-06 00:00:00', 217.00, 217.33, 217.45, '217', 217.25, -0.24, -0.11, 2400, 521409700, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1801, 'Au99.95', '2015-08-05 00:00:00', 217.10, 217.57, 217.75, '217.3', 217.53, -0.43, -0.20, 3374, 733950060, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1802, 'Au99.95', '2015-08-04 00:00:00', 216.30, 218.00, 218.00, '217.09', 216.99, -1.38, -0.63, 4420, 959102160, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1803, 'Au99.95', '2015-08-03 00:00:00', 218.40, 219.38, 219.60, '218.5', 219.09, 2.63, 1.21, 5820, 1291365460, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1804, 'Au99.95', '2015-07-31 00:00:00', 216.60, 216.75, 217.30, '217.3', 217.07, -0.21, -0.10, 2320, 503615060, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1805, 'Au99.95', '2015-07-30 00:00:00', 216.80, 216.96, 219.60, '219.55', 218.23, -2.62, -1.19, 3660, 815300820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1806, 'Au99.95', '2015-07-29 00:00:00', 219.10, 219.58, 219.96, '219.1', 219.65, 0.23, 0.11, 3884, 853146200, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1807, 'Au99.95', '2015-07-28 00:00:00', 218.75, 219.35, 220.00, '220', 219.15, -1.64, -0.74, 4134, 905969740, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1808, 'Au99.95', '2015-07-27 00:00:00', 219.20, 220.99, 221.00, '219.3', 220.16, 4.06, 1.87, 4922, 1083123780, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1809, 'Au99.95', '2015-07-24 00:00:00', 215.40, 216.93, 218.50, '218.5', 216.74, -2.68, -1.22, 3454, 748642200, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1810, 'Au99.95', '2015-07-23 00:00:00', 217.75, 219.61, 219.90, '217.75', 219.61, 0.81, 0.37, 3818, 838501180, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1811, 'Au99.95', '2015-07-22 00:00:00', 218.30, 218.80, 221.30, '221.3', 219.16, -2.56, -1.16, 5304, 1162426360, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1812, 'Au99.95', '2015-07-21 00:00:00', 220.50, 221.36, 222.90, '222.9', 220.91, -2.10, -0.94, 3384, 747566860, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1813, 'Au99.95', '2015-07-20 00:00:00', 220.00, 223.46, 229.05, '228.98', 223.07, -5.54, -2.42, 4696, 1047549920, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1814, 'Au99.95', '2015-07-17 00:00:00', 228.80, 229.00, 229.20, '229.2', 228.98, -0.41, -0.18, 4742, 1085825420, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1815, 'Au99.95', '2015-07-16 00:00:00', 229.15, 229.41, 229.50, '229.5', 229.33, -1.56, -0.68, 5102, 1170072600, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1816, 'Au99.95', '2015-07-15 00:00:00', 230.70, 230.97, 231.50, '231.2', 230.95, 0.87, 0.38, 3632, 838876820, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1817, 'Au99.95', '2015-07-14 00:00:00', 230.10, 230.10, 231.55, '231.55', 231.00, -1.87, -0.81, 3654, 844102220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1818, 'Au99.95', '2015-07-13 00:00:00', 231.90, 231.97, 232.30, '232', 232.14, -0.36, -0.16, 4320, 1002866000, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1819, 'Au99.95', '2015-07-10 00:00:00', 231.74, 232.33, 233.00, '232.7', 232.17, -0.01, 0.00, 4180, 970505180, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1820, 'Au99.95', '2015-07-09 00:00:00', 231.00, 232.34, 233.00, '231', 231.83, 3.38, 1.48, 7958, 1921971220, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1821, 'Au99.95', '2015-07-08 00:00:00', 228.60, 228.96, 232.50, '232.5', 230.07, -4.65, -1.99, 8600, 2062897660, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1822, 'Au99.95', '2015-07-07 00:00:00', 233.05, 233.61, 233.70, '233.1', 233.46, 0.32, 0.14, 3988, 931056020, '2023-06-29 10:38:09', '2023-06-29 13:26:06', 0);
INSERT INTO `trade` VALUES (1823, 'Au99.95', '2015-07-06 00:00:00', 233.00, 233.29, 233.49, '233.4', 233.27, 0.12, 0.05, 5018, 1170584680, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1824, 'Au99.95', '2015-07-03 00:00:00', 232.80, 233.17, 233.28, '232.8', 233.00, 0.53, 0.23, 3702, 862599020, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1825, 'Au99.95', '2015-07-02 00:00:00', 232.40, 232.64, 233.15, '233.05', 232.90, -1.56, -0.67, 3386, 788619740, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1826, 'Au99.95', '2015-07-01 00:00:00', 234.20, 234.20, 234.50, '234.49', 234.36, -0.33, -0.14, 3192, 748091700, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1827, 'Au99.95', '2015-06-30 00:00:00', 233.00, 234.53, 235.30, '235', 234.87, -0.77, -0.33, 1656, 388953100, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1828, 'Au99.95', '2015-06-29 00:00:00', 235.30, 235.30, 236.49, '236.2', 236.20, 0.95, 0.41, 4286, 1012383720, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1829, 'Au99.95', '2015-06-26 00:00:00', 234.00, 234.35, 234.95, '234.7', 234.57, -0.76, -0.32, 2702, 633810360, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1830, 'Au99.95', '2015-06-25 00:00:00', 234.60, 235.11, 235.30, '235.2', 235.13, 4.74, 2.06, 2828, 664970120, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1831, 'Au99.95', '2015-06-24 00:00:00', 230.00, 230.37, 236.50, '236.2', 234.90, -6.67, -2.81, 6250, 1468160880, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1832, 'Au99.95', '2015-06-23 00:00:00', 236.75, 237.04, 237.28, '237', 237.01, -1.96, -0.82, 4912, 1164192720, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1833, 'Au99.95', '2015-06-19 00:00:00', 239.00, 239.00, 239.50, '239.25', 239.22, 2.00, 0.84, 5504, 1315985440, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1834, 'Au99.95', '2015-06-18 00:00:00', 235.00, 237.00, 237.20, '235', 237.04, 1.48, 0.63, 3124, 740521920, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1835, 'Au99.95', '2015-06-17 00:00:00', 235.30, 235.52, 236.00, '235.5', 235.65, -1.35, -0.57, 2786, 656541520, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1836, 'Au99.95', '2015-06-16 00:00:00', 236.45, 236.87, 237.35, '237.1', 236.83, 1.07, 0.45, 2950, 698670040, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1837, 'Au99.95', '2015-06-15 00:00:00', 235.80, 235.80, 236.90, '236', 236.11, -0.32, -0.14, 2744, 647907520, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1838, 'Au99.95', '2015-06-12 00:00:00', 235.30, 236.12, 236.50, '235.3', 236.24, -0.30, -0.13, 2566, 606207860, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1839, 'Au99.95', '2015-06-11 00:00:00', 236.30, 236.42, 237.15, '237.15', 236.92, -0.36, -0.15, 3286, 798105120, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1840, 'Au99.95', '2015-06-10 00:00:00', 235.00, 236.78, 236.79, '235.7', 235.57, 1.70, 0.72, 2694, 634628660, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1841, 'Au99.95', '2015-06-09 00:00:00', 234.70, 235.08, 235.24, '234.7', 235.03, 0.62, 0.26, 3036, 713578180, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1842, 'Au99.95', '2015-06-08 00:00:00', 234.30, 234.46, 235.10, '235.1', 234.60, -0.67, -0.29, 2072, 486110340, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1843, 'Au99.95', '2015-06-05 00:00:00', 235.00, 235.13, 235.51, '235.5', 235.27, -0.77, -0.33, 2694, 633826480, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1844, 'Au99.95', '2015-06-04 00:00:00', 235.17, 235.90, 237.15, '237', 236.21, -1.10, -0.46, 2410, 569277700, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1845, 'Au99.95', '2015-06-03 00:00:00', 237.00, 237.00, 238.00, '237.7', 237.55, -0.01, 0.00, 2090, 496482300, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1846, 'Au99.95', '2015-06-02 00:00:00', 236.75, 237.01, 237.20, '237.1', 236.93, 0.27, 0.11, 1914, 453500400, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1847, 'Au99.95', '2015-06-01 00:00:00', 236.70, 236.74, 237.78, '237.21', 237.39, 0.74, 0.31, 3364, 798606940, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1848, 'Au99.95', '2015-05-29 00:00:00', 236.00, 236.00, 247.15, '237', 237.22, -1.19, -0.50, 1850, 438871880, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1849, 'Au99.95', '2015-05-28 00:00:00', 237.10, 237.19, 237.60, '237.2', 237.31, -0.43, -0.18, 1862, 441872320, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1850, 'Au99.95', '2015-05-27 00:00:00', 237.35, 237.62, 238.70, '238.7', 237.68, -1.30, -0.54, 2022, 480608560, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1851, 'Au99.95', '2015-05-26 00:00:00', 238.80, 238.92, 240.99, '240.6', 240.61, -1.66, -0.69, 3504, 843125340, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1852, 'Au99.95', '2015-05-25 00:00:00', 240.40, 240.58, 240.69, '240.5', 240.49, -0.68, -0.28, 1496, 359783780, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1853, 'Au99.95', '2015-05-22 00:00:00', 240.50, 241.26, 241.55, '240.6', 240.86, -0.24, -0.10, 1922, 462937980, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1854, 'Au99.95', '2015-05-21 00:00:00', 241.45, 241.50, 242.05, '241.9', 241.73, 0.53, 0.22, 1488, 359696540, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1855, 'Au99.95', '2015-05-20 00:00:00', 231.70, 240.97, 243.65, '243.65', 241.09, -2.71, -1.11, 2790, 672641460, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1856, 'Au99.95', '2015-05-19 00:00:00', 243.40, 243.68, 244.80, '244.8', 243.77, -1.32, -0.54, 2522, 614802000, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1857, 'Au99.95', '2015-05-18 00:00:00', 243.75, 245.00, 245.80, '243.75', 244.62, 3.00, 1.24, 3004, 734846540, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1858, 'Au99.95', '2015-05-15 00:00:00', 242.00, 242.00, 243.80, '243', 243.16, -0.61, -0.25, 4506, 1094460320, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1859, 'Au99.95', '2015-05-14 00:00:00', 238.80, 242.61, 242.70, '238.8', 241.98, 4.07, 1.71, 3856, 933108000, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1860, 'Au99.95', '2015-05-13 00:00:00', 237.80, 238.54, 238.60, '237.8', 238.25, 1.71, 0.72, 5672, 1351869160, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1861, 'Au99.95', '2015-05-12 00:00:00', 236.30, 236.83, 237.50, '237.5', 236.63, -0.17, -0.07, 2820, 667320160, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1862, 'Au99.95', '2015-05-11 00:00:00', 236.80, 237.00, 237.80, '237.7', 237.58, -0.35, -0.15, 2462, 584946480, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1863, 'Au99.95', '2015-05-08 00:00:00', 236.30, 237.35, 237.50, '236.3', 236.74, 0.56, 0.24, 2122, 502366880, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1864, 'Au99.95', '2015-05-07 00:00:00', 236.50, 236.79, 238.80, '238.8', 237.37, -1.66, -0.70, 2366, 562003500, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1865, 'Au99.95', '2015-05-06 00:00:00', 238.45, 238.45, 239.05, '238.7', 238.78, 0.79, 0.33, 1304, 311380500, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1866, 'Au99.95', '2015-05-05 00:00:00', 237.00, 237.66, 237.85, '237.6', 237.58, 0.84, 0.36, 2044, 485624240, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1867, 'Au99.95', '2015-05-04 00:00:00', 236.30, 236.82, 237.10, '236.3', 236.88, -2.96, -1.23, 2070, 490349760, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1868, 'Au99.95', '2015-04-30 00:00:00', 239.60, 239.78, 241.21, '241.21', 240.39, -1.43, -0.59, 1948, 468289320, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1869, 'Au99.95', '2015-04-29 00:00:00', 240.00, 241.21, 241.80, '240', 241.42, 2.21, 0.93, 1472, 355375820, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1870, 'Au99.95', '2015-04-28 00:00:00', 237.00, 239.00, 240.20, '237', 239.99, 2.79, 1.18, 2432, 583659700, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1871, 'Au99.95', '2015-04-27 00:00:00', 235.70, 236.21, 236.45, '236', 236.18, -2.37, -0.99, 3952, 933421900, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1872, 'Au99.95', '2015-04-24 00:00:00', 237.75, 238.58, 238.65, '238', 237.99, 1.68, 0.71, 2426, 577370000, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1873, 'Au99.95', '2015-04-23 00:00:00', 236.50, 236.90, 237.60, '237.6', 237.00, -2.98, -1.24, 9456, 2524332300, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1874, 'Au99.95', '2015-04-22 00:00:00', 239.35, 239.88, 240.15, '239.5', 239.72, 1.53, 0.64, 10760, 2842946080, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1875, 'Au99.95', '2015-04-21 00:00:00', 238.35, 238.35, 239.30, '239.3', 238.63, -2.65, -1.10, 5222, 1246150800, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1876, 'Au99.95', '2015-04-20 00:00:00', 240.21, 241.00, 241.25, '240.21', 240.52, 0.98, 0.41, 3166, 761502660, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1877, 'Au99.95', '2015-04-17 00:00:00', 238.80, 240.02, 240.60, '240.6', 239.34, -0.32, -0.13, 2658, 636192180, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1878, 'Au99.95', '2015-04-16 00:00:00', 240.00, 240.34, 240.60, '240.55', 240.45, 2.57, 1.08, 18358, 4490609060, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1879, 'Au99.95', '2015-04-15 00:00:00', 237.50, 237.77, 239.15, '237.5', 238.43, -0.83, -0.35, 2860, 681931980, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1880, 'Au99.95', '2015-04-14 00:00:00', 238.30, 238.60, 240.30, '240.3', 239.66, -2.60, -1.08, 4584, 1098633620, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1881, 'Au99.95', '2015-04-13 00:00:00', 240.85, 241.20, 241.45, '241.3', 241.10, 2.40, 1.01, 3782, 911872560, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1882, 'Au99.95', '2015-04-10 00:00:00', 233.00, 238.80, 239.05, '233', 238.69, 0.09, 0.04, 4178, 997277720, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1883, 'Au99.95', '2015-04-09 00:00:00', 238.00, 238.71, 239.00, '238.9', 238.59, -3.00, -1.24, 4406, 1051267320, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1884, 'Au99.95', '2015-04-08 00:00:00', 240.50, 241.71, 241.75, '241', 241.27, 0.31, 0.13, 11730, 2899950320, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1885, 'Au99.95', '2015-04-07 00:00:00', 241.30, 241.40, 241.70, '241.69', 241.56, 2.11, 0.88, 3886, 940509360, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1886, 'Au99.95', '2015-04-03 00:00:00', 238.90, 239.29, 239.55, '238.99', 239.11, -1.41, -0.59, 2600, 621709580, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1887, 'Au99.95', '2015-04-02 00:00:00', 237.00, 240.70, 240.85, '237', 240.06, 4.20, 1.78, 3028, 726916000, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1888, 'Au99.95', '2015-04-01 00:00:00', 236.45, 236.50, 237.10, '236.8', 236.78, 0.80, 0.34, 2256, 534186420, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1889, 'Au99.95', '2015-03-31 00:00:00', 235.65, 235.70, 237.00, '237', 236.21, -1.44, -0.61, 30264, 7534789500, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1890, 'Au99.95', '2015-03-30 00:00:00', 236.80, 237.14, 239.50, '239.25', 238.37, -3.58, -1.49, 7588, 1808783700, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1891, 'Au99.95', '2015-03-27 00:00:00', 240.15, 240.72, 242.10, '242.1', 240.83, -0.05, -0.02, 2644, 636265660, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1892, 'Au99.95', '2015-03-26 00:00:00', 239.10, 240.77, 240.80, '239.2', 239.86, 2.71, 1.14, 2340, 561282600, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1893, 'Au99.95', '2015-03-25 00:00:00', 237.60, 238.06, 238.55, '238.55', 237.87, 0.30, 0.13, 4220, 1003847360, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1894, 'Au99.95', '2015-03-24 00:00:00', 237.30, 237.76, 238.05, '237.5', 237.69, 1.05, 0.44, 3764, 894685560, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1895, 'Au99.95', '2015-03-23 00:00:00', 235.20, 236.71, 236.90, '235.23', 236.37, 2.31, 0.99, 3116, 736541780, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1896, 'Au99.95', '2015-03-20 00:00:00', 233.60, 234.40, 234.92, '234.4', 234.09, -0.20, -0.09, 3272, 765959520, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1897, 'Au99.95', '2015-03-19 00:00:00', 231.20, 234.60, 235.60, '231.2', 234.77, 3.77, 1.63, 4484, 1052840340, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1898, 'Au99.95', '2015-03-18 00:00:00', 230.80, 230.83, 232.12, '232', 231.43, -2.30, -0.99, 6108, 1413589540, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1899, 'Au99.95', '2015-03-17 00:00:00', 232.71, 233.13, 233.90, '233.9', 233.18, -1.41, -0.60, 5794, 1351088460, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1900, 'Au99.95', '2015-03-16 00:00:00', 233.50, 234.54, 235.10, '233.5', 234.68, 0.49, 0.21, 4308, 1010628140, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1901, 'Au99.95', '2015-03-13 00:00:00', 233.50, 234.05, 234.60, '233.7', 234.30, -1.31, -0.56, 2808, 657939840, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1902, 'Au99.95', '2015-03-12 00:00:00', 232.50, 235.36, 235.48, '233', 233.38, 0.36, 0.15, 6050, 1411964020, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1903, 'Au99.95', '2015-03-11 00:00:00', 235.00, 235.00, 237.00, '237', 235.17, 0.10, 0.04, 4600, 1081794900, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1904, 'Au99.95', '2015-03-10 00:00:00', 234.20, 234.90, 236.35, '236.25', 235.10, -2.38, -1.00, 7296, 1725093220, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1905, 'Au99.95', '2015-03-09 00:00:00', 236.50, 237.28, 237.36, '236.7', 236.87, -4.59, -1.90, 7922, 1875949080, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1906, 'Au99.95', '2015-03-06 00:00:00', 241.60, 241.87, 242.25, '242', 242.04, -0.86, -0.35, 5070, 1227160240, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1907, 'Au99.95', '2015-03-05 00:00:00', 241.35, 242.73, 243.50, '243.5', 243.25, -1.10, -0.45, 3888, 945790440, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1908, 'Au99.95', '2015-03-04 00:00:00', 243.70, 243.83, 244.45, '243.95', 244.20, -1.08, -0.44, 2454, 599277640, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1909, 'Au99.95', '2015-03-03 00:00:00', 242.50, 244.91, 245.10, '244', 244.71, -2.19, -0.89, 4062, 994031200, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1910, 'Au99.95', '2015-03-02 00:00:00', 246.50, 247.10, 247.40, '246.5', 247.03, 2.50, 1.02, 4196, 1036570400, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1911, 'Au99.95', '2015-02-27 00:00:00', 244.50, 244.60, 245.00, '244.75', 244.74, 0.17, 0.07, 2226, 544800540, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1912, 'Au99.95', '2015-02-26 00:00:00', 243.40, 244.43, 244.79, '244', 244.12, -0.03, -0.01, 3266, 797327060, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1913, 'Au99.95', '2015-02-25 00:00:00', 244.10, 244.46, 244.55, '244.1', 244.38, -2.54, -1.03, 3256, 795708440, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1914, 'Au99.95', '2015-02-17 00:00:00', 247.00, 247.00, 248.49, '248.2', 247.68, -1.36, -0.55, 192, 47554800, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1915, 'Au99.95', '2015-02-16 00:00:00', 247.20, 248.36, 248.50, '247.5', 247.91, 0.78, 0.32, 5128, 1271287380, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1916, 'Au99.95', '2015-02-13 00:00:00', 246.10, 247.58, 247.60, '246.1', 246.92, 1.93, 0.79, 4592, 1138807740, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1917, 'Au99.95', '2015-02-12 00:00:00', 245.55, 245.65, 246.15, '246', 245.87, -3.15, -1.27, 4872, 1197907520, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1918, 'Au99.95', '2015-02-11 00:00:00', 238.95, 248.80, 249.20, '248.6', 248.97, -1.38, -0.55, 2408, 599534900, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1919, 'Au99.95', '2015-02-10 00:00:00', 249.60, 250.18, 250.50, '249.9', 250.08, 0.53, 0.21, 4398, 1099890700, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1920, 'Au99.95', '2015-02-09 00:00:00', 249.00, 249.65, 249.74, '249', 249.54, -5.23, -2.05, 4540, 1132933060, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1921, 'Au99.95', '2015-02-06 00:00:00', 254.00, 254.88, 255.00, '254.5', 254.66, -0.68, -0.27, 3452, 879112440, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1922, 'Au99.95', '2015-02-05 00:00:00', 255.00, 255.56, 256.60, '255', 256.17, 0.80, 0.31, 8748, 2255710560, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1923, 'Au99.95', '2015-02-04 00:00:00', 253.90, 254.76, 254.79, '254.6', 254.11, -3.34, -1.29, 19268, 4987810440, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1924, 'Au99.95', '2015-02-03 00:00:00', 256.50, 258.10, 258.80, '256.5', 257.09, 0.52, 0.20, 8886, 2284532980, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1925, 'Au99.95', '2015-02-02 00:00:00', 257.31, 257.58, 258.05, '257.45', 257.85, 3.49, 1.37, 5428, 1399856040, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1926, 'Au99.95', '2015-01-30 00:00:00', 253.10, 254.09, 254.10, '253.1', 253.62, -3.14, -1.22, 3880, 984054940, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1927, 'Au99.95', '2015-01-29 00:00:00', 257.10, 257.23, 258.45, '258.45', 257.75, -1.91, -0.74, 4062, 1047016400, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1928, 'Au99.95', '2015-01-28 00:00:00', 257.60, 259.14, 260.00, '257.7', 259.41, 1.25, 0.49, 4256, 1104087280, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1929, 'Au99.95', '2015-01-27 00:00:00', 256.80, 257.89, 258.70, '258.5', 257.55, -2.14, -0.82, 5964, 1536049340, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1930, 'Au99.95', '2015-01-26 00:00:00', 259.85, 260.03, 260.70, '259.99', 260.20, 0.39, 0.15, 6642, 1728269040, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1931, 'Au99.95', '2015-01-23 00:00:00', 259.20, 259.64, 260.10, '259.7', 259.76, 2.40, 0.93, 4756, 1235418840, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1932, 'Au99.95', '2015-01-22 00:00:00', 256.80, 257.24, 260.40, '260.4', 258.26, -3.01, -1.16, 4760, 1229359760, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1933, 'Au99.95', '2015-01-21 00:00:00', 258.90, 260.25, 261.05, '259', 260.07, 4.35, 1.70, 6200, 1612459520, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1934, 'Au99.95', '2015-01-20 00:00:00', 255.45, 255.90, 256.00, '255.5', 255.74, 0.24, 0.09, 4982, 1274260920, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1935, 'Au99.95', '2015-01-19 00:00:00', 252.50, 255.66, 256.00, '252.5', 255.67, 4.15, 1.65, 4786, 1223641880, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1936, 'Au99.95', '2015-01-16 00:00:00', 249.00, 251.51, 251.80, '249.3', 251.26, 6.37, 2.60, 5748, 1444260920, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1937, 'Au99.95', '2015-01-15 00:00:00', 240.10, 245.14, 247.00, '240.19', 245.41, -1.01, -0.41, 2680, 657708980, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1938, 'Au99.95', '2015-01-14 00:00:00', 245.00, 246.15, 248.00, '247.96', 245.59, -1.07, -0.43, 2938, 721543680, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1939, 'Au99.95', '2015-01-13 00:00:00', 244.80, 247.22, 247.59, '244.8', 247.07, 1.52, 0.62, 3668, 906255300, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1940, 'Au99.95', '2015-01-12 00:00:00', 244.60, 245.70, 246.00, '244.65', 245.35, 2.91, 1.20, 6292, 1543761220, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1941, 'Au99.95', '2015-01-09 00:00:00', 241.90, 242.79, 242.99, '241.9', 242.78, 0.27, 0.11, 5816, 1412011020, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1942, 'Au99.95', '2015-01-08 00:00:00', 242.12, 242.52, 243.35, '243.3', 242.71, -0.57, -0.23, 5340, 1296231300, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1943, 'Au99.95', '2015-01-07 00:00:00', 243.00, 243.09, 243.85, '243.5', 243.47, 0.79, 0.33, 5904, 1437456500, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1944, 'Au99.95', '2015-01-06 00:00:00', 241.35, 242.30, 242.50, '241.35', 241.87, 1.32, 0.55, 3350, 810269520, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1945, 'Au99.95', '2015-01-05 00:00:00', 238.80, 240.98, 241.00, '239', 239.74, 0.93, 0.39, 6256, 1499814820, '2023-06-29 10:38:09', '2023-06-29 13:26:07', 0);
INSERT INTO `trade` VALUES (1946, 'TEST', '2023-06-30 00:00:00', 100.00, 10000.00, 10000.00, '10', 100.00, 5050.00, 10.00, 1, 10000, '2023-06-30 11:12:35', '2023-06-30 12:51:12', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_account` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `user_avatar` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别（0：女；1：男）',
  `user_password` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_group_id` bigint NULL DEFAULT NULL COMMENT '用户组id',
  `is_using` tinyint NOT NULL DEFAULT 0 COMMENT '是否启用（0：否；1：是）',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_user_id`(`id` ASC) USING BTREE,
  INDEX `idx_user_user_account`(`user_account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '管理员', 'admin', '', 1, 'e559996f7d546db340035d754234ad22', 15, 1, '2023-06-02 13:16:47', '2023-07-25 10:48:48', 0);
INSERT INTO `user` VALUES (2, '用户', 'user', '', 1, 'e559996f7d546db340035d754234ad22', 15, 1, '2023-06-02 13:16:47', '2023-07-25 10:48:51', 0);
INSERT INTO `user` VALUES (3, '其他', 'other', '', 1, 'e559996f7d546db340035d754234ad22', 15, 1, '2023-06-02 13:16:47', '2023-07-25 10:48:55', 0);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父id',
  `group_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组名称',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_using` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用（0：否；1：是）',
  `group_sort` double NULL DEFAULT NULL COMMENT '用户组排序',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_group_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (15, 0, '系统', '', 1, 1, '2023-07-25 10:48:39', '2023-07-25 10:48:39', 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
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

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL,
  `cate_sort` int(11) NOT NULL DEFAULT '1',
  `cate_desc` varchar(100) DEFAULT NULL,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '单间', 1, '', 0, NULL, '2020-04-05 12:42:23', NULL, '2020-04-06 22:12:56');
INSERT INTO `category` VALUES (2, '大床房', 1, NULL, 0, NULL, '2020-04-05 12:42:39', NULL, '2020-04-05 12:42:39');
INSERT INTO `category` VALUES (3, '双人间', 1, NULL, 0, NULL, '2020-04-05 12:42:55', NULL, '2020-04-05 12:42:55');
INSERT INTO `category` VALUES (4, '三人间', 1, NULL, 0, NULL, '2020-04-05 12:43:01', NULL, '2020-04-05 12:43:01');
INSERT INTO `category` VALUES (5, '套房', 1, NULL, 0, NULL, '2020-04-05 12:43:04', NULL, '2020-04-05 12:43:04');
COMMIT;

-- ----------------------------
-- Table structure for clean
-- ----------------------------
DROP TABLE IF EXISTS `clean`;
CREATE TABLE `clean` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `post_title` varchar(255) DEFAULT NULL COMMENT '房间名称',
  `number` varchar(20) DEFAULT NULL COMMENT '房间号',
  `status` int(1) DEFAULT NULL COMMENT '状态：0待清洁，1正在清洁，2完成清洁',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `post_id` bigint(20) DEFAULT NULL COMMENT '房间ID',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of clean
-- ----------------------------
BEGIN;
INSERT INTO `clean` VALUES (1, '2021-01-27 00:15:43', '2021-01-27 00:32:26', 'admin', '张爱英阿姨', 0, '总统豪华套房', 'S101', 2, '2021-01-27 00:31:15', 1, '2021-01-27 00:30:52');
INSERT INTO `clean` VALUES (2, '2021-01-27 00:33:03', '2021-01-27 00:33:03', 'admin', '张爱英阿姨', 0, '海天大床房', 'S205', 2, '2021-01-27 00:33:45', NULL, '2021-01-27 00:33:41');
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) NOT NULL DEFAULT 'admin',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` double(11,0) DEFAULT '1',
  `target` varchar(20) DEFAULT '_self',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, '首页', '/admin', 'menu', 0, 'fa fa-dashboard', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-16 12:42:25', 1, '_self');
INSERT INTO `permission` VALUES (6, '获得侧边栏菜单', '/admin/currentMenus', 'button', 1, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:45:28', 6, '_self');
INSERT INTO `permission` VALUES (70, '客户管理', '/admin/user/customer', 'menu', 0, 'fa fa-users', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-04-08 01:14:49', 80, '_self');
INSERT INTO `permission` VALUES (72, '添加用户', '/admin/user/new', 'menu', 70, 'fa fa-circle-o', 1, 'admin', '2019-10-15 20:22:36', 'admin', '2020-04-07 00:09:37', 72, '_self');
INSERT INTO `permission` VALUES (73, '用户保存', '/admin/user/save', 'button', 70, NULL, 0, 'admin', '2019-10-15 20:22:36', 'admin', '2019-10-15 20:30:55', 73, '_self');
INSERT INTO `permission` VALUES (74, '删除用户', '/admin/user/delete', 'button', 70, NULL, 0, 'admin', '2019-10-15 20:22:36', 'admin', '2019-10-15 20:30:55', 74, '_self');
INSERT INTO `permission` VALUES (75, '批量删除用户', '/admin/user/batchDelete', 'button', 70, NULL, 0, 'admin', '2019-10-15 20:22:36', 'admin', '2019-10-15 20:30:55', 75, '_self');
INSERT INTO `permission` VALUES (76, '编辑用户', '/admin/user/edit', 'button', 70, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-16 13:27:24', 76, '_self');
INSERT INTO `permission` VALUES (82, '保存个人信息', '/admin/user/profile/save', 'button', 120, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:43:51', 82, '_self');
INSERT INTO `permission` VALUES (83, '修改密码', '/admin/user/changePass', 'button', 120, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:43:41', 83, '_self');
INSERT INTO `permission` VALUES (91, '角色管理', '/admin/role', 'menu', 0, 'fa fa-snowflake-o', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-16 12:52:05', 91, '_self');
INSERT INTO `permission` VALUES (92, '保存角色', '/admin/role/save', 'button', 91, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:53', 92, '_self');
INSERT INTO `permission` VALUES (93, '编辑角色', '/admin/role/edit', 'page', 91, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:58:40', 93, '_self');
INSERT INTO `permission` VALUES (94, '删除角色', '/admin/role/delete', 'button', 91, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:47', 94, '_self');
INSERT INTO `permission` VALUES (95, '权限管理', '/admin/permission', 'menu', 0, 'fa fa-podcast', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-03-12 15:08:17', 95, '_self');
INSERT INTO `permission` VALUES (96, '保存权限', '/admin/permission/save', 'button', 95, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:45', 96, '_self');
INSERT INTO `permission` VALUES (97, '编辑权限', '/admin/permission/edit', 'page', 95, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:57:13', 97, '_self');
INSERT INTO `permission` VALUES (98, '删除权限', '/admin/permission/delete', 'button', 95, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:43', 98, '_self');
INSERT INTO `permission` VALUES (106, '获得当前登录用户信息接口', '/admin/currentUser', 'button', 1, '', 0, 'admin', '2020-02-04 10:26:13', 'admin', '2020-02-07 23:37:08', 1, '_self');
INSERT INTO `permission` VALUES (110, '添加权限', '/admin/permission/new', 'menu', 95, 'fa fa-circle-o', 0, 'admin', '2020-02-07 23:14:11', 'admin', '2020-02-16 12:55:01', 1, '_self');
INSERT INTO `permission` VALUES (111, '添加角色', '/admin/role/new', 'menu', 91, 'fa fa-circle-o', 0, 'admin', '2020-02-07 23:19:05', 'admin', '2020-02-16 12:54:51', 1, '_self');
INSERT INTO `permission` VALUES (120, '个人信息', '/admin/user/profile', 'page', 0, '', 0, 'admin', '2020-02-07 23:38:51', 'admin', '2020-02-08 00:02:34', 99, '_self');
INSERT INTO `permission` VALUES (126, '客户列表', '/admin/user/customer', 'menu', 70, 'fa fa-circle-o', 1, 'admin', '2020-02-08 19:20:23', 'admin', '2020-04-08 01:20:27', 0, '_self');
INSERT INTO `permission` VALUES (127, '角色列表', '/admin/role', 'menu', 91, 'fa fa-circle-o', 0, 'admin', '2020-02-08 19:20:54', 'admin', '2020-02-16 12:54:47', 0, '_self');
INSERT INTO `permission` VALUES (128, '权限列表', '/admin/permission', 'menu', 95, 'fa fa-circle-o', 0, 'admin', '2020-02-08 19:21:16', 'admin', '2020-02-16 12:54:57', 0, '_self');
INSERT INTO `permission` VALUES (131, '客房管理', '/admin/post', 'menu', 0, 'fa fa-paint-brush', 0, 'admin', '2020-03-07 19:37:26', 'admin', '2020-04-06 16:32:16', 5, '_self');
INSERT INTO `permission` VALUES (132, '新增客房', '/admin/post/new', 'menu', 131, 'fa fa-circle-o', 0, 'admin', '2020-03-07 19:39:34', 'admin', '2020-04-06 16:32:39', 9, '_self');
INSERT INTO `permission` VALUES (133, '客房列表', '/admin/post', 'menu', 131, 'fa fa-circle-o', 0, 'admin', '2020-03-07 19:40:00', 'admin', '2020-04-06 16:32:28', 8, '_self');
INSERT INTO `permission` VALUES (134, '评论管理', '/admin/comment', 'menu', 0, 'fa fa-comment', 1, 'admin', '2020-03-07 19:46:32', 'admin', '2020-04-06 22:17:51', 11, '_self');
INSERT INTO `permission` VALUES (135, '回复我的', '/admin/comment/receive', 'menu', 134, 'fa fa-circle-o', 1, 'admin', '2020-03-07 19:57:53', 'admin', '2020-04-06 22:17:22', 20, '_self');
INSERT INTO `permission` VALUES (136, '我的评论', '/admin/comment/send', 'menu', 134, 'fa fa-circle-o', 1, 'admin', '2020-03-07 19:58:54', 'admin', '2020-04-06 22:17:26', 2, '_self');
INSERT INTO `permission` VALUES (137, '客房类型管理', '/admin/category', 'menu', 0, 'fa fa-book', 0, 'admin', '2020-03-07 20:00:57', 'admin', '2020-04-07 00:19:44', 6, '_self');
INSERT INTO `permission` VALUES (138, '类型列表', '/admin/category', 'menu', 137, 'fa fa-circle-o', 0, 'admin', '2020-03-07 20:01:36', 'admin', '2020-04-06 22:23:23', 1, '_self');
INSERT INTO `permission` VALUES (139, '新建类型', '/admin/category/new', 'menu', 137, 'fa fa-circle-o', 1, 'admin', '2020-03-07 20:02:14', 'admin', '2020-04-08 01:10:59', 1, '_self');
INSERT INTO `permission` VALUES (140, '删除客房', '/admin/post/delete', 'button', 133, '', 0, 'admin', '2020-03-08 15:02:20', 'admin', '2020-04-06 16:32:49', 1, '_self');
INSERT INTO `permission` VALUES (141, '批量删除客房', '/admin/post/batchDelete', 'button', 133, '', 0, 'admin', '2020-03-08 15:03:02', 'admin', '2020-04-06 16:32:58', 1, '_self');
INSERT INTO `permission` VALUES (142, '编辑客房信息', '/admin/post/edit', 'page', 133, '', 0, 'admin', '2020-03-08 15:03:49', 'admin', '2020-04-06 16:33:09', 1, '_self');
INSERT INTO `permission` VALUES (143, '保存客房', '/admin/post/save', 'button', 132, '', 0, 'admin', '2020-03-08 15:04:42', 'admin', '2020-04-07 00:21:39', 1, '_self');
INSERT INTO `permission` VALUES (144, '还原客房', '/admin/post/revert', 'button', 133, '', 0, 'admin', '2020-03-08 15:05:23', 'admin', '2020-04-07 00:21:25', 1, '_self');
INSERT INTO `permission` VALUES (145, '移到回收站', '/admin/post/throw', 'button', 133, '', 0, 'admin', '2020-03-08 15:07:01', 'admin', '2020-03-08 15:07:01', 1, '_self');
INSERT INTO `permission` VALUES (146, '文件上传', '/admin/file/upload', 'button', 132, '', 0, 'admin', '2020-03-08 17:53:01', 'admin', '2020-03-08 17:53:01', 1, '_self');
INSERT INTO `permission` VALUES (147, '保存类型', '/admin/category/save', 'button', 138, '', 0, 'admin', '2020-03-08 18:51:48', 'admin', '2020-04-08 01:10:35', 1, '_self');
INSERT INTO `permission` VALUES (148, '编辑类型', '/admin/category/edit', 'button', 138, '', 0, 'admin', '2020-03-08 18:52:27', 'admin', '2020-04-08 01:11:21', 1, '_self');
INSERT INTO `permission` VALUES (149, '删除类型', '/admin/category/delete', 'button', 138, '', 0, 'admin', '2020-03-08 18:54:13', 'admin', '2020-04-08 01:11:14', 1, '_self');
INSERT INTO `permission` VALUES (150, '订单管理', '/admin/order', 'menu', 0, 'fa fa-tag', 0, 'admin', '2020-03-08 19:19:59', 'admin', '2020-04-06 22:18:14', 8, '_self');
INSERT INTO `permission` VALUES (151, '订单列表', '/admin/order', 'menu', 150, '', 1, 'admin', '2020-03-08 19:30:16', 'admin', '2020-04-08 01:21:56', 1, '_self');
INSERT INTO `permission` VALUES (152, '删除订单', '/admin/order/delete', 'button', 150, '', 0, 'admin', '2020-03-08 19:32:56', 'admin', '2020-04-08 01:21:33', 1, '_self');
INSERT INTO `permission` VALUES (153, '所有评论', '/admin/comment', 'menu', 134, 'fa fa-circle-o', 1, 'admin', '2020-03-08 19:34:13', 'admin', '2020-04-06 22:17:48', 1, '_self');
INSERT INTO `permission` VALUES (154, '添加标签', '/admin/tag/new', 'menu', 150, '', 1, 'admin', '2020-03-08 19:42:31', 'admin', '2020-04-06 22:20:23', 1, '_self');
INSERT INTO `permission` VALUES (155, '完结订单', '/admin/order/finish', 'button', 150, '', 0, 'admin', '2020-03-08 19:43:06', 'admin', '2020-04-08 01:21:42', 1, '_self');
INSERT INTO `permission` VALUES (156, '保存标签', '/admin/tag/save', 'button', 154, '', 1, 'admin', '2020-03-08 19:44:45', 'admin', '2020-04-06 22:20:19', 1, '_self');
INSERT INTO `permission` VALUES (157, '删除评论', '/admin/comment/delete', 'button', 153, '', 1, 'admin', '2020-03-08 22:13:57', 'admin', '2020-04-06 22:17:43', 1, '_self');
INSERT INTO `permission` VALUES (158, '批量删除评论', '/admin/comment/batchDelete', 'button', 153, '', 1, 'admin', '2020-03-08 22:15:57', 'admin', '2020-04-06 22:17:36', 1, '_self');
INSERT INTO `permission` VALUES (159, '后台回复评论', '/admin/comment/reply', 'button', 153, '', 1, 'admin', '2020-03-08 22:27:39', 'admin', '2020-04-06 22:17:31', 1, '_self');
INSERT INTO `permission` VALUES (160, '置顶文章', '/admin/post/stick', 'button', 133, '', 1, 'admin', '2020-04-03 22:54:45', 'admin', '2020-04-07 00:21:45', 1, '_self');
INSERT INTO `permission` VALUES (161, '取消置顶文章', '/admin/post/unStick', 'button', 133, '', 1, 'admin', '2020-04-03 22:55:22', 'admin', '2020-04-07 00:19:59', 1, '_self');
INSERT INTO `permission` VALUES (162, '推荐文章', '/admin/post/recommend', 'button', 133, '', 1, 'admin', '2020-04-03 22:55:49', 'admin', '2020-04-07 00:21:51', 1, '_self');
INSERT INTO `permission` VALUES (163, '取消置顶文章', '/admin/post/unRecommend', 'button', 133, '', 1, 'admin', '2020-04-03 22:56:16', 'admin', '2020-04-07 00:19:54', 1, '_self');
INSERT INTO `permission` VALUES (164, '工作人员管理', '/admin/user/worker', 'menu', 0, 'fa fa-user', 0, 'admin', '2020-04-07 00:01:50', 'admin', '2020-04-08 01:14:21', 85, '_self');
INSERT INTO `permission` VALUES (165, '工作人员列表', '/admin/user/worker', 'menu', 164, 'fa fa-circle-o', 1, 'admin', '2020-04-07 00:09:20', 'admin', '2020-04-08 01:21:06', 1, '_self');
INSERT INTO `permission` VALUES (166, '新增工作人员', '/admin/user/new', 'menu', 164, 'fa fa-circle-o', 1, 'admin', '2020-04-07 00:10:01', 'admin', '2020-04-08 01:20:45', 1, '_self');
INSERT INTO `permission` VALUES (167, '财务管理', '/admin/order/finance', 'menu', 0, 'fa fa-money', 0, 'admin', '2020-04-07 00:12:17', 'admin', '2020-04-08 00:26:36', 88, '_self');
INSERT INTO `permission` VALUES (168, '关闭订单', '/admin/order/close', 'button', 150, '', 0, 'admin', '2020-04-07 23:01:44', 'admin', '2020-04-08 01:21:27', 1, '_self');
INSERT INTO `permission` VALUES (169, '获得当前登录用户角色接口', '/admin/currentRole', 'button', 1, '', 0, 'admin', '2020-04-07 23:02:23', 'admin', '2020-04-07 23:02:23', 1, '_self');
INSERT INTO `permission` VALUES (170, '添加工作人员', '/admin/user/new', 'button', 164, '', 0, 'admin', '2020-05-10 13:21:23', 'admin', '2020-05-10 13:21:23', 1, '_self');
INSERT INTO `permission` VALUES (171, '前台人员管理', '/admin/user/worker', 'menu', 164, 'fa fa-circle-o', 0, 'admin', '2021-01-26 23:22:16', 'admin', '2021-01-26 23:22:16', 1, '_self');
INSERT INTO `permission` VALUES (172, '清洁人员管理', '/admin/user/cleaner', 'menu', 164, 'fa fa-circle-o', 0, 'admin', '2021-01-26 23:22:51', 'admin', '2021-01-26 23:22:51', 2, '_self');
INSERT INTO `permission` VALUES (173, '客房清洁管理', '/admin/clean', 'menu', 0, 'fa fa-leaf', 0, 'admin', '2021-01-26 23:37:10', 'admin', '2021-01-26 23:37:10', 87, '_self');
INSERT INTO `permission` VALUES (174, '完成清洁', '/admin/clean/finish', 'button', 173, '', 0, 'admin', '2021-01-26 23:37:54', 'admin', '2021-01-26 23:37:54', 1, '_self');
INSERT INTO `permission` VALUES (175, '清洁删除', '/admin/clean/delete', 'button', 173, '', 0, 'admin', '2021-01-26 23:38:21', 'admin', '2021-01-26 23:38:21', 1, '_self');
INSERT INTO `permission` VALUES (176, '完成清洁', '/admin/clean/finish', 'button', 173, '', 1, 'admin', '2021-01-27 00:25:26', 'admin', '2021-01-27 00:26:32', 1, '_self');
INSERT INTO `permission` VALUES (177, '开始清洁', '/admin/clean/start', 'button', 173, '', 0, 'admin', '2021-01-27 00:25:40', 'admin', '2021-01-27 00:25:40', 1, '_self');
INSERT INTO `permission` VALUES (178, '删除清洁记录', '/admin/clean/delete', 'button', 173, '', 1, 'admin', '2021-01-27 00:25:57', 'admin', '2021-01-27 00:27:21', 1, '_self');
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_status` int(11) NOT NULL,
  `post_summary` varchar(2000) NOT NULL,
  `post_thumbnail` varchar(255) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `number` varchar(100) NOT NULL,
  `img_url` varchar(1000) NOT NULL,
  `post_editor` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES (1, 3, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list1.jpg', '美式风格商务间', 400, '2020-03-12 18:10:56', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'N201', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (2, 3, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list2.jpg', '意大利风格标准间', 300, '2020-03-12 18:12:21', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'N202', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (3, 5, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list3.jpg', '总统套房', 900, '2020-03-12 18:13:52', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'N203', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (4, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list4.jpg', '法国风格大床房', 399, '2020-03-12 18:15:41', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'N204', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (5, 5, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list5.jpg', '豪华套房', 700, '2020-03-12 18:17:24', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'N205', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (6, 4, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list6.jpg', '标准三人间', 300, '2020-03-12 18:20:02', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'N206', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (7, 3, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list7.jpg', '商务标准间', 400, '2020-03-12 18:20:51', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S201', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (8, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list8.jpg', '贵族大床房', 300, '2020-03-12 18:21:57', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S202', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (9, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list9.jpg', '情侣大床房', 200, '2020-03-12 18:23:16', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S203', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (10, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list9.jpg', '经济单人间', 120, '2020-03-12 18:24:02', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S204', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (11, 2, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list2.jpg', '海天大床房', 200, '2020-03-30 18:25:04', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S205', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (12, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list9.jpg', '经济单人间', 120, '2020-03-12 18:24:02', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S204', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (13, 2, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list2.jpg', '海天大床房', 200, '2020-03-30 18:25:04', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S205', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (14, 3, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list7.jpg', '商务标准间', 400, '2020-03-12 18:20:51', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S201', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (15, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list8.jpg', '贵族大床房', 300, '2020-03-12 18:21:57', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S202', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (16, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list9.jpg', '情侣大床房', 200, '2020-03-12 18:23:16', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S203', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (17, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list9.jpg', '经济单人间', 120, '2020-03-12 18:24:02', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S204', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (18, 2, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list2.jpg', '海天大床房', 200, '2020-03-30 18:25:04', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S205', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (19, 1, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list9.jpg', '经济单人间', 120, '2020-03-12 18:24:02', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S204', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (20, 2, '酒店位于上海豫园景区内，地理位置得天独厚。步行10分钟即可到达南京东路步行街，领略中华第一街购物魅力。酒店出行交通极为便捷，外滩、陆家嘴、新天地、人民广场、经典景区均近在咫尺。.', 0, '酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体。', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/room-list/list2.jpg', '海天大床房', 200, '2020-03-30 18:25:04', '2020-10-24 14:22:25', 'admin', 'admin', 0, 'S205', 'https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg,https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"https://oss.liuyanzhao.com/static/hotel/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
COMMIT;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `record_date` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of record
-- ----------------------------
BEGIN;
INSERT INTO `record` VALUES (1, 18, 11, '2020-04-06', '2020-04-06 15:36:05', '2020-05-10 13:18:35', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (2, 18, 9, '2020-04-06', '2020-04-06 15:38:20', '2020-05-10 13:18:35', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (3, 18, 10, '2020-04-06', '2020-04-06 16:08:38', '2020-05-10 13:18:35', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (4, 18, 8, '2020-04-06', '2020-04-06 16:10:53', '2020-05-10 13:18:35', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (5, 18, 7, '2020-04-06', '2020-04-06 16:11:35', '2020-05-10 13:18:35', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (6, 18, 5, '2020-04-06', '2020-04-06 16:28:31', '2020-05-10 13:18:35', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (7, 19, 13, '2020-04-07', '2020-04-07 22:41:32', '2020-04-07 22:41:32', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (8, 18, 11, '2020-04-07', '2020-04-07 23:24:45', '2020-04-07 23:41:20', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (9, 18, 10, '2020-04-07', '2020-04-07 23:28:39', '2020-04-07 23:41:09', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (10, 18, 12, '2020-04-07', '2020-04-07 23:32:44', '2020-04-07 23:37:13', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (11, 18, 3, '2020-04-07', '2020-04-07 23:33:01', '2020-04-07 23:36:57', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (12, 18, 6, '2020-04-07', '2020-04-07 23:33:18', '2020-04-07 23:36:07', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (13, 18, 8, '2020-04-07', '2020-04-07 23:33:36', '2020-04-07 23:40:37', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (14, 20, 13, '2020-04-09', '2020-04-08 00:45:09', '2021-01-26 23:31:25', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (15, 19, 7, '2020-04-08', '2020-04-08 01:04:01', '2020-04-08 01:04:01', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (16, 3, 13, '2020-09-24', '2020-09-24 21:31:39', '2020-09-24 21:31:39', 'admin', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(1) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_register_default` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'admin', '管理员', 10, 0, NULL, '2020-02-05 18:54:23', NULL, '2020-03-08 13:31:39', 0);
INSERT INTO `role` VALUES (2, 'customer', '客户', 1, 0, NULL, '2020-02-05 18:54:29', NULL, '2020-04-06 23:54:28', 1);
INSERT INTO `role` VALUES (3, 'worker', '前台', 5, 0, NULL, '2020-04-06 23:51:27', NULL, '2021-01-26 23:53:12', 0);
INSERT INTO `role` VALUES (4, 'cleaner', '保洁阿姨', 2, 0, NULL, '2021-01-26 23:05:55', NULL, '2021-01-26 23:53:04', 0);
COMMIT;

-- ----------------------------
-- Table structure for role_permission_ref
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_ref`;
CREATE TABLE `role_permission_ref` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2415 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_permission_ref
-- ----------------------------
BEGIN;
INSERT INTO `role_permission_ref` VALUES (5, 1, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 565);
INSERT INTO `role_permission_ref` VALUES (5, 6, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 569);
INSERT INTO `role_permission_ref` VALUES (5, 70, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 618);
INSERT INTO `role_permission_ref` VALUES (5, 76, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 621);
INSERT INTO `role_permission_ref` VALUES (5, 91, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 626);
INSERT INTO `role_permission_ref` VALUES (5, 93, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 627);
INSERT INTO `role_permission_ref` VALUES (5, 95, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 628);
INSERT INTO `role_permission_ref` VALUES (5, 97, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 629);
INSERT INTO `role_permission_ref` VALUES (14, 1, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 861);
INSERT INTO `role_permission_ref` VALUES (14, 6, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 865);
INSERT INTO `role_permission_ref` VALUES (14, 106, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 867);
INSERT INTO `role_permission_ref` VALUES (14, 70, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 878);
INSERT INTO `role_permission_ref` VALUES (14, 73, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 881);
INSERT INTO `role_permission_ref` VALUES (14, 74, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 882);
INSERT INTO `role_permission_ref` VALUES (14, 75, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 883);
INSERT INTO `role_permission_ref` VALUES (14, 76, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 884);
INSERT INTO `role_permission_ref` VALUES (14, 82, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 890);
INSERT INTO `role_permission_ref` VALUES (14, 83, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 891);
INSERT INTO `role_permission_ref` VALUES (14, 91, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 895);
INSERT INTO `role_permission_ref` VALUES (14, 92, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 896);
INSERT INTO `role_permission_ref` VALUES (14, 93, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 897);
INSERT INTO `role_permission_ref` VALUES (14, 94, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 898);
INSERT INTO `role_permission_ref` VALUES (14, 95, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 899);
INSERT INTO `role_permission_ref` VALUES (14, 96, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 900);
INSERT INTO `role_permission_ref` VALUES (14, 97, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 901);
INSERT INTO `role_permission_ref` VALUES (14, 98, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 902);
INSERT INTO `role_permission_ref` VALUES (15, 1, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 903);
INSERT INTO `role_permission_ref` VALUES (15, 6, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 907);
INSERT INTO `role_permission_ref` VALUES (15, 106, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 909);
INSERT INTO `role_permission_ref` VALUES (15, 70, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 920);
INSERT INTO `role_permission_ref` VALUES (15, 73, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 923);
INSERT INTO `role_permission_ref` VALUES (15, 74, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 924);
INSERT INTO `role_permission_ref` VALUES (15, 75, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 925);
INSERT INTO `role_permission_ref` VALUES (15, 76, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 926);
INSERT INTO `role_permission_ref` VALUES (15, 82, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 932);
INSERT INTO `role_permission_ref` VALUES (15, 83, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 933);
INSERT INTO `role_permission_ref` VALUES (15, 91, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 937);
INSERT INTO `role_permission_ref` VALUES (15, 92, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 938);
INSERT INTO `role_permission_ref` VALUES (15, 93, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 939);
INSERT INTO `role_permission_ref` VALUES (15, 94, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 940);
INSERT INTO `role_permission_ref` VALUES (15, 95, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 941);
INSERT INTO `role_permission_ref` VALUES (15, 96, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 942);
INSERT INTO `role_permission_ref` VALUES (15, 97, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 943);
INSERT INTO `role_permission_ref` VALUES (15, 98, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 944);
INSERT INTO `role_permission_ref` VALUES (16, 1, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 945);
INSERT INTO `role_permission_ref` VALUES (16, 6, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 949);
INSERT INTO `role_permission_ref` VALUES (16, 106, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 951);
INSERT INTO `role_permission_ref` VALUES (16, 70, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 962);
INSERT INTO `role_permission_ref` VALUES (16, 73, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 965);
INSERT INTO `role_permission_ref` VALUES (16, 74, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 966);
INSERT INTO `role_permission_ref` VALUES (16, 75, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 967);
INSERT INTO `role_permission_ref` VALUES (16, 76, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 968);
INSERT INTO `role_permission_ref` VALUES (16, 82, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 974);
INSERT INTO `role_permission_ref` VALUES (16, 83, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 975);
INSERT INTO `role_permission_ref` VALUES (16, 91, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 979);
INSERT INTO `role_permission_ref` VALUES (16, 92, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 980);
INSERT INTO `role_permission_ref` VALUES (16, 93, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 981);
INSERT INTO `role_permission_ref` VALUES (16, 94, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 982);
INSERT INTO `role_permission_ref` VALUES (16, 95, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 983);
INSERT INTO `role_permission_ref` VALUES (16, 96, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 984);
INSERT INTO `role_permission_ref` VALUES (16, 97, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 985);
INSERT INTO `role_permission_ref` VALUES (16, 98, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 986);
INSERT INTO `role_permission_ref` VALUES (13, 1, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1177);
INSERT INTO `role_permission_ref` VALUES (13, 106, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1178);
INSERT INTO `role_permission_ref` VALUES (13, 6, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1179);
INSERT INTO `role_permission_ref` VALUES (13, 70, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1181);
INSERT INTO `role_permission_ref` VALUES (13, 73, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1183);
INSERT INTO `role_permission_ref` VALUES (13, 74, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1184);
INSERT INTO `role_permission_ref` VALUES (13, 75, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1185);
INSERT INTO `role_permission_ref` VALUES (13, 76, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1186);
INSERT INTO `role_permission_ref` VALUES (13, 120, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1187);
INSERT INTO `role_permission_ref` VALUES (13, 82, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1188);
INSERT INTO `role_permission_ref` VALUES (13, 83, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1189);
INSERT INTO `role_permission_ref` VALUES (17, 1, 0, NULL, '2020-02-08 18:47:20', NULL, '2020-02-08 18:47:20', 1230);
INSERT INTO `role_permission_ref` VALUES (18, 1, 0, NULL, '2020-02-08 18:47:41', NULL, '2020-02-08 18:47:41', 1231);
INSERT INTO `role_permission_ref` VALUES (2, 1, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2043);
INSERT INTO `role_permission_ref` VALUES (2, 106, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2044);
INSERT INTO `role_permission_ref` VALUES (2, 169, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2045);
INSERT INTO `role_permission_ref` VALUES (2, 6, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2046);
INSERT INTO `role_permission_ref` VALUES (2, 150, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2047);
INSERT INTO `role_permission_ref` VALUES (2, 120, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2049);
INSERT INTO `role_permission_ref` VALUES (2, 82, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2050);
INSERT INTO `role_permission_ref` VALUES (2, 83, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2051);
INSERT INTO `role_permission_ref` VALUES (1, 1, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2311);
INSERT INTO `role_permission_ref` VALUES (1, 106, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2312);
INSERT INTO `role_permission_ref` VALUES (1, 169, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2313);
INSERT INTO `role_permission_ref` VALUES (1, 6, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2314);
INSERT INTO `role_permission_ref` VALUES (1, 131, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2315);
INSERT INTO `role_permission_ref` VALUES (1, 133, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2316);
INSERT INTO `role_permission_ref` VALUES (1, 140, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2317);
INSERT INTO `role_permission_ref` VALUES (1, 141, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2318);
INSERT INTO `role_permission_ref` VALUES (1, 142, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2319);
INSERT INTO `role_permission_ref` VALUES (1, 144, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2320);
INSERT INTO `role_permission_ref` VALUES (1, 145, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2321);
INSERT INTO `role_permission_ref` VALUES (1, 132, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2322);
INSERT INTO `role_permission_ref` VALUES (1, 143, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2323);
INSERT INTO `role_permission_ref` VALUES (1, 146, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2324);
INSERT INTO `role_permission_ref` VALUES (1, 137, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2325);
INSERT INTO `role_permission_ref` VALUES (1, 138, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2326);
INSERT INTO `role_permission_ref` VALUES (1, 147, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2327);
INSERT INTO `role_permission_ref` VALUES (1, 148, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2328);
INSERT INTO `role_permission_ref` VALUES (1, 149, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2329);
INSERT INTO `role_permission_ref` VALUES (1, 150, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2330);
INSERT INTO `role_permission_ref` VALUES (1, 152, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2331);
INSERT INTO `role_permission_ref` VALUES (1, 155, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2332);
INSERT INTO `role_permission_ref` VALUES (1, 168, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2333);
INSERT INTO `role_permission_ref` VALUES (1, 70, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2334);
INSERT INTO `role_permission_ref` VALUES (1, 73, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2335);
INSERT INTO `role_permission_ref` VALUES (1, 74, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2336);
INSERT INTO `role_permission_ref` VALUES (1, 75, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2337);
INSERT INTO `role_permission_ref` VALUES (1, 76, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2338);
INSERT INTO `role_permission_ref` VALUES (1, 164, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2339);
INSERT INTO `role_permission_ref` VALUES (1, 170, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2340);
INSERT INTO `role_permission_ref` VALUES (1, 171, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2341);
INSERT INTO `role_permission_ref` VALUES (1, 172, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2342);
INSERT INTO `role_permission_ref` VALUES (1, 173, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2343);
INSERT INTO `role_permission_ref` VALUES (1, 174, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2344);
INSERT INTO `role_permission_ref` VALUES (1, 175, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2345);
INSERT INTO `role_permission_ref` VALUES (1, 177, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2347);
INSERT INTO `role_permission_ref` VALUES (1, 167, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2349);
INSERT INTO `role_permission_ref` VALUES (1, 91, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2350);
INSERT INTO `role_permission_ref` VALUES (1, 127, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2351);
INSERT INTO `role_permission_ref` VALUES (1, 111, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2352);
INSERT INTO `role_permission_ref` VALUES (1, 92, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2353);
INSERT INTO `role_permission_ref` VALUES (1, 93, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2354);
INSERT INTO `role_permission_ref` VALUES (1, 94, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2355);
INSERT INTO `role_permission_ref` VALUES (1, 95, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2356);
INSERT INTO `role_permission_ref` VALUES (1, 128, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2357);
INSERT INTO `role_permission_ref` VALUES (1, 110, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2358);
INSERT INTO `role_permission_ref` VALUES (1, 96, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2359);
INSERT INTO `role_permission_ref` VALUES (1, 97, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2360);
INSERT INTO `role_permission_ref` VALUES (1, 98, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2361);
INSERT INTO `role_permission_ref` VALUES (1, 120, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2362);
INSERT INTO `role_permission_ref` VALUES (1, 82, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2363);
INSERT INTO `role_permission_ref` VALUES (1, 83, 0, NULL, '2021-01-27 00:26:06', NULL, '2021-01-27 00:26:06', 2364);
INSERT INTO `role_permission_ref` VALUES (4, 1, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2384);
INSERT INTO `role_permission_ref` VALUES (4, 106, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2385);
INSERT INTO `role_permission_ref` VALUES (4, 169, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2386);
INSERT INTO `role_permission_ref` VALUES (4, 6, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2387);
INSERT INTO `role_permission_ref` VALUES (4, 173, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2388);
INSERT INTO `role_permission_ref` VALUES (4, 174, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2389);
INSERT INTO `role_permission_ref` VALUES (4, 177, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2390);
INSERT INTO `role_permission_ref` VALUES (4, 120, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2391);
INSERT INTO `role_permission_ref` VALUES (4, 82, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2392);
INSERT INTO `role_permission_ref` VALUES (4, 83, 0, NULL, '2021-01-27 00:27:10', NULL, '2021-01-27 00:27:10', 2393);
INSERT INTO `role_permission_ref` VALUES (3, 1, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2394);
INSERT INTO `role_permission_ref` VALUES (3, 106, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2395);
INSERT INTO `role_permission_ref` VALUES (3, 169, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2396);
INSERT INTO `role_permission_ref` VALUES (3, 6, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2397);
INSERT INTO `role_permission_ref` VALUES (3, 150, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2398);
INSERT INTO `role_permission_ref` VALUES (3, 152, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2399);
INSERT INTO `role_permission_ref` VALUES (3, 155, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2400);
INSERT INTO `role_permission_ref` VALUES (3, 168, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2401);
INSERT INTO `role_permission_ref` VALUES (3, 70, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2402);
INSERT INTO `role_permission_ref` VALUES (3, 73, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2403);
INSERT INTO `role_permission_ref` VALUES (3, 74, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2404);
INSERT INTO `role_permission_ref` VALUES (3, 75, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2405);
INSERT INTO `role_permission_ref` VALUES (3, 76, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2406);
INSERT INTO `role_permission_ref` VALUES (3, 173, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2407);
INSERT INTO `role_permission_ref` VALUES (3, 174, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2408);
INSERT INTO `role_permission_ref` VALUES (3, 175, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2409);
INSERT INTO `role_permission_ref` VALUES (3, 177, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2410);
INSERT INTO `role_permission_ref` VALUES (3, 167, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2411);
INSERT INTO `role_permission_ref` VALUES (3, 120, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2412);
INSERT INTO `role_permission_ref` VALUES (3, 82, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2413);
INSERT INTO `role_permission_ref` VALUES (3, 83, 0, NULL, '2021-01-27 00:27:32', NULL, '2021-01-27 00:27:32', 2414);
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` int(1) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `post_number` varchar(20) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (1, 18, 11, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 15:36:05', '2020-05-10 13:18:35', 'admin', 'admin', 1, 300, 300, 'S205', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (2, 18, 9, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 15:38:20', '2020-05-10 13:18:35', 'admin', 'admin', 1, 200, 200, 'S203', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (3, 18, 10, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:08:38', '2020-05-10 13:18:35', 'admin', 'admin', 1, 400, 400, 'S204', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (4, 18, 8, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:10:53', '2020-05-10 13:18:35', 'admin', 'admin', 1, 500, 500, 'S202', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (5, 18, 7, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:11:35', '2020-05-10 13:18:35', 'admin', 'admin', 1, 400, 400, 'S201', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (6, 18, 5, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:28:31', '2020-05-10 13:18:35', 'admin', 'admin', 1, 200, 200, 'N205', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (7, 19, 13, '2020-04-07', 1, '张三', 1, '123123123123123', '33333333333', '2020-04-07 22:41:33', '2020-04-07 22:41:33', 'admin', 'admin', 0, 300, 300, 'S209', '贵族大床房');
INSERT INTO `t_order` VALUES (8, 18, 11, '2020-04-07', 1, '周瑜', 1, '123456789012345671', '22222222222', '2020-04-07 23:24:46', '2020-04-07 23:41:20', 'admin', 'admin', 1, 200, 200, 'S205', '海天大床房');
INSERT INTO `t_order` VALUES (9, 18, 10, '2020-04-07', 1, '周瑜', 3, '123456789012345671', '22222222222', '2020-04-07 23:28:40', '2020-05-10 13:18:35', 'admin', 'admin', 1, 120, 120, 'S204', '经济单人间');
INSERT INTO `t_order` VALUES (10, 18, 12, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:32:45', '2020-04-07 23:40:47', 'admin', 'admin', 1, 788, 788, '301', '枫丹白露套房');
INSERT INTO `t_order` VALUES (11, 18, 3, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:33:02', '2020-04-07 23:40:54', 'admin', 'admin', 1, 900, 900, 'N203', '总统套房');
INSERT INTO `t_order` VALUES (12, 18, 6, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:33:18', '2020-04-07 23:40:41', 'admin', 'admin', 1, 300, 300, 'N206', '标准三人间');
INSERT INTO `t_order` VALUES (13, 18, 8, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:33:37', '2020-04-07 23:40:37', 'admin', 'admin', 1, 300, 300, 'S202', '贵族大床房');
INSERT INTO `t_order` VALUES (14, 20, 13, '2020-04-09', 1, '马云222', 2, '111111111111111199', '12312311111', '2020-04-08 00:45:10', '2020-04-08 01:05:56', 'admin', 'admin', 0, 300, 300, 'S209', '贵族大床房');
INSERT INTO `t_order` VALUES (15, 19, 7, '2020-04-08', 1, '张三', 2, '123123123123123', '33333333333', '2020-04-08 01:04:02', '2020-04-08 01:04:02', 'admin', 'admin', 0, 400, 400, 'S201', '商务标准间');
INSERT INTO `t_order` VALUES (16, 3, 13, '2020-09-24', 1, '张三', 2, '121113@qq.com', '', '2020-09-24 21:31:40', '2020-09-24 21:31:40', 'admin', 'admin', 0, 300, 300, 'S209', '贵族大床房');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_last` datetime DEFAULT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_desc` varchar(255) DEFAULT NULL,
  `user_display_name` varchar(255) DEFAULT NULL,
  `id_card` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '2020-04-04 11:13:50', '/static/images/avatar/2.jpeg', '人生得意须尽欢', '管理员', '123456789012345679', 'admin', 'a021a665f503979c06f50b8de66a4218', 0, '2019-01-24 00:07:33', '2021-01-27 00:35:02', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (2, NULL, '/static/images/avatar/2.jpeg', '11', '马云', '123@qq.com', 'mayun', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-05 17:37:43', '2021-01-27 00:34:58', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (3, '2020-04-03 21:42:44', '/static/images/avatar/2.jpeg', '', '张三', '121113@qq.com', 'zhangsan', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 13:22:22', '2021-01-27 00:35:00', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (4, '2020-02-16 12:57:48', '/static/images/avatar/2.jpeg', '', '李四', 'lisi@qq.com', 'lisi', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 13:57:51', '2021-01-27 00:35:01', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (5, NULL, '/static/images/avatar/2.jpeg', '1111', '11', '12111113@qq.com', '111111', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 18:48:20', '2021-01-27 00:35:19', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (6, '2020-02-08 18:54:29', '/static/images/avatar/2.jpeg', '', '黄忠', '1231111@qq.com', 'huang', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 18:54:21', '2021-01-27 00:35:18', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (7, '2020-03-08 14:21:48', '/static/images/avatar/2.jpeg', '', 'mayun2', '123456@mayun.com', 'mayun2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-08 14:21:05', '2021-01-27 00:35:06', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (8, '2020-03-09 16:21:31', '/static/images/avatar/2.jpeg', NULL, 'mahuateng', '111@qq.com', 'mahuateng', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-09 13:24:42', '2021-01-27 00:35:14', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (9, '2020-03-14 15:20:43', '/static/images/avatar/2.jpeg', NULL, 'zhaoyun', '847064370@qq.com', 'zhaoyun', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:27:11', '2021-01-27 00:35:08', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (10, '2020-03-11 21:41:01', '/static/images/avatar/2.jpeg', NULL, 'wangwu', 'wangwu@qq.com', 'wangwu', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:38:51', '2021-01-27 00:35:12', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (11, NULL, '/static/images/avatar/2.jpeg', NULL, 'wangwu2', '1234562@mayun.com', 'wangwu2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:40:54', '2021-01-27 00:35:10', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (12, '2020-03-11 21:42:04', '/static/images/avatar/2.jpeg', NULL, 'zhangfei', '123456@zhang.com', 'zhangfei', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:41:55', '2021-01-27 00:35:08', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (13, '2020-03-11 21:44:48', '/static/images/avatar/2.jpeg', NULL, 'liubei', '123@qqq.com', 'liubei', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:42:51', '2021-01-27 00:35:17', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (14, NULL, '/static/images/avatar/2.jpeg', NULL, 'liubei2', '123456@m22ayun.com', 'liubei2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:44:44', '2021-01-27 00:35:07', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (16, '2020-03-12 18:19:01', '/static/images/avatar/2.jpeg', NULL, 'lisi', 'lisi@qq.com', 'lisi', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-12 18:18:57', '2021-01-27 00:35:14', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (17, NULL, '/static/images/avatar/2.jpeg', NULL, '马云', '123456789012345678', '15779216424', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-05 23:18:01', '2021-01-27 00:35:13', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (18, NULL, '/static/images/avatar/2.jpeg', '', '周瑜', '123456789012345671', '22222222222', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-05 23:18:41', '2021-01-27 00:35:18', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (19, NULL, '/static/images/avatar/2.jpeg', NULL, '张三', '123123123123123', '33333333333', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-07 00:28:15', '2021-01-27 00:35:10', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (20, NULL, '/static/images/avatar/2.jpeg', '', '马云222', '111111111111111199', '12312311111', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-08 00:44:44', '2021-01-27 00:35:12', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (21, NULL, '/static/images/avatar/2.jpeg', '', '1111', '111111111123121212', '12312312333', 'a021a665f503979c06f50b8de66a4218', 0, '2020-05-10 13:22:12', '2021-01-27 00:35:09', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (22, NULL, '/static/images/avatar/2.jpeg', '', '1212', '121212121212121212', '12121212121', 'a021a665f503979c06f50b8de66a4218', 0, '2020-05-11 20:23:00', '2021-01-27 00:35:09', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (23, NULL, '/static/images/avatar/2.jpeg', '', '张三丰', '121212121221234123', '12121212122', 'a021a665f503979c06f50b8de66a4218', 0, '2020-05-11 20:28:33', '2021-01-27 00:35:13', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (24, NULL, '/static/images/avatar/30.jpeg', '清洁人员', '张爱英阿姨', '123123123122129', '13512341234', 'a021a665f503979c06f50b8de66a4218', 0, '2021-01-26 23:39:56', '2021-01-26 23:39:56', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (25, NULL, '/static/images/avatar/31.jpeg', '清洁人员', '李爱云阿姨', '123123123122120', '13512341202', 'a021a665f503979c06f50b8de66a4218', 0, '2021-01-26 23:41:26', '2021-01-26 23:41:26', 'admin', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_role_ref`;
CREATE TABLE `user_role_ref` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_role_ref
-- ----------------------------
BEGIN;
INSERT INTO `user_role_ref` VALUES (2, 2, 0, NULL, '2020-02-05 17:37:43', NULL, '2020-02-05 17:37:43', 2);
INSERT INTO `user_role_ref` VALUES (1, 1, 0, NULL, '2020-02-08 13:56:55', NULL, '2020-02-08 13:56:55', 4);
INSERT INTO `user_role_ref` VALUES (3, 2, 0, NULL, '2020-02-08 18:53:44', NULL, '2020-02-08 18:53:44', 10);
INSERT INTO `user_role_ref` VALUES (10, 2, 0, NULL, '2020-03-11 21:38:51', NULL, '2020-03-11 21:38:51', 14);
INSERT INTO `user_role_ref` VALUES (11, 2, 0, NULL, '2020-03-11 21:40:54', NULL, '2020-03-11 21:40:54', 15);
INSERT INTO `user_role_ref` VALUES (12, 2, 0, NULL, '2020-03-11 21:41:56', NULL, '2020-03-11 21:41:56', 16);
INSERT INTO `user_role_ref` VALUES (13, 2, 0, NULL, '2020-03-11 21:42:51', NULL, '2020-03-11 21:42:51', 17);
INSERT INTO `user_role_ref` VALUES (14, 2, 0, NULL, '2020-03-11 21:44:44', NULL, '2020-03-11 21:44:44', 18);
INSERT INTO `user_role_ref` VALUES (16, 2, 0, NULL, '2020-03-12 18:18:57', NULL, '2020-03-12 18:18:57', 19);
INSERT INTO `user_role_ref` VALUES (17, 2, 0, NULL, '2020-04-05 23:18:01', NULL, '2020-04-05 23:18:01', 20);
INSERT INTO `user_role_ref` VALUES (19, 2, 0, NULL, '2020-04-07 00:28:15', NULL, '2020-04-07 00:28:15', 24);
INSERT INTO `user_role_ref` VALUES (20, 2, 0, NULL, '2020-04-08 00:44:44', NULL, '2020-04-08 00:44:44', 25);
INSERT INTO `user_role_ref` VALUES (21, 3, 0, NULL, '2020-05-10 13:22:12', NULL, '2020-05-10 13:22:12', 26);
INSERT INTO `user_role_ref` VALUES (22, 3, 0, NULL, '2020-05-11 20:23:00', NULL, '2021-01-26 23:46:04', 27);
INSERT INTO `user_role_ref` VALUES (23, 3, 0, NULL, '2020-05-11 20:28:33', NULL, '2021-01-26 23:46:03', 28);
INSERT INTO `user_role_ref` VALUES (24, 4, 0, NULL, '2021-01-26 23:46:03', NULL, '2021-01-26 23:47:32', 29);
INSERT INTO `user_role_ref` VALUES (25, 4, 0, NULL, '2021-01-26 23:46:03', NULL, '2021-01-26 23:46:03', 30);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

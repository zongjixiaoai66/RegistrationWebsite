/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t002`;
CREATE DATABASE IF NOT EXISTS `t002` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t002`;

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `classes`;
INSERT INTO `classes` (`id`, `name`, `remark`) VALUES
	(1, '电子信息工程1班', '大一'),
	(2, '11', '11');

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `userid` int DEFAULT NULL COMMENT '留言用户id',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '留言用户',
  `reply_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复给',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `comment`;
INSERT INTO `comment` (`id`, `name`, `content`, `create_time`, `pid`, `userid`, `user`, `reply_user`) VALUES
	(29, '管理员的留言', 'hello', '2023-03-13 10:16:59', NULL, 1, '管理员', NULL),
	(30, '管理员的留言', 'shoudao', '2023-03-13 10:17:05', 29, 1, '管理员', '管理员'),
	(31, '管理员的留言', '111', '2023-03-13 10:17:09', 29, 1, '管理员', '管理员'),
	(32, '张三的留言', '图书馆怎么走', '2023-03-14 10:51:50', NULL, 27, '张三', NULL),
	(36, '王五的留言', '错误', '2023-03-14 12:34:44', 32, 28, '王五', '张三'),
	(37, '王五的留言', '往北走22宿舍方法2', '2023-03-14 12:36:32', 32, 28, '王五', '张三'),
	(38, '管理员的留言', '111666', '2023-03-14 12:38:59', 29, 26, '管理员', '管理员'),
	(42, '王五的留言', '12322', '2023-03-14 12:46:43', NULL, 28, '王五', NULL),
	(43, '王五的留言', '世界和平', '2023-03-14 12:48:52', 32, 28, '王五', '王五'),
	(44, '王五的留言', '11211111212单独', '2023-03-14 13:04:00', 29, 28, '王五', '管理员'),
	(46, '辅导员的留言', '12', '2023-03-14 14:55:06', 29, 33, '辅导员', '管理员'),
	(48, '王五的留言', '111', '2023-03-14 18:29:55', 42, 28, '王五', '王五'),
	(50, '李四的留言', '图书馆怎么走，知道了', '2023-03-14 19:41:54', NULL, 50, '李四', NULL),
	(51, '李四的留言', '你好吗', '2023-03-15 20:55:56', NULL, 50, '李四', NULL),
	(53, 'student1的留言', '我好', '2023-03-15 21:08:59', 51, 52, 'student1', '李四'),
	(54, '管理员的留言', '666', '2023-12-04 13:41:29', NULL, 26, '管理员', NULL),
	(55, '管理员的留言', '111', '2023-12-04 13:41:34', 54, 26, '管理员', '管理员'),
	(56, '2222', NULL, '2023-12-04 13:41:46', NULL, 26, '管理员', NULL),
	(57, '管理员的留言', '88888', '2023-12-04 13:42:49', NULL, 26, '管理员', NULL),
	(58, '管理员的留言', '9999', '2023-12-04 13:42:53', 57, 26, '管理员', '管理员'),
	(59, '6767767666666', NULL, '2023-12-04 13:43:06', NULL, 26, '管理员', NULL),
	(60, '11的留言', '111', '2023-12-04 13:44:05', NULL, 10, '11', NULL);

DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE IF NOT EXISTS `dormitory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍地点',
  `total` int DEFAULT NULL COMMENT '住宿人数限制',
  `existtotal` int DEFAULT '0' COMMENT '已住宿人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `dormitory`;
INSERT INTO `dormitory` (`id`, `address`, `total`, `existtotal`) VALUES
	(1, 'A101-5楼-501', 2, 1),
	(2, 'A102栋-4楼-409', 11, 3);

DROP TABLE IF EXISTS `dormrepair`;
CREATE TABLE IF NOT EXISTS `dormrepair` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '问题',
  `repairstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '待审核' COMMENT '报修状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报修宿舍地址',
  `dormid` int DEFAULT NULL COMMENT '宿舍id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `dormrepair`;
INSERT INTO `dormrepair` (`id`, `userid`, `username`, `content`, `repairstatus`, `address`, `dormid`) VALUES
	(9, 50, 'lisi', '灯泡坏了', '维修中', 'A101-5楼-501', NULL);

DROP TABLE IF EXISTS `schoolintroduce`;
CREATE TABLE IF NOT EXISTS `schoolintroduce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startschool` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入学须知',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校简介',
  `schoolsite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校园风光',
  `schoolzixun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校园咨询',
  `map` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '校园地图',
  `fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '缴费链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `schoolintroduce`;
INSERT INTO `schoolintroduce` (`id`, `startschool`, `introduce`, `schoolsite`, `schoolzixun`, `map`, `fee`) VALUES
	(1, '121', '12', '12', '12111', '12111', '12'),
	(2, '不要迟到', '重点大学', '环境优美', '治安好+', '高德地图', 'www.baidu.com');

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `secondcollege` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '二级学院名称',
  `subjectname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业名称',
  `goal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '培养目标',
  `grantacademic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授予学位',
  `coursesetting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程设置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='专业表';

DELETE FROM `subject`;
INSERT INTO `subject` (`id`, `secondcollege`, `subjectname`, `goal`, `grantacademic`, `coursesetting`) VALUES
	(1, '信息学院', '电子信息工程', '专业人才', '本科', '电子信息，数电，模电'),
	(2, '信息工程学院', '汽车专业', '研究生', '研究生', '汽车');

DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_dict`;
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES
	(1, 'user', 'el-icon-user', 'icon'),
	(2, 'house', 'el-icon-house', 'icon'),
	(3, 'menu', 'el-icon-menu', 'icon'),
	(4, 's-custom', 'el-icon-s-custom', 'icon'),
	(5, 's-grid', 'el-icon-s-grid', 'icon'),
	(6, 'document', 'el-icon-document', 'icon'),
	(7, 'coffee', 'el-icon-coffee\r\n', 'icon'),
	(8, 's-marketing', 'el-icon-s-marketing', 'icon'),
	(9, 'phone-outline', 'el-icon-phone-outline', 'icon'),
	(10, 'platform-eleme', 'el-icon-platform-eleme', 'icon'),
	(11, 'eleme', 'el-icon-eleme', 'icon'),
	(12, 'delete-solid', 'el-icon-delete-solid', 'icon'),
	(13, 'delete', 'el-icon-delete', 'icon'),
	(14, 's-tools', 'el-icon-s-tools', 'icon'),
	(15, 'setting', 'el-icon-setting', 'icon'),
	(16, 'user-solid', 'el-icon-user-solid', 'icon'),
	(17, 'phone', 'el-icon-phone', 'icon'),
	(18, 'more', 'el-icon-more', 'icon'),
	(19, 'more-outline', 'el-icon-more-outline', 'icon'),
	(20, 'star-on', 'el-icon-star-on', 'icon'),
	(21, 'star-off', 'el-icon-star-off', 'icon'),
	(22, 's-goods', 'el-icon-s-goods', 'icon'),
	(23, 'goods', 'el-icon-goods', 'icon'),
	(24, 'warning', 'el-icon-warning', 'icon'),
	(25, 'warning-outline', 'el-icon-warning-outline', 'icon'),
	(26, 'question', 'el-icon-question', 'icon'),
	(27, 'info', 'el-icon-info', 'icon'),
	(28, 'remove', 'el-icon-remove', 'icon'),
	(29, 'circle-plus', 'el-icon-circle-plus', 'icon'),
	(30, 'success', 'el-icon-success', 'icon'),
	(31, 'error', 'el-icon-error', 'icon'),
	(32, 'zoom-in', 'el-icon-zoom-in', 'icon'),
	(33, 'zoom-out', 'el-icon-zoom-out', 'icon'),
	(34, 'remove-outline', 'el-icon-remove-outline', 'icon'),
	(35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon'),
	(36, 'circle-check', 'el-icon-circle-check', 'icon'),
	(37, 'circle-close', 'el-icon-circle-close', 'icon'),
	(38, 's-help', 'el-icon-s-help', 'icon'),
	(39, 'help', 'el-icon-help', 'icon'),
	(40, 'minus', 'el-icon-minus', 'icon'),
	(41, 'plus', 'el-icon-plus', 'icon'),
	(42, 'check', 'el-icon-check', 'icon'),
	(43, 'close', 'el-icon-close', 'icon'),
	(44, 'picture', 'el-icon-picture', 'icon'),
	(45, 'picture-outline', 'el-icon-picture-outline', 'icon'),
	(46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon'),
	(47, 'upload', 'el-icon-upload', 'icon'),
	(48, 'upload2', 'el-icon-upload2', 'icon'),
	(49, 'download', 'el-icon-download', 'icon'),
	(50, 'camera-solid', 'el-icon-camera-solid', 'icon'),
	(51, 'camera', 'el-icon-camera', 'icon'),
	(52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon'),
	(53, 'video-camera', 'el-icon-video-camera', 'icon'),
	(54, 'message-solid', 'el-icon-message-solid', 'icon'),
	(55, 'bell', 'el-icon-bell', 'icon'),
	(56, 's-cooperation', 'el-icon-s-cooperation', 'icon'),
	(57, 's-order', 'el-icon-s-order', 'icon'),
	(58, 's-platform', 'el-icon-s-platform', 'icon'),
	(59, 's-fold', 'el-icon-s-fold', 'icon'),
	(60, 's-unfold', 'el-icon-s-unfold', 'icon'),
	(61, 's-operation', 'el-icon-s-operation', 'icon'),
	(62, 's-promotion', 'el-icon-s-promotion', 'icon'),
	(63, 's-home', 'el-icon-s-home', 'icon'),
	(64, 's-release', 'el-icon-s-release', 'icon'),
	(65, 's-ticket', 'el-icon-s-ticket', 'icon'),
	(66, 's-management', 'el-icon-s-management', 'icon'),
	(67, 's-open', 'el-icon-s-open', 'icon'),
	(68, 's-shop', 'el-icon-s-shop', 'icon'),
	(69, 's-flag', 'el-icon-s-flag', 'icon'),
	(70, 's-comment', 'el-icon-s-comment', 'icon'),
	(71, 's-finance', 'el-icon-s-finance', 'icon'),
	(72, 's-claim', 'el-icon-s-claim', 'icon'),
	(73, 's-opportunity', 'el-icon-s-opportunity', 'icon'),
	(74, 's-data', 'el-icon-s-data', 'icon'),
	(75, 's-check', 'el-icon-s-check', 'icon'),
	(76, 'share', 'el-icon-share', 'icon'),
	(77, 'd-caret', 'el-icon-d-caret', 'icon'),
	(78, 'caret-left', 'el-icon-caret-left', 'icon'),
	(79, 'caret-right', 'el-icon-caret-right', 'icon'),
	(80, 'caret-bottom', 'el-icon-caret-bottom', 'icon'),
	(81, 'caret-top', 'el-icon-caret-top', 'icon'),
	(82, 'bottom-left', 'el-icon-bottom-left', 'icon'),
	(83, 'bottom-right', 'el-icon-bottom-right', 'icon'),
	(84, 'back', 'el-icon-back', 'icon'),
	(85, 'right', 'el-icon-right', 'icon'),
	(86, 'bottom', 'el-icon-bottom', 'icon'),
	(87, 'top', 'el-icon-top', 'icon'),
	(88, 'top-left', 'el-icon-top-left', 'icon'),
	(89, 'top-right', 'el-icon-top-right', 'icon'),
	(90, 'arrow-left', 'el-icon-arrow-left', 'icon'),
	(91, 'arrow-right', 'el-icon-arrow-right', 'icon'),
	(92, 'arrow-down', 'el-icon-arrow-down', 'icon'),
	(93, 'arrow-up', 'el-icon-arrow-up', 'icon'),
	(94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon'),
	(95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon'),
	(96, 'video-pause', 'el-icon-video-pause', 'icon'),
	(97, 'video-play', 'el-icon-video-play', 'icon'),
	(98, 'refresh', 'el-icon-refresh', 'icon'),
	(99, 'refresh-right', 'el-icon-refresh-right', 'icon'),
	(100, 'refresh-left', 'el-icon-refresh-left', 'icon'),
	(101, 'finished', 'el-icon-finished', 'icon'),
	(102, 'sort', 'el-icon-sort', 'icon'),
	(103, 'sort-up', 'el-icon-sort-up', 'icon'),
	(104, 'sort-down', 'el-icon-sort-down', 'icon'),
	(105, 'rank', 'el-icon-rank', 'icon'),
	(106, 'loading', 'el-icon-loading', 'icon'),
	(107, 'view', 'el-icon-view', 'icon'),
	(108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon'),
	(109, 'date', 'el-icon-date', 'icon'),
	(110, 'edit', 'el-icon-edit', 'icon'),
	(111, 'edit-outline', 'el-icon-edit-outline', 'icon'),
	(112, 'folder', 'el-icon-folder', 'icon'),
	(113, 'folder-opened', 'el-icon-folder-opened', 'icon'),
	(114, 'folder-add', 'el-icon-folder-add', 'icon'),
	(115, 'folder-remove', 'el-icon-folder-remove', 'icon'),
	(116, 'folder-delete', 'el-icon-folder-delete', 'icon'),
	(117, 'folder-checked', 'el-icon-folder-checked', 'icon'),
	(118, 'tickets', 'el-icon-tickets', 'icon'),
	(119, 'document-remove', 'el-icon-document-remove', 'icon'),
	(120, 'document-delete', 'el-icon-document-delete', 'icon'),
	(121, 'document-copy', 'el-icon-document-copy', 'icon'),
	(122, 'document-checked', 'el-icon-document-checked', 'icon'),
	(123, 'document-add', 'el-icon-document-add', 'icon'),
	(124, 'printer', 'el-icon-printer', 'icon'),
	(125, 'paperclip', 'el-icon-paperclip', 'icon'),
	(126, 'takeaway-box', 'el-icon-takeaway-box', 'icon'),
	(127, 'search', 'el-icon-search', 'icon'),
	(128, 'monitor', 'el-icon-monitor', 'icon'),
	(129, 'attract', 'el-icon-attract', 'icon'),
	(130, 'mobile', 'el-icon-mobile', 'icon'),
	(131, 'scissors', 'el-icon-scissors', 'icon'),
	(132, 'umbrella', 'el-icon-umbrella', 'icon'),
	(133, 'headset', 'el-icon-headset', 'icon'),
	(134, 'brush', 'el-icon-brush', 'icon'),
	(135, 'mouse', 'el-icon-mouse', 'icon'),
	(136, 'coordinate', 'el-icon-coordinate', 'icon'),
	(137, 'magic-stick', 'el-icon-magic-stick', 'icon'),
	(138, 'reading', 'el-icon-reading', 'icon'),
	(139, 'data-line', 'el-icon-data-line', 'icon'),
	(140, 'data-board', 'el-icon-data-board', 'icon'),
	(141, 'pie-chart', 'el-icon-pie-chart', 'icon'),
	(142, 'data-analysis', 'el-icon-data-analysis', 'icon'),
	(143, 'collection-tag', 'el-icon-collection-tag', 'icon'),
	(144, 'film', 'el-icon-film', 'icon'),
	(145, 'suitcase', 'el-icon-suitcase', 'icon'),
	(146, 'suitcase-1', 'el-icon-suitcase-1', 'icon'),
	(147, 'receiving', 'el-icon-receiving', 'icon'),
	(148, 'collection', 'el-icon-collection', 'icon'),
	(149, 'files', 'el-icon-files', 'icon'),
	(150, 'notebook-1', 'el-icon-notebook-1', 'icon'),
	(151, 'notebook-2', 'el-icon-notebook-2', 'icon'),
	(152, 'toilet-paper', 'el-icon-toilet-paper', 'icon'),
	(153, 'office-building', 'el-icon-office-building', 'icon'),
	(154, 'school', 'el-icon-school', 'icon'),
	(155, 'table-lamp', 'el-icon-table-lamp', 'icon'),
	(156, 'no-smoking', 'el-icon-no-smoking', 'icon'),
	(157, 'smoking', 'el-icon-smoking', 'icon'),
	(158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon'),
	(159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon'),
	(160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon'),
	(161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon'),
	(162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon'),
	(163, 'sold-out', 'el-icon-sold-out', 'icon'),
	(164, 'sell', 'el-icon-sell', 'icon'),
	(165, 'present', 'el-icon-present', 'icon'),
	(166, 'box', 'el-icon-box', 'icon'),
	(167, 'bank-card', 'el-icon-bank-card', 'icon'),
	(168, 'money', 'el-icon-money', 'icon'),
	(169, 'coin', 'el-icon-coin', 'icon'),
	(170, 'wallet', 'el-icon-wallet', 'icon'),
	(171, 'discount', 'el-icon-discount', 'icon'),
	(172, 'price-tag', 'el-icon-price-tag', 'icon'),
	(173, 'news', 'el-icon-news', 'icon'),
	(174, 'guide', 'el-icon-guide', 'icon'),
	(175, 'male', 'el-icon-male', 'icon'),
	(176, 'female', 'el-icon-female', 'icon'),
	(177, 'thumb', 'el-icon-thumb', 'icon'),
	(178, 'cpu', 'el-icon-cpu', 'icon'),
	(179, 'link', 'el-icon-link', 'icon'),
	(180, 'connection', 'el-icon-connection', 'icon'),
	(181, 'open', 'el-icon-open', 'icon'),
	(182, 'turn-off', 'el-icon-turn-off', 'icon'),
	(183, 'set-up', 'el-icon-set-up', 'icon'),
	(184, 'chat-round', 'el-icon-chat-round', 'icon'),
	(185, 'chat-line-round', 'el-icon-chat-line-round', 'icon'),
	(186, 'chat-square', 'el-icon-chat-square', 'icon'),
	(187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon'),
	(188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon'),
	(189, 'chat-line-square', 'el-icon-chat-line-square', 'icon'),
	(190, 'message', 'el-icon-message', 'icon'),
	(191, 'postcard', 'el-icon-postcard', 'icon'),
	(192, 'position', 'el-icon-position', 'icon'),
	(193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon'),
	(194, 'microphone', 'el-icon-microphone', 'icon'),
	(195, 'close-notification', 'el-icon-close-notification', 'icon'),
	(196, 'bangzhu', 'el-icon-bangzhu', 'icon'),
	(197, 'time', 'el-icon-time', 'icon'),
	(198, 'odometer', 'el-icon-odometer', 'icon'),
	(199, 'crop', 'el-icon-crop', 'icon'),
	(200, 'aim', 'el-icon-aim', 'icon'),
	(201, 'switch-button', 'el-icon-switch-button', 'icon'),
	(202, 'full-screen', 'el-icon-full-screen', 'icon'),
	(203, 'copy-document', 'el-icon-copy-document', 'icon'),
	(204, 'mic', 'el-icon-mic', 'icon'),
	(205, 'stopwatch', 'el-icon-stopwatch', 'icon'),
	(206, 'medal-1', 'el-icon-medal-1', 'icon'),
	(207, 'medal', 'el-icon-medal', 'icon'),
	(208, 'trophy', 'el-icon-trophy', 'icon'),
	(209, 'trophy-1', 'el-icon-trophy-1', 'icon'),
	(210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon'),
	(211, 'discover', 'el-icon-discover', 'icon'),
	(212, 'place', 'el-icon-place', 'icon'),
	(213, 'location', 'el-icon-location', 'icon'),
	(214, 'location-outline', 'el-icon-location-outline', 'icon'),
	(215, 'location-information', 'el-icon-location-information', 'icon'),
	(216, 'add-location', 'el-icon-add-location', 'icon'),
	(217, 'delete-location', 'el-icon-delete-location', 'icon'),
	(218, 'map-location', 'el-icon-map-location', 'icon'),
	(219, 'alarm-clock', 'el-icon-alarm-clock', 'icon'),
	(220, 'timer', 'el-icon-timer', 'icon'),
	(221, 'watch-1', 'el-icon-watch-1', 'icon'),
	(222, 'watch', 'el-icon-watch', 'icon'),
	(223, 'lock', 'el-icon-lock', 'icon'),
	(224, 'unlock', 'el-icon-unlock', 'icon'),
	(225, 'key', 'el-icon-key', 'icon'),
	(226, 'service', 'el-icon-service', 'icon'),
	(227, 'mobile-phone', 'el-icon-mobile-phone', 'icon'),
	(228, 'bicycle', 'el-icon-bicycle', 'icon'),
	(229, 'truck', 'el-icon-truck', 'icon'),
	(230, 'ship', 'el-icon-ship', 'icon'),
	(231, 'basketball', 'el-icon-basketball', 'icon'),
	(232, 'football', 'el-icon-football', 'icon'),
	(233, 'soccer', 'el-icon-soccer', 'icon'),
	(234, 'baseball', 'el-icon-baseball', 'icon'),
	(235, 'wind-power', 'el-icon-wind-power', 'icon'),
	(236, 'light-rain', 'el-icon-light-rain', 'icon'),
	(237, 'lightning', 'el-icon-lightning', 'icon'),
	(238, 'heavy-rain', 'el-icon-heavy-rain', 'icon'),
	(239, 'sunrise', 'el-icon-sunrise', 'icon'),
	(240, 'sunrise-1', 'el-icon-sunrise-1', 'icon'),
	(241, 'sunset', 'el-icon-sunset', 'icon'),
	(242, 'sunny', 'el-icon-sunny', 'icon'),
	(243, 'cloudy', 'el-icon-cloudy', 'icon'),
	(244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon'),
	(245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon'),
	(246, 'moon', 'el-icon-moon', 'icon'),
	(247, 'moon-night', 'el-icon-moon-night', 'icon'),
	(248, 'dish', 'el-icon-dish', 'icon'),
	(249, 'dish-1', 'el-icon-dish-1', 'icon'),
	(250, 'food', 'el-icon-food', 'icon'),
	(251, 'chicken', 'el-icon-chicken', 'icon'),
	(252, 'fork-spoon', 'el-icon-fork-spoon', 'icon'),
	(253, 'knife-fork', 'el-icon-knife-fork', 'icon'),
	(254, 'burger', 'el-icon-burger', 'icon'),
	(255, 'tableware', 'el-icon-tableware', 'icon'),
	(256, 'sugar', 'el-icon-sugar', 'icon'),
	(257, 'dessert', 'el-icon-dessert', 'icon'),
	(258, 'ice-cream', 'el-icon-ice-cream', 'icon'),
	(259, 'hot-water', 'el-icon-hot-water', 'icon'),
	(260, 'water-cup', 'el-icon-water-cup', 'icon'),
	(261, 'coffee-cup', 'el-icon-coffee-cup', 'icon'),
	(262, 'cold-drink', 'el-icon-cold-drink', 'icon'),
	(263, 'goblet', 'el-icon-goblet', 'icon'),
	(264, 'goblet-full', 'el-icon-goblet-full', 'icon'),
	(265, 'goblet-square', 'el-icon-goblet-square', 'icon'),
	(266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon'),
	(267, 'refrigerator', 'el-icon-refrigerator', 'icon'),
	(268, 'grape', 'el-icon-grape', 'icon'),
	(269, 'watermelon', 'el-icon-watermelon', 'icon'),
	(270, 'cherry', 'el-icon-cherry', 'icon'),
	(271, 'apple', 'el-icon-apple', 'icon'),
	(272, 'pear', 'el-icon-pear', 'icon'),
	(273, 'orange', 'el-icon-orange', 'icon'),
	(274, 'ice-tea', 'el-icon-ice-tea', 'icon'),
	(275, 'ice-drink', 'el-icon-ice-drink', 'icon'),
	(276, 'milk-tea', 'el-icon-milk-tea', 'icon'),
	(277, 'potato-strips', 'el-icon-potato-strips', 'icon'),
	(278, 'lollipop', 'el-icon-lollipop', 'icon'),
	(279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon'),
	(280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_file`;

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_menu`;
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES
	(4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 9999),
	(5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301),
	(6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302),
	(7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303),
	(10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0),
	(11, '在线交流', '/comments', 'el-icon-menu', NULL, NULL, 'Comments', 1),
	(12, '留言管理', '/comment', 'el-icon-menu', NULL, NULL, 'Comment', 12),
	(13, '校园概况管理', '/schoolintroduce', 'el-icon-menu', NULL, NULL, 'Schoolintroduce', 999),
	(14, '专业管理', '/subject', 'el-icon-menu', NULL, NULL, 'Subject', 999),
	(15, '新生到校报道管理', '/arriveschool', 'el-icon-menu', NULL, NULL, 'Arriveschool', 999),
	(16, '班级管理', '/classes', 'el-icon-menu', NULL, NULL, 'Classes', 999),
	(17, '宿舍分配管理', '/dorm', 'el-icon-menu', NULL, NULL, 'Dorm', 22),
	(18, '学生管理', '/student', 'el-icon-user', NULL, NULL, 'Student', 2),
	(19, '辅导员管理', '/teacher', 'el-icon-menu', NULL, NULL, 'Teacher', 14),
	(20, '宿舍报修管理', '/dormrepair', 'el-icon-menu', NULL, NULL, 'Dormrepair', 999),
	(23, '宿舍管理', '/dormitory', 'el-icon-menu', NULL, NULL, 'Dormitory', 999);

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_role`;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES
	(1, '管理员', '管理员', 'ROLE_ADMIN'),
	(2, '学生', '普通用户', 'ROLE_USER'),
	(3, '辅导员', '辅导员', 'ROLE_TEACHER');

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

DELETE FROM `sys_role_menu`;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 23),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 15),
	(3, 18);

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `cardnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `isdorm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '未住宿' COMMENT '是否住宿',
  `dormaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住宿地址',
  `dormid` int DEFAULT NULL COMMENT '宿舍id',
  `classid` int DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_user`;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`, `cardnumber`, `isdorm`, `dormaddress`, `dormid`, `classid`) VALUES
	(10, 'student', '123456', '11', '11', '111', '11', '2023-03-13 08:05:27', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '1111', '未住宿', '', NULL, NULL),
	(26, 'admin', '123456', '管理员', 'admin@qq.com', '13988997788', '安徽合肥111', '2023-03-13 08:39:11', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_ADMIN', '12222222222222222222', '未住宿', NULL, NULL, NULL),
	(27, 'zhang', '123456', '张三', 'zhang@qq.com', '13677889900', '南京', '2023-03-13 08:39:11', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '1222222222222222222222222222222', '未住宿', '', NULL, NULL),
	(28, 'wang', '123456', '王五', 'wang@qq.com', '13877668855', '上海', '2023-03-13 08:39:11', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '1222222222222331231', '未住宿', '', NULL, NULL),
	(33, 'teacher', '123456', '辅导员1', '1231@qq.com', '1231231', '12121', '2023-03-14 06:54:50', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_TEACHER', '33018212121212', '未住宿', NULL, NULL, 1),
	(50, 'lisi', '123456', '李四1', '12312@qq.com', '1871281122', '北京市', '2023-03-14 11:37:57', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '3309812312312121', '已住宿', 'A102栋-4楼-409', 2, NULL),
	(51, 'zhaoli', '123456', 'zhaoli', NULL, NULL, NULL, '2023-03-15 12:56:48', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', NULL, '已住宿', 'A101-5楼-501', 1, NULL),
	(52, 'student1', '123456', 'student1', NULL, NULL, '123', '2023-03-15 13:08:23', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', NULL, '已住宿', '', 1, NULL),
	(53, '111', '123456', '11', '11', '11', '11', '2023-03-24 11:25:19', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', NULL, '未住宿', NULL, NULL, NULL),
	(54, '11', '123456', '11', NULL, NULL, NULL, '2023-03-24 11:25:50', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', NULL, '未住宿', NULL, NULL, 2),
	(55, '11', '123456', '11', '11', '11', '11', '2023-03-24 11:56:55', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '11', '未住宿', NULL, NULL, NULL),
	(56, '111', '123456', '111', '111', '11', '11', '2023-03-24 12:07:43', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '111', '未住宿', NULL, NULL, 2),
	(57, 'www', '123456', '123', '123', '123', '121', '2023-03-24 12:43:24', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', '11', '未住宿', NULL, NULL, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

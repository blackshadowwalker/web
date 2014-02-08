/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.252
Source Server Version : 50513
Source Host           : 10.168.1.252:3306
Source Database       : ssh2

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2014-01-28 10:50:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dept_info`
-- ----------------------------
DROP TABLE IF EXISTS `dept_info`;
CREATE TABLE `dept_info` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `dept_manager` int(10) DEFAULT NULL COMMENT '上级部门',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dept_info
-- ----------------------------
INSERT INTO dept_info VALUES ('44', '总部', null, '2014-01-23 11:34:03', '1');
INSERT INTO dept_info VALUES ('45', '分部1-1', '44', '2014-01-24 15:32:20', '1');
INSERT INTO dept_info VALUES ('46', '分部1-2', '44', '2014-01-24 15:32:23', '1');
INSERT INTO dept_info VALUES ('47', '分部1-3', '44', '2014-01-24 15:32:28', '0');
INSERT INTO dept_info VALUES ('48', '总部2', null, '2014-01-24 15:31:53', '1');
INSERT INTO dept_info VALUES ('49', '分部2-1', '48', '2014-01-24 15:32:40', '1');
INSERT INTO dept_info VALUES ('50', '分部2-2', '48', '2014-01-24 16:17:34', '1');
INSERT INTO dept_info VALUES ('51', '分部2-3', '48', '2014-01-24 16:17:39', '0');

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO role_info VALUES ('1', '管理员', '2014-01-22 09:10:26', '1');
INSERT INTO role_info VALUES ('2', '管理员2', '2014-01-13 16:33:45', '0');
INSERT INTO role_info VALUES ('8', '测试', '2014-01-13 11:36:01', '1');

-- ----------------------------
-- Table structure for `ruler_info`
-- ----------------------------
DROP TABLE IF EXISTS `ruler_info`;
CREATE TABLE `ruler_info` (
  `ruler_id` int(10) NOT NULL AUTO_INCREMENT,
  `ruler_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ruler_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ruler_level` int(10) DEFAULT '1' COMMENT '菜单等级，从1开始',
  `ruler_echo` int(10) DEFAULT '1' COMMENT '1,显示;0,不显示',
  `ruler_manager` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '上级菜单',
  `ruler_target` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `order` int(10) DEFAULT '0' COMMENT '菜单排序,数字小的排序靠前',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`ruler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ruler_info
-- ----------------------------
INSERT INTO ruler_info VALUES ('1', '组织管理', '', '1', '1', 'zzgl', '_self', '0', '2014-01-23 10:51:47', '1');
INSERT INTO ruler_info VALUES ('2', '人员管理', '/UserAction?method=query&rulerId=2', '2', '1', 'zzgl', 'main', '0', '2014-01-23 10:51:54', '1');
INSERT INTO ruler_info VALUES ('3', '角色管理', '/RoleAction?method=query&rulerId=3', '2', '1', 'zzgl', 'main', '0', '2014-01-23 10:51:55', '1');
INSERT INTO ruler_info VALUES ('4', '部门管理', '/DeptAction?method=query&rulerId=4', '2', '1', 'zzgl', 'main', '0', '2014-01-23 10:51:56', '1');
INSERT INTO ruler_info VALUES ('5', '系统管理', '', '1', '1', 'xtgl', '_self', '0', '2014-01-23 10:51:51', '1');
INSERT INTO ruler_info VALUES ('6', '菜单管理', '/RulerAction?method=query&rulerId=6', '2', '1', 'xtgl', 'main', '0', '2014-01-23 10:51:58', '1');
INSERT INTO ruler_info VALUES ('13', 'xg管理', '', '2', '1', 'xtgl', 'main', '0', '2014-01-23 10:51:59', '1');

-- ----------------------------
-- Table structure for `ruler_role`
-- ----------------------------
DROP TABLE IF EXISTS `ruler_role`;
CREATE TABLE `ruler_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `ruler_id` int(10) DEFAULT NULL,
  `ruler_word` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ruler_role
-- ----------------------------
INSERT INTO ruler_role VALUES ('42', '8', '1', 'iuvd', '2014-01-13 11:36:01', '1');
INSERT INTO ruler_role VALUES ('43', '8', '2', 'iuvd', '2014-01-13 11:36:01', '1');
INSERT INTO ruler_role VALUES ('44', '8', '3', 'iuvd', '2014-01-13 11:36:01', '1');
INSERT INTO ruler_role VALUES ('45', '8', '4', 'iuvd', '2014-01-13 11:36:01', '1');
INSERT INTO ruler_role VALUES ('46', '8', '5', 'uvid', '2014-01-13 11:36:01', '1');
INSERT INTO ruler_role VALUES ('47', '8', '6', 'u', '2014-01-13 11:36:01', '1');
INSERT INTO ruler_role VALUES ('48', '9', '11', 'iuvd', '2014-01-14 10:59:37', '1');
INSERT INTO ruler_role VALUES ('68', '1', '1', 'uvid', '2014-01-22 09:10:26', '1');
INSERT INTO ruler_role VALUES ('69', '1', '2', 'iuvd', '2014-01-22 09:10:26', '1');
INSERT INTO ruler_role VALUES ('70', '1', '3', 'duvi', '2014-01-22 09:10:26', '1');
INSERT INTO ruler_role VALUES ('71', '1', '4', 'iuvd', '2014-01-22 09:10:26', '1');
INSERT INTO ruler_role VALUES ('72', '1', '5', 'uvid', '2014-01-22 09:10:26', '1');
INSERT INTO ruler_role VALUES ('73', '1', '6', 'uvid', '2014-01-22 09:10:26', '1');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passwd` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_role` int(11) DEFAULT NULL,
  `user_birth` timestamp NULL DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT '',
  `user_department` int(11) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO user_info VALUES ('1', 'admin', 'admin', '1', null, null, '1', '2014-01-17 14:56:43', '1');
INSERT INTO user_info VALUES ('2', 'lh', 'lh', '1', '1988-03-03 00:00:00', null, '1', '2014-01-22 10:45:46', '1');
INSERT INTO user_info VALUES ('6', '测试', '23156', '8', '1999-01-28 00:00:00', null, '28', '2014-01-22 10:42:52', '0');
INSERT INTO user_info VALUES ('7', 'test', 'test', '8', '2014-01-22 00:00:00', null, '36', '2014-01-22 10:46:36', '1');

-- ----------------------------
-- Table structure for `user_login`
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` int(10) NOT NULL,
  `login_ip` varchar(150) COLLATE utf8_unicode_ci DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO user_login VALUES ('2', '1', '127.0.0.1', '2014-01-08 14:44:57');
INSERT INTO user_login VALUES ('3', '1', '127.0.0.1', '2014-01-08 14:44:55');
INSERT INTO user_login VALUES ('4', '1', '127.0.0.1', '2014-01-08 14:44:54');
INSERT INTO user_login VALUES ('5', '1', '127.0.0.1', '2014-01-08 14:14:44');
INSERT INTO user_login VALUES ('6', '1', '10.168.1.22', '2014-01-08 14:16:14');
INSERT INTO user_login VALUES ('7', '1', '10.168.1.19', '2014-01-08 14:42:42');
INSERT INTO user_login VALUES ('8', '1', '10.168.1.188', '2014-01-08 14:45:30');
INSERT INTO user_login VALUES ('9', '1', '10.168.1.188', '2014-01-08 14:45:53');
INSERT INTO user_login VALUES ('10', '1', '10.168.1.188', '2014-01-08 15:31:37');
INSERT INTO user_login VALUES ('11', '1', '10.168.1.188', '2014-01-08 15:38:16');
INSERT INTO user_login VALUES ('12', '1', '10.168.1.188', '2014-01-08 16:27:36');
INSERT INTO user_login VALUES ('13', '1', '10.168.1.188', '2014-01-08 16:28:49');
INSERT INTO user_login VALUES ('14', '1', '10.168.1.188', '2014-01-08 16:30:19');
INSERT INTO user_login VALUES ('15', '1', '10.168.1.188', '2014-01-08 16:33:24');
INSERT INTO user_login VALUES ('16', '1', '10.168.1.188', '2014-01-08 16:35:08');
INSERT INTO user_login VALUES ('17', '1', '10.168.1.188', '2014-01-08 16:36:44');
INSERT INTO user_login VALUES ('18', '1', '0:0:0:0:0:0:0:1', '2014-01-08 16:40:42');
INSERT INTO user_login VALUES ('19', '1', '10.168.1.188', '2014-01-08 16:54:20');
INSERT INTO user_login VALUES ('20', '1', '10.168.1.188', '2014-01-08 16:59:05');
INSERT INTO user_login VALUES ('21', '1', '10.168.1.188', '2014-01-08 17:00:04');
INSERT INTO user_login VALUES ('22', '1', '10.168.1.188', '2014-01-08 17:01:45');
INSERT INTO user_login VALUES ('23', '1', '10.168.1.188', '2014-01-08 17:19:37');
INSERT INTO user_login VALUES ('24', '1', '10.168.1.188', '2014-01-08 17:21:44');
INSERT INTO user_login VALUES ('25', '1', '10.168.1.188', '2014-01-08 17:21:56');
INSERT INTO user_login VALUES ('26', '1', '10.168.1.188', '2014-01-08 17:25:19');
INSERT INTO user_login VALUES ('27', '1', '10.168.1.188', '2014-01-08 17:29:47');
INSERT INTO user_login VALUES ('28', '1', '10.168.1.188', '2014-01-08 17:31:38');
INSERT INTO user_login VALUES ('29', '1', '10.168.1.188', '2014-01-08 17:32:06');
INSERT INTO user_login VALUES ('30', '1', '10.168.1.188', '2014-01-08 17:33:49');
INSERT INTO user_login VALUES ('31', '1', '10.168.1.188', '2014-01-08 17:36:27');
INSERT INTO user_login VALUES ('32', '1', '10.168.1.188', '2014-01-08 17:37:03');
INSERT INTO user_login VALUES ('33', '1', '10.168.1.188', '2014-01-08 17:38:11');
INSERT INTO user_login VALUES ('34', '1', '10.168.1.188', '2014-01-08 17:40:25');
INSERT INTO user_login VALUES ('35', '1', '0:0:0:0:0:0:0:1', '2014-01-08 17:45:03');
INSERT INTO user_login VALUES ('36', '1', '0:0:0:0:0:0:0:1', '2014-01-08 17:58:10');
INSERT INTO user_login VALUES ('37', '1', '0:0:0:0:0:0:0:1', '2014-01-08 17:59:22');
INSERT INTO user_login VALUES ('38', '1', '0:0:0:0:0:0:0:1', '2014-01-08 17:59:49');
INSERT INTO user_login VALUES ('39', '1', '0:0:0:0:0:0:0:1', '2014-01-08 18:00:44');
INSERT INTO user_login VALUES ('40', '1', '0:0:0:0:0:0:0:1', '2014-01-09 09:42:47');
INSERT INTO user_login VALUES ('41', '1', '0:0:0:0:0:0:0:1', '2014-01-09 09:45:18');
INSERT INTO user_login VALUES ('42', '1', '0:0:0:0:0:0:0:1', '2014-01-09 09:45:32');
INSERT INTO user_login VALUES ('43', '1', '0:0:0:0:0:0:0:1', '2014-01-09 09:45:44');
INSERT INTO user_login VALUES ('44', '1', '0:0:0:0:0:0:0:1', '2014-01-09 09:50:41');
INSERT INTO user_login VALUES ('45', '1', '0:0:0:0:0:0:0:1', '2014-01-09 09:54:00');
INSERT INTO user_login VALUES ('46', '1', '0:0:0:0:0:0:0:1', '2014-01-09 10:13:14');
INSERT INTO user_login VALUES ('47', '1', '127.0.0.1', '2014-01-09 10:13:55');
INSERT INTO user_login VALUES ('48', '1', '127.0.0.1', '2014-01-09 10:17:22');
INSERT INTO user_login VALUES ('49', '1', '127.0.0.1', '2014-01-09 10:20:30');
INSERT INTO user_login VALUES ('50', '1', '127.0.0.1', '2014-01-09 10:22:22');
INSERT INTO user_login VALUES ('51', '1', '127.0.0.1', '2014-01-09 10:26:02');
INSERT INTO user_login VALUES ('52', '1', '127.0.0.1', '2014-01-09 10:59:47');
INSERT INTO user_login VALUES ('53', '1', '127.0.0.1', '2014-01-09 11:06:23');
INSERT INTO user_login VALUES ('54', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:13:52');
INSERT INTO user_login VALUES ('55', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:17:01');
INSERT INTO user_login VALUES ('56', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:17:53');
INSERT INTO user_login VALUES ('57', '1', '127.0.0.1', '2014-01-09 11:20:38');
INSERT INTO user_login VALUES ('58', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:22:16');
INSERT INTO user_login VALUES ('59', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:30:45');
INSERT INTO user_login VALUES ('60', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:33:38');
INSERT INTO user_login VALUES ('61', '1', '127.0.0.1', '2014-01-09 11:33:42');
INSERT INTO user_login VALUES ('62', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:37:11');
INSERT INTO user_login VALUES ('63', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:38:20');
INSERT INTO user_login VALUES ('64', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:39:24');
INSERT INTO user_login VALUES ('65', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:40:32');
INSERT INTO user_login VALUES ('66', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:42:46');
INSERT INTO user_login VALUES ('67', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:52:35');
INSERT INTO user_login VALUES ('68', '1', '0:0:0:0:0:0:0:1', '2014-01-09 11:54:32');
INSERT INTO user_login VALUES ('69', '1', '127.0.0.1', '2014-01-09 12:02:42');
INSERT INTO user_login VALUES ('70', '1', '127.0.0.1', '2014-01-09 12:06:30');
INSERT INTO user_login VALUES ('71', '1', '127.0.0.1', '2014-01-09 12:07:23');
INSERT INTO user_login VALUES ('72', '1', '0:0:0:0:0:0:0:1', '2014-01-09 12:32:04');
INSERT INTO user_login VALUES ('73', '1', '0:0:0:0:0:0:0:1', '2014-01-09 12:40:37');
INSERT INTO user_login VALUES ('74', '1', '0:0:0:0:0:0:0:1', '2014-01-09 12:40:53');
INSERT INTO user_login VALUES ('75', '1', '127.0.0.1', '2014-01-09 12:55:56');
INSERT INTO user_login VALUES ('76', '1', '127.0.0.1', '2014-01-09 13:01:02');
INSERT INTO user_login VALUES ('77', '1', '127.0.0.1', '2014-01-09 13:01:34');
INSERT INTO user_login VALUES ('78', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:06:10');
INSERT INTO user_login VALUES ('79', '1', '127.0.0.1', '2014-01-09 13:06:58');
INSERT INTO user_login VALUES ('80', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:07:54');
INSERT INTO user_login VALUES ('81', '1', '127.0.0.1', '2014-01-09 13:07:49');
INSERT INTO user_login VALUES ('82', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:08:15');
INSERT INTO user_login VALUES ('83', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:10:09');
INSERT INTO user_login VALUES ('84', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:10:39');
INSERT INTO user_login VALUES ('85', '1', '127.0.0.1', '2014-01-09 13:11:43');
INSERT INTO user_login VALUES ('86', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:16:14');
INSERT INTO user_login VALUES ('87', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:27:01');
INSERT INTO user_login VALUES ('88', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:31:08');
INSERT INTO user_login VALUES ('89', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:50:03');
INSERT INTO user_login VALUES ('90', '1', '0:0:0:0:0:0:0:1', '2014-01-09 13:51:16');
INSERT INTO user_login VALUES ('91', '1', '127.0.0.1', '2014-01-09 13:53:36');
INSERT INTO user_login VALUES ('92', '1', '127.0.0.1', '2014-01-09 14:15:18');
INSERT INTO user_login VALUES ('93', '1', '127.0.0.1', '2014-01-09 14:23:00');
INSERT INTO user_login VALUES ('94', '1', '0:0:0:0:0:0:0:1', '2014-01-09 14:24:07');
INSERT INTO user_login VALUES ('95', '1', '0:0:0:0:0:0:0:1', '2014-01-09 14:24:44');
INSERT INTO user_login VALUES ('96', '1', '0:0:0:0:0:0:0:1', '2014-01-09 14:25:02');
INSERT INTO user_login VALUES ('97', '1', '0:0:0:0:0:0:0:1', '2014-01-09 14:25:10');
INSERT INTO user_login VALUES ('98', '1', '127.0.0.1', '2014-01-09 14:26:17');
INSERT INTO user_login VALUES ('99', '1', '10.168.1.66', '2014-01-09 14:28:09');
INSERT INTO user_login VALUES ('100', '1', '10.168.1.66', '2014-01-09 14:30:45');
INSERT INTO user_login VALUES ('101', '1', '127.0.0.1', '2014-01-09 14:34:29');
INSERT INTO user_login VALUES ('102', '1', '127.0.0.1', '2014-01-09 15:10:31');
INSERT INTO user_login VALUES ('103', '1', '127.0.0.1', '2014-01-09 15:16:15');
INSERT INTO user_login VALUES ('104', '1', '127.0.0.1', '2014-01-09 15:17:58');
INSERT INTO user_login VALUES ('105', '1', '127.0.0.1', '2014-01-09 15:28:57');
INSERT INTO user_login VALUES ('106', '1', '0:0:0:0:0:0:0:1', '2014-01-09 15:41:57');
INSERT INTO user_login VALUES ('107', '1', '0:0:0:0:0:0:0:1', '2014-01-09 15:44:36');
INSERT INTO user_login VALUES ('108', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:05:53');
INSERT INTO user_login VALUES ('109', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:06:24');
INSERT INTO user_login VALUES ('110', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:06:37');
INSERT INTO user_login VALUES ('111', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:07:31');
INSERT INTO user_login VALUES ('112', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:07:45');
INSERT INTO user_login VALUES ('113', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:08:43');
INSERT INTO user_login VALUES ('114', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:09:22');
INSERT INTO user_login VALUES ('115', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:09:59');
INSERT INTO user_login VALUES ('116', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:10:11');
INSERT INTO user_login VALUES ('117', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:10:47');
INSERT INTO user_login VALUES ('118', '1', '127.0.0.1', '2014-01-09 16:11:11');
INSERT INTO user_login VALUES ('119', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:12:15');
INSERT INTO user_login VALUES ('120', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:13:20');
INSERT INTO user_login VALUES ('121', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:13:57');
INSERT INTO user_login VALUES ('122', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:14:45');
INSERT INTO user_login VALUES ('123', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:14:49');
INSERT INTO user_login VALUES ('124', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:15:38');
INSERT INTO user_login VALUES ('125', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:16:08');
INSERT INTO user_login VALUES ('126', '1', '127.0.0.1', '2014-01-09 16:16:15');
INSERT INTO user_login VALUES ('127', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:17:43');
INSERT INTO user_login VALUES ('128', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:18:12');
INSERT INTO user_login VALUES ('129', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:18:40');
INSERT INTO user_login VALUES ('130', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:20:48');
INSERT INTO user_login VALUES ('131', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:21:25');
INSERT INTO user_login VALUES ('132', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:21:56');
INSERT INTO user_login VALUES ('133', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:22:43');
INSERT INTO user_login VALUES ('134', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:25:26');
INSERT INTO user_login VALUES ('135', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:26:29');
INSERT INTO user_login VALUES ('136', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:29:05');
INSERT INTO user_login VALUES ('137', '1', '127.0.0.1', '2014-01-09 16:29:38');
INSERT INTO user_login VALUES ('138', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:31:11');
INSERT INTO user_login VALUES ('139', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:32:47');
INSERT INTO user_login VALUES ('140', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:32:57');
INSERT INTO user_login VALUES ('141', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:33:42');
INSERT INTO user_login VALUES ('142', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:36:51');
INSERT INTO user_login VALUES ('143', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:37:14');
INSERT INTO user_login VALUES ('144', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:38:23');
INSERT INTO user_login VALUES ('145', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:40:10');
INSERT INTO user_login VALUES ('146', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:40:38');
INSERT INTO user_login VALUES ('147', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:41:02');
INSERT INTO user_login VALUES ('148', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:41:54');
INSERT INTO user_login VALUES ('149', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:45:01');
INSERT INTO user_login VALUES ('150', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:50:40');
INSERT INTO user_login VALUES ('151', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:50:46');
INSERT INTO user_login VALUES ('152', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:51:56');
INSERT INTO user_login VALUES ('153', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:54:08');
INSERT INTO user_login VALUES ('154', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:54:44');
INSERT INTO user_login VALUES ('155', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:55:27');
INSERT INTO user_login VALUES ('156', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:56:00');
INSERT INTO user_login VALUES ('157', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:58:28');
INSERT INTO user_login VALUES ('158', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:58:56');
INSERT INTO user_login VALUES ('159', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:59:01');
INSERT INTO user_login VALUES ('160', '1', '0:0:0:0:0:0:0:1', '2014-01-09 16:59:44');
INSERT INTO user_login VALUES ('161', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:00:16');
INSERT INTO user_login VALUES ('162', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:00:41');
INSERT INTO user_login VALUES ('163', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:01:14');
INSERT INTO user_login VALUES ('164', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:01:17');
INSERT INTO user_login VALUES ('165', '1', '127.0.0.1', '2014-01-09 17:08:04');
INSERT INTO user_login VALUES ('166', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:34:34');
INSERT INTO user_login VALUES ('167', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:49:21');
INSERT INTO user_login VALUES ('168', '1', '0:0:0:0:0:0:0:1', '2014-01-09 17:49:37');
INSERT INTO user_login VALUES ('169', '1', '127.0.0.1', '2014-01-09 18:25:19');
INSERT INTO user_login VALUES ('170', '1', '0:0:0:0:0:0:0:1', '2014-01-10 08:56:41');
INSERT INTO user_login VALUES ('171', '1', '0:0:0:0:0:0:0:1', '2014-01-10 08:56:41');
INSERT INTO user_login VALUES ('172', '1', '127.0.0.1', '2014-01-10 09:11:53');
INSERT INTO user_login VALUES ('173', '1', '127.0.0.1', '2014-01-10 09:27:56');
INSERT INTO user_login VALUES ('174', '1', '127.0.0.1', '2014-01-10 09:39:48');
INSERT INTO user_login VALUES ('175', '1', '127.0.0.1', '2014-01-10 09:41:41');
INSERT INTO user_login VALUES ('176', '1', '127.0.0.1', '2014-01-10 09:42:08');
INSERT INTO user_login VALUES ('177', '1', '127.0.0.1', '2014-01-10 09:42:48');
INSERT INTO user_login VALUES ('178', '1', '127.0.0.1', '2014-01-10 09:49:10');
INSERT INTO user_login VALUES ('179', '1', '127.0.0.1', '2014-01-10 09:50:00');
INSERT INTO user_login VALUES ('180', '1', '127.0.0.1', '2014-01-10 09:51:22');
INSERT INTO user_login VALUES ('181', '1', '127.0.0.1', '2014-01-10 09:53:37');
INSERT INTO user_login VALUES ('182', '1', '127.0.0.1', '2014-01-10 09:54:09');
INSERT INTO user_login VALUES ('183', '1', '0:0:0:0:0:0:0:1', '2014-01-10 10:09:53');
INSERT INTO user_login VALUES ('184', '1', '0:0:0:0:0:0:0:1', '2014-01-10 10:10:30');
INSERT INTO user_login VALUES ('185', '1', '0:0:0:0:0:0:0:1', '2014-01-10 10:11:12');
INSERT INTO user_login VALUES ('186', '1', '0:0:0:0:0:0:0:1', '2014-01-10 10:14:39');
INSERT INTO user_login VALUES ('187', '1', '0:0:0:0:0:0:0:1', '2014-01-10 10:19:37');
INSERT INTO user_login VALUES ('188', '1', '0:0:0:0:0:0:0:1', '2014-01-10 10:29:34');
INSERT INTO user_login VALUES ('189', '1', '127.0.0.1', '2014-01-10 14:46:39');
INSERT INTO user_login VALUES ('190', '1', '0:0:0:0:0:0:0:1', '2014-01-10 15:20:41');
INSERT INTO user_login VALUES ('191', '1', '0:0:0:0:0:0:0:1', '2014-01-10 15:21:40');
INSERT INTO user_login VALUES ('192', '1', '0:0:0:0:0:0:0:1', '2014-01-10 15:56:10');
INSERT INTO user_login VALUES ('193', '1', '127.0.0.1', '2014-01-10 15:59:16');
INSERT INTO user_login VALUES ('194', '1', '127.0.0.1', '2014-01-10 16:03:22');
INSERT INTO user_login VALUES ('195', '1', '127.0.0.1', '2014-01-10 16:03:46');
INSERT INTO user_login VALUES ('196', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:05:40');
INSERT INTO user_login VALUES ('197', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:06:13');
INSERT INTO user_login VALUES ('198', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:06:59');
INSERT INTO user_login VALUES ('199', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:08:02');
INSERT INTO user_login VALUES ('200', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:08:11');
INSERT INTO user_login VALUES ('201', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:12:14');
INSERT INTO user_login VALUES ('202', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:15:04');
INSERT INTO user_login VALUES ('203', '1', '127.0.0.1', '2014-01-10 16:17:29');
INSERT INTO user_login VALUES ('204', '1', '127.0.0.1', '2014-01-10 16:17:50');
INSERT INTO user_login VALUES ('205', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:26:34');
INSERT INTO user_login VALUES ('206', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:28:45');
INSERT INTO user_login VALUES ('207', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:32:53');
INSERT INTO user_login VALUES ('208', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:37:01');
INSERT INTO user_login VALUES ('209', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:38:47');
INSERT INTO user_login VALUES ('210', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:41:10');
INSERT INTO user_login VALUES ('211', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:42:56');
INSERT INTO user_login VALUES ('212', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:43:11');
INSERT INTO user_login VALUES ('213', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:43:15');
INSERT INTO user_login VALUES ('214', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:44:03');
INSERT INTO user_login VALUES ('215', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:46:14');
INSERT INTO user_login VALUES ('216', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:46:55');
INSERT INTO user_login VALUES ('217', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:49:55');
INSERT INTO user_login VALUES ('218', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:58:44');
INSERT INTO user_login VALUES ('219', '1', '0:0:0:0:0:0:0:1', '2014-01-10 16:59:30');
INSERT INTO user_login VALUES ('220', '1', '0:0:0:0:0:0:0:1', '2014-01-10 17:01:15');
INSERT INTO user_login VALUES ('221', '1', '0:0:0:0:0:0:0:1', '2014-01-10 17:02:44');
INSERT INTO user_login VALUES ('222', '1', '0:0:0:0:0:0:0:1', '2014-01-10 17:04:13');
INSERT INTO user_login VALUES ('223', '1', '0:0:0:0:0:0:0:1', '2014-01-10 17:05:52');
INSERT INTO user_login VALUES ('224', '1', '0:0:0:0:0:0:0:1', '2014-01-10 17:06:33');
INSERT INTO user_login VALUES ('225', '1', '0:0:0:0:0:0:0:1', '2014-01-10 17:36:20');
INSERT INTO user_login VALUES ('226', '1', '0:0:0:0:0:0:0:1', '2014-01-10 18:04:45');
INSERT INTO user_login VALUES ('227', '1', '0:0:0:0:0:0:0:1', '2014-01-10 18:06:04');
INSERT INTO user_login VALUES ('228', '1', '0:0:0:0:0:0:0:1', '2014-01-10 18:10:36');
INSERT INTO user_login VALUES ('229', '1', '0:0:0:0:0:0:0:1', '2014-01-10 18:12:17');
INSERT INTO user_login VALUES ('230', '1', '0:0:0:0:0:0:0:1', '2014-01-10 18:13:21');
INSERT INTO user_login VALUES ('231', '1', '0:0:0:0:0:0:0:1', '2014-01-10 18:17:32');
INSERT INTO user_login VALUES ('232', '1', '10.168.1.188', '2014-01-13 09:13:18');
INSERT INTO user_login VALUES ('233', '1', '127.0.0.1', '2014-01-13 09:52:26');
INSERT INTO user_login VALUES ('234', '1', '10.168.1.188', '2014-01-13 10:11:13');
INSERT INTO user_login VALUES ('235', '1', '10.168.1.188', '2014-01-13 10:11:37');
INSERT INTO user_login VALUES ('236', '1', '10.168.1.188', '2014-01-13 11:00:46');
INSERT INTO user_login VALUES ('237', '1', '10.168.1.188', '2014-01-13 11:06:58');
INSERT INTO user_login VALUES ('238', '1', '127.0.0.1', '2014-01-13 11:12:07');
INSERT INTO user_login VALUES ('239', '1', '10.168.1.188', '2014-01-13 11:13:04');
INSERT INTO user_login VALUES ('240', '1', '127.0.0.1', '2014-01-13 11:13:19');
INSERT INTO user_login VALUES ('241', '1', '10.168.1.188', '2014-01-13 11:21:15');
INSERT INTO user_login VALUES ('242', '1', '10.168.1.188', '2014-01-13 11:23:04');
INSERT INTO user_login VALUES ('243', '1', '10.168.1.188', '2014-01-13 11:25:59');
INSERT INTO user_login VALUES ('244', '1', '10.168.1.188', '2014-01-13 11:27:52');
INSERT INTO user_login VALUES ('245', '1', '10.168.1.188', '2014-01-13 11:29:12');
INSERT INTO user_login VALUES ('246', '1', '10.168.1.188', '2014-01-13 11:35:31');
INSERT INTO user_login VALUES ('247', '1', '127.0.0.1', '2014-01-13 13:58:58');
INSERT INTO user_login VALUES ('248', '1', '127.0.0.1', '2014-01-13 14:03:50');
INSERT INTO user_login VALUES ('249', '1', '127.0.0.1', '2014-01-13 14:08:36');
INSERT INTO user_login VALUES ('250', '1', '127.0.0.1', '2014-01-13 14:13:35');
INSERT INTO user_login VALUES ('251', '1', '127.0.0.1', '2014-01-13 14:26:50');
INSERT INTO user_login VALUES ('252', '1', '127.0.0.1', '2014-01-13 14:27:25');
INSERT INTO user_login VALUES ('253', '1', '127.0.0.1', '2014-01-13 14:29:58');
INSERT INTO user_login VALUES ('254', '1', '10.168.1.188', '2014-01-13 14:33:08');
INSERT INTO user_login VALUES ('255', '1', '127.0.0.1', '2014-01-13 14:53:33');
INSERT INTO user_login VALUES ('256', '1', '127.0.0.1', '2014-01-13 15:37:53');
INSERT INTO user_login VALUES ('257', '1', '127.0.0.1', '2014-01-13 15:44:41');
INSERT INTO user_login VALUES ('258', '1', '127.0.0.1', '2014-01-13 15:47:30');
INSERT INTO user_login VALUES ('259', '1', '127.0.0.1', '2014-01-13 15:51:31');
INSERT INTO user_login VALUES ('260', '1', '127.0.0.1', '2014-01-13 15:56:02');
INSERT INTO user_login VALUES ('261', '1', '127.0.0.1', '2014-01-13 16:00:22');
INSERT INTO user_login VALUES ('262', '1', '127.0.0.1', '2014-01-13 16:01:58');
INSERT INTO user_login VALUES ('263', '1', '127.0.0.1', '2014-01-13 16:02:35');
INSERT INTO user_login VALUES ('264', '1', '127.0.0.1', '2014-01-13 16:05:00');
INSERT INTO user_login VALUES ('265', '1', '127.0.0.1', '2014-01-13 16:05:40');
INSERT INTO user_login VALUES ('266', '1', '127.0.0.1', '2014-01-13 16:13:18');
INSERT INTO user_login VALUES ('267', '1', '127.0.0.1', '2014-01-13 16:15:42');
INSERT INTO user_login VALUES ('268', '1', '127.0.0.1', '2014-01-13 16:16:28');
INSERT INTO user_login VALUES ('269', '1', '127.0.0.1', '2014-01-13 16:17:06');
INSERT INTO user_login VALUES ('270', '1', '127.0.0.1', '2014-01-13 16:21:01');
INSERT INTO user_login VALUES ('271', '1', '127.0.0.1', '2014-01-13 16:26:24');
INSERT INTO user_login VALUES ('272', '1', '127.0.0.1', '2014-01-13 16:28:05');
INSERT INTO user_login VALUES ('273', '1', '127.0.0.1', '2014-01-13 16:39:44');
INSERT INTO user_login VALUES ('274', '1', '127.0.0.1', '2014-01-13 16:41:02');
INSERT INTO user_login VALUES ('275', '1', '127.0.0.1', '2014-01-13 16:42:00');
INSERT INTO user_login VALUES ('276', '1', '127.0.0.1', '2014-01-13 16:42:56');
INSERT INTO user_login VALUES ('277', '1', '127.0.0.1', '2014-01-13 17:33:10');
INSERT INTO user_login VALUES ('278', '1', '127.0.0.1', '2014-01-13 17:34:39');
INSERT INTO user_login VALUES ('279', '1', '127.0.0.1', '2014-01-13 17:37:21');
INSERT INTO user_login VALUES ('280', '1', '127.0.0.1', '2014-01-13 18:09:22');
INSERT INTO user_login VALUES ('281', '1', '127.0.0.1', '2014-01-13 18:09:37');
INSERT INTO user_login VALUES ('282', '1', '127.0.0.1', '2014-01-13 18:10:29');
INSERT INTO user_login VALUES ('283', '1', '10.168.1.188', '2014-01-13 19:39:01');
INSERT INTO user_login VALUES ('284', '1', '127.0.0.1', '2014-01-14 09:17:38');
INSERT INTO user_login VALUES ('285', '1', '10.168.1.188', '2014-01-14 09:19:04');
INSERT INTO user_login VALUES ('286', '1', '127.0.0.1', '2014-01-14 09:19:50');
INSERT INTO user_login VALUES ('287', '1', '127.0.0.1', '2014-01-14 09:22:58');
INSERT INTO user_login VALUES ('288', '1', '127.0.0.1', '2014-01-14 09:25:42');
INSERT INTO user_login VALUES ('289', '1', '127.0.0.1', '2014-01-14 09:30:34');
INSERT INTO user_login VALUES ('290', '1', '127.0.0.1', '2014-01-14 09:31:27');
INSERT INTO user_login VALUES ('291', '1', '127.0.0.1', '2014-01-14 09:31:43');
INSERT INTO user_login VALUES ('292', '1', '127.0.0.1', '2014-01-14 09:32:21');
INSERT INTO user_login VALUES ('293', '1', '127.0.0.1', '2014-01-14 09:33:20');
INSERT INTO user_login VALUES ('294', '1', '127.0.0.1', '2014-01-14 09:33:54');
INSERT INTO user_login VALUES ('295', '1', '127.0.0.1', '2014-01-14 09:34:17');
INSERT INTO user_login VALUES ('296', '1', '127.0.0.1', '2014-01-14 09:35:00');
INSERT INTO user_login VALUES ('297', '1', '127.0.0.1', '2014-01-14 09:37:20');
INSERT INTO user_login VALUES ('298', '1', '127.0.0.1', '2014-01-14 09:47:54');
INSERT INTO user_login VALUES ('299', '1', '127.0.0.1', '2014-01-14 09:56:04');
INSERT INTO user_login VALUES ('300', '1', '127.0.0.1', '2014-01-14 10:06:43');
INSERT INTO user_login VALUES ('301', '1', '127.0.0.1', '2014-01-14 10:15:40');
INSERT INTO user_login VALUES ('302', '1', '127.0.0.1', '2014-01-14 10:17:46');
INSERT INTO user_login VALUES ('303', '1', '127.0.0.1', '2014-01-14 10:19:17');
INSERT INTO user_login VALUES ('304', '1', '127.0.0.1', '2014-01-14 10:25:29');
INSERT INTO user_login VALUES ('305', '1', '127.0.0.1', '2014-01-14 10:28:48');
INSERT INTO user_login VALUES ('306', '1', '127.0.0.1', '2014-01-14 10:35:00');
INSERT INTO user_login VALUES ('307', '1', '127.0.0.1', '2014-01-14 10:41:06');
INSERT INTO user_login VALUES ('308', '1', '127.0.0.1', '2014-01-14 10:41:30');
INSERT INTO user_login VALUES ('309', '1', '127.0.0.1', '2014-01-14 11:33:46');
INSERT INTO user_login VALUES ('310', '1', '127.0.0.1', '2014-01-14 11:51:27');
INSERT INTO user_login VALUES ('311', '1', '127.0.0.1', '2014-01-14 11:58:22');
INSERT INTO user_login VALUES ('312', '1', '127.0.0.1', '2014-01-14 12:11:59');
INSERT INTO user_login VALUES ('313', '1', '127.0.0.1', '2014-01-14 13:59:46');
INSERT INTO user_login VALUES ('314', '1', '127.0.0.1', '2014-01-14 14:01:15');
INSERT INTO user_login VALUES ('315', '1', '127.0.0.1', '2014-01-14 14:02:37');
INSERT INTO user_login VALUES ('316', '1', '127.0.0.1', '2014-01-14 14:02:38');
INSERT INTO user_login VALUES ('317', '1', '127.0.0.1', '2014-01-14 14:15:40');
INSERT INTO user_login VALUES ('318', '1', '127.0.0.1', '2014-01-14 14:19:51');
INSERT INTO user_login VALUES ('319', '1', '127.0.0.1', '2014-01-14 14:40:57');
INSERT INTO user_login VALUES ('320', '1', '127.0.0.1', '2014-01-14 14:45:25');
INSERT INTO user_login VALUES ('321', '1', '10.168.1.188', '2014-01-14 14:46:37');
INSERT INTO user_login VALUES ('322', '1', '127.0.0.1', '2014-01-14 14:50:18');
INSERT INTO user_login VALUES ('323', '1', '127.0.0.1', '2014-01-14 15:05:14');
INSERT INTO user_login VALUES ('324', '1', '127.0.0.1', '2014-01-14 15:11:47');
INSERT INTO user_login VALUES ('325', '1', '127.0.0.1', '2014-01-14 15:13:15');
INSERT INTO user_login VALUES ('326', '1', '127.0.0.1', '2014-01-14 15:13:26');
INSERT INTO user_login VALUES ('327', '1', '127.0.0.1', '2014-01-14 15:14:42');
INSERT INTO user_login VALUES ('328', '1', '127.0.0.1', '2014-01-14 15:16:07');
INSERT INTO user_login VALUES ('329', '1', '127.0.0.1', '2014-01-14 15:18:33');
INSERT INTO user_login VALUES ('330', '1', '127.0.0.1', '2014-01-14 15:21:12');
INSERT INTO user_login VALUES ('331', '1', '127.0.0.1', '2014-01-14 15:22:12');
INSERT INTO user_login VALUES ('332', '1', '127.0.0.1', '2014-01-14 15:22:47');
INSERT INTO user_login VALUES ('333', '1', '127.0.0.1', '2014-01-14 15:24:05');
INSERT INTO user_login VALUES ('334', '1', '127.0.0.1', '2014-01-14 15:27:16');
INSERT INTO user_login VALUES ('335', '1', '127.0.0.1', '2014-01-14 15:28:01');
INSERT INTO user_login VALUES ('336', '1', '127.0.0.1', '2014-01-14 15:31:11');
INSERT INTO user_login VALUES ('337', '1', '127.0.0.1', '2014-01-14 15:32:04');
INSERT INTO user_login VALUES ('338', '1', '10.168.1.188', '2014-01-14 15:32:17');
INSERT INTO user_login VALUES ('339', '1', '127.0.0.1', '2014-01-14 15:36:47');
INSERT INTO user_login VALUES ('340', '1', '127.0.0.1', '2014-01-14 15:54:20');
INSERT INTO user_login VALUES ('341', '1', '127.0.0.1', '2014-01-14 15:56:29');
INSERT INTO user_login VALUES ('342', '1', '127.0.0.1', '2014-01-14 15:59:09');
INSERT INTO user_login VALUES ('343', '1', '127.0.0.1', '2014-01-14 15:59:29');
INSERT INTO user_login VALUES ('344', '1', '127.0.0.1', '2014-01-14 16:35:45');
INSERT INTO user_login VALUES ('345', '1', '127.0.0.1', '2014-01-14 16:41:50');
INSERT INTO user_login VALUES ('346', '1', '127.0.0.1', '2014-01-14 16:41:54');
INSERT INTO user_login VALUES ('347', '1', '127.0.0.1', '2014-01-14 16:43:59');
INSERT INTO user_login VALUES ('348', '1', '127.0.0.1', '2014-01-14 16:52:13');
INSERT INTO user_login VALUES ('349', '1', '127.0.0.1', '2014-01-14 16:52:20');
INSERT INTO user_login VALUES ('350', '1', '127.0.0.1', '2014-01-14 16:53:02');
INSERT INTO user_login VALUES ('351', '1', '127.0.0.1', '2014-01-14 16:56:23');
INSERT INTO user_login VALUES ('352', '1', '127.0.0.1', '2014-01-14 16:56:50');
INSERT INTO user_login VALUES ('353', '1', '127.0.0.1', '2014-01-14 16:58:20');
INSERT INTO user_login VALUES ('354', '1', '127.0.0.1', '2014-01-14 16:59:29');
INSERT INTO user_login VALUES ('355', '1', '127.0.0.1', '2014-01-14 17:21:24');
INSERT INTO user_login VALUES ('356', '1', '127.0.0.1', '2014-01-14 17:27:42');
INSERT INTO user_login VALUES ('357', '1', '127.0.0.1', '2014-01-14 17:31:41');
INSERT INTO user_login VALUES ('358', '1', '127.0.0.1', '2014-01-14 17:55:55');
INSERT INTO user_login VALUES ('359', '1', '127.0.0.1', '2014-01-14 17:57:00');
INSERT INTO user_login VALUES ('360', '1', '127.0.0.1', '2014-01-14 18:27:33');
INSERT INTO user_login VALUES ('361', '1', '127.0.0.1', '2014-01-14 18:31:00');
INSERT INTO user_login VALUES ('362', '1', '127.0.0.1', '2014-01-14 18:31:52');
INSERT INTO user_login VALUES ('363', '1', '127.0.0.1', '2014-01-14 18:44:54');
INSERT INTO user_login VALUES ('364', '1', '127.0.0.1', '2014-01-14 18:49:52');
INSERT INTO user_login VALUES ('365', '1', '127.0.0.1', '2014-01-14 18:52:35');
INSERT INTO user_login VALUES ('366', '1', '127.0.0.1', '2014-01-14 18:53:35');
INSERT INTO user_login VALUES ('367', '1', '127.0.0.1', '2014-01-14 18:55:32');
INSERT INTO user_login VALUES ('368', '1', '127.0.0.1', '2014-01-14 18:58:21');
INSERT INTO user_login VALUES ('369', '1', '127.0.0.1', '2014-01-14 18:59:59');
INSERT INTO user_login VALUES ('370', '1', '127.0.0.1', '2014-01-15 09:50:49');
INSERT INTO user_login VALUES ('371', '1', '127.0.0.1', '2014-01-15 09:52:50');
INSERT INTO user_login VALUES ('372', '1', '127.0.0.1', '2014-01-15 09:53:33');
INSERT INTO user_login VALUES ('373', '1', '127.0.0.1', '2014-01-15 09:53:53');
INSERT INTO user_login VALUES ('374', '1', '127.0.0.1', '2014-01-15 09:56:02');
INSERT INTO user_login VALUES ('375', '1', '127.0.0.1', '2014-01-15 09:56:40');
INSERT INTO user_login VALUES ('376', '1', '127.0.0.1', '2014-01-15 09:56:59');
INSERT INTO user_login VALUES ('377', '1', '127.0.0.1', '2014-01-15 09:58:16');
INSERT INTO user_login VALUES ('378', '1', '127.0.0.1', '2014-01-15 10:00:40');
INSERT INTO user_login VALUES ('379', '1', '127.0.0.1', '2014-01-15 10:00:56');
INSERT INTO user_login VALUES ('380', '1', '127.0.0.1', '2014-01-15 10:01:11');
INSERT INTO user_login VALUES ('381', '1', '127.0.0.1', '2014-01-15 10:44:46');
INSERT INTO user_login VALUES ('382', '1', '127.0.0.1', '2014-01-15 10:46:05');
INSERT INTO user_login VALUES ('383', '1', '127.0.0.1', '2014-01-15 10:48:12');
INSERT INTO user_login VALUES ('384', '1', '127.0.0.1', '2014-01-15 10:49:32');
INSERT INTO user_login VALUES ('385', '1', '127.0.0.1', '2014-01-15 10:50:14');
INSERT INTO user_login VALUES ('386', '1', '127.0.0.1', '2014-01-15 10:50:33');
INSERT INTO user_login VALUES ('387', '1', '127.0.0.1', '2014-01-15 10:52:25');
INSERT INTO user_login VALUES ('388', '1', '127.0.0.1', '2014-01-15 10:53:30');
INSERT INTO user_login VALUES ('389', '1', '127.0.0.1', '2014-01-15 10:59:34');
INSERT INTO user_login VALUES ('390', '1', '127.0.0.1', '2014-01-15 11:01:51');
INSERT INTO user_login VALUES ('391', '1', '127.0.0.1', '2014-01-15 11:03:10');
INSERT INTO user_login VALUES ('392', '1', '127.0.0.1', '2014-01-15 11:10:26');
INSERT INTO user_login VALUES ('393', '1', '127.0.0.1', '2014-01-15 11:11:56');
INSERT INTO user_login VALUES ('394', '1', '127.0.0.1', '2014-01-15 11:20:03');
INSERT INTO user_login VALUES ('395', '1', '127.0.0.1', '2014-01-15 11:35:34');
INSERT INTO user_login VALUES ('396', '1', '127.0.0.1', '2014-01-15 11:40:47');
INSERT INTO user_login VALUES ('397', '1', '127.0.0.1', '2014-01-15 13:55:47');
INSERT INTO user_login VALUES ('398', '1', '127.0.0.1', '2014-01-15 15:05:36');
INSERT INTO user_login VALUES ('399', '1', '127.0.0.1', '2014-01-15 15:17:09');
INSERT INTO user_login VALUES ('400', '1', '127.0.0.1', '2014-01-15 15:18:01');
INSERT INTO user_login VALUES ('401', '1', '127.0.0.1', '2014-01-15 15:27:02');
INSERT INTO user_login VALUES ('402', '1', '127.0.0.1', '2014-01-15 15:29:03');
INSERT INTO user_login VALUES ('403', '1', '127.0.0.1', '2014-01-15 15:29:09');
INSERT INTO user_login VALUES ('404', '1', '127.0.0.1', '2014-01-15 15:39:43');
INSERT INTO user_login VALUES ('405', '1', '127.0.0.1', '2014-01-15 15:55:54');
INSERT INTO user_login VALUES ('406', '1', '127.0.0.1', '2014-01-15 15:56:30');
INSERT INTO user_login VALUES ('407', '1', '127.0.0.1', '2014-01-15 16:07:04');
INSERT INTO user_login VALUES ('408', '1', '127.0.0.1', '2014-01-15 16:09:29');
INSERT INTO user_login VALUES ('409', '1', '127.0.0.1', '2014-01-15 16:14:42');
INSERT INTO user_login VALUES ('410', '1', '127.0.0.1', '2014-01-15 16:15:45');
INSERT INTO user_login VALUES ('411', '1', '127.0.0.1', '2014-01-15 17:00:47');
INSERT INTO user_login VALUES ('412', '1', '127.0.0.1', '2014-01-15 17:03:18');
INSERT INTO user_login VALUES ('413', '1', '127.0.0.1', '2014-01-15 17:03:53');
INSERT INTO user_login VALUES ('414', '1', '127.0.0.1', '2014-01-15 17:05:35');
INSERT INTO user_login VALUES ('415', '1', '127.0.0.1', '2014-01-15 17:05:52');
INSERT INTO user_login VALUES ('416', '1', '127.0.0.1', '2014-01-15 17:06:51');
INSERT INTO user_login VALUES ('417', '1', '127.0.0.1', '2014-01-15 17:09:14');
INSERT INTO user_login VALUES ('418', '1', '127.0.0.1', '2014-01-15 17:10:17');
INSERT INTO user_login VALUES ('419', '1', '127.0.0.1', '2014-01-15 17:14:14');
INSERT INTO user_login VALUES ('420', '1', '127.0.0.1', '2014-01-15 17:14:47');
INSERT INTO user_login VALUES ('421', '1', '127.0.0.1', '2014-01-15 17:15:53');
INSERT INTO user_login VALUES ('422', '1', '127.0.0.1', '2014-01-15 17:28:22');
INSERT INTO user_login VALUES ('423', '1', '127.0.0.1', '2014-01-15 17:28:50');
INSERT INTO user_login VALUES ('424', '1', '127.0.0.1', '2014-01-15 17:30:32');
INSERT INTO user_login VALUES ('425', '1', '127.0.0.1', '2014-01-15 17:30:54');
INSERT INTO user_login VALUES ('426', '1', '127.0.0.1', '2014-01-15 17:31:20');
INSERT INTO user_login VALUES ('427', '1', '127.0.0.1', '2014-01-15 17:32:45');
INSERT INTO user_login VALUES ('428', '1', '127.0.0.1', '2014-01-15 17:33:02');
INSERT INTO user_login VALUES ('429', '1', '127.0.0.1', '2014-01-15 17:34:11');
INSERT INTO user_login VALUES ('430', '1', '127.0.0.1', '2014-01-15 17:36:01');
INSERT INTO user_login VALUES ('431', '1', '127.0.0.1', '2014-01-15 17:37:29');
INSERT INTO user_login VALUES ('432', '1', '127.0.0.1', '2014-01-15 17:38:10');
INSERT INTO user_login VALUES ('433', '1', '127.0.0.1', '2014-01-15 17:39:44');
INSERT INTO user_login VALUES ('434', '1', '127.0.0.1', '2014-01-15 17:42:18');
INSERT INTO user_login VALUES ('435', '1', '127.0.0.1', '2014-01-15 17:46:08');
INSERT INTO user_login VALUES ('436', '1', '127.0.0.1', '2014-01-15 17:47:52');
INSERT INTO user_login VALUES ('437', '1', '127.0.0.1', '2014-01-15 17:49:22');
INSERT INTO user_login VALUES ('438', '1', '127.0.0.1', '2014-01-15 17:50:39');
INSERT INTO user_login VALUES ('439', '1', '127.0.0.1', '2014-01-15 17:55:56');
INSERT INTO user_login VALUES ('440', '1', '127.0.0.1', '2014-01-15 17:58:22');
INSERT INTO user_login VALUES ('441', '1', '127.0.0.1', '2014-01-15 18:01:01');
INSERT INTO user_login VALUES ('442', '1', '127.0.0.1', '2014-01-16 09:29:20');
INSERT INTO user_login VALUES ('443', '1', '127.0.0.1', '2014-01-16 09:56:42');
INSERT INTO user_login VALUES ('444', '1', '127.0.0.1', '2014-01-16 09:57:13');
INSERT INTO user_login VALUES ('445', '1', '127.0.0.1', '2014-01-16 10:05:04');
INSERT INTO user_login VALUES ('446', '1', '127.0.0.1', '2014-01-16 10:06:28');
INSERT INTO user_login VALUES ('447', '1', '127.0.0.1', '2014-01-16 10:06:57');
INSERT INTO user_login VALUES ('448', '1', '127.0.0.1', '2014-01-16 10:16:27');
INSERT INTO user_login VALUES ('449', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:07:50');
INSERT INTO user_login VALUES ('450', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:19:39');
INSERT INTO user_login VALUES ('451', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:21:34');
INSERT INTO user_login VALUES ('452', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:23:00');
INSERT INTO user_login VALUES ('453', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:23:09');
INSERT INTO user_login VALUES ('454', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:23:13');
INSERT INTO user_login VALUES ('455', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:24:32');
INSERT INTO user_login VALUES ('456', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:24:55');
INSERT INTO user_login VALUES ('457', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:26:23');
INSERT INTO user_login VALUES ('458', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:27:40');
INSERT INTO user_login VALUES ('459', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:29:47');
INSERT INTO user_login VALUES ('460', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:30:00');
INSERT INTO user_login VALUES ('461', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:40:07');
INSERT INTO user_login VALUES ('462', '1', '0:0:0:0:0:0:0:1', '2014-01-16 11:42:24');
INSERT INTO user_login VALUES ('463', '1', '0:0:0:0:0:0:0:1', '2014-01-16 12:32:53');
INSERT INTO user_login VALUES ('464', '1', '0:0:0:0:0:0:0:1', '2014-01-16 13:48:36');
INSERT INTO user_login VALUES ('465', '1', '0:0:0:0:0:0:0:1', '2014-01-16 13:48:42');
INSERT INTO user_login VALUES ('466', '1', '0:0:0:0:0:0:0:1', '2014-01-16 14:12:12');
INSERT INTO user_login VALUES ('467', '1', '0:0:0:0:0:0:0:1', '2014-01-16 14:15:01');
INSERT INTO user_login VALUES ('468', '1', '127.0.0.1', '2014-01-16 14:48:21');
INSERT INTO user_login VALUES ('469', '1', '127.0.0.1', '2014-01-16 14:55:03');
INSERT INTO user_login VALUES ('470', '1', '127.0.0.1', '2014-01-16 15:08:05');
INSERT INTO user_login VALUES ('471', '1', '127.0.0.1', '2014-01-16 15:18:18');
INSERT INTO user_login VALUES ('472', '1', '127.0.0.1', '2014-01-16 15:33:30');
INSERT INTO user_login VALUES ('473', '1', '127.0.0.1', '2014-01-16 15:37:21');
INSERT INTO user_login VALUES ('474', '1', '127.0.0.1', '2014-01-16 15:45:03');
INSERT INTO user_login VALUES ('475', '1', '127.0.0.1', '2014-01-16 15:46:53');
INSERT INTO user_login VALUES ('476', '1', '127.0.0.1', '2014-01-16 16:03:27');
INSERT INTO user_login VALUES ('477', '1', '127.0.0.1', '2014-01-16 16:05:54');
INSERT INTO user_login VALUES ('478', '1', '127.0.0.1', '2014-01-16 16:44:40');
INSERT INTO user_login VALUES ('479', '1', '127.0.0.1', '2014-01-16 16:48:41');
INSERT INTO user_login VALUES ('480', '1', '127.0.0.1', '2014-01-16 16:56:02');
INSERT INTO user_login VALUES ('481', '1', '127.0.0.1', '2014-01-16 16:59:58');
INSERT INTO user_login VALUES ('482', '1', '127.0.0.1', '2014-01-16 17:06:07');
INSERT INTO user_login VALUES ('483', '1', '127.0.0.1', '2014-01-16 17:07:11');
INSERT INTO user_login VALUES ('484', '1', '127.0.0.1', '2014-01-16 17:11:27');
INSERT INTO user_login VALUES ('485', '1', '127.0.0.1', '2014-01-16 17:15:26');
INSERT INTO user_login VALUES ('486', '1', '127.0.0.1', '2014-01-16 17:15:34');
INSERT INTO user_login VALUES ('487', '1', '127.0.0.1', '2014-01-16 17:19:02');
INSERT INTO user_login VALUES ('488', '1', '127.0.0.1', '2014-01-16 17:20:19');
INSERT INTO user_login VALUES ('489', '1', '127.0.0.1', '2014-01-16 17:21:10');
INSERT INTO user_login VALUES ('490', '1', '127.0.0.1', '2014-01-16 17:26:29');
INSERT INTO user_login VALUES ('491', '1', '127.0.0.1', '2014-01-16 18:08:46');
INSERT INTO user_login VALUES ('492', '1', '127.0.0.1', '2014-01-17 09:44:41');
INSERT INTO user_login VALUES ('493', '1', '127.0.0.1', '2014-01-17 09:46:47');
INSERT INTO user_login VALUES ('494', '1', '127.0.0.1', '2014-01-17 09:50:35');
INSERT INTO user_login VALUES ('495', '1', '127.0.0.1', '2014-01-17 09:55:16');
INSERT INTO user_login VALUES ('496', '1', '0:0:0:0:0:0:0:1', '2014-01-17 10:00:43');
INSERT INTO user_login VALUES ('497', '1', '0:0:0:0:0:0:0:1', '2014-01-17 10:00:43');
INSERT INTO user_login VALUES ('498', '1', '127.0.0.1', '2014-01-17 10:04:29');
INSERT INTO user_login VALUES ('499', '1', '0:0:0:0:0:0:0:1', '2014-01-17 11:23:50');
INSERT INTO user_login VALUES ('500', '1', '0:0:0:0:0:0:0:1', '2014-01-17 11:24:20');
INSERT INTO user_login VALUES ('501', '1', '0:0:0:0:0:0:0:1', '2014-01-17 11:24:34');
INSERT INTO user_login VALUES ('502', '1', '127.0.0.1', '2014-01-17 11:26:25');
INSERT INTO user_login VALUES ('503', '1', '127.0.0.1', '2014-01-17 11:27:41');
INSERT INTO user_login VALUES ('504', '1', '127.0.0.1', '2014-01-17 11:29:26');
INSERT INTO user_login VALUES ('505', '1', '127.0.0.1', '2014-01-17 11:31:36');
INSERT INTO user_login VALUES ('506', '1', '127.0.0.1', '2014-01-17 11:33:46');
INSERT INTO user_login VALUES ('507', '1', '127.0.0.1', '2014-01-17 11:36:17');
INSERT INTO user_login VALUES ('508', '1', '127.0.0.1', '2014-01-17 11:45:00');
INSERT INTO user_login VALUES ('509', '1', '0:0:0:0:0:0:0:1', '2014-01-17 13:30:41');
INSERT INTO user_login VALUES ('510', '1', '0:0:0:0:0:0:0:1', '2014-01-17 13:31:21');
INSERT INTO user_login VALUES ('511', '1', '0:0:0:0:0:0:0:1', '2014-01-17 13:31:56');
INSERT INTO user_login VALUES ('512', '1', '127.0.0.1', '2014-01-17 13:45:19');
INSERT INTO user_login VALUES ('513', '1', '127.0.0.1', '2014-01-17 14:23:11');
INSERT INTO user_login VALUES ('514', '1', '127.0.0.1', '2014-01-17 14:23:57');
INSERT INTO user_login VALUES ('515', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:27:22');
INSERT INTO user_login VALUES ('516', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:36:07');
INSERT INTO user_login VALUES ('517', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:38:01');
INSERT INTO user_login VALUES ('518', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:38:55');
INSERT INTO user_login VALUES ('519', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:53:20');
INSERT INTO user_login VALUES ('520', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:54:25');
INSERT INTO user_login VALUES ('521', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:55:16');
INSERT INTO user_login VALUES ('522', '1', '0:0:0:0:0:0:0:1', '2014-01-17 14:57:50');
INSERT INTO user_login VALUES ('523', '1', '0:0:0:0:0:0:0:1', '2014-01-17 15:00:01');
INSERT INTO user_login VALUES ('524', '1', '0:0:0:0:0:0:0:1', '2014-01-17 15:00:31');
INSERT INTO user_login VALUES ('525', '1', '0:0:0:0:0:0:0:1', '2014-01-17 15:01:03');
INSERT INTO user_login VALUES ('526', '1', '127.0.0.1', '2014-01-17 15:10:46');
INSERT INTO user_login VALUES ('527', '1', '0:0:0:0:0:0:0:1', '2014-01-17 15:17:44');
INSERT INTO user_login VALUES ('528', '1', '0:0:0:0:0:0:0:1', '2014-01-17 15:20:46');
INSERT INTO user_login VALUES ('529', '1', '127.0.0.1', '2014-01-17 15:36:18');
INSERT INTO user_login VALUES ('530', '1', '127.0.0.1', '2014-01-17 15:41:03');
INSERT INTO user_login VALUES ('531', '1', '127.0.0.1', '2014-01-17 15:45:42');
INSERT INTO user_login VALUES ('532', '1', '127.0.0.1', '2014-01-17 16:09:03');
INSERT INTO user_login VALUES ('533', '1', '127.0.0.1', '2014-01-17 16:19:10');
INSERT INTO user_login VALUES ('534', '1', '127.0.0.1', '2014-01-17 16:24:41');
INSERT INTO user_login VALUES ('535', '1', '127.0.0.1', '2014-01-17 16:26:16');
INSERT INTO user_login VALUES ('536', '1', '127.0.0.1', '2014-01-17 16:29:22');
INSERT INTO user_login VALUES ('537', '1', '127.0.0.1', '2014-01-17 16:47:36');
INSERT INTO user_login VALUES ('538', '1', '0:0:0:0:0:0:0:1', '2014-01-17 16:48:42');
INSERT INTO user_login VALUES ('539', '1', '0:0:0:0:0:0:0:1', '2014-01-17 16:49:19');
INSERT INTO user_login VALUES ('540', '1', '0:0:0:0:0:0:0:1', '2014-01-17 16:49:55');
INSERT INTO user_login VALUES ('541', '1', '0:0:0:0:0:0:0:1', '2014-01-17 16:51:06');
INSERT INTO user_login VALUES ('542', '1', '127.0.0.1', '2014-01-17 16:51:06');
INSERT INTO user_login VALUES ('543', '1', '127.0.0.1', '2014-01-17 16:52:47');
INSERT INTO user_login VALUES ('544', '1', '127.0.0.1', '2014-01-17 16:55:07');
INSERT INTO user_login VALUES ('545', '1', '127.0.0.1', '2014-01-17 16:58:12');
INSERT INTO user_login VALUES ('546', '1', '127.0.0.1', '2014-01-17 17:00:37');
INSERT INTO user_login VALUES ('547', '1', '127.0.0.1', '2014-01-17 17:03:23');
INSERT INTO user_login VALUES ('548', '1', '127.0.0.1', '2014-01-17 17:04:57');
INSERT INTO user_login VALUES ('549', '1', '127.0.0.1', '2014-01-17 17:11:54');
INSERT INTO user_login VALUES ('550', '1', '127.0.0.1', '2014-01-17 17:14:36');
INSERT INTO user_login VALUES ('551', '1', '127.0.0.1', '2014-01-17 17:19:25');
INSERT INTO user_login VALUES ('552', '1', '127.0.0.1', '2014-01-17 17:24:37');
INSERT INTO user_login VALUES ('553', '1', '127.0.0.1', '2014-01-17 17:26:50');
INSERT INTO user_login VALUES ('554', '1', '127.0.0.1', '2014-01-17 17:30:40');
INSERT INTO user_login VALUES ('555', '1', '127.0.0.1', '2014-01-17 17:32:26');
INSERT INTO user_login VALUES ('556', '1', '127.0.0.1', '2014-01-17 17:34:19');
INSERT INTO user_login VALUES ('557', '1', '127.0.0.1', '2014-01-17 17:36:58');
INSERT INTO user_login VALUES ('558', '1', '127.0.0.1', '2014-01-17 17:40:08');
INSERT INTO user_login VALUES ('559', '1', '127.0.0.1', '2014-01-17 17:41:53');
INSERT INTO user_login VALUES ('560', '1', '127.0.0.1', '2014-01-17 17:43:06');
INSERT INTO user_login VALUES ('561', '1', '127.0.0.1', '2014-01-17 17:46:02');
INSERT INTO user_login VALUES ('562', '1', '127.0.0.1', '2014-01-17 17:54:37');
INSERT INTO user_login VALUES ('563', '1', '127.0.0.1', '2014-01-17 18:01:55');
INSERT INTO user_login VALUES ('564', '1', '127.0.0.1', '2014-01-20 10:01:14');
INSERT INTO user_login VALUES ('565', '1', '127.0.0.1', '2014-01-20 10:36:23');
INSERT INTO user_login VALUES ('566', '1', '127.0.0.1', '2014-01-20 11:30:40');
INSERT INTO user_login VALUES ('567', '1', '127.0.0.1', '2014-01-20 11:37:24');
INSERT INTO user_login VALUES ('568', '1', '0:0:0:0:0:0:0:1', '2014-01-20 13:54:30');
INSERT INTO user_login VALUES ('569', '1', '127.0.0.1', '2014-01-20 14:23:32');
INSERT INTO user_login VALUES ('570', '1', '127.0.0.1', '2014-01-20 14:27:17');
INSERT INTO user_login VALUES ('571', '1', '127.0.0.1', '2014-01-20 14:29:13');
INSERT INTO user_login VALUES ('572', '1', '127.0.0.1', '2014-01-20 14:32:38');
INSERT INTO user_login VALUES ('573', '1', '127.0.0.1', '2014-01-20 14:55:39');
INSERT INTO user_login VALUES ('574', '1', '127.0.0.1', '2014-01-20 14:56:10');
INSERT INTO user_login VALUES ('575', '1', '127.0.0.1', '2014-01-20 14:56:45');
INSERT INTO user_login VALUES ('576', '1', '127.0.0.1', '2014-01-20 15:10:34');
INSERT INTO user_login VALUES ('577', '1', '127.0.0.1', '2014-01-20 15:11:07');
INSERT INTO user_login VALUES ('578', '1', '127.0.0.1', '2014-01-20 15:11:20');
INSERT INTO user_login VALUES ('579', '1', '127.0.0.1', '2014-01-20 15:18:06');
INSERT INTO user_login VALUES ('580', '1', '127.0.0.1', '2014-01-20 15:20:48');
INSERT INTO user_login VALUES ('581', '1', '127.0.0.1', '2014-01-20 15:21:59');
INSERT INTO user_login VALUES ('582', '1', '127.0.0.1', '2014-01-20 15:22:09');
INSERT INTO user_login VALUES ('583', '1', '127.0.0.1', '2014-01-20 15:24:43');
INSERT INTO user_login VALUES ('584', '1', '127.0.0.1', '2014-01-20 15:31:13');
INSERT INTO user_login VALUES ('585', '1', '127.0.0.1', '2014-01-20 15:42:22');
INSERT INTO user_login VALUES ('586', '1', '127.0.0.1', '2014-01-20 15:47:56');
INSERT INTO user_login VALUES ('587', '1', '127.0.0.1', '2014-01-20 16:48:11');
INSERT INTO user_login VALUES ('588', '1', '127.0.0.1', '2014-01-20 16:58:29');
INSERT INTO user_login VALUES ('589', '1', '127.0.0.1', '2014-01-20 17:31:49');
INSERT INTO user_login VALUES ('590', '1', '127.0.0.1', '2014-01-20 17:40:08');
INSERT INTO user_login VALUES ('591', '1', '127.0.0.1', '2014-01-20 17:41:12');
INSERT INTO user_login VALUES ('592', '1', '127.0.0.1', '2014-01-20 17:41:46');
INSERT INTO user_login VALUES ('593', '1', '127.0.0.1', '2014-01-20 17:46:16');
INSERT INTO user_login VALUES ('594', '1', '127.0.0.1', '2014-01-20 17:47:06');
INSERT INTO user_login VALUES ('595', '1', '127.0.0.1', '2014-01-20 17:48:21');
INSERT INTO user_login VALUES ('596', '1', '127.0.0.1', '2014-01-20 17:49:45');
INSERT INTO user_login VALUES ('597', '1', '127.0.0.1', '2014-01-20 17:51:12');
INSERT INTO user_login VALUES ('598', '1', '127.0.0.1', '2014-01-20 17:56:05');
INSERT INTO user_login VALUES ('599', '1', '127.0.0.1', '2014-01-20 18:04:38');
INSERT INTO user_login VALUES ('600', '1', '127.0.0.1', '2014-01-20 18:06:21');
INSERT INTO user_login VALUES ('601', '1', '127.0.0.1', '2014-01-20 18:10:02');
INSERT INTO user_login VALUES ('602', '1', '127.0.0.1', '2014-01-21 09:11:42');
INSERT INTO user_login VALUES ('603', '1', '127.0.0.1', '2014-01-21 09:14:07');
INSERT INTO user_login VALUES ('604', '1', '127.0.0.1', '2014-01-21 09:15:39');
INSERT INTO user_login VALUES ('605', '1', '0:0:0:0:0:0:0:1', '2014-01-21 09:38:48');
INSERT INTO user_login VALUES ('606', '1', '0:0:0:0:0:0:0:1', '2014-01-21 09:47:07');
INSERT INTO user_login VALUES ('607', '1', '0:0:0:0:0:0:0:1', '2014-01-21 09:48:39');
INSERT INTO user_login VALUES ('608', '1', '127.0.0.1', '2014-01-21 09:51:21');
INSERT INTO user_login VALUES ('609', '1', '127.0.0.1', '2014-01-21 09:51:40');
INSERT INTO user_login VALUES ('610', '1', '127.0.0.1', '2014-01-21 09:52:47');
INSERT INTO user_login VALUES ('611', '1', '127.0.0.1', '2014-01-21 10:06:44');
INSERT INTO user_login VALUES ('612', '1', '127.0.0.1', '2014-01-21 10:27:41');
INSERT INTO user_login VALUES ('613', '1', '127.0.0.1', '2014-01-21 14:25:43');
INSERT INTO user_login VALUES ('614', '1', '127.0.0.1', '2014-01-21 14:44:18');
INSERT INTO user_login VALUES ('615', '1', '0:0:0:0:0:0:0:1', '2014-01-21 14:49:13');
INSERT INTO user_login VALUES ('616', '1', '0:0:0:0:0:0:0:1', '2014-01-21 15:00:55');
INSERT INTO user_login VALUES ('617', '1', '0:0:0:0:0:0:0:1', '2014-01-21 15:02:59');
INSERT INTO user_login VALUES ('618', '1', '127.0.0.1', '2014-01-21 15:07:00');
INSERT INTO user_login VALUES ('619', '1', '127.0.0.1', '2014-01-21 15:15:26');
INSERT INTO user_login VALUES ('620', '1', '127.0.0.1', '2014-01-21 15:15:52');
INSERT INTO user_login VALUES ('621', '1', '127.0.0.1', '2014-01-21 15:18:28');
INSERT INTO user_login VALUES ('622', '1', '127.0.0.1', '2014-01-21 15:20:11');
INSERT INTO user_login VALUES ('623', '1', '127.0.0.1', '2014-01-21 15:23:03');
INSERT INTO user_login VALUES ('624', '1', '127.0.0.1', '2014-01-21 15:28:25');
INSERT INTO user_login VALUES ('625', '1', '127.0.0.1', '2014-01-21 15:31:01');
INSERT INTO user_login VALUES ('626', '1', '127.0.0.1', '2014-01-21 15:31:23');
INSERT INTO user_login VALUES ('627', '1', '127.0.0.1', '2014-01-21 15:34:48');
INSERT INTO user_login VALUES ('628', '1', '127.0.0.1', '2014-01-21 15:37:51');
INSERT INTO user_login VALUES ('629', '1', '0:0:0:0:0:0:0:1', '2014-01-21 15:45:51');
INSERT INTO user_login VALUES ('630', '1', '0:0:0:0:0:0:0:1', '2014-01-21 16:41:43');
INSERT INTO user_login VALUES ('631', '1', '0:0:0:0:0:0:0:1', '2014-01-21 16:42:30');
INSERT INTO user_login VALUES ('632', '1', '0:0:0:0:0:0:0:1', '2014-01-21 16:44:54');
INSERT INTO user_login VALUES ('633', '1', '0:0:0:0:0:0:0:1', '2014-01-21 17:04:28');
INSERT INTO user_login VALUES ('634', '1', '0:0:0:0:0:0:0:1', '2014-01-21 17:04:49');
INSERT INTO user_login VALUES ('635', '1', '0:0:0:0:0:0:0:1', '2014-01-21 17:57:00');
INSERT INTO user_login VALUES ('636', '1', '127.0.0.1', '2014-01-21 18:12:13');
INSERT INTO user_login VALUES ('637', '1', '0:0:0:0:0:0:0:1', '2014-01-21 18:12:21');
INSERT INTO user_login VALUES ('638', '1', '0:0:0:0:0:0:0:1', '2014-01-21 18:17:23');
INSERT INTO user_login VALUES ('639', '1', '0:0:0:0:0:0:0:1', '2014-01-21 18:18:58');
INSERT INTO user_login VALUES ('640', '1', '0:0:0:0:0:0:0:1', '2014-01-22 09:08:25');
INSERT INTO user_login VALUES ('641', '1', '0:0:0:0:0:0:0:1', '2014-01-22 09:08:44');
INSERT INTO user_login VALUES ('642', '1', '127.0.0.1', '2014-01-22 09:13:07');
INSERT INTO user_login VALUES ('643', '1', '127.0.0.1', '2014-01-22 09:24:17');
INSERT INTO user_login VALUES ('644', '1', '127.0.0.1', '2014-01-22 09:37:06');
INSERT INTO user_login VALUES ('645', '1', '0:0:0:0:0:0:0:1', '2014-01-22 09:37:25');
INSERT INTO user_login VALUES ('646', '1', '127.0.0.1', '2014-01-22 09:41:12');
INSERT INTO user_login VALUES ('647', '1', '127.0.0.1', '2014-01-22 09:43:35');
INSERT INTO user_login VALUES ('648', '1', '127.0.0.1', '2014-01-22 09:43:41');
INSERT INTO user_login VALUES ('649', '1', '127.0.0.1', '2014-01-22 09:44:46');
INSERT INTO user_login VALUES ('650', '1', '127.0.0.1', '2014-01-22 09:45:02');
INSERT INTO user_login VALUES ('651', '1', '127.0.0.1', '2014-01-22 09:45:22');
INSERT INTO user_login VALUES ('652', '1', '127.0.0.1', '2014-01-22 09:45:50');
INSERT INTO user_login VALUES ('653', '1', '127.0.0.1', '2014-01-22 09:53:23');
INSERT INTO user_login VALUES ('654', '1', '127.0.0.1', '2014-01-22 09:56:01');
INSERT INTO user_login VALUES ('655', '1', '0:0:0:0:0:0:0:1', '2014-01-22 09:56:34');
INSERT INTO user_login VALUES ('656', '1', '127.0.0.1', '2014-01-22 10:02:42');
INSERT INTO user_login VALUES ('657', '1', '127.0.0.1', '2014-01-22 10:03:00');
INSERT INTO user_login VALUES ('658', '1', '127.0.0.1', '2014-01-22 10:04:48');
INSERT INTO user_login VALUES ('659', '1', '127.0.0.1', '2014-01-22 10:06:50');
INSERT INTO user_login VALUES ('660', '1', '127.0.0.1', '2014-01-22 10:09:56');
INSERT INTO user_login VALUES ('661', '1', '127.0.0.1', '2014-01-22 10:12:18');
INSERT INTO user_login VALUES ('662', '1', '127.0.0.1', '2014-01-22 10:17:24');
INSERT INTO user_login VALUES ('663', '1', '127.0.0.1', '2014-01-22 10:17:45');
INSERT INTO user_login VALUES ('664', '1', '127.0.0.1', '2014-01-22 10:19:07');
INSERT INTO user_login VALUES ('665', '1', '127.0.0.1', '2014-01-22 10:19:24');
INSERT INTO user_login VALUES ('666', '1', '127.0.0.1', '2014-01-22 10:21:53');
INSERT INTO user_login VALUES ('667', '1', '127.0.0.1', '2014-01-22 10:21:59');
INSERT INTO user_login VALUES ('668', '1', '127.0.0.1', '2014-01-22 10:24:45');
INSERT INTO user_login VALUES ('669', '1', '127.0.0.1', '2014-01-22 10:26:18');
INSERT INTO user_login VALUES ('670', '1', '127.0.0.1', '2014-01-22 10:30:26');
INSERT INTO user_login VALUES ('671', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:31:58');
INSERT INTO user_login VALUES ('672', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:33:46');
INSERT INTO user_login VALUES ('673', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:36:17');
INSERT INTO user_login VALUES ('674', '1', '127.0.0.1', '2014-01-22 10:37:43');
INSERT INTO user_login VALUES ('675', '1', '127.0.0.1', '2014-01-22 10:38:01');
INSERT INTO user_login VALUES ('676', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:38:42');
INSERT INTO user_login VALUES ('677', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:39:33');
INSERT INTO user_login VALUES ('678', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:41:14');
INSERT INTO user_login VALUES ('679', '1', '0:0:0:0:0:0:0:1', '2014-01-22 10:41:49');
INSERT INTO user_login VALUES ('680', '1', '127.0.0.1', '2014-01-22 10:45:03');
INSERT INTO user_login VALUES ('681', '1', '127.0.0.1', '2014-01-22 11:01:11');
INSERT INTO user_login VALUES ('682', '1', '127.0.0.1', '2014-01-22 11:07:35');
INSERT INTO user_login VALUES ('683', '1', '127.0.0.1', '2014-01-22 11:09:54');
INSERT INTO user_login VALUES ('684', '1', '127.0.0.1', '2014-01-22 15:53:21');
INSERT INTO user_login VALUES ('685', '1', '127.0.0.1', '2014-01-22 16:48:16');
INSERT INTO user_login VALUES ('686', '1', '127.0.0.1', '2014-01-22 17:12:58');
INSERT INTO user_login VALUES ('687', '1', '127.0.0.1', '2014-01-22 17:54:43');
INSERT INTO user_login VALUES ('688', '1', '127.0.0.1', '2014-01-23 11:18:24');
INSERT INTO user_login VALUES ('689', '1', '127.0.0.1', '2014-01-23 11:24:59');
INSERT INTO user_login VALUES ('690', '1', '127.0.0.1', '2014-01-23 11:27:08');
INSERT INTO user_login VALUES ('691', '1', '127.0.0.1', '2014-01-23 11:31:19');
INSERT INTO user_login VALUES ('692', '1', '127.0.0.1', '2014-01-23 11:37:07');
INSERT INTO user_login VALUES ('693', '1', '127.0.0.1', '2014-01-23 14:40:15');
INSERT INTO user_login VALUES ('694', '1', '127.0.0.1', '2014-01-23 14:49:33');
INSERT INTO user_login VALUES ('695', '1', '127.0.0.1', '2014-01-23 14:55:34');
INSERT INTO user_login VALUES ('696', '1', '127.0.0.1', '2014-01-23 15:03:00');
INSERT INTO user_login VALUES ('697', '1', '0:0:0:0:0:0:0:1', '2014-01-23 15:05:23');
INSERT INTO user_login VALUES ('698', '1', '127.0.0.1', '2014-01-23 15:06:44');
INSERT INTO user_login VALUES ('699', '1', '127.0.0.1', '2014-01-23 15:24:46');
INSERT INTO user_login VALUES ('700', '1', '127.0.0.1', '2014-01-23 15:25:07');
INSERT INTO user_login VALUES ('701', '1', '127.0.0.1', '2014-01-23 15:25:33');
INSERT INTO user_login VALUES ('702', '1', '127.0.0.1', '2014-01-23 15:27:04');
INSERT INTO user_login VALUES ('703', '1', '127.0.0.1', '2014-01-23 15:30:58');
INSERT INTO user_login VALUES ('704', '1', '127.0.0.1', '2014-01-23 15:35:37');
INSERT INTO user_login VALUES ('705', '1', '127.0.0.1', '2014-01-23 15:37:21');
INSERT INTO user_login VALUES ('706', '1', '127.0.0.1', '2014-01-23 15:38:52');
INSERT INTO user_login VALUES ('707', '1', '127.0.0.1', '2014-01-23 16:07:59');
INSERT INTO user_login VALUES ('708', '1', '127.0.0.1', '2014-01-23 16:10:18');
INSERT INTO user_login VALUES ('709', '1', '127.0.0.1', '2014-01-23 16:13:07');
INSERT INTO user_login VALUES ('710', '1', '127.0.0.1', '2014-01-23 16:14:48');
INSERT INTO user_login VALUES ('711', '1', '127.0.0.1', '2014-01-23 16:17:02');
INSERT INTO user_login VALUES ('712', '1', '127.0.0.1', '2014-01-23 16:17:25');
INSERT INTO user_login VALUES ('713', '1', '127.0.0.1', '2014-01-23 16:18:23');
INSERT INTO user_login VALUES ('714', '1', '127.0.0.1', '2014-01-23 16:18:42');
INSERT INTO user_login VALUES ('715', '1', '127.0.0.1', '2014-01-23 16:23:15');
INSERT INTO user_login VALUES ('716', '1', '127.0.0.1', '2014-01-23 16:23:58');
INSERT INTO user_login VALUES ('717', '1', '127.0.0.1', '2014-01-23 18:03:37');
INSERT INTO user_login VALUES ('718', '1', '127.0.0.1', '2014-01-23 18:05:42');
INSERT INTO user_login VALUES ('719', '1', '127.0.0.1', '2014-01-23 18:06:56');
INSERT INTO user_login VALUES ('720', '1', '127.0.0.1', '2014-01-23 18:08:03');
INSERT INTO user_login VALUES ('721', '1', '127.0.0.1', '2014-01-23 18:13:53');
INSERT INTO user_login VALUES ('722', '1', '127.0.0.1', '2014-01-23 18:14:32');
INSERT INTO user_login VALUES ('723', '1', '127.0.0.1', '2014-01-24 09:34:58');
INSERT INTO user_login VALUES ('724', '1', '127.0.0.1', '2014-01-24 10:04:12');
INSERT INTO user_login VALUES ('725', '1', '127.0.0.1', '2014-01-24 10:08:35');
INSERT INTO user_login VALUES ('726', '1', '127.0.0.1', '2014-01-24 10:13:30');
INSERT INTO user_login VALUES ('727', '1', '127.0.0.1', '2014-01-24 10:21:31');
INSERT INTO user_login VALUES ('728', '1', '127.0.0.1', '2014-01-24 10:33:14');
INSERT INTO user_login VALUES ('729', '1', '127.0.0.1', '2014-01-24 10:34:17');
INSERT INTO user_login VALUES ('730', '1', '127.0.0.1', '2014-01-24 10:40:37');
INSERT INTO user_login VALUES ('731', '1', '127.0.0.1', '2014-01-24 10:49:54');
INSERT INTO user_login VALUES ('732', '1', '127.0.0.1', '2014-01-24 10:53:31');
INSERT INTO user_login VALUES ('733', '1', '127.0.0.1', '2014-01-24 16:09:54');
INSERT INTO user_login VALUES ('734', '1', '127.0.0.1', '2014-01-24 16:17:11');
INSERT INTO user_login VALUES ('735', '1', '127.0.0.1', '2014-01-24 16:21:41');
INSERT INTO user_login VALUES ('736', '1', '127.0.0.1', '2014-01-24 16:24:56');
INSERT INTO user_login VALUES ('737', '1', '127.0.0.1', '2014-01-24 16:26:04');
INSERT INTO user_login VALUES ('738', '1', '127.0.0.1', '2014-01-24 16:27:49');
INSERT INTO user_login VALUES ('739', '1', '127.0.0.1', '2014-01-24 16:30:43');
INSERT INTO user_login VALUES ('740', '1', '127.0.0.1', '2014-01-24 16:46:18');
INSERT INTO user_login VALUES ('741', '1', '127.0.0.1', '2014-01-24 16:50:55');
INSERT INTO user_login VALUES ('742', '1', '127.0.0.1', '2014-01-24 16:51:04');
INSERT INTO user_login VALUES ('743', '1', '127.0.0.1', '2014-01-24 16:56:51');
INSERT INTO user_login VALUES ('744', '1', '127.0.0.1', '2014-01-24 17:11:22');
INSERT INTO user_login VALUES ('745', '1', '127.0.0.1', '2014-01-24 17:18:10');

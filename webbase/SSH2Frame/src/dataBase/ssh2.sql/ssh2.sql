/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.252
Source Server Version : 50513
Source Host           : 10.168.1.252:3306
Source Database       : ssh2

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2013-12-31 14:00:25
author:qinwei
versions:1.0
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dept_info`
-- ----------------------------
DROP TABLE IF EXISTS `dept_info`;
CREATE TABLE `dept_info` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `dept_manager` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '上级部门',
  `last_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dept_info
-- ----------------------------

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `last_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_info
-- ----------------------------

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
  `ruler_manager` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `ruler_target` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `order` int(10) DEFAULT '0' COMMENT '菜单排序,数字小的排序靠前',
  `last_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`ruler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ruler_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ruler_role`
-- ----------------------------
DROP TABLE IF EXISTS `ruler_role`;
CREATE TABLE `ruler_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `ruler_id` int(10) DEFAULT NULL,
  `ruler_word` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `last_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ruler_role
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL DEFAULT '',
  `user_passwd` varchar(30) NOT NULL DEFAULT '',
  `user_role` int(11) DEFAULT NULL,
  `user_birth` timestamp NULL DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT '',
  `user_department` int(11) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO user_info VALUES ('1', 'admin', 'admin', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_login`
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login_passwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login_ip` varchar(150) COLLATE utf8_unicode_ci DEFAULT '',
  `login_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO user_login VALUES ('1', '', '', '', null);

/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.252
Source Server Version : 50513
Source Host           : 10.168.1.252:3306
Source Database       : android

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2014-01-28 10:51:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_s_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dept`;
CREATE TABLE `t_s_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptCode` varchar(31) DEFAULT '',
  `deptName` varchar(31) DEFAULT '',
  `manager` varchar(31) DEFAULT 'root',
  `ctTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `deptCode` (`deptCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_dept
-- ----------------------------
INSERT INTO t_s_dept VALUES ('1', '', '', 'root', null, '1');

-- ----------------------------
-- Table structure for `t_s_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleCode` varchar(31) DEFAULT '',
  `roleName` varchar(31) DEFAULT '',
  `ctTime` timestamp NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `roleCode` (`roleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
INSERT INTO t_s_role VALUES ('1', '', '', null, '1');

-- ----------------------------
-- Table structure for `t_s_role_ruler`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_ruler`;
CREATE TABLE `t_s_role_ruler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleCode` varchar(31) DEFAULT '',
  `rulerCode` varchar(31) DEFAULT '',
  `rulerWord` varchar(31) DEFAULT '',
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `roleCode` (`roleCode`),
  KEY `rulerCode` (`rulerCode`),
  CONSTRAINT `roleruler_roleCode` FOREIGN KEY (`roleCode`) REFERENCES `t_s_role` (`roleCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleruler_rulerCode` FOREIGN KEY (`rulerCode`) REFERENCES `t_s_ruler` (`rulerCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_role_ruler
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_ruler`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ruler`;
CREATE TABLE `t_s_ruler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rulerCode` varchar(31) DEFAULT '',
  `mananger` varchar(31) DEFAULT '' COMMENT 'Parent Ruler Code',
  `rulerName` varchar(31) DEFAULT '',
  `page` varchar(255) DEFAULT '',
  `level` int(2) DEFAULT '0',
  `sequence` int(2) DEFAULT '0',
  `echo` int(1) DEFAULT '1',
  `target` varchar(127) DEFAULT '',
  `ctTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  `desp` varchar(255) DEFAULT '' COMMENT 'description',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `rulerCode` (`rulerCode`),
  KEY `mananger` (`mananger`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_ruler
-- ----------------------------
INSERT INTO t_s_ruler VALUES ('1', '', '', '', '', '0', '0', '1', '', null, '1', '');

-- ----------------------------
-- Table structure for `t_s_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE `t_s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userCode` varchar(63) DEFAULT '',
  `userName` varchar(63) DEFAULT '',
  `deptCode` varchar(63) DEFAULT '',
  `password` varchar(63) DEFAULT '',
  `photo` varchar(255) DEFAULT '',
  `group` varchar(15) DEFAULT '',
  `lastLoginTime` timestamp NULL DEFAULT NULL,
  `lastLoginIp` varchar(63) DEFAULT NULL COMMENT 'Support IPV6',
  `ctTime` timestamp NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `userCode` (`userCode`),
  KEY `userName` (`userName`),
  KEY `deptCode` (`deptCode`),
  KEY `lastLoginIp` (`lastLoginIp`),
  CONSTRAINT `user_deptCode` FOREIGN KEY (`deptCode`) REFERENCES `t_s_dept` (`deptCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_user
-- ----------------------------
INSERT INTO t_s_user VALUES ('1', '', '', '', '', '', '', null, null, null, '1');

-- ----------------------------
-- Table structure for `t_s_user_ruler`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_ruler`;
CREATE TABLE `t_s_user_ruler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userCode` varchar(31) DEFAULT '',
  `rulerCode` varchar(31) DEFAULT '',
  `rulerWord` varchar(31) DEFAULT '',
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `userCode` (`userCode`),
  KEY `rulerCode` (`rulerCode`),
  CONSTRAINT `userruler_rulerCode` FOREIGN KEY (`rulerCode`) REFERENCES `t_s_ruler` (`rulerCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userruler_userCode` FOREIGN KEY (`userCode`) REFERENCES `t_s_user` (`userCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_user_ruler
-- ----------------------------

-- ----------------------------
-- Table structure for `t_u_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_file`;
CREATE TABLE `t_u_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL COMMENT 'Display Name',
  `fileType` varchar(15) DEFAULT NULL COMMENT 'File Ext Name',
  `pathFlag` int(1) NOT NULL DEFAULT '1' COMMENT '0: absolute path \r\n1: current path sub project \r\n2: sub webapp',
  `path` varchar(255) DEFAULT NULL,
  `securityLevel` int(2) DEFAULT '0' COMMENT 'SecurityLevel',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fileName` (`fileName`),
  KEY `fileType` (`fileType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_u_file
-- ----------------------------

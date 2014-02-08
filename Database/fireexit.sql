/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.250
Source Server Version : 50155
Source Host           : 10.168.1.250:3306
Source Database       : fireexit

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2013-12-19 15:19:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `areaset`
-- ----------------------------
DROP TABLE IF EXISTS `areaset`;
CREATE TABLE `areaset` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'serial number',
  `cameraID` int(4) unsigned NOT NULL COMMENT 'camera id',
  `event` varchar(20) NOT NULL COMMENT 'event id',
  `typeArea` int(2) unsigned NOT NULL COMMENT 'area type 1:标记区域，2：标记警戒区，3：标记方向 4：标记排除区 ',
  `insTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'insert time',
  `userId` int(4) unsigned NOT NULL COMMENT 'user id',
  `para` varchar(256) NOT NULL COMMENT 'point para',
  `paraRaw` varchar(256) DEFAULT NULL,
  `img` varchar(256) DEFAULT NULL COMMENT 'image path',
  `width` int(4) DEFAULT NULL,
  `height` int(4) DEFAULT NULL,
  `fill` varchar(20) NOT NULL COMMENT 'fill color value',
  `stroke` varchar(20) NOT NULL COMMENT 'stroke color value',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='area set table';

-- ----------------------------
-- Records of areaset
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_attribute`;
CREATE TABLE `camera_event_attribute` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) DEFAULT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(20) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(20) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(20) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342140 DEFAULT CHARSET=utf8 COMMENT='Camera_Event_attribute-事件表  闯红灯';

-- ----------------------------
-- Records of camera_event_attribute
-- ----------------------------

INSERT INTO camera_event_attribute VALUES ('342128', '1', '2013-05-08 10:53:41', 'KK', 'COM_WARN', '京P02157', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/DH219/2013_05_08_10_53_41_0.jpg', '/pic/DH219/2013_05_08_10_53_41_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342129', '2', '2013-05-08 10:53:43', 'KK', 'COM_WARN', '辽PU2157', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/HK142/2013_05_08_10_53_43_0.jpg', '/pic/HK142/2013_05_08_10_53_43_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342130', '1', '2013-05-08 10:53:49', 'KK', 'COM_WARN', '', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/DH219/2013_05_08_10_53_49_0.jpg', '/pic/DH219/2013_05_08_10_53_49_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342131', '2', '2013-05-08 10:53:49', 'KK', 'COM_WARN', '', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/HK142/2013_05_08_10_53_49_0.jpg', '/pic/HK142/2013_05_08_10_53_49_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342132', '1', '2013-05-08 10:53:56', 'KK', 'COM_WARN', '京N75M08', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/DH219/2013_05_08_10_53_56_0.jpg', '/pic/DH219/2013_05_08_10_53_56_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342133', '2', '2013-05-08 10:53:56', 'KK', 'COM_WARN', '贵NY5M08', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/HK142/2013_05_08_10_53_56_0.jpg', '/pic/HK142/2013_05_08_10_53_56_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342134', '1', '2013-05-08 10:53:57', 'KK', 'COM_WARN', '津BE0860', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/DH219/2013_05_08_10_53_57_0.jpg', '/pic/DH219/2013_05_08_10_53_57_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342135', '2', '2013-05-08 10:53:59', 'KK', 'COM_WARN', '贵BE0866', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/HK142/2013_05_08_10_53_59_0.jpg', '/pic/HK142/2013_05_08_10_53_59_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342136', '1', '2013-05-08 10:54:34', 'KK', 'COM_WARN', '京F11143', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/DH219/2013_05_08_10_54_34_0.jpg', '/pic/DH219/2013_05_08_10_54_34_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342137', '2', '2013-05-08 10:54:34', 'KK', 'COM_WARN', '京E11143', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/HK142/2013_05_08_10_54_34_0.jpg', '/pic/HK142/2013_05_08_10_54_34_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342138', '2', '2013-05-08 10:54:41', 'KK', 'COM_WARN', '京NA2S22', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/HK142/2013_05_08_10_54_41_0.jpg', '/pic/HK142/2013_05_08_10_54_41_0a.jpg', '`?', '');
INSERT INTO camera_event_attribute VALUES ('342139', '1', '2013-05-08 10:54:44', 'KK', 'COM_WARN', '京HB4540', '0', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '/pic/DH219/2013_05_08_10_54_44_0.jpg', '/pic/DH219/2013_05_08_10_54_44_0a.jpg', '`?', '');

-- ----------------------------
-- Table structure for `camera_event_chd`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_chd`;
CREATE TABLE `camera_event_chd` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) DEFAULT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(20) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(20) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_CHD-事件表  闯红灯';

-- ----------------------------
-- Records of camera_event_chd
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_cll`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_cll`;
CREATE TABLE `camera_event_cll` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraid` int(4) NOT NULL COMMENT '摄像头主键',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `trafficFlow` int(11) DEFAULT NULL COMMENT '车流量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_CLL-事件表  车流量';

-- ----------------------------
-- Records of camera_event_cll
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_kk`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_kk`;
CREATE TABLE `camera_event_kk` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(2) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_KK- 卡口';

-- ----------------------------
-- Records of camera_event_kk
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_nx`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_nx`;
CREATE TABLE `camera_event_nx` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(20) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(2) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_NX-事件表  逆行';

-- ----------------------------
-- Records of camera_event_nx
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_pdcd`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_pdcd`;
CREATE TABLE `camera_event_pdcd` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraid` int(4) NOT NULL COMMENT '摄像头主键',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `lineLength` float DEFAULT NULL COMMENT '排队长度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_PDCD-事件表  排队长度';

-- ----------------------------
-- Records of camera_event_pdcd
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_sfz`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_sfz`;
CREATE TABLE `camera_event_sfz` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(2) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_SFZ- 事件表  收费站';

-- ----------------------------
-- Records of camera_event_sfz
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_tlsjc`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_tlsjc`;
CREATE TABLE `camera_event_tlsjc` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) DEFAULT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(20) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(20) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_tlsjc-事件表  闯红灯';

-- ----------------------------
-- Records of camera_event_tlsjc
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_wcp`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_wcp`;
CREATE TABLE `camera_event_wcp` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of camera_event_wcp
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_wgbd`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_wgbd`;
CREATE TABLE `camera_event_wgbd` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(2) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='Camera_Event_WGBD-事件表 违规变道';

-- ----------------------------
-- Records of camera_event_wgbd
-- ----------------------------
INSERT INTO camera_event_wgbd VALUES ('71', '1', '2013-03-22 17:52:52', 'WGBD', 'COM_WARN', '', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_52_52_0.jpg', '/pic/DH219/2013_03_22_17_52_52_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('72', '1', '2013-03-22 17:52:57', 'WGBD', 'COM_WARN', '京JH8837', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_52_57_0.jpg', '/pic/DH219/2013_03_22_17_52_57_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('73', '1', '2013-03-22 17:52:57', 'WGBD', 'COM_WARN', '', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_52_57_0.jpg', '/pic/DH219/2013_03_22_17_52_57_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('74', '1', '2013-03-22 17:53:00', 'WGBD', 'COM_WARN', '赣NN9488', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_00_0.jpg', '/pic/DH219/2013_03_22_17_53_00_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('75', '1', '2013-03-22 17:53:00', 'WGBD', 'COM_WARN', '辽E5AV93', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_00_0.jpg', '/pic/DH219/2013_03_22_17_53_00_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('76', '1', '2013-03-22 17:53:01', 'WGBD', 'COM_WARN', '', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_01_0.jpg', '/pic/DH219/2013_03_22_17_53_01_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('77', '1', '2013-03-22 17:53:01', 'WGBD', 'COM_WARN', '辽P395W1', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_01_0.jpg', '/pic/DH219/2013_03_22_17_53_01_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('78', '1', '2013-03-22 17:53:05', 'WGBD', 'COM_WARN', '京J30677', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_05_0.jpg', '/pic/DH219/2013_03_22_17_53_05_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('79', '1', '2013-03-22 17:53:09', 'WGBD', 'COM_WARN', '津B51312', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_09_0.jpg', '/pic/DH219/2013_03_22_17_53_09_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('80', '1', '2013-03-22 17:53:10', 'WGBD', 'COM_WARN', '', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_10_0.jpg', '/pic/DH219/2013_03_22_17_53_10_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('81', '1', '2013-03-22 17:53:11', 'WGBD', 'COM_WARN', '赣PRQ218', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_11_0.jpg', '/pic/DH219/2013_03_22_17_53_11_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('82', '1', '2013-03-22 17:53:11', 'WGBD', 'COM_WARN', '', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_11_0.jpg', '/pic/DH219/2013_03_22_17_53_11_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('83', '1', '2013-03-22 17:53:12', 'WGBD', 'COM_WARN', '赣P189T1', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_12_0.jpg', '/pic/DH219/2013_03_22_17_53_12_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('84', '1', '2013-03-22 17:53:13', 'WGBD', 'COM_WARN', '', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_13_0.jpg', '/pic/DH219/2013_03_22_17_53_13_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('85', '1', '2013-03-22 17:53:14', 'WGBD', 'COM_WARN', '赣NW4955', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_14_0.jpg', '/pic/DH219/2013_03_22_17_53_14_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('86', '1', '2013-03-22 17:53:25', 'WGBD', 'COM_WARN', '京BK8826', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_25_0.jpg', '/pic/DH219/2013_03_22_17_53_25_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('87', '1', '2013-03-22 17:53:28', 'WGBD', 'COM_WARN', '赣MT1292', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_28_0.jpg', '/pic/DH219/2013_03_22_17_53_28_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('88', '1', '2013-03-22 17:53:32', 'WGBD', 'COM_WARN', '京BE6927', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_53_32_0.jpg', '/pic/DH219/2013_03_22_17_53_32_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('89', '1', '2013-03-22 17:54:03', 'WGBD', 'COM_WARN', '津NA7J08', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_03_0.jpg', '/pic/DH219/2013_03_22_17_54_03_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('90', '1', '2013-03-22 17:54:09', 'WGBD', 'COM_WARN', '津P20758', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_09_0.jpg', '/pic/DH219/2013_03_22_17_54_09_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('91', '1', '2013-03-22 17:54:16', 'WGBD', 'COM_WARN', '贵PS2163', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_16_0.jpg', '/pic/DH219/2013_03_22_17_54_16_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('92', '1', '2013-03-22 17:54:25', 'WGBD', 'COM_WARN', '京ME5089', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_25_0.jpg', '/pic/DH219/2013_03_22_17_54_25_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('93', '1', '2013-03-22 17:54:27', 'WGBD', 'COM_WARN', '赣A83M82', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_27_0.jpg', '/pic/DH219/2013_03_22_17_54_27_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('94', '1', '2013-03-22 17:54:33', 'WGBD', 'COM_WARN', '贵NS8693', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_33_0.jpg', '/pic/DH219/2013_03_22_17_54_33_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('95', '1', '2013-03-22 17:54:40', 'WGBD', 'COM_WARN', '京LJ3968', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_40_0.jpg', '/pic/DH219/2013_03_22_17_54_40_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('96', '1', '2013-03-22 17:54:41', 'WGBD', 'COM_WARN', '贵E07366', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_41_0.jpg', '/pic/DH219/2013_03_22_17_54_41_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('97', '1', '2013-03-22 17:54:52', 'WGBD', 'COM_WARN', '赣J15291', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_52_0.jpg', '/pic/DH219/2013_03_22_17_54_52_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('98', '1', '2013-03-22 17:54:53', 'WGBD', 'COM_WARN', '京P31J78', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_53_0.jpg', '/pic/DH219/2013_03_22_17_54_53_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('99', '1', '2013-03-22 17:54:57', 'WGBD', 'COM_WARN', '皖RQM058', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_54_57_0.jpg', '/pic/DH219/2013_03_22_17_54_57_0a.jpg', '', '');
INSERT INTO camera_event_wgbd VALUES ('100', '1', '2013-03-22 17:55:03', 'WGBD', 'COM_WARN', '京MJ0908', '0', 'UN', 'UN', 'UN', 'UN', '/pic/DH219/2013_03_22_17_55_03_0.jpg', '/pic/DH219/2013_03_22_17_55_03_0a.jpg', '', '');

-- ----------------------------
-- Table structure for `camera_event_wztc`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_wztc`;
CREATE TABLE `camera_event_wztc` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(2) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_WZTC-事件表 违章停车 ';

-- ----------------------------
-- Records of camera_event_wztc
-- ----------------------------

-- ----------------------------
-- Table structure for `camera_event_yhx`
-- ----------------------------
DROP TABLE IF EXISTS `camera_event_yhx`;
CREATE TABLE `camera_event_yhx` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `chktm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `event` varchar(8) DEFAULT NULL COMMENT '事件代码',
  `grade` varchar(8) DEFAULT NULL COMMENT '事件级别(00:预警，01：一般报警，02：严重报警)',
  `pltnum` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(2) DEFAULT NULL COMMENT '速度',
  `logo` varchar(2) DEFAULT NULL COMMENT '车标代码',
  `color` varchar(2) DEFAULT NULL COMMENT '车辆颜色代码',
  `lpcolor` varchar(2) DEFAULT NULL COMMENT '车牌颜色代码',
  `model` varchar(2) DEFAULT NULL COMMENT '车型代码',
  `imageL` varchar(64) DEFAULT NULL COMMENT '放大图',
  `imageA` varchar(64) DEFAULT NULL COMMENT '事件图片A',
  `imageB` varchar(64) DEFAULT NULL COMMENT '事件图片B',
  `imageC` varchar(64) DEFAULT NULL COMMENT '事件图片C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Camera_Event_YHX- 事件表 压黄线';

-- ----------------------------
-- Records of camera_event_yhx
-- ----------------------------

-- ----------------------------
-- Table structure for `caminf`
-- ----------------------------
DROP TABLE IF EXISTS `caminf`;
CREATE TABLE `caminf` (
  `cameraID` int(4) NOT NULL AUTO_INCREMENT COMMENT '摄像头ID',
  `server` int(2) unsigned DEFAULT '0' COMMENT ' server that the camera include',
  `nvrId` int(4) DEFAULT NULL,
  `nvrChannel` int(11) DEFAULT '0',
  `cameraName` varchar(100) DEFAULT NULL COMMENT '摄像头名称',
  `producer` varchar(255) DEFAULT NULL COMMENT '类型（1:大华 2:海康''）',
  `netaddr` varchar(48) DEFAULT NULL COMMENT '摄像头网路地址（IP4/IP6）',
  `netmask` varchar(32) DEFAULT NULL,
  `port` int(4) unsigned zerofill DEFAULT NULL,
  `gate` varchar(32) DEFAULT NULL,
  `adminuser` varchar(56) DEFAULT NULL,
  `adminpass` varchar(32) DEFAULT NULL,
  `geoloc` varchar(48) NOT NULL DEFAULT 'dl' COMMENT '地理信息',
  `state` varchar(1) DEFAULT NULL COMMENT '摄像头状态',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `usingTime` varchar(20) DEFAULT NULL COMMENT '启用时间（2012--09-12）',
  `stopTime` varchar(20) DEFAULT NULL COMMENT '停用时间（2012--09-12）',
  `flag` varchar(1) DEFAULT NULL COMMENT '有效标示(1:有效，0，无效)',
  `notes` varchar(100) DEFAULT NULL COMMENT '摄像头注释',
  PRIMARY KEY (`cameraID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='CamInf 摄像头描述表';

-- ----------------------------
-- Records of caminf
-- ----------------------------
INSERT INTO caminf VALUES ('2', '1', '0', '0', 'HK142', 'hk', '10.168.1.142', '255.255.255.0', '8000', '10.168.1.1', 'admin', '12345', 'dl', '1', '116.326968', '40.038734', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('3', '5', '0', '0', 'DH219', 'dh', '10.168.1.219', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', '116.322907', '40.039784', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('4', '2', '0', '0', 'HK142', 'hk', '10.168.1.142', '255.255.255.0', '8000', '10.168.1.1', 'admin', '12345', 'dl', '1', '116.324057', '40.035807', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('5', '1', '0', '0', 'DH111', 'dh', '10.168.1.111', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', '116.319709', '40.035171', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('6', '4', '0', '0', 'DH142', 'dh', '10.168.1.142', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', '116.318488', '40.039093', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('7', '5', '0', '0', 'DH220', 'dh', '10.168.1.220', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', '116.321362', '40.04325', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('8', '5', '0', '0', 'DH212', 'dh', '10.168.1.212', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', '116.313601', '40.041386', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('9', '5', '0', '0', 'DH219', 'dh', '10.168.1.219', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', '116.317266', '40.042131', '2013-04-25 14:42', '', '1', 'note');
INSERT INTO caminf VALUES ('10', '3', '0', '0', 'DH111', 'dh', '10.168.1.111', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', null, null, null, null, '1', 'note');
INSERT INTO caminf VALUES ('11', '5', '0', '0', 'DH112', 'dh', '10.168.1.112', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', null, null, null, null, '1', 'note');
INSERT INTO caminf VALUES ('12', '3', '0', '0', 'DH113', 'dh', '10.168.1.113', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', null, null, null, null, '1', 'note');
INSERT INTO caminf VALUES ('13', '5', '0', '0', 'DH115', 'dh', '10.168.1.115', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'dl', '1', null, null, null, null, '1', 'note');
INSERT INTO caminf VALUES ('14', '1', '0', '0', 'HK143', 'hk', '10.168.1.143', '255.255.255.0', '8000', '10.168.1.1', 'admin', '12345', 'dl', '1', null, null, null, null, '1', 'note');
INSERT INTO caminf VALUES ('15', '2', '0', '0', 'HK143', 'hk', '10.168.1.143', '255.255.255.0', '8000', '10.168.1.1', 'admin', '12345', 'dl', '1', null, null, null, null, '1', 'note');

-- ----------------------------
-- Table structure for `caminf_copy`
-- ----------------------------
DROP TABLE IF EXISTS `caminf_copy`;
CREATE TABLE `caminf_copy` (
  `cameraID` int(4) NOT NULL AUTO_INCREMENT COMMENT '摄像头ID',
  `server` int(2) unsigned NOT NULL COMMENT ' server that the camera include',
  `nvrId` int(4) NOT NULL,
  `nvrChannel` int(11) NOT NULL DEFAULT '0',
  `cameraName` varchar(100) DEFAULT NULL COMMENT '摄像头名称',
  `producer` varchar(2) DEFAULT NULL COMMENT '类型（1:大华 2:海康''）',
  `netaddr` varchar(48) DEFAULT NULL COMMENT '摄像头网路地址（IP4/IP6）',
  `netmask` varchar(32) DEFAULT NULL,
  `port` int(4) unsigned zerofill DEFAULT NULL,
  `gate` varchar(32) DEFAULT NULL,
  `adminuser` varchar(56) NOT NULL,
  `adminpass` varchar(32) NOT NULL,
  `geoloc` varchar(48) DEFAULT NULL COMMENT '地理信息',
  `state` varchar(1) DEFAULT NULL COMMENT '摄像头状态',
  `longitude` varchar(8) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(8) DEFAULT NULL COMMENT '纬度',
  `usingTime` varchar(20) DEFAULT NULL COMMENT '启用时间（2012--09-12）',
  `stopTime` varchar(20) DEFAULT NULL COMMENT '停用时间（2012--09-12）',
  `flag` varchar(1) NOT NULL COMMENT '有效标示(1:有效，0，无效)',
  `notes` varchar(100) DEFAULT NULL COMMENT '摄像头注释',
  PRIMARY KEY (`cameraID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CamInf 摄像头描述表';

-- ----------------------------
-- Records of caminf_copy
-- ----------------------------
INSERT INTO caminf_copy VALUES ('1', '1', '0', '0', 'DH219', 'dh', '10.168.1.219', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'beijing', '1', '11', '22', '1', '1', '1', 'note');
INSERT INTO caminf_copy VALUES ('2', '1', '0', '0', 'DH211', 'dh', '10.168.1.211', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'beijing', '1', '11', '22', '1', '1', '1', 'note');
INSERT INTO caminf_copy VALUES ('3', '2', '0', '0', 'DH219', 'dh', '10.168.1.219', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'beijing2', '1', '11', '22', '1', '1', '1', 'note');
INSERT INTO caminf_copy VALUES ('4', '2', '0', '0', 'DH211', 'dh', '10.168.1.211', '255.255.255.0', '37777', '10.168.1.1', 'admin', 'admin', 'beijing2', '1', '11', '22', '1', '1', '1', 'note');

-- ----------------------------
-- Table structure for `column`
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `cid` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'main column id',
  `name` varchar(256) NOT NULL COMMENT 'column name',
  `description` varchar(256) NOT NULL,
  `tempNum` int(4) NOT NULL COMMENT 'template Number',
  `serNum` int(11) DEFAULT NULL COMMENT 'serial number',
  `haveSub` int(1) DEFAULT '0' COMMENT 'have sub column or not',
  `picPath` varchar(256) DEFAULT NULL COMMENT 'column picture path',
  `picPath2` varchar(256) DEFAULT NULL,
  `picPathText` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='main columnid';

-- ----------------------------
-- Records of column
-- ----------------------------
INSERT INTO column VALUES ('1', '智能显示', '', '2', '1', '0', '', '', '');
INSERT INTO column VALUES ('3', '智能配置', '', '2', '3', '0', null, null, null);
INSERT INTO column VALUES ('4', '智能分析', '', '2', '4', '0', '', '', '');
INSERT INTO column VALUES ('5', '智能报表', '', '2', '5', '0', '', '', '');
INSERT INTO column VALUES ('6', '分析服务器', '', '2', '7', '0', '', '', '');
INSERT INTO column VALUES ('7', '摄像头管理', '', '2', '6', '0', '', '', '');
INSERT INTO column VALUES ('8', '用户管理', '', '2', '8', '0', '', '', '');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(160) NOT NULL,
  `printable_name` varchar(80) CHARACTER SET utf8 NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO country VALUES ('1', 'AF', 'http://127.0.0.1/phpMyAdmin-3.5.3-all-languages/themes/pmahomme/img/logo_left.png', 'Afghanistan中国', 'AFG', '4');
INSERT INTO country VALUES ('2', 'AL', 'ALBANIA', 'Albania', 'ALB', '8');
INSERT INTO country VALUES ('3', 'DZ', 'ALGERIA', 'Algeria', 'DZA', '12');
INSERT INTO country VALUES ('4', 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', '16');
INSERT INTO country VALUES ('5', 'AD', 'ANDORRA', 'Andorra', 'AND', '20');
INSERT INTO country VALUES ('6', 'AO', 'ANGOLA', 'Angola', 'AGO', '24');
INSERT INTO country VALUES ('7', 'AI', 'ANGUILLA', 'Anguilla', 'AIA', '660');
INSERT INTO country VALUES ('8', 'AQ', 'ANTARCTICA', 'Antarctica', null, null);
INSERT INTO country VALUES ('9', 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', '28');
INSERT INTO country VALUES ('10', 'AR', 'ARGENTINA', 'Argentina', 'ARG', '32');
INSERT INTO country VALUES ('11', 'AM', 'ARMENIA', 'Armenia', 'ARM', '51');
INSERT INTO country VALUES ('12', 'AW', 'ARUBA', 'Aruba', 'ABW', '533');
INSERT INTO country VALUES ('13', 'AU', 'AUSTRALIA', 'Australia', 'AUS', '36');
INSERT INTO country VALUES ('14', 'AT', 'AUSTRIA', 'Austria', 'AUT', '40');
INSERT INTO country VALUES ('15', 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', '31');
INSERT INTO country VALUES ('16', 'BS', 'BAHAMAS', 'Bahamas', 'BHS', '44');
INSERT INTO country VALUES ('17', 'BH', 'BAHRAIN', 'Bahrain', 'BHR', '48');
INSERT INTO country VALUES ('18', 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', '50');
INSERT INTO country VALUES ('19', 'BB', 'BARBADOS', 'Barbados', 'BRB', '52');
INSERT INTO country VALUES ('20', 'BY', 'BELARUS', 'Belarus', 'BLR', '112');
INSERT INTO country VALUES ('21', 'BE', 'BELGIUM', 'Belgium', 'BEL', '56');
INSERT INTO country VALUES ('22', 'BZ', 'BELIZE', 'Belize', 'BLZ', '84');
INSERT INTO country VALUES ('23', 'BJ', 'BENIN', 'Benin', 'BEN', '204');
INSERT INTO country VALUES ('24', 'BM', 'BERMUDA', 'Bermuda', 'BMU', '60');
INSERT INTO country VALUES ('25', 'BT', 'BHUTAN', 'Bhutan', 'BTN', '64');
INSERT INTO country VALUES ('26', 'BO', 'BOLIVIA', 'Bolivia', 'BOL', '68');
INSERT INTO country VALUES ('27', 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', '70');
INSERT INTO country VALUES ('28', 'BW', 'BOTSWANA', 'Botswana', 'BWA', '72');
INSERT INTO country VALUES ('29', 'BV', 'BOUVET ISLAND', 'Bouvet Island', null, null);
INSERT INTO country VALUES ('30', 'BR', 'BRAZIL', 'Brazil', 'BRA', '76');
INSERT INTO country VALUES ('31', 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', null, null);
INSERT INTO country VALUES ('32', 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', '96');
INSERT INTO country VALUES ('33', 'BG', 'BULGARIA', 'Bulgaria', 'BGR', '100');
INSERT INTO country VALUES ('34', 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', '854');
INSERT INTO country VALUES ('35', 'BI', 'BURUNDI', 'Burundi', 'BDI', '108');
INSERT INTO country VALUES ('36', 'KH', 'CAMBODIA', 'Cambodia', 'KHM', '116');
INSERT INTO country VALUES ('37', 'CM', 'CAMEROON', 'Cameroon', 'CMR', '120');
INSERT INTO country VALUES ('38', 'CA', 'CANADA', 'Canada', 'CAN', '124');
INSERT INTO country VALUES ('39', 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', '132');
INSERT INTO country VALUES ('40', 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', '136');
INSERT INTO country VALUES ('41', 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', '140');
INSERT INTO country VALUES ('42', 'TD', 'CHAD', 'Chad', 'TCD', '148');
INSERT INTO country VALUES ('43', 'CL', 'CHILE', 'Chile', 'CHL', '152');
INSERT INTO country VALUES ('44', 'CN', 'CHINA', 'China', 'CHN', '156');
INSERT INTO country VALUES ('45', 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', null, null);
INSERT INTO country VALUES ('46', 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', null, null);
INSERT INTO country VALUES ('47', 'CO', 'COLOMBIA', 'Colombia', 'COL', '170');
INSERT INTO country VALUES ('48', 'KM', 'COMOROS', 'Comoros', 'COM', '174');
INSERT INTO country VALUES ('49', 'CG', 'CONGO', 'Congo', 'COG', '178');
INSERT INTO country VALUES ('50', 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', '180');
INSERT INTO country VALUES ('51', 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', '184');
INSERT INTO country VALUES ('52', 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', '188');
INSERT INTO country VALUES ('53', 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', '384');
INSERT INTO country VALUES ('54', 'HR', 'CROATIA', 'Croatia', 'HRV', '191');
INSERT INTO country VALUES ('55', 'CU', 'CUBA', 'Cuba', 'CUB', '192');
INSERT INTO country VALUES ('56', 'CY', 'CYPRUS', 'Cyprus', 'CYP', '196');
INSERT INTO country VALUES ('57', 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', '203');
INSERT INTO country VALUES ('58', 'DK', 'DENMARK', 'Denmark', 'DNK', '208');
INSERT INTO country VALUES ('59', 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', '262');
INSERT INTO country VALUES ('60', 'DM', 'DOMINICA', 'Dominica', 'DMA', '212');
INSERT INTO country VALUES ('61', 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', '214');
INSERT INTO country VALUES ('62', 'EC', 'ECUADOR', 'Ecuador', 'ECU', '218');
INSERT INTO country VALUES ('63', 'EG', 'EGYPT', 'Egypt', 'EGY', '818');
INSERT INTO country VALUES ('64', 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', '222');
INSERT INTO country VALUES ('65', 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', '226');
INSERT INTO country VALUES ('66', 'ER', 'ERITREA', 'Eritrea', 'ERI', '232');
INSERT INTO country VALUES ('67', 'EE', 'ESTONIA', 'Estonia', 'EST', '233');
INSERT INTO country VALUES ('68', 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', '231');
INSERT INTO country VALUES ('69', 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', '238');
INSERT INTO country VALUES ('70', 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', '234');
INSERT INTO country VALUES ('71', 'FJ', 'FIJI', 'Fiji', 'FJI', '242');
INSERT INTO country VALUES ('72', 'FI', 'FINLAND', 'Finland', 'FIN', '246');
INSERT INTO country VALUES ('73', 'FR', 'FRANCE', 'France', 'FRA', '250');
INSERT INTO country VALUES ('74', 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', '254');
INSERT INTO country VALUES ('75', 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', '258');
INSERT INTO country VALUES ('76', 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', null, null);
INSERT INTO country VALUES ('77', 'GA', 'GABON', 'Gabon', 'GAB', '266');
INSERT INTO country VALUES ('78', 'GM', 'GAMBIA', 'Gambia', 'GMB', '270');
INSERT INTO country VALUES ('79', 'GE', 'GEORGIA', 'Georgia', 'GEO', '268');
INSERT INTO country VALUES ('80', 'DE', 'GERMANY', 'Germany', 'DEU', '276');
INSERT INTO country VALUES ('81', 'GH', 'GHANA', 'Ghana', 'GHA', '288');
INSERT INTO country VALUES ('82', 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', '292');
INSERT INTO country VALUES ('83', 'GR', 'GREECE', 'Greece', 'GRC', '300');
INSERT INTO country VALUES ('84', 'GL', 'GREENLAND', 'Greenland', 'GRL', '304');
INSERT INTO country VALUES ('85', 'GD', 'GRENADA', 'Grenada', 'GRD', '308');
INSERT INTO country VALUES ('86', 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', '312');
INSERT INTO country VALUES ('87', 'GU', 'GUAM', 'Guam', 'GUM', '316');
INSERT INTO country VALUES ('88', 'GT', 'GUATEMALA', 'Guatemala', 'GTM', '320');
INSERT INTO country VALUES ('89', 'GN', 'GUINEA', 'Guinea', 'GIN', '324');
INSERT INTO country VALUES ('90', 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', '624');
INSERT INTO country VALUES ('91', 'GY', 'GUYANA', 'Guyana', 'GUY', '328');
INSERT INTO country VALUES ('92', 'HT', 'HAITI', 'Haiti', 'HTI', '332');
INSERT INTO country VALUES ('93', 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', null, null);
INSERT INTO country VALUES ('94', 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', '336');
INSERT INTO country VALUES ('95', 'HN', 'HONDURAS', 'Honduras', 'HND', '340');
INSERT INTO country VALUES ('96', 'HK', 'HONG KONG', 'Hong Kong', 'HKG', '344');
INSERT INTO country VALUES ('97', 'HU', 'HUNGARY', 'Hungary', 'HUN', '348');
INSERT INTO country VALUES ('98', 'IS', 'ICELAND', 'Iceland', 'ISL', '352');
INSERT INTO country VALUES ('99', 'IN', 'INDIA', 'India', 'IND', '356');
INSERT INTO country VALUES ('100', 'ID', 'INDONESIA', 'Indonesia', 'IDN', '360');
INSERT INTO country VALUES ('101', 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', '364');
INSERT INTO country VALUES ('102', 'IQ', 'IRAQ', 'Iraq', 'IRQ', '368');
INSERT INTO country VALUES ('103', 'IE', 'IRELAND', 'Ireland', 'IRL', '372');
INSERT INTO country VALUES ('104', 'IL', 'ISRAEL', 'Israel', 'ISR', '376');
INSERT INTO country VALUES ('105', 'IT', 'ITALY', 'Italy', 'ITA', '380');
INSERT INTO country VALUES ('106', 'JM', 'JAMAICA', 'Jamaica', 'JAM', '388');
INSERT INTO country VALUES ('107', 'JP', 'JAPAN', 'Japan', 'JPN', '392');
INSERT INTO country VALUES ('108', 'JO', 'JORDAN', 'Jordan', 'JOR', '400');
INSERT INTO country VALUES ('109', 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', '398');
INSERT INTO country VALUES ('110', 'KE', 'KENYA', 'Kenya', 'KEN', '404');
INSERT INTO country VALUES ('111', 'KI', 'KIRIBATI', 'Kiribati', 'KIR', '296');
INSERT INTO country VALUES ('112', 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', '408');
INSERT INTO country VALUES ('113', 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', '410');
INSERT INTO country VALUES ('114', 'KW', 'KUWAIT', 'Kuwait', 'KWT', '414');
INSERT INTO country VALUES ('115', 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', '417');
INSERT INTO country VALUES ('116', 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', '418');
INSERT INTO country VALUES ('117', 'LV', 'LATVIA', 'Latvia', 'LVA', '428');
INSERT INTO country VALUES ('118', 'LB', 'LEBANON', 'Lebanon', 'LBN', '422');
INSERT INTO country VALUES ('119', 'LS', 'LESOTHO', 'Lesotho', 'LSO', '426');
INSERT INTO country VALUES ('120', 'LR', 'LIBERIA', 'Liberia', 'LBR', '430');
INSERT INTO country VALUES ('121', 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', '434');
INSERT INTO country VALUES ('122', 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', '438');
INSERT INTO country VALUES ('123', 'LT', 'LITHUANIA', 'Lithuania', 'LTU', '440');
INSERT INTO country VALUES ('124', 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', '442');
INSERT INTO country VALUES ('125', 'MO', 'MACAO', 'Macao', 'MAC', '446');
INSERT INTO country VALUES ('126', 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', '807');
INSERT INTO country VALUES ('127', 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', '450');
INSERT INTO country VALUES ('128', 'MW', 'MALAWI', 'Malawi', 'MWI', '454');
INSERT INTO country VALUES ('129', 'MY', 'MALAYSIA', 'Malaysia', 'MYS', '458');
INSERT INTO country VALUES ('130', 'MV', 'MALDIVES', 'Maldives', 'MDV', '462');
INSERT INTO country VALUES ('131', 'ML', 'MALI', 'Mali', 'MLI', '466');
INSERT INTO country VALUES ('132', 'MT', 'MALTA', 'Malta', 'MLT', '470');
INSERT INTO country VALUES ('133', 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', '584');
INSERT INTO country VALUES ('134', 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', '474');
INSERT INTO country VALUES ('135', 'MR', 'MAURITANIA', 'Mauritania', 'MRT', '478');
INSERT INTO country VALUES ('136', 'MU', 'MAURITIUS', 'Mauritius', 'MUS', '480');
INSERT INTO country VALUES ('137', 'YT', 'MAYOTTE', 'Mayotte', null, null);
INSERT INTO country VALUES ('138', 'MX', 'MEXICO', 'Mexico', 'MEX', '484');
INSERT INTO country VALUES ('139', 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', '583');
INSERT INTO country VALUES ('140', 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', '498');
INSERT INTO country VALUES ('141', 'MC', 'MONACO', 'Monaco', 'MCO', '492');
INSERT INTO country VALUES ('142', 'MN', 'MONGOLIA', 'Mongolia', 'MNG', '496');
INSERT INTO country VALUES ('143', 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', '500');
INSERT INTO country VALUES ('144', 'MA', 'MOROCCO', 'Morocco', 'MAR', '504');
INSERT INTO country VALUES ('145', 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', '508');
INSERT INTO country VALUES ('146', 'MM', 'MYANMAR', 'Myanmar', 'MMR', '104');
INSERT INTO country VALUES ('147', 'NA', 'NAMIBIA', 'Namibia', 'NAM', '516');
INSERT INTO country VALUES ('148', 'NR', 'NAURU', 'Nauru', 'NRU', '520');
INSERT INTO country VALUES ('149', 'NP', 'NEPAL', 'Nepal', 'NPL', '524');
INSERT INTO country VALUES ('150', 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', '528');
INSERT INTO country VALUES ('151', 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', '530');
INSERT INTO country VALUES ('152', 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', '540');
INSERT INTO country VALUES ('153', 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', '554');
INSERT INTO country VALUES ('154', 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', '558');
INSERT INTO country VALUES ('155', 'NE', 'NIGER', 'Niger', 'NER', '562');
INSERT INTO country VALUES ('156', 'NG', 'NIGERIA', 'Nigeria', 'NGA', '566');
INSERT INTO country VALUES ('157', 'NU', 'NIUE', 'Niue', 'NIU', '570');
INSERT INTO country VALUES ('158', 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', '574');
INSERT INTO country VALUES ('159', 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', '580');
INSERT INTO country VALUES ('160', 'NO', 'NORWAY', 'Norway', 'NOR', '578');
INSERT INTO country VALUES ('161', 'OM', 'OMAN', 'Oman', 'OMN', '512');
INSERT INTO country VALUES ('162', 'PK', 'PAKISTAN', 'Pakistan', 'PAK', '586');
INSERT INTO country VALUES ('163', 'PW', 'PALAU', 'Palau', 'PLW', '585');
INSERT INTO country VALUES ('164', 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', null, null);
INSERT INTO country VALUES ('165', 'PA', 'PANAMA', 'Panama', 'PAN', '591');
INSERT INTO country VALUES ('166', 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', '598');
INSERT INTO country VALUES ('167', 'PY', 'PARAGUAY', 'Paraguay', 'PRY', '600');
INSERT INTO country VALUES ('168', 'PE', 'PERU', 'Peru', 'PER', '604');
INSERT INTO country VALUES ('169', 'PH', 'PHILIPPINES', 'Philippines', 'PHL', '608');
INSERT INTO country VALUES ('170', 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', '612');
INSERT INTO country VALUES ('171', 'PL', 'POLAND', 'Poland', 'POL', '616');
INSERT INTO country VALUES ('172', 'PT', 'PORTUGAL', 'Portugal', 'PRT', '620');
INSERT INTO country VALUES ('173', 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', '630');
INSERT INTO country VALUES ('174', 'QA', 'QATAR', 'Qatar', 'QAT', '634');
INSERT INTO country VALUES ('175', 'RE', 'REUNION', 'Reunion', 'REU', '638');
INSERT INTO country VALUES ('176', 'RO', 'ROMANIA', 'Romania', 'ROM', '642');
INSERT INTO country VALUES ('177', 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', '643');
INSERT INTO country VALUES ('178', 'RW', 'RWANDA', 'Rwanda', 'RWA', '646');
INSERT INTO country VALUES ('179', 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', '654');
INSERT INTO country VALUES ('180', 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', '659');
INSERT INTO country VALUES ('181', 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', '662');
INSERT INTO country VALUES ('182', 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', '666');
INSERT INTO country VALUES ('183', 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', '670');
INSERT INTO country VALUES ('184', 'WS', 'SAMOA', 'Samoa', 'WSM', '882');
INSERT INTO country VALUES ('185', 'SM', 'SAN MARINO', 'San Marino', 'SMR', '674');
INSERT INTO country VALUES ('186', 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', '678');
INSERT INTO country VALUES ('187', 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', '682');
INSERT INTO country VALUES ('188', 'SN', 'SENEGAL', 'Senegal', 'SEN', '686');
INSERT INTO country VALUES ('189', 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', null, null);
INSERT INTO country VALUES ('190', 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', '690');
INSERT INTO country VALUES ('191', 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', '694');
INSERT INTO country VALUES ('192', 'SG', 'SINGAPORE', 'Singapore', 'SGP', '702');
INSERT INTO country VALUES ('193', 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', '703');
INSERT INTO country VALUES ('194', 'SI', 'SLOVENIA', 'Slovenia', 'SVN', '705');
INSERT INTO country VALUES ('195', 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', '90');
INSERT INTO country VALUES ('196', 'SO', 'SOMALIA', 'Somalia', 'SOM', '706');
INSERT INTO country VALUES ('197', 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', '710');
INSERT INTO country VALUES ('198', 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', null, null);
INSERT INTO country VALUES ('199', 'ES', 'SPAIN', 'Spain', 'ESP', '724');
INSERT INTO country VALUES ('200', 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', '144');
INSERT INTO country VALUES ('201', 'SD', 'SUDAN', 'Sudan', 'SDN', '736');
INSERT INTO country VALUES ('202', 'SR', 'SURINAME', 'Suriname', 'SUR', '740');
INSERT INTO country VALUES ('203', 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', '744');
INSERT INTO country VALUES ('204', 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', '748');
INSERT INTO country VALUES ('205', 'SE', 'SWEDEN', 'Sweden', 'SWE', '752');
INSERT INTO country VALUES ('206', 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', '756');
INSERT INTO country VALUES ('207', 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', '760');
INSERT INTO country VALUES ('208', 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', '158');
INSERT INTO country VALUES ('209', 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', '762');
INSERT INTO country VALUES ('210', 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', '834');
INSERT INTO country VALUES ('211', 'TH', 'THAILAND', 'Thailand', 'THA', '764');
INSERT INTO country VALUES ('212', 'TL', 'TIMOR-LESTE', 'Timor-Leste', null, null);
INSERT INTO country VALUES ('213', 'TG', 'TOGO', 'Togo', 'TGO', '768');
INSERT INTO country VALUES ('214', 'TK', 'TOKELAU', 'Tokelau', 'TKL', '772');
INSERT INTO country VALUES ('215', 'TO', 'TONGA', 'Tonga', 'TON', '776');
INSERT INTO country VALUES ('216', 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', '780');
INSERT INTO country VALUES ('217', 'TN', 'TUNISIA', 'Tunisia', 'TUN', '788');
INSERT INTO country VALUES ('218', 'TR', 'TURKEY', 'Turkey', 'TUR', '792');
INSERT INTO country VALUES ('219', 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', '795');
INSERT INTO country VALUES ('220', 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', '796');
INSERT INTO country VALUES ('221', 'TV', 'TUVALU', 'Tuvalu', 'TUV', '798');
INSERT INTO country VALUES ('222', 'UG', 'UGANDA', 'Uganda', 'UGA', '800');
INSERT INTO country VALUES ('223', 'UA', 'UKRAINE', 'Ukraine', 'UKR', '804');
INSERT INTO country VALUES ('224', 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', '784');
INSERT INTO country VALUES ('225', 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', '826');
INSERT INTO country VALUES ('226', 'US', 'UNITED STATES', 'United States', 'USA', '840');
INSERT INTO country VALUES ('227', 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', null, null);
INSERT INTO country VALUES ('228', 'UY', 'URUGUAY', 'Uruguay', 'URY', '858');
INSERT INTO country VALUES ('229', 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', '860');
INSERT INTO country VALUES ('230', 'VU', 'VANUATU', 'Vanuatu', 'VUT', '548');
INSERT INTO country VALUES ('231', 'VE', 'VENEZUELA', 'Venezuela', 'VEN', '862');
INSERT INTO country VALUES ('232', 'VN', 'VIET NAM', 'Viet Nam', 'VNM', '704');
INSERT INTO country VALUES ('233', 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', '92');
INSERT INTO country VALUES ('234', 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', '850');
INSERT INTO country VALUES ('235', 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', '876');
INSERT INTO country VALUES ('236', 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', '732');
INSERT INTO country VALUES ('237', 'YE', 'YEMEN', 'Yemen', 'YEM', '887');
INSERT INTO country VALUES ('238', 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', '894');
INSERT INTO country VALUES ('239', 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', '716');

-- ----------------------------
-- Table structure for `dc_dcode`
-- ----------------------------
DROP TABLE IF EXISTS `dc_dcode`;
CREATE TABLE `dc_dcode` (
  `id` int(4) NOT NULL,
  `codeClass` varchar(20) DEFAULT 'JT',
  `codeType` varchar(20) NOT NULL COMMENT '代码类型',
  `codeCode` varchar(50) NOT NULL COMMENT '代码名称',
  `codeValue` varchar(100) DEFAULT NULL COMMENT '代码value',
  `serialNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codeType`,`codeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DC_Dcode-基础代码表';

-- ----------------------------
-- Records of dc_dcode
-- ----------------------------
INSERT INTO dc_dcode VALUES ('152', 'JT', '', '', null, null);
INSERT INTO dc_dcode VALUES ('1', '', 'CP_CLR', 'BLACK_WHITE', '黑白', '4');
INSERT INTO dc_dcode VALUES ('2', '', 'CP_CLR', 'BLUE_WHITE', '蓝白', '1');
INSERT INTO dc_dcode VALUES ('3', '', 'CP_CLR', 'WHITE_BLACK', '白黑', '3');
INSERT INTO dc_dcode VALUES ('4', '', 'CP_CLR', 'YELLOW_BLACK', '黄黑', '2');
INSERT INTO dc_dcode VALUES ('5', '', 'CS_CLR', 'black', '黑色', '4');
INSERT INTO dc_dcode VALUES ('6', '', 'CS_CLR', 'blue', '蓝色', '5');
INSERT INTO dc_dcode VALUES ('7', '', 'CS_CLR', 'green', '黄色', '2');
INSERT INTO dc_dcode VALUES ('8', '', 'CS_CLR', 'red', '红色', '1');
INSERT INTO dc_dcode VALUES ('9', '', 'CS_CLR', 'silver', '银色', '6');
INSERT INTO dc_dcode VALUES ('10', '', 'CS_CLR', 'white', '白色', '3');
INSERT INTO dc_dcode VALUES ('101', 'JT', 'EVENT', 'CHD', '闯红灯', '1');
INSERT INTO dc_dcode VALUES ('102', 'JT', 'EVENT', 'CLL', '车流量', '9');
INSERT INTO dc_dcode VALUES ('157', '1AF', 'EVENT', 'DBJC', '丢包检测', '57');
INSERT INTO dc_dcode VALUES ('159', '1AF', 'EVENT', 'DDJC', '跌倒检测', '59');
INSERT INTO dc_dcode VALUES ('160', '1AF', 'EVENT', 'DZLSP', '低质量视频', '60');
INSERT INTO dc_dcode VALUES ('151', 'AF', 'EVENT', 'HJCV2', '火检测', '51');
INSERT INTO dc_dcode VALUES ('166', '1AF', 'EVENT', 'JDXWJC', '极端行为检测', '66');
INSERT INTO dc_dcode VALUES ('155', '1AF', 'EVENT', 'JJQJC', '警戒区检测', '55');
INSERT INTO dc_dcode VALUES ('162', '1AF', 'EVENT', 'JLYDJC', '剧烈运动检测', '62');
INSERT INTO dc_dcode VALUES ('161', '1AF', 'EVENT', 'JTYDJC', '镜头移动检测', '61');
INSERT INTO dc_dcode VALUES ('103', 'JT', 'EVENT', 'KK', '卡口', '3');
INSERT INTO dc_dcode VALUES ('150', '1AF', 'EVENT', 'KXJC', '跨线检测', '50');
INSERT INTO dc_dcode VALUES ('104', 'JT', 'EVENT', 'NX', '逆行', '2');
INSERT INTO dc_dcode VALUES ('105', 'JT', 'EVENT', 'PDCD', '排队长度', '10');
INSERT INTO dc_dcode VALUES ('154', '1AF', 'EVENT', 'PHJC', '徘徊检测', '54');
INSERT INTO dc_dcode VALUES ('164', '1AF', 'EVENT', 'QWJC', '去雾', '64');
INSERT INTO dc_dcode VALUES ('165', '1AF', 'EVENT', 'QYRSTJ', '区域人数统计', '65');
INSERT INTO dc_dcode VALUES ('163', '1AF', 'EVENT', 'RLSB', '人脸识别', '63');
INSERT INTO dc_dcode VALUES ('158', '1AF', 'EVENT', 'RYTJ', '人员统计', '58');
INSERT INTO dc_dcode VALUES ('106', 'JT', 'EVENT', 'SFZ', '收费站、停车场', '4');
INSERT INTO dc_dcode VALUES ('153', '1AF', 'EVENT', 'SLYJC', '森林烟检测', '53');
INSERT INTO dc_dcode VALUES ('156', '1AF', 'EVENT', 'TDJC', '偷盗检测', '56');
INSERT INTO dc_dcode VALUES ('107', 'JT', 'EVENT', 'TLSJC', '停留时间过长', '5');
INSERT INTO dc_dcode VALUES ('108', 'JT', 'EVENT', 'WCP', '无车牌', '11');
INSERT INTO dc_dcode VALUES ('109', 'JT', 'EVENT', 'WGBD', '违规变道', '7');
INSERT INTO dc_dcode VALUES ('110', 'JT', 'EVENT', 'WZTC', '违章停车', '6');
INSERT INTO dc_dcode VALUES ('151', 'AF', 'EVENT', 'XFTDJC', '消防通道检测', '51');
INSERT INTO dc_dcode VALUES ('111', 'JT', 'EVENT', 'YHX', '压黄线', '8');
INSERT INTO dc_dcode VALUES ('152', 'AF', 'EVENT', 'YJCV2', '烟检测', '52');
INSERT INTO dc_dcode VALUES ('168', 'AF', 'EVENT', 'ZGJC', '在岗检测', '68');
INSERT INTO dc_dcode VALUES ('167', '1AF', 'EVENT', 'ZLSJGC', '滞留时间过长', '67');
INSERT INTO dc_dcode VALUES ('201', '', 'GRADE', 'COM_WARN', '一般告警', '2');
INSERT INTO dc_dcode VALUES ('202', '', 'GRADE', 'PRE_WARN', '预警', '1');
INSERT INTO dc_dcode VALUES ('203', '', 'GRADE', 'SER_WARN', '严重告警', '3');
INSERT INTO dc_dcode VALUES ('301', '', 'LOGO', 'baoma', '宝马', '5');
INSERT INTO dc_dcode VALUES ('302', '', 'LOGO', 'benchi', '奔驰', '4');
INSERT INTO dc_dcode VALUES ('303', '', 'LOGO', 'bentian', '本田', '2');
INSERT INTO dc_dcode VALUES ('304', '', 'LOGO', 'biyadi', '比亚迪', '6');
INSERT INTO dc_dcode VALUES ('305', '', 'LOGO', 'dazhong', '大众', '3');
INSERT INTO dc_dcode VALUES ('306', '', 'LOGO', 'fengtian', '丰田', '1');
INSERT INTO dc_dcode VALUES ('308', '', 'LOGO', 'unknow', '未知', '8');
INSERT INTO dc_dcode VALUES ('307', '', 'LOGO', 'UNKNOWN', '未知', '5');
INSERT INTO dc_dcode VALUES ('401', '', 'MODEL', 'DH', '大货', '1');
INSERT INTO dc_dcode VALUES ('402', '', 'MODEL', 'DK', '大客', '4');
INSERT INTO dc_dcode VALUES ('403', '', 'MODEL', 'MT', '摩托车', '7');
INSERT INTO dc_dcode VALUES ('408', '', 'MODEL', 'WZ', '未知2', '8');
INSERT INTO dc_dcode VALUES ('404', '', 'MODEL', 'XH', '小货', '3');
INSERT INTO dc_dcode VALUES ('405', '', 'MODEL', 'XK', '小客', '6');
INSERT INTO dc_dcode VALUES ('406', '', 'MODEL', 'ZH', '中货', '2');
INSERT INTO dc_dcode VALUES ('407', '', 'MODEL', 'ZK', '中客', '5');

-- ----------------------------
-- Table structure for `dc_dtype`
-- ----------------------------
DROP TABLE IF EXISTS `dc_dtype`;
CREATE TABLE `dc_dtype` (
  `codeType` varchar(20) NOT NULL COMMENT '基础代码类型',
  `codeTypeDesc` varchar(20) NOT NULL COMMENT '代码类型中文描述',
  PRIMARY KEY (`codeType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DC_Dtype-基础代码类型表';

-- ----------------------------
-- Records of dc_dtype
-- ----------------------------
INSERT INTO dc_dtype VALUES ('CP_CLR', '车牌颜色');
INSERT INTO dc_dtype VALUES ('CS_CLR', '车身颜色');
INSERT INTO dc_dtype VALUES ('EVENT', '事件名');
INSERT INTO dc_dtype VALUES ('GRADE', '告警等级');
INSERT INTO dc_dtype VALUES ('LOGO', '车标');
INSERT INTO dc_dtype VALUES ('MODEL', '车型');

-- ----------------------------
-- Table structure for `dzjc_20130426_183246`
-- ----------------------------
DROP TABLE IF EXISTS `dzjc_20130426_183246`;
CREATE TABLE `dzjc_20130426_183246` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `violations` varchar(64) DEFAULT NULL COMMENT '交通违规类型:闯红灯/逆行/压线/变道',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  `exportFlag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1857 DEFAULT CHARSET=gbk COMMENT='事件表  DZJC';

-- ----------------------------
-- Records of dzjc_20130426_183246
-- ----------------------------
INSERT INTO dzjc_20130426_183246 VALUES ('1839', '3', '京BM4193', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_53_309_23316.jpg', '/pic/HK143/2013_06_19_11_16_56_369_23316combo.jpg', '/pic/HK143/2013_06_19_11_16_54_664_23316b.jpg', '/pic/HK143/2013_06_19_11_16_56_369_23316c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:30', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1840', '3', '津PA1683', '3', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_51_608_23318.jpg', '/pic/HK143/2013_06_19_11_16_55_272_23318combo.jpg', '/pic/HK143/2013_06_19_11_16_53_806_23318b.jpg', '/pic/HK143/2013_06_19_11_16_55_272_23318c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:31', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1841', '3', '浙A1E925', '3', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_07_321_67682.jpg', '/pic/HK143/2013_06_19_11_17_10_895_67682combo.jpg', '/pic/HK143/2013_06_19_11_17_09_399_67682b.jpg', '/pic/HK143/2013_06_19_11_17_10_895_67682c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:46', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1842', '3', '', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_09_075_67700.jpg', '/pic/HK143/2013_06_19_11_17_10_720_67700combo.jpg', '/pic/HK143/2013_06_19_11_17_09_653_67700b.jpg', '/pic/HK143/2013_06_19_11_17_10_720_67700c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:48', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1843', '3', '', '1', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_56_289_23382.jpg', '/pic/HK143/2013_06_19_11_16_59_066_23382combo.jpg', '/pic/HK143/2013_06_19_11_16_57_678_23382b.jpg', '/pic/HK143/2013_06_19_11_16_59_066_23382c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:35', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1844', '3', '津G7AA31', '1', 'bd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_09_405_67758.jpg', '/pic/HK143/2013_06_19_11_17_10_823_67758combo.jpg', '/pic/HK143/2013_06_19_11_17_10_715_67758b.jpg', '/pic/HK143/2013_06_19_11_17_10_823_67758c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:52', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1845', '3', '', '1', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_59_068_23456.jpg', '/pic/HK143/2013_06_19_11_17_01_575_23456combo.jpg', '/pic/HK143/2013_06_19_11_17_00_298_23456b.jpg', '/pic/HK143/2013_06_19_11_17_01_575_23456c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:39', '1');
INSERT INTO dzjc_20130426_183246 VALUES ('1846', '3', '', '1', 'bd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_11_680_67808.jpg', '/pic/HK143/2013_06_19_11_17_13_422_67808combo.jpg', '/pic/HK143/2013_06_19_11_17_13_324_67808b.jpg', '/pic/HK143/2013_06_19_11_17_13_422_67808c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:55', '1');

---------------------------
-- Table structure for `erf`
-- ----------------------------
DROP TABLE IF EXISTS `erf`;
CREATE TABLE `erf` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of erf
-- ----------------------------

-- ----------------------------
-- Table structure for `etr`
-- ----------------------------
DROP TABLE IF EXISTS `etr`;
CREATE TABLE `etr` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of etr
-- ----------------------------

-- ----------------------------
-- Table structure for `evtdef`
-- ----------------------------
DROP TABLE IF EXISTS `evtdef`;
CREATE TABLE `evtdef` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cameraID` int(4) NOT NULL COMMENT '摄像头ID',
  `event` varchar(20) DEFAULT NULL COMMENT '事件类型代码',
  `weekday` text COMMENT '监视的时间段：格式如下：\r\n周一1200140014001500160017001800190020002100\r\n表示：周一监控时间\r\n段：12：00---14：00；14：00--15：00；16：00：17：00；18：00--19：00；20：00--21：00；\r\n？\r\n1、必须配对出现\r\n2、时间长度没有这么多则补充0\r\n',
  `direction` tinyint(4) DEFAULT NULL COMMENT '摄像头拍摄方向(1:head 2:tail\r\n3:all)',
  `timeArgs` int(4) DEFAULT NULL COMMENT '时间长度(mm为单位)（停留时间过\r\n久，违规停车）',
  `intervalTime` mediumint(9) DEFAULT NULL COMMENT '多长时间发一次（车流量）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='EvtDef-事件检测定义表';

-- ----------------------------
-- Records of evtdef
-- ----------------------------

-- ----------------------------
-- Table structure for `headserver`
-- ----------------------------
DROP TABLE IF EXISTS `headserver`;
CREATE TABLE `headserver` (
  `id` int(4) NOT NULL,
  `ip` varchar(48) NOT NULL,
  `mac` varchar(20) NOT NULL,
  `port` int(4) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `comment` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of headserver
-- ----------------------------
INSERT INTO headserver VALUES ('1', '10.168.1.19', '00-06-4F-8F-D2-92', '8080', 'ceshi1', '');
INSERT INTO headserver VALUES ('2', '10.168.1.35', '00-1F-C6-F8-5F-96', '8080', 'xinxin', '');
INSERT INTO headserver VALUES ('3', '10.168.1.31', '08-60-6E-69-35-41', '8080', 'yanshi', null);
INSERT INTO headserver VALUES ('4', '10.168.1.4', '20-6A-8A-11-DE-4F', '8080', 'boshi', null);

-- ----------------------------
-- Table structure for `kk_20130508_165150`
-- ----------------------------
DROP TABLE IF EXISTS `kk_20130508_165150`;
CREATE TABLE `kk_20130508_165150` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `absTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5434 DEFAULT CHARSET=gbk COMMENT='事件表  KK';

-- ----------------------------
-- Records of kk_20130508_165150
-- ----------------------------
INSERT INTO kk_20130508_165150_copy VALUES ('133', '36', '888123', '32', 'big', 'bc', 'yellow_black', '/pic/DH241/2012_11_08_18_04_23_0.jpg', '/pic/DH241/2012_11_08_18_04_23_0a.jpg', '2013-06-08 18:06:17', 'yellow', '', '', '1', '1', '2013-06-13 11:36:11');
INSERT INTO kk_20130508_165150_copy VALUES ('134', '36', '888123', '32', 'big', 'bc', 'yellow_black', '/pic/DH241/2012_11_08_18_15_00_0.jpg', '/pic/DH241/2012_11_08_18_15_00_0a.jpg', '2013-06-08 18:16:32', 'yellow', '', '', '1', '1', '2013-06-13 11:36:38');
INSERT INTO kk_20130508_165150_copy VALUES ('135', '36', '888123', '32', 'big', 'bc', 'yellow_black', '/pic/DH241/2012_11_08_18_15_00_1.jpg', '/pic/DH241/2012_11_08_18_15_00_1a.jpg', '2013-06-08 18:18:10', 'yellow', '', '', '1', '1', '2013-06-13 11:36:51');

-- ----------------------------
-- Table structure for `l_xftd_20130617_091203`
-- ----------------------------
DROP TABLE IF EXISTS `l_xftd_20130617_091203`;
CREATE TABLE `l_xftd_20130617_091203` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of l_xftd_20130617_091203
-- ----------------------------

-- ----------------------------
-- Table structure for `l_xftd_20130617_091431`
-- ----------------------------
DROP TABLE IF EXISTS `l_xftd_20130617_091431`;
CREATE TABLE `l_xftd_20130617_091431` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of l_xftd_20130617_091431
-- ----------------------------

-- ----------------------------
-- Table structure for `monitor_event`
-- ----------------------------
DROP TABLE IF EXISTS `monitor_event`;
CREATE TABLE `monitor_event` (
  `AlarmID` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '告警序号，自动递增\r\n',
  `EventAbbr` varchar(20) NOT NULL COMMENT '事件类型 \r\n	#define PROC_NOTHING      0x00 //取消所有检测\r\n	#define PROC_CROSSLINE    0x01 //跨线检测\r\n	#define PROC_FIRE         0x02 //火检测\r\n	#define PROC_SMOKE        0x03 //烟检测\r\n	#define PROC_FORESTSMOKE  0x04 //森林烟检测\r\n	#define PROC_PAIHUAI      0x05 //徘徊检测\r\n	#defin',
  `CameraID` int(4) NOT NULL COMMENT '摄像头的 ID',
  `nEventDesc` varchar(32) NOT NULL COMMENT '事件的字符描述',
  `nEventGrade` int(4) NOT NULL DEFAULT '0' COMMENT '///确认等级（0~2）',
  `nSeriousLevel` int(4) NOT NULL DEFAULT '0' COMMENT '///严重等级（0~2）',
  `AlarmStartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AlarmStartPic` varchar(512) NOT NULL,
  `AlarmUpdateTime` timestamp NULL DEFAULT NULL,
  `AlarmUpdatePic` varchar(512) DEFAULT NULL,
  `AlarmEndTime` timestamp NULL DEFAULT NULL,
  `AlarmEndPic` varchar(512) DEFAULT NULL,
  `cAlarmVideo` varchar(512) DEFAULT NULL,
  `cLPRData` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`AlarmID`)
) ENGINE=InnoDB AUTO_INCREMENT=6568 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of monitor_event
-- ----------------------------
INSERT INTO monitor_event VALUES ('6561', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-11 15:58:32', '/pic/DH213/2011_07_11_15_58_32_0.jpg', null, null, '2011-07-11 15:58:32', '', '', '');
INSERT INTO monitor_event VALUES ('6562', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-15 15:22:20', '/pic/DH213/2011_07_15_15_22_20_0.jpg', null, null, '2011-07-15 15:22:20', '', '', '');
INSERT INTO monitor_event VALUES ('6563', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-15 15:31:35', '/pic/DH213/2011_07_15_15_31_35_0.jpg', null, null, '2011-07-15 15:31:35', '', '', '');
INSERT INTO monitor_event VALUES ('6564', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-15 15:33:58', '/pic/DH213/2011_07_15_15_33_58_0.jpg', null, null, '2011-07-15 15:33:58', '', '', '');
INSERT INTO monitor_event VALUES ('6565', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-15 15:39:42', '/pic/DH213/2011_07_15_15_39_42_0.jpg', null, null, '2011-07-15 15:39:42', '', '', '');
INSERT INTO monitor_event VALUES ('6566', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-15 15:46:36', '/pic/DH213/2011_07_15_15_46_36_0.jpg', null, null, '2011-07-15 15:46:36', '', '', '');
INSERT INTO monitor_event VALUES ('6567', 'XFTDJC', '14', '消防通道堵塞 ', '1', '1', '2011-07-15 15:51:29', '/pic/DH213/2011_07_15_15_51_29_0.jpg', null, null, '2011-07-15 15:51:29', '', '', '');

-- ----------------------------
-- Table structure for `nvr`
-- ----------------------------
DROP TABLE IF EXISTS `nvr`;
CREATE TABLE `nvr` (
  `id` int(4) NOT NULL,
  `name` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nvr
-- ----------------------------
INSERT INTO nvr VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `rgt`
-- ----------------------------
DROP TABLE IF EXISTS `rgt`;
CREATE TABLE `rgt` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of rgt
-- ----------------------------

-- ----------------------------
-- Table structure for `rw`
-- ----------------------------
DROP TABLE IF EXISTS `rw`;
CREATE TABLE `rw` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of rw
-- ----------------------------

-- ----------------------------
-- Table structure for `sec_log`
-- ----------------------------
DROP TABLE IF EXISTS `sec_log`;
CREATE TABLE `sec_log` (
  `lodid` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `fun_id` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `fun_name` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `user_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ip` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `opration` varchar(400) CHARACTER SET gbk DEFAULT NULL,
  `log_flag` varchar(2) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`lodid`)
) ENGINE=MyISAM AUTO_INCREMENT=29312 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of sec_log
-- ----------------------------

INSERT INTO sec_log VALUES ('29299', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-18 16:40:39', null, null, null, null);
INSERT INTO sec_log VALUES ('29300', '账号为：dj，姓名为电子警察的登陆成功，单位为：Root', null, null, '2013-06-18 16:42:31', null, null, null, null);
INSERT INTO sec_log VALUES ('29301', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-18 16:43:45', null, null, null, null);
INSERT INTO sec_log VALUES ('29302', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-18 16:56:50', null, null, null, null);
INSERT INTO sec_log VALUES ('29303', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-18 17:01:55', null, null, null, null);
INSERT INTO sec_log VALUES ('29304', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-18 17:27:09', null, null, null, null);
INSERT INTO sec_log VALUES ('29305', '账号为：dj，姓名为电子警察的登陆成功，单位为：Root', null, null, '2013-06-18 17:39:15', null, null, null, null);
INSERT INTO sec_log VALUES ('29307', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-19 09:41:57', null, null, null, null);
INSERT INTO sec_log VALUES ('29308', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-19 09:51:14', null, null, null, null);
INSERT INTO sec_log VALUES ('29309', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-06-19 11:13:44', null, null, null, null);
INSERT INTO sec_log VALUES ('29310', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-07-01 16:21:37', null, null, null, null);
INSERT INTO sec_log VALUES ('29311', '账号为：admin，姓名为系统管理员的登陆成功，单位为：Root', null, null, '2013-07-01 16:31:00', null, null, null, null);

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(4) DEFAULT NULL,
  `first_name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO staff VALUES ('1', '敏', 'dai', 'shangdi');
INSERT INTO staff VALUES ('2', '敏1', '1dai', 'shangdi1');

-- ----------------------------
-- Table structure for `timeset`
-- ----------------------------
DROP TABLE IF EXISTS `timeset`;
CREATE TABLE `timeset` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cameraID` int(4) NOT NULL COMMENT 'camera id',
  `event` varchar(20) NOT NULL COMMENT 'event id',
  `weekday` int(1) NOT NULL COMMENT 'weed day',
  `dateVal` date DEFAULT NULL COMMENT 'date value',
  `startTime` time NOT NULL COMMENT 'start time',
  `stopTime` time NOT NULL COMMENT 'stop time',
  `userId` int(2) DEFAULT NULL,
  `insTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='time set table';

-- ----------------------------
-- Records of timeset
-- ----------------------------
INSERT INTO timeset VALUES ('1', '1', 'HJCV2', '1', null, '00:00:00', '23:59:00', '1', '2013-03-07 11:43:35');
INSERT INTO timeset VALUES ('2', '1', 'HJCV2', '1', null, '00:00:00', '23:59:00', '1', '2013-03-07 11:43:35');
INSERT INTO timeset VALUES ('3', '1', 'HJCV2', '1', null, '00:00:00', '23:59:00', '1', '2013-03-07 11:43:35');
INSERT INTO timeset VALUES ('4', '1', 'HJCV2', '1', null, '00:00:00', '23:59:00', '1', '2013-03-07 11:43:35');
INSERT INTO timeset VALUES ('5', '1', 'HJCV2', '1', null, '00:00:00', '23:59:00', '1', '2013-03-07 11:43:35');

-- ----------------------------
-- Table structure for `t_m_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_baseinfo`;
CREATE TABLE `t_m_baseinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `defaultAuthName` varchar(255) DEFAULT NULL,
  `defaultAuthPwd` varchar(255) DEFAULT NULL,
  `defaultInputVideo` varchar(255) DEFAULT NULL,
  `defaultSoapUrl` varchar(255) DEFAULT NULL,
  `defaultOutputVideo` varchar(255) DEFAULT NULL,
  `defaultTaskpriority` varchar(255) DEFAULT NULL,
  `work` int(1) DEFAULT '0',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_baseinfo
-- ----------------------------
INSERT INTO t_m_baseinfo VALUES ('3', 'admin', null, null, null, null, null, '0', '2013-04-05 17:33:52', '1');

-- ----------------------------
-- Table structure for `t_m_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_log`;
CREATE TABLE `t_m_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_m_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_report`;
CREATE TABLE `t_m_report` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taskId` int(10) DEFAULT NULL,
  `LPNumber` varchar(255) DEFAULT NULL,
  `absTime` timestamp NULL DEFAULT NULL,
  `frameIndex` int(10) DEFAULT NULL,
  `frameCTS` int(10) DEFAULT NULL,
  `confidence` float DEFAULT NULL,
  `posX` int(5) DEFAULT NULL,
  `posY` int(5) DEFAULT NULL,
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `picture` binary(255) DEFAULT NULL,
  `LPNpicture` binary(255) DEFAULT NULL,
  `LPNpicUrl` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_report
-- ----------------------------
INSERT INTO t_m_report VALUES ('1', '47', '赣02*690', '2013-06-05 11:35:46', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1282', '2013-06-05 11:37:51', null);
INSERT INTO t_m_report VALUES ('2', '47', '赣L9*015', '2013-06-05 11:35:55', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1283', '2013-06-05 11:37:51', null);
INSERT INTO t_m_report VALUES ('3', '47', '津LX*272', '2013-06-05 11:35:56', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1284', '2013-06-05 11:37:51', null);
INSERT INTO t_m_report VALUES ('4', '47', '贵NQ*889', '2013-06-05 11:36:01', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1285', '2013-06-05 11:37:51', null);
INSERT INTO t_m_report VALUES ('5', '47', '赣NG*756', '2013-06-05 11:36:03', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1286', '2013-06-05 11:37:51', null);
INSERT INTO t_m_report VALUES ('6', '47', '赣JP*986', '2013-06-05 11:36:05', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1287', '2013-06-05 11:37:51', null);
INSERT INTO t_m_report VALUES ('7', '47', '赣BK*220', '2013-06-05 11:36:05', null, null, null, null, null, null, null, null, null, null, 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=1288', '2013-06-05 11:37:51', null);

-- ----------------------------
-- Table structure for `t_m_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_tasks`;
CREATE TABLE `t_m_tasks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taskID` int(10) DEFAULT NULL,
  `taskName` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locationId` varchar(255) DEFAULT NULL,
  `inputVideoId` varchar(255) DEFAULT NULL,
  `outputVideoId` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT NULL,
  `lastUpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_tasks
-- ----------------------------
INSERT INTO t_m_tasks VALUES ('83', '89', 'task Test by karl', 'created', 'dl01', '42,', 'outputFile_1371089024819.avi', 'admin', '2013-06-13 10:03:00', '2013-06-13 10:03:42', '1');
INSERT INTO t_m_tasks VALUES ('84', '99', 'task Test by karl', 'created', 'dl01', '51,', 'outputFile_1371178836792.mp4', 'dj', '2013-06-14 11:00:00', '2013-06-14 11:00:33', '1');
INSERT INTO t_m_tasks VALUES ('85', '100', 'task Test by karl', 'created', 'dl0101', '224(5fb).avi,', 'outputFile_1371207109662.mp4', 'admin', '2013-06-14 18:51:00', '2013-06-14 18:51:49', '1');
INSERT INTO t_m_tasks VALUES ('86', '101', 'task Test by karl', 'created', 'dl', '2013_06_15.avi,', 'outputFile_1371288737397.mp4', 'admin', '2013-06-15 17:32:00', '2013-06-15 17:32:11', '1');
INSERT INTO t_m_tasks VALUES ('87', '105', 'task Test by karl', 'created', 'dl0201', '10.168.1.143_01_20130521195503928.mp4,', 'outputFile_1371290817355.mp4', 'admin', '2013-06-15 18:06:00', '2013-06-15 18:06:51', '1');

-- ----------------------------
-- Table structure for `t_m_videos`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_videos`;
CREATE TABLE `t_m_videos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '1' COMMENT '视频文件名次',
  `url` varchar(512) DEFAULT '/' COMMENT '文件路径',
  `owner` char(255) DEFAULT NULL COMMENT '上传者',
  `type` varchar(100) DEFAULT '1' COMMENT '文件类型，如avi,mp4',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_videos
-- ----------------------------
INSERT INTO t_m_videos VALUES ('2', '224.avi', '/', 'admin', 'avi', '2013-04-06 12:53:38', '1');
INSERT INTO t_m_videos VALUES ('3', 'demo2_short.avi', '/', 'admin', 'avi', '2013-04-06 12:53:17', '1');
INSERT INTO t_m_videos VALUES ('34', '224.avi', '', 'lijian', 'avi', '2013-04-13 15:00:13', '1');

-- ----------------------------
-- Table structure for `t_s_adminarea`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_adminarea`;
CREATE TABLE `t_s_adminarea` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `adminAreaCode` varchar(255) DEFAULT NULL,
  `adminAreaName` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3515 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_adminarea
-- ----------------------------
INSERT INTO t_s_adminarea VALUES ('4', '110000', '北京市', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('5', '110100', '市辖区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('6', '110101', '东城区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('7', '110102', '西城区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('8', '110105', '朝阳区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('9', '110106', '丰台区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('10', '110107', '石景山区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('11', '110108', '海淀区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('12', '110108', '海淀区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('13', '110109', '门头沟区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('14', '110111', '房山区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('15', '110112', '通州区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('16', '110113', '顺义区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('17', '110114', '昌平区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('18', '110115', '大兴区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('19', '110116', '怀柔区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('20', '110117', '平谷区', '1', '2013-04-28 14:16:03');
INSERT INTO t_s_adminarea VALUES ('21', '110200', '县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('22', '110228', '密云县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('23', '110229', '延庆县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('24', '120000', '天津市', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('25', '120100', '市辖区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('26', '120101', '和平区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('27', '120102', '河东区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('28', '120103', '河西区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('29', '120104', '南开区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('30', '120105', '河北区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('31', '120106', '红桥区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('32', '120110', '东丽区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('33', '120111', '西青区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('34', '120112', '津南区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('35', '120113', '北辰区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('36', '120114', '武清区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('37', '120115', '宝坻区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('38', '120116', '滨海新区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('39', '120200', '县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('40', '120221', '宁河县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('41', '120223', '静海县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('42', '120225', '蓟县', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('43', '130000', '河北省', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('44', '130100', '石家庄市', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('45', '130101', '市辖区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('46', '130102', '长安区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('47', '130103', '桥东区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('48', '130104', '桥西区', '1', '2013-04-28 14:16:04');
INSERT INTO t_s_adminarea VALUES ('49', '130105', '新华区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('50', '130107', '井陉矿区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('51', '130108', '裕华区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('52', '130121', '井陉县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('53', '130123', '正定县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('54', '130124', '栾城县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('55', '130125', '行唐县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('56', '130126', '灵寿县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('57', '130127', '高邑县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('58', '130128', '深泽县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('59', '130129', '赞皇县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('60', '130130', '无极县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('61', '130131', '平山县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('62', '130132', '元氏县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('63', '130133', '赵县', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('64', '130181', '辛集市', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('65', '130182', '藁城市', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('66', '130183', '晋州市', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('67', '130184', '新乐市', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('68', '130185', '鹿泉市', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('69', '130200', '唐山市', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('70', '130201', '市辖区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('71', '130202', '路南区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('72', '130203', '路北区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('73', '130204', '古冶区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('74', '130205', '开平区', '1', '2013-04-28 14:16:05');
INSERT INTO t_s_adminarea VALUES ('75', '130207', '丰南区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('76', '130208', '丰润区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('77', '130209', '曹妃甸区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('78', '130223', '滦县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('79', '130224', '滦南县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('80', '130225', '乐亭县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('81', '130227', '迁西县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('82', '130229', '玉田县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('83', '130281', '遵化市', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('84', '130283', '迁安市', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('85', '130300', '秦皇岛市', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('86', '130301', '市辖区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('87', '130302', '海港区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('88', '130303', '山海关区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('89', '130304', '北戴河区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('90', '130321', '青龙满族自治县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('91', '130322', '昌黎县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('92', '130323', '抚宁县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('93', '130324', '卢龙县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('94', '130400', '邯郸市', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('95', '130401', '市辖区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('96', '130402', '邯山区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('97', '130403', '丛台区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('98', '130404', '复兴区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('99', '130406', '峰峰矿区', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('100', '130421', '邯郸县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('101', '130423', '临漳县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('102', '130424', '成安县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('103', '130425', '大名县', '1', '2013-04-28 14:16:06');
INSERT INTO t_s_adminarea VALUES ('104', '130426', '涉县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('105', '130427', '磁县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('106', '130428', '肥乡县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('107', '130429', '永年县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('108', '130430', '邱县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('109', '130431', '鸡泽县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('110', '130432', '广平县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('111', '130433', '馆陶县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('112', '130434', '魏县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('113', '130435', '曲周县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('114', '130481', '武安市', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('115', '130500', '邢台市', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('116', '130501', '市辖区', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('117', '130502', '桥东区', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('118', '130503', '桥西区', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('119', '130521', '邢台县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('120', '130522', '临城县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('121', '130523', '内丘县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('122', '130524', '柏乡县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('123', '130525', '隆尧县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('124', '130526', '任县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('125', '130527', '南和县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('126', '130528', '宁晋县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('127', '130529', '巨鹿县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('128', '130530', '新河县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('129', '130531', '广宗县', '1', '2013-04-28 14:16:07');
INSERT INTO t_s_adminarea VALUES ('130', '130532', '平乡县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('131', '130533', '威县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('132', '130534', '清河县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('133', '130535', '临西县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('134', '130581', '南宫市', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('135', '130582', '沙河市', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('136', '130600', '保定市', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('137', '130601', '市辖区', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('138', '130602', '新市区', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('139', '130603', '北市区', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('140', '130604', '南市区', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('141', '130621', '满城县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('142', '130622', '清苑县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('143', '130623', '涞水县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('144', '130624', '阜平县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('145', '130625', '徐水县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('146', '130626', '定兴县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('147', '130627', '唐县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('148', '130628', '高阳县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('149', '130629', '容城县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('150', '130630', '涞源县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('151', '130631', '望都县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('152', '130632', '安新县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('153', '130633', '易县', '1', '2013-04-28 14:16:08');
INSERT INTO t_s_adminarea VALUES ('154', '130634', '曲阳县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('155', '130635', '蠡县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('156', '130636', '顺平县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('157', '130637', '博野县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('158', '130638', '雄县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('159', '130681', '涿州市', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('160', '130682', '定州市', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('161', '130683', '安国市', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('162', '130684', '高碑店市', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('163', '130700', '张家口市', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('164', '130701', '市辖区', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('165', '130702', '桥东区', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('166', '130703', '桥西区', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('167', '130705', '宣化区', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('168', '130706', '下花园区', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('169', '130721', '宣化县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('170', '130722', '张北县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('171', '130723', '康保县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('172', '130724', '沽源县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('173', '130725', '尚义县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('174', '130726', '蔚县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('175', '130727', '阳原县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('176', '130728', '怀安县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('177', '130729', '万全县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('178', '130730', '怀来县', '1', '2013-04-28 14:16:09');
INSERT INTO t_s_adminarea VALUES ('179', '130731', '涿鹿县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('180', '130732', '赤城县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('181', '130733', '崇礼县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('182', '130800', '承德市', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('183', '130801', '市辖区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('184', '130802', '双桥区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('185', '130803', '双滦区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('186', '130804', '鹰手营子矿区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('187', '130821', '承德县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('188', '130822', '兴隆县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('189', '130823', '平泉县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('190', '130824', '滦平县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('191', '130825', '隆化县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('192', '130826', '丰宁满族自治县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('193', '130827', '宽城满族自治县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('194', '130828', '围场满族蒙古族自治县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('195', '130900', '沧州市', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('196', '130901', '市辖区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('197', '130902', '新华区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('198', '130903', '运河区', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('199', '130921', '沧县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('200', '130922', '青县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('201', '130923', '东光县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('202', '130924', '海兴县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('203', '130925', '盐山县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('204', '130926', '肃宁县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('205', '130927', '南皮县', '1', '2013-04-28 14:16:10');
INSERT INTO t_s_adminarea VALUES ('206', '130928', '吴桥县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('207', '130929', '献县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('208', '130930', '孟村回族自治县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('209', '130981', '泊头市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('210', '130982', '任丘市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('211', '130983', '黄骅市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('212', '130984', '河间市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('213', '131000', '廊坊市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('214', '131001', '市辖区', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('215', '131002', '安次区', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('216', '131003', '广阳区', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('217', '131022', '固安县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('218', '131023', '永清县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('219', '131024', '香河县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('220', '131025', '大城县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('221', '131026', '文安县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('222', '131028', '大厂回族自治县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('223', '131081', '霸州市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('224', '131082', '三河市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('225', '131100', '衡水市', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('226', '131101', '市辖区', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('227', '131102', '桃城区', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('228', '131121', '枣强县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('229', '131122', '武邑县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('230', '131123', '武强县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('231', '131124', '饶阳县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('232', '131125', '安平县', '1', '2013-04-28 14:16:11');
INSERT INTO t_s_adminarea VALUES ('233', '131126', '故城县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('234', '131127', '景县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('235', '131128', '阜城县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('236', '131181', '冀州市', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('237', '131182', '深州市', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('238', '140000', '山西省', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('239', '140100', '太原市', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('240', '140101', '市辖区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('241', '140105', '小店区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('242', '140106', '迎泽区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('243', '140107', '杏花岭区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('244', '140108', '尖草坪区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('245', '140109', '万柏林区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('246', '140110', '晋源区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('247', '140121', '清徐县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('248', '140122', '阳曲县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('249', '140123', '娄烦县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('250', '140181', '古交市', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('251', '140200', '大同市', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('252', '140201', '市辖区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('253', '140202', '城区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('254', '140203', '矿区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('255', '140211', '南郊区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('256', '140212', '新荣区', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('257', '140221', '阳高县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('258', '140222', '天镇县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('259', '140223', '广灵县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('260', '140224', '灵丘县', '1', '2013-04-28 14:16:12');
INSERT INTO t_s_adminarea VALUES ('261', '140225', '浑源县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('262', '140226', '左云县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('263', '140227', '大同县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('264', '140300', '阳泉市', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('265', '140301', '市辖区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('266', '140302', '城区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('267', '140303', '矿区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('268', '140311', '郊区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('269', '140321', '平定县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('270', '140322', '盂县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('271', '140400', '长治市', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('272', '140401', '市辖区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('273', '140402', '城区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('274', '140411', '郊区', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('275', '140421', '长治县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('276', '140423', '襄垣县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('277', '140424', '屯留县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('278', '140425', '平顺县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('279', '140426', '黎城县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('280', '140427', '壶关县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('281', '140428', '长子县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('282', '140429', '武乡县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('283', '140430', '沁县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('284', '140431', '沁源县', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('285', '140481', '潞城市', '1', '2013-04-28 14:16:13');
INSERT INTO t_s_adminarea VALUES ('286', '140500', '晋城市', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('287', '140501', '晋城市市辖区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('288', '140502', '城区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('289', '140521', '沁水县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('290', '140522', '阳城县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('291', '140524', '陵川县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('292', '140525', '泽州县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('293', '140581', '高平市', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('294', '140600', '朔州市', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('295', '140601', '市辖区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('296', '140602', '朔城区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('297', '140603', '平鲁区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('298', '140621', '山阴县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('299', '140622', '应县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('300', '140623', '右玉县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('301', '140624', '怀仁县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('302', '140700', '晋中市', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('303', '140701', '市辖区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('304', '140702', '榆次区', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('305', '140721', '榆社县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('306', '140722', '左权县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('307', '140723', '和顺县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('308', '140724', '昔阳县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('309', '140725', '寿阳县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('310', '140726', '太谷县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('311', '140727', '祁县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('312', '140728', '平遥县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('313', '140729', '灵石县', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('314', '140781', '介休市', '1', '2013-04-28 14:16:14');
INSERT INTO t_s_adminarea VALUES ('315', '140800', '运城市', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('316', '140801', '市辖区', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('317', '140802', '盐湖区', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('318', '140821', '临猗县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('319', '140822', '万荣县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('320', '140823', '闻喜县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('321', '140824', '稷山县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('322', '140825', '新绛县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('323', '140826', '绛县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('324', '140827', '垣曲县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('325', '140828', '夏县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('326', '140829', '平陆县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('327', '140830', '芮城县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('328', '140881', '永济市', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('329', '140882', '河津市', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('330', '140900', '忻州市', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('331', '140901', '市辖区', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('332', '140902', '忻府区', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('333', '140921', '定襄县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('334', '140922', '五台县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('335', '140923', '代县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('336', '140924', '繁峙县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('337', '140925', '宁武县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('338', '140926', '静乐县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('339', '140927', '神池县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('340', '140928', '五寨县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('341', '140929', '岢岚县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('342', '140930', '河曲县', '1', '2013-04-28 14:16:15');
INSERT INTO t_s_adminarea VALUES ('343', '140931', '保德县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('344', '140932', '偏关县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('345', '140981', '原平市', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('346', '141000', '临汾市', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('347', '141001', '市辖区', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('348', '141002', '尧都区', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('349', '141021', '曲沃县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('350', '141022', '翼城县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('351', '141023', '襄汾县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('352', '141024', '洪洞县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('353', '141025', '古县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('354', '141026', '安泽县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('355', '141027', '浮山县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('356', '141028', '吉县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('357', '141029', '乡宁县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('358', '141030', '大宁县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('359', '141031', '隰县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('360', '141032', '永和县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('361', '141033', '蒲县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('362', '141034', '汾西县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('363', '141081', '侯马市', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('364', '141082', '霍州市', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('365', '141100', '吕梁市', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('366', '141101', '市辖区', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('367', '141102', '离石区', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('368', '141121', '文水县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('369', '141122', '交城县', '1', '2013-04-28 14:16:16');
INSERT INTO t_s_adminarea VALUES ('370', '141123', '兴县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('371', '141124', '临县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('372', '141125', '柳林县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('373', '141126', '石楼县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('374', '141127', '岚县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('375', '141128', '方山县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('376', '141129', '中阳县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('377', '141130', '交口县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('378', '141181', '孝义市', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('379', '141182', '汾阳市', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('380', '150000', '内蒙古自治区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('381', '150100', '呼和浩特市', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('382', '150101', '市辖区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('383', '150102', '新城区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('384', '150103', '回民区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('385', '150104', '玉泉区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('386', '150105', '赛罕区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('387', '150121', '土默特左旗', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('388', '150122', '托克托县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('389', '150123', '和林格尔县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('390', '150124', '清水河县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('391', '150125', '武川县', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('392', '150200', '包头市', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('393', '150201', '市辖区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('394', '150202', '东河区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('395', '150203', '昆都仑区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('396', '150204', '青山区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('397', '150205', '石拐区', '1', '2013-04-28 14:16:17');
INSERT INTO t_s_adminarea VALUES ('398', '150206', '白云鄂博矿区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('399', '150207', '九原区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('400', '150221', '土默特右旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('401', '150222', '固阳县', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('402', '150223', '达尔罕茂明安联合旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('403', '150300', '乌海市', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('404', '150301', '市辖区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('405', '150302', '海勃湾区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('406', '150303', '海南区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('407', '150304', '乌达区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('408', '150400', '赤峰市', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('409', '150401', '市辖区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('410', '150402', '红山区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('411', '150403', '元宝山区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('412', '150404', '松山区', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('413', '150421', '阿鲁科尔沁旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('414', '150422', '巴林左旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('415', '150423', '巴林右旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('416', '150424', '林西县', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('417', '150425', '克什克腾旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('418', '150426', '翁牛特旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('419', '150428', '喀喇沁旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('420', '150429', '宁城县', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('421', '150430', '敖汉旗', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('422', '150500', '通辽市', '1', '2013-04-28 14:16:18');
INSERT INTO t_s_adminarea VALUES ('423', '150501', '市辖区', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('424', '150502', '科尔沁区', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('425', '150521', '科尔沁左翼中旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('426', '150522', '科尔沁左翼后旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('427', '150523', '开鲁县', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('428', '150524', '库伦旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('429', '150525', '奈曼旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('430', '150526', '扎鲁特旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('431', '150581', '霍林郭勒市', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('432', '150600', '鄂尔多斯市', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('433', '150601', '市辖区', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('434', '150602', '东胜区', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('435', '150621', '达拉特旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('436', '150622', '准格尔旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('437', '150623', '鄂托克前旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('438', '150624', '鄂托克旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('439', '150625', '杭锦旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('440', '150626', '乌审旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('441', '150627', '伊金霍洛旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('442', '150700', '呼伦贝尔市', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('443', '150701', '市辖区', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('444', '150702', '海拉尔区', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('445', '150721', '阿荣旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('446', '150722', '莫力达瓦达斡尔族自治旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('447', '150723', '鄂伦春自治旗', '1', '2013-04-28 14:16:19');
INSERT INTO t_s_adminarea VALUES ('448', '150724', '鄂温克族自治旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('449', '150725', '陈巴尔虎旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('450', '150726', '新巴尔虎左旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('451', '150727', '新巴尔虎右旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('452', '150781', '满洲里市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('453', '150782', '牙克石市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('454', '150783', '扎兰屯市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('455', '150784', '额尔古纳市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('456', '150785', '根河市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('457', '150800', '巴彦淖尔市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('458', '150801', '市辖区', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('459', '150802', '临河区', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('460', '150821', '五原县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('461', '150822', '磴口县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('462', '150823', '乌拉特前旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('463', '150824', '乌拉特中旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('464', '150825', '乌拉特后旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('465', '150826', '杭锦后旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('466', '150900', '乌兰察布市', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('467', '150901', '市辖区', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('468', '150902', '集宁区', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('469', '150921', '卓资县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('470', '150922', '化德县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('471', '150923', '商都县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('472', '150924', '兴和县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('473', '150925', '凉城县', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('474', '150926', '察哈尔右翼前旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('475', '150927', '察哈尔右翼中旗', '1', '2013-04-28 14:16:20');
INSERT INTO t_s_adminarea VALUES ('476', '150928', '察哈尔右翼后旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('477', '150929', '四子王旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('478', '150981', '丰镇市', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('479', '152200', '兴安盟', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('480', '152201', '乌兰浩特市', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('481', '152202', '阿尔山市', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('482', '152221', '科尔沁右翼前旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('483', '152222', '科尔沁右翼中旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('484', '152223', '扎赉特旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('485', '152224', '突泉县', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('486', '152500', '锡林郭勒盟', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('487', '152501', '二连浩特市', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('488', '152502', '锡林浩特市', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('489', '152522', '阿巴嘎旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('490', '152523', '苏尼特左旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('491', '152524', '苏尼特右旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('492', '152525', '东乌珠穆沁旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('493', '152526', '西乌珠穆沁旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('494', '152527', '太仆寺旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('495', '152528', '镶黄旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('496', '152529', '正镶白旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('497', '152530', '正蓝旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('498', '152531', '多伦县', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('499', '152900', '阿拉善盟', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('500', '152921', '阿拉善左旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('501', '152922', '阿拉善右旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('502', '152923', '额济纳旗', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('503', '210000', '辽宁省', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('504', '210100', '沈阳市', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('505', '210101', '市辖区', '1', '2013-04-28 14:16:21');
INSERT INTO t_s_adminarea VALUES ('506', '210102', '和平区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('507', '210103', '沈河区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('508', '210104', '大东区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('509', '210105', '皇姑区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('510', '210106', '铁西区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('511', '210111', '苏家屯区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('512', '210112', '东陵区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('513', '210113', '沈北新区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('514', '210114', '于洪区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('515', '210122', '辽中县', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('516', '210123', '康平县', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('517', '210124', '法库县', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('518', '210181', '新民市', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('519', '210200', '大连市', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('520', '210201', '市辖区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('521', '210202', '中山区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('522', '210203', '西岗区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('523', '210204', '沙河口区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('524', '210211', '甘井子区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('525', '210212', '旅顺口区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('526', '210213', '金州区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('527', '210224', '长海县', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('528', '210281', '瓦房店市', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('529', '210282', '普兰店市', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('530', '210283', '庄河市', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('531', '210300', '鞍山市', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('532', '210301', '市辖区', '1', '2013-04-28 14:16:22');
INSERT INTO t_s_adminarea VALUES ('533', '210302', '铁东区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('534', '210303', '铁西区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('535', '210304', '立山区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('536', '210311', '千山区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('537', '210321', '台安县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('538', '210323', '岫岩满族自治县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('539', '210381', '海城市', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('540', '210400', '抚顺市', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('541', '210401', '市辖区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('542', '210402', '新抚区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('543', '210403', '东洲区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('544', '210404', '望花区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('545', '210411', '顺城区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('546', '210421', '抚顺县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('547', '210422', '新宾满族自治县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('548', '210423', '清原满族自治县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('549', '210500', '本溪市', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('550', '210501', '市辖区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('551', '210502', '平山区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('552', '210503', '溪湖区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('553', '210504', '明山区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('554', '210505', '南芬区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('555', '210521', '本溪满族自治县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('556', '210522', '桓仁满族自治县', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('557', '210600', '丹东市', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('558', '210601', '市辖区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('559', '210602', '元宝区', '1', '2013-04-28 14:16:23');
INSERT INTO t_s_adminarea VALUES ('560', '210603', '振兴区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('561', '210604', '振安区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('562', '210624', '宽甸满族自治县', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('563', '210681', '东港市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('564', '210682', '凤城市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('565', '210700', '锦州市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('566', '210701', '市辖区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('567', '210702', '古塔区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('568', '210703', '凌河区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('569', '210711', '太和区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('570', '210726', '黑山县', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('571', '210727', '义县', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('572', '210781', '凌海市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('573', '210782', '北镇市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('574', '210800', '营口市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('575', '210801', '市辖区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('576', '210802', '站前区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('577', '210803', '西市区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('578', '210804', '鲅鱼圈区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('579', '210811', '老边区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('580', '210881', '盖州市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('581', '210882', '大石桥市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('582', '210900', '阜新市', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('583', '210901', '市辖区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('584', '210902', '海州区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('585', '210903', '新邱区', '1', '2013-04-28 14:16:24');
INSERT INTO t_s_adminarea VALUES ('586', '210904', '太平区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('587', '210905', '清河门区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('588', '210911', '细河区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('589', '210921', '阜新蒙古族自治县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('590', '210922', '彰武县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('591', '211000', '辽阳市', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('592', '211001', '市辖区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('593', '211002', '白塔区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('594', '211003', '文圣区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('595', '211004', '宏伟区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('596', '211005', '弓长岭区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('597', '211011', '太子河区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('598', '211021', '辽阳县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('599', '211081', '灯塔市', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('600', '211100', '盘锦市', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('601', '211101', '市辖区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('602', '211102', '双台子区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('603', '211103', '兴隆台区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('604', '211121', '大洼县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('605', '211122', '盘山县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('606', '211200', '铁岭市', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('607', '211201', '市辖区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('608', '211202', '银州区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('609', '211204', '清河区', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('610', '211221', '铁岭县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('611', '211223', '西丰县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('612', '211224', '昌图县', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('613', '211281', '调兵山市', '1', '2013-04-28 14:16:25');
INSERT INTO t_s_adminarea VALUES ('614', '211282', '开原市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('615', '211300', '朝阳市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('616', '211301', '市辖区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('617', '211302', '双塔区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('618', '211303', '龙城区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('619', '211321', '朝阳县', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('620', '211322', '建平县', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('621', '211324', '喀喇沁左翼蒙古族自治县', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('622', '211381', '北票市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('623', '211382', '凌源市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('624', '211400', '葫芦岛市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('625', '211401', '市辖区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('626', '211402', '连山区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('627', '211403', '龙港区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('628', '211404', '南票区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('629', '211421', '绥中县', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('630', '211422', '建昌县', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('631', '211481', '兴城市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('632', '220000', '吉林省', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('633', '220100', '长春市', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('634', '220101', '市辖区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('635', '220102', '南关区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('636', '220103', '宽城区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('637', '220104', '朝阳区', '1', '2013-04-28 14:16:26');
INSERT INTO t_s_adminarea VALUES ('638', '220105', '二道区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('639', '220106', '绿园区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('640', '220112', '双阳区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('641', '220122', '农安县', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('642', '220181', '九台市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('643', '220182', '榆树市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('644', '220183', '德惠市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('645', '220200', '吉林市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('646', '220201', '市辖区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('647', '220202', '昌邑区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('648', '220203', '龙潭区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('649', '220204', '船营区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('650', '220211', '丰满区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('651', '220221', '永吉县', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('652', '220281', '蛟河市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('653', '220282', '桦甸市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('654', '220283', '舒兰市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('655', '220284', '磐石市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('656', '220300', '四平市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('657', '220301', '市辖区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('658', '220302', '铁西区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('659', '220303', '铁东区', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('660', '220322', '梨树县', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('661', '220323', '伊通满族自治县', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('662', '220381', '公主岭市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('663', '220382', '双辽市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('664', '220400', '辽源市', '1', '2013-04-28 14:16:27');
INSERT INTO t_s_adminarea VALUES ('665', '220401', '市辖区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('666', '220402', '龙山区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('667', '220403', '西安区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('668', '220421', '东丰县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('669', '220422', '东辽县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('670', '220500', '通化市', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('671', '220501', '市辖区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('672', '220502', '东昌区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('673', '220503', '二道江区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('674', '220521', '通化县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('675', '220523', '辉南县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('676', '220524', '柳河县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('677', '220581', '梅河口市', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('678', '220582', '集安市', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('679', '220600', '白山市', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('680', '220601', '市辖区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('681', '220602', '浑江区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('682', '220605', '江源区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('683', '220621', '抚松县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('684', '220622', '靖宇县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('685', '220623', '长白朝鲜族自治县', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('686', '220681', '临江市', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('687', '220700', '松原市', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('688', '220701', '市辖区', '1', '2013-04-28 14:16:28');
INSERT INTO t_s_adminarea VALUES ('689', '220702', '宁江区', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('690', '220721', '前郭尔罗斯蒙古族自治县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('691', '220722', '长岭县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('692', '220723', '乾安县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('693', '220724', '扶余县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('694', '220800', '白城市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('695', '220801', '市辖区', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('696', '220802', '洮北区', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('697', '220821', '镇赉县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('698', '220822', '通榆县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('699', '220881', '洮南市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('700', '220882', '大安市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('701', '222400', '延边朝鲜族自治州', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('702', '222401', '延吉市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('703', '222402', '图们市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('704', '222403', '敦化市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('705', '222404', '珲春市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('706', '222405', '龙井市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('707', '222406', '和龙市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('708', '222424', '汪清县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('709', '222426', '安图县', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('710', '230000', '黑龙江省', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('711', '230100', '哈尔滨市', '1', '2013-04-28 14:16:29');
INSERT INTO t_s_adminarea VALUES ('712', '230101', '市辖区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('713', '230102', '道里区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('714', '230103', '南岗区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('715', '230104', '道外区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('716', '230108', '平房区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('717', '230109', '松北区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('718', '230110', '香坊区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('719', '230111', '呼兰区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('720', '230112', '阿城区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('721', '230123', '依兰县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('722', '230124', '方正县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('723', '230125', '宾县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('724', '230126', '巴彦县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('725', '230127', '木兰县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('726', '230128', '通河县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('727', '230129', '延寿县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('728', '230182', '双城市', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('729', '230183', '尚志市', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('730', '230184', '五常市', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('731', '230200', '齐齐哈尔市', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('732', '230201', '市辖区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('733', '230202', '龙沙区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('734', '230203', '建华区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('735', '230204', '铁锋区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('736', '230205', '昂昂溪区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('737', '230206', '富拉尔基区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('738', '230207', '碾子山区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('739', '230208', '梅里斯达斡尔族区', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('740', '230221', '龙江县', '1', '2013-04-28 14:16:30');
INSERT INTO t_s_adminarea VALUES ('741', '230223', '依安县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('742', '230224', '泰来县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('743', '230225', '甘南县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('744', '230227', '富裕县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('745', '230229', '克山县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('746', '230230', '克东县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('747', '230231', '拜泉县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('748', '230281', '讷河市', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('749', '230300', '鸡西市', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('750', '230301', '市辖区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('751', '230302', '鸡冠区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('752', '230303', '恒山区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('753', '230304', '滴道区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('754', '230305', '梨树区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('755', '230306', '城子河区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('756', '230307', '麻山区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('757', '230321', '鸡东县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('758', '230381', '虎林市', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('759', '230382', '密山市', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('760', '230400', '鹤岗市', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('761', '230401', '市辖区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('762', '230402', '向阳区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('763', '230403', '工农区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('764', '230404', '南山区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('765', '230405', '兴安区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('766', '230406', '东山区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('767', '230407', '兴山区', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('768', '230421', '萝北县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('769', '230422', '绥滨县', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('770', '230500', '双鸭山市', '1', '2013-04-28 14:16:31');
INSERT INTO t_s_adminarea VALUES ('771', '230501', '市辖区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('772', '230502', '尖山区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('773', '230503', '岭东区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('774', '230505', '四方台区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('775', '230506', '宝山区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('776', '230521', '集贤县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('777', '230522', '友谊县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('778', '230523', '宝清县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('779', '230524', '饶河县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('780', '230600', '大庆市', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('781', '230601', '市辖区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('782', '230602', '萨尔图区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('783', '230603', '龙凤区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('784', '230604', '让胡路区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('785', '230605', '红岗区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('786', '230606', '大同区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('787', '230621', '肇州县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('788', '230622', '肇源县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('789', '230623', '林甸县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('790', '230624', '杜尔伯特蒙古族自治县', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('791', '230700', '伊春市', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('792', '230701', '市辖区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('793', '230702', '伊春区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('794', '230703', '南岔区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('795', '230704', '友好区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('796', '230705', '西林区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('797', '230706', '翠峦区', '1', '2013-04-28 14:16:32');
INSERT INTO t_s_adminarea VALUES ('798', '230707', '新青区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('799', '230708', '美溪区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('800', '230709', '金山屯区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('801', '230710', '五营区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('802', '230711', '乌马河区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('803', '230712', '汤旺河区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('804', '230713', '带岭区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('805', '230714', '乌伊岭区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('806', '230715', '红星区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('807', '230716', '上甘岭区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('808', '230722', '嘉荫县', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('809', '230781', '铁力市', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('810', '230800', '佳木斯市', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('811', '230801', '市辖区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('812', '230803', '向阳区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('813', '230804', '前进区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('814', '230805', '东风区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('815', '230811', '郊区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('816', '230822', '桦南县', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('817', '230826', '桦川县', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('818', '230828', '汤原县', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('819', '230833', '抚远县', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('820', '230881', '同江市', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('821', '230882', '富锦市', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('822', '230900', '七台河市', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('823', '230901', '市辖区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('824', '230902', '新兴区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('825', '230903', '桃山区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('826', '230904', '茄子河区', '1', '2013-04-28 14:16:33');
INSERT INTO t_s_adminarea VALUES ('827', '230921', '勃利县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('828', '231000', '牡丹江市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('829', '231001', '市辖区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('830', '231002', '东安区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('831', '231003', '阳明区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('832', '231004', '爱民区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('833', '231005', '西安区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('834', '231024', '东宁县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('835', '231025', '林口县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('836', '231081', '绥芬河市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('837', '231083', '海林市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('838', '231084', '宁安市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('839', '231085', '穆棱市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('840', '231100', '黑河市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('841', '231101', '市辖区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('842', '231102', '爱辉区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('843', '231121', '嫩江县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('844', '231123', '逊克县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('845', '231124', '孙吴县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('846', '231181', '北安市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('847', '231182', '五大连池市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('848', '231200', '绥化市', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('849', '231201', '市辖区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('850', '231202', '北林区', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('851', '231221', '望奎县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('852', '231222', '兰西县', '1', '2013-04-28 14:16:34');
INSERT INTO t_s_adminarea VALUES ('853', '231223', '青冈县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('854', '231224', '庆安县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('855', '231225', '明水县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('856', '231226', '绥棱县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('857', '231281', '安达市', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('858', '231282', '肇东市', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('859', '231283', '海伦市', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('860', '232700', '大兴安岭地区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('861', '232721', '呼玛县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('862', '232722', '塔河县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('863', '232723', '漠河县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('864', '310000', '上海市', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('865', '310100', '市辖区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('866', '310101', '黄浦区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('867', '310104', '徐汇区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('868', '310105', '长宁区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('869', '310106', '静安区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('870', '310107', '普陀区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('871', '310108', '闸北区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('872', '310109', '虹口区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('873', '310110', '杨浦区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('874', '310112', '闵行区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('875', '310113', '宝山区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('876', '310114', '嘉定区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('877', '310115', '浦东新区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('878', '310116', '金山区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('879', '310117', '松江区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('880', '310118', '青浦区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('881', '310120', '奉贤区', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('882', '310200', '县', '1', '2013-04-28 14:16:35');
INSERT INTO t_s_adminarea VALUES ('883', '310230', '崇明县', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('884', '320000', '江苏省', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('885', '320100', '南京市', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('886', '320101', '市辖区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('887', '320102', '玄武区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('888', '320103', '白下区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('889', '320104', '秦淮区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('890', '320105', '建邺区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('891', '320106', '鼓楼区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('892', '320107', '下关区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('893', '320111', '浦口区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('894', '320113', '栖霞区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('895', '320114', '雨花台区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('896', '320115', '江宁区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('897', '320116', '六合区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('898', '320124', '溧水县', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('899', '320125', '高淳县', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('900', '320200', '无锡市', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('901', '320201', '市辖区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('902', '320202', '崇安区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('903', '320203', '南长区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('904', '320204', '北塘区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('905', '320205', '锡山区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('906', '320206', '惠山区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('907', '320211', '滨湖区', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('908', '320281', '江阴市', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('909', '320282', '宜兴市', '1', '2013-04-28 14:16:36');
INSERT INTO t_s_adminarea VALUES ('910', '320300', '徐州市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('911', '320301', '市辖区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('912', '320302', '鼓楼区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('913', '320303', '云龙区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('914', '320305', '贾汪区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('915', '320311', '泉山区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('916', '320312', '铜山区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('917', '320321', '丰县', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('918', '320322', '沛县', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('919', '320324', '睢宁县', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('920', '320381', '新沂市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('921', '320382', '邳州市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('922', '320400', '常州市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('923', '320401', '市辖区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('924', '320402', '天宁区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('925', '320404', '钟楼区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('926', '320405', '戚墅堰区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('927', '320411', '新北区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('928', '320412', '武进区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('929', '320481', '溧阳市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('930', '320482', '金坛市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('931', '320500', '苏州市', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('932', '320501', '市辖区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('933', '320505', '虎丘区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('934', '320506', '吴中区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('935', '320507', '相城区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('936', '320508', '姑苏区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('937', '320509', '吴江区', '1', '2013-04-28 14:16:37');
INSERT INTO t_s_adminarea VALUES ('938', '320581', '常熟市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('939', '320582', '张家港市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('940', '320583', '昆山市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('941', '320585', '太仓市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('942', '320600', '南通市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('943', '320601', '市辖区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('944', '320602', '崇川区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('945', '320611', '港闸区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('946', '320612', '通州区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('947', '320621', '海安县', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('948', '320623', '如东县', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('949', '320681', '启东市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('950', '320682', '如皋市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('951', '320684', '海门市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('952', '320700', '连云港市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('953', '320701', '市辖区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('954', '320703', '连云区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('955', '320705', '新浦区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('956', '320706', '海州区', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('957', '320721', '赣榆县', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('958', '320722', '东海县', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('959', '320723', '灌云县', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('960', '320724', '灌南县', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('961', '320800', '淮安市', '1', '2013-04-28 14:16:38');
INSERT INTO t_s_adminarea VALUES ('962', '320801', '市辖区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('963', '320802', '清河区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('964', '320803', '淮安区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('965', '320804', '淮阴区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('966', '320811', '清浦区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('967', '320826', '涟水县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('968', '320829', '洪泽县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('969', '320830', '盱眙县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('970', '320831', '金湖县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('971', '320900', '盐城市', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('972', '320901', '市辖区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('973', '320902', '亭湖区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('974', '320903', '盐都区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('975', '320921', '响水县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('976', '320922', '滨海县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('977', '320923', '阜宁县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('978', '320924', '射阳县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('979', '320925', '建湖县', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('980', '320981', '东台市', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('981', '320982', '大丰市', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('982', '321000', '扬州市', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('983', '321001', '市辖区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('984', '321002', '广陵区', '1', '2013-04-28 14:16:39');
INSERT INTO t_s_adminarea VALUES ('985', '321003', '邗江区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('986', '321012', '江都区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('987', '321023', '宝应县', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('988', '321081', '仪征市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('989', '321084', '高邮市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('990', '321100', '镇江市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('991', '321101', '市辖区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('992', '321102', '京口区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('993', '321111', '润州区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('994', '321112', '丹徒区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('995', '321181', '丹阳市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('996', '321182', '扬中市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('997', '321183', '句容市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('998', '321200', '泰州市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('999', '321201', '市辖区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1000', '321202', '海陵区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1001', '321203', '高港区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1002', '321281', '兴化市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1003', '321282', '靖江市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1004', '321283', '泰兴市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1005', '321284', '姜堰市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1006', '321300', '宿迁市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1007', '321301', '市辖区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1008', '321302', '宿城区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1009', '321311', '宿豫区', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1010', '321322', '沭阳县', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1011', '321323', '泗阳县', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1012', '321324', '泗洪县', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1013', '330000', '浙江省', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1014', '330100', '杭州市', '1', '2013-04-28 14:16:40');
INSERT INTO t_s_adminarea VALUES ('1015', '330101', '市辖区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1016', '330102', '上城区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1017', '330103', '下城区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1018', '330104', '江干区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1019', '330105', '拱墅区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1020', '330106', '西湖区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1021', '330108', '滨江区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1022', '330109', '萧山区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1023', '330110', '余杭区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1024', '330122', '桐庐县', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1025', '330127', '淳安县', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1026', '330182', '建德市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1027', '330183', '富阳市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1028', '330185', '临安市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1029', '330200', '宁波市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1030', '330201', '市辖区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1031', '330203', '海曙区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1032', '330204', '江东区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1033', '330205', '江北区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1034', '330206', '北仑区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1035', '330211', '镇海区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1036', '330212', '鄞州区', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1037', '330225', '象山县', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1038', '330226', '宁海县', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1039', '330281', '余姚市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1040', '330282', '慈溪市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1041', '330283', '奉化市', '1', '2013-04-28 14:16:41');
INSERT INTO t_s_adminarea VALUES ('1042', '330300', '温州市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1043', '330301', '市辖区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1044', '330302', '鹿城区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1045', '330303', '龙湾区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1046', '330304', '瓯海区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1047', '330322', '洞头县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1048', '330324', '永嘉县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1049', '330326', '平阳县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1050', '330327', '苍南县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1051', '330328', '文成县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1052', '330329', '泰顺县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1053', '330381', '瑞安市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1054', '330382', '乐清市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1055', '330400', '嘉兴市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1056', '330401', '市辖区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1057', '330402', '南湖区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1058', '330411', '秀洲区', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1059', '330421', '嘉善县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1060', '330424', '海盐县', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1061', '330481', '海宁市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1062', '330482', '平湖市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1063', '330483', '桐乡市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1064', '330500', '湖州市', '1', '2013-04-28 14:16:42');
INSERT INTO t_s_adminarea VALUES ('1065', '330501', '市辖区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1066', '330502', '吴兴区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1067', '330503', '南浔区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1068', '330521', '德清县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1069', '330522', '长兴县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1070', '330523', '安吉县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1071', '330600', '绍兴市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1072', '330601', '市辖区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1073', '330602', '越城区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1074', '330621', '绍兴县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1075', '330624', '新昌县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1076', '330681', '诸暨市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1077', '330682', '上虞市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1078', '330683', '嵊州市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1079', '330700', '金华市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1080', '330701', '市辖区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1081', '330702', '婺城区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1082', '330703', '金东区', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1083', '330723', '武义县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1084', '330726', '浦江县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1085', '330727', '磐安县', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1086', '330781', '兰溪市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1087', '330782', '义乌市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1088', '330783', '东阳市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1089', '330784', '永康市', '1', '2013-04-28 14:16:43');
INSERT INTO t_s_adminarea VALUES ('1090', '330800', '衢州市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1091', '330801', '市辖区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1092', '330802', '柯城区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1093', '330803', '衢江区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1094', '330822', '常山县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1095', '330824', '开化县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1096', '330825', '龙游县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1097', '330881', '江山市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1098', '330900', '舟山市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1099', '330901', '市辖区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1100', '330902', '定海区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1101', '330903', '普陀区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1102', '330921', '岱山县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1103', '330922', '嵊泗县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1104', '331000', '台州市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1105', '331001', '市辖区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1106', '331002', '椒江区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1107', '331003', '黄岩区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1108', '331004', '路桥区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1109', '331021', '玉环县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1110', '331022', '三门县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1111', '331023', '天台县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1112', '331024', '仙居县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1113', '331081', '温岭市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1114', '331082', '临海市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1115', '331100', '丽水市', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1116', '331101', '市辖区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1117', '331102', '莲都区', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1118', '331121', '青田县', '1', '2013-04-28 14:16:44');
INSERT INTO t_s_adminarea VALUES ('1119', '331122', '缙云县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1120', '331123', '遂昌县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1121', '331124', '松阳县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1122', '331125', '云和县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1123', '331126', '庆元县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1124', '331127', '景宁畲族自治县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1125', '331181', '龙泉市', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1126', '340000', '安徽省', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1127', '340100', '合肥市', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1128', '340101', '市辖区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1129', '340102', '瑶海区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1130', '340103', '庐阳区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1131', '340104', '蜀山区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1132', '340111', '包河区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1133', '340121', '长丰县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1134', '340122', '肥东县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1135', '340123', '肥西县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1136', '340124', '庐江县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1137', '340181', '巢湖市', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1138', '340200', '芜湖市', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1139', '340201', '市辖区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1140', '340202', '镜湖区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1141', '340203', '弋江区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1142', '340207', '鸠江区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1143', '340208', '三山区', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1144', '340221', '芜湖县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1145', '340222', '繁昌县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1146', '340223', '南陵县', '1', '2013-04-28 14:16:45');
INSERT INTO t_s_adminarea VALUES ('1147', '340225', '无为县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1148', '340300', '蚌埠市', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1149', '340301', '市辖区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1150', '340302', '龙子湖区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1151', '340303', '蚌山区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1152', '340304', '禹会区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1153', '340311', '淮上区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1154', '340321', '怀远县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1155', '340322', '五河县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1156', '340323', '固镇县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1157', '340400', '淮南市', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1158', '340401', '市辖区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1159', '340402', '大通区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1160', '340403', '田家庵区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1161', '340404', '谢家集区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1162', '340405', '八公山区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1163', '340406', '潘集区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1164', '340421', '凤台县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1165', '340500', '马鞍山市', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1166', '340501', '市辖区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1167', '340503', '花山区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1168', '340504', '雨山区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1169', '340506', '博望区', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1170', '340521', '当涂县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1171', '340522', '含山县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1172', '340523', '和县', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1173', '340600', '淮北市', '1', '2013-04-28 14:16:46');
INSERT INTO t_s_adminarea VALUES ('1174', '340601', '市辖区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1175', '340602', '杜集区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1176', '340603', '相山区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1177', '340604', '烈山区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1178', '340621', '濉溪县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1179', '340700', '铜陵市', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1180', '340701', '市辖区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1181', '340702', '铜官山区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1182', '340703', '狮子山区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1183', '340711', '郊区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1184', '340721', '铜陵县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1185', '340800', '安庆市', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1186', '340801', '市辖区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1187', '340802', '迎江区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1188', '340803', '大观区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1189', '340811', '宜秀区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1190', '340822', '怀宁县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1191', '340823', '枞阳县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1192', '340824', '潜山县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1193', '340825', '太湖县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1194', '340826', '宿松县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1195', '340827', '望江县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1196', '340828', '岳西县', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1197', '340881', '桐城市', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1198', '341000', '黄山市', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1199', '341001', '市辖区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1200', '341002', '屯溪区', '1', '2013-04-28 14:16:47');
INSERT INTO t_s_adminarea VALUES ('1201', '341003', '黄山区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1202', '341004', '徽州区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1203', '341021', '歙县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1204', '341022', '休宁县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1205', '341023', '黟县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1206', '341024', '祁门县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1207', '341100', '滁州市', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1208', '341101', '市辖区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1209', '341102', '琅琊区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1210', '341103', '南谯区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1211', '341122', '来安县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1212', '341124', '全椒县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1213', '341125', '定远县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1214', '341126', '凤阳县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1215', '341181', '天长市', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1216', '341182', '明光市', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1217', '341200', '阜阳市', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1218', '341201', '市辖区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1219', '341202', '颍州区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1220', '341203', '颍东区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1221', '341204', '颍泉区', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1222', '341221', '临泉县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1223', '341222', '太和县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1224', '341225', '阜南县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1225', '341226', '颍上县', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1226', '341282', '界首市', '1', '2013-04-28 14:16:48');
INSERT INTO t_s_adminarea VALUES ('1227', '341300', '宿州市', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1228', '341301', '市辖区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1229', '341302', '埇桥区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1230', '341321', '砀山县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1231', '341322', '萧县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1232', '341323', '灵璧县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1233', '341324', '泗县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1234', '341500', '六安市', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1235', '341501', '市辖区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1236', '341502', '金安区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1237', '341503', '裕安区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1238', '341521', '寿县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1239', '341522', '霍邱县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1240', '341523', '舒城县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1241', '341524', '金寨县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1242', '341525', '霍山县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1243', '341600', '亳州市', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1244', '341601', '市辖区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1245', '341602', '谯城区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1246', '341621', '涡阳县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1247', '341622', '蒙城县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1248', '341623', '利辛县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1249', '341700', '池州市', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1250', '341701', '市辖区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1251', '341702', '贵池区', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1252', '341721', '东至县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1253', '341722', '石台县', '1', '2013-04-28 14:16:49');
INSERT INTO t_s_adminarea VALUES ('1254', '341723', '青阳县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1255', '341800', '宣城市', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1256', '341801', '市辖区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1257', '341802', '宣州区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1258', '341821', '郎溪县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1259', '341822', '广德县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1260', '341823', '泾县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1261', '341824', '绩溪县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1262', '341825', '旌德县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1263', '341881', '宁国市', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1264', '350000', '福建省', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1265', '350100', '福州市', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1266', '350101', '市辖区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1267', '350102', '鼓楼区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1268', '350103', '台江区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1269', '350104', '仓山区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1270', '350105', '马尾区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1271', '350111', '晋安区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1272', '350121', '闽侯县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1273', '350122', '连江县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1274', '350123', '罗源县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1275', '350124', '闽清县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1276', '350125', '永泰县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1277', '350128', '平潭县', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1278', '350181', '福清市', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1279', '350182', '长乐市', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1280', '350200', '厦门市', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1281', '350201', '市辖区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1282', '350203', '思明区', '1', '2013-04-28 14:16:50');
INSERT INTO t_s_adminarea VALUES ('1283', '350205', '海沧区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1284', '350206', '湖里区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1285', '350211', '集美区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1286', '350212', '同安区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1287', '350213', '翔安区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1288', '350300', '莆田市', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1289', '350301', '市辖区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1290', '350302', '城厢区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1291', '350303', '涵江区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1292', '350304', '荔城区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1293', '350305', '秀屿区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1294', '350322', '仙游县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1295', '350400', '三明市', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1296', '350401', '市辖区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1297', '350402', '梅列区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1298', '350403', '三元区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1299', '350421', '明溪县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1300', '350423', '清流县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1301', '350424', '宁化县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1302', '350425', '大田县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1303', '350426', '尤溪县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1304', '350427', '沙县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1305', '350428', '将乐县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1306', '350429', '泰宁县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1307', '350430', '建宁县', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1308', '350481', '永安市', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1309', '350500', '泉州市', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1310', '350501', '市辖区', '1', '2013-04-28 14:16:51');
INSERT INTO t_s_adminarea VALUES ('1311', '350502', '鲤城区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1312', '350503', '丰泽区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1313', '350504', '洛江区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1314', '350505', '泉港区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1315', '350521', '惠安县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1316', '350524', '安溪县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1317', '350525', '永春县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1318', '350526', '德化县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1319', '350527', '金门县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1320', '350581', '石狮市', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1321', '350582', '晋江市', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1322', '350583', '南安市', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1323', '350600', '漳州市', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1324', '350601', '市辖区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1325', '350602', '芗城区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1326', '350603', '龙文区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1327', '350622', '云霄县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1328', '350623', '漳浦县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1329', '350624', '诏安县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1330', '350625', '长泰县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1331', '350626', '东山县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1332', '350627', '南靖县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1333', '350628', '平和县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1334', '350629', '华安县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1335', '350681', '龙海市', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1336', '350700', '南平市', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1337', '350701', '市辖区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1338', '350702', '延平区', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1339', '350721', '顺昌县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1340', '350722', '浦城县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1341', '350723', '光泽县', '1', '2013-04-28 14:16:52');
INSERT INTO t_s_adminarea VALUES ('1342', '350724', '松溪县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1343', '350725', '政和县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1344', '350781', '邵武市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1345', '350782', '武夷山市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1346', '350783', '建瓯市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1347', '350784', '建阳市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1348', '350800', '龙岩市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1349', '350801', '市辖区', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1350', '350802', '新罗区', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1351', '350821', '长汀县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1352', '350822', '永定县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1353', '350823', '上杭县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1354', '350824', '武平县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1355', '350825', '连城县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1356', '350881', '漳平市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1357', '350900', '宁德市', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1358', '350901', '市辖区', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1359', '350902', '蕉城区', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1360', '350921', '霞浦县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1361', '350922', '古田县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1362', '350923', '屏南县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1363', '350924', '寿宁县', '1', '2013-04-28 14:16:53');
INSERT INTO t_s_adminarea VALUES ('1364', '350925', '周宁县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1365', '350926', '柘荣县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1366', '350981', '福安市', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1367', '350982', '福鼎市', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1368', '360000', '江西省', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1369', '360100', '南昌市', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1370', '360101', '市辖区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1371', '360102', '东湖区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1372', '360103', '西湖区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1373', '360104', '青云谱区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1374', '360105', '湾里区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1375', '360111', '青山湖区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1376', '360121', '南昌县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1377', '360122', '新建县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1378', '360123', '安义县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1379', '360124', '进贤县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1380', '360200', '景德镇市', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1381', '360201', '市辖区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1382', '360202', '昌江区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1383', '360203', '珠山区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1384', '360222', '浮梁县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1385', '360281', '乐平市', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1386', '360300', '萍乡市', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1387', '360301', '市辖区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1388', '360302', '安源区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1389', '360313', '湘东区', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1390', '360321', '莲花县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1391', '360322', '上栗县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1392', '360323', '芦溪县', '1', '2013-04-28 14:16:54');
INSERT INTO t_s_adminarea VALUES ('1393', '360400', '九江市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1394', '360401', '市辖区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1395', '360402', '庐山区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1396', '360403', '浔阳区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1397', '360421', '九江县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1398', '360423', '武宁县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1399', '360424', '修水县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1400', '360425', '永修县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1401', '360426', '德安县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1402', '360427', '星子县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1403', '360428', '都昌县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1404', '360429', '湖口县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1405', '360430', '彭泽县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1406', '360481', '瑞昌市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1407', '360482', '共青城市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1408', '360500', '新余市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1409', '360501', '市辖区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1410', '360502', '渝水区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1411', '360521', '分宜县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1412', '360600', '鹰潭市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1413', '360601', '市辖区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1414', '360602', '月湖区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1415', '360622', '余江县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1416', '360681', '贵溪市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1417', '360700', '赣州市', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1418', '360701', '市辖区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1419', '360702', '章贡区', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1420', '360721', '赣县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1421', '360722', '信丰县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1422', '360723', '大余县', '1', '2013-04-28 14:16:55');
INSERT INTO t_s_adminarea VALUES ('1423', '360724', '上犹县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1424', '360725', '崇义县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1425', '360726', '安远县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1426', '360727', '龙南县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1427', '360728', '定南县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1428', '360729', '全南县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1429', '360730', '宁都县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1430', '360731', '于都县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1431', '360732', '兴国县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1432', '360733', '会昌县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1433', '360734', '寻乌县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1434', '360735', '石城县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1435', '360781', '瑞金市', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1436', '360782', '南康市', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1437', '360800', '吉安市', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1438', '360801', '市辖区', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1439', '360802', '吉州区', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1440', '360803', '青原区', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1441', '360821', '吉安县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1442', '360822', '吉水县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1443', '360823', '峡江县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1444', '360824', '新干县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1445', '360825', '永丰县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1446', '360826', '泰和县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1447', '360827', '遂川县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1448', '360828', '万安县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1449', '360829', '安福县', '1', '2013-04-28 14:16:56');
INSERT INTO t_s_adminarea VALUES ('1450', '360830', '永新县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1451', '360881', '井冈山市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1452', '360900', '宜春市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1453', '360901', '市辖区', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1454', '360902', '袁州区', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1455', '360921', '奉新县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1456', '360922', '万载县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1457', '360923', '上高县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1458', '360924', '宜丰县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1459', '360925', '靖安县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1460', '360926', '铜鼓县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1461', '360981', '丰城市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1462', '360982', '樟树市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1463', '360983', '高安市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1464', '361000', '抚州市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1465', '361001', '市辖区', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1466', '361002', '临川区', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1467', '361021', '南城县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1468', '361022', '黎川县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1469', '361023', '南丰县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1470', '361024', '崇仁县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1471', '361025', '乐安县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1472', '361026', '宜黄县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1473', '361027', '金溪县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1474', '361028', '资溪县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1475', '361029', '东乡县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1476', '361030', '广昌县', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1477', '361100', '上饶市', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1478', '361101', '市辖区', '1', '2013-04-28 14:16:57');
INSERT INTO t_s_adminarea VALUES ('1479', '361102', '信州区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1480', '361121', '上饶县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1481', '361122', '广丰县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1482', '361123', '玉山县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1483', '361124', '铅山县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1484', '361125', '横峰县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1485', '361126', '弋阳县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1486', '361127', '余干县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1487', '361128', '鄱阳县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1488', '361129', '万年县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1489', '361130', '婺源县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1490', '361181', '德兴市', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1491', '370000', '山东省', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1492', '370100', '济南市', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1493', '370101', '市辖区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1494', '370102', '历下区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1495', '370103', '市中区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1496', '370104', '槐荫区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1497', '370105', '天桥区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1498', '370112', '历城区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1499', '370113', '长清区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1500', '370124', '平阴县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1501', '370125', '济阳县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1502', '370126', '商河县', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1503', '370181', '章丘市', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1504', '370200', '青岛市', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1505', '370201', '市辖区', '1', '2013-04-28 14:16:58');
INSERT INTO t_s_adminarea VALUES ('1506', '370202', '市南区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1507', '370203', '市北区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1508', '370205', '四方区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1509', '370211', '黄岛区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1510', '370212', '崂山区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1511', '370213', '李沧区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1512', '370214', '城阳区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1513', '370281', '胶州市', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1514', '370282', '即墨市', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1515', '370283', '平度市', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1516', '370284', '胶南市', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1517', '370285', '莱西市', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1518', '370300', '淄博市', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1519', '370301', '市辖区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1520', '370302', '淄川区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1521', '370303', '张店区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1522', '370304', '博山区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1523', '370305', '临淄区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1524', '370306', '周村区', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1525', '370321', '桓台县', '1', '2013-04-28 14:16:59');
INSERT INTO t_s_adminarea VALUES ('1526', '370322', '高青县', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1527', '370323', '沂源县', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1528', '370400', '枣庄市', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1529', '370401', '市辖区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1530', '370402', '市中区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1531', '370403', '薛城区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1532', '370404', '峄城区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1533', '370405', '台儿庄区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1534', '370406', '山亭区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1535', '370481', '滕州市', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1536', '370500', '东营市', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1537', '370501', '市辖区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1538', '370502', '东营区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1539', '370503', '河口区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1540', '370521', '垦利县', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1541', '370522', '利津县', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1542', '370523', '广饶县', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1543', '370600', '烟台市', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1544', '370601', '市辖区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1545', '370602', '芝罘区', '1', '2013-04-28 14:17:00');
INSERT INTO t_s_adminarea VALUES ('1546', '370611', '福山区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1547', '370612', '牟平区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1548', '370613', '莱山区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1549', '370634', '长岛县', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1550', '370681', '龙口市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1551', '370682', '莱阳市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1552', '370683', '莱州市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1553', '370684', '蓬莱市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1554', '370685', '招远市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1555', '370686', '栖霞市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1556', '370687', '海阳市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1557', '370700', '潍坊市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1558', '370701', '市辖区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1559', '370702', '潍城区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1560', '370703', '寒亭区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1561', '370704', '坊子区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1562', '370705', '奎文区', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1563', '370724', '临朐县', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1564', '370725', '昌乐县', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1565', '370781', '青州市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1566', '370782', '诸城市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1567', '370783', '寿光市', '1', '2013-04-28 14:17:01');
INSERT INTO t_s_adminarea VALUES ('1568', '370784', '安丘市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1569', '370785', '高密市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1570', '370786', '昌邑市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1571', '370800', '济宁市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1572', '370801', '市辖区', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1573', '370802', '市中区', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1574', '370811', '任城区', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1575', '370826', '微山县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1576', '370827', '鱼台县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1577', '370828', '金乡县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1578', '370829', '嘉祥县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1579', '370830', '汶上县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1580', '370831', '泗水县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1581', '370832', '梁山县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1582', '370881', '曲阜市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1583', '370882', '兖州市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1584', '370883', '邹城市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1585', '370900', '泰安市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1586', '370901', '市辖区', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1587', '370902', '泰山区', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1588', '370911', '岱岳区', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1589', '370921', '宁阳县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1590', '370923', '东平县', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1591', '370982', '新泰市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1592', '370983', '肥城市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1593', '371000', '威海市', '1', '2013-04-28 14:17:02');
INSERT INTO t_s_adminarea VALUES ('1594', '371001', '市辖区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1595', '371002', '环翠区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1596', '371081', '文登市', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1597', '371082', '荣成市', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1598', '371083', '乳山市', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1599', '371100', '日照市', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1600', '371101', '市辖区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1601', '371102', '东港区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1602', '371103', '岚山区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1603', '371121', '五莲县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1604', '371122', '莒县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1605', '371200', '莱芜市', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1606', '371201', '市辖区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1607', '371202', '莱城区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1608', '371203', '钢城区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1609', '371300', '临沂市', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1610', '371301', '市辖区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1611', '371302', '兰山区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1612', '371311', '罗庄区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1613', '371312', '河东区', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1614', '371321', '沂南县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1615', '371322', '郯城县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1616', '371323', '沂水县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1617', '371324', '苍山县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1618', '371325', '费县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1619', '371326', '平邑县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1620', '371327', '莒南县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1621', '371328', '蒙阴县', '1', '2013-04-28 14:17:03');
INSERT INTO t_s_adminarea VALUES ('1622', '371329', '临沭县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1623', '371400', '德州市', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1624', '371401', '市辖区', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1625', '371402', '德城区', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1626', '371421', '陵县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1627', '371422', '宁津县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1628', '371423', '庆云县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1629', '371424', '临邑县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1630', '371425', '齐河县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1631', '371426', '平原县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1632', '371427', '夏津县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1633', '371428', '武城县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1634', '371481', '乐陵市', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1635', '371482', '禹城市', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1636', '371500', '聊城市', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1637', '371501', '市辖区', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1638', '371502', '东昌府区', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1639', '371521', '阳谷县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1640', '371522', '莘县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1641', '371523', '茌平县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1642', '371524', '东阿县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1643', '371525', '冠县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1644', '371526', '高唐县', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1645', '371581', '临清市', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1646', '371600', '滨州市', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1647', '371601', '市辖区', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1648', '371602', '滨城区', '1', '2013-04-28 14:17:04');
INSERT INTO t_s_adminarea VALUES ('1649', '371621', '惠民县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1650', '371622', '阳信县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1651', '371623', '无棣县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1652', '371624', '沾化县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1653', '371625', '博兴县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1654', '371626', '邹平县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1655', '371700', '菏泽市', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1656', '371701', '市辖区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1657', '371702', '牡丹区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1658', '371721', '曹县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1659', '371722', '单县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1660', '371723', '成武县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1661', '371724', '巨野县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1662', '371725', '郓城县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1663', '371726', '鄄城县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1664', '371727', '定陶县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1665', '371728', '东明县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1666', '410000', '河南省', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1667', '410100', '郑州市', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1668', '410101', '市辖区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1669', '410102', '中原区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1670', '410103', '二七区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1671', '410104', '管城回族区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1672', '410105', '金水区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1673', '410106', '上街区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1674', '410108', '惠济区', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1675', '410122', '中牟县', '1', '2013-04-28 14:17:05');
INSERT INTO t_s_adminarea VALUES ('1676', '410181', '巩义市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1677', '410182', '荥阳市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1678', '410183', '新密市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1679', '410184', '新郑市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1680', '410185', '登封市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1681', '410200', '开封市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1682', '410201', '市辖区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1683', '410202', '龙亭区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1684', '410203', '顺河回族区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1685', '410204', '鼓楼区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1686', '410205', '禹王台区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1687', '410211', '金明区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1688', '410221', '杞县', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1689', '410222', '通许县', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1690', '410223', '尉氏县', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1691', '410224', '开封县', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1692', '410225', '兰考县', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1693', '410300', '洛阳市', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1694', '410301', '市辖区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1695', '410302', '老城区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1696', '410303', '西工区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1697', '410304', '瀍河回族区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1698', '410305', '涧西区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1699', '410306', '吉利区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1700', '410311', '洛龙区', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1701', '410322', '孟津县', '1', '2013-04-28 14:17:06');
INSERT INTO t_s_adminarea VALUES ('1702', '410323', '新安县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1703', '410324', '栾川县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1704', '410325', '嵩县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1705', '410326', '汝阳县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1706', '410327', '宜阳县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1707', '410328', '洛宁县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1708', '410329', '伊川县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1709', '410381', '偃师市', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1710', '410400', '平顶山市', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1711', '410401', '市辖区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1712', '410402', '新华区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1713', '410403', '卫东区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1714', '410404', '石龙区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1715', '410411', '湛河区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1716', '410421', '宝丰县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1717', '410422', '叶县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1718', '410423', '鲁山县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1719', '410425', '郏县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1720', '410481', '舞钢市', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1721', '410482', '汝州市', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1722', '410500', '安阳市', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1723', '410501', '市辖区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1724', '410502', '文峰区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1725', '410503', '北关区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1726', '410505', '殷都区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1727', '410506', '龙安区', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1728', '410522', '安阳县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1729', '410523', '汤阴县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1730', '410526', '滑县', '1', '2013-04-28 14:17:07');
INSERT INTO t_s_adminarea VALUES ('1731', '410527', '内黄县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1732', '410581', '林州市', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1733', '410600', '鹤壁市', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1734', '410601', '市辖区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1735', '410602', '鹤山区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1736', '410603', '山城区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1737', '410611', '淇滨区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1738', '410621', '浚县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1739', '410622', '淇县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1740', '410700', '新乡市', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1741', '410701', '市辖区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1742', '410702', '红旗区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1743', '410703', '卫滨区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1744', '410704', '凤泉区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1745', '410711', '牧野区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1746', '410721', '新乡县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1747', '410724', '获嘉县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1748', '410725', '原阳县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1749', '410726', '延津县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1750', '410727', '封丘县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1751', '410728', '长垣县', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1752', '410781', '卫辉市', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1753', '410782', '辉县市', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1754', '410800', '焦作市', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1755', '410801', '市辖区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1756', '410802', '解放区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1757', '410803', '中站区', '1', '2013-04-28 14:17:08');
INSERT INTO t_s_adminarea VALUES ('1758', '410804', '马村区', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1759', '410811', '山阳区', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1760', '410821', '修武县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1761', '410822', '博爱县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1762', '410823', '武陟县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1763', '410825', '温县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1764', '410882', '沁阳市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1765', '410883', '孟州市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1766', '410900', '濮阳市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1767', '410901', '市辖区', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1768', '410902', '华龙区', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1769', '410922', '清丰县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1770', '410923', '南乐县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1771', '410926', '范县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1772', '410927', '台前县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1773', '410928', '濮阳县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1774', '411000', '许昌市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1775', '411001', '市辖区', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1776', '411002', '魏都区', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1777', '411023', '许昌县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1778', '411024', '鄢陵县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1779', '411025', '襄城县', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1780', '411081', '禹州市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1781', '411082', '长葛市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1782', '411100', '漯河市', '1', '2013-04-28 14:17:09');
INSERT INTO t_s_adminarea VALUES ('1783', '411101', '市辖区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1784', '411102', '源汇区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1785', '411103', '郾城区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1786', '411104', '召陵区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1787', '411121', '舞阳县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1788', '411122', '临颍县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1789', '411200', '三门峡市', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1790', '411201', '市辖区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1791', '411202', '湖滨区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1792', '411221', '渑池县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1793', '411222', '陕县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1794', '411224', '卢氏县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1795', '411281', '义马市', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1796', '411282', '灵宝市', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1797', '411300', '南阳市', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1798', '411301', '市辖区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1799', '411302', '宛城区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1800', '411303', '卧龙区', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1801', '411321', '南召县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1802', '411322', '方城县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1803', '411323', '西峡县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1804', '411324', '镇平县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1805', '411325', '内乡县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1806', '411326', '淅川县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1807', '411327', '社旗县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1808', '411328', '唐河县', '1', '2013-04-28 14:17:10');
INSERT INTO t_s_adminarea VALUES ('1809', '411329', '新野县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1810', '411330', '桐柏县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1811', '411381', '邓州市', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1812', '411400', '商丘市', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1813', '411401', '市辖区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1814', '411402', '梁园区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1815', '411403', '睢阳区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1816', '411421', '民权县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1817', '411422', '睢县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1818', '411423', '宁陵县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1819', '411424', '柘城县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1820', '411425', '虞城县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1821', '411426', '夏邑县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1822', '411481', '永城市', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1823', '411500', '信阳市', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1824', '411501', '市辖区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1825', '411502', '浉河区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1826', '411503', '平桥区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1827', '411521', '罗山县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1828', '411522', '光山县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1829', '411523', '新县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1830', '411524', '商城县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1831', '411525', '固始县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1832', '411526', '潢川县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1833', '411527', '淮滨县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1834', '411528', '息县', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1835', '411600', '周口市', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1836', '411601', '市辖区', '1', '2013-04-28 14:17:11');
INSERT INTO t_s_adminarea VALUES ('1837', '411602', '川汇区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1838', '411621', '扶沟县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1839', '411622', '西华县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1840', '411623', '商水县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1841', '411624', '沈丘县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1842', '411625', '郸城县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1843', '411626', '淮阳县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1844', '411627', '太康县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1845', '411628', '鹿邑县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1846', '411681', '项城市', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1847', '411700', '驻马店市', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1848', '411701', '市辖区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1849', '411702', '驿城区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1850', '411721', '西平县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1851', '411722', '上蔡县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1852', '411723', '平舆县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1853', '411724', '正阳县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1854', '411725', '确山县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1855', '411726', '泌阳县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1856', '411727', '汝南县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1857', '411728', '遂平县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1858', '411729', '新蔡县', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1859', '419000', '省直辖县级行政区划', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1860', '419001', '济源市', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1861', '420000', '湖北省', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1862', '420100', '武汉市', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1863', '420101', '市辖区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1864', '420102', '江岸区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1865', '420103', '江汉区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1866', '420104', '硚口区', '1', '2013-04-28 14:17:12');
INSERT INTO t_s_adminarea VALUES ('1867', '420105', '汉阳区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1868', '420106', '武昌区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1869', '420107', '青山区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1870', '420111', '洪山区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1871', '420112', '东西湖区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1872', '420113', '汉南区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1873', '420114', '蔡甸区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1874', '420115', '江夏区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1875', '420116', '黄陂区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1876', '420117', '新洲区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1877', '420200', '黄石市', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1878', '420201', '市辖区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1879', '420202', '黄石港区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1880', '420203', '西塞山区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1881', '420204', '下陆区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1882', '420205', '铁山区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1883', '420222', '阳新县', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1884', '420281', '大冶市', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1885', '420300', '十堰市', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1886', '420301', '市辖区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1887', '420302', '茅箭区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1888', '420303', '张湾区', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1889', '420321', '郧县', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1890', '420322', '郧西县', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1891', '420323', '竹山县', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1892', '420324', '竹溪县', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1893', '420325', '房县', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1894', '420381', '丹江口市', '1', '2013-04-28 14:17:13');
INSERT INTO t_s_adminarea VALUES ('1895', '420500', '宜昌市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1896', '420501', '市辖区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1897', '420502', '西陵区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1898', '420503', '伍家岗区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1899', '420504', '点军区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1900', '420505', '猇亭区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1901', '420506', '夷陵区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1902', '420525', '远安县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1903', '420526', '兴山县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1904', '420527', '秭归县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1905', '420528', '长阳土家族自治县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1906', '420529', '五峰土家族自治县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1907', '420581', '宜都市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1908', '420582', '当阳市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1909', '420583', '枝江市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1910', '420600', '襄阳市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1911', '420601', '市辖区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1912', '420602', '襄城区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1913', '420606', '樊城区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1914', '420607', '襄州区', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1915', '420624', '南漳县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1916', '420625', '谷城县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1917', '420626', '保康县', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1918', '420682', '老河口市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1919', '420683', '枣阳市', '1', '2013-04-28 14:17:14');
INSERT INTO t_s_adminarea VALUES ('1920', '420684', '宜城市', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1921', '420700', '鄂州市', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1922', '420701', '市辖区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1923', '420702', '梁子湖区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1924', '420703', '华容区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1925', '420704', '鄂城区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1926', '420800', '荆门市', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1927', '420801', '市辖区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1928', '420802', '东宝区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1929', '420804', '掇刀区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1930', '420821', '京山县', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1931', '420822', '沙洋县', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1932', '420881', '钟祥市', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1933', '420900', '孝感市', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1934', '420901', '市辖区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1935', '420902', '孝南区', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1936', '420921', '孝昌县', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1937', '420922', '大悟县', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1938', '420923', '云梦县', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1939', '420981', '应城市', '1', '2013-04-28 14:17:15');
INSERT INTO t_s_adminarea VALUES ('1940', '420982', '安陆市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1941', '420984', '汉川市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1942', '421000', '荆州市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1943', '421001', '市辖区', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1944', '421002', '沙市区', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1945', '421003', '荆州区', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1946', '421022', '公安县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1947', '421023', '监利县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1948', '421024', '江陵县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1949', '421081', '石首市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1950', '421083', '洪湖市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1951', '421087', '松滋市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1952', '421100', '黄冈市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1953', '421101', '市辖区', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1954', '421102', '黄州区', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1955', '421121', '团风县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1956', '421122', '红安县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1957', '421123', '罗田县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1958', '421124', '英山县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1959', '421125', '浠水县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1960', '421126', '蕲春县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1961', '421127', '黄梅县', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1962', '421181', '麻城市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1963', '421182', '武穴市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1964', '421200', '咸宁市', '1', '2013-04-28 14:17:16');
INSERT INTO t_s_adminarea VALUES ('1965', '421201', '市辖区', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1966', '421202', '咸安区', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1967', '421221', '嘉鱼县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1968', '421222', '通城县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1969', '421223', '崇阳县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1970', '421224', '通山县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1971', '421281', '赤壁市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1972', '421300', '随州市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1973', '421301', '市辖区', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1974', '421303', '曾都区', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1975', '421321', '随县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1976', '421381', '广水市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1977', '422800', '恩施土家族苗族自治州', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1978', '422801', '恩施市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1979', '422802', '利川市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1980', '422822', '建始县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1981', '422823', '巴东县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1982', '422825', '宣恩县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1983', '422826', '咸丰县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1984', '422827', '来凤县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1985', '422828', '鹤峰县', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1986', '429000', '省直辖县级行政区划', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1987', '429004', '仙桃市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1988', '429005', '潜江市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1989', '429006', '天门市', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1990', '429021', '神农架林区', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1991', '430000', '湖南省', '1', '2013-04-28 14:17:17');
INSERT INTO t_s_adminarea VALUES ('1992', '430100', '长沙市', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1993', '430101', '市辖区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1994', '430102', '芙蓉区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1995', '430103', '天心区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1996', '430104', '岳麓区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1997', '430105', '开福区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1998', '430111', '雨花区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('1999', '430112', '望城区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2000', '430121', '长沙县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2001', '430124', '宁乡县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2002', '430181', '浏阳市', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2003', '430200', '株洲市', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2004', '430201', '市辖区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2005', '430202', '荷塘区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2006', '430203', '芦淞区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2007', '430204', '石峰区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2008', '430211', '天元区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2009', '430221', '株洲县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2010', '430223', '攸县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2011', '430224', '茶陵县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2012', '430225', '炎陵县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2013', '430281', '醴陵市', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2014', '430300', '湘潭市', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2015', '430301', '市辖区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2016', '430302', '雨湖区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2017', '430304', '岳塘区', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2018', '430321', '湘潭县', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2019', '430381', '湘乡市', '1', '2013-04-28 14:17:18');
INSERT INTO t_s_adminarea VALUES ('2020', '430382', '韶山市', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2021', '430400', '衡阳市', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2022', '430401', '市辖区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2023', '430405', '珠晖区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2024', '430406', '雁峰区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2025', '430407', '石鼓区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2026', '430408', '蒸湘区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2027', '430412', '南岳区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2028', '430421', '衡阳县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2029', '430422', '衡南县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2030', '430423', '衡山县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2031', '430424', '衡东县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2032', '430426', '祁东县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2033', '430481', '耒阳市', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2034', '430482', '常宁市', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2035', '430500', '邵阳市', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2036', '430501', '市辖区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2037', '430502', '双清区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2038', '430503', '大祥区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2039', '430511', '北塔区', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2040', '430521', '邵东县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2041', '430522', '新邵县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2042', '430523', '邵阳县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2043', '430524', '隆回县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2044', '430525', '洞口县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2045', '430527', '绥宁县', '1', '2013-04-28 14:17:19');
INSERT INTO t_s_adminarea VALUES ('2046', '430528', '新宁县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2047', '430529', '城步苗族自治县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2048', '430581', '武冈市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2049', '430600', '岳阳市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2050', '430601', '市辖区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2051', '430602', '岳阳楼区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2052', '430603', '云溪区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2053', '430611', '君山区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2054', '430621', '岳阳县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2055', '430623', '华容县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2056', '430624', '湘阴县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2057', '430626', '平江县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2058', '430681', '汨罗市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2059', '430682', '临湘市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2060', '430700', '常德市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2061', '430701', '市辖区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2062', '430702', '武陵区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2063', '430703', '鼎城区', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2064', '430721', '安乡县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2065', '430722', '汉寿县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2066', '430723', '澧县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2067', '430724', '临澧县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2068', '430725', '桃源县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2069', '430726', '石门县', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2070', '430781', '津市市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2071', '430800', '张家界市', '1', '2013-04-28 14:17:20');
INSERT INTO t_s_adminarea VALUES ('2072', '430801', '市辖区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2073', '430802', '永定区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2074', '430811', '武陵源区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2075', '430821', '慈利县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2076', '430822', '桑植县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2077', '430900', '益阳市', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2078', '430901', '市辖区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2079', '430902', '资阳区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2080', '430903', '赫山区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2081', '430921', '南县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2082', '430922', '桃江县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2083', '430923', '安化县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2084', '430981', '沅江市', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2085', '431000', '郴州市', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2086', '431001', '市辖区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2087', '431002', '北湖区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2088', '431003', '苏仙区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2089', '431021', '桂阳县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2090', '431022', '宜章县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2091', '431023', '永兴县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2092', '431024', '嘉禾县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2093', '431025', '临武县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2094', '431026', '汝城县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2095', '431027', '桂东县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2096', '431028', '安仁县', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2097', '431081', '资兴市', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2098', '431100', '永州市', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2099', '431101', '市辖区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2100', '431102', '零陵区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2101', '431103', '冷水滩区', '1', '2013-04-28 14:17:21');
INSERT INTO t_s_adminarea VALUES ('2102', '431121', '祁阳县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2103', '431122', '东安县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2104', '431123', '双牌县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2105', '431124', '道县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2106', '431125', '江永县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2107', '431126', '宁远县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2108', '431127', '蓝山县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2109', '431128', '新田县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2110', '431129', '江华瑶族自治县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2111', '431200', '怀化市', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2112', '431201', '市辖区', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2113', '431202', '鹤城区', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2114', '431221', '中方县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2115', '431222', '沅陵县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2116', '431223', '辰溪县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2117', '431224', '溆浦县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2118', '431225', '会同县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2119', '431226', '麻阳苗族自治县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2120', '431227', '新晃侗族自治县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2121', '431228', '芷江侗族自治县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2122', '431229', '靖州苗族侗族自治县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2123', '431230', '通道侗族自治县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2124', '431281', '洪江市', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2125', '431300', '娄底市', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2126', '431301', '市辖区', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2127', '431302', '娄星区', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2128', '431321', '双峰县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2129', '431322', '新化县', '1', '2013-04-28 14:17:22');
INSERT INTO t_s_adminarea VALUES ('2130', '431381', '冷水江市', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2131', '431382', '涟源市', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2132', '433100', '湘西土家族苗族自治州', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2133', '433101', '吉首市', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2134', '433122', '泸溪县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2135', '433123', '凤凰县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2136', '433124', '花垣县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2137', '433125', '保靖县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2138', '433126', '古丈县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2139', '433127', '永顺县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2140', '433130', '龙山县', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2141', '440000', '广东省', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2142', '440100', '广州市', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2143', '440101', '市辖区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2144', '440103', '荔湾区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2145', '440104', '越秀区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2146', '440105', '海珠区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2147', '440106', '天河区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2148', '440111', '白云区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2149', '440112', '黄埔区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2150', '440113', '番禺区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2151', '440114', '花都区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2152', '440115', '南沙区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2153', '440116', '萝岗区', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2154', '440183', '增城市', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2155', '440184', '从化市', '1', '2013-04-28 14:17:23');
INSERT INTO t_s_adminarea VALUES ('2156', '440200', '韶关市', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2157', '440201', '市辖区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2158', '440203', '武江区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2159', '440204', '浈江区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2160', '440205', '曲江区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2161', '440222', '始兴县', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2162', '440224', '仁化县', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2163', '440229', '翁源县', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2164', '440232', '乳源瑶族自治县', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2165', '440233', '新丰县', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2166', '440281', '乐昌市', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2167', '440282', '南雄市', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2168', '440300', '深圳市', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2169', '440301', '市辖区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2170', '440303', '罗湖区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2171', '440304', '福田区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2172', '440305', '南山区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2173', '440306', '宝安区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2174', '440307', '龙岗区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2175', '440308', '盐田区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2176', '440400', '珠海市', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2177', '440401', '市辖区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2178', '440402', '香洲区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2179', '440403', '斗门区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2180', '440404', '金湾区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2181', '440500', '汕头市', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2182', '440501', '市辖区', '1', '2013-04-28 14:17:24');
INSERT INTO t_s_adminarea VALUES ('2183', '440507', '龙湖区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2184', '440511', '金平区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2185', '440512', '濠江区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2186', '440513', '潮阳区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2187', '440514', '潮南区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2188', '440515', '澄海区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2189', '440523', '南澳县', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2190', '440600', '佛山市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2191', '440601', '市辖区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2192', '440604', '禅城区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2193', '440605', '南海区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2194', '440606', '顺德区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2195', '440607', '三水区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2196', '440608', '高明区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2197', '440700', '江门市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2198', '440701', '市辖区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2199', '440703', '蓬江区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2200', '440704', '江海区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2201', '440705', '新会区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2202', '440781', '台山市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2203', '440783', '开平市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2204', '440784', '鹤山市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2205', '440785', '恩平市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2206', '440800', '湛江市', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2207', '440801', '市辖区', '1', '2013-04-28 14:17:25');
INSERT INTO t_s_adminarea VALUES ('2208', '440802', '赤坎区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2209', '440803', '霞山区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2210', '440804', '坡头区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2211', '440811', '麻章区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2212', '440823', '遂溪县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2213', '440825', '徐闻县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2214', '440881', '廉江市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2215', '440882', '雷州市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2216', '440883', '吴川市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2217', '440900', '茂名市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2218', '440901', '市辖区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2219', '440902', '茂南区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2220', '440903', '茂港区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2221', '440923', '电白县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2222', '440981', '高州市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2223', '440982', '化州市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2224', '440983', '信宜市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2225', '441200', '肇庆市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2226', '441201', '市辖区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2227', '441202', '端州区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2228', '441203', '鼎湖区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2229', '441223', '广宁县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2230', '441224', '怀集县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2231', '441225', '封开县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2232', '441226', '德庆县', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2233', '441283', '高要市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2234', '441284', '四会市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2235', '441300', '惠州市', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2236', '441301', '市辖区', '1', '2013-04-28 14:17:26');
INSERT INTO t_s_adminarea VALUES ('2237', '441302', '惠城区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2238', '441303', '惠阳区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2239', '441322', '博罗县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2240', '441323', '惠东县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2241', '441324', '龙门县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2242', '441400', '梅州市', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2243', '441401', '市辖区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2244', '441402', '梅江区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2245', '441421', '梅县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2246', '441422', '大埔县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2247', '441423', '丰顺县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2248', '441424', '五华县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2249', '441426', '平远县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2250', '441427', '蕉岭县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2251', '441481', '兴宁市', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2252', '441500', '汕尾市', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2253', '441501', '市辖区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2254', '441502', '城区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2255', '441521', '海丰县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2256', '441523', '陆河县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2257', '441581', '陆丰市', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2258', '441600', '河源市', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2259', '441601', '市辖区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2260', '441602', '源城区', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2261', '441621', '紫金县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2262', '441622', '龙川县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2263', '441623', '连平县', '1', '2013-04-28 14:17:27');
INSERT INTO t_s_adminarea VALUES ('2264', '441624', '和平县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2265', '441625', '东源县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2266', '441700', '阳江市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2267', '441701', '市辖区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2268', '441702', '江城区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2269', '441721', '阳西县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2270', '441723', '阳东县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2271', '441781', '阳春市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2272', '441800', '清远市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2273', '441801', '市辖区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2274', '441802', '清城区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2275', '441821', '佛冈县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2276', '441823', '阳山县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2277', '441825', '连山壮族瑶族自治县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2278', '441826', '连南瑶族自治县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2279', '441827', '清新县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2280', '441881', '英德市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2281', '441882', '连州市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2282', '441900', '东莞市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2283', '442000', '中山市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2284', '445100', '潮州市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2285', '445101', '市辖区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2286', '445102', '湘桥区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2287', '445121', '潮安县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2288', '445122', '饶平县', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2289', '445200', '揭阳市', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2290', '445201', '市辖区', '1', '2013-04-28 14:17:28');
INSERT INTO t_s_adminarea VALUES ('2291', '445202', '榕城区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2292', '445221', '揭东县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2293', '445222', '揭西县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2294', '445224', '惠来县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2295', '445281', '普宁市', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2296', '445300', '云浮市', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2297', '445301', '市辖区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2298', '445302', '云城区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2299', '445321', '新兴县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2300', '445322', '郁南县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2301', '445323', '云安县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2302', '445381', '罗定市', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2303', '450000', '广西壮族自治区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2304', '450100', '南宁市', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2305', '450101', '市辖区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2306', '450102', '兴宁区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2307', '450103', '青秀区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2308', '450105', '江南区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2309', '450107', '西乡塘区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2310', '450108', '良庆区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2311', '450109', '邕宁区', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2312', '450122', '武鸣县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2313', '450123', '隆安县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2314', '450124', '马山县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2315', '450125', '上林县', '1', '2013-04-28 14:17:29');
INSERT INTO t_s_adminarea VALUES ('2316', '450126', '宾阳县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2317', '450127', '横县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2318', '450200', '柳州市', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2319', '450201', '市辖区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2320', '450202', '城中区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2321', '450203', '鱼峰区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2322', '450204', '柳南区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2323', '450205', '柳北区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2324', '450221', '柳江县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2325', '450222', '柳城县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2326', '450223', '鹿寨县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2327', '450224', '融安县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2328', '450225', '融水苗族自治县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2329', '450226', '三江侗族自治县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2330', '450300', '桂林市', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2331', '450301', '市辖区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2332', '450302', '秀峰区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2333', '450303', '叠彩区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2334', '450304', '象山区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2335', '450305', '七星区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2336', '450311', '雁山区', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2337', '450321', '阳朔县', '1', '2013-04-28 14:17:30');
INSERT INTO t_s_adminarea VALUES ('2338', '450322', '临桂县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2339', '450323', '灵川县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2340', '450324', '全州县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2341', '450325', '兴安县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2342', '450326', '永福县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2343', '450327', '灌阳县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2344', '450328', '龙胜各族自治县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2345', '450329', '资源县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2346', '450330', '平乐县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2347', '450331', '荔浦县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2348', '450332', '恭城瑶族自治县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2349', '450400', '梧州市', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2350', '450401', '市辖区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2351', '450403', '万秀区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2352', '450404', '蝶山区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2353', '450405', '长洲区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2354', '450421', '苍梧县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2355', '450422', '藤县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2356', '450423', '蒙山县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2357', '450481', '岑溪市', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2358', '450500', '北海市', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2359', '450501', '市辖区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2360', '450502', '海城区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2361', '450503', '银海区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2362', '450512', '铁山港区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2363', '450521', '合浦县', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2364', '450600', '防城港市', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2365', '450601', '市辖区', '1', '2013-04-28 14:17:31');
INSERT INTO t_s_adminarea VALUES ('2366', '450602', '港口区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2367', '450603', '防城区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2368', '450621', '上思县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2369', '450681', '东兴市', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2370', '450700', '钦州市', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2371', '450701', '市辖区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2372', '450702', '钦南区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2373', '450703', '钦北区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2374', '450721', '灵山县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2375', '450722', '浦北县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2376', '450800', '贵港市', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2377', '450801', '市辖区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2378', '450802', '港北区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2379', '450803', '港南区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2380', '450804', '覃塘区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2381', '450821', '平南县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2382', '450881', '桂平市', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2383', '450900', '玉林市', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2384', '450901', '市辖区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2385', '450902', '玉州区', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2386', '450921', '容县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2387', '450922', '陆川县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2388', '450923', '博白县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2389', '450924', '兴业县', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2390', '450981', '北流市', '1', '2013-04-28 14:17:32');
INSERT INTO t_s_adminarea VALUES ('2391', '451000', '百色市', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2392', '451001', '市辖区', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2393', '451002', '右江区', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2394', '451021', '田阳县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2395', '451022', '田东县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2396', '451023', '平果县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2397', '451024', '德保县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2398', '451025', '靖西县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2399', '451026', '那坡县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2400', '451027', '凌云县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2401', '451028', '乐业县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2402', '451029', '田林县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2403', '451030', '西林县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2404', '451031', '隆林各族自治县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2405', '451100', '贺州市', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2406', '451101', '市辖区', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2407', '451102', '八步区', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2408', '451121', '昭平县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2409', '451122', '钟山县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2410', '451123', '富川瑶族自治县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2411', '451200', '河池市', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2412', '451201', '市辖区', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2413', '451202', '金城江区', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2414', '451221', '南丹县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2415', '451222', '天峨县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2416', '451223', '凤山县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2417', '451224', '东兰县', '1', '2013-04-28 14:17:33');
INSERT INTO t_s_adminarea VALUES ('2418', '451225', '罗城仫佬族自治县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2419', '451226', '环江毛南族自治县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2420', '451227', '巴马瑶族自治县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2421', '451228', '都安瑶族自治县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2422', '451229', '大化瑶族自治县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2423', '451281', '宜州市', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2424', '451300', '来宾市', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2425', '451301', '市辖区', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2426', '451302', '兴宾区', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2427', '451321', '忻城县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2428', '451322', '象州县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2429', '451323', '武宣县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2430', '451324', '金秀瑶族自治县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2431', '451381', '合山市', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2432', '451400', '崇左市', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2433', '451401', '市辖区', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2434', '451402', '江洲区', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2435', '451421', '扶绥县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2436', '451422', '宁明县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2437', '451423', '龙州县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2438', '451424', '大新县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2439', '451425', '天等县', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2440', '451481', '凭祥市', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2441', '460000', '海南省', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2442', '460100', '海口市', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2443', '460101', '市辖区', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2444', '460105', '秀英区', '1', '2013-04-28 14:17:34');
INSERT INTO t_s_adminarea VALUES ('2445', '460106', '龙华区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2446', '460107', '琼山区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2447', '460108', '美兰区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2448', '460200', '三亚市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2449', '460201', '市辖区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2450', '460300', '三沙市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2451', '460321', '西沙群岛', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2452', '460322', '南沙群岛', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2453', '460323', '中沙群岛的岛礁及其海域', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2454', '469000', '省直辖县级行政区划', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2455', '469001', '五指山市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2456', '469002', '琼海市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2457', '469003', '儋州市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2458', '469005', '文昌市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2459', '469006', '万宁市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2460', '469007', '东方市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2461', '469021', '定安县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2462', '469022', '屯昌县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2463', '469023', '澄迈县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2464', '469024', '临高县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2465', '469025', '白沙黎族自治县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2466', '469026', '昌江黎族自治县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2467', '469027', '乐东黎族自治县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2468', '469028', '陵水黎族自治县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2469', '469029', '保亭黎族苗族自治县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2470', '469030', '琼中黎族苗族自治县', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2471', '500000', '重庆市', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2472', '500100', '市辖区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2473', '500101', '万州区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2474', '500102', '涪陵区', '1', '2013-04-28 14:17:35');
INSERT INTO t_s_adminarea VALUES ('2475', '500103', '渝中区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2476', '500104', '大渡口区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2477', '500105', '江北区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2478', '500106', '沙坪坝区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2479', '500107', '九龙坡区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2480', '500108', '南岸区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2481', '500109', '北碚区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2482', '500110', '綦江区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2483', '500111', '大足区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2484', '500112', '渝北区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2485', '500113', '巴南区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2486', '500114', '黔江区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2487', '500115', '长寿区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2488', '500116', '江津区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2489', '500117', '合川区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2490', '500118', '永川区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2491', '500119', '南川区', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2492', '500200', '县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2493', '500223', '潼南县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2494', '500224', '铜梁县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2495', '500226', '荣昌县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2496', '500227', '璧山县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2497', '500228', '梁平县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2498', '500229', '城口县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2499', '500230', '丰都县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2500', '500231', '垫江县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2501', '500232', '武隆县', '1', '2013-04-28 14:17:36');
INSERT INTO t_s_adminarea VALUES ('2502', '500233', '忠县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2503', '500234', '开县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2504', '500235', '云阳县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2505', '500236', '奉节县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2506', '500237', '巫山县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2507', '500238', '巫溪县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2508', '500240', '石柱土家族自治县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2509', '500241', '秀山土家族苗族自治县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2510', '500242', '酉阳土家族苗族自治县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2511', '500243', '彭水苗族土家族自治县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2512', '510000', '四川省', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2513', '510100', '成都市', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2514', '510101', '市辖区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2515', '510104', '锦江区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2516', '510105', '青羊区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2517', '510106', '金牛区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2518', '510107', '武侯区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2519', '510108', '成华区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2520', '510112', '龙泉驿区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2521', '510113', '青白江区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2522', '510114', '新都区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2523', '510115', '温江区', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2524', '510121', '金堂县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2525', '510122', '双流县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2526', '510124', '郫县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2527', '510129', '大邑县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2528', '510131', '蒲江县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2529', '510132', '新津县', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2530', '510181', '都江堰市', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2531', '510182', '彭州市', '1', '2013-04-28 14:17:37');
INSERT INTO t_s_adminarea VALUES ('2532', '510183', '邛崃市', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2533', '510184', '崇州市', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2534', '510300', '自贡市', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2535', '510301', '市辖区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2536', '510302', '自流井区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2537', '510303', '贡井区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2538', '510304', '大安区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2539', '510311', '沿滩区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2540', '510321', '荣县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2541', '510322', '富顺县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2542', '510400', '攀枝花市', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2543', '510401', '市辖区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2544', '510402', '东区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2545', '510403', '西区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2546', '510411', '仁和区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2547', '510421', '米易县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2548', '510422', '盐边县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2549', '510500', '泸州市', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2550', '510501', '市辖区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2551', '510502', '江阳区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2552', '510503', '纳溪区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2553', '510504', '龙马潭区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2554', '510521', '泸县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2555', '510522', '合江县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2556', '510524', '叙永县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2557', '510525', '古蔺县', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2558', '510600', '德阳市', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2559', '510601', '市辖区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2560', '510603', '旌阳区', '1', '2013-04-28 14:17:38');
INSERT INTO t_s_adminarea VALUES ('2561', '510623', '中江县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2562', '510626', '罗江县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2563', '510681', '广汉市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2564', '510682', '什邡市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2565', '510683', '绵竹市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2566', '510700', '绵阳市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2567', '510701', '市辖区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2568', '510703', '涪城区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2569', '510704', '游仙区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2570', '510722', '三台县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2571', '510723', '盐亭县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2572', '510724', '安县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2573', '510725', '梓潼县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2574', '510726', '北川羌族自治县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2575', '510727', '平武县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2576', '510781', '江油市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2577', '510800', '广元市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2578', '510801', '市辖区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2579', '510802', '利州区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2580', '510811', '元坝区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2581', '510812', '朝天区', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2582', '510821', '旺苍县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2583', '510822', '青川县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2584', '510823', '剑阁县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2585', '510824', '苍溪县', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2586', '510900', '遂宁市', '1', '2013-04-28 14:17:39');
INSERT INTO t_s_adminarea VALUES ('2587', '510901', '市辖区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2588', '510903', '船山区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2589', '510904', '安居区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2590', '510921', '蓬溪县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2591', '510922', '射洪县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2592', '510923', '大英县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2593', '511000', '内江市', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2594', '511001', '市辖区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2595', '511002', '市中区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2596', '511011', '东兴区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2597', '511024', '威远县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2598', '511025', '资中县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2599', '511028', '隆昌县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2600', '511100', '乐山市', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2601', '511101', '市辖区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2602', '511102', '市中区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2603', '511111', '沙湾区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2604', '511112', '五通桥区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2605', '511113', '金口河区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2606', '511123', '犍为县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2607', '511124', '井研县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2608', '511126', '夹江县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2609', '511129', '沐川县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2610', '511132', '峨边彝族自治县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2611', '511133', '马边彝族自治县', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2612', '511181', '峨眉山市', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2613', '511300', '南充市', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2614', '511301', '市辖区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2615', '511302', '顺庆区', '1', '2013-04-28 14:17:40');
INSERT INTO t_s_adminarea VALUES ('2616', '511303', '高坪区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2617', '511304', '嘉陵区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2618', '511321', '南部县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2619', '511322', '营山县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2620', '511323', '蓬安县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2621', '511324', '仪陇县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2622', '511325', '西充县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2623', '511381', '阆中市', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2624', '511400', '眉山市', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2625', '511401', '市辖区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2626', '511402', '东坡区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2627', '511421', '仁寿县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2628', '511422', '彭山县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2629', '511423', '洪雅县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2630', '511424', '丹棱县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2631', '511425', '青神县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2632', '511500', '宜宾市', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2633', '511501', '市辖区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2634', '511502', '翠屏区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2635', '511503', '南溪区', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2636', '511521', '宜宾县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2637', '511523', '江安县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2638', '511524', '长宁县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2639', '511525', '高县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2640', '511526', '珙县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2641', '511527', '筠连县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2642', '511528', '兴文县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2643', '511529', '屏山县', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2644', '511600', '广安市', '1', '2013-04-28 14:17:41');
INSERT INTO t_s_adminarea VALUES ('2645', '511601', '市辖区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2646', '511602', '广安区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2647', '511621', '岳池县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2648', '511622', '武胜县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2649', '511623', '邻水县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2650', '511681', '华蓥市', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2651', '511700', '达州市', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2652', '511701', '市辖区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2653', '511702', '通川区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2654', '511721', '达县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2655', '511722', '宣汉县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2656', '511723', '开江县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2657', '511724', '大竹县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2658', '511725', '渠县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2659', '511781', '万源市', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2660', '511800', '雅安市', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2661', '511801', '市辖区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2662', '511802', '雨城区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2663', '511803', '名山区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2664', '511822', '荥经县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2665', '511823', '汉源县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2666', '511824', '石棉县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2667', '511825', '天全县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2668', '511826', '芦山县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2669', '511827', '宝兴县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2670', '511900', '巴中市', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2671', '511901', '市辖区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2672', '511902', '巴州区', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2673', '511921', '通江县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2674', '511922', '南江县', '1', '2013-04-28 14:17:42');
INSERT INTO t_s_adminarea VALUES ('2675', '511923', '平昌县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2676', '512000', '资阳市', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2677', '512001', '市辖区', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2678', '512002', '雁江区', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2679', '512021', '安岳县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2680', '512022', '乐至县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2681', '512081', '简阳市', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2682', '513200', '阿坝藏族羌族自治州', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2683', '513221', '汶川县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2684', '513222', '理县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2685', '513223', '茂县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2686', '513224', '松潘县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2687', '513225', '九寨沟县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2688', '513226', '金川县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2689', '513227', '小金县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2690', '513228', '黑水县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2691', '513229', '马尔康县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2692', '513230', '壤塘县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2693', '513231', '阿坝县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2694', '513232', '若尔盖县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2695', '513233', '红原县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2696', '513300', '甘孜藏族自治州', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2697', '513321', '康定县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2698', '513322', '泸定县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2699', '513323', '丹巴县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2700', '513324', '九龙县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2701', '513325', '雅江县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2702', '513326', '道孚县', '1', '2013-04-28 14:17:43');
INSERT INTO t_s_adminarea VALUES ('2703', '513327', '炉霍县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2704', '513328', '甘孜县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2705', '513329', '新龙县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2706', '513330', '德格县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2707', '513331', '白玉县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2708', '513332', '石渠县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2709', '513333', '色达县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2710', '513334', '理塘县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2711', '513335', '巴塘县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2712', '513336', '乡城县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2713', '513337', '稻城县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2714', '513338', '得荣县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2715', '513400', '凉山彝族自治州', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2716', '513401', '西昌市', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2717', '513422', '木里藏族自治县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2718', '513423', '盐源县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2719', '513424', '德昌县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2720', '513425', '会理县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2721', '513426', '会东县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2722', '513427', '宁南县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2723', '513428', '普格县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2724', '513429', '布拖县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2725', '513430', '金阳县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2726', '513431', '昭觉县', '1', '2013-04-28 14:17:44');
INSERT INTO t_s_adminarea VALUES ('2727', '513432', '喜德县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2728', '513433', '冕宁县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2729', '513434', '越西县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2730', '513435', '甘洛县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2731', '513436', '美姑县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2732', '513437', '雷波县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2733', '520000', '贵州省', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2734', '520100', '贵阳市', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2735', '520101', '市辖区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2736', '520102', '南明区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2737', '520103', '云岩区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2738', '520111', '花溪区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2739', '520112', '乌当区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2740', '520113', '白云区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2741', '520114', '小河区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2742', '520121', '开阳县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2743', '520122', '息烽县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2744', '520123', '修文县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2745', '520181', '清镇市', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2746', '520200', '六盘水市', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2747', '520201', '钟山区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2748', '520203', '六枝特区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2749', '520221', '水城县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2750', '520222', '盘县', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2751', '520300', '遵义市', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2752', '520301', '市辖区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2753', '520302', '红花岗区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2754', '520303', '汇川区', '1', '2013-04-28 14:17:45');
INSERT INTO t_s_adminarea VALUES ('2755', '520321', '遵义县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2756', '520322', '桐梓县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2757', '520323', '绥阳县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2758', '520324', '正安县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2759', '520325', '道真仡佬族苗族自治县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2760', '520326', '务川仡佬族苗族自治县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2761', '520327', '凤冈县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2762', '520328', '湄潭县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2763', '520329', '余庆县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2764', '520330', '习水县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2765', '520381', '赤水市', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2766', '520382', '仁怀市', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2767', '520400', '安顺市', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2768', '520401', '市辖区', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2769', '520402', '西秀区', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2770', '520421', '平坝县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2771', '520422', '普定县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2772', '520423', '镇宁布依族苗族自治县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2773', '520424', '关岭布依族苗族自治县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2774', '520425', '紫云苗族布依族自治县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2775', '520500', '毕节市', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2776', '520502', '七星关区', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2777', '520521', '大方县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2778', '520522', '黔西县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2779', '520523', '金沙县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2780', '520524', '织金县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2781', '520525', '纳雍县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2782', '520526', '威宁彝族回族苗族自治县', '1', '2013-04-28 14:17:46');
INSERT INTO t_s_adminarea VALUES ('2783', '520527', '赫章县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2784', '520600', '铜仁市', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2785', '520602', '碧江区', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2786', '520603', '万山区', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2787', '520621', '江口县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2788', '520622', '玉屏侗族自治县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2789', '520623', '石阡县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2790', '520624', '思南县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2791', '520625', '印江土家族苗族自治县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2792', '520626', '德江县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2793', '520627', '沿河土家族自治县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2794', '520628', '松桃苗族自治县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2795', '522300', '黔西南布依族苗族自治州', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2796', '522301', '兴义市', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2797', '522322', '兴仁县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2798', '522323', '普安县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2799', '522324', '晴隆县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2800', '522325', '贞丰县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2801', '522326', '望谟县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2802', '522327', '册亨县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2803', '522328', '安龙县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2804', '522600', '黔东南苗族侗族自治州', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2805', '522601', '凯里市', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2806', '522622', '黄平县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2807', '522623', '施秉县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2808', '522624', '三穗县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2809', '522625', '镇远县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2810', '522626', '岑巩县', '1', '2013-04-28 14:17:47');
INSERT INTO t_s_adminarea VALUES ('2811', '522627', '天柱县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2812', '522628', '锦屏县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2813', '522629', '剑河县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2814', '522630', '台江县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2815', '522631', '黎平县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2816', '522632', '榕江县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2817', '522633', '从江县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2818', '522634', '雷山县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2819', '522635', '麻江县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2820', '522636', '丹寨县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2821', '522700', '黔南布依族苗族自治州', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2822', '522701', '都匀市', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2823', '522702', '福泉市', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2824', '522722', '荔波县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2825', '522723', '贵定县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2826', '522725', '瓮安县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2827', '522726', '独山县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2828', '522727', '平塘县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2829', '522728', '罗甸县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2830', '522729', '长顺县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2831', '522730', '龙里县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2832', '522731', '惠水县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2833', '522732', '三都水族自治县', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2834', '530000', '云南省', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2835', '530100', '昆明市', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2836', '530101', '市辖区', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2837', '530102', '五华区', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2838', '530103', '盘龙区', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2839', '530111', '官渡区', '1', '2013-04-28 14:17:48');
INSERT INTO t_s_adminarea VALUES ('2840', '530112', '西山区', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2841', '530113', '东川区', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2842', '530114', '呈贡区', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2843', '530122', '晋宁县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2844', '530124', '富民县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2845', '530125', '宜良县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2846', '530126', '石林彝族自治县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2847', '530127', '嵩明县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2848', '530128', '禄劝彝族苗族自治县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2849', '530129', '寻甸回族彝族自治县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2850', '530181', '安宁市', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2851', '530300', '曲靖市', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2852', '530301', '市辖区', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2853', '530302', '麒麟区', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2854', '530321', '马龙县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2855', '530322', '陆良县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2856', '530323', '师宗县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2857', '530324', '罗平县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2858', '530325', '富源县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2859', '530326', '会泽县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2860', '530328', '沾益县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2861', '530381', '宣威市', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2862', '530400', '玉溪市', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2863', '530402', '红塔区', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2864', '530421', '江川县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2865', '530422', '澄江县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2866', '530423', '通海县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2867', '530424', '华宁县', '1', '2013-04-28 14:17:49');
INSERT INTO t_s_adminarea VALUES ('2868', '530425', '易门县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2869', '530426', '峨山彝族自治县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2870', '530427', '新平彝族傣族自治县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2871', '530428', '元江哈尼族彝族傣族自治县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2872', '530500', '保山市', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2873', '530501', '市辖区', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2874', '530502', '隆阳区', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2875', '530521', '施甸县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2876', '530522', '腾冲县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2877', '530523', '龙陵县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2878', '530524', '昌宁县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2879', '530600', '昭通市', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2880', '530601', '市辖区', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2881', '530602', '昭阳区', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2882', '530621', '鲁甸县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2883', '530622', '巧家县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2884', '530623', '盐津县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2885', '530624', '大关县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2886', '530625', '永善县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2887', '530626', '绥江县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2888', '530627', '镇雄县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2889', '530628', '彝良县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2890', '530629', '威信县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2891', '530630', '水富县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2892', '530700', '丽江市', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2893', '530701', '市辖区', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2894', '530702', '古城区', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2895', '530721', '玉龙纳西族自治县', '1', '2013-04-28 14:17:50');
INSERT INTO t_s_adminarea VALUES ('2896', '530722', '永胜县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2897', '530723', '华坪县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2898', '530724', '宁蒗彝族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2899', '530800', '普洱市', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2900', '530801', '市辖区', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2901', '530802', '思茅区', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2902', '530821', '宁洱哈尼族彝族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2903', '530822', '墨江哈尼族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2904', '530823', '景东彝族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2905', '530824', '景谷傣族彝族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2906', '530825', '镇沅彝族哈尼族拉祜族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2907', '530826', '江城哈尼族彝族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2908', '530827', '孟连傣族拉祜族佤族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2909', '530828', '澜沧拉祜族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2910', '530829', '西盟佤族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2911', '530900', '临沧市', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2912', '530901', '市辖区', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2913', '530902', '临翔区', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2914', '530921', '凤庆县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2915', '530922', '云县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2916', '530923', '永德县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2917', '530924', '镇康县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2918', '530925', '双江拉祜族佤族布朗族傣族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2919', '530926', '耿马傣族佤族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2920', '530927', '沧源佤族自治县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2921', '532300', '楚雄彝族自治州', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2922', '532301', '楚雄市', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2923', '532322', '双柏县', '1', '2013-04-28 14:17:51');
INSERT INTO t_s_adminarea VALUES ('2924', '532323', '牟定县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2925', '532324', '南华县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2926', '532325', '姚安县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2927', '532326', '大姚县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2928', '532327', '永仁县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2929', '532328', '元谋县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2930', '532329', '武定县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2931', '532331', '禄丰县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2932', '532500', '红河哈尼族彝族自治州', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2933', '532501', '个旧市', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2934', '532502', '开远市', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2935', '532503', '蒙自市', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2936', '532523', '屏边苗族自治县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2937', '532524', '建水县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2938', '532525', '石屏县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2939', '532526', '弥勒县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2940', '532527', '泸西县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2941', '532528', '元阳县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2942', '532529', '红河县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2943', '532530', '金平苗族瑶族傣族自治县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2944', '532531', '绿春县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2945', '532532', '河口瑶族自治县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2946', '532600', '文山壮族苗族自治州', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2947', '532601', '文山市', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2948', '532622', '砚山县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2949', '532623', '西畴县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2950', '532624', '麻栗坡县', '1', '2013-04-28 14:17:52');
INSERT INTO t_s_adminarea VALUES ('2951', '532625', '马关县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2952', '532626', '丘北县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2953', '532627', '广南县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2954', '532628', '富宁县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2955', '532800', '西双版纳傣族自治州', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2956', '532801', '景洪市', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2957', '532822', '勐海县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2958', '532823', '勐腊县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2959', '532900', '大理白族自治州', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2960', '532901', '大理市', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2961', '532922', '漾濞彝族自治县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2962', '532923', '祥云县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2963', '532924', '宾川县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2964', '532925', '弥渡县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2965', '532926', '南涧彝族自治县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2966', '532927', '巍山彝族回族自治县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2967', '532928', '永平县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2968', '532929', '云龙县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2969', '532930', '洱源县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2970', '532931', '剑川县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2971', '532932', '鹤庆县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2972', '533100', '德宏傣族景颇族自治州', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2973', '533102', '瑞丽市', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2974', '533103', '芒市', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2975', '533122', '梁河县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2976', '533123', '盈江县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2977', '533124', '陇川县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2978', '533300', '怒江傈僳族自治州', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2979', '533321', '泸水县', '1', '2013-04-28 14:17:53');
INSERT INTO t_s_adminarea VALUES ('2980', '533323', '福贡县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2981', '533324', '贡山独龙族怒族自治县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2982', '533325', '兰坪白族普米族自治县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2983', '533400', '迪庆藏族自治州', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2984', '533421', '香格里拉县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2985', '533422', '德钦县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2986', '533423', '维西傈僳族自治县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2987', '540000', '西藏自治区', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2988', '540100', '拉萨市', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2989', '540101', '市辖区', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2990', '540102', '城关区', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2991', '540121', '林周县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2992', '540122', '当雄县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2993', '540123', '尼木县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2994', '540124', '曲水县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2995', '540125', '堆龙德庆县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2996', '540126', '达孜县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2997', '540127', '墨竹工卡县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2998', '542100', '昌都地区', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('2999', '542121', '昌都县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3000', '542122', '江达县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3001', '542123', '贡觉县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3002', '542124', '类乌齐县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3003', '542125', '丁青县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3004', '542126', '察雅县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3005', '542127', '八宿县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3006', '542128', '左贡县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3007', '542129', '芒康县', '1', '2013-04-28 14:17:54');
INSERT INTO t_s_adminarea VALUES ('3008', '542132', '洛隆县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3009', '542133', '边坝县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3010', '542200', '山南地区', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3011', '542221', '乃东县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3012', '542222', '扎囊县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3013', '542223', '贡嘎县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3014', '542224', '桑日县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3015', '542225', '琼结县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3016', '542226', '曲松县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3017', '542227', '措美县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3018', '542228', '洛扎县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3019', '542229', '加查县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3020', '542231', '隆子县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3021', '542232', '错那县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3022', '542233', '浪卡子县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3023', '542300', '日喀则地区', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3024', '542301', '日喀则市', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3025', '542322', '南木林县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3026', '542323', '江孜县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3027', '542324', '定日县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3028', '542325', '萨迦县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3029', '542326', '拉孜县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3030', '542327', '昂仁县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3031', '542328', '谢通门县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3032', '542329', '白朗县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3033', '542330', '仁布县', '1', '2013-04-28 14:17:55');
INSERT INTO t_s_adminarea VALUES ('3034', '542331', '康马县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3035', '542332', '定结县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3036', '542333', '仲巴县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3037', '542334', '亚东县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3038', '542335', '吉隆县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3039', '542336', '聂拉木县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3040', '542337', '萨嘎县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3041', '542338', '岗巴县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3042', '542400', '那曲地区', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3043', '542421', '那曲县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3044', '542422', '嘉黎县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3045', '542423', '比如县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3046', '542424', '聂荣县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3047', '542425', '安多县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3048', '542426', '申扎县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3049', '542427', '索县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3050', '542428', '班戈县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3051', '542429', '巴青县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3052', '542430', '尼玛县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3053', '542500', '阿里地区', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3054', '542521', '普兰县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3055', '542522', '札达县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3056', '542523', '噶尔县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3057', '542524', '日土县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3058', '542525', '革吉县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3059', '542526', '改则县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3060', '542527', '措勤县', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3061', '542600', '林芝地区', '1', '2013-04-28 14:17:56');
INSERT INTO t_s_adminarea VALUES ('3062', '542621', '林芝县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3063', '542622', '工布江达县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3064', '542623', '米林县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3065', '542624', '墨脱县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3066', '542625', '波密县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3067', '542626', '察隅县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3068', '542627', '朗县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3069', '610000', '陕西省', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3070', '610100', '西安市', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3071', '610101', '市辖区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3072', '610102', '新城区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3073', '610103', '碑林区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3074', '610104', '莲湖区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3075', '610111', '灞桥区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3076', '610112', '未央区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3077', '610113', '雁塔区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3078', '610114', '阎良区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3079', '610115', '临潼区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3080', '610116', '长安区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3081', '610122', '蓝田县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3082', '610124', '周至县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3083', '610125', '户县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3084', '610126', '高陵县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3085', '610200', '铜川市', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3086', '610201', '市辖区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3087', '610202', '王益区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3088', '610203', '印台区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3089', '610204', '耀州区', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3090', '610222', '宜君县', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3091', '610300', '宝鸡市', '1', '2013-04-28 14:17:57');
INSERT INTO t_s_adminarea VALUES ('3092', '610301', '市辖区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3093', '610302', '渭滨区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3094', '610303', '金台区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3095', '610304', '陈仓区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3096', '610322', '凤翔县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3097', '610323', '岐山县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3098', '610324', '扶风县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3099', '610326', '眉县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3100', '610327', '陇县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3101', '610328', '千阳县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3102', '610329', '麟游县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3103', '610330', '凤县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3104', '610331', '太白县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3105', '610400', '咸阳市', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3106', '610401', '市辖区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3107', '610402', '秦都区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3108', '610403', '杨陵区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3109', '610404', '渭城区', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3110', '610422', '三原县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3111', '610423', '泾阳县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3112', '610424', '乾县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3113', '610425', '礼泉县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3114', '610426', '永寿县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3115', '610427', '彬县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3116', '610428', '长武县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3117', '610429', '旬邑县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3118', '610430', '淳化县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3119', '610431', '武功县', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3120', '610481', '兴平市', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3121', '610500', '渭南市', '1', '2013-04-28 14:17:58');
INSERT INTO t_s_adminarea VALUES ('3122', '610501', '市辖区', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3123', '610502', '临渭区', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3124', '610521', '华县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3125', '610522', '潼关县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3126', '610523', '大荔县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3127', '610524', '合阳县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3128', '610525', '澄城县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3129', '610526', '蒲城县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3130', '610527', '白水县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3131', '610528', '富平县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3132', '610581', '韩城市', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3133', '610582', '华阴市', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3134', '610600', '延安市', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3135', '610601', '市辖区', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3136', '610602', '宝塔区', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3137', '610621', '延长县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3138', '610622', '延川县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3139', '610623', '子长县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3140', '610624', '安塞县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3141', '610625', '志丹县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3142', '610626', '吴起县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3143', '610627', '甘泉县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3144', '610628', '富县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3145', '610629', '洛川县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3146', '610630', '宜川县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3147', '610631', '黄龙县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3148', '610632', '黄陵县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3149', '610700', '汉中市', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3150', '610701', '市辖区', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3151', '610702', '汉台区', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3152', '610721', '南郑县', '1', '2013-04-28 14:17:59');
INSERT INTO t_s_adminarea VALUES ('3153', '610722', '城固县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3154', '610723', '洋县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3155', '610724', '西乡县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3156', '610725', '勉县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3157', '610726', '宁强县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3158', '610727', '略阳县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3159', '610728', '镇巴县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3160', '610729', '留坝县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3161', '610730', '佛坪县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3162', '610800', '榆林市', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3163', '610801', '市辖区', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3164', '610802', '榆阳区', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3165', '610821', '神木县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3166', '610822', '府谷县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3167', '610823', '横山县', '1', '2013-04-28 14:18:00');
INSERT INTO t_s_adminarea VALUES ('3168', '610824', '靖边县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3169', '610825', '定边县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3170', '610826', '绥德县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3171', '610827', '米脂县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3172', '610828', '佳县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3173', '610829', '吴堡县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3174', '610830', '清涧县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3175', '610831', '子洲县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3176', '610900', '安康市', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3177', '610901', '市辖区', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3178', '610902', '汉滨区', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3179', '610921', '汉阴县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3180', '610922', '石泉县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3181', '610923', '宁陕县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3182', '610924', '紫阳县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3183', '610925', '岚皋县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3184', '610926', '平利县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3185', '610927', '镇坪县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3186', '610928', '旬阳县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3187', '610929', '白河县', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3188', '611000', '商洛市', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3189', '611001', '市辖区', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3190', '611002', '商州区', '1', '2013-04-28 14:18:01');
INSERT INTO t_s_adminarea VALUES ('3191', '611021', '洛南县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3192', '611022', '丹凤县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3193', '611023', '商南县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3194', '611024', '山阳县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3195', '611025', '镇安县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3196', '611026', '柞水县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3197', '620000', '甘肃省', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3198', '620100', '兰州市', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3199', '620101', '市辖区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3200', '620102', '城关区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3201', '620103', '七里河区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3202', '620104', '西固区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3203', '620105', '安宁区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3204', '620111', '红古区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3205', '620121', '永登县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3206', '620122', '皋兰县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3207', '620123', '榆中县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3208', '620200', '嘉峪关市', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3209', '620201', '市辖区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3210', '620300', '金昌市', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3211', '620301', '市辖区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3212', '620302', '金川区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3213', '620321', '永昌县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3214', '620400', '白银市', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3215', '620401', '市辖区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3216', '620402', '白银区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3217', '620403', '平川区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3218', '620421', '靖远县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3219', '620422', '会宁县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3220', '620423', '景泰县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3221', '620500', '天水市', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3222', '620501', '市辖区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3223', '620502', '秦州区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3224', '620503', '麦积区', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3225', '620521', '清水县', '1', '2013-04-28 14:18:02');
INSERT INTO t_s_adminarea VALUES ('3226', '620522', '秦安县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3227', '620523', '甘谷县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3228', '620524', '武山县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3229', '620525', '张家川回族自治县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3230', '620600', '武威市', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3231', '620601', '市辖区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3232', '620602', '凉州区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3233', '620621', '民勤县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3234', '620622', '古浪县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3235', '620623', '天祝藏族自治县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3236', '620700', '张掖市', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3237', '620701', '市辖区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3238', '620702', '甘州区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3239', '620721', '肃南裕固族自治县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3240', '620722', '民乐县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3241', '620723', '临泽县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3242', '620724', '高台县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3243', '620725', '山丹县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3244', '620800', '平凉市', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3245', '620801', '市辖区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3246', '620802', '崆峒区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3247', '620821', '泾川县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3248', '620822', '灵台县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3249', '620823', '崇信县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3250', '620824', '华亭县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3251', '620825', '庄浪县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3252', '620826', '静宁县', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3253', '620900', '酒泉市', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3254', '620901', '市辖区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3255', '620902', '肃州区', '1', '2013-04-28 14:18:03');
INSERT INTO t_s_adminarea VALUES ('3256', '620921', '金塔县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3257', '620922', '瓜州县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3258', '620923', '肃北蒙古族自治县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3259', '620924', '阿克塞哈萨克族自治县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3260', '620981', '玉门市', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3261', '620982', '敦煌市', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3262', '621000', '庆阳市', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3263', '621001', '市辖区', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3264', '621002', '西峰区', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3265', '621021', '庆城县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3266', '621022', '环县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3267', '621023', '华池县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3268', '621024', '合水县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3269', '621025', '正宁县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3270', '621026', '宁县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3271', '621027', '镇原县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3272', '621100', '定西市', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3273', '621101', '市辖区', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3274', '621102', '安定区', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3275', '621121', '通渭县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3276', '621122', '陇西县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3277', '621123', '渭源县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3278', '621124', '临洮县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3279', '621125', '漳县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3280', '621126', '岷县', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3281', '621200', '陇南市', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3282', '621201', '市辖区', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3283', '621202', '武都区', '1', '2013-04-28 14:18:04');
INSERT INTO t_s_adminarea VALUES ('3284', '621221', '成县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3285', '621222', '文县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3286', '621223', '宕昌县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3287', '621224', '康县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3288', '621225', '西和县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3289', '621226', '礼县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3290', '621227', '徽县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3291', '621228', '两当县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3292', '622900', '临夏回族自治州', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3293', '622901', '临夏市', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3294', '622921', '临夏县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3295', '622922', '康乐县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3296', '622923', '永靖县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3297', '622924', '广河县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3298', '622925', '和政县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3299', '622926', '东乡族自治县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3300', '622927', '积石山保安族东乡族撒拉族自治县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3301', '623000', '甘南藏族自治州', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3302', '623001', '合作市', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3303', '623021', '临潭县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3304', '623022', '卓尼县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3305', '623023', '舟曲县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3306', '623024', '迭部县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3307', '623025', '玛曲县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3308', '623026', '碌曲县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3309', '623027', '夏河县', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3310', '630000', '青海省', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3311', '630100', '西宁市', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3312', '630101', '市辖区', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3313', '630102', '城东区', '1', '2013-04-28 14:18:05');
INSERT INTO t_s_adminarea VALUES ('3314', '630103', '城中区', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3315', '630104', '城西区', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3316', '630105', '城北区', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3317', '630121', '大通回族土族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3318', '630122', '湟中县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3319', '630123', '湟源县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3320', '632100', '海东地区', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3321', '632121', '平安县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3322', '632122', '民和回族土族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3323', '632123', '乐都县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3324', '632126', '互助土族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3325', '632127', '化隆回族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3326', '632128', '循化撒拉族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3327', '632200', '海北藏族自治州', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3328', '632221', '门源回族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3329', '632222', '祁连县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3330', '632223', '海晏县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3331', '632224', '刚察县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3332', '632300', '黄南藏族自治州', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3333', '632321', '同仁县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3334', '632322', '尖扎县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3335', '632323', '泽库县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3336', '632324', '河南蒙古族自治县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3337', '632500', '海南藏族自治州', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3338', '632521', '共和县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3339', '632522', '同德县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3340', '632523', '贵德县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3341', '632524', '兴海县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3342', '632525', '贵南县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3343', '632600', '果洛藏族自治州', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3344', '632621', '玛沁县', '1', '2013-04-28 14:18:06');
INSERT INTO t_s_adminarea VALUES ('3345', '632622', '班玛县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3346', '632623', '甘德县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3347', '632624', '达日县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3348', '632625', '久治县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3349', '632626', '玛多县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3350', '632700', '玉树藏族自治州', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3351', '632721', '玉树县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3352', '632722', '杂多县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3353', '632723', '称多县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3354', '632724', '治多县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3355', '632725', '囊谦县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3356', '632726', '曲麻莱县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3357', '632800', '海西蒙古族藏族自治州', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3358', '632801', '格尔木市', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3359', '632802', '德令哈市', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3360', '632821', '乌兰县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3361', '632822', '都兰县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3362', '632823', '天峻县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3363', '640000', '宁夏回族自治区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3364', '640100', '银川市', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3365', '640101', '市辖区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3366', '640104', '兴庆区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3367', '640105', '西夏区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3368', '640106', '金凤区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3369', '640121', '永宁县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3370', '640122', '贺兰县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3371', '640181', '灵武市', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3372', '640200', '石嘴山市', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3373', '640201', '市辖区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3374', '640202', '大武口区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3375', '640205', '惠农区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3376', '640221', '平罗县', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3377', '640300', '吴忠市', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3378', '640301', '市辖区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3379', '640302', '利通区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3380', '640303', '红寺堡区', '1', '2013-04-28 14:18:07');
INSERT INTO t_s_adminarea VALUES ('3381', '640323', '盐池县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3382', '640324', '同心县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3383', '640381', '青铜峡市', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3384', '640400', '固原市', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3385', '640401', '市辖区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3386', '640402', '原州区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3387', '640422', '西吉县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3388', '640423', '隆德县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3389', '640424', '泾源县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3390', '640425', '彭阳县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3391', '640500', '中卫市', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3392', '640501', '市辖区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3393', '640502', '沙坡头区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3394', '640521', '中宁县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3395', '640522', '海原县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3396', '650000', '新疆维吾尔自治区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3397', '650100', '乌鲁木齐市', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3398', '650101', '市辖区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3399', '650102', '天山区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3400', '650103', '沙依巴克区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3401', '650104', '新市区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3402', '650105', '水磨沟区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3403', '650106', '头屯河区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3404', '650107', '达坂城区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3405', '650109', '米东区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3406', '650121', '乌鲁木齐县', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3407', '650200', '克拉玛依市', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3408', '650201', '市辖区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3409', '650202', '独山子区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3410', '650203', '克拉玛依区', '1', '2013-04-28 14:18:08');
INSERT INTO t_s_adminarea VALUES ('3411', '650204', '白碱滩区', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3412', '650205', '乌尔禾区', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3413', '652100', '吐鲁番地区', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3414', '652101', '吐鲁番市', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3415', '652122', '鄯善县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3416', '652123', '托克逊县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3417', '652200', '哈密地区', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3418', '652201', '哈密市', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3419', '652222', '巴里坤哈萨克自治县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3420', '652223', '伊吾县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3421', '652300', '昌吉回族自治州', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3422', '652301', '昌吉市', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3423', '652302', '阜康市', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3424', '652323', '呼图壁县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3425', '652324', '玛纳斯县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3426', '652325', '奇台县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3427', '652327', '吉木萨尔县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3428', '652328', '木垒哈萨克自治县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3429', '652700', '博尔塔拉蒙古自治州', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3430', '652701', '博乐市', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3431', '652722', '精河县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3432', '652723', '温泉县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3433', '652800', '巴音郭楞蒙古自治州', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3434', '652801', '库尔勒市', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3435', '652822', '轮台县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3436', '652823', '尉犁县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3437', '652824', '若羌县', '1', '2013-04-28 14:18:09');
INSERT INTO t_s_adminarea VALUES ('3438', '652825', '且末县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3439', '652826', '焉耆回族自治县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3440', '652827', '和静县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3441', '652828', '和硕县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3442', '652829', '博湖县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3443', '652900', '阿克苏地区', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3444', '652901', '阿克苏市', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3445', '652922', '温宿县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3446', '652923', '库车县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3447', '652924', '沙雅县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3448', '652925', '新和县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3449', '652926', '拜城县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3450', '652927', '乌什县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3451', '652928', '阿瓦提县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3452', '652929', '柯坪县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3453', '653000', '克孜勒苏柯尔克孜自治州', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3454', '653001', '阿图什市', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3455', '653022', '阿克陶县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3456', '653023', '阿合奇县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3457', '653024', '乌恰县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3458', '653100', '喀什地区', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3459', '653101', '喀什市', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3460', '653121', '疏附县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3461', '653122', '疏勒县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3462', '653123', '英吉沙县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3463', '653124', '泽普县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3464', '653125', '莎车县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3465', '653126', '叶城县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3466', '653127', '麦盖提县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3467', '653128', '岳普湖县', '1', '2013-04-28 14:18:10');
INSERT INTO t_s_adminarea VALUES ('3468', '653129', '伽师县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3469', '653130', '巴楚县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3470', '653131', '塔什库尔干塔吉克自治县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3471', '653200', '和田地区', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3472', '653201', '和田市', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3473', '653221', '和田县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3474', '653222', '墨玉县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3475', '653223', '皮山县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3476', '653224', '洛浦县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3477', '653225', '策勒县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3478', '653226', '于田县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3479', '653227', '民丰县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3480', '654000', '伊犁哈萨克自治州', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3481', '654002', '伊宁市', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3482', '654003', '奎屯市', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3483', '654021', '伊宁县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3484', '654022', '察布查尔锡伯自治县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3485', '654023', '霍城县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3486', '654024', '巩留县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3487', '654025', '新源县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3488', '654026', '昭苏县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3489', '654027', '特克斯县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3490', '654028', '尼勒克县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3491', '654200', '塔城地区', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3492', '654201', '塔城市', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3493', '654202', '乌苏市', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3494', '654221', '额敏县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3495', '654223', '沙湾县', '1', '2013-04-28 14:18:11');
INSERT INTO t_s_adminarea VALUES ('3496', '654224', '托里县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3497', '654225', '裕民县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3498', '654226', '和布克赛尔蒙古自治县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3499', '654300', '阿勒泰地区', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3500', '654301', '阿勒泰市', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3501', '654321', '布尔津县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3502', '654322', '富蕴县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3503', '654323', '福海县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3504', '654324', '哈巴河县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3505', '654325', '青河县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3506', '654326', '吉木乃县', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3507', '659000', '自治区直辖县级行政区划', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3508', '659001', '石河子市', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3509', '659002', '阿拉尔市', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3510', '659003', '图木舒克市', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3511', '659004', '五家渠市', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3512', '710000', '台湾省', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3513', '810000　', '香港特别行政区', '1', '2013-04-28 14:18:12');
INSERT INTO t_s_adminarea VALUES ('3514', '820000　', '澳门特别行政区', '1', '2013-04-28 14:18:12');

-- ----------------------------
-- Table structure for `t_s_areaset`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_areaset`;
CREATE TABLE `t_s_areaset` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'serial number',
  `cameraID` int(4) unsigned NOT NULL COMMENT 'camera id',
  `event` varchar(20) NOT NULL COMMENT 'event id',
  `typeArea` int(2) unsigned DEFAULT NULL COMMENT 'area type 1:标记区域，2：标记警戒区，3：标记方向 4：标记排除区 ',
  `insTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'insert time',
  `userId` int(4) unsigned DEFAULT NULL COMMENT 'user id',
  `coordinates` varchar(255) DEFAULT NULL COMMENT '点的坐标',
  `img` varchar(256) DEFAULT NULL COMMENT 'image path',
  `width` int(4) DEFAULT NULL,
  `height` int(4) DEFAULT NULL,
  `fill` varchar(20) DEFAULT NULL COMMENT 'fill color value',
  `stroke` varchar(20) DEFAULT NULL COMMENT 'stroke color value',
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk COMMENT='t_s_areaset';

-- ----------------------------
-- Records of t_s_areaset
-- ----------------------------
INSERT INTO t_s_areaset VALUES ('1', '1', '2', '3', '2013-05-14 14:29:17', '2', '(3,4)', null, '2058', '1056', 'BLUE', 'RED', '1');
INSERT INTO t_s_areaset VALUES ('3', '4', 'NX', null, '2013-05-15 14:28:56', null, '(522,198)', 'http://10.168.1.132/pic/DH111/2013_05_14_15_44_01_0.jpg', null, null, null, '#0000ff', '1');
INSERT INTO t_s_areaset VALUES ('4', '6', 'NX', '4', '2013-05-15 15:15:41', null, null, 'http://10.168.1.132/pic/DH111/2013_05_14_15_44_01_0.jpg', '1280', '960', null, 'black', '1');
INSERT INTO t_s_areaset VALUES ('5', '4', 'CHD', '2', '2013-05-15 15:22:22', null, null, 'http://10.168.1.132/pic/DH111/2013_05_14_15_44_01_0.jpg', '1280', '960', null, '#0000ff', '1');
INSERT INTO t_s_areaset VALUES ('6', '5', 'KK', '2', '2013-05-15 15:24:29', null, '(424,270),(436,196),(284,153),(250,280)', 'http://10.168.1.132/pic/DH111/2013_05_14_15_44_01_0.jpg', '1280', '960', null, 'red', '1');
INSERT INTO t_s_areaset VALUES ('7', '1', 'WZTC', '3', '2013-05-15 15:26:28', null, '(369,128),(426,242),(516,221),(522,161)', 'http://10.168.1.132/pic/DH111/2013_05_14_15_44_01_0.jpg', '1280', '960', null, 'white', '1');

-- ----------------------------
-- Table structure for `t_s_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_baseinfo`;
CREATE TABLE `t_s_baseinfo` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `mainTitle` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `footerContent` varchar(255) DEFAULT NULL COMMENT '页脚内容,可以是HTML代码',
  `work` varchar(255) DEFAULT NULL COMMENT '使能',
  `status` int(11) DEFAULT NULL,
  `ctTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `versionnumber` varchar(255) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_baseinfo
-- ----------------------------
INSERT INTO t_s_baseinfo VALUES ('2', '1367895981215', '信帧消防通道智能监控系统', '建议使用IE浏览器，分辨率在1024*768以上', '0', '0', '2013-06-17 16:28:25', '2.0');
INSERT INTO t_s_baseinfo VALUES ('7', '1366854501250', '信帧云平安城市系统', '建议使用IE浏览器，分辨率在1024*768以上', '0', '0', '2013-06-17 16:28:33', '2.0');
INSERT INTO t_s_baseinfo VALUES ('11', '1364525015449', 'Teleframe Intelligent Traffic Cloud Analysis System', '建议使用IE浏览器，分辨率在1024*768以上', '0', '0', '2013-07-15 16:01:32', '2.0');
INSERT INTO t_s_baseinfo VALUES ('12', '1364805136618', '智能监控系统23', '信帧智能监控系统', '0', '0', '2013-04-25 11:09:47', '2.0');
INSERT INTO t_s_baseinfo VALUES ('14', '1364466520355', '测试2', '测试2', '0', '0', '2013-04-25 11:09:48', '2.0');
INSERT INTO t_s_baseinfo VALUES ('17', '1364526117297', '最后一次测试', '最后一次测试', '0', '0', '2013-04-25 11:09:50', '2.0');
INSERT INTO t_s_baseinfo VALUES ('18', '1364524454824', 'aaaaaaaaaaaaaaa', 'bbbbbbbbbbbbbbb', '0', '0', '2013-04-25 11:09:51', '2.0');
INSERT INTO t_s_baseinfo VALUES ('19', '1364524614640', 'dasdf', 'sadfasd', '0', '0', '2013-04-25 11:09:52', '2.0');
INSERT INTO t_s_baseinfo VALUES ('20', '1364535516780', '243', '23', '0', '0', '2013-04-25 11:09:53', '2.0');
INSERT INTO t_s_baseinfo VALUES ('21', '1364535618004', '信帧', '信帧', '0', '0', '2013-04-25 11:09:54', '2.0');
INSERT INTO t_s_baseinfo VALUES ('22', '1364551911817', '123', '123', '0', '0', '2013-04-25 11:09:54', '2.0');
INSERT INTO t_s_baseinfo VALUES ('23', '1364552342873', 'gdg', 'fgdg', '0', '0', '2013-04-25 11:09:55', '2.0');
INSERT INTO t_s_baseinfo VALUES ('24', '1364797715040', '1', '1', '0', '0', '2013-04-25 11:09:56', '2.0');
INSERT INTO t_s_baseinfo VALUES ('25', '1364805295705', '好用否？', '好用否？', '0', '0', '2013-04-25 11:09:57', '2.0');
INSERT INTO t_s_baseinfo VALUES ('26', '1364802928556', '000', '000', '0', '0', '2013-04-25 11:09:57', '2.0');
INSERT INTO t_s_baseinfo VALUES ('27', '1364805342910', 'asdf', 'asdfffasdf', '0', '0', '2013-04-25 11:09:58', '2.0');
INSERT INTO t_s_baseinfo VALUES ('28', '1364805393358', '111111111111', '222222222222222', '0', '0', '2013-04-25 11:09:58', '2.0');
INSERT INTO t_s_baseinfo VALUES ('29', '1364884839977', 'Teleframe Transportation', '333333', '0', '0', '2013-04-25 11:09:59', '2.0');
INSERT INTO t_s_baseinfo VALUES ('30', '1364808655270', '333', '12', '0', '0', '2013-04-25 11:10:00', '2.0');
INSERT INTO t_s_baseinfo VALUES ('31', '1364881687537', '00000', '00000', '0', '0', '2013-04-25 11:10:00', '2.0');
INSERT INTO t_s_baseinfo VALUES ('32', '1364884824711', '001122', '112233', '0', '0', '2013-04-25 11:10:01', '2.0');
INSERT INTO t_s_baseinfo VALUES ('33', '1364895478292', '123', '123', '0', '0', '2013-04-25 11:10:02', '2.0');
INSERT INTO t_s_baseinfo VALUES ('34', '1375860377404', '信帧消费通智能检测系统', '建议使用IE浏览器，分辨率在1024*768以上', '1', '1', '2013-08-07 15:26:18', '2.0');
INSERT INTO t_s_baseinfo VALUES ('35', '1366860888323', '123', '34', '0', '0', '2013-04-25 11:34:48', '2.0');
INSERT INTO t_s_baseinfo VALUES ('36', '1367889600798', '信帧矿车计数系统', '建议使用IE浏览器，分辨率在1024*768以上', '0', '0', '2013-06-17 16:28:16', 'v1.0.0.1');

-- ----------------------------
-- Table structure for `t_s_bh`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_bh`;
CREATE TABLE `t_s_bh` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ml_code` varchar(10) DEFAULT NULL COMMENT '目录的编号',
  `person_code` varchar(10) DEFAULT NULL COMMENT '人员编号',
  `ldxx_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_bh
-- ----------------------------
INSERT INTO t_s_bh VALUES ('1', '19', '100284', '100262');

-- ----------------------------
-- Table structure for `t_s_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_blacklist`;
CREATE TABLE `t_s_blacklist` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '黑名单id',
  `blackid` varchar(255) DEFAULT NULL,
  `LPNumber` varchar(255) DEFAULT NULL,
  `finished` int(2) DEFAULT NULL COMMENT '是否完成[打开/关闭]',
  `desp` varchar(512) DEFAULT NULL COMMENT '简单描述',
  `typeId` int(11) DEFAULT NULL,
  `result` varchar(512) DEFAULT NULL COMMENT '处理结果',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_blacklist
-- ----------------------------
INSERT INTO t_s_blacklist VALUES ('1', 'JA105', '京A159167', '1', '布控', '1', '', '2013-06-17 18:00:14', '1');
INSERT INTO t_s_blacklist VALUES ('3', 'JA103', '津Q78222', '0', '车辆已找回', '4', '', '2013-06-17 17:59:55', '1');
INSERT INTO t_s_blacklist VALUES ('4', 'TEST', '贵T15130', '1', '', '4', '', '2013-06-17 16:39:54', '1');
INSERT INTO t_s_blacklist VALUES ('5', '554345', '津A16196', '1', '', '6', '', '2013-06-17 18:00:00', '1');

-- ----------------------------
-- Table structure for `t_s_cameratable`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_cameratable`;
CREATE TABLE `t_s_cameratable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clssId` int(11) DEFAULT NULL,
  `producer` varchar(255) DEFAULT NULL COMMENT '摄像头厂家',
  `name` varchar(255) DEFAULT NULL,
  `cameraId` varchar(255) DEFAULT NULL,
  `locationId` varchar(255) DEFAULT NULL,
  `serverId` varchar(255) DEFAULT NULL,
  `nvrId` varchar(255) DEFAULT NULL,
  `netAddress` varchar(255) DEFAULT NULL COMMENT 'IP',
  `netMask` varchar(255) DEFAULT NULL COMMENT '子网掩码',
  `netGate` varchar(255) DEFAULT NULL COMMENT '网关',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(255) DEFAULT NULL COMMENT '密码',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `mapScaling` int(11) DEFAULT '11',
  `deviceState` varchar(64) DEFAULT NULL COMMENT '设备状态,1-在线/0-已断开',
  `status` int(11) DEFAULT '1',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_cameratable
-- ----------------------------
INSERT INTO t_s_cameratable VALUES ('2', null, 'DH', 'DH111', 'camera1', 'dl0101', 'server5', 'nvr1', '10.168.1.111', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.317224', '40.04222', '16', null, '1', '2013-05-10 22:08:48');
INSERT INTO t_s_cameratable VALUES ('3', null, 'HK', 'HK143', 'camera15', 'dl', 'server2', 'nvr1', '10.168.1.143', '255.255.255.0', '10.168.1.1', '8000', 'admin', '12345', '116.317224', '40.04222', '11', null, '1', '2013-06-14 12:17:05');
INSERT INTO t_s_cameratable VALUES ('23', null, 'DH', 'DH211', 'camera2', 'dl', 'server5', 'nvr1', '10.168.1.211', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.313163', '39.962798', '11', null, '0', '2013-06-14 12:38:36');
INSERT INTO t_s_cameratable VALUES ('24', null, 'DH', 'DH113', 'camera3', 'dl0101', 'server5', 'nvr1', '10.168.1.113', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.317781', '40.040314', '17', null, '1', '2013-05-10 22:08:48');
INSERT INTO t_s_cameratable VALUES ('25', null, 'DH', 'DH115', 'camera4', 'dl0101', 'server5', 'nvr1', '10.168.1.115', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.314151', '40.039624', '17', null, '1', '2013-05-10 22:08:48');
INSERT INTO t_s_cameratable VALUES ('26', null, 'DH', 'DG211', 'camera5', 'dl010101', 'server3', 'nvr1', '10.168.1.211', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.319488', '40.035039', '17', null, '1', '2013-05-07 15:13:55');
INSERT INTO t_s_cameratable VALUES ('27', null, 'DH', 'DH212', 'camera6', 'dl010101', 'server3', 'nvr1', '10.168.1.212', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.32017', '40.032083', '16', null, '1', '2013-05-07 15:13:55');
INSERT INTO t_s_cameratable VALUES ('28', null, 'DH', 'DH213', 'camera7', 'dl0101', '', 'nvr1', '10.168.1.213', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.307666', '40.031227', '16', null, '1', '2013-05-01 13:15:07');
INSERT INTO t_s_cameratable VALUES ('29', null, 'DH', 'camera8', 'camera8', 'dl', '', 'nvr1', '10.168.1.215', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.310648', '40.022995', '15', null, '1', '2013-04-28 14:48:17');
INSERT INTO t_s_cameratable VALUES ('30', null, 'DH', 'DH219', 'camera9', 'dl010101', 'server5', 'nvr1', '10.168.1.219', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.321553', '40.024956', '17', null, '1', '2013-06-14 12:39:02');
INSERT INTO t_s_cameratable VALUES ('31', null, 'DH', 'camera220', 'camera10', 'dl0101', '', 'nvr1', '10.168.1.220', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.325237', '40.018795', '15', null, '1', '2013-05-10 22:08:48');
INSERT INTO t_s_cameratable VALUES ('32', null, 'DH', 'DH222', 'camera11', 'dl', 'server3', 'nvr1', '192.192.192.192', '192.192.192.192', '192.192.192.192', '2032', '123', '12365', '116.314098', '40.047384', '16', null, '0', '2013-05-07 15:13:55');
INSERT INTO t_s_cameratable VALUES ('33', null, 'DH', 'DH223', 'camera12', 'dl', 'server3', 'nvr1', '192.168.168.165', '192.168.168.165', '192.168.168.165', '37777', '123', '32133', '116.226351', '40.045037', '11', null, '0', '2013-05-07 15:13:55');
INSERT INTO t_s_cameratable VALUES ('34', null, 'HK', 'HK143', 'camera13', 'dl010101', 'server4', 'nvr1', '10.168.1.142', '255.255.255.0', '10.168.1.1', '8000', 'admin', '12345', '116.32574', '40.035978', '16', null, '1', '2013-06-17 17:11:08');
INSERT INTO t_s_cameratable VALUES ('35', null, 'DH', 'DH112', 'camera14', 'dl', 'server5', '', '10.168.1.112', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.322865', '40.039872', '16', null, '1', '2013-05-10 22:08:48');
INSERT INTO t_s_cameratable VALUES ('36', null, 'DH', 'DH241', 'camera36', 'dl0101', 'server1', 'nvr1', '192.168.0.241', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '113', '115', '11', null, '1', '2013-06-13 15:30:45');

-- ----------------------------
-- Table structure for `t_s_code`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_code`;
CREATE TABLE `t_s_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `code` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `content` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `px` int(11) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_code
-- ----------------------------
INSERT INTO t_s_code VALUES ('1', 't_s_ruler.ruler_level', '0', '一级菜单', null, '2011-03-08 10:21:14', '1', null);
INSERT INTO t_s_code VALUES ('2', 't_s_ruler.ruler_echo', '0', '菜单显示', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('3', 't_s_ruler.ruler_level', '1', '二级菜单', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('4', 't_s_ruler.ruler_level', '2', '三级菜单', '', '2013-05-02 11:38:18', '1', null);
INSERT INTO t_s_code VALUES ('5', 't_s_ruler.ruler_echo', '1', '菜单不显示', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('9', 't_s_dept.dept_level', '0', '总部', null, '2012-09-07 01:35:20', '1', null);
INSERT INTO t_s_code VALUES ('11', 't_u_khxx.sex', '0', '男', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('12', 't_u_khxx.sex', '1', '女', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('18', 't_u_person.status', '0', '注销', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('19', 't_u_person.status', '1', '正常', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('20', 't_s_bz', '1', '是', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('21', 't_s_bz', '0', '否', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('22', 't_s_dept_kf.table_name', 't_s_rwgl', '任务执行', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('23', 't_s_dept_kf.status', '1', '正常', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('24', 't_s_dept_kf.status', '0', '已取消', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('25', 't_s_qjlx.bz', '0', '否', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('26', 't_s_qjlx.bz', '1', '是', null, '2011-09-05 13:39:29', '1', null);
INSERT INTO t_s_code VALUES ('69', 't_z_zlk.zllx', '1', 'word文档', '', '2011-09-06 08:42:27', '1', null);
INSERT INTO t_s_code VALUES ('70', 't_z_zlk.zllx', '2', 'execl文档', '', '2011-09-06 08:42:43', '1', null);
INSERT INTO t_s_code VALUES ('71', 't_z_zlk.zllx', '3', 'ppt文档', '', '2011-09-06 08:42:52', '1', null);
INSERT INTO t_s_code VALUES ('72', 't_z_zlk.zllx', '4', 'rar文档', '', '2011-09-06 08:43:01', '1', null);
INSERT INTO t_s_code VALUES ('73', 't_z_zlk.zllx', '5', '视频资料', '', '2011-09-06 09:02:18', '1', null);
INSERT INTO t_s_code VALUES ('74', 't_z_zlk.zllx', '6', '其他的', '', '2013-03-28 15:47:20', '1', null);
INSERT INTO t_s_code VALUES ('132', 't_s_blacklist.finished', '0', '撤控', '', '2013-05-06 13:40:43', '1', null);
INSERT INTO t_s_code VALUES ('133', 't_s_blacklist.finished', '1', '布控', '', '2013-05-06 13:40:33', '1', null);
INSERT INTO t_s_code VALUES ('134', 't_s_blacklist.finished', '2', '已完成', '', '2013-05-06 13:42:38', '1', null);
INSERT INTO t_s_code VALUES ('135', 't_s_whitelist.finished', '0', '撤控', '', '2013-05-07 19:22:33', '1', null);
INSERT INTO t_s_code VALUES ('136', 't_s_whitelist.finished', '1', '布控', '', '2013-05-07 19:22:25', '1', null);
INSERT INTO t_s_code VALUES ('137', 't_s_whitelist.finished', '2', '已完成', '', '2013-05-07 19:21:59', '1', null);

-- ----------------------------
-- Table structure for `t_s_comtx`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_comtx`;
CREATE TABLE `t_s_comtx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com` varchar(11) DEFAULT NULL,
  `ts` int(11) DEFAULT NULL,
  `sj` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_s_comtx` (`com`,`sj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk COMMENT='com口已经使用的短信数量';

-- ----------------------------
-- Records of t_s_comtx
-- ----------------------------
INSERT INTO t_s_comtx VALUES ('1', 'com7', '7', '2011110509');
INSERT INTO t_s_comtx VALUES ('2', 'com8', '5', '2011110509');
INSERT INTO t_s_comtx VALUES ('3', 'com9', '5', '2011110509');
INSERT INTO t_s_comtx VALUES ('4', 'com10', '6', '2011110509');
INSERT INTO t_s_comtx VALUES ('5', 'com7', '3', '2011110510');

-- ----------------------------
-- Table structure for `t_s_cwlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_cwlog`;
CREATE TABLE `t_s_cwlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ip` varchar(20) DEFAULT NULL,
  `user_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_nr` varchar(1000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=gbk COMMENT='错误日志';

-- ----------------------------
-- Records of t_s_cwlog
-- ----------------------------
INSERT INTO t_s_cwlog VALUES ('169', '系统自动执行', '系统自动执行', '系统自动执行', '2013-07-15 15:55:07', 'AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！Unknown column \'shortImageCom\' in \'field list\'', '1');
INSERT INTO t_s_cwlog VALUES ('170', '系统自动执行', '系统自动执行', '系统自动执行', '2013-07-15 16:10:04', 'AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！Unknown column \'shortImageCom\' in \'field list\'', '1');
INSERT INTO t_s_cwlog VALUES ('171', '系统自动执行', '系统自动执行', '系统自动执行', '2013-07-15 16:17:51', 'AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！Unknown column \'shortImageCom\' in \'field list\'', '1');

-- ----------------------------
-- Table structure for `t_s_czlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_czlog`;
CREATE TABLE `t_s_czlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ip` varchar(20) DEFAULT NULL,
  `user_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_nr` varchar(1000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322993 DEFAULT CHARSET=gbk COMMENT='操作日志';

-- ----------------------------
-- Records of t_s_czlog
-- ----------------------------

INSERT INTO t_s_czlog VALUES ('322986', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:43', '查询1.0消防事件信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('322987', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:43', '查询1.0消防事件信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('322988', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:44', '查询1.0消防事件信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('322989', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:44', '查询1.0消防事件信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('322990', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:45', '查询1.0消防事件信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('322991', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:46', '查询1.0消防事件信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('322992', 'admin', '系统管理员', '10.168.1.31', '2013-08-27 10:37:46', '查询1.0消防事件信息成功！', '1');

-- ----------------------------
-- Table structure for `t_s_databack`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_databack`;
CREATE TABLE `t_s_databack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建人',
  `value` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `recoverTime` varchar(255) DEFAULT '' COMMENT '恢复时间',
  `recoverBy` varchar(255) DEFAULT '' COMMENT '恢复人',
  `recoverNumber` int(11) DEFAULT '0' COMMENT '回复次数',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_databack
-- ----------------------------
INSERT INTO t_s_databack VALUES ('249', 'system', '20130618000307.sql', '20130618000307.sql', 'D:/Server_code/TeleframeMonitor/WEB-INF/DBBackUp/20130618000307.sql', '78618', '2013-06-18 00:03:11', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('250', 'dj', '2013618105528.sql', '2013618105528.sql', 'D:/Server_code/TeleframeMonitor/WEB-INF/DBBackUp/2013618105528.sql', '80838', '2013-06-18 10:55:44', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('251', 'system', '20130619005941.sql', '20130619005941.sql', 'D:/Server_code/TeleframeMonitor/WEB-INF/DBBackUp/20130619005941.sql', '81708', '2013-06-19 00:59:43', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('252', 'admin', '201371163338.sql', '201371163338.sql', 'E:/TeleframeMonitor/TelMonitor/WEB-INF/DBBackUp/201371163338.sql', '82851', '2013-07-01 16:33:47', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('253', 'admin', '20137116441.sql', '20137116441.sql', 'D:/Server_code/TeleframeMonitor/WEB-INF/DBBackUp/20137116441.sql', '82851', '2013-07-01 16:44:07', '', '', '0', '1');

-- ----------------------------
-- Table structure for `t_s_dcode`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dcode`;
CREATE TABLE `t_s_dcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeClass` varchar(255) DEFAULT NULL,
  `codeType` varchar(255) DEFAULT NULL,
  `codeCode` varchar(255) DEFAULT NULL,
  `codeValue` varchar(255) DEFAULT NULL,
  `serialNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_dcode
-- ----------------------------
INSERT INTO t_s_dcode VALUES ('1', 'its', ' ', '', '未知', null);
INSERT INTO t_s_dcode VALUES ('2', 'its', 'violations', 'chd', '闯红灯', null);
INSERT INTO t_s_dcode VALUES ('3', 'its', 'violations', 'nx', '逆行', null);
INSERT INTO t_s_dcode VALUES ('4', 'its', 'violations', 'bd', '违规变道', null);
INSERT INTO t_s_dcode VALUES ('5', 'its', 'violations', 'kk', '卡口', null);
INSERT INTO t_s_dcode VALUES ('6', 'its', 'violations', 'yx', '违章压线', null);
INSERT INTO t_s_dcode VALUES ('7', 'its', 'violations', 'xx', '尾号限行抓拍', null);
INSERT INTO t_s_dcode VALUES ('8', 'its', 'violations', 'tc', '违章停车', null);
INSERT INTO t_s_dcode VALUES ('9', 'its', 'violations', 'zg', '占公交车道', null);
INSERT INTO t_s_dcode VALUES ('10', 'its', 'violations', 'zf', '占非机动车道', null);
INSERT INTO t_s_dcode VALUES ('11', 'its', 'violations', 'dj', '大车禁行', null);
INSERT INTO t_s_dcode VALUES ('12', 'its', 'violations', 'cll', '车流量统计', null);
INSERT INTO t_s_dcode VALUES ('13', 'its', 'warnLevel', '00', '预警', null);
INSERT INTO t_s_dcode VALUES ('14', 'its', 'warnLevel', '01', '一般报警', null);
INSERT INTO t_s_dcode VALUES ('15', 'its', 'warnLevel', '02', '严重报警', null);
INSERT INTO t_s_dcode VALUES ('16', 'its', 'logoCode', '', '未知', null);
INSERT INTO t_s_dcode VALUES ('17', 'its', 'logoCode', 'fet', '丰田', null);
INSERT INTO t_s_dcode VALUES ('18', 'its', 'logoCode', 'bt', '本田', null);
INSERT INTO t_s_dcode VALUES ('19', 'its', 'logoCode', 'bc', '奔驰', null);
INSERT INTO t_s_dcode VALUES ('20', 'its', 'logoCode', 'bm', '宝马', null);
INSERT INTO t_s_dcode VALUES ('21', 'its', 'logoCode', 'dz', '大众', null);
INSERT INTO t_s_dcode VALUES ('22', 'its', 'logoCode', 'byd', '比亚迪', null);
INSERT INTO t_s_dcode VALUES ('23', 'its', 'logoCode', 'fut', '福特', null);
INSERT INTO t_s_dcode VALUES ('24', 'its', 'carColor', '', '未知', null);
INSERT INTO t_s_dcode VALUES ('25', 'its', 'carColor', 'red', '红', null);
INSERT INTO t_s_dcode VALUES ('26', 'its', 'carColor', 'green', '绿', null);
INSERT INTO t_s_dcode VALUES ('27', 'its', 'carColor', 'blue', '蓝', null);
INSERT INTO t_s_dcode VALUES ('28', 'its', 'carColor', 'yellow', '黄', null);
INSERT INTO t_s_dcode VALUES ('29', 'its', 'carColor', 'white', '白', null);
INSERT INTO t_s_dcode VALUES ('30', 'its', 'carColor', 'black', '黑', null);
INSERT INTO t_s_dcode VALUES ('31', 'its', 'LPNColor', '', '未知', null);
INSERT INTO t_s_dcode VALUES ('32', 'its', 'LPNColor', 'blue_white', '蓝底白字', null);
INSERT INTO t_s_dcode VALUES ('33', 'its', 'LPNColor', 'yellow_black', '黄底黑字', null);
INSERT INTO t_s_dcode VALUES ('34', 'its', 'LPNColor', 'white_black', '白底黑字', null);
INSERT INTO t_s_dcode VALUES ('35', 'its', 'LPNColor', 'black_white', '黑底白字\r\n', null);
INSERT INTO t_s_dcode VALUES ('36', 'its', 'LPNType', '', '未知', null);
INSERT INTO t_s_dcode VALUES ('37', 'its', 'LPNType', 'normal_blue', '普通蓝牌', null);
INSERT INTO t_s_dcode VALUES ('38', 'its', 'LPNType', 'normal_black', '普通黑牌', null);
INSERT INTO t_s_dcode VALUES ('39', 'its', 'LPNType', 'normal_yellow', '单层黄牌', null);
INSERT INTO t_s_dcode VALUES ('40', 'its', 'LPNType', 'coach_yellow', '教练用车', null);
INSERT INTO t_s_dcode VALUES ('41', 'its', 'LPNType', 'gua', '挂车', null);
INSERT INTO t_s_dcode VALUES ('42', 'its', 'LPNType', 'double_yellow', '双层黄牌', null);
INSERT INTO t_s_dcode VALUES ('43', 'its', 'LPNType', 'police', '白色警牌', null);
INSERT INTO t_s_dcode VALUES ('44', 'its', 'LPNType', 'wj', '白色武警', null);
INSERT INTO t_s_dcode VALUES ('45', 'its', 'LPNType', 'army', '白色军牌', null);
INSERT INTO t_s_dcode VALUES ('46', 'its', 'modelCode', '', '未知', null);
INSERT INTO t_s_dcode VALUES ('47', 'its', 'modelCode', 'big', '大车', null);
INSERT INTO t_s_dcode VALUES ('48', 'its', 'modelCode', 'small', '小轿车', null);

-- ----------------------------
-- Table structure for `t_s_deckvehicles`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_deckvehicles`;
CREATE TABLE `t_s_deckvehicles` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` varchar(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  `audit` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `auditer` varchar(255) DEFAULT NULL COMMENT '审核人',
  `audittime` varchar(255) DEFAULT NULL COMMENT '审核时间',
  `finaler` varchar(255) DEFAULT NULL COMMENT '终审人',
  `finaltime` varchar(255) DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=gbk COMMENT='交通违法事件';

-- ----------------------------
-- Records of t_s_deckvehicles
-- ----------------------------
INSERT INTO t_s_deckvehicles VALUES ('150', '27', '京AP4559', '1', '50', 'bm', 'bm', 'blue', 'red', '1', '1', '1', '1', '1', '2013-05-21 14:14:10', '2013-04-17 16:54:57', '未审核', 'system', '2013-05-21 14:14:12', null, null);
INSERT INTO t_s_deckvehicles VALUES ('151', '27', 'KR10459', '2', '50', 'BM', 'BM', 'BLACK', 'red', '1', '1', '1', '1', '1', '2013-05-21 14:14:10', '2013-05-20 17:28:10', '未审核', 'system', '2013-05-21 14:14:12', null, null);

-- ----------------------------
-- Table structure for `t_s_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dept`;
CREATE TABLE `t_s_dept` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '机构代码',
  `dept_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '机构名称',
  `dept_manager` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '上级机构代码',
  `dept_level` int(4) DEFAULT NULL COMMENT '机构层次',
  `dept_lx` int(4) DEFAULT NULL COMMENT '机构类型',
  `fgld` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导',
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '是否注销 1正常 0 注销',
  `jglx` int(4) DEFAULT NULL COMMENT '大队 0 科室 1 中队 2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_dept
-- ----------------------------
INSERT INTO t_s_dept VALUES ('55', 'bm0001', 'Root', 'bm0001', '10', '10', '007598', '2011-05-25 23:30:30', '1', '0');
INSERT INTO t_s_dept VALUES ('56', 'bm0002', '秘书科', 'bm0001', '10', '10', '100003', '2011-05-25 23:30:30', '1', '1');
INSERT INTO t_s_dept VALUES ('57', 'bm0003', '部门1', 'bm0001', '10', '10', '100003', '2011-05-25 23:30:30', '1', '1');
INSERT INTO t_s_dept VALUES ('58', 'bm0004', '部门2', 'bm0001', '10', '10', '100000', '2011-05-25 23:30:30', '1', '1');
INSERT INTO t_s_dept VALUES ('59', 'bm0005', '部门3', 'bm0001', '10', '10', '100000', '2011-05-25 23:30:30', '1', '1');
INSERT INTO t_s_dept VALUES ('60', 'bm0006', '部门4', 'bm0001', '10', '10', '100003', '2011-05-25 23:30:30', '1', '1');
INSERT INTO t_s_dept VALUES ('61', 'bm0007', '部门5', 'bm0001', '10', '10', '100002', '2011-05-25 23:30:30', '1', '1');
INSERT INTO t_s_dept VALUES ('84', 'bm101', 'bm101', 'bm0004', null, null, '', '2013-03-29 10:00:25', '1', null);
INSERT INTO t_s_dept VALUES ('85', 'bm102', 'bm102', 'bm0004', null, null, '', '2013-03-29 10:00:39', '1', null);

-- ----------------------------
-- Table structure for `t_s_deptmgr`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_deptmgr`;
CREATE TABLE `t_s_deptmgr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(6) COLLATE utf8_bin NOT NULL,
  `dept_manager` varchar(6) COLLATE utf8_bin NOT NULL,
  `dept_level` int(4) NOT NULL,
  `dept_lx` int(4) NOT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_deptmgr
-- ----------------------------
INSERT INTO t_s_deptmgr VALUES ('166', 'bm0001', 'bm0001', '10', '10', '2013-05-23 10:13:29');
INSERT INTO t_s_deptmgr VALUES ('140', 'bm0002', 'bm0001', '10', '10', '2012-03-13 17:04:55');
INSERT INTO t_s_deptmgr VALUES ('142', 'bm0003', 'bm0001', '10', '10', '2012-03-13 17:05:08');
INSERT INTO t_s_deptmgr VALUES ('169', 'bm0004', 'bm0004', '10', '10', '2013-05-23 10:19:43');
INSERT INTO t_s_deptmgr VALUES ('167', 'bm0005', 'bm0005', '10', '10', '2013-05-23 10:13:53');
INSERT INTO t_s_deptmgr VALUES ('146', 'bm0006', 'bm0001', '10', '10', '2012-03-13 17:05:40');
INSERT INTO t_s_deptmgr VALUES ('148', 'bm0007', 'bm0001', '10', '10', '2012-03-13 17:05:51');
INSERT INTO t_s_deptmgr VALUES ('160', 'bm101', 'bm101', '10', '10', '2013-03-29 10:00:25');
INSERT INTO t_s_deptmgr VALUES ('161', 'bm101', 'bm0004', '10', '10', '2013-03-29 10:00:25');
INSERT INTO t_s_deptmgr VALUES ('162', 'bm101', 'bm0001', '10', '10', '2013-03-29 10:00:25');
INSERT INTO t_s_deptmgr VALUES ('163', 'bm102', 'bm102', '10', '10', '2013-03-29 10:00:39');
INSERT INTO t_s_deptmgr VALUES ('164', 'bm102', 'bm0004', '10', '10', '2013-03-29 10:00:39');
INSERT INTO t_s_deptmgr VALUES ('165', 'bm102', 'bm0001', '10', '10', '2013-03-29 10:00:39');
INSERT INTO t_s_deptmgr VALUES ('168', 'bm0005', 'bm0001', '10', '10', '2013-05-23 10:13:53');
INSERT INTO t_s_deptmgr VALUES ('170', 'bm0004', 'bm0001', '10', '10', '2013-05-23 10:19:43');

-- ----------------------------
-- Table structure for `t_s_dllmanager`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dllmanager`;
CREATE TABLE `t_s_dllmanager` (
  `id` int(10) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `eventCode` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_dllmanager
-- ----------------------------
INSERT INTO t_s_dllmanager VALUES ('1', 'fire.dll', '消费通道检查', null, 'KK', '2013-04-10 15:05:06', '1');

-- ----------------------------
-- Table structure for `t_s_dtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dtype`;
CREATE TABLE `t_s_dtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeType` varchar(255) DEFAULT NULL,
  `codeTypeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_dtype
-- ----------------------------
INSERT INTO t_s_dtype VALUES ('1', 'ITS_EPEventType', '交通事件类型');
INSERT INTO t_s_dtype VALUES ('2', 'ITS_EPEventGrade', '交通告警级别');
INSERT INTO t_s_dtype VALUES ('3', 'ITS_EPVehicleLogo', '车标');
INSERT INTO t_s_dtype VALUES ('4', 'ITS_EPVehicleColor', '车颜色');
INSERT INTO t_s_dtype VALUES ('5', 'ITS_EPPlateColor', '车牌颜色');
INSERT INTO t_s_dtype VALUES ('6', 'ITS_EPPlateType', '车牌类型');
INSERT INTO t_s_dtype VALUES ('7', 'ITS_EPVehicleType', '车型');

-- ----------------------------
-- Table structure for `t_s_dx`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dx`;
CREATE TABLE `t_s_dx` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) DEFAULT NULL,
  `jsr` varchar(200) DEFAULT NULL COMMENT '接收人',
  `nr` varchar(5000) DEFAULT NULL,
  `bz` int(10) DEFAULT '1' COMMENT '是否发送',
  `fssj` varchar(20) DEFAULT NULL,
  `user_code` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `lrsj` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hphm` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32413 DEFAULT CHARSET=gbk COMMENT='等待发送短信的内容';

-- ----------------------------
-- Records of t_s_dx
-- ----------------------------
INSERT INTO t_s_dx VALUES ('32412', '18653156061', '系统管理员', '系统测试！', '0', '2013-4-01 09:39:56', 'admin', '系统管理员', '2013-04-01 09:39:56', null);

-- ----------------------------
-- Table structure for `t_s_eventdetail`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_eventdetail`;
CREATE TABLE `t_s_eventdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventProp_code` varchar(255) NOT NULL COMMENT '事件属性代码',
  `prop_value` varchar(255) NOT NULL COMMENT '属性值',
  `status` int(11) NOT NULL,
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_eventdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_eventtable`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_eventtable`;
CREATE TABLE `t_s_eventtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clssId` varchar(255) NOT NULL COMMENT '摄像头ID',
  `carId` varchar(255) NOT NULL COMMENT '汽车ID',
  `eventProp_code` varchar(255) NOT NULL COMMENT '事件属性代码',
  `prop_value` varchar(255) NOT NULL COMMENT '属性值',
  `status` int(11) NOT NULL DEFAULT '1',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_eventtable
-- ----------------------------
INSERT INTO t_s_eventtable VALUES ('1', 'clss1', 'car1', '3561', '150', '1', '2013-04-09 10:15:18');
INSERT INTO t_s_eventtable VALUES ('2', 'clss2', 'car1', '3563', '红', '1', '2013-04-10 12:37:19');
INSERT INTO t_s_eventtable VALUES ('3', 'clss3', 'car1', '3562', 'A123456', '1', '2013-04-10 12:37:03');
INSERT INTO t_s_eventtable VALUES ('4', 'clss4', 'car1', '3564', '/pic/1.jpg', '1', '2013-04-10 12:37:31');
INSERT INTO t_s_eventtable VALUES ('5', 'c', 'car1', '3565', '2', '1', '2013-04-10 12:38:03');
INSERT INTO t_s_eventtable VALUES ('6', 'c', 'x1', '11', '1', '1', '2013-04-10 12:38:54');
INSERT INTO t_s_eventtable VALUES ('7', 'c', 'x1', '12', '消费通道阻塞', '1', '2013-04-10 12:39:24');
INSERT INTO t_s_eventtable VALUES ('8', 'c', 'x1', '13', '3', '1', '2013-04-10 12:40:05');

-- ----------------------------
-- Table structure for `t_s_eventtablemanager`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_eventtablemanager`;
CREATE TABLE `t_s_eventtablemanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventTypeCode` varchar(255) DEFAULT NULL COMMENT '事件类型代码',
  `tableName` varchar(255) DEFAULT NULL COMMENT '事件表名称',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建人',
  `sum` int(11) DEFAULT NULL COMMENT '数据总量(条)',
  `work` int(2) DEFAULT NULL COMMENT '使能状态',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `startTime` varchar(255) DEFAULT '' COMMENT '开始时间',
  `endTime` varchar(255) DEFAULT '' COMMENT '结束时间',
  `status` int(2) DEFAULT '1',
  `desp` varchar(255) DEFAULT NULL COMMENT '简单的描述,一般写该记录的简介',
  `reserve1` varchar(255) DEFAULT '保留' COMMENT '保留字段,方便扩充',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_eventtablemanager
-- ----------------------------
INSERT INTO t_s_eventtablemanager VALUES ('42', 'KK', 'KK_20130419_170521', 'System', '2', '0', '2013-05-09 10:29:43', '2013-04-19 17:05:21', '2013-04-19 17:19:10', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('43', 'XFTD', 'XFTD_20130419_170521', 'System', '2', '0', '2013-04-19 17:19:06', '2013-04-19 17:05:21', '2013-04-19 17:19:10', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('44', 'KK', 'KK_20130419_171910', 'System', '4', '0', '2013-05-09 11:26:25', '2013-04-19 17:19:10', '2013-04-22 14:15:09', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('45', 'XFTD', 'XFTD_20130419_171910', 'System', '2', '0', '2013-04-22 14:15:12', '2013-04-19 17:19:10', '2013-04-22 14:15:09', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('46', 'KK', 'KK_20130422_141509', 'System', '2', '0', '2013-05-08 15:57:42', '2013-04-22 14:15:09', '2013-04-22 17:12:59', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('47', 'XFTD', 'XFTD_20130422_141509', 'System', '2', '0', '2013-04-22 17:24:24', '2013-04-22 14:15:09', '2013-04-22 17:24:21', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('48', 'KK', 'KK_20130422_171259', 'System', '2', '0', '2013-05-08 18:38:21', '2013-04-22 17:12:59', '2013-04-25 16:18:03', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('49', 'XFTD', 'XFTD_20130422_172421', 'System', '2', '0', '2013-06-14 10:54:40', '2013-04-22 17:24:21', '2013-06-14 10:54:40', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('51', 'KK', 'KK_20130425_161803', 'System', '2', '0', '2013-05-08 15:57:42', '2013-04-25 16:18:03', '2013-04-28 11:47:23', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('52', 'dzjc', 'dzjc_20130419_170521', 'system', '2', '0', '2013-04-26 18:32:46', '', '2013-04-26 18:32:46', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('53', 'DZJC', 'DZJC_20130426_183246', 'System', null, '1', '2013-04-26 18:32:46', '2013-04-26 18:32:46', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('59', 'KK', 'KK_20130428_114723', 'System', '2', '0', '2013-05-08 15:57:42', '2013-04-28 11:47:23', '2013-04-28 11:52:37', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('60', 'KK', 'KK_20130428_115237', 'System', '4', '0', '2013-05-09 11:02:14', '2013-04-28 11:52:37', '2013-04-28 12:05:33', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('76', 'KK', 'KK_20130508_163157', 'System', '3', '0', '2013-06-07 15:42:04', '', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('77', 'KK', 'KK_20130508_165150', 'System', '3', '1', '2013-06-07 15:42:11', '', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('78', 'KK', 'KK_20130508_165921', 'System', '3', '0', '2013-06-07 15:42:09', '', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('79', 'KK', 'KK_20130509_112237', 'System', '2', '0', '2013-05-09 14:09:54', '2013-04-25 14:09:07.0', '2013-05-06 14:09:26.0', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('83', 'KK', 'KK_2013613114454', 'admin', null, null, '2013-06-13 11:44:56', '', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('84', 'XFTD', 'XFTD_20136131273', 'admin', null, null, '2013-06-13 12:07:05', '', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('85', 'XFTD', 'XFTD_20130614_105440', 'admin', '0', '0', '2013-06-14 11:17:53', '2013-06-14 10:54:40', '2013-06-14 11:17:53', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('86', 'XFTD', 'XFTD_20130614_111129', 'admin', null, '0', '2013-06-14 11:16:41', '2013-06-14 11:11:29', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('87', 'XFTD', 'XFTD_20130614_111753', 'admin', '0', '0', '2013-06-14 11:20:30', '2013-06-14 11:17:53', '2013-06-14 11:20:30', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('88', 'XFTD', 'XFTD_20130614_112030', 'admin', '0', '0', '2013-06-14 11:21:16', '2013-06-14 11:20:30', '2013-06-14 11:21:16', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('89', 'XFTD', 'XFTD_20130614_112116', 'admin', '0', '0', '2013-06-14 11:51:31', '2013-06-14 11:21:16', '2013-06-14 11:51:31', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('90', 'XFTD', 'XFTD_20130614_114551', 'admin', null, '0', '2013-06-14 11:50:47', '2013-06-14 11:45:51', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('91', 'XFTD', 'XFTD_20130614_114921', 'admin', null, '0', '2013-06-14 11:50:21', '2013-06-14 11:49:21', '', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('92', 'XFTD', 'wq', 'admin', '0', '0', '2013-06-14 12:08:17', '2013-06-14 11:51:31', '2013-06-14 12:08:18', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('93', 'XFTD', 'rw', 'admin', '0', '0', '2013-06-14 12:11:52', '2013-06-14 12:08:18', '2013-06-14 12:11:52', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('94', 'XFTD', 'fengXFTD_20130614_121152', 'admin', '0', '0', '2013-06-14 12:13:47', '2013-06-14 12:11:52', '2013-06-14 12:13:47', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('95', 'XFTD', 'suifeng_XFTD_20130614_121347', 'admin', '0', '0', '2013-06-14 12:16:17', '2013-06-14 12:13:47', '2013-06-14 12:16:18', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('96', 'XFTD', 'xinlang_XFTD_20130614_121618', 'admin', '0', '0', '2013-06-17 09:12:03', '2013-06-14 12:16:18', '2013-06-17 09:12:03', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('97', 'XFTD', 'l_XFTD_20130617_091203', 'admin', '0', '0', '2013-06-17 09:14:34', '2013-06-17 09:12:03', '2013-06-17 09:14:31', '1', null, '保留');
INSERT INTO t_s_eventtablemanager VALUES ('98', 'XFTD', 'l_XFTD_20130617_091431', 'admin', null, '1', '2013-06-17 09:14:31', '2013-06-17 09:14:31', '', '1', null, '保留');

-- ----------------------------
-- Table structure for `t_s_eventtabletitle`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_eventtabletitle`;
CREATE TABLE `t_s_eventtabletitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventTypeCode` varchar(255) DEFAULT NULL COMMENT '事件类型代码',
  `titleCode` varchar(255) DEFAULT NULL COMMENT '事件表字段',
  `prop` varchar(512) DEFAULT NULL COMMENT '事件表字段的其他属性',
  `chinaeseName` varchar(255) DEFAULT NULL COMMENT 'titltCode的汉语表示',
  `englishName` varchar(255) DEFAULT NULL COMMENT 'titleCode的英文表示',
  `webShow` int(11) DEFAULT '1' COMMENT '是否在web显示>0:不显示，1：显示，2：作为查询条件，3:作为查询条件，且为时间类型的,4:作为查询条件，比较类型（如速度），5:当titleCode为CLLSID时，9：要显示在页面的图片的路径',
  `block` int(2) DEFAULT '1' COMMENT '锁定字段',
  `status` int(2) DEFAULT '1',
  `ctTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ignoreTitle` int(2) DEFAULT '0' COMMENT 'insert 忽略字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_eventtabletitle
-- ----------------------------
INSERT INTO t_s_eventtabletitle VALUES ('1', 'XFTD', 'id', 'bigint(8) NOT NULL AUTO_INCREMENT COMMENT \'主键\'  PRIMARY KEY', '序号', 'ID', '1', '1', '1', '2013-06-14 09:52:02', '1');
INSERT INTO t_s_eventtabletitle VALUES ('2', 'XFTD', 'CLSSID', 'int(20)  DEFAULT NULL COMMENT \'摄像头CLSSID\'', '摄像头CLSSID', 'Camera CLSSID', '5', '1', '1', '2013-06-14 09:52:06', '0');
INSERT INTO t_s_eventtabletitle VALUES ('4', 'XFTD', 'warnLevel', 'int(10) DEFAULT NULL COMMENT \'告警级别\'', '告警级别', 'warn level', '2', '1', '1', '2013-06-14 09:52:48', '0');
INSERT INTO t_s_eventtabletitle VALUES ('5', 'XFTD', 'eventDesp', 'varchar(255) DEFAULT NULL COMMENT \'描述\'', '描述', 'Desp', '1', '1', '1', '2013-06-14 09:52:56', '0');
INSERT INTO t_s_eventtabletitle VALUES ('6', 'XFTD', 'violations', 'varchar(64) DEFAULT NULL COMMENT \'消防通道违规类型:阻塞/浓烟\'', '消防通道违规类型', 'Violations', '2', '1', '1', '2013-06-14 09:52:58', '0');
INSERT INTO t_s_eventtabletitle VALUES ('7', 'XFTD', 'absTime', 'timestamp  NULL DEFAULT NULL COMMENT    \' 绝对时间   \' ', '发生时间', 'absolute time', '3', '1', '1', '2013-06-14 09:53:00', '0');
INSERT INTO t_s_eventtabletitle VALUES ('8', 'XFTD', 'alarmPic', 'varchar(255) DEFAULT NULL COMMENT \'截图\'', '截图 ', 'shotpic', '9', '1', '1', '2013-06-14 09:53:02', '0');
INSERT INTO t_s_eventtabletitle VALUES ('9', 'XFTD', 'startTime', 'timestamp  NULL DEFAULT NULL COMMENT \'开始告警时间\'', '开始告警时间', 'start time', '3', '1', '1', '2013-06-14 09:53:04', '0');
INSERT INTO t_s_eventtabletitle VALUES ('10', 'XFTD', 'ctTime', 'timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT \'检测时间\'', '检测时间', 'Time', '1', '1', '1', '2013-06-14 09:53:07', '0');
INSERT INTO t_s_eventtabletitle VALUES ('11', 'XFTD', 'status', 'int(10) DEFAULT NULL COMMENT \'status\'', '状态', 'status', '0', '1', '1', '2013-06-14 09:53:14', '0');
INSERT INTO t_s_eventtabletitle VALUES ('31', 'KK', 'id', 'bigint(8) NOT NULL AUTO_INCREMENT COMMENT \'主键\' PRIMARY KEY', '序号', 'ID', '1', '1', '1', '2013-06-14 09:40:45', '1');
INSERT INTO t_s_eventtabletitle VALUES ('32', 'KK', 'CLSSID', 'int(20)  DEFAULT NULL COMMENT \'摄像头CLSSID\'', '摄像头CLSSID', 'Camera CLSSID', '5', '1', '1', '2013-06-14 09:40:49', '0');
INSERT INTO t_s_eventtabletitle VALUES ('33', 'KK', 'LPNumber', 'varchar(20)  DEFAULT NULL COMMENT \'车牌\'', '车牌', 'LPNumber', '2', '1', '1', '2013-06-14 09:40:54', '0');
INSERT INTO t_s_eventtabletitle VALUES ('34', 'KK', 'speed', 'int(10) DEFAULT NULL COMMENT \'速度\'', '速度', 'Speed', '4', '1', '1', '2013-06-14 09:40:56', '0');
INSERT INTO t_s_eventtabletitle VALUES ('35', 'KK', 'modelCode', 'varchar(20) DEFAULT NULL COMMENT \'车型代码\'', '车型代码', 'Car Model', '1', '1', '1', '2013-06-14 09:41:00', '0');
INSERT INTO t_s_eventtabletitle VALUES ('36', 'KK', 'logoCode', 'varchar(20) DEFAULT NULL COMMENT \'车标代码\'', '车标代码', 'Logo', '1', '1', '1', '2013-06-14 09:41:05', '0');
INSERT INTO t_s_eventtabletitle VALUES ('37', 'KK', 'carColor', 'varchar(20) DEFAULT NULL COMMENT \'车颜色\'', '车颜色', 'car color', '1', '1', '1', '2013-06-14 09:41:23', '0');
INSERT INTO t_s_eventtabletitle VALUES ('38', 'KK', 'LPNColor', 'varchar(20) DEFAULT NULL COMMENT \'车牌颜色\'', '车牌颜色', 'LPN color', '1', '1', '1', '2013-06-14 09:41:26', '0');
INSERT INTO t_s_eventtabletitle VALUES ('39', 'KK', 'lane', 'varchar(64) DEFAULT NULL COMMENT \'车道\'', '车道', 'Lane', '1', '1', '1', '2013-06-14 09:41:49', '0');
INSERT INTO t_s_eventtabletitle VALUES ('40', 'KK', 'absTime', 'timestamp  NULL DEFAULT NULL COMMENT    \' 绝对时间   \' ', '发生时间', 'absolute time', '3', '1', '1', '2013-06-14 09:42:02', '0');
INSERT INTO t_s_eventtabletitle VALUES ('41', 'KK', 'shortImageA', 'varchar(255) DEFAULT NULL COMMENT \'截图A\'', '截图A', 'Screen Image', '9', '1', '1', '2013-06-14 09:42:04', '0');
INSERT INTO t_s_eventtabletitle VALUES ('42', 'KK', 'LPNimage', 'varchar(255) DEFAULT NULL COMMENT \'车牌图片\'', '车牌图片', 'LPN Image', '1', '1', '1', '2013-06-14 09:42:08', '0');
INSERT INTO t_s_eventtabletitle VALUES ('43', 'KK', 'shortImageB', 'varchar(255) DEFAULT NULL COMMENT \'截图B\'', '截图B', 'Screen Image', '1', '1', '1', '2013-06-14 09:42:16', '0');
INSERT INTO t_s_eventtabletitle VALUES ('44', 'KK', 'shortImageC', 'varchar(255) DEFAULT NULL COMMENT \'截图C\'', '截图C', 'Screen Image', '1', '1', '1', '2013-06-14 09:42:19', '0');
INSERT INTO t_s_eventtabletitle VALUES ('45', 'KK', 'ctTime', 'timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT \'检测时间\'', '检测时间', 'create time', '1', '1', '1', '2013-06-14 09:42:23', '1');
INSERT INTO t_s_eventtabletitle VALUES ('46', 'KK', 'status', 'int(10) DEFAULT NULL COMMENT \'status\'', '状态', 'status', '0', '1', '1', '2013-06-14 09:42:31', '0');
INSERT INTO t_s_eventtabletitle VALUES ('57', 'DZJC', 'id', 'bigint(8) NOT NULL AUTO_INCREMENT COMMENT \'主键\' PRIMARY KEY', '序号', 'ID', '1', '1', '1', '2013-06-14 09:43:59', '1');
INSERT INTO t_s_eventtabletitle VALUES ('58', 'DZJC', 'CLSSID', 'int(20)  DEFAULT NULL COMMENT \'摄像头CLSSID\'', '摄像头CLSSID', 'Camera CLSSID', '5', '1', '1', '2013-06-14 09:44:02', '0');
INSERT INTO t_s_eventtabletitle VALUES ('59', 'DZJC', 'LPNumber', 'varchar(20)  DEFAULT NULL COMMENT \'车牌\'', '车牌', 'LPNumber', '2', '1', '1', '2013-06-14 09:44:30', '0');
INSERT INTO t_s_eventtabletitle VALUES ('60', 'DZJC', 'speed', 'int(10) DEFAULT NULL COMMENT \'速度\'', '速度', 'Speed', '4', '1', '1', '2013-06-14 09:44:41', '0');
INSERT INTO t_s_eventtabletitle VALUES ('61', 'DZJC', 'modelCode', 'varchar(20) DEFAULT NULL COMMENT \'车型代码\'', '车型代码', 'Car Model', '2', '1', '1', '2013-06-14 09:44:52', '0');
INSERT INTO t_s_eventtabletitle VALUES ('62', 'DZJC', 'logoCode', 'varchar(20) DEFAULT NULL COMMENT \'车标代码\'', '车标代码', 'Logo', '2', '1', '1', '2013-06-14 09:44:56', '0');
INSERT INTO t_s_eventtabletitle VALUES ('63', 'DZJC', 'violations', 'varchar(64) DEFAULT NULL COMMENT \'交通违规类型:闯红灯/逆行/压线/变道\'', '交通违规类型', 'Violations', '2', '1', '1', '2013-06-14 09:45:12', '0');
INSERT INTO t_s_eventtabletitle VALUES ('64', 'DZJC', 'lane', 'varchar(64) DEFAULT NULL COMMENT \'车道\'', '车道', 'Lane', '2', '1', '1', '2013-06-14 09:45:18', '0');
INSERT INTO t_s_eventtabletitle VALUES ('65', 'DZJC', 'absTime', 'timestamp  NULL DEFAULT NULL  COMMENT    \' 绝对时间   \' ', '发生时间', 'absolute time', '3', '1', '1', '2013-06-14 09:45:23', '0');
INSERT INTO t_s_eventtabletitle VALUES ('66', 'DZJC', 'carColor', 'varchar(20) DEFAULT NULL COMMENT \'车颜色\'', '车颜色', 'car color', '2', '1', '1', '2013-06-14 09:45:32', '0');
INSERT INTO t_s_eventtabletitle VALUES ('67', 'DZJC', 'LPNColor', 'varchar(20) DEFAULT NULL COMMENT \'车牌颜色\'', '车牌颜色', 'LPN color', '2', '1', '1', '2013-06-14 09:45:35', '0');
INSERT INTO t_s_eventtabletitle VALUES ('68', 'DZJC', 'shortImageA', 'varchar(255) DEFAULT NULL COMMENT \'截图A\'', '截图A', 'Screen Image', '9', '1', '1', '2013-06-14 09:45:43', '0');
INSERT INTO t_s_eventtabletitle VALUES ('69', 'DZJC', 'LPNimage', 'varchar(255) DEFAULT NULL COMMENT \'车牌图片\'', '车牌图片', 'LPN Image', '9', '1', '1', '2013-06-14 09:45:46', '0');
INSERT INTO t_s_eventtabletitle VALUES ('70', 'DZJC', 'shortImageB', 'varchar(255) DEFAULT NULL COMMENT \'截图B\'', '截图B', 'Screen Image', '9', '1', '1', '2013-06-14 09:45:51', '0');
INSERT INTO t_s_eventtabletitle VALUES ('71', 'DZJC', 'shortImageC', 'varchar(255) DEFAULT NULL COMMENT \'截图C\'', '截图C', 'Screen Image', '9', '1', '1', '2013-06-14 09:45:55', '0');
INSERT INTO t_s_eventtabletitle VALUES ('72', 'DZJC', 'ctTime', 'timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT   \' 检测时间  \' ', '检测时间', 'create time', '1', '1', '1', '2013-06-14 09:46:02', '1');
INSERT INTO t_s_eventtabletitle VALUES ('73', 'DZJC', 'status', 'int(10) DEFAULT NULL COMMENT \'status\'', '状态', 'status', '0', '1', '1', '2013-06-14 09:46:05', '0');
INSERT INTO t_s_eventtabletitle VALUES ('74', 'DZJC', 'exportFlag', 'int(10)  NOT NULL  DEFAULT 0 COMMENT \'导库标记\'', '导库标记', 'Export Flag', '1', '1', '1', '2013-06-14 09:46:11', '0');

-- ----------------------------
-- Table structure for `t_s_eventtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_eventtype`;
CREATE TABLE `t_s_eventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_code` varchar(255) DEFAULT NULL COMMENT '事件代码',
  `event_value` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL COMMENT '事件名称,一般写汉语',
  `masrows` bigint(20) DEFAULT '10000000',
  `status` int(11) DEFAULT '1',
  `desp` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_eventtype
-- ----------------------------
INSERT INTO t_s_eventtype VALUES ('1', 'KK', '12', '卡口', '10000000', '1', '卡口数据表', '2013-04-10 13:31:44');
INSERT INTO t_s_eventtype VALUES ('2', 'CHD', '13', '闯红灯', '10000000', '1', '闯红灯数据表', '2013-04-10 13:31:53');
INSERT INTO t_s_eventtype VALUES ('3', 'NX', '12', '逆行', '10000000', '1', '逆行数据表', '2013-04-10 13:31:51');
INSERT INTO t_s_eventtype VALUES ('4', 'XFTD', '13', '消防通道', '10000000', '1', '消防通道数据表', '2013-04-10 13:32:06');
INSERT INTO t_s_eventtype VALUES ('5', 'WZTC', '12', '违章停车', '10000000', '1', '违章停车数据表', '2013-04-10 13:32:16');
INSERT INTO t_s_eventtype VALUES ('7', 'DZJC', 'DZJC', '电子警察', '10000000', '1', '电子警察数据表', '2013-04-25 17:17:50');

-- ----------------------------
-- Table structure for `t_s_eventtypeprop`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_eventtypeprop`;
CREATE TABLE `t_s_eventtypeprop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventProp_code` int(11) NOT NULL COMMENT '事件属性代码',
  `event_code` varchar(255) NOT NULL COMMENT '事件代码',
  `prop_code` varchar(255) NOT NULL COMMENT '属性代码',
  `prop_name` varchar(255) NOT NULL COMMENT '属性名称',
  `desp` varchar(255) NOT NULL,
  `webShow` int(11) NOT NULL COMMENT '是否在web显示',
  `status` int(11) NOT NULL DEFAULT '1',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_eventtypeprop
-- ----------------------------
INSERT INTO t_s_eventtypeprop VALUES ('1', '3561', 'KK', 'speed', '车速', '', '1', '1', '2013-04-10 12:14:53');
INSERT INTO t_s_eventtypeprop VALUES ('2', '3562', 'KK', 'LPNumber', '车牌号', ' ', '1', '1', '2013-04-10 12:14:55');
INSERT INTO t_s_eventtypeprop VALUES ('3', '3563', 'KK', 'LPColor', '车牌颜色', ' ', '1', '1', '2013-04-10 12:14:56');
INSERT INTO t_s_eventtypeprop VALUES ('4', '3564', 'KK', 'LPImage', '车牌图片路径', ' ', '1', '1', '2013-04-10 12:34:20');
INSERT INTO t_s_eventtypeprop VALUES ('5', '3565', 'KK', 'warn_level', '警告级别', ' ', '1', '1', '2013-04-10 12:35:41');
INSERT INTO t_s_eventtypeprop VALUES ('6', '3566', ' KK', 'color', '车身颜色', ' ', '1', '1', '2013-04-10 12:35:49');
INSERT INTO t_s_eventtypeprop VALUES ('7', '3567', ' KK', 'logo', '车标', ' ', '1', '1', '2013-04-10 12:35:56');
INSERT INTO t_s_eventtypeprop VALUES ('8', '3568', 'KK', 'type', '车型', '1', '1', '1', '2013-04-19 17:31:35');
INSERT INTO t_s_eventtypeprop VALUES ('9', '11', 'XFTD', 'warnlevel', '告警级别', ' ', '1', '1', '2013-04-10 12:36:05');
INSERT INTO t_s_eventtypeprop VALUES ('10', '12', 'XFTD', 'warnType', '告警类别', '  ', '1', '1', '2013-04-10 12:36:07');
INSERT INTO t_s_eventtypeprop VALUES ('11', '13', 'XFTD', 'serioutsLevel', '严重级别', ' ', '1', '1', '2013-04-10 12:36:08');

-- ----------------------------
-- Table structure for `t_s_filetype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_filetype`;
CREATE TABLE `t_s_filetype` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `fileTypeName` char(255) DEFAULT NULL,
  `fileType` char(255) NOT NULL DEFAULT '',
  `cttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`fileType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_filetype
-- ----------------------------
INSERT INTO t_s_filetype VALUES ('1', 'Logo', 'logo', '2013-03-28 17:28:09', '1');
INSERT INTO t_s_filetype VALUES ('2', '压缩文件', 'zip', '2013-03-28 17:28:09', '1');
INSERT INTO t_s_filetype VALUES ('4', 'word 文档', 'doc', '2013-03-28 17:28:09', '1');

-- ----------------------------
-- Table structure for `t_s_fireviolation`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_fireviolation`;
CREATE TABLE `t_s_fireviolation` (
  `id` int(20) NOT NULL,
  `violationCode` varchar(255) DEFAULT NULL COMMENT '消防违规code',
  `violationValue` varchar(255) DEFAULT NULL,
  `violationName` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_fireviolation
-- ----------------------------
INSERT INTO t_s_fireviolation VALUES ('1', 'NY', null, '浓烟', '1', null);
INSERT INTO t_s_fireviolation VALUES ('2', 'ZS', null, '阻塞', '1', null);

-- ----------------------------
-- Table structure for `t_s_ggfj`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ggfj`;
CREATE TABLE `t_s_ggfj` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) DEFAULT NULL COMMENT '附件名字',
  `path` varchar(500) DEFAULT NULL COMMENT '附件路径(相对路径)',
  `sc_rq` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传日期',
  `person` varchar(50) DEFAULT NULL COMMENT '上传人code',
  `ctTime` timestamp NULL DEFAULT NULL,
  `status` int(10) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_ggfj
-- ----------------------------
INSERT INTO t_s_ggfj VALUES ('1', '修复地图俯瞰点播Player过期.zip', 'upload/public/public_201210131747154.zip', '2013-05-03 14:04:25', 'admin', null, '1');
INSERT INTO t_s_ggfj VALUES ('2', '信帧智能监控WEB系统使用手册', 'upload/public/ggfj_20130425142955.pdf', '2013-04-25 14:30:17', 'admin', null, '1');

-- ----------------------------
-- Table structure for `t_s_illegaldataentry`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_illegaldataentry`;
CREATE TABLE `t_s_illegaldataentry` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` varchar(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `violations` varchar(64) DEFAULT NULL COMMENT '交通违规类型:闯红灯/逆行/压线/变道',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=gbk COMMENT='违法数据录入前数据';

-- ----------------------------
-- Records of t_s_illegaldataentry
-- ----------------------------
INSERT INTO t_s_illegaldataentry VALUES ('631', '3', '', '1', 'chd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_16_59_068_23456.jpg', '/pic/HK143/2013_06_19_11_17_01_575_23456combo.jpg', '/pic/HK143/2013_06_19_11_17_00_298_23456b.jpg', '/pic/HK143/2013_06_19_11_17_01_575_23456c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:39', '1');
INSERT INTO t_s_illegaldataentry VALUES ('632', '3', '', '1', 'bd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_11_680_67808.jpg', '/pic/HK143/2013_06_19_11_17_13_422_67808combo.jpg', '/pic/HK143/2013_06_19_11_17_13_324_67808b.jpg', '/pic/HK143/2013_06_19_11_17_13_422_67808c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:55', '1');
INSERT INTO t_s_illegaldataentry VALUES ('633', '3', '', '3', 'chd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_00_928_23514.jpg', '/pic/HK143/2013_06_19_11_17_03_940_23514combo.jpg', '/pic/HK143/2013_06_19_11_17_02_942_23514b.jpg', '/pic/HK143/2013_06_19_11_17_03_940_23514c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:42', '1');
INSERT INTO t_s_illegaldataentry VALUES ('634', '3', '', '1', 'bd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_15_045_67916.jpg', '/pic/HK143/2013_06_19_11_17_17_785_67916combo.jpg', '/pic/HK143/2013_06_19_11_17_17_710_67916b.jpg', '/pic/HK143/2013_06_19_11_17_17_785_67916c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:02', '1');
INSERT INTO t_s_illegaldataentry VALUES ('635', '3', '', '2', 'chd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_13_242_67938.jpg', '/pic/HK143/2013_06_19_11_17_19_512_67938combo.jpg', '/pic/HK143/2013_06_19_11_17_17_600_67938b.jpg', '/pic/HK143/2013_06_19_11_17_19_512_67938c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:04', '1');
INSERT INTO t_s_illegaldataentry VALUES ('636', '3', '', '1', 'bd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_19_091_67972.jpg', '/pic/HK143/2013_06_19_11_17_20_052_67972combo.jpg', '/pic/HK143/2013_06_19_11_17_19_856_67972b.jpg', '/pic/HK143/2013_06_19_11_17_20_052_67972c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:07', '1');
INSERT INTO t_s_illegaldataentry VALUES ('637', '3', '', '3', 'chd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_24_332_68122.jpg', '/pic/HK143/2013_06_19_11_17_26_356_68122combo.jpg', '/pic/HK143/2013_06_19_11_17_25_444_68122b.jpg', '/pic/HK143/2013_06_19_11_17_26_356_68122c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:11', '1');
INSERT INTO t_s_illegaldataentry VALUES ('638', '3', '', '1', 'chd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_17_30_953_68308.jpg', '/pic/HK143/2013_06_19_11_17_32_458_68308combo.jpg', '/pic/HK143/2013_06_19_11_17_31_830_68308b.jpg', '/pic/HK143/2013_06_19_11_17_32_458_68308c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:17', '1');
INSERT INTO t_s_illegaldataentry VALUES ('639', '3', '', '1', 'bd', '0', '', '', '', '', '/pic/HK143/2013_06_19_11_18_09_093_69440.jpg', '/pic/HK143/2013_06_19_11_18_10_294_69440combo.jpg', '/pic/HK143/2013_06_19_11_18_10_155_69440b.jpg', '/pic/HK143/2013_06_19_11_18_10_294_69440c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:23', '1');

-- ----------------------------
-- Table structure for `t_s_illegalevent`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_illegalevent`;
CREATE TABLE `t_s_illegalevent` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` varchar(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `violations` varchar(64) DEFAULT NULL COMMENT '交通违规类型:闯红灯/逆行/压线/变道',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  `audit` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `auditer` varchar(255) DEFAULT NULL COMMENT '审核人',
  `audittime` varchar(255) DEFAULT NULL COMMENT '审核时间',
  `reviewer` varchar(255) DEFAULT NULL COMMENT '复审人',
  `reviewtime` varchar(255) DEFAULT NULL COMMENT '复审时间',
  `finaler` varchar(255) DEFAULT NULL COMMENT '终审人',
  `finaltime` varchar(255) DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1824 DEFAULT CHARSET=gbk COMMENT='交通违法事件';

-- ----------------------------
-- Records of t_s_illegalevent
-- ----------------------------

INSERT INTO t_s_illegalevent VALUES ('1814', '3', '津P78206', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_50_243_23242.jpg', '/pic/HK143/2013_06_19_11_16_52_842_23242combo.jpg', '/pic/HK143/2013_06_19_11_16_51_774_23242b.jpg', '/pic/HK143/2013_06_19_11_16_52_842_23242c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:22', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1815', '3', '京PA1683', '3', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_04_568_67644.jpg', '/pic/HK143/2013_06_19_11_17_08_479_67644combo.jpg', '/pic/HK143/2013_06_19_11_17_06_897_67644b.jpg', '/pic/HK143/2013_06_19_11_17_08_479_67644c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:40', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1816', '3', '京BM4193', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_06_446_67662.jpg', '/pic/HK143/2013_06_19_11_17_09_662_67662combo.jpg', '/pic/HK143/2013_06_19_11_17_07_777_67662b.jpg', '/pic/HK143/2013_06_19_11_17_09_662_67662c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:43', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1817', '3', '京BM4193', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_53_309_23316.jpg', '/pic/HK143/2013_06_19_11_16_56_369_23316combo.jpg', '/pic/HK143/2013_06_19_11_16_54_664_23316b.jpg', '/pic/HK143/2013_06_19_11_16_56_369_23316c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:30', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1818', '3', '津PA1683', '3', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_16_51_608_23318.jpg', '/pic/HK143/2013_06_19_11_16_55_272_23318combo.jpg', '/pic/HK143/2013_06_19_11_16_53_806_23318b.jpg', '/pic/HK143/2013_06_19_11_16_55_272_23318c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:31', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1819', '3', '浙A1E925', '3', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_07_321_67682.jpg', '/pic/HK143/2013_06_19_11_17_10_895_67682combo.jpg', '/pic/HK143/2013_06_19_11_17_09_399_67682b.jpg', '/pic/HK143/2013_06_19_11_17_10_895_67682c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:46', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1820', '3', '津G7AA31', '1', 'bd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_09_405_67758.jpg', '/pic/HK143/2013_06_19_11_17_10_823_67758combo.jpg', '/pic/HK143/2013_06_19_11_17_10_715_67758b.jpg', '/pic/HK143/2013_06_19_11_17_10_823_67758c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:17:52', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1821', '3', '赣BQ790C', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_17_866_67970.jpg', '/pic/HK143/2013_06_19_11_17_21_386_67970combo.jpg', '/pic/HK143/2013_06_19_11_17_19_583_67970b.jpg', '/pic/HK143/2013_06_19_11_17_21_386_67970c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:06', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1822', '3', '豫BQ2811', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_22_183_68054.jpg', '/pic/HK143/2013_06_19_11_17_23_531_68054combo.jpg', '/pic/HK143/2013_06_19_11_17_22_564_68054b.jpg', '/pic/HK143/2013_06_19_11_17_23_531_68054c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:09', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);
INSERT INTO t_s_illegalevent VALUES ('1823', '3', '苏BL173警', '2', 'chd', '0', '', '', '', '', '1', '/pic/HK143/2013_06_19_11_17_29_691_68286.jpg', '/pic/HK143/2013_06_19_11_17_31_763_68286combo.jpg', '/pic/HK143/2013_06_19_11_17_30_559_68286b.jpg', '/pic/HK143/2013_06_19_11_17_31_763_68286c.jpg', '2013-07-01 16:18:08', '2013-06-19 11:18:16', '未审核', 'system', '2013-07-01 16:18:08', null, null, null, null);

-- ----------------------------
-- Table structure for `t_s_illegal_act`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_illegal_act`;
CREATE TABLE `t_s_illegal_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '违法代码',
  `code` varchar(255) DEFAULT NULL,
  `act` varchar(255) DEFAULT NULL COMMENT '违法内容',
  `money` varchar(255) DEFAULT NULL COMMENT '罚款金额',
  `points` int(11) DEFAULT NULL COMMENT '扣分',
  `provision` varchar(255) DEFAULT NULL COMMENT '法律条文',
  `overdue` varchar(255) DEFAULT NULL COMMENT '滞纳金',
  `status` int(11) DEFAULT '1',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_illegal_act
-- ----------------------------
INSERT INTO t_s_illegal_act VALUES ('1', '0001', '机动车辆不在机动车道内行驶', '200', '2', null, '50', '1', '2013-05-20 15:17:37');
INSERT INTO t_s_illegal_act VALUES ('2', '0002', '机动车逆向行驶', '300', '3', null, '70', '1', '2013-05-20 15:20:15');
INSERT INTO t_s_illegal_act VALUES ('3', '0003', '机动车行驶超过规定时速的50%以下的', '500', '3', null, '60', '1', '2013-05-20 15:21:14');
INSERT INTO t_s_illegal_act VALUES ('4', '0004', '机动车违反规定停放', '200', '3', '', '40', '1', '2013-05-20 17:06:51');

-- ----------------------------
-- Table structure for `t_s_illegal_blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_illegal_blacklist`;
CREATE TABLE `t_s_illegal_blacklist` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` varchar(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `violations` varchar(64) DEFAULT NULL COMMENT '交通违规类型:闯红灯/逆行/压线/变道',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `status` int(10) DEFAULT '1' COMMENT 'status',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COMMENT='黑名单通行记录';

-- ----------------------------
-- Records of t_s_illegal_blacklist
-- ----------------------------
INSERT INTO t_s_illegal_blacklist VALUES ('1', '27', '京A159167', '2', 'CHD', '40', '', '', '', '', '1', '1', 'DH219/2013_05_30_10_12_28_0.jpg', '1', '1', '2013-06-19 09:32:07', '2013-05-06 16:36:19');
INSERT INTO t_s_illegal_blacklist VALUES ('2', '24', '京X159753', '1', 'BD', '50', '', '', '', '', '1', '1', 'DH219/2013_05_30_10_12_30_0.jpg', '1', '1', '2013-06-19 09:32:08', '2013-04-25 16:37:19');
INSERT INTO t_s_illegal_blacklist VALUES ('3', '26', '京A456789', '2', 'NX', '30', '', '', '', '', '1', '1', 'DH219/2013_05_30_10_12_35_0.jpg', '1', '1', '2013-06-19 09:32:09', '2013-05-18 16:54:42');
INSERT INTO t_s_illegal_blacklist VALUES ('4', '25', '津A16196', '2', 'NX', '30', '', '', '', '', '1', '1', null, null, null, '2013-06-19 09:32:51', '2013-05-18 16:54:00');

-- ----------------------------
-- Table structure for `t_s_infotime`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_infotime`;
CREATE TABLE `t_s_infotime` (
  `id` int(25) NOT NULL DEFAULT '0',
  `backUpSTime` varchar(255) DEFAULT '',
  `backUpETime` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_infotime
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_jcbktype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_jcbktype`;
CREATE TABLE `t_s_jcbktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '黑名单类别名称',
  `level` varchar(255) DEFAULT '' COMMENT '警告级别',
  `status` int(11) NOT NULL DEFAULT '1',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_jcbktype
-- ----------------------------
INSERT INTO t_s_jcbktype VALUES ('1', '报废车辆', '一级警告', '1', '报废');
INSERT INTO t_s_jcbktype VALUES ('2', '套牌车辆', '二级警告', '0', '套牌');
INSERT INTO t_s_jcbktype VALUES ('3', '假牌车辆', '三级警告', '1', '假牌');
INSERT INTO t_s_jcbktype VALUES ('4', '报失车辆', '四级警告', '0', '报失');
INSERT INTO t_s_jcbktype VALUES ('5', '肇事逃逸车辆', '二级警告', '1', '肇事逃逸');
INSERT INTO t_s_jcbktype VALUES ('6', '违法未处理', '三级警告', '1', '违法');

-- ----------------------------
-- Table structure for `t_s_location`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_location`;
CREATE TABLE `t_s_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地域编号',
  `locationId` varchar(255) DEFAULT NULL,
  `locationName` varchar(255) DEFAULT NULL COMMENT '地域名称',
  `adminAreaCode` varchar(255) DEFAULT NULL COMMENT '行政区域代码QHDM',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latiTude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `mapScaling` int(11) DEFAULT NULL COMMENT '地图缩放比例',
  `parentLocationId` varchar(255) DEFAULT NULL COMMENT '上级',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_location
-- ----------------------------
INSERT INTO t_s_location VALUES ('16', 'dl', '中国', null, '23.45', '56.78', '9', 'dl', '2013-04-26 16:49:28', '1');
INSERT INTO t_s_location VALUES ('32', 'dl01', '北京', null, '116.452293', '39.907031', '11', 'dl', '2013-04-26 17:05:50', '1');
INSERT INTO t_s_location VALUES ('33', 'dl0101', '海淀', null, '116.305115', '39.963683', '12', 'dl01', '2013-04-26 17:08:15', '1');
INSERT INTO t_s_location VALUES ('34', 'dl0102', '朝阳', null, '116.459192', '39.92651', '11', 'dl01', '2013-04-26 17:23:44', '1');
INSERT INTO t_s_location VALUES ('35', 'dl0103', '昌平', null, '116.229226', '40.224201', '11', 'dl01', '2013-04-26 17:24:33', '1');
INSERT INTO t_s_location VALUES ('36', 'dl02', '上海', null, '121.556393', '31.163478', '7', 'dl', '2013-04-26 17:41:02', '1');
INSERT INTO t_s_location VALUES ('37', 'dl0201', '浦东', null, '121.544895', '31.219824', '11', 'dl02', '2013-04-26 17:41:57', '1');
INSERT INTO t_s_location VALUES ('38', 'dl0104', '西城', null, '116.377554', '39.905259', '11', 'dl01', '2013-04-26 17:43:33', '1');
INSERT INTO t_s_location VALUES ('39', 'dl0105', '东城', null, '116.424697', '39.932264', '12', 'dl01', '2013-04-26 18:04:04', '1');
INSERT INTO t_s_location VALUES ('40', 'dl0106', '通州', null, '116.658113', '39.911458', '11', 'dl01', '2013-04-26 18:05:10', '1');
INSERT INTO t_s_location VALUES ('41', 'dl010101', '上地', null, '116.326889', '40.038464', '15', 'dl0101', '2013-04-28 19:00:08', '1');
INSERT INTO t_s_location VALUES ('42', 'dl01010101', '信息路', null, '116.31902', '40.037166', '16', 'dl010101', '2013-04-28 19:00:32', '1');
INSERT INTO t_s_location VALUES ('43', 'dl01010102', '上地南路', null, '116.323548', '40.035647', '17', 'dl010101', '2013-05-08 13:30:19', '1');
INSERT INTO t_s_location VALUES ('44', 'dl0101010101', '信息路甲A', null, '116.31748', '40.042289', '19', 'dl01010101', '2013-05-08 13:30:13', '1');
INSERT INTO t_s_location VALUES ('45', 'dl0101010102', '信息路甲B', null, '116.317116', '40.042065', '19', 'dl01010101', '2013-05-08 11:03:33', '1');
INSERT INTO t_s_location VALUES ('46', 'dl0202', '杨浦区', null, '121.525348', '31.262308', '11', 'dl02', '2013-05-08 13:37:30', '1');
INSERT INTO t_s_location VALUES ('47', 'dl0203', '宝山区', null, '121.485103', '31.404438', '10', 'dl02', '2013-05-08 13:38:07', '1');

-- ----------------------------
-- Table structure for `t_s_locationmanager`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_locationmanager`;
CREATE TABLE `t_s_locationmanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locationId` varchar(255) NOT NULL,
  `parentLocationId` varchar(255) NOT NULL COMMENT '上一级',
  `status` int(11) NOT NULL DEFAULT '1',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_locationmanager
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_nvr`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_nvr`;
CREATE TABLE `t_s_nvr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nvr_code` varchar(255) DEFAULT NULL COMMENT 'nvr代码',
  `nvr_name` varchar(255) DEFAULT NULL COMMENT 'nvr名字',
  `nvr_ip` varchar(255) DEFAULT NULL COMMENT 'nvr的ip',
  `port` int(11) DEFAULT NULL COMMENT '端口号',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `mapScaling` int(11) DEFAULT '11',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(255) DEFAULT NULL COMMENT '密码',
  `status` int(11) DEFAULT '1',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_nvr
-- ----------------------------
INSERT INTO t_s_nvr VALUES ('1', '', null, null, null, null, null, '11', null, null, '1', '2013-05-07 15:42:12');
INSERT INTO t_s_nvr VALUES ('28', 'nvr1', 'DH_NVR.210', '10.168.1.210', '37777', '116.317852', '40.041346', '19', 'admin', 'admin', '1', '2013-04-18 10:53:49');
INSERT INTO t_s_nvr VALUES ('29', 'nvr3', 'DH_NVR.220', '10.168.1.220', '37777', '116.54083', '39.917656', '11', 'admin', 'admin', '1', '2013-05-14 06:27:00');
INSERT INTO t_s_nvr VALUES ('30', 'nvr4', 'DH_NVR.221', '10.168.1.221', '37777', '116.544279', '39.891089', '11', 'admin', 'admin', '1', '2013-05-14 06:30:00');
INSERT INTO t_s_nvr VALUES ('31', 'nvr5', 'DH_NVR.222', '10.168.1.222', '37777', '116.378704', '40.024708', '11', 'admin', 'admin', '1', '2013-05-14 06:32:00');
INSERT INTO t_s_nvr VALUES ('32', 'nvr6', 'DH_NVR.223', '10.168.1.223', '37777', '116.458042', '39.970761', '11', 'admin', 'admin', '1', '2013-05-14 14:33:00');

-- ----------------------------
-- Table structure for `t_s_nvr_camera_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_nvr_camera_manager`;
CREATE TABLE `t_s_nvr_camera_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nvr_code` varchar(255) NOT NULL COMMENT 'nvr代码',
  `clssId` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `ctTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_nvr_camera_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_platetype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_platetype`;
CREATE TABLE `t_s_platetype` (
  `id` int(11) NOT NULL,
  `licenceplate` varchar(255) NOT NULL COMMENT '车牌标识字',
  `type` varchar(255) NOT NULL COMMENT '车牌类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_platetype
-- ----------------------------
INSERT INTO t_s_platetype VALUES ('1', 'V', '军车');
INSERT INTO t_s_platetype VALUES ('2', 'K', '军车');
INSERT INTO t_s_platetype VALUES ('3', 'H', '军车');
INSERT INTO t_s_platetype VALUES ('4', 'B', '军车');
INSERT INTO t_s_platetype VALUES ('5', 'S', '军车');
INSERT INTO t_s_platetype VALUES ('6', 'L', '军车');
INSERT INTO t_s_platetype VALUES ('7', 'J', '军车');
INSERT INTO t_s_platetype VALUES ('8', 'N', '军车');
INSERT INTO t_s_platetype VALUES ('9', 'G', '军车');
INSERT INTO t_s_platetype VALUES ('10', 'C', '军车');
INSERT INTO t_s_platetype VALUES ('11', '警', '警车');
INSERT INTO t_s_platetype VALUES ('12', 'others', '政府车');

-- ----------------------------
-- Table structure for `t_s_producer`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_producer`;
CREATE TABLE `t_s_producer` (
  `id` int(20) NOT NULL,
  `producer` char(250) DEFAULT NULL,
  `producerName` char(250) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_producer
-- ----------------------------
INSERT INTO t_s_producer VALUES ('1', 'DH', '大华', null, '1');
INSERT INTO t_s_producer VALUES ('2', 'HK', '海康', null, '1');

-- ----------------------------
-- Table structure for `t_s_qqhy`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_qqhy`;
CREATE TABLE `t_s_qqhy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) DEFAULT NULL COMMENT '用户code',
  `zb_id` int(20) DEFAULT NULL COMMENT '分组id',
  `hy_code` varchar(20) DEFAULT NULL COMMENT '好友登陆代码',
  `hy_name` varchar(20) DEFAULT NULL COMMENT '好友名字',
  `sfzc` int(10) DEFAULT NULL COMMENT '是否正常 1正常 0 你加了别人 别人还没有审批',
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_qqhy
-- ----------------------------
INSERT INTO t_s_qqhy VALUES ('1', '100061', '1824', '100056', null, '1', '2013-04-05 17:59:36');
INSERT INTO t_s_qqhy VALUES ('2', '100061', '1824', '100055', null, '1', '2013-04-05 17:59:38');
INSERT INTO t_s_qqhy VALUES ('3', '100061', '1824', '100046', null, '1', '2013-04-05 17:59:42');
INSERT INTO t_s_qqhy VALUES ('4', '100061', '1824', '100050', null, '1', '2013-04-05 17:59:43');
INSERT INTO t_s_qqhy VALUES ('5', '100061', '1824', '100044', null, '1', '2013-04-05 17:59:45');

-- ----------------------------
-- Table structure for `t_s_qzhy`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_qzhy`;
CREATE TABLE `t_s_qzhy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) DEFAULT NULL COMMENT '用户code',
  `q_code` varchar(20) DEFAULT NULL COMMENT '群组号',
  `sfzc` int(10) DEFAULT NULL COMMENT '1 正常 0 申请了未审批',
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_qzhy
-- ----------------------------
INSERT INTO t_s_qzhy VALUES ('1', '100002', 'qbm0001', '1', '2013-04-05 18:00:04');
INSERT INTO t_s_qzhy VALUES ('2', '100000', 'qbm0001', '1', '2013-04-05 18:00:06');
INSERT INTO t_s_qzhy VALUES ('3', '100003', 'qbm0001', '1', '2013-04-05 18:00:06');
INSERT INTO t_s_qzhy VALUES ('4', '100001', 'qbm0001', '1', '2013-04-05 18:00:07');
INSERT INTO t_s_qzhy VALUES ('5', '100154', 'qbm0002', '1', '2013-04-05 18:00:11');

-- ----------------------------
-- Table structure for `t_s_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_code` char(20) COLLATE utf8_bin NOT NULL,
  `role_name` char(40) COLLATE utf8_bin NOT NULL,
  `dept_level` int(11) DEFAULT '10',
  `sfld` int(11) DEFAULT NULL COMMENT '是否领导',
  `sftq` int(11) DEFAULT NULL COMMENT '是否特勤',
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `gwjb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
INSERT INTO t_s_role VALUES ('1', 'xtgl', '系统管理员', '0', '1', '1', '2011-03-04 22:12:58', '1', null);
INSERT INTO t_s_role VALUES ('2', 'ybyh', '一般用户', '0', '0', '0', '2011-05-22 10:44:54', '1', null);
INSERT INTO t_s_role VALUES ('4', 'spuer', '超级管理员', '0', '1', '1', '2011-05-31 10:45:56', '0', '0');
INSERT INTO t_s_role VALUES ('5', 'glzx', '管理中心', '10', '1', '0', '2011-05-31 15:01:46', '0', '2');
INSERT INTO t_s_role VALUES ('40', 'Test', '测试组', '10', '0', '0', '2013-03-22 09:22:38', '0', null);
INSERT INTO t_s_role VALUES ('41', 'xftdGroup', '消防通道组', '10', '0', '0', '2013-05-07 10:19:02', '0', null);
INSERT INTO t_s_role VALUES ('42', 'dzjcGroup', '电子警察组', '10', '0', '0', '2013-05-07 10:23:23', '0', null);

-- ----------------------------
-- Table structure for `t_s_rolevalue`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_rolevalue`;
CREATE TABLE `t_s_rolevalue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_code` char(20) CHARACTER SET latin1 NOT NULL,
  `ruler_code` char(20) CHARACTER SET latin1 NOT NULL,
  `ruler_word` char(20) CHARACTER SET latin1 DEFAULT 'QUIDV',
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3150 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_rolevalue
-- ----------------------------
INSERT INTO t_s_rolevalue VALUES ('1', 'xtgl', 'xtgl', 'QUIDV', '2011-03-04 22:38:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2', 'xtgl', 'kjjc', 'QUID', '2011-03-04 22:39:15', '1');
INSERT INTO t_s_rolevalue VALUES ('3', 'xtgl', 'ruler', 'QUIVD', '2011-03-05 13:08:08', '0');
INSERT INTO t_s_rolevalue VALUES ('4', 'xtgl', 'bzsj', 'QUIDV', '2011-03-05 13:09:13', '1');
INSERT INTO t_s_rolevalue VALUES ('5', 'xtgl', 'code', 'QUIVD', '2011-03-05 19:07:02', '0');
INSERT INTO t_s_rolevalue VALUES ('6', 'xtgl', 'role', 'QUIDV', '2011-03-05 20:44:51', '1');
INSERT INTO t_s_rolevalue VALUES ('7', 'xtgl', 'user', 'QUIVD', '2011-03-05 20:52:08', '1');
INSERT INTO t_s_rolevalue VALUES ('2674', 'xtgl', 'xxgl', 'QUIVD', '2012-09-07 02:05:36', '1');
INSERT INTO t_s_rolevalue VALUES ('2675', 'xtgl', 'person', 'QUIVD', '2012-09-07 02:05:36', '0');
INSERT INTO t_s_rolevalue VALUES ('2676', 'xtgl', 'dept', 'QUIVD', '2012-09-07 02:05:36', '0');
INSERT INTO t_s_rolevalue VALUES ('2677', 'xtgl', 'jcxx', 'QUIVD', '2012-09-07 02:05:36', '0');
INSERT INTO t_s_rolevalue VALUES ('2678', 'xtgl', 'xxglxx', 'QUIVD', '2012-09-07 02:06:35', '1');
INSERT INTO t_s_rolevalue VALUES ('2679', 'spuer', 'xxgl', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2680', 'spuer', 'xxglxx', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2681', 'spuer', 'xtgl', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2682', 'spuer', 'jcxx', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2683', 'spuer', 'person', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2684', 'spuer', 'dept', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2685', 'spuer', 'bzsj', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2686', 'spuer', 'code', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2687', 'spuer', 'role', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2688', 'spuer', 'ruler', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2689', 'glzx', 'xxgl', 'QUIVD', '2012-09-07 02:07:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2690', 'glzx', 'xxglxx', 'QUIVD', '2012-09-07 02:07:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2859', 'xtgl', 'xtxxgl', 'QUIVD', '2013-05-07 09:45:41', '1');
INSERT INTO t_s_rolevalue VALUES ('2692', 'spuer', 'xsxxgl', 'QUIVD', '2012-09-07 02:08:10', '0');
INSERT INTO t_s_rolevalue VALUES ('2693', 'xtgl', 'tzgl', 'QUIVD', '2012-09-07 02:09:07', '1');
INSERT INTO t_s_rolevalue VALUES ('2694', 'spuer', 'tzgl', 'QUIVD', '2012-09-07 02:09:13', '0');
INSERT INTO t_s_rolevalue VALUES ('2695', 'glzx', 'xtgl', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2696', 'glzx', 'bzsj', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2697', 'glzx', 'ruler', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2698', 'glzx', 'role', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2699', 'glzx', 'code', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2700', 'glzx', 'jcxx', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2701', 'glzx', 'dept', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2702', 'glzx', 'person', 'QUIVD', '2013-03-20 18:19:42', '0');
INSERT INTO t_s_rolevalue VALUES ('2703', 'xtgl', 'ruler', 'QUIVD', '2013-03-22 09:19:24', '1');
INSERT INTO t_s_rolevalue VALUES ('2704', 'xtgl', 'code', 'QUIVD', '2013-03-22 09:19:24', '1');
INSERT INTO t_s_rolevalue VALUES ('2705', 'xtgl', 'xtglxx', 'QUIVD', '2013-03-22 09:19:24', '1');
INSERT INTO t_s_rolevalue VALUES ('2706', 'xtgl', 'dept', 'QUIVD', '2013-03-22 09:19:24', '0');
INSERT INTO t_s_rolevalue VALUES ('2707', 'xtgl', 'person', 'QUIVD', '2013-03-22 09:19:24', '1');
INSERT INTO t_s_rolevalue VALUES ('2708', 'ybyh', 'xxgl', 'QUIVD', '2013-03-22 09:19:47', '1');
INSERT INTO t_s_rolevalue VALUES ('2709', 'ybyh', 'xxglxx', 'QUIVD', '2013-03-22 09:19:47', '1');
INSERT INTO t_s_rolevalue VALUES ('2710', 'ybyh', 'xtgl', 'QUIVD', '2013-03-22 09:19:47', '0');
INSERT INTO t_s_rolevalue VALUES ('2711', 'ybyh', 'role', 'Q', '2013-03-22 09:19:47', '0');
INSERT INTO t_s_rolevalue VALUES ('2712', 'ybyh', 'bzsj', 'QUIVD', '2013-03-22 09:21:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2713', 'Test', 'xxgl', 'QUIVD', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2714', 'Test', 'xxglxx', 'QUIVD', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2860', 'xtgl', 'carTrack', 'QUIVD', '2013-05-07 09:45:41', '1');
INSERT INTO t_s_rolevalue VALUES ('2716', 'Test', 'person', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2717', 'Test', 'dept', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2718', 'Test', 'jcxx', 'QUIVD', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2719', 'Test', 'bzsj', 'QUIVD', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2720', 'Test', 'code', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2721', 'Test', 'role', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2722', 'Test', 'ruler', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2723', 'xtgl', 'baseInfo', 'QUIVD', '2013-03-25 14:38:24', '0');
INSERT INTO t_s_rolevalue VALUES ('2724', 'xtgl', 'location', 'QUIVD', '2013-03-27 09:09:44', '1');
INSERT INTO t_s_rolevalue VALUES ('2725', 'xtgl', 'sbgl', 'QUIVD', '2013-03-27 15:02:55', '1');
INSERT INTO t_s_rolevalue VALUES ('2726', 'xtgl', 'cameraInfo', 'QUIVD', '2013-03-27 15:04:13', '1');
INSERT INTO t_s_rolevalue VALUES ('2727', 'xtgl', 'nvr', 'QUIVD', '2013-03-28 11:14:17', '1');
INSERT INTO t_s_rolevalue VALUES ('2728', 'ybyh', 'sbgl', 'QUIVD', '2013-03-28 17:45:11', '1');
INSERT INTO t_s_rolevalue VALUES ('2729', 'ybyh', 'cameraInfo', 'Q', '2013-03-28 17:45:11', '1');
INSERT INTO t_s_rolevalue VALUES ('2730', 'ybyh', 'nvr', 'QUIVD', '2013-03-28 17:45:11', '0');
INSERT INTO t_s_rolevalue VALUES ('2731', 'ybyh', 'location', 'Q', '2013-03-28 17:45:11', '1');
INSERT INTO t_s_rolevalue VALUES ('2732', 'ybyh', 'jcxx', 'QUIVD', '2013-03-28 17:45:11', '0');
INSERT INTO t_s_rolevalue VALUES ('2733', 'ybyh', 'person', 'Q', '2013-03-28 17:45:11', '0');
INSERT INTO t_s_rolevalue VALUES ('2734', 'ybyh', 'dept', 'Q', '2013-03-28 17:45:11', '0');
INSERT INTO t_s_rolevalue VALUES ('2735', 'xtgl', 'znpz', 'QUIVD', '2013-03-29 11:48:56', '1');
INSERT INTO t_s_rolevalue VALUES ('2736', 'xtgl', 'znfp', 'QUIVD', '2013-03-29 11:48:56', '1');
INSERT INTO t_s_rolevalue VALUES ('2737', 'xtgl', 'znfpCamera2Analy', 'QUIVD', '2013-03-29 11:48:56', '1');
INSERT INTO t_s_rolevalue VALUES ('2738', 'xtgl', 'znfpCamera2Nvr', 'QUIVD', '2013-03-29 11:48:56', '0');
INSERT INTO t_s_rolevalue VALUES ('2739', 'xtgl', 'znpzxx', 'QUIVD', '2013-03-29 11:48:56', '1');
INSERT INTO t_s_rolevalue VALUES ('2740', 'xtgl', 'cameraDecEvent', 'QUIVD', '2013-03-29 11:48:56', '1');
INSERT INTO t_s_rolevalue VALUES ('2741', 'xtgl', 'cameraDecParam', 'QUIVD', '2013-03-29 11:48:56', '1');
INSERT INTO t_s_rolevalue VALUES ('2742', 'xtgl', 'dataManagement', 'QUIVD', '2013-03-29 13:31:14', '1');
INSERT INTO t_s_rolevalue VALUES ('2743', 'xtgl', 'cameraDecTimestamp', 'QUIVD', '2013-03-29 13:31:14', '1');
INSERT INTO t_s_rolevalue VALUES ('2744', 'xtgl', 'backUpData', 'QUIVD', '2013-03-29 13:33:08', '1');
INSERT INTO t_s_rolevalue VALUES ('2745', 'xtgl', 'analyServer', 'QUIVD', '2013-03-29 13:54:54', '1');
INSERT INTO t_s_rolevalue VALUES ('2746', 'xtgl', 'eventTableMgr', 'QUIVD', '2013-03-29 13:54:54', '0');
INSERT INTO t_s_rolevalue VALUES ('2747', 'xtgl', 'eventTypeProperty', 'QUIVD', '2013-03-29 13:54:54', '1');
INSERT INTO t_s_rolevalue VALUES ('2748', 'xtgl', 'eventType', 'QUIVD', '2013-03-29 13:54:54', '0');
INSERT INTO t_s_rolevalue VALUES ('2749', 'xtgl', 'areaset', 'QUIVD', '2013-03-29 13:54:54', '0');
INSERT INTO t_s_rolevalue VALUES ('2750', 'xtgl', 'znxs', 'QUIVD', '2013-03-29 14:06:50', '1');
INSERT INTO t_s_rolevalue VALUES ('2751', 'xtgl', 'xczb', 'QUIVD', '2013-03-29 14:06:50', '1');
INSERT INTO t_s_rolevalue VALUES ('2752', 'xtgl', 'nksbfb', 'QUIVD', '2013-03-29 14:06:50', '0');
INSERT INTO t_s_rolevalue VALUES ('2753', 'xtgl', 'carTrack', 'QUIVD', '2013-03-29 14:06:50', '0');
INSERT INTO t_s_rolevalue VALUES ('2754', 'xtgl', 'cameraDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2755', 'xtgl', 'analySerDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2756', 'xtgl', 'nvrDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2757', 'xtgl', 'allDevDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2758', 'xtgl', 'mapVideo', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2759', 'xtgl', 'wallVideo', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2760', 'xtgl', 'tjfx', 'QUIVD', '2013-03-29 14:34:16', '1');
INSERT INTO t_s_rolevalue VALUES ('2761', 'xtgl', 'tjfxxx', 'QUIVD', '2013-03-29 14:34:16', '1');
INSERT INTO t_s_rolevalue VALUES ('2762', 'xtgl', 'dayReport', 'QUIVD', '2013-03-29 14:34:16', '1');
INSERT INTO t_s_rolevalue VALUES ('2763', 'xtgl', 'monthReport', 'QUIVD', '2013-03-29 14:34:16', '0');
INSERT INTO t_s_rolevalue VALUES ('2764', 'xtgl', 'eventReport', 'QUIVD', '2013-03-29 14:46:58', '1');
INSERT INTO t_s_rolevalue VALUES ('2765', 'xtgl', 'IntelligentShow', 'QUIVD', '2013-03-29 15:36:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2766', 'xtgl', 'cloud', 'QUIVD', '2013-03-30 18:32:26', '0');
INSERT INTO t_s_rolevalue VALUES ('2767', 'ybyh', 'eventType', 'Q', '2013-04-07 11:22:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2768', 'ybyh', 'eventTypeProperty', 'QUIVD', '2013-04-07 11:22:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2769', 'ybyh', 'eventTableMgr', 'Q', '2013-04-07 11:22:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2770', 'xtgl', 'base_one_eventReport', 'QUIVD', '2013-04-08 14:54:20', '1');
INSERT INTO t_s_rolevalue VALUES ('2771', 'xtgl', 'web_one', 'QUIVD', '2013-04-09 15:26:39', '1');
INSERT INTO t_s_rolevalue VALUES ('2772', 'xtgl', 'web_one_one', 'QUIVD', '2013-04-09 15:29:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2773', 'xtgl', 'camera_event', 'QUIVD', '2013-04-09 15:43:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2774', 'xtgl', 'monitor_event', 'QUIVD', '2013-04-09 17:25:36', '1');
INSERT INTO t_s_rolevalue VALUES ('2775', 'xtgl', 'web_one_cameraInfo', 'QUIVD', '2013-04-12 13:27:21', '1');
INSERT INTO t_s_rolevalue VALUES ('2776', 'xtgl', 'web_one_headServer', 'QUIVD', '2013-04-12 13:27:21', '1');
INSERT INTO t_s_rolevalue VALUES ('2777', 'ybyh', 'analyServer', 'Q', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2778', 'ybyh', 'web_one', 'QUIVD', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2779', 'ybyh', 'web_one_one', 'QUIVD', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2780', 'ybyh', 'camera_event', 'QUIVD', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2781', 'ybyh', 'monitor_event', 'QUIVD', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2782', 'ybyh', 'web_one_cameraInfo', 'QUIVD', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2783', 'ybyh', 'web_one_headServer', 'QUIVD', '2013-04-13 14:40:03', '1');
INSERT INTO t_s_rolevalue VALUES ('2784', 'ybyh', 'cloud', 'QUIVD', '2013-04-13 14:40:03', '0');
INSERT INTO t_s_rolevalue VALUES ('2785', 'ybyh', 'znxs', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2786', 'ybyh', 'nksbfb', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2787', 'ybyh', 'cameraDistribution', 'Q', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2788', 'ybyh', 'analySerDistribution', 'Q', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2789', 'ybyh', 'nvrDistribution', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2790', 'ybyh', 'allDevDistribution', 'Q', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2791', 'ybyh', 'xczb', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2792', 'ybyh', 'mapVideo', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2793', 'ybyh', 'wallVideo', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2794', 'ybyh', 'IntelligentShow', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2795', 'ybyh', 'znfpCamera2Analy', 'Q', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2796', 'ybyh', 'znfp', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2797', 'ybyh', 'znpzxx', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2798', 'ybyh', 'znpz', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2799', 'ybyh', 'areaset', 'Q', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2800', 'ybyh', 'cameraDecEvent', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2801', 'ybyh', 'cameraDecTimestamp', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2802', 'ybyh', 'cameraDecParam', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2803', 'ybyh', 'znfpCamera2Nvr', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2804', 'ybyh', 'tjfx', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2805', 'ybyh', 'tjfxxx', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2806', 'ybyh', 'monthReport', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2807', 'ybyh', 'eventReport', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2808', 'ybyh', 'dayReport', 'QUIVD', '2013-04-16 14:45:32', '0');
INSERT INTO t_s_rolevalue VALUES ('2809', 'ybyh', 'carTrack', 'QUIVD', '2013-04-16 14:45:32', '1');
INSERT INTO t_s_rolevalue VALUES ('2810', 'xtgl', 'web_one_znxs', 'QUIVD', '2013-04-17 18:16:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2811', 'xtgl', 'intelligentShow', 'QUIVD', '2013-04-19 10:21:48', '1');
INSERT INTO t_s_rolevalue VALUES ('2812', 'Test', 'location', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2813', 'Test', 'eventTableMgr', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2814', 'Test', 'eventType', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2815', 'Test', 'sbgl', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2816', 'Test', 'cameraInfo', 'QV', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2817', 'Test', 'analyServer', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2818', 'Test', 'dataManagement', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2819', 'Test', 'backUpData', 'QU', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2820', 'Test', 'web_one', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2821', 'Test', 'web_one_one', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2822', 'Test', 'web_one_znxs', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2823', 'Test', 'camera_event', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2824', 'Test', 'monitor_event', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2825', 'Test', 'web_one_cameraInfo', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2826', 'Test', 'web_one_headServer', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2827', 'Test', 'cloud', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2828', 'Test', 'znxs', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2829', 'Test', 'xczb', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2830', 'Test', 'intelligentShow', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2831', 'Test', 'wallVideo', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2832', 'Test', 'mapVideo', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2833', 'Test', 'nksbfb', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2834', 'Test', 'nvrDistribution', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2835', 'Test', 'allDevDistribution', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2836', 'Test', 'analySerDistribution', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2837', 'Test', 'cameraDistribution', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2838', 'Test', 'carTrack', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2839', 'Test', 'znfp', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2840', 'Test', 'znfpCamera2Analy', 'Q', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2841', 'Test', 'xtgl', 'QUIVD', '2013-04-25 14:46:47', '0');
INSERT INTO t_s_rolevalue VALUES ('2842', 'xtgl', 'ggfj', 'QUIVD', '2013-04-25 15:53:08', '0');
INSERT INTO t_s_rolevalue VALUES ('2843', 'Test', 'znpz', 'QUIVD', '2013-04-25 16:31:26', '0');
INSERT INTO t_s_rolevalue VALUES ('2844', 'xtgl', 'blacklist', 'QUIVD BC', '2013-04-25 17:01:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2845', 'xtgl', 'eventTypeTitle', 'QUIVD', '2013-04-26 16:24:39', '0');
INSERT INTO t_s_rolevalue VALUES ('2846', 'xtgl', 'vehicleTrack', 'QUIVD', '2013-04-28 10:44:58', '1');
INSERT INTO t_s_rolevalue VALUES ('2847', 'Test', 'blacklist', 'Q', '2013-04-28 11:42:35', '0');
INSERT INTO t_s_rolevalue VALUES ('2848', 'Test', 'vehicleTrack', 'QUIVD', '2013-04-28 11:42:35', '0');
INSERT INTO t_s_rolevalue VALUES ('2849', 'xtgl', 'dzjc', 'QUIVD', '2013-05-02 12:01:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2850', 'xtgl', 'cd', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2851', 'xtgl', 'cdzs', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2852', 'xtgl', 'webqq', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2853', 'xtgl', 'oa', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2854', 'Test', 'tjfx', 'QUIVD', '2013-05-06 09:57:59', '0');
INSERT INTO t_s_rolevalue VALUES ('2855', 'Test', 'tjfxxx', 'QUIVD', '2013-05-06 09:57:59', '0');
INSERT INTO t_s_rolevalue VALUES ('2856', 'Test', 'dzjc', 'QV', '2013-05-06 09:57:59', '0');
INSERT INTO t_s_rolevalue VALUES ('2857', 'xtgl', 'jtsjtj', 'QUIVD', '2013-05-06 15:17:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2858', 'xtgl', 'jtsjforday', 'QUIVD', '2013-05-06 15:21:11', '0');
INSERT INTO t_s_rolevalue VALUES ('2861', 'xtgl', 'jbxxgl', 'QUIVD', '2013-05-07 09:49:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2862', 'xftdGroup', 'web_one', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2863', 'xftdGroup', 'monitor_event', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2864', 'xftdGroup', 'web_one_one', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2865', 'xftdGroup', 'web_one_znxs', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2866', 'xftdGroup', 'web_one_headServer', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2867', 'xftdGroup', 'web_one_cameraInfo', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2868', 'xftdGroup', 'xtgl', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2869', 'xftdGroup', 'jbxxgl', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2870', 'xftdGroup', 'person', 'Q', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2871', 'xftdGroup', 'xtglxx', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2872', 'xftdGroup', 'backUpData', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2873', 'xftdGroup', 'tjfx', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2874', 'xftdGroup', 'tjfxxx', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2875', 'xftdGroup', 'monthReport', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2876', 'xftdGroup', 'dayReport', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2877', 'dzjcGroup', 'web_one', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2878', 'dzjcGroup', 'web_one_one', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2879', 'dzjcGroup', 'camera_event', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2880', 'dzjcGroup', 'web_one_znxs', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2881', 'dzjcGroup', 'web_one_headServer', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2882', 'dzjcGroup', 'web_one_cameraInfo', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2883', 'dzjcGroup', 'tjfx', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2884', 'dzjcGroup', 'tjfxxx', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2885', 'dzjcGroup', 'monthReport', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2886', 'dzjcGroup', 'dayReport', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2887', 'dzjcGroup', 'xtgl', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2888', 'dzjcGroup', 'jbxxgl', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2889', 'dzjcGroup', 'person', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2890', 'dzjcGroup', 'xtglxx', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2891', 'dzjcGroup', 'backUpData', 'QU', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2892', 'xtgl', 'zngg', 'QUIVD', '2013-05-07 10:37:18', '0');
INSERT INTO t_s_rolevalue VALUES ('2893', 'Test', 'role', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2894', 'Test', 'jbxxgl', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2895', 'Test', 'dept', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2896', 'Test', 'person', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2897', 'Test', 'zngg', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2898', 'Test', 'xtglxx', 'QUIVD', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2899', 'Test', 'code', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2900', 'Test', 'baseInfo', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2901', 'Test', 'ruler', 'Q', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2902', 'Test', 'web_one', 'QUIVD', '2013-05-07 10:39:05', '0');
INSERT INTO t_s_rolevalue VALUES ('2903', 'Test', 'eventTypeTitle', 'Q', '2013-05-07 10:41:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2904', 'xtgl', 'spjk', 'QUIVD', '2013-05-07 10:50:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2905', 'xtgl', 'jcbk', 'QUIVD', '2013-05-07 10:50:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2906', 'xtgl', 'jcbkxx', 'QUIVD', '2013-05-07 10:54:44', '1');
INSERT INTO t_s_rolevalue VALUES ('2907', 'xtgl', 'whiteList', 'QUIVD', '2013-05-07 11:09:44', '1');
INSERT INTO t_s_rolevalue VALUES ('2908', 'Test', 'areaset', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2909', 'Test', 'cameraDecParam', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2910', 'Test', 'cameraDecTimestamp', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2911', 'Test', 'cameraDecEvent', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2912', 'Test', 'znfpCamera2Nvr', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2913', 'Test', 'nvr', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2914', 'Test', 'eventReport', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2915', 'Test', 'monthReport', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2916', 'Test', 'dayReport', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2917', 'Test', 'jtsjforday', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2918', 'Test', 'jtsjtj', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2919', 'Test', 'ggfj', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2920', 'Test', 'spjk', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2921', 'Test', 'jcbk', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2922', 'Test', 'jcbkxx', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2923', 'Test', 'whiteList', 'QUIVD', '2013-05-07 11:11:29', '0');
INSERT INTO t_s_rolevalue VALUES ('2924', 'xtgl', 'sbxxgl', 'QUIVD', '2013-05-07 11:27:34', '1');
INSERT INTO t_s_rolevalue VALUES ('2925', 'xtgl', 'sbxxglxx', 'QUIVD', '2013-05-07 11:29:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2926', 'xtgl', 'dzjc', 'QUIVD', '2013-05-07 11:42:14', '1');
INSERT INTO t_s_rolevalue VALUES ('2927', 'xtgl', 'wfcl', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2928', 'xtgl', 'wfclxx', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2929', 'xtgl', 'wfsjll', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2930', 'xtgl', 'wfsjlr', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2931', 'xtgl', 'wfsjsh', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2932', 'xtgl', 'wfsjxg', 'QUIVD', '2013-05-07 12:09:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2933', 'xtgl', 'jxwfcx', 'QUIVD', '2013-05-07 12:09:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2934', 'xtgl', 'wfclblackList', 'QUIVD', '2013-05-07 12:09:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2935', 'xtgl', 'databaseDesp', 'QUIVD', '2013-05-07 12:24:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2936', 'xtgl', 'wfxw', 'QUIVD', '2013-05-07 12:45:09', '1');
INSERT INTO t_s_rolevalue VALUES ('2937', 'Test', 'databaseDesp', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2938', 'Test', 'wfcl', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2939', 'Test', 'wfclxx', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2940', 'Test', 'wfclblackList', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2941', 'Test', 'jxwfcx', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2942', 'Test', 'wfsjxg', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2943', 'Test', 'wfsjlr', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2944', 'Test', 'wfsjll', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2945', 'Test', 'wfxw', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2946', 'Test', 'sbxxgl', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2947', 'Test', 'sbxxglxx', 'QUIVD', '2013-05-07 12:45:28', '0');
INSERT INTO t_s_rolevalue VALUES ('2948', 'xtgl', 'llzk', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2949', 'xtgl', 'llzkxx', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2950', 'xtgl', 'car-day', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2951', 'xtgl', 'car-month', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2952', 'xtgl', 'car-year', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2953', 'xtgl', 'car-timespan', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2954', 'Test', 'llzk', 'QUIVD', '2013-05-07 13:03:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2955', 'Test', 'llzkxx', 'QUIVD', '2013-05-07 13:03:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2956', 'Test', 'car-day', 'QUIVD', '2013-05-07 13:03:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2957', 'Test', 'car-month', 'QUIVD', '2013-05-07 13:03:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2958', 'Test', 'car-year', 'QUIVD', '2013-05-07 13:03:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2959', 'Test', 'car-timespan', 'QUIVD', '2013-05-07 13:03:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2960', 'xtgl', 'cloud', 'QUIVD', '2013-05-07 13:03:40', '1');
INSERT INTO t_s_rolevalue VALUES ('2961', 'Test', 'cloudxx', 'QUIVD', '2013-05-07 13:05:30', '0');
INSERT INTO t_s_rolevalue VALUES ('2962', 'Test', 'realtime-fenxi', 'QUIVD', '2013-05-07 13:06:44', '0');
INSERT INTO t_s_rolevalue VALUES ('2963', 'xtgl', 'cloudxx', 'QUIVD', '2013-05-07 13:06:51', '1');
INSERT INTO t_s_rolevalue VALUES ('2964', 'xtgl', 'realtime-fenxi', 'QUIVD', '2013-05-07 13:06:51', '1');
INSERT INTO t_s_rolevalue VALUES ('2965', 'Test', 'history-play', 'QUIVD', '2013-05-07 13:45:51', '0');
INSERT INTO t_s_rolevalue VALUES ('2966', 'xtgl', 'history-play', 'QUIVD', '2013-05-07 13:45:57', '0');
INSERT INTO t_s_rolevalue VALUES ('2967', 'xtgl', 'dzjcQuery', 'QUIVD', '2013-05-07 13:51:47', '1');
INSERT INTO t_s_rolevalue VALUES ('2968', 'xtgl', 'jcbkType', 'QUIVD', '2013-05-07 13:52:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2969', 'Test', 'jcbkType', 'QUIVD', '2013-05-07 13:52:19', '0');
INSERT INTO t_s_rolevalue VALUES ('2970', 'Test', 'dzjcQuery', 'QUIVD', '2013-05-07 13:52:19', '0');
INSERT INTO t_s_rolevalue VALUES ('2971', 'xtgl', 'clgjQuery', 'QUIVD', '2013-05-07 13:55:20', '1');
INSERT INTO t_s_rolevalue VALUES ('2972', 'Test', 'clgjQuery', 'QUIVD', '2013-05-07 13:55:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2973', 'dzjcGroup', 'eventReport', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2974', 'dzjcGroup', 'jtsjtj', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2975', 'dzjcGroup', 'jtsjforday', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2976', 'dzjcGroup', 'dzjc', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2977', 'dzjcGroup', 'zngg', 'QI', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2978', 'dzjcGroup', 'cloud', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2979', 'dzjcGroup', 'cloudxx', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2980', 'dzjcGroup', 'realtime-fenxi', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2981', 'dzjcGroup', 'llzk', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2982', 'dzjcGroup', 'llzkxx', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2983', 'dzjcGroup', 'car-day', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2984', 'dzjcGroup', 'car-month', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2985', 'dzjcGroup', 'car-year', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2986', 'dzjcGroup', 'car-timespan', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2987', 'dzjcGroup', 'sbxxgl', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2988', 'dzjcGroup', 'nksbfb', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2989', 'dzjcGroup', 'allDevDistribution', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2990', 'dzjcGroup', 'nvrDistribution', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2991', 'dzjcGroup', 'analySerDistribution', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2992', 'dzjcGroup', 'cameraDistribution', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2993', 'dzjcGroup', 'sbxxglxx', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2994', 'dzjcGroup', 'cameraDecTimestamp', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2995', 'dzjcGroup', 'cameraDecEvent', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2996', 'dzjcGroup', 'location', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2997', 'dzjcGroup', 'cameraDecParam', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2998', 'dzjcGroup', 'eventType', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2999', 'dzjcGroup', 'eventTableMgr', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3000', 'dzjcGroup', 'areaset', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3001', 'dzjcGroup', 'sbgl', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3002', 'dzjcGroup', 'znfpCamera2Nvr', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3003', 'dzjcGroup', 'znfpCamera2Analy', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3004', 'dzjcGroup', 'nvr', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3005', 'dzjcGroup', 'cameraInfo', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3006', 'dzjcGroup', 'analyServer', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3007', 'dzjcGroup', 'jcbk', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3008', 'dzjcGroup', 'jcbkxx', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3009', 'dzjcGroup', 'jcbkType', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3010', 'dzjcGroup', 'dzjcQuery', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3011', 'dzjcGroup', 'whiteList', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3012', 'dzjcGroup', 'clgjQuery', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3013', 'dzjcGroup', 'blacklist', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3014', 'dzjcGroup', 'wfcl', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3015', 'dzjcGroup', 'wfclxx', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3016', 'dzjcGroup', 'wfsjlr', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3017', 'dzjcGroup', 'wfsjll', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3018', 'dzjcGroup', 'wfsjxg', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3019', 'dzjcGroup', 'jxwfcx', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3020', 'dzjcGroup', 'wfxw', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3021', 'dzjcGroup', 'wfclblackList', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3022', 'dzjcGroup', 'znxs', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3023', 'dzjcGroup', 'xczb', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3024', 'dzjcGroup', 'history-play', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3025', 'dzjcGroup', 'intelligentShow', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3026', 'dzjcGroup', 'wallVideo', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3027', 'dzjcGroup', 'mapVideo', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3028', 'dzjcGroup', 'carTrack', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3029', 'dzjcGroup', 'vehicleTrack', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3030', 'dzjcGroup', 'baseInfo', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3031', 'dzjcGroup', 'code', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3032', 'dzjcGroup', 'ruler', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3033', 'dzjcGroup', 'eventTypeTitle', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3034', 'dzjcGroup', 'databaseDesp', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3035', 'dzjcGroup', 'role', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3036', 'dzjcGroup', 'ggfj', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3037', 'dzjcGroup', 'dept', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3038', 'xtgl', 'wfxxsh', 'QUIVD', '2013-05-07 14:04:40', '1');
INSERT INTO t_s_rolevalue VALUES ('3039', 'xtgl', 'wfxxfs', 'QUIVD', '2013-05-07 14:04:40', '1');
INSERT INTO t_s_rolevalue VALUES ('3040', 'xtgl', 'wfxxzs', 'QUIVD', '2013-05-07 14:04:40', '0');
INSERT INTO t_s_rolevalue VALUES ('3041', 'xtgl', 'sctpfs', 'QUIVD', '2013-05-07 14:04:40', '0');
INSERT INTO t_s_rolevalue VALUES ('3042', 'xtgl', 'tptj', 'QUIVD', '2013-05-07 14:09:34', '1');
INSERT INTO t_s_rolevalue VALUES ('3043', 'ybyh', 'intelligentShow', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3044', 'ybyh', 'vehicleTrack', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3045', 'ybyh', 'history-play', 'QUIVD', '2013-05-07 14:13:35', '0');
INSERT INTO t_s_rolevalue VALUES ('3046', 'ybyh', 'web_one_znxs', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3047', 'ybyh', 'cloudxx', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3048', 'ybyh', 'realtime-fenxi', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3049', 'ybyh', 'sbxxgl', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3050', 'ybyh', 'jtsjtj', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3051', 'ybyh', 'sbxxglxx', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3052', 'ybyh', 'eventType', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3053', 'ybyh', 'eventTableMgr', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3054', 'ybyh', 'jcbk', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3055', 'ybyh', 'jcbkxx', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3056', 'ybyh', 'whiteList', 'QI', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3057', 'ybyh', 'blacklist', 'QI', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3058', 'ybyh', 'llzk', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3059', 'ybyh', 'llzkxx', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3060', 'ybyh', 'car-month', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3061', 'ybyh', 'car-year', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3062', 'ybyh', 'car-timespan', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3063', 'ybyh', 'car-day', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3064', 'ybyh', 'xtgl', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3065', 'ybyh', 'xtglxx', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3066', 'ybyh', 'databaseDesp', 'QUIVD', '2013-05-07 14:13:35', '0');
INSERT INTO t_s_rolevalue VALUES ('3067', 'ybyh', 'backUpData', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3068', 'ybyh', 'baseInfo', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3069', 'ybyh', 'ruler', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3070', 'ybyh', 'code', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3071', 'ybyh', 'eventTypeTitle', 'QUIVD', '2013-05-07 14:13:35', '0');
INSERT INTO t_s_rolevalue VALUES ('3072', 'ybyh', 'jbxxgl', 'QUIVD', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3073', 'ybyh', 'zngg', 'QUIVD', '2013-05-07 14:13:35', '0');
INSERT INTO t_s_rolevalue VALUES ('3074', 'ybyh', 'person', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3075', 'ybyh', 'dept', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3076', 'ybyh', 'role', 'Q', '2013-05-07 14:13:35', '1');
INSERT INTO t_s_rolevalue VALUES ('3077', 'xtgl', 'logMgr', 'QUIVD', '2013-05-07 16:11:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3078', 'xtgl', 'userlog', 'QUIVD', '2013-05-07 16:11:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3079', 'xtgl', 'syslog', 'QUIVD', '2013-05-07 16:11:33', '0');
INSERT INTO t_s_rolevalue VALUES ('3080', 'xtgl', 'errorlog', 'QUIVD', '2013-05-07 16:11:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3081', 'xtgl', 'yearReport', 'QUIVD', '2013-05-07 16:19:44', '0');
INSERT INTO t_s_rolevalue VALUES ('3082', 'xtgl', 'imageSize', 'QUIVD', '2013-05-07 16:19:44', '0');
INSERT INTO t_s_rolevalue VALUES ('3083', 'Test', 'imageSize', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3084', 'Test', 'yearReport', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3085', 'Test', 'logMgr', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3086', 'Test', 'errorlog', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3087', 'Test', 'userlog', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3088', 'Test', 'syslog', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3089', 'Test', 'tptj', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3090', 'Test', 'wfxxsh', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3091', 'Test', 'sctpfs', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3092', 'Test', 'wfxxzs', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3093', 'Test', 'wfxxfs', 'QUIVD', '2013-05-07 16:20:00', '0');
INSERT INTO t_s_rolevalue VALUES ('3094', 'xtgl', 'wfxwtj', 'QUIVD', '2013-05-07 16:22:55', '0');
INSERT INTO t_s_rolevalue VALUES ('3095', 'xtgl', 'deletepictj', 'QUIVD', '2013-05-07 16:22:55', '0');
INSERT INTO t_s_rolevalue VALUES ('3096', 'xtgl', 'timespantj', 'QUIVD', '2013-05-07 16:22:55', '0');
INSERT INTO t_s_rolevalue VALUES ('3097', 'Test', 'wfxwtj', 'QUIVD', '2013-05-07 16:23:03', '0');
INSERT INTO t_s_rolevalue VALUES ('3098', 'Test', 'deletepictj', 'QUIVD', '2013-05-07 16:23:03', '0');
INSERT INTO t_s_rolevalue VALUES ('3099', 'Test', 'timespantj', 'QUIVD', '2013-05-07 16:23:03', '0');
INSERT INTO t_s_rolevalue VALUES ('3100', 'xtgl', 'taskmgr', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3101', 'xtgl', 'reportlist', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3102', 'xtgl', 'car-gis', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3103', 'xtgl', 'filemgr', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3104', 'dzjcGroup', 'timespantj', 'QUIVD', '2013-05-15 17:32:48', '0');
INSERT INTO t_s_rolevalue VALUES ('3105', 'dzjcGroup', 'yearReport', 'QUIVD', '2013-05-15 17:32:48', '0');
INSERT INTO t_s_rolevalue VALUES ('3106', 'xtgl', 'wfsjgl', 'QUIVD', '2013-05-16 11:44:24', '1');
INSERT INTO t_s_rolevalue VALUES ('3107', 'xtgl', 'jtwfcx', 'QUIVD', '2013-05-16 12:04:47', '0');
INSERT INTO t_s_rolevalue VALUES ('3108', 'xtgl', 'xfsjforday', 'QUIVD', '2013-05-17 09:57:20', '1');
INSERT INTO t_s_rolevalue VALUES ('3109', 'xtgl', 'xfsjfortimetotime', 'QUIVD', '2013-05-17 10:06:56', '1');
INSERT INTO t_s_rolevalue VALUES ('3110', 'xtgl', 'xfsjforyear', 'QUIVD', '2013-05-17 10:06:56', '1');
INSERT INTO t_s_rolevalue VALUES ('3111', 'xtgl', 'xfsjformonth', 'QUIVD', '2013-05-17 10:09:09', '1');
INSERT INTO t_s_rolevalue VALUES ('3112', 'ybyh', 'nvr', 'Q', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3113', 'ybyh', 'nvrDistribution', 'Q', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3114', 'ybyh', 'tjfxxx', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3115', 'ybyh', 'jtsjforday', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3116', 'ybyh', 'monthReport', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3117', 'ybyh', 'yearReport', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3118', 'ybyh', 'timespantj', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3119', 'ybyh', 'deletepictj', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3120', 'ybyh', 'wfxwtj', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3121', 'ybyh', 'wfcl', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3122', 'ybyh', 'wfxxsh', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3123', 'ybyh', 'wfclxx', 'QUIVD', '2013-05-19 21:13:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3124', 'xtgl', 'wfclgl', 'QUIVD', '2013-05-23 10:13:07', '1');
INSERT INTO t_s_rolevalue VALUES ('3125', 'xtgl', 'jtwfcx', 'QUIVD', '2013-05-23 10:25:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3126', 'xtgl', 'wfxxzs', 'QUIVD', '2013-05-24 12:00:06', '1');
INSERT INTO t_s_rolevalue VALUES ('3127', 'xtgl', 'wfxwtj', 'QUIVD', '2013-05-24 12:04:57', '0');
INSERT INTO t_s_rolevalue VALUES ('3128', 'xftdGroup', 'xfsjforyear', 'QUIVD', '2013-05-24 12:13:51', '0');
INSERT INTO t_s_rolevalue VALUES ('3129', 'xftdGroup', 'xfsjfortimetotime', 'QUIVD', '2013-05-24 12:13:51', '0');
INSERT INTO t_s_rolevalue VALUES ('3130', 'xftdGroup', 'xfsjformonth', 'QUIVD', '2013-05-24 12:13:51', '0');
INSERT INTO t_s_rolevalue VALUES ('3131', 'xftdGroup', 'xfsjforday', 'QUIVD', '2013-05-24 12:13:51', '0');
INSERT INTO t_s_rolevalue VALUES ('3132', 'dzjcGroup', 'wfclgl', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3133', 'dzjcGroup', 'jtwfcx', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3134', 'dzjcGroup', 'tptj', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3135', 'dzjcGroup', 'wfsjgl', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3136', 'dzjcGroup', 'wfxxsh', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3137', 'dzjcGroup', 'wfxxfs', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3138', 'dzjcGroup', 'wfxxzs', 'QUIVD', '2013-05-24 12:15:26', '0');
INSERT INTO t_s_rolevalue VALUES ('3139', 'dzjcGroup', 'wfxwtj', 'QUIVD', '2013-05-24 18:03:53', '0');
INSERT INTO t_s_rolevalue VALUES ('3140', 'xtgl', 'yggzl', 'QUIVD', '2013-06-03 14:52:48', '0');
INSERT INTO t_s_rolevalue VALUES ('3141', 'xtgl', 'watchedFolder', 'QUIVD', '2013-06-09 11:38:16', '1');
INSERT INTO t_s_rolevalue VALUES ('3142', 'dzjcGroup', 'yggzl', 'QUIVD', '2013-06-14 10:50:01', '0');
INSERT INTO t_s_rolevalue VALUES ('3143', 'dzjcGroup', 'logMgr', 'QUIVD', '2013-06-14 10:50:01', '0');
INSERT INTO t_s_rolevalue VALUES ('3144', 'dzjcGroup', 'userlog', 'QUIVD', '2013-06-14 10:50:01', '0');
INSERT INTO t_s_rolevalue VALUES ('3145', 'dzjcGroup', 'reportlist', 'QUIVD', '2013-06-14 10:50:01', '0');
INSERT INTO t_s_rolevalue VALUES ('3146', 'xtgl', 'wfclblack', 'QUIVD', '2013-06-17 11:58:51', '1');
INSERT INTO t_s_rolevalue VALUES ('3147', 'dzjcGroup', 'dept', 'QUIVD', '2013-06-17 16:34:57', '0');
INSERT INTO t_s_rolevalue VALUES ('3148', 'dzjcGroup', 'wfclblack', 'QUIVD', '2013-06-17 18:06:55', '0');
INSERT INTO t_s_rolevalue VALUES ('3149', 'xtgl', 'baseInfo', 'QUIVD', '2013-08-05 16:11:00', '1');

-- ----------------------------
-- Table structure for `t_s_ruler`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ruler`;
CREATE TABLE `t_s_ruler` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ruler_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `ruler_name` varchar(40) CHARACTER SET gbk NOT NULL,
  `ruler_desc` varchar(300) CHARACTER SET gbk DEFAULT NULL,
  `ruler_page` varchar(150) CHARACTER SET gbk DEFAULT NULL,
  `ruler_level` int(38) NOT NULL,
  `ruler_echo` int(38) NOT NULL,
  `ruler_manager` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `sffq` int(38) DEFAULT NULL,
  `status` int(38) DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `target` varchar(10) CHARACTER SET gbk DEFAULT NULL,
  `xuhao` varchar(20) COLLATE gbk_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1549 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_ruler
-- ----------------------------
INSERT INTO t_s_ruler VALUES ('102', 'ruler', '菜单管理', '', '/rulerAction.do', '2', '0', 'xtglxx', '0', '1', '2008-10-31 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('103', 'role', '角色/权限管理', '', '/roleAction.do', '2', '0', 'jbxxgl', '0', '1', '2008-10-31 00:00:00', '0', '1');
INSERT INTO t_s_ruler VALUES ('104', 'user', '用户管理', '', '/userAction.do', '2', '0', 'jcxx', '0', '0', '2008-10-31 00:00:00', '0', null);
INSERT INTO t_s_ruler VALUES ('300', 'spjk', '视频监控', '', '', '0', '0', 'spjk', null, '0', '2013-05-07 10:50:13', '0', '3');
INSERT INTO t_s_ruler VALUES ('106', 'dept', '机构管理', '', '/deptAction.do', '2', '0', 'jbxxgl', null, '1', '2011-03-27 01:07:31', '0', null);
INSERT INTO t_s_ruler VALUES ('107', 'person', '人员管理', '', '/personAction.do', '2', '0', 'jbxxgl', null, '1', '2011-03-29 02:08:27', '0', null);
INSERT INTO t_s_ruler VALUES ('100', 'xtgl', '系统管理', '', '', '0', '0', 'xtgl', null, '1', '2013-05-07 09:42:31', '0', '1');
INSERT INTO t_s_ruler VALUES ('105', 'code', '标准数据管理', '', '/codeAction.do', '2', '0', 'xtglxx', '0', '1', '2008-10-31 00:00:00', '0', '2');
INSERT INTO t_s_ruler VALUES ('101', 'xtglxx', '系统信息管理', '', '', '1', '0', 'xtgl', null, '1', '2009-06-10 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('500', 'wfcl', '违法处理', '', '', '0', '0', 'wfcl', null, '0', '2013-05-07 11:44:21', '0', null);
INSERT INTO t_s_ruler VALUES ('1145', 'jbxxgl', '基本信息管理', '', '', '1', '0', 'xtgl', null, '1', '2011-03-08 15:16:07', '0', '1');
INSERT INTO t_s_ruler VALUES ('1521', 'cloudxx', '分析中心', '', '', '1', '0', 'cloud', null, '1', '2013-05-07 13:04:50', '0', null);
INSERT INTO t_s_ruler VALUES ('108', 'yhgl', '用户管理', '', '/personAction.do', '2', '0', 'webqqs', null, '0', '2011-05-05 09:48:53', '0', null);
INSERT INTO t_s_ruler VALUES ('109', 'gsgg', '系统公告', '', '/gsggAction.do', '2', '0', 'webqqs', null, '0', '2011-05-06 08:56:08', '0', null);
INSERT INTO t_s_ruler VALUES ('1385', 'zngg', '站内公告', '', '/NotFoundAction.do', '2', '0', 'jbxxgl', null, '1', '2013-05-07 10:37:05', '0', null);
INSERT INTO t_s_ruler VALUES ('600', 'sbxxgl', '设备信息管理', '', '', '0', '0', 'sbxxgl', null, '1', '2012-09-07 01:59:42', '0', '6');
INSERT INTO t_s_ruler VALUES ('1328', 'sbxxglxx', '信息管理', '', '', '1', '0', 'sbxxgl', null, '1', '2012-09-07 02:06:26', '0', null);
INSERT INTO t_s_ruler VALUES ('1172', 'ggxxcx', '公共信息查询', '', '/ggxxcxAction.do', '2', '0', 'oabg', null, '0', '2011-05-23 08:16:12', '0', null);
INSERT INTO t_s_ruler VALUES ('1330', 'tzgl', '通知管理', '', '/*.do', '2', '0', 'xxglxx', null, '0', '2012-09-07 02:09:00', '0', null);
INSERT INTO t_s_ruler VALUES ('1331', 'baseInfo', '系统参数', '', '/baseInfoAction.do', '2', '0', 'xtglxx', null, '1', '2013-03-25 14:37:45', '0', null);
INSERT INTO t_s_ruler VALUES ('1332', 'location', 'GIS信息管理', '', '/locationAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-03-26 18:27:55', '0', null);
INSERT INTO t_s_ruler VALUES ('1333', 'sbgl', '设备管理', '', '', '1', '0', 'sbxxgl', null, '1', '2013-03-27 15:02:45', '0', null);
INSERT INTO t_s_ruler VALUES ('1334', 'cameraInfo', '摄像头信息管理', '', '/cameraInfoAction.do', '2', '0', 'sbgl', null, '1', '2013-03-27 15:04:05', '0', null);
INSERT INTO t_s_ruler VALUES ('1335', 'nvr', 'NVR管理', '', '/nvrAction.do', '2', '0', 'sbgl', null, '1', '2013-03-28 11:13:00', '0', null);
INSERT INTO t_s_ruler VALUES ('1000', 'znpz', '智能配置', '', '', '0', '0', 'znpz', null, '0', '2013-03-29 11:42:43', '0', '');
INSERT INTO t_s_ruler VALUES ('1337', 'znfp', '智能分配', '', '', '1', '0', 'znpz', null, '1', '2013-03-29 11:43:40', '0', null);
INSERT INTO t_s_ruler VALUES ('1338', 'znpzxx', '智能配置', '', '', '1', '0', 'znpz', null, '0', '2013-03-29 11:44:02', '0', null);
INSERT INTO t_s_ruler VALUES ('1339', 'znfpCamera2Analy', '分配摄像头到分析服务器', '', '/fpCamera2AnalyAction.do', '2', '0', 'sbgl', null, '1', '2013-03-29 11:46:45', '0', null);
INSERT INTO t_s_ruler VALUES ('1340', 'znfpCamera2Nvr', '分配摄像头到Nvr', '', '/fpCamera2NvrAction.do', '2', '0', 'sbgl', null, '1', '2013-03-29 11:46:57', '0', null);
INSERT INTO t_s_ruler VALUES ('1341', 'cameraDecEvent', '摄像头检测事件配置', '', '/DecEventAction.do', '2', '1', 'sbxxglxx', null, '1', '2013-03-29 11:47:50', '0', null);
INSERT INTO t_s_ruler VALUES ('1342', 'cameraDecTimestamp', '时间段配置', '', '/DecTimestampAction.do', '2', '1', 'sbxxglxx', null, '1', '2013-03-29 11:48:03', '0', null);
INSERT INTO t_s_ruler VALUES ('1343', 'cameraDecParam', '参数配置', '', '/DecParamAction.do', '2', '1', 'sbxxglxx', null, '1', '2013-03-29 11:48:26', '0', null);
INSERT INTO t_s_ruler VALUES ('200', 'jcbk', '稽查布控', '', '', '0', '0', 'jcbk', null, '0', '2013-05-07 10:49:50', '0', '2');
INSERT INTO t_s_ruler VALUES ('110', 'backUpData', '数据库备份与恢复', '', '/dataMgrAction.do', '2', '0', 'xtglxx', null, '1', '2013-03-29 13:32:48', '0', null);
INSERT INTO t_s_ruler VALUES ('1346', 'eventType', '事件类型', '', '/eventTypeAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-03-29 13:49:41', '0', null);
INSERT INTO t_s_ruler VALUES ('1347', 'eventTypeProperty', '事件类型子属性', '', '/eventTypePropAction.do', '2', '1', 'sbxxglxx', null, '1', '2013-03-29 13:50:26', '0', null);
INSERT INTO t_s_ruler VALUES ('1348', 'eventTableMgr', '事件表管理', '', '/eventTableManagerAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-03-29 13:51:39', '0', null);
INSERT INTO t_s_ruler VALUES ('1349', 'analyServer', '分析服务器管理', '', '/analyServerAction.do', '2', '0', 'sbgl', null, '1', '2013-03-29 13:53:00', '0', null);
INSERT INTO t_s_ruler VALUES ('1350', 'areaset', '区域配置', '', '/areasetAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-03-29 13:54:36', '0', null);
INSERT INTO t_s_ruler VALUES ('400', 'znxs', '视频监控', '', '', '0', '0', 'znxs', null, '0', '2013-03-29 13:56:02', '0', '3');
INSERT INTO t_s_ruler VALUES ('1352', 'xczb', '监控分析', '', '', '1', '0', 'znxs', null, '1', '2013-03-29 13:57:14', '0', null);
INSERT INTO t_s_ruler VALUES ('1353', 'nksbfb', '鸟瞰设备分布', '', '', '1', '0', 'sbxxgl', null, '1', '2013-03-29 13:57:52', '0', null);
INSERT INTO t_s_ruler VALUES ('1354', 'carTrack', '车辆追踪', '', '', '1', '0', 'znxs', null, '1', '2013-03-29 14:06:35', '0', null);
INSERT INTO t_s_ruler VALUES ('1355', 'mapVideo', '地图俯瞰点播', '', '/mapVideoAction.do', '2', '0', 'xczb', null, '1', '2013-03-29 14:08:31', '0', null);
INSERT INTO t_s_ruler VALUES ('1356', 'wallVideo', '视频墙', '', '/wallVideoAction.do', '2', '0', 'xczb', null, '1', '2013-03-29 14:09:02', '0', null);
INSERT INTO t_s_ruler VALUES ('1357', 'cameraDistribution', '查看摄像头分布(Map)', '', '/cameraDistAction.do', '2', '0', 'nksbfb', null, '1', '2013-03-29 14:26:20', '0', null);
INSERT INTO t_s_ruler VALUES ('1358', 'analySerDistribution', '查看分析服务器分布(Map)', '', '/analyServerDistAction.do', '2', '0', 'nksbfb', null, '1', '2013-03-29 14:27:12', '0', null);
INSERT INTO t_s_ruler VALUES ('1359', 'nvrDistribution', '查看NVR分布(Map)', '', '/nvrDistAction.do', '2', '0', 'nksbfb', null, '1', '2013-03-29 14:27:34', '0', null);
INSERT INTO t_s_ruler VALUES ('1360', 'allDevDistribution', '查看所有设备分布(Map)', '', '/allDevDistAction.do', '2', '0', 'nksbfb', null, '1', '2013-03-29 14:28:12', '0', null);
INSERT INTO t_s_ruler VALUES ('900', 'tjfx', '统计分析', '', '', '0', '0', 'tjfx', null, '1', '2013-03-29 14:28:34', '0', '15');
INSERT INTO t_s_ruler VALUES ('905', 'tjfxxx', '统计分析', '', '', '1', '0', 'tjfx', null, '1', '2013-03-29 14:32:09', '0', null);
INSERT INTO t_s_ruler VALUES ('913', 'yearReport', '交通-年报表', '', '/yearReportAction.do', '2', '0', 'tjfxxx', null, '1', '2013-03-29 14:32:35', '0', null);
INSERT INTO t_s_ruler VALUES ('912', 'monthReport', '交通-月报表', '', '/monthReportAction.do', '2', '0', 'tjfxxx', null, '1', '2013-03-29 14:32:52', '0', null);
INSERT INTO t_s_ruler VALUES ('1365', 'eventReport', '综合统计报表', '', '/eventReportAction.do', '2', '1', 'tjfxxx', null, '1', '2013-03-29 14:46:40', '0', null);
INSERT INTO t_s_ruler VALUES ('1366', 'intelligentShow', '显示分析', '', '/intelligentShowAction.do', '2', '0', 'xczb', null, '1', '2013-03-29 15:36:32', '0', null);
INSERT INTO t_s_ruler VALUES ('1100', 'cloud', '云计算分析中心', '', '', '0', '0', 'cloud', null, '0', '2013-03-30 18:32:13', '', '13');
INSERT INTO t_s_ruler VALUES ('1368', 'eventType', '事件类型', '', '/eventTypeAction.do', '2', '0', 'xxglxx', null, '0', '2013-04-07 11:21:16', '0', null);
INSERT INTO t_s_ruler VALUES ('1369', 'eventTypeProp', '事件类型子属性', '', '/eventTypePropAction.do', '2', '0', 'xxglxx', null, '0', '2013-04-07 11:24:06', '0', null);
INSERT INTO t_s_ruler VALUES ('1370', 'eventTableManager', '事件表管理', '', '/eventTableManagerAction.do', '2', '0', 'xxglxx', null, '0', '2013-04-07 11:25:23', '0', null);
INSERT INTO t_s_ruler VALUES ('1371', 'camera_event', '交通事件', '', '/camera_eventAction.do', '2', '0', 'web_one_one', null, '1', '2013-04-08 14:53:28', '0', null);
INSERT INTO t_s_ruler VALUES ('1400', 'web_one', 'WEB1.0系统', '', '', '0', '0', 'web_one', null, '1', '2013-04-09 15:26:12', '0', '12');
INSERT INTO t_s_ruler VALUES ('1401', 'web_one_one', 'WEB1.0系统', '', '', '1', '0', 'web_one', null, '1', '2013-04-09 15:28:48', '0', null);
INSERT INTO t_s_ruler VALUES ('1374', 'monitor_event', '消防事件', '', '/monitor_eventAction.do', '2', '0', 'web_one_one', null, '1', '2013-04-09 17:25:15', '0', null);
INSERT INTO t_s_ruler VALUES ('1375', 'web_one_cameraInfo', '摄像头信息管理', '', '/web_one_cameraInfoAction.do', '2', '0', 'web_one_one', null, '1', '2013-04-12 13:25:15', '0', null);
INSERT INTO t_s_ruler VALUES ('1376', 'web_one_headServer', '分析服务器管理', '', '/web_one_headServerAction.do', '2', '0', 'web_one_one', null, '1', '2013-04-12 13:26:52', '0', null);
INSERT INTO t_s_ruler VALUES ('1377', 'web_one_znxs', '智能显示', '', '/web_one_znxsAction.do', '2', '0', 'web_one_one', null, '1', '2013-04-17 18:16:01', '0', null);
INSERT INTO t_s_ruler VALUES ('1378', 'ggfj', '公共附件管理', '', '/ggfjAction.do', '2', '0', 'jbxxgl', null, '1', '2013-04-25 15:52:54', '0', null);
INSERT INTO t_s_ruler VALUES ('204', 'blacklist', '黑名单管理', '', '/blackListAction.do', '2', '0', 'jcbkxx', null, '1', '2013-04-25 17:01:06', '0', null);
INSERT INTO t_s_ruler VALUES ('1380', 'eventTypeTitle', '事件表字段管理', '', '/eventTypeTitleAction.do', '2', '0', 'xtglxx', null, '1', '2013-04-26 16:22:58', '0', null);
INSERT INTO t_s_ruler VALUES ('1381', 'vehicleTrack', '车辆追踪[GIS]', '', '/vehicleTrackAction.do', '2', '0', 'carTrack', null, '1', '2013-04-28 10:44:45', '0', null);
INSERT INTO t_s_ruler VALUES ('1382', 'dzjc', '交通事件统计', '', '/trafficviolAtion.do', '2', '1', 'tjfxxx', null, '1', '2013-05-02 11:59:08', '0', null);
INSERT INTO t_s_ruler VALUES ('911', 'jtsjforday', '交通-日报表', '', '/dayReportAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-06 15:20:58', '0', null);
INSERT INTO t_s_ruler VALUES ('1383', 'jtsjtj', '交通事件统计', '', '', '1', '1', 'tjfx', null, '1', '2013-05-06 15:16:49', '0', null);
INSERT INTO t_s_ruler VALUES ('201', 'jcbkxx', '稽查布控', '', '', '1', '0', 'jcbk', null, '1', '2013-05-07 10:54:32', '0', null);
INSERT INTO t_s_ruler VALUES ('203', 'whiteList', '白名单管理', '', '/whiteListAction.do', '2', '0', 'jcbkxx', null, '1', '2013-05-07 11:07:38', '0', null);
INSERT INTO t_s_ruler VALUES ('1502', 'wfsjgl', '违法数据修改', '', '/wfsjglAction.do', '2', '0', 'wfclgl', null, '1', '2013-05-07 11:46:01', '0', null);
INSERT INTO t_s_ruler VALUES ('1503', 'wfsjlr', '违法数据录入', '', '/NotFoundAction.do', '2', '1', 'wfclxx', null, '1', '2013-05-07 11:46:13', '0', null);
INSERT INTO t_s_ruler VALUES ('1504', 'wfclxx', '违法处理', '', '', '1', '0', 'wfcl', null, '1', '2013-05-07 11:46:50', '0', null);
INSERT INTO t_s_ruler VALUES ('1505', 'wfsjsh', '违法数据审核', '', '/NotFoundAction.do', '2', '1', 'wfclxx', null, '1', '2013-05-07 11:47:35', '0', null);
INSERT INTO t_s_ruler VALUES ('1506', 'wfsjxg', '违法数据修改', '', '/NotFoundAction.do', '2', '1', 'wfclxx', null, '1', '2013-05-07 11:50:13', '0', null);
INSERT INTO t_s_ruler VALUES ('1507', 'jtwfcx', '交通违法查询', '', '/jtwfcxAction.do', '2', '0', 'wfclgl', null, '1', '2013-05-07 11:50:42', '0', null);
INSERT INTO t_s_ruler VALUES ('1508', 'wfclblackList', '白名单违法统计', '', '/wfclblackListAction.do', '2', '0', 'wfclgl', null, '1', '2013-05-07 11:53:02', '0', null);
INSERT INTO t_s_ruler VALUES ('1536', 'taskmgr', '任务管理', '', '/NotFoundAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:30:22', '0', null);
INSERT INTO t_s_ruler VALUES ('1509', 'databaseDesp', '数据库设计', '', '/databaseAction.do', '2', '0', 'xtglxx', null, '1', '2013-05-07 12:24:06', '0', null);
INSERT INTO t_s_ruler VALUES ('1510', 'wfxxsh', '违法信息审核', '', '', '1', '0', 'wfcl', null, '1', '2013-05-07 12:41:14', '0', null);
INSERT INTO t_s_ruler VALUES ('1527', 'tptj', '套牌车辆违法统计', '', '/tptjAction.do', '2', '0', 'wfclgl', null, '1', '2013-05-07 14:09:05', '0', null);
INSERT INTO t_s_ruler VALUES ('1511', 'wfxxfs', '违法信息复审', '', '/wfxxfsAction.do', '2', '0', 'wfxxsh', null, '1', '2013-05-07 12:42:55', '0', null);
INSERT INTO t_s_ruler VALUES ('1512', 'wfxxzs', '违法信息终审', '', '/wfxxzsAction.do', '2', '0', 'wfxxsh', null, '1', '2013-05-07 12:43:09', '0', null);
INSERT INTO t_s_ruler VALUES ('1513', 'sctpfs', '删除图片复审', '', '/NotFoundAction.do', '2', '0', 'wfxxsh', null, '1', '2013-05-07 12:43:27', '0', null);
INSERT INTO t_s_ruler VALUES ('1514', 'wfxw', '违法行为设置', '', '/wfxwAction.do', '2', '0', 'wfclxx', null, '1', '2013-05-07 12:44:51', '0', null);
INSERT INTO t_s_ruler VALUES ('700', 'llzk', '流量状况', '', '', '0', '0', 'llzk', null, '0', '2013-05-07 12:59:40', '0', null);
INSERT INTO t_s_ruler VALUES ('701', 'llzkxx', '流量状况', '', '', '1', '0', 'llzk', null, '1', '2013-05-07 13:00:04', '0', null);
INSERT INTO t_s_ruler VALUES ('1517', 'car-day', '车流量-日报表', '', '/carDayReportAction.do', '2', '0', 'llzkxx', null, '1', '2013-05-07 13:01:07', '0', null);
INSERT INTO t_s_ruler VALUES ('1518', 'car-month', '车流量-月报表', '', '/carMonthReportAction.do', '2', '0', 'llzkxx', null, '1', '2013-05-07 13:01:19', '0', null);
INSERT INTO t_s_ruler VALUES ('1519', 'car-year', '车流量-年报表', '', '/carYearReportAction.do', '2', '0', 'llzkxx', null, '1', '2013-05-07 13:01:25', '0', null);
INSERT INTO t_s_ruler VALUES ('1520', 'car-timespan', '车流量-时段报表', '', '/carTimespanReportAction.do', '2', '0', 'llzkxx', null, '1', '2013-05-07 13:02:47', '0', null);
INSERT INTO t_s_ruler VALUES ('1522', 'realtime-fenxi', '实时分析', '', '/cloudAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 13:05:15', '0', null);
INSERT INTO t_s_ruler VALUES ('1523', 'history-play', '历史回放', '', '/NotFoundAction.do', '2', '0', 'xczb', null, '1', '2013-05-07 13:44:05', '0', null);
INSERT INTO t_s_ruler VALUES ('1524', 'jcbkType', '黑名单布控类别', '', '/jcbkTypeAction.do', '2', '0', 'jcbkxx', null, '1', '2013-05-07 13:48:06', '0', null);
INSERT INTO t_s_ruler VALUES ('1525', 'dzjcQuery', '通行记录查询', '', '/dzjcQueryAction.do', '2', '0', 'jcbkxx', null, '1', '2013-05-07 13:51:31', '0', null);
INSERT INTO t_s_ruler VALUES ('1526', 'clgjQuery', '车辆告警信息查询', '', '/clgjQueryAction.do', '2', '0', 'jcbkxx', null, '1', '2013-05-07 13:54:54', '0', null);
INSERT INTO t_s_ruler VALUES ('1528', 'imageSize', '图片尺寸', '', '/NotFoundAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-05-07 15:08:39', '0', null);
INSERT INTO t_s_ruler VALUES ('1529', 'logMgr', '日志管理', '', '', '1', '0', 'tjfx', null, '1', '2013-05-07 16:09:43', '0', null);
INSERT INTO t_s_ruler VALUES ('1530', 'userlog', '用户日志', '', '/userlogAction.do', '2', '0', 'logMgr', null, '1', '2013-05-07 16:10:14', '0', null);
INSERT INTO t_s_ruler VALUES ('1531', 'errorlog', '网页程序异常', '', '/errorlogAction.do', '2', '0', 'logMgr', null, '1', '2013-05-07 16:10:32', '0', null);
INSERT INTO t_s_ruler VALUES ('1532', 'syslog', '系统日志', '', '/NotFoundAction.do', '2', '0', 'logMgr', null, '1', '2013-05-07 16:10:48', '0', null);
INSERT INTO t_s_ruler VALUES ('1533', 'wfxwtj', '违法行为统计', '', '/wfxwtjAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-07 16:21:14', '0', null);
INSERT INTO t_s_ruler VALUES ('1534', 'deletepictj', '删除图片统计', '', '/NotFoundAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-07 16:21:29', '0', null);
INSERT INTO t_s_ruler VALUES ('915', 'timespantj', '时段统计报表', '', '/timeToTimeReportAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-07 16:22:25', '0', null);
INSERT INTO t_s_ruler VALUES ('1537', 'reportlist', '报表分析', '', '/statisticAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:30:41', '0', null);
INSERT INTO t_s_ruler VALUES ('1538', 'car-gis', '车辆GIS信息', '', '/vehicleTrackAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:31:06', '0', null);
INSERT INTO t_s_ruler VALUES ('1539', 'filemgr', '文件管理', '', '/NotFoundAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:31:21', '0', null);
INSERT INTO t_s_ruler VALUES ('1540', 'xfsjforday', '消防-日报表', '', '/xfsjfordayAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-17 09:57:04', '0', null);
INSERT INTO t_s_ruler VALUES ('1541', 'xfsjformonth', '消防-月报表', '', '/xfsjformonthAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-17 10:01:37', '0', null);
INSERT INTO t_s_ruler VALUES ('1543', 'xfsjfortimetotime', '消防时段报表', '', '/xfsjfortimetotimeAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-17 10:02:39', '0', null);
INSERT INTO t_s_ruler VALUES ('1542', 'xfsjforyear', '消防-年报表', '', '/xfsjforyearAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-17 10:05:10', '0', null);
INSERT INTO t_s_ruler VALUES ('1544', 'wfsjlr', '违法数据录入', '', '/wfsjlrAction.do', '2', '0', 'wfclxx', null, '1', '2013-05-22 11:58:09', '0', null);
INSERT INTO t_s_ruler VALUES ('1545', 'wfclgl', '违法数据管理', '', '', '1', '0', 'wfcl', null, '1', '2013-05-23 10:12:41', '0', null);
INSERT INTO t_s_ruler VALUES ('1546', 'yggzl', '员工工作量', '', '/yggzlAction.do', '2', '0', 'tjfxxx', null, '1', '2013-06-03 10:44:25', '0', null);
INSERT INTO t_s_ruler VALUES ('1547', 'watchedFolder', '监视列表', '', '/watchedFolderAction.do', '2', '0', 'cloudxx', null, '1', '2013-06-09 11:37:53', '0', null);
INSERT INTO t_s_ruler VALUES ('1548', 'wfclblack', '黑名单违法统计', '', '/wfclblackAction.do', '2', '0', 'wfclgl', null, '1', '2013-06-17 10:10:28', '0', null);

-- ----------------------------
-- Table structure for `t_s_server`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_server`;
CREATE TABLE `t_s_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_code` varchar(255) DEFAULT NULL COMMENT '分析服务器代码',
  `server_name` varchar(255) DEFAULT NULL COMMENT '分析服务器名称',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '分析服务器IP',
  `port` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `mapScaling` int(11) DEFAULT '13' COMMENT '地图缩放比例',
  `locationId` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_server
-- ----------------------------
INSERT INTO t_s_server VALUES ('1', '', null, null, null, null, null, null, null, '13', null, null, '2013-05-07 15:41:07');
INSERT INTO t_s_server VALUES ('9', 'server1', 'server(IP200)', '10.168.1.200', '8080', 'user', 'pass', '116.700656', '39.727025', '11', 'dl', '1', '2013-04-26 17:45:12');
INSERT INTO t_s_server VALUES ('10', 'server2', '电子警察', '10.168.1.28', '8080', 'user', 'pass', '116.260271', '39.905259', '11', 'dl', '1', '2013-06-19 09:54:52');
INSERT INTO t_s_server VALUES ('11', 'server3', '测试', '10.168.1.12', '8080', 'admin', 'admin', '116.318239', '40.041353', '19', 'dl', '1', '2013-06-19 09:40:55');
INSERT INTO t_s_server VALUES ('12', 'server4', '工控机', '10.168.1.47', '8080', 'user', 'pass', '116.237274', '39.907031', '13', 'dl', '1', '2013-06-17 17:10:24');
INSERT INTO t_s_server VALUES ('13', 'server5', '消防', '10.168.1.132', '8080', '123', '123', '116.47184', '39.958373', '13', 'dl', '1', '2013-06-19 09:40:44');

-- ----------------------------
-- Table structure for `t_s_sever_camera_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_sever_camera_config`;
CREATE TABLE `t_s_sever_camera_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_code` varchar(255) NOT NULL COMMENT '分析服务器代码',
  `clssId` int(11) NOT NULL,
  `event_code` varchar(255) NOT NULL COMMENT '事件代码',
  `status` int(11) NOT NULL,
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_sever_camera_config
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_trafficviolation`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_trafficviolation`;
CREATE TABLE `t_s_trafficviolation` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `violationCode` varchar(255) DEFAULT NULL COMMENT '交通违章code',
  `violationValue` varchar(255) DEFAULT NULL,
  `violationName` varchar(255) DEFAULT NULL,
  `act` varchar(255) DEFAULT NULL COMMENT '违法内容',
  `money` varchar(255) DEFAULT NULL COMMENT '罚款金额',
  `points` int(11) DEFAULT NULL COMMENT '扣分',
  `provision` varchar(255) DEFAULT NULL COMMENT '法律条文',
  `overdue` varchar(255) DEFAULT NULL COMMENT '滞纳金',
  `status` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_trafficviolation
-- ----------------------------
INSERT INTO t_s_trafficviolation VALUES ('1', 'YX', null, '压线', '机动车辆压线', '200', '2', '', '40', '1', '2013-06-17 17:34:52');
INSERT INTO t_s_trafficviolation VALUES ('2', 'NX', null, '逆行', '机动车逆向行驶', '300', '3', '', '50', '1', '2013-05-24 12:28:52');
INSERT INTO t_s_trafficviolation VALUES ('3', 'BD', null, '变道', '机动车违法变道', '100', '3', '', '60', '1', '2013-06-17 17:34:30');
INSERT INTO t_s_trafficviolation VALUES ('4', 'CHD', null, '闯红灯', '闯红灯', '300', '3', '', '70', '1', '2013-06-17 17:34:08');
INSERT INTO t_s_trafficviolation VALUES ('5', 'NORMAL', null, '正常行驶', '正常行驶', '0', '0', '', null, '1', '2013-05-29 14:11:16');
INSERT INTO t_s_trafficviolation VALUES ('6', 'TP', null, '套牌', '套牌车辆', '10000', '1', '', null, '1', '2013-06-18 11:09:07');
INSERT INTO t_s_trafficviolation VALUES ('7', '12', null, null, '12', '12', '12', '12', null, '0', '2013-05-29 14:09:18');

-- ----------------------------
-- Table structure for `t_s_uploadfiles`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_uploadfiles`;
CREATE TABLE `t_s_uploadfiles` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `fileCode` char(255) DEFAULT NULL COMMENT '文件code',
  `fileName` char(255) DEFAULT NULL,
  `fileType` char(255) DEFAULT NULL COMMENT '文件类型，若是logo，则一律填写logo',
  `filePath` char(255) DEFAULT NULL,
  `ctTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `userCode` char(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=gbk COMMENT='记录上传文件';

-- ----------------------------
-- Records of t_s_uploadfiles
-- ----------------------------
INSERT INTO t_s_uploadfiles VALUES ('1', '1364466520355', 'logo', 'logo', '1364465990337', '2013-03-29 14:01:26', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('2', '1364522962941', 'logo', 'logo', '/logo/logo_201303290209180.jpg', '2013-03-29 13:35:24', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('3', '1364523284169', 'logo', 'logo', '/upload/logo/logo_201303290214370.jpg', '2013-03-29 13:38:09', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('4', '1364523476521', 'logo', 'logo', '/upload/logo/logo_201303290217490.jpg', '2013-03-29 13:38:07', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('5', '1364524454824', 'logo', 'logo', '/upload/logo/logo_201303290234130.jpg', '2013-03-29 13:38:05', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('6', '1364524614640', 'logo', 'logo', '/upload/logo/logo_201303290236490.jpg', '2013-03-29 13:38:03', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('7', '1364524945636', 'logo', 'logo', '/upload/logo/logo_201303290242140.jpg', '2013-03-29 13:38:01', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('8', '1364524963342', 'logo', 'logo', '/upload/logo/logo_201303290242420.png', '2013-03-29 13:37:56', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('9', '1364525015449', 'logo', 'logo', '/upload/logo/logo_201303290243340.jpg', '2013-03-29 13:37:52', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('10', '1364525025553', 'logo', 'logo', '/upload/logo/logo_201303290243440.png', '2013-03-29 13:37:50', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('11', '1364526117297', 'logo', 'logo', '/upload/logo/logo_201303290301460.png', '2013-03-29 13:37:49', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('12', '1364530837489', 'logo', 'logo', '/upload/logo/logo_201303291011420.jpg', '2013-04-01 15:07:20', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('13', '1364530848477', 'logo', 'logo', '/upload/logo/logo_201303290420470.png', '2013-03-29 13:39:11', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('14', '1364531094778', 'logo', 'logo', '/logo/logo_201303290424500.png', '2013-03-29 13:37:41', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('15', '1364534203336', 'logo', 'logo', '/upload/logo/logo_201303290516410.png', '2013-03-29 13:37:46', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('16', '1364535516780', 'logo', 'logo', '/upload/logo/logo_201303290538350.png', '2013-03-29 05:38:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('17', '1364535618004', 'logo', 'logo', '/upload/logo/logo_201303290539360.jpg', '2013-03-29 05:40:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('18', '1364551911817', 'logo', 'logo', '/upload/logo/logo_201303291011420.jpg', '2013-03-29 10:11:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('19', '1364552342873', 'logo', 'logo', '/upload/logo/logo_201303291011420.jpg', '2013-04-01 15:06:38', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('20', '1364797715040', 'logo', 'logo', '/upload/logo/logo_201303290242140.jpg', '2013-04-01 15:11:09', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('21', '1364801506718', 'logo', 'logo', '/upload/logo/logo_201304011531430.jpg', '2013-04-01 15:31:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('22', '1364801650182', 'logo', 'logo', '/upload/logo/logo_201304010734080.jpg', '2013-04-01 07:34:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('23', '1364801848384', 'logo', 'logo', '/upload/logo/logo_201304010737260.jpg', '2013-04-01 07:37:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('24', '1364801874671', 'logo', 'logo', '/upload/logo/logo_201304010737430.jpg', '2013-04-01 07:37:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('25', '1364802928556', 'logo', 'logo', '/upload/logo/logo_201304010755240.jpg', '2013-04-01 07:55:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('26', '1364805017379', 'logo', 'logo', '/upload/logo/logo_201304010830150.png', '2013-04-01 08:30:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('27', '1364805030466', 'logo', 'logo', '/upload/logo/logo_201304010830280.jpg', '2013-04-01 08:30:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('28', '1364805136618', 'logo', 'logo', '/upload/logo/logo_201304010832150.png', '2013-04-01 08:32:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('29', '1364805198732', 'logo', 'logo', '/upload/logo/logo_201304010833170.jpg', '2013-04-01 08:33:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('30', '1364805295705', 'logo', 'logo', '/upload/logo/logo_201304010834540.png', '2013-04-01 08:34:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('31', '1364805342910', 'logo', 'logo', '/upload/logo/logo_201304010835380.jpg', '2013-04-01 16:35:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('32', '1364805393358', 'logo', 'logo', '/upload/logo/logo_201304010836220.png', '2013-04-01 16:36:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('33', '1364805888104', 'logo', 'logo', '/upload/logo/logo_201304010844420.png', '2013-04-01 16:44:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('34', '1364808655270', 'logo', 'logo', '/upload/logo/logo_201304011730510.jpg', '2013-04-01 17:30:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('35', '1364881687537', 'logo', 'logo', '/upload/logo/logo_201304021347580.png', '2013-04-02 13:48:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('36', '1364884824711', 'logo', 'logo', '/upload/logo/logo_201304020640150.jpg', '2013-04-02 06:40:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('37', '1364884839977', 'logo', 'logo', '/upload/logo/logo_201304020640370.jpg', '2013-04-02 06:40:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('38', '1364895478292', 'logo', 'logo', '/upload/logo/logo_201304021737520.png', '2013-04-02 17:37:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('39', '1366854501250', 'logo', 'logo', '/upload/logo/logo_201304250948190.png', '2013-04-25 09:48:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('40', '1366854611278', 'logo', 'logo', '/upload/logo/logo_201304250949540.jpg', '2013-04-25 09:50:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('41', '1366860873562', 'logo', 'logo', '', '2013-04-25 11:34:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('42', '1366860888323', 'logo', 'logo', '/upload/logo/logo_201304251134440.png', '2013-04-25 11:34:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('43', '1367889580236', 'logo', 'logo', '/upload/logo/logo_201305070919120.ico', '2013-05-07 09:19:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('44', '1367889600798', 'logo', 'logo', '/upload/logo/logo_201305070919590.png', '2013-05-07 09:20:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('45', '1367895962663', 'logo', 'logo', '/upload/logo/logo_201305071106010.png', '2013-05-07 11:06:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('46', '1367895981215', 'logo', 'logo', '/upload/logo/logo_201305071106200.png', '2013-05-07 11:06:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('47', '1375690319056', 'logo', 'logo', '/upload/logo/logo_201308051611570.jpg', '2013-08-05 16:11:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('48', '1375690499876', 'logo', 'logo', '/upload/logo/logo_201308051614580.jpg', '2013-08-05 16:14:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('49', '1375690717184', 'logo', 'logo', '/upload/logo/logo_201308051618350.png', '2013-08-05 16:18:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('50', '1375690860096', 'logo', 'logo', '/upload/logo/logo_201308051620590.png', '2013-08-05 16:21:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('51', '1375691052710', 'logo', 'logo', '/upload/logo/logo_201308051624110.png', '2013-08-05 16:24:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('52', '1375691090634', 'logo', 'logo', '/upload/logo/logo_201308051624490.png', '2013-08-05 16:24:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('53', '1375691763900', 'logo', 'logo', '/upload/logo/logo_201308051636020.png', '2013-08-05 16:36:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('54', '1375691802744', 'logo', 'logo', '/upload/logo/logo_201308051636420.png', '2013-08-05 16:36:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('55', '1375691853740', 'logo', 'logo', '/upload/logo/logo_201308051637320.png', '2013-08-05 16:37:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('56', '1375858777746', 'logo', 'logo', '/upload/logo/logo_201308071459360.png', '2013-08-07 14:59:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('57', '1375860042674', 'logo', 'logo', '/upload/logo/logo_201308071520410.png', '2013-08-07 15:20:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('58', '1375860377404', 'logo', 'logo', '/upload/logo/logo_201308071525460.png', '2013-08-07 15:26:00', null, '1');

-- ----------------------------
-- Table structure for `t_s_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_userrole`;
CREATE TABLE `t_s_userrole` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_code` char(20) CHARACTER SET latin1 NOT NULL,
  `role_code` char(20) CHARACTER SET latin1 NOT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_userrole
-- ----------------------------
INSERT INTO t_s_userrole VALUES ('4', 'admin', 'xtgl', '2011-03-29 07:12:27', '1');
INSERT INTO t_s_userrole VALUES ('17', '007598', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('18', '01000x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('19', '007425', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('20', '007381', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('21', '007233', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('22', '007403', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('23', '007233', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('24', '014184', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('25', '014151', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('26', '014155', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('27', '007943', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('28', '007412', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('29', '108138', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('30', '108672', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('31', '110830', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('32', '110899', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('33', '007384', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('34', '01015x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('35', '014097', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('36', '109070', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('37', '015332', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('38', '007410', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('39', '108665', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('40', '007060', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('41', '109032', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('42', '007263', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('43', '007338', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('44', '007418', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('45', '007423', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('46', '014166', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('47', '014154', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('48', '01001x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('49', '007362', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('50', '007416', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('51', '007401', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('52', '006975', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('53', '007155', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('54', '007383', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('55', '007266', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('56', '007268', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('57', '007348', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('58', '007387', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('59', '013082', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('60', '006804', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('61', '014148', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('62', '014942', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('63', '007231', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('64', '007272', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('65', '109405', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('66', '109617', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('67', '01002x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('68', '007253', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('69', '006797', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('70', '007400', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('71', '007255', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('72', '007413', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('73', '007359', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('74', '109410', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('75', '007376', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('76', '007252', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('77', '007346', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('78', '007269', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('79', '007404', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('80', '007398', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('81', '007378', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('82', '007408', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('83', '007407', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('84', '007385', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('85', '007375', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('86', '007341', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('87', '007218', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('88', '007427', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('89', '007351', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('90', '014962', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('91', '108106', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('92', '109577', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('93', '008123', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('94', '109402', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('95', '007251', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('96', '007248', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('97', '110789', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('98', '007394', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('99', '007333', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('100', '109562', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('101', '007903', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('102', '006991', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('103', '007992', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('104', '108062', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('105', '109056', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('106', '109580', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('107', '014961', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('108', '109045', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('109', '110867', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('110', '110911', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('111', '110863', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('112', '110857', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('113', '110912', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('114', '110905', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('115', '110843', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('116', '110902', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('117', '110835', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('118', '108833', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('119', '01003x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('120', '01004x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('121', '01005x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('122', '01006x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('123', '01007x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('124', '01008x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('125', '01009x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('126', '007372', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('127', '007357', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('128', '109401', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('129', '108925', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('130', '109518', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('131', '109523', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('132', '109590', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('133', '109542', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('134', '109587', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('135', '110829', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('136', '110845', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('137', '110875', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('138', '110876', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('139', '110811', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('140', '007382', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('141', '007294', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('142', '007219', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('143', '007399', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('144', '007380', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('145', '108137', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('146', '108140', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('147', '108986', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('148', '007426', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('149', '007224', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('150', '00735', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('151', '014945', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('152', '014946', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('153', '007342', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('154', '109568', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('155', '007238', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('156', '008273', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('157', '007213', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('158', '007982', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('159', '008047', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('160', '109063', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('161', '109055', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('162', '110807', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('163', '110850', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('164', '110895', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('165', '110842', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('166', '109091', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('167', '007335', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('168', '007259', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('169', '007367', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('170', '014949', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('171', '108139', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('172', '108927', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('173', '110869', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('174', '014941', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('175', '110898', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('176', '110833', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('177', '108971', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('178', '110871', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('179', '108929', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('180', '109576', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('181', '015330', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('182', '007389', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('183', '007409', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('184', '007363', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('185', '007225', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('186', '007318', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('187', '007867', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('188', '007379', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('189', '109565', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('190', '098947', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('191', '109015', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('192', '109550', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('193', '007396', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('194', '007391', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('195', '007014', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('196', '109058', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('197', '108917', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('198', '109516', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('199', '109559', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('200', '109409', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('201', '007424', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('202', '01010x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('203', '108669', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('204', '109407', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('205', '110787', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('206', '110791', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('207', '110788', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('208', '110793', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('209', '110790', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('210', '110796', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('211', '110795', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('212', '110792', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('213', '110797', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('214', '110900', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('215', '110910', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('216', '138447', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('217', '138446', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('218', '01011x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('219', '01012x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('220', '01013x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('221', '01014x', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('222', '007293', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('223', '007011', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('224', '007226', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('225', '109552', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('226', '108975', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('227', '007395', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('228', '015331', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('229', '007312', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('230', '110801', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('231', '007276', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('232', '007355', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('233', '007802', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('234', '108067', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('235', '007393', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('236', '007368', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('237', '007365', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('238', '007369', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('239', '007256', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('240', '007267', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('241', '007370', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('242', '108951', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('243', '108920', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('244', '007366', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('245', '007917', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('246', '013077', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('247', '007275', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('248', '007009', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('249', '007339', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('250', '007904', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('251', '015329', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('252', '108963', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('253', '109106', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('254', '007806', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('255', '007244', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('256', '014943', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('257', '007388', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('258', '007358', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('259', '007373', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('260', '108136', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('261', '007345', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('262', '007428', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('263', '007344', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('264', '007246', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('265', '109026', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('266', '007281', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('267', '007386', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('268', '007361', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('269', '007392', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('270', '007211', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('271', '007332', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('272', '015487', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('273', '007390', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('274', '108876', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('275', '007377', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('276', '007277', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('277', '109612', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('278', '109606', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('279', '108830', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('280', '007360', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('281', '007347', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('282', '109522', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('283', '109578', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('284', '108989', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('285', '110892', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('286', '007314', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('287', '109519', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('288', '015489', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('289', '014161', 'ybyh', '2011-05-25 23:46:01', '1');
INSERT INTO t_s_userrole VALUES ('290', '110025', 'ybyh', '2011-05-31 13:13:12', '1');
INSERT INTO t_s_userrole VALUES ('291', '123456', 'ybyh', '2011-05-31 13:23:09', '1');
INSERT INTO t_s_userrole VALUES ('292', '0', 'ybyh', '2011-06-10 15:11:25', '1');
INSERT INTO t_s_userrole VALUES ('293', '1', 'ybyh', '2011-06-11 08:33:54', '1');
INSERT INTO t_s_userrole VALUES ('294', '2', 'ybyh', '2011-06-11 08:34:12', '1');
INSERT INTO t_s_userrole VALUES ('295', '3', 'ybyh', '2011-06-11 08:35:22', '1');
INSERT INTO t_s_userrole VALUES ('296', '100272', 'ybyh', '2011-06-21 11:26:49', '1');
INSERT INTO t_s_userrole VALUES ('297', '100273', 'ybyh', '2011-06-21 11:30:12', '1');
INSERT INTO t_s_userrole VALUES ('298', '100274', 'ybyh', '2011-06-21 11:32:01', '1');
INSERT INTO t_s_userrole VALUES ('299', '100275', 'ybyh', '2011-06-21 11:41:28', '1');
INSERT INTO t_s_userrole VALUES ('300', '100276', 'ybyh', '2011-06-21 12:48:17', '1');
INSERT INTO t_s_userrole VALUES ('301', '100277', 'ybyh', '2011-06-21 13:00:44', '1');
INSERT INTO t_s_userrole VALUES ('303', '100265', 'ybyh', '2011-07-07 09:08:55', '1');
INSERT INTO t_s_userrole VALUES ('304', '100266', 'ybyh', '2011-07-14 15:20:06', '1');
INSERT INTO t_s_userrole VALUES ('305', '100267', 'ybyh', '2011-07-14 15:27:09', '1');
INSERT INTO t_s_userrole VALUES ('306', '100268', 'ybyh', '2012-02-09 14:57:38', '1');
INSERT INTO t_s_userrole VALUES ('307', '100269', 'ybyh', '2012-02-24 16:18:14', '1');
INSERT INTO t_s_userrole VALUES ('308', '100270', 'ybyh', '2012-04-27 16:31:34', '1');
INSERT INTO t_s_userrole VALUES ('309', '100271', 'ybyh', '2012-05-09 16:23:49', '1');
INSERT INTO t_s_userrole VALUES ('314', '100272', 'ybyh', '2013-03-28 16:15:37', '1');
INSERT INTO t_s_userrole VALUES ('315', '100273', 'ybyh', '2013-03-28 16:21:17', '1');
INSERT INTO t_s_userrole VALUES ('316', '100274', 'ybyh', '2013-04-13 14:38:09', '1');
INSERT INTO t_s_userrole VALUES ('317', '100275', 'ybyh', '2013-04-13 14:49:39', '1');
INSERT INTO t_s_userrole VALUES ('318', '100276', 'ybyh', '2013-04-13 14:51:48', '1');
INSERT INTO t_s_userrole VALUES ('319', '100277', 'ybyh', '2013-04-13 14:58:34', '1');
INSERT INTO t_s_userrole VALUES ('320', '100278', 'ybyh', '2013-05-07 10:16:06', '1');
INSERT INTO t_s_userrole VALUES ('321', '100279', 'ybyh', '2013-05-07 10:23:59', '1');
INSERT INTO t_s_userrole VALUES ('322', '100280', 'ybyh', '2013-05-08 09:34:30', '1');
INSERT INTO t_s_userrole VALUES ('323', '100281', 'ybyh', '2013-05-19 21:09:49', '1');
INSERT INTO t_s_userrole VALUES ('324', '100282', 'ybyh', '2013-05-31 13:32:03', '1');
INSERT INTO t_s_userrole VALUES ('325', '100283', 'ybyh', '2013-06-18 14:20:33', '1');

-- ----------------------------
-- Table structure for `t_s_violationstype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_violationstype`;
CREATE TABLE `t_s_violationstype` (
  `id` varchar(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value` int(2) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_violationstype
-- ----------------------------
INSERT INTO t_s_violationstype VALUES ('1', 'CHD', null, '闯红灯', '2013-05-02 11:29:33', '1');
INSERT INTO t_s_violationstype VALUES ('2', 'NX', null, '逆行', '2013-05-02 11:29:52', '1');
INSERT INTO t_s_violationstype VALUES ('3', 'YX', null, '压线', '2013-05-02 11:30:08', '1');
INSERT INTO t_s_violationstype VALUES ('4', 'BD', null, '变道', '2013-05-02 11:30:17', '1');
INSERT INTO t_s_violationstype VALUES ('5', 'NORMAL', null, '正常行驶', '2013-05-09 11:06:33', '1');

-- ----------------------------
-- Table structure for `t_s_webshow`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_webshow`;
CREATE TABLE `t_s_webshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_webshow
-- ----------------------------
INSERT INTO t_s_webshow VALUES ('1', '0', '不显示');
INSERT INTO t_s_webshow VALUES ('2', '1', '显示');
INSERT INTO t_s_webshow VALUES ('3', '2', '查询条件');
INSERT INTO t_s_webshow VALUES ('4', '3', '查询条件[时间类型]');
INSERT INTO t_s_webshow VALUES ('5', '4', '查询条件[比较类型(如速度)]');
INSERT INTO t_s_webshow VALUES ('6', '5', '当titleCode为CLSSID');
INSERT INTO t_s_webshow VALUES ('7', '9', '图片的路径');

-- ----------------------------
-- Table structure for `t_s_whitelist`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_whitelist`;
CREATE TABLE `t_s_whitelist` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `status` int(10) DEFAULT '1' COMMENT 'status',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COMMENT='白名单管理';

-- ----------------------------
-- Records of t_s_whitelist
-- ----------------------------
INSERT INTO t_s_whitelist VALUES ('1', 'DD001警', 'bm', 'bm', 'black', 'black', '1', '2013-06-18 16:33:07');
INSERT INTO t_s_whitelist VALUES ('2', 'KR10459', 'bc', 'bc', 'green', 'black', '1', '2013-06-18 16:32:34');
INSERT INTO t_s_whitelist VALUES ('3', '京AP4559', 'bm', 'bm', 'black', 'black', '1', '2013-06-18 17:27:33');

-- ----------------------------
-- Table structure for `t_s_white_illegal`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_white_illegal`;
CREATE TABLE `t_s_white_illegal` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` varchar(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  `violations` varchar(64) DEFAULT NULL COMMENT '交通违规类型:闯红灯/逆行/压线/变道',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `status` int(10) DEFAULT '1' COMMENT 'status',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  `audit` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `auditer` varchar(255) DEFAULT NULL COMMENT '审核人',
  `audittime` varchar(255) DEFAULT NULL COMMENT '审核时间',
  `finaler` varchar(255) DEFAULT NULL COMMENT '终审人',
  `finaltime` varchar(255) DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=gbk COMMENT='交通违法事件';

-- ----------------------------
-- Records of t_s_white_illegal
-- ----------------------------
INSERT INTO t_s_white_illegal VALUES ('241', '27', '京AP4559', '1', 'TP', '50', 'bm', 'bm', 'blue', 'red', '1', '1', 'DH219/2013_05_30_10_12_28_0.jpg', '1', '1', '2013-05-30 10:36:27', '2013-04-17 16:54:57', '未审核', 'system', '2013-05-23 15:45:37', null, null);
INSERT INTO t_s_white_illegal VALUES ('242', '24', 'KR10459', '1', 'NX', '40', 'bc', 'bc', 'green', 'white', '1', '1', 'DH219/2013_05_30_10_12_30_0.jpg', '1', '1', '2013-06-18 17:36:51', '2013-05-02 09:55:27', '未审核', 'system', '2013-05-23 15:45:37', null, null);
INSERT INTO t_s_white_illegal VALUES ('243', '26', 'DD001警', '2', 'CHD', '30', 'dz', 'dz', 'white', 'white', '1', '1', 'DH219/2013_05_30_10_12_35_0.jpg', '1', '1', '2013-06-18 17:36:54', '2013-04-17 09:57:44', '未审核', 'system', '2013-05-23 15:45:37', null, null);

-- ----------------------------
-- Table structure for `t_u_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_person`;
CREATE TABLE `t_u_person` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jh` varchar(10) COLLATE gbk_bin DEFAULT NULL COMMENT '警号',
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '唯一编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户昵称',
  `passwd` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `real_name` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '用户真实姓名',
  `dept_code` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `xb` varchar(10) COLLATE gbk_bin DEFAULT NULL COMMENT '性别',
  `csrq` varchar(20) COLLATE gbk_bin DEFAULT NULL COMMENT '出生日期',
  `gzsj` varchar(20) COLLATE gbk_bin DEFAULT NULL COMMENT '工作时间',
  `zc` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '职称',
  `zw` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '职务',
  `gzzw` varchar(10) COLLATE gbk_bin DEFAULT '0' COMMENT '挂职职务',
  `sj` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '手机',
  `tel` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '电话',
  `mail` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `jtzz` varchar(200) COLLATE gbk_bin DEFAULT NULL,
  `status` int(10) DEFAULT '1' COMMENT '是否正常',
  `lrsj` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sfdl` varchar(10) COLLATE gbk_bin DEFAULT '0',
  `tupian` varchar(10) COLLATE gbk_bin DEFAULT '28',
  `role_code` varchar(10) COLLATE gbk_bin DEFAULT NULL COMMENT '最终岗位',
  `xl` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `yxsj_xs` varchar(20) COLLATE gbk_bin DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_u_person_idx1` (`jh`),
  KEY `t_u_perosn_idx2` (`user_code`,`dept_code`,`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100837 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_u_person
-- ----------------------------
INSERT INTO t_u_person VALUES ('1', 'admin', 'admin', '系统管理员', 'admin', null, 'bm0001', '男', '', '', '', 'xtgl', '0', '18653156061', '', '', '', '1', '2011-06-23 17:46:17', '0', '1', 'xtgl', null, '1');
INSERT INTO t_u_person VALUES ('2', 'karl', 'karl', 'Karl', 'karl', null, 'bm0001', '男', '2011-01-01', '2011-07-07', '', 'ybyh', '0', '18653156061', '', '', '', '1', '2011-07-07 09:08:55', '0', '28', 'ybyh', null, '1');
INSERT INTO t_u_person VALUES ('3', 'zzzx', 'zzzx', '管理中心', 'admin', null, 'bm0004', '女', '1970-07-06', '1989-05-01', '', 'jtkgq', '0', '15552570666', '', '', '', '0', '2011-07-14 15:20:06', '0', '28', 'jtkgq', null, '1');
INSERT INTO t_u_person VALUES ('4', 'xtxj', 'xtxj', '系统巡查', 'admin', null, 'bm0001', '男', '2012-02-24', '2012-02-24', '', 'xtxc', '0', '', '', '', '', '0', '2012-02-24 16:18:14', '0', '28', 'xtxc', '0', '1');
INSERT INTO t_u_person VALUES ('5', 'cs', 'cs', 'cs', '1', 'cs', 'bm0001', '男', '', '', '', 'Test', '0', '', '', '', '', '1', '2013-03-22 09:24:47', '0', '28', 'Test', null, '1');
INSERT INTO t_u_person VALUES ('100830', 'lijian', 'lijian', '李建', 'admin', null, 'bm0001', '男', '', '', '', 'ybyh', '0', '', '', '', '', '1', '2013-04-13 14:58:34', '0', '28', 'ybyh', null, '1');
INSERT INTO t_u_person VALUES ('100831', 'xf', 'xf', '消防', '1', null, 'bm0001', '女', '', '', '', 'xftdGroup', '0', '', '', '', '', '1', '2013-05-07 10:16:06', '0', '28', 'xftdGroup', null, '1');
INSERT INTO t_u_person VALUES ('100832', 'dj', 'dj', '电子警察', '1', null, 'bm0001', '男', '', '', '', 'dzjcGroup', '0', '', '', '', '', '0', '2013-05-07 10:23:59', '0', '28', 'dzjcGroup', null, '1');
INSERT INTO t_u_person VALUES ('100833', 'jt', 'jt', '交通', '1', null, 'bm0003', '男', '', '', '', 'dzjcGroup', '0', '', '', '', '', '1', '2013-05-08 09:34:30', '0', '28', 'dzjcGroup', null, '1');
INSERT INTO t_u_person VALUES ('100834', 'liu', 'liu', '刘总', '1', null, 'bm0001', '男', '', '', '', 'ybyh', '0', '', '', '', '', '1', '2013-05-19 21:09:49', '0', '28', 'ybyh', null, '1');
INSERT INTO t_u_person VALUES ('100835', 'helen', 'helen', 'helen', 'helen', null, 'bm0002', '女', '', '', '', 'dzjcGroup', '0', '', '', '', '', '1', '2013-05-31 13:32:03', '0', '28', 'dzjcGroup', null, '1');
INSERT INTO t_u_person VALUES ('100836', 'leo', 'leo', 'leo', '1', null, 'bm0003', '男', '', '', '', 'Test', '0', '', '', '', '', '1', '2013-06-18 14:20:33', '0', '28', 'Test', null, '1');

-- ----------------------------
-- Table structure for `t_u_person_ls`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_person_ls`;
CREATE TABLE `t_u_person_ls` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jh` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'qq号码',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户昵称',
  `passwd` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `real_name` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '用户真实姓名',
  `dept_code` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `xb` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `csrq` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `zc` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '职称',
  `zw` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '职务',
  `gzzw` varchar(10) COLLATE gbk_bin DEFAULT NULL COMMENT '挂职职务',
  `sj` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `tel` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '电话',
  `mail` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `jtzz` varchar(200) COLLATE gbk_bin DEFAULT NULL,
  `status` int(10) DEFAULT '1' COMMENT '是否正常',
  `lrsj` varchar(50) COLLATE gbk_bin DEFAULT 'CURRENT_TIMESTAMP',
  `sfdl` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `tupian` varchar(10) COLLATE gbk_bin DEFAULT NULL,
  `bgsj` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `biaozhi` varchar(200) COLLATE gbk_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_u_person_ls
-- ----------------------------
INSERT INTO t_u_person_ls VALUES ('165', 'zzzx', 'zzzx', '资助管理中心', null, null, 'bm0004', '女', '1970-07-06', '', 'jtkgq', '0', '15552570666', '', '', '', '0', '2011-07-14 15:20:06', '0', '28', '2012-09-07 01:05:18', '人员被注销');
INSERT INTO t_u_person_ls VALUES ('166', 'zzzx', 'zzzx', '资助管理中心', null, null, 'bm0004', '女', '1970-07-06', '', 'jtkgq', '0', '15552570666', '', '', '', '0', '2011-07-14 15:20:06', '0', '28', '2012-09-07 01:19:48', '人员被注销');
INSERT INTO t_u_person_ls VALUES ('167', 'xtxj', 'xtxj', '系统巡查', null, null, 'bm0001', '男', '2012-02-24', '', 'xtxc', '0', '123', '123', '123', '123', '0', '2012-02-24 16:18:14', '0', '28', '2012-09-07 01:20:42', '人员被注销');
INSERT INTO t_u_person_ls VALUES ('168', 'admin', 'admin', '系统管理员', null, null, 'bm0001', '男', '', '', 'ybyh', '0', '18653156061', '', '', '', '1', '2011-06-23 17:46:17', '0', '1', '2013-03-21 18:42:03', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('169', 'zzzx', 'zzzx', '资助管理中心', null, null, 'bm0004', '女', '1970-07-06', '', 'jtkgq', '0', '15552570666', '', '', '', '0', '2011-07-14 15:20:06', '0', '28', '2013-03-22 09:23:08', '人员被注销');
INSERT INTO t_u_person_ls VALUES ('170', 'cs', 'cs', 'cs', null, 'cs', 'bm0001', '男', '', '', 'Test', '0', '', '', '', '', '1', '2013-03-22 09:24:47', '0', '28', '2013-03-22 09:26:39', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('171', 'admin', 'admin', '系统管理员', null, null, 'bm0001', '男', '', '', 'xtgl', '0', '18653156061', '', '', '', '1', '2011-06-23 17:46:17', '0', '1', '2013-03-25 14:34:44', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('172', 'xf', 'xf', 'xf', null, null, 'bm0001', '女', '', '', 'xftdGroup', '0', '', '', '', '', '1', '2013-05-07 10:16:06', '0', '28', '2013-05-07 10:20:06', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('173', 'karl', 'karl', 'Karl', null, null, 'bm0001', '男', '2011-01-01', '', 'ybyh', '0', '18653156061', '', '', '', '1', '2011-07-07 09:08:55', '0', '28', '2013-05-07 14:13:54', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('174', 'helen', 'helen', 'helen', null, null, 'bm0002', '女', '', '', 'dzjcGroup', '0', '', '', '', '', '1', '2013-05-31 13:32:03', '0', '28', '2013-05-31 13:34:42', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('175', 'karl', 'karl', 'Karl', null, null, 'bm0001', '男', '2011-01-01', '', 'dzjcGroup', '0', '18653156061', '', '', '', '1', '2011-07-07 09:08:55', '0', '28', '2013-06-18 14:08:40', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('176', 'karl', 'karl', 'Karl', null, null, 'bm0001', '男', '2011-01-01', '', 'ybyh', '0', '18653156061', '', '', '', '1', '2011-07-07 09:08:55', '0', '28', '2013-06-18 14:08:50', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('177', 'helen', 'helen', 'helen', null, null, 'bm0002', '女', '', '', 'ybyh', '0', '', '', '', '', '1', '2013-05-31 13:32:03', '0', '28', '2013-06-18 14:09:06', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('178', 'helen', 'helen', 'helen', null, null, 'bm0002', '女', '', '', 'dzjcGroup', '0', '', '', '', '', '1', '2013-05-31 13:32:03', '0', '28', '2013-06-18 14:09:56', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('179', 'leo', 'leo', 'leo', null, null, 'bm0003', '男', '', '', 'Test', 'dzjcGroup', '', '', '', '', '1', '2013-06-18 14:20:33', '0', '28', '2013-06-18 14:33:52', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('180', 'leo', 'leo', 'leo', null, null, 'bm0003', '男', '', '', 'Test', 'dzjcGroup', '', '', '', '', '1', '2013-06-18 14:20:33', '0', '28', '2013-06-18 14:35:38', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('181', 'leo', 'leo', 'leo', null, null, 'bm0003', '男', '', '', 'Test', '0', '', '', '', '', '1', '2013-06-18 14:20:33', '0', '28', '2013-06-19 09:51:53', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('182', 'xtxj', 'xtxj', '系统巡查', null, null, 'bm0001', '男', '2012-02-24', '', 'xtxc', '0', '123', '123', '123', '123', '0', '2012-02-24 16:18:14', '0', '28', '2013-06-19 09:52:45', '人员被注销');
INSERT INTO t_u_person_ls VALUES ('183', 'xtxj', 'xtxj', '系统巡查', null, null, 'bm0001', '男', '2012-02-24', '', 'xtxc', '0', '123', '123', '123', '123', '0', '2012-02-24 16:18:14', '0', '28', '2013-06-19 09:52:53', '人员被注销');
INSERT INTO t_u_person_ls VALUES ('184', 'leo', 'leo', 'leo', null, null, 'bm0003', '男', '', '', 'Test', '0', '', '', '', '', '1', '2013-06-18 14:20:33', '0', '28', '2013-06-19 09:53:38', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('185', 'jt', 'jt', '交通', null, null, 'bm0003', '男', '', '', 'dzjcGroup', '0', '', '', '', '', '1', '2013-05-08 09:34:30', '0', '28', '2013-06-19 09:54:10', '修改人员信息');
INSERT INTO t_u_person_ls VALUES ('186', 'dj', 'dj', '电子警察', null, null, 'bm0001', '男', '', '', 'dzjcGroup', '0', '', '', '', '', '0', '2013-05-07 10:23:59', '0', '28', '2013-07-15 16:04:54', '人员被注销');

-- ----------------------------
-- Table structure for `usertab`
-- ----------------------------
DROP TABLE IF EXISTS `usertab`;
CREATE TABLE `usertab` (
  `UserID` int(4) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) NOT NULL,
  `UserPass` varchar(8) NOT NULL,
  `UserRight` int(4) DEFAULT '1',
  `UserPhone` varchar(15) DEFAULT NULL,
  `UserEMail` varchar(40) NOT NULL,
  `idCard` int(4) DEFAULT NULL COMMENT 'person id card',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertab
-- ----------------------------
INSERT INTO usertab VALUES ('1', 'admin', '', '1', '', 'dimier@163.com', '100');

-- ----------------------------
-- Table structure for `xftd_20130419_170521`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130419_170521`;
CREATE TABLE `xftd_20130419_170521` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `warnType` varchar(255) DEFAULT NULL COMMENT '告警类别，如堵塞、烟、火',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130419_170521
-- ----------------------------
INSERT INTO xftd_20130419_170521 VALUES ('1', '1', '1');
INSERT INTO xftd_20130419_170521 VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for `xftd_20130419_171910`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130419_171910`;
CREATE TABLE `xftd_20130419_171910` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `warnType` varchar(255) DEFAULT NULL COMMENT '告警类别，如堵塞、烟、火',
  `startTime` timestamp NULL DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130419_171910
-- ----------------------------
INSERT INTO xftd_20130419_171910 VALUES ('1', '2', '3', null, null);
INSERT INTO xftd_20130419_171910 VALUES ('3', '2', '1', null, null);

-- ----------------------------
-- Table structure for `xftd_20130422_141509`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130422_141509`;
CREATE TABLE `xftd_20130422_141509` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `warnType` varchar(255) DEFAULT NULL COMMENT '告警类别，如堵塞、烟、火',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130422_141509
-- ----------------------------
INSERT INTO xftd_20130422_141509 VALUES ('1', '2', '3');
INSERT INTO xftd_20130422_141509 VALUES ('3', '2', '1');

-- ----------------------------
-- Table structure for `xftd_20130422_172421`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130422_172421`;
CREATE TABLE `xftd_20130422_172421` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(255) DEFAULT NULL,
  `violations` varchar(100) DEFAULT NULL,
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT 'shotPic',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '检测时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  `absTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130422_172421
-- ----------------------------
INSERT INTO xftd_20130422_172421 VALUES ('1', '2', 'ZS', '2', '4', '5', '2013-04-22 19:04:17', '2013-04-22 19:04:22', '1', '2013-05-17 09:21:49');
INSERT INTO xftd_20130422_172421 VALUES ('7', '2', 'NY', '6', '4', '3', '2013-04-23 09:39:46', '2013-04-23 09:39:57', '1', '2013-05-17 07:21:55');

-- ----------------------------
-- Table structure for `xftd_20130614_105440`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130614_105440`;
CREATE TABLE `xftd_20130614_105440` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130614_105440
-- ----------------------------

-- ----------------------------
-- Table structure for `xftd_20130614_111753`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130614_111753`;
CREATE TABLE `xftd_20130614_111753` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130614_111753
-- ----------------------------

-- ----------------------------
-- Table structure for `xftd_20130614_112030`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130614_112030`;
CREATE TABLE `xftd_20130614_112030` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130614_112030
-- ----------------------------

-- ----------------------------
-- Table structure for `xftd_20130614_112116`
-- ----------------------------
DROP TABLE IF EXISTS `xftd_20130614_112116`;
CREATE TABLE `xftd_20130614_112116` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xftd_20130614_112116
-- ----------------------------

-- ----------------------------
-- Table structure for `xinlang_xftd_20130614_121618`
-- ----------------------------
DROP TABLE IF EXISTS `xinlang_xftd_20130614_121618`;
CREATE TABLE `xinlang_xftd_20130614_121618` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `warnLevel` int(10) DEFAULT NULL COMMENT '告警级别',
  `eventDesp` varchar(255) DEFAULT NULL COMMENT '描述',
  `violations` varchar(64) DEFAULT NULL COMMENT '消防通道违规类型:阻塞/浓烟',
  `absTime` timestamp NULL DEFAULT NULL COMMENT ' 绝对时间   ',
  `alarmPic` varchar(255) DEFAULT NULL COMMENT '截图',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始告警时间',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '检测时间',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='事件表  XFTD';

-- ----------------------------
-- Records of xinlang_xftd_20130614_121618
-- ----------------------------

-- ----------------------------
-- View structure for `t_s_baseinfoview`
-- ----------------------------
DROP VIEW IF EXISTS `t_s_baseinfoview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t_s_baseinfoview` AS select `a`.`id` AS `id`,`b`.`filePath` AS `logPath`,`a`.`mainTitle` AS `mainTitle`,`a`.`footerContent` AS `footerContent`,`a`.`work` AS `work`,`a`.`status` AS `status`,`a`.`ctTime` AS `ctTime` from (`t_s_baseinfo` `a` join `t_s_uploadfiles` `b`) where ((1 = 1) and (`a`.`logo` = `b`.`fileCode`));

-- ----------------------------
-- View structure for `t_s_trafficviol`
-- ----------------------------
DROP VIEW IF EXISTS `t_s_trafficviol`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t_s_trafficviol` AS select `dzjc_20130426_183246`.`violations` AS `violations`,substr(`dzjc_20130426_183246`.`absTime`,1,7) AS `substr(absTime,1,7)`,count(1) AS `count(1)`,avg(`dzjc_20130426_183246`.`speed`) AS `avg(speed)`,`dzjc_20130426_183246`.`CLSSID` AS `CLSSID` from `dzjc_20130426_183246` where (substr(`dzjc_20130426_183246`.`absTime`,1,4) = '2013') group by substr(`dzjc_20130426_183246`.`absTime`,1,7),`dzjc_20130426_183246`.`violations`,`dzjc_20130426_183246`.`CLSSID`;

-- ----------------------------
-- View structure for `view_camera`
-- ----------------------------
DROP VIEW IF EXISTS `view_camera`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_camera` AS select `c`.`id` AS `id`,`c`.`cameraId` AS `cameraId`,`c`.`name` AS `NAME`,`c`.`producer` AS `producer`,`l`.`locationName` AS `locationName`,`c`.`serverId` AS `serverId`,`c`.`nvrId` AS `nvrId`,`c`.`netAddress` AS `netAddress`,`c`.`netMask` AS `netMask`,`c`.`netGate` AS `netGate`,`c`.`port` AS `PORT`,`c`.`longitude` AS `longitude`,`c`.`latitude` AS `latitude`,`c`.`userName` AS `userName`,`c`.`passWord` AS `PASSWORD`,`c`.`ctTime` AS `ctTime` from (((`t_s_cameratable` `c` join `t_s_location` `l`) join `t_s_server` `s`) join `t_s_nvr` `n`) where ((1 = 1) and (`l`.`locationId` = `c`.`locationId`) and (`c`.`serverId` = `s`.`server_code`) and (`c`.`nvrId` = `n`.`nvr_code`));

-- ----------------------------
-- View structure for `view_cameradetail`
-- ----------------------------
DROP VIEW IF EXISTS `view_cameradetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_cameradetail` AS select `a`.`id` AS `id`,`a`.`cameraId` AS `cameraId`,`b`.`server_name` AS `server_name` from (`t_s_cameratable` `a` join `t_s_server` `b`) where ((1 = 1) and (`a`.`serverId` = `b`.`server_code`) and (`a`.`status` = 1));

-- ----------------------------
-- View structure for `view_camerainfo`
-- ----------------------------
DROP VIEW IF EXISTS `view_camerainfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_camerainfo` AS select `c`.`cameraId` AS `cameraId`,`l`.`locationName` AS `locationName`,`c`.`serverId` AS `serverId`,`c`.`nvrId` AS `nvrId`,`c`.`netAddress` AS `netAddress`,`c`.`netMask` AS `netMask`,`c`.`netGate` AS `netGate`,`c`.`port` AS `port`,`c`.`longitude` AS `longitude`,`c`.`latitude` AS `latitude`,`c`.`userName` AS `userName`,`c`.`passWord` AS `passWord`,`c`.`ctTime` AS `ctTime`,`c`.`mapScaling` AS `mapScaling`,`c`.`name` AS `name`,`c`.`producer` AS `producer` from (`t_s_cameratable` `c` join `t_s_location` `l`) where ((`c`.`id` = 31) and (`l`.`locationId` = `c`.`locationId`));

-- ----------------------------
-- View structure for `view_caminf`
-- ----------------------------
DROP VIEW IF EXISTS `view_caminf`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_caminf` AS select `a`.`server` AS `serverId`,`a`.`cameraID` AS `cameraID`,`b`.`locationName` AS `locationName`,`a`.`cameraName` AS `cameraName`,`a`.`netaddr` AS `netaddr`,`a`.`netmask` AS `netmask`,`a`.`port` AS `port`,`a`.`gate` AS `gate`,`a`.`adminuser` AS `adminuser`,`a`.`adminpass` AS `adminpass`,`a`.`nvrId` AS `nvrId`,`a`.`nvrChannel` AS `nvrChannel` from (`caminf` `a` join `t_s_location` `b`) where (`a`.`geoloc` = convert(`b`.`locationId` using utf8));

-- ----------------------------
-- View structure for `view_ggfj`
-- ----------------------------
DROP VIEW IF EXISTS `view_ggfj`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ggfj` AS select `a`.`id` AS `id`,`a`.`value` AS `value`,`a`.`path` AS `path`,`b`.`user_name` AS `person`,`a`.`sc_rq` AS `sc_rq`,`a`.`status` AS `status` from (`t_s_ggfj` `a` join `t_u_person` `b`) where ((1 = 1) and (convert(`a`.`person` using utf8) = `b`.`user_code`));

-- ----------------------------
-- View structure for `view_ruler_a`
-- ----------------------------
DROP VIEW IF EXISTS `view_ruler_a`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ruler_a` AS select `t_s_ruler`.`id` AS `id`,`t_s_ruler`.`ruler_code` AS `ruler_code`,`t_s_ruler`.`ruler_name` AS `ruler_name`,`t_s_ruler`.`ruler_desc` AS `ruler_desc`,`t_s_ruler`.`ruler_page` AS `ruler_page`,`t_s_ruler`.`ruler_level` AS `ruler_level`,`t_s_ruler`.`ruler_echo` AS `ruler_echo`,`t_s_ruler`.`ruler_manager` AS `ruler_manager`,`t_s_ruler`.`sffq` AS `sffq`,`t_s_ruler`.`status` AS `status`,`t_s_ruler`.`time` AS `time`,`t_s_ruler`.`target` AS `target`,`t_s_ruler`.`xuhao` AS `xuhao` from `t_s_ruler`;

-- ----------------------------
-- View structure for `view_ruler_b`
-- ----------------------------
DROP VIEW IF EXISTS `view_ruler_b`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ruler_b` AS select `t_s_ruler`.`id` AS `id`,`t_s_ruler`.`ruler_code` AS `ruler_code`,`t_s_ruler`.`ruler_name` AS `ruler_name`,`t_s_ruler`.`ruler_desc` AS `ruler_desc`,`t_s_ruler`.`ruler_page` AS `ruler_page`,`t_s_ruler`.`ruler_level` AS `ruler_level`,`t_s_ruler`.`ruler_echo` AS `ruler_echo`,`t_s_ruler`.`ruler_manager` AS `ruler_manager`,`t_s_ruler`.`sffq` AS `sffq`,`t_s_ruler`.`status` AS `status`,`t_s_ruler`.`time` AS `time`,`t_s_ruler`.`target` AS `target`,`t_s_ruler`.`xuhao` AS `xuhao` from `t_s_ruler`;

-- ----------------------------
-- View structure for `view_ruler_c`
-- ----------------------------
DROP VIEW IF EXISTS `view_ruler_c`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ruler_c` AS select `t_s_ruler`.`id` AS `id`,`t_s_ruler`.`ruler_code` AS `ruler_code`,`t_s_ruler`.`ruler_name` AS `ruler_name`,`t_s_ruler`.`ruler_desc` AS `ruler_desc`,`t_s_ruler`.`ruler_page` AS `ruler_page`,`t_s_ruler`.`ruler_level` AS `ruler_level`,`t_s_ruler`.`ruler_echo` AS `ruler_echo`,`t_s_ruler`.`ruler_manager` AS `ruler_manager`,`t_s_ruler`.`sffq` AS `sffq`,`t_s_ruler`.`status` AS `status`,`t_s_ruler`.`time` AS `time`,`t_s_ruler`.`target` AS `target`,`t_s_ruler`.`xuhao` AS `xuhao` from `t_s_ruler`;

-- ----------------------------
-- View structure for `view_tjfx`
-- ----------------------------
DROP VIEW IF EXISTS `view_tjfx`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_tjfx` AS select substr(`dzjc_20130426_183246`.`ctTime`,1,7) AS `substr(ctTime,1,7)`,count(0) AS `count(*)` from `dzjc_20130426_183246` group by substr(`dzjc_20130426_183246`.`ctTime`,1,7);

-- ----------------------------
-- View structure for `view_vehicletrack`
-- ----------------------------
DROP VIEW IF EXISTS `view_vehicletrack`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_vehicletrack` AS select `a`.`id` AS `id`,`a`.`CLSSID` AS `CLSSID`,`a`.`LPNumber` AS `LPNumber`,`b`.`longitude` AS `longitude`,`b`.`latitude` AS `latitude`,`a`.`absTime` AS `absTime`,`a`.`lane` AS `lane`,`a`.`violations` AS `violations`,`a`.`speed` AS `speed`,`a`.`modelCode` AS `modelCode`,`a`.`logoCode` AS `logoCode`,`a`.`carColor` AS `carColor`,`a`.`LPNColor` AS `LPNColor`,`a`.`LPNimage` AS `LPNimage`,`a`.`shortImageA` AS `shortImageA`,`a`.`shortImageB` AS `shortImageB`,`a`.`shortImageC` AS `shortImageC`,`a`.`status` AS `status`,`a`.`ctTime` AS `ctTime`,`a`.`exportFlag` AS `exportFlag` from (`dzjc_20130426_183246` `a` join `t_s_cameratable` `b`) where ((1 = 1) and (`a`.`CLSSID` = `b`.`id`)) order by `a`.`absTime`;

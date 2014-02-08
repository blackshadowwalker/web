/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.250
Source Server Version : 50155
Source Host           : 10.168.1.250:3306
Source Database       : gz_blacklist

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2014-01-28 10:52:32
*/

SET FOREIGN_KEY_CHECKS=0;
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
  `shortImageA` varchar(255) DEFAULT 'images/base/404largerversion.png' COMMENT '截图A',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `shortImageCom` varchar(255) NOT NULL DEFAULT '',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `absTime` timestamp NULL DEFAULT NULL,
  `exportFlag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425857 DEFAULT CHARSET=gbk COMMENT='事件表  DZJC';

-- ----------------------------
-- Records of dzjc_20130426_183246
-- ----------------------------
INSERT INTO dzjc_20130426_183246 VALUES ('1', '2', '', '1', 'bd', '0', '', '', '', '', '1', '', '', '', '', '/pic/HK145/2013_09_16/pic1/09_25_55_675_00015combo.jpg', '2013-09-16 09:25:55', '2013-10-11 17:23:30', '0');
INSERT INTO dzjc_20130426_183246 VALUES ('2', '2', '', '1', 'bd', '0', '', '', '', '', '1', '', '', '', '', '/pic/HK145/2013_09_16/pic1/09_27_16_112_00117combo.jpg', '2013-09-16 09:27:16', '2013-10-11 17:24:46', '0');
INSERT INTO dzjc_20130426_183246 VALUES ('3', '2', '', '2', 'bd', '0', '', '', '', '', '1', '', '', '', '', '/pic/HK145/2013_09_16/pic1/09_27_27_738_00129combo.jpg', '2013-09-16 09:27:27', '2013-10-11 17:24:48', '0');
INSERT INTO dzjc_20130426_183246 VALUES ('4', '2', '', '3', 'bd', '0', '', '', '', '', '1', '', '', '', '', '/pic/HK145/2013_09_16/pic1/09_28_24_136_00169combo.jpg', '2013-09-16 09:28:24', '2013-10-11 17:24:59', '0');
INSERT INTO dzjc_20130426_183246 VALUES ('5', '2', '', '3', 'bd', '0', '', '', '', '', '1', '', '', '', '', '/pic/HK145/2013_09_16/pic1/09_30_15_827_00287combo.jpg', '2013-09-16 09:30:15', '2013-10-11 17:25:30', '0');



-- ----------------------------
-- Table structure for `kk_20130508_165150`
-- ----------------------------
DROP TABLE IF EXISTS `kk_20130508_165150`;
CREATE TABLE `kk_20130508_165150` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CLSSID` int(20) DEFAULT NULL COMMENT '摄像头CLSSID',
  `LPNumber` varchar(20) DEFAULT NULL COMMENT '车牌',
  `dir` int(1) DEFAULT '0' COMMENT '车辆方向: 1进入, 0 外出',
  `absTime` timestamp NULL DEFAULT NULL,
  `location` varchar(512) CHARACTER SET utf8 DEFAULT '大门口2229',
  `speed` int(10) DEFAULT NULL COMMENT '速度',
  `modelCode` varchar(20) DEFAULT NULL COMMENT '车型代码',
  `logoCode` varchar(20) DEFAULT NULL COMMENT '车标代码',
  `LPNColor` varchar(20) DEFAULT NULL COMMENT '车牌颜色',
  `LPNimage` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `shortImageA` varchar(255) DEFAULT NULL COMMENT '截图A',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '检测时间',
  `carColor` varchar(20) DEFAULT NULL COMMENT '车颜色',
  `shortImageB` varchar(255) DEFAULT NULL COMMENT '截图B',
  `shortImageC` varchar(255) DEFAULT NULL COMMENT '截图C',
  `shortImageCom` varchar(255) DEFAULT '',
  `status` int(10) DEFAULT NULL COMMENT 'status',
  `lane` varchar(64) DEFAULT NULL COMMENT '车道',
  PRIMARY KEY (`id`,`ctTime`),
  UNIQUE KEY `id` (`id`),
  KEY `index_absTime` (`absTime`)
) ENGINE=InnoDB AUTO_INCREMENT=12342144 DEFAULT CHARSET=gbk COMMENT='事件表  KK';

-- ----------------------------
-- Records of kk_20130508_165150
-- ----------------------------
INSERT INTO kk_20130508_165150 VALUES ('11', '1', '京AB1234', '0', '2013-11-04 11:50:56', '大门口2229', '0', 'small', null, null, null, null, '2013-11-04 11:52:46', null, null, null, '', null, null);
INSERT INTO kk_20130508_165150 VALUES ('99', '1', '京K12345', '0', '2013-11-04 14:20:10', '大门口2229', null, null, null, null, null, null, '2013-11-04 14:20:21', null, null, null, '', null, null);
INSERT INTO kk_20130508_165150 VALUES ('123', '1', '京AB1234', '0', '2013-11-04 12:51:09', '大门口2229', null, null, null, null, null, null, '2013-11-04 12:51:16', null, null, null, '', null, null);
INSERT INTO kk_20130508_165150 VALUES ('1234', '1', '京AB1234', '0', '2013-11-04 14:12:35', '大门口2229', null, null, null, null, null, null, '2013-11-04 14:12:40', null, null, null, '', null, null);
INSERT INTO kk_20130508_165150 VALUES ('4455', '1', '京A534', '0', '2013-11-04 14:10:49', '大门口2229', null, null, null, null, null, null, '2013-11-04 14:10:54', null, null, null, '', null, null);
INSERT INTO kk_20130508_165150 VALUES ('57401', '2', '沪E83566', '0', '2013-10-18 11:06:33', '大门口2229', '0', 'small', '', 'blue_white', '/pic/HK145/2013_10_18/pic1/11_06_29_860_00454.jpg', '/pic/HK145/2013_10_18/pic1/11_06_29_860_00454a.jpg', '2013-10-18 11:06:29', 'black', '', '', '', '1', '0');
INSERT INTO kk_20130508_165150 VALUES ('57402', '2', '沪ER0198', '0', '2013-10-18 11:06:39', '大门口2229', '0', 'small', '', 'blue_white', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455a.jpg', '2013-10-18 11:06:34', 'black', '', '', '', '1', '0');
INSERT INTO kk_20130508_165150 VALUES ('57403', '2', '沪E83566', '0', '2013-10-18 11:06:49', '大门口2229', '0', 'small', '', 'blue_white', '/pic/HK145/2013_10_18/pic1/11_06_45_515_00456.jpg', '/pic/HK145/2013_10_18/pic1/11_06_45_515_00456a.jpg', '2013-10-18 11:06:45', 'gray', '', '', '', '1', '0');
INSERT INTO kk_20130508_165150 VALUES ('57404', '2', '沪ER0198', '0', '2013-10-18 11:06:55', '大门口2229', '0', 'small', '', 'blue_white', '/pic/HK145/2013_10_18/pic1/11_06_51_086_00457.jpg', '/pic/HK145/2013_10_18/pic1/11_06_51_086_00457a.jpg', '2013-10-18 11:06:51', 'gray', '', '', '', '1', '0');
INSERT INTO kk_20130508_165150 VALUES ('57405', '2', '沪E83566', '0', '2013-10-18 11:07:06', '大门口2229', '0', 'small', '', 'blue_white', '/pic/HK145/2013_10_18/pic1/11_07_02_622_00458.jpg', '/pic/HK145/2013_10_18/pic1/11_07_02_622_00458a.jpg', '2013-10-18 11:07:02', 'black', '', '', '', '1', '0');
INSERT INTO kk_20130508_165150 VALUES ('57406', '2', '沪FR0198', '0', '2013-10-18 11:07:09', '大门口2229', '0', 'small', '', 'blue_white', '/pic/HK145/2013_10_18/pic1/11_07_07_409_00459.jpg', '/pic/HK145/2013_10_18/pic1/11_07_07_409_00459a.jpg', '2013-10-18 11:07:07', 'white', '', '', '', '1', '0');

-- ----------------------------
-- Table structure for `total`
-- ----------------------------
DROP TABLE IF EXISTS `total`;
CREATE TABLE `total` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lpNumber` varchar(30) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `absTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1252 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of total
-- ----------------------------
INSERT INTO total VALUES ('1235', '京D12345', 'dl0101', '2013-11-12 17:38:10', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1236', '京D12345', 'dl0101', '2013-11-12 17:38:09', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1239', '京R59854', 'dl0101', '2013-11-12 17:38:07', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1240', '京R59854', 'dl0101', '2013-11-12 17:38:08', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1241', '京R59854', 'dl0101', '2013-11-12 17:38:06', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1242', '京R59852', 'dl0102', '2013-11-12 17:38:05', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1243', '京R59852', 'dl0102', '2013-11-12 17:38:04', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1244', '京R59852', 'dl0102', '2013-11-12 17:38:03', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1245', '京R59852', 'dl0102', '2013-11-12 17:38:02', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1246', '京R59852', 'dl0102', '2013-11-12 17:38:02', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1247', '京A5656', 'dl0102', '2013-11-12 17:38:01', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1249', '京A5656', 'dl0101', '2013-11-12 10:22:31', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1250', '京A5656', 'dl0101', '2013-11-12 11:32:17', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');
INSERT INTO total VALUES ('1251', '京R59852', 'dl0102', '2013-11-12 17:37:59', '/pic/HK145/2013_10_18/pic1/11_06_34_954_00455.jpg');

-- ----------------------------
-- Table structure for `t_m_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_baseinfo`;
CREATE TABLE `t_m_baseinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `defaultAuthName` varchar(255) DEFAULT NULL,
  `defaultAuthPwd` varchar(255) DEFAULT NULL,
  `defaultSoapUrl` varchar(255) DEFAULT NULL,
  `defaultTaskpriority` varchar(255) DEFAULT NULL,
  `uploadserver` varchar(255) DEFAULT NULL,
  `uploadflash` varchar(255) DEFAULT NULL,
  `uploadurl` varchar(255) DEFAULT NULL,
  `uploadpage` varchar(255) DEFAULT NULL,
  `uploadroot` varchar(255) DEFAULT NULL,
  `defaultuploadpath` varchar(255) DEFAULT NULL,
  `videoserver` varchar(255) DEFAULT NULL,
  `rpcwebroot` varchar(256) DEFAULT NULL,
  `work` int(1) DEFAULT '0',
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_baseinfo
-- ----------------------------
INSERT INTO t_m_baseinfo VALUES ('1', 'admin', 'resonate', 'http://10.168.1.160:8080/api/services/soap/', '3', 'http://10.168.1.160:8080', 'upload/swfupload/swfupload.swf', 'fileupload/upload.do?', 'fileupload/upload.jsp', 'D:/prod/_schlitterdevMediaRoot/HOME_admin', 'videos', 'http://10.168.1.160:81', '_schlitterdevMediaRoot/HOME_admin', '1', '2013-09-05 10:46:05', '1');

-- ----------------------------
-- Table structure for `t_m_case`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_case`;
CREATE TABLE `t_m_case` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caseName` varchar(128) DEFAULT NULL,
  `caseType` int(11) DEFAULT NULL,
  `caseNo` varchar(128) DEFAULT NULL,
  `receiptNo` varchar(128) DEFAULT NULL,
  `auser` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `caseTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `caseStatus` int(11) NOT NULL DEFAULT '0',
  `area` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_case
-- ----------------------------
INSERT INTO t_m_case VALUES ('1', '案件5263', '3', 'case1', '不知道', '不知道', '不知道', '2013-08-15 16:44:33', '0', '不知道', '不知道', '0');
INSERT INTO t_m_case VALUES ('2', '丢失车辆', '3', 'case2', '也不知', '也不知道', '也不知道', '2013-08-15 16:44:28', '0', '也不知道', '也不知道', '0');
INSERT INTO t_m_case VALUES ('3', '交通肇事02121', '4', 'case3', '还不知道', '还不知道', '还不知道', '2013-08-15 16:44:31', '0', '还不知道', '还不知道', '0');
INSERT INTO t_m_case VALUES ('5', '案件20130807', '3', 'case4', '123', 'admin', 'Root', '2013-08-06 10:45:56', '0', '1', '1', '1');
INSERT INTO t_m_case VALUES ('6', '车辆丢失', '5', 'case5', '034225', 'admin', 'XX总部', '2013-08-15 00:00:00', '0', '4323', '423223', '1');
INSERT INTO t_m_case VALUES ('7', '测试', '5', 'case6', '200', 'admin', 'XX总部', '2013-08-19 00:00:00', '0', '上地', '信息路', '1');

-- ----------------------------
-- Table structure for `t_m_casetype`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_casetype`;
CREATE TABLE `t_m_casetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_casetype
-- ----------------------------
INSERT INTO t_m_casetype VALUES ('1', '嫌疑', '0');
INSERT INTO t_m_casetype VALUES ('2', '特大嫌疑', '0');
INSERT INTO t_m_casetype VALUES ('3', '毁坏公物', '1');
INSERT INTO t_m_casetype VALUES ('4', '交通肇事', '1');
INSERT INTO t_m_casetype VALUES ('5', '盗窃', '1');
INSERT INTO t_m_casetype VALUES ('6', '遗失', '1');

-- ----------------------------
-- Table structure for `t_m_casevideos`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_casevideos`;
CREATE TABLE `t_m_casevideos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_code` varchar(255) NOT NULL COMMENT '案件编号',
  `video_code` varchar(255) NOT NULL COMMENT '视频编号',
  `status` int(10) NOT NULL DEFAULT '1',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_casevideos
-- ----------------------------
INSERT INTO t_m_casevideos VALUES ('1', 'case1', '32', '0', '2013-08-05 11:12:18');
INSERT INTO t_m_casevideos VALUES ('2', 'case2', '32', '0', '2013-08-05 11:15:15');
INSERT INTO t_m_casevideos VALUES ('65', 'case2', '132', '0', '2013-08-07 09:30:27');
INSERT INTO t_m_casevideos VALUES ('66', 'case2', '130', '0', '2013-08-07 09:53:12');
INSERT INTO t_m_casevideos VALUES ('67', 'case2', '131', '0', '2013-08-07 09:53:12');
INSERT INTO t_m_casevideos VALUES ('68', 'case2', '129', '0', '2013-08-07 09:53:12');

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
  `confidence` varchar(100) DEFAULT NULL,
  `posX` int(5) DEFAULT NULL,
  `posY` int(5) DEFAULT NULL,
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `picture` binary(255) DEFAULT NULL,
  `LPNpicture` binary(255) DEFAULT NULL,
  `LPNpicUrl` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `xycd` int(10) DEFAULT NULL COMMENT '嫌疑程度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123124 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_report
-- ----------------------------
INSERT INTO t_m_report VALUES ('1', '607', '京N5*Y22', '2013-07-16 10:04:28', '209', '8360000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15052', null, null, null, '2013-07-16 10:06:33', '1', null, '0');
INSERT INTO t_m_report VALUES ('2', '607', '京NC*332', '2013-07-16 10:04:28', '343', '13720000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15053', null, null, null, '2013-07-16 10:06:33', '1', null, '0');
INSERT INTO t_m_report VALUES ('3', '607', '', '2013-07-16 10:04:28', '389', '15560000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15054', null, null, null, '2013-07-16 10:06:33', '1', null, '0');
INSERT INTO t_m_report VALUES ('4', '607', '京L1*668', '2013-07-16 10:04:28', '441', '17640000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15055', null, null, null, '2013-07-16 10:06:33', '1', null, '0');
INSERT INTO t_m_report VALUES ('5', '607', '京BQ*910', '2013-07-16 10:04:28', '461', '18440000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15056', null, null, null, '2013-07-16 10:06:33', '1', null, '0');
INSERT INTO t_m_report VALUES ('6', '607', '京PE*021', '2013-07-16 10:04:28', '503', '20120000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15057', null, null, null, '2013-07-16 10:06:33', '1', null, '0');
INSERT INTO t_m_report VALUES ('7', '607', '京PP*793', '2013-07-16 10:04:28', '546', '21840000', '0.0', '0', '0', '0', '0', 'http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=15058', null, null, null, '2013-07-16 10:06:33', '1', null, '0');

-- ----------------------------
-- Table structure for `t_m_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_tasks`;
CREATE TABLE `t_m_tasks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taskID` int(10) DEFAULT NULL,
  `taskName` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locationId` varchar(255) DEFAULT 'dl',
  `inputVideoId` varchar(255) DEFAULT NULL,
  `outputVideoId` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT 'system',
  `ctTime` timestamp NULL DEFAULT NULL,
  `lastUpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_tasks
-- ----------------------------
INSERT INTO t_m_tasks VALUES ('1', '606', null, 'Processing', '', '1', '', 'system', '2013-07-16 09:49:04', '2013-07-16 09:49:04', '1');
INSERT INTO t_m_tasks VALUES ('2', '607', null, 'Completed', 'dl', '2', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin/admin_%7B0_0_20130716100445497%7D_ok.mp4', 'system', '2013-07-16 10:05:01', '2013-07-16 10:05:01', '1');
INSERT INTO t_m_tasks VALUES ('3', '609', null, 'Processing', '', '3', '', 'system', '2013-07-16 10:38:52', '2013-07-16 10:38:52', '1');
INSERT INTO t_m_tasks VALUES ('4', '613', null, 'Completed', 'dl', '6', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin/admin/%7B0_0_20130716104518807%7D.avi_out.mp4', 'system', '2013-07-16 10:45:24', '2013-07-16 10:45:24', '1');
INSERT INTO t_m_tasks VALUES ('5', '616', null, 'Processing', '', '7', '', 'system', '2013-07-16 10:49:17', '2013-07-16 10:49:17', '1');
INSERT INTO t_m_tasks VALUES ('6', '619', null, 'Completed', 'dl', '8', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin/videos/%7B0_0_20130716114730383%7D.avi_out.mp4', 'system', '2013-07-16 11:47:49', '2013-07-16 11:47:50', '1');


-- ----------------------------
-- Table structure for `t_m_videocomment`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_videocomment`;
CREATE TABLE `t_m_videocomment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `videoId` bigint(20) NOT NULL,
  `caseId` bigint(20) NOT NULL,
  `videoTime` float NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_videocomment
-- ----------------------------
INSERT INTO t_m_videocomment VALUES ('1', '142', '6', '22.9768', '可疑车辆', 'admin', '2013-08-20 14:01:24', '1');
INSERT INTO t_m_videocomment VALUES ('2', '142', '6', '36.0532', '又一个可疑的', 'admin', '2013-08-20 14:00:56', '1');
INSERT INTO t_m_videocomment VALUES ('3', '142', '6', '7.09', '京N56Y22', 'admin', '2013-08-27 10:39:19', '1');
INSERT INTO t_m_videocomment VALUES ('4', '142', '6', '1.19', '好吧\n', 'admin', '2013-08-20 18:04:47', '0');
INSERT INTO t_m_videocomment VALUES ('5', '142', '6', '80.19', '也没有', 'admin', '2013-08-20 18:03:04', '0');
INSERT INTO t_m_videocomment VALUES ('6', '142', '6', '7.78', '累死哥了', 'admin', '2013-08-21 10:13:05', '0');
INSERT INTO t_m_videocomment VALUES ('7', '142', '6', '21.17', '', 'admin', '2013-08-21 10:10:28', '0');

-- ----------------------------
-- Table structure for `t_m_videos`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_videos`;
CREATE TABLE `t_m_videos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '文件名',
  `value` varchar(255) DEFAULT NULL COMMENT '真实文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '/',
  `url` varchar(512) DEFAULT '' COMMENT '文件路径',
  `type` varchar(128) DEFAULT 'avi' COMMENT '文件类型，如avi,mp4',
  `absTime` timestamp NULL DEFAULT NULL COMMENT '视频绝对时间',
  `uploader` char(255) DEFAULT NULL COMMENT '上传者',
  `bAnalyzed` int(1) DEFAULT '0' COMMENT '是否已经分析过',
  `analyzer` varchar(64) DEFAULT NULL COMMENT '分析人',
  `analyzeTime` timestamp NULL DEFAULT NULL COMMENT '分析时间',
  `tableIndex` varchar(255) DEFAULT NULL COMMENT '表索引',
  `md5` varchar(255) DEFAULT NULL,
  `ctTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建/上传时间',
  `status` int(1) DEFAULT '1',
  `longitude` varchar(128) DEFAULT NULL COMMENT '经度',
  `latiTude` varchar(128) DEFAULT NULL COMMENT '纬度',
  `locationId` varchar(255) DEFAULT NULL,
  `watchfolderID` int(10) DEFAULT NULL COMMENT 'wathcfolderid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_m_videos
-- ----------------------------
INSERT INTO t_m_videos VALUES ('1', '6-长治现场视频_场景二.AVI', '{0_0_20130716094306887}.AVI', 'admin', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin', 'avi', '2013-07-16 09:36:15', 'admin', '1', 'admin', '2013-07-16 09:49:04', null, null, '2013-07-16 09:43:07', '1', null, null, 'dl', null);
INSERT INTO t_m_videos VALUES ('10', '224(5fb3).avi', '{0_0_20130716144107450}.avi', 'admin', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin', 'avi', '2013-07-16 14:40:16', 'admin', '1', 'admin', '2013-07-16 14:41:25', null, null, '2013-07-16 14:41:08', '1', null, null, 'dl', null);
INSERT INTO t_m_videos VALUES ('11', '224.avi', '{1_0_20130716144118260}.avi', 'admin', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin', 'avi', '2013-07-16 14:45:16', 'admin', '1', 'admin', '2013-07-16 14:41:25', null, null, '2013-07-16 14:41:20', '1', null, null, 'dl', null);
INSERT INTO t_m_videos VALUES ('12', '224.avi', '{0_0_20130716145556393}.avi', 'admin', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin', 'avi', '2013-07-16 14:52:26', 'admin', '1', 'admin', '2013-07-16 14:56:02', null, null, '2013-07-16 14:55:57', '1', null, null, 'dl01010101', null);
INSERT INTO t_m_videos VALUES ('30', '22430.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010101', null);
INSERT INTO t_m_videos VALUES ('31', '22431.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010102', null);
INSERT INTO t_m_videos VALUES ('32', '22432.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010103', null);
INSERT INTO t_m_videos VALUES ('33', '22433.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010104', null);
INSERT INTO t_m_videos VALUES ('34', '22434.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010105', null);
INSERT INTO t_m_videos VALUES ('35', '22435.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010106', null);
INSERT INTO t_m_videos VALUES ('36', '22436.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010107', null);
INSERT INTO t_m_videos VALUES ('37', '22437.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010108', null);
INSERT INTO t_m_videos VALUES ('38', '22438.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010109', null);
INSERT INTO t_m_videos VALUES ('39', '22439.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010110', null);
INSERT INTO t_m_videos VALUES ('40', '22440.avi', 'test.avi', '', '', 'avi', '2013-04-06 12:53:38', 'admin', '0', null, null, null, null, '2013-07-17 14:46:05', '1', null, null, 'dl0101010111', null);
INSERT INTO t_m_videos VALUES ('182', 'ITS测试视频20130905.avi', '{0_0_20130905105432121}.avi', 'videos', 'http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin', 'avi', '2013-09-05 10:54:12', 'admin', '1', 'admin', '2013-09-05 11:39:41', null, null, '2013-09-05 10:54:32', '1', null, null, 'dl0101010107', null);


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
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_baseinfo
-- ----------------------------
INSERT INTO t_s_baseinfo VALUES ('1', '1379912251884', '黑车统计分析系统', '<font color=\"#fa000a\">建议使用IE浏览器，分辨率在1024*768以上</font>', '1', '1', '2013-11-12 17:11:04', '0.9.8');
INSERT INTO t_s_baseinfo VALUES ('2', '1381395244041', '1', '1', '0', '1', '2013-10-10 16:54:10', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_cameratable
-- ----------------------------
INSERT INTO t_s_cameratable VALUES ('1', null, 'HK', 'HK143', 'camera1', 'dl0101', 'server5', 'nvr1', '10.168.1.143', '255.255.255.0', '10.168.1.1', '8000', 'admin', '12345', '116.317224', '40.04222', '16', null, '1', '2013-09-03 16:32:19');
INSERT INTO t_s_cameratable VALUES ('2', null, 'HK', 'HK145', 'camera2', 'dl', 'server5', 'nvr1', '10.168.1.145', '255.255.255.0', '10.168.1.1', '8000', 'admin', '12345', '116.317224', '40.04222', '11', null, '1', '2013-09-03 16:32:19');
INSERT INTO t_s_cameratable VALUES ('3', null, 'DH', 'DH113', 'camera3', 'dl', 'server5', 'nvr1', '10.168.1.113', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.310648', '40.022995', '15', null, '1', '2013-10-11 18:19:03');
INSERT INTO t_s_cameratable VALUES ('4', null, 'DH', 'DH115', 'camera4', 'dl010101', 'server5', 'nvr1', '10.168.1.115', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.321553', '40.024956', '17', null, '1', '2013-10-11 18:19:06');
INSERT INTO t_s_cameratable VALUES ('5', null, 'DH', 'DH111', 'camera5', 'dl', 'server5', 'nvr1', '10.168.1.111', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.321553', '40.024956', '11', null, '1', '2013-10-11 18:24:35');
INSERT INTO t_s_cameratable VALUES ('6', null, 'DH', 'DH112', 'camera6', 'dl', 'server5', 'nvr1', '10.168.1.112', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.321553', '40.04222', '11', null, '1', '2013-10-12 09:13:45');
INSERT INTO t_s_cameratable VALUES ('7', null, 'DH', 'DH214', 'camera7', 'dl', 'server5', 'nvr1', '10.168.1.214', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.310648', '40.04222', '11', null, '1', '2013-10-12 09:13:49');
INSERT INTO t_s_cameratable VALUES ('8', null, 'DH', 'DH211', 'camera8', 'dl', 'server5', 'nvr1', '10.168.1.211', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.317224', '40.04222', '11', null, '1', '2013-10-21 11:14:44');
INSERT INTO t_s_cameratable VALUES ('9', null, 'DH', 'DH213', 'camera9', 'dl', 'server5', 'nvr1', '10.168.1.213', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.310648', '40.022995', '11', null, '1', '2013-10-21 11:15:49');
INSERT INTO t_s_cameratable VALUES ('10', null, 'DH', 'DH219', 'camera10', 'dl0101', 'server5', 'nvr1', '10.168.1.219', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.321553', '40.04222', '11', null, '1', '2013-10-21 11:16:59');
INSERT INTO t_s_cameratable VALUES ('11', null, 'DH', 'DH220', 'camera11', 'dl0101', 'server5', 'nvr1', '10.168.1.220', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.310648', '40.024956', '11', null, '1', '2013-10-21 11:17:55');
INSERT INTO t_s_cameratable VALUES ('12', null, 'DH', 'DH212', 'camera12', 'dl010101', 'server5', 'nvr1', '10.168.1.212', '255.255.255.0', '10.168.1.1', '37777', 'admin', 'admin', '116.310648', '40.022995', '11', null, '1', '2013-10-21 11:19:21');

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
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO t_s_code VALUES ('75', 't_m_report.xycd', '0', '一般', null, '2013-08-01 15:40:48', '1', null);
INSERT INTO t_s_code VALUES ('76', 't_m_report.xycd', '1', '高', '', '2013-08-13 11:47:51', '1', null);
INSERT INTO t_s_code VALUES ('77', 't_m_report.xycd', '2', '很高', '', '2013-08-13 11:47:05', '1', null);
INSERT INTO t_s_code VALUES ('138', 't_m_report.xycd', '3', '排除', '', '2013-08-01 17:27:59', '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gbk COMMENT='错误日志';

-- ----------------------------
-- Records of t_s_cwlog
-- ----------------------------
INSERT INTO t_s_cwlog VALUES ('23', 'admin', '管理员', '0:0:0:0:0:0:0:1', '2013-08-16 13:50:59', 'WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'by r.id desc limit 0,30\' at line 1', '1');
INSERT INTO t_s_cwlog VALUES ('24', 'admin', '管理员', '0:0:0:0:0:0:0:1', '2013-08-20 13:52:38', 'casemanageBean.insertCase出现数据库错误，操作为：添加案件信息失败！Field \'id\' doesn\'t have a default value', '1');
INSERT INTO t_s_cwlog VALUES ('25', 'admin', '管理员', '0:0:0:0:0:0:0:1', '2013-08-20 13:52:43', 'casemanageBean.insertCase出现数据库错误，操作为：添加案件信息失败！Field \'id\' doesn\'t have a default value', '1');
INSERT INTO t_s_cwlog VALUES ('26', 'admin', '管理员', '0:0:0:0:0:0:0:1', '2013-08-20 13:56:24', 'casemanageBean.insertCase出现数据库错误，操作为：添加案件信息失败！Field \'id\' doesn\'t have a default value', '1');
INSERT INTO t_s_cwlog VALUES ('27', 'admin', '管理员', '0:0:0:0:0:0:0:1', '2013-08-20 14:35:46', 'casemanageBean.videoDetail出现数据库错误，操作为：查询案件信息失败！Invalid value for getLong() - \'admin\' in column 6', '1');
INSERT INTO t_s_cwlog VALUES ('28', 'admin', '管理员', '127.0.0.1', '2013-08-27 17:53:45', 'personBean.queryTUPerson出现数据库连接错误，操作为：根据条件查询用户信息失败！You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1', '1');
INSERT INTO t_s_cwlog VALUES ('29', 'admin', '管理员', '127.0.0.1', '2013-09-06 10:30:33', 'userBean.updateUser出现错误，操作为：修改用户信息失败Unknown column \'passed\' in \'field list\'', '1');
INSERT INTO t_s_cwlog VALUES ('30', 'admin', '管理员', '0:0:0:0:0:0:0:1', '2013-11-08 14:24:04', 'blacklistBean.chartByDate出现数据库错误，操作为：根据日期统计黑名单失败！Table \'gz_blacklist.chart\' doesn\'t exist', '1');
INSERT INTO t_s_cwlog VALUES ('31', 'admin', '管理员', '127.0.0.1', '2013-11-12 16:00:39', 'taskMgrBean.taskReport出现数据库连接错误,操作为：获取报表信息失败!You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1', '1');
INSERT INTO t_s_cwlog VALUES ('32', 'admin', '管理员', '127.0.0.1', '2013-11-12 16:35:24', 'taskMgrBean.taskReport出现数据库连接错误,操作为：获取报表信息失败!Unknown column \'locationNnme\' in \'where clause\'', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5006 DEFAULT CHARSET=gbk COMMENT='操作日志';

-- ----------------------------
-- Records of t_s_czlog
-- ----------------------------
INSERT INTO t_s_czlog VALUES ('2026', 'admin', '管理员', '10.168.1.110', '2013-08-15 16:25:42', '查询系统参数成功！', '1');
INSERT INTO t_s_czlog VALUES ('2027', 'admin', '管理员', '10.168.1.110', '2013-08-15 16:25:44', '查询系统参数详细信息成功！', '1');


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
  `recoverNumber` int(11) DEFAULT '0' COMMENT '恢复次数',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='数据库备份/恢复';

-- ----------------------------
-- Records of t_s_databack
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_dept
-- ----------------------------
INSERT INTO t_s_dept VALUES ('1', 'bm0001', 'XX总部', 'bm0001', '10', '10', '007598', '2011-05-25 23:30:30', '1', '0');
INSERT INTO t_s_dept VALUES ('2', '1', '1', '1', null, null, '', '2013-10-10 16:54:55', '1', null);
INSERT INTO t_s_dept VALUES ('3', '2', '2', '2', null, null, '', '2013-10-10 16:55:31', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_deptmgr
-- ----------------------------
INSERT INTO t_s_deptmgr VALUES ('1', 'bm0001', 'bm0001', '10', '10', '2013-07-15 18:00:03');
INSERT INTO t_s_deptmgr VALUES ('2', '1', '1', '10', '10', '2013-10-10 16:54:55');
INSERT INTO t_s_deptmgr VALUES ('3', '2', '2', '10', '10', '2013-10-10 16:55:31');

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
INSERT INTO t_s_ggfj VALUES ('1', '信帧智能监控WEB系统使用手册', 'upload/public/ggfj_20130425142955.pdf', '2013-08-14 10:48:54', 'admin', '2013-08-14 10:47:32', '1');
INSERT INTO t_s_ggfj VALUES ('2', '帮助文档', 'upload/public/ggfj_20130425142955.pdf', '2013-08-14 10:48:57', 'admin', '2013-08-14 10:47:23', '1');

-- ----------------------------
-- Table structure for `t_s_language`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_language`;
CREATE TABLE `t_s_language` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `languagekey` varchar(63) DEFAULT NULL,
  `lang` varchar(63) DEFAULT NULL,
  `country` varchar(63) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `localeName` varchar(255) DEFAULT NULL,
  `enable` int(2) DEFAULT '0',
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_language
-- ----------------------------
INSERT INTO t_s_language VALUES ('1', 'zh_CN', 'zh', 'China', 'Chinese(S)', '简体中文', '1', '1');
INSERT INTO t_s_language VALUES ('2', 'zh_TW', 'zh', 'China', 'Chinese (T)', '繁體中文', '0', '1');
INSERT INTO t_s_language VALUES ('3', 'zh_SG', 'zh', 'Singapore', 'Chinese (Singapore)', '华语(Singapore)', '0', '1');
INSERT INTO t_s_language VALUES ('4', 'en_US', 'en', 'United States', 'English (United States)', 'English (US)', '1', '1');
INSERT INTO t_s_language VALUES ('5', 'fr_FR', 'fr', 'France', 'French (France)', 'France', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_location
-- ----------------------------
INSERT INTO t_s_location VALUES ('1', 'dl', '中国', null, '116.406942', '39.857582', '6', '', '2013-07-05 01:54:21', '1');
INSERT INTO t_s_location VALUES ('2', 'dl01', '北京', null, '116.452293', '39.907031', '11', 'dl', '2013-04-26 09:05:50', '1');
INSERT INTO t_s_location VALUES ('3', 'dl0101', '海淀', null, '116.305115', '39.963683', '12', 'dl01', '2013-04-26 09:08:15', '1');
INSERT INTO t_s_location VALUES ('4', 'dl010101', '上地', null, '116.326889', '40.038464', '15', 'dl0101', '2013-04-28 11:00:08', '1');
INSERT INTO t_s_location VALUES ('5', 'dl01010101', '信息路', null, '116.31902', '40.037166', '16', 'dl010101', '2013-04-28 11:00:32', '1');
INSERT INTO t_s_location VALUES ('6', 'dl0101010101', '信息路A', null, '116.3173', '40.042168', '16', 'dl01010101', '2013-07-05 16:44:36', '1');
INSERT INTO t_s_location VALUES ('7', 'dl0101010102', '信息路B', null, '116.313437', '40.041323', '16', 'dl01010101', '2013-07-05 16:45:04', '1');
INSERT INTO t_s_location VALUES ('8', 'dl0101010103', '信息路C', null, '116.319523', '40.035094', '16', 'dl01010101', '2013-07-05 16:45:27', '1');
INSERT INTO t_s_location VALUES ('9', 'dl0101010104', '信息路D', null, '116.320008', '40.032097', '17', 'dl01010101', '2013-07-05 16:45:56', '1');
INSERT INTO t_s_location VALUES ('10', 'dl0101010105', '信息路E', null, '116.307773', '40.031282', '16', 'dl01010101', '2013-07-05 16:46:22', '1');
INSERT INTO t_s_location VALUES ('11', 'dl0101010106', '信息路F', null, '116.310199', '40.023478', '17', 'dl01010101', '2013-07-05 16:46:55', '1');
INSERT INTO t_s_location VALUES ('12', 'dl0101010107', '信息路G', null, '116.297299', '40.020843', '14', 'dl01010101', '2013-07-12 11:34:06', '1');
INSERT INTO t_s_location VALUES ('13', 'dl0101010108', '信息路H', null, '116.295484', '40.012692', '14', 'dl01010101', '2013-07-12 11:36:37', '1');
INSERT INTO t_s_location VALUES ('14', 'dl0101010109', '信息路I', null, '116.296993', '40.006889', '15', 'dl01010101', '2013-07-12 11:38:20', '1');
INSERT INTO t_s_location VALUES ('15', 'dl0101010110', '信息路J', null, '116.306408', '39.993845', '15', 'dl01010101', '2013-07-12 11:41:17', '1');
INSERT INTO t_s_location VALUES ('16', 'dl0101010111', '信息路K', null, '116.304252', '39.990418', '15', 'dl01010101', '2013-07-12 11:42:26', '1');
INSERT INTO t_s_location VALUES ('17', 'dl010102', '清河', null, '116.352689', '40.037746', '15', 'dl0101', '2013-07-16 16:10:15', '1');
INSERT INTO t_s_location VALUES ('18', 'dl01010201', '清河中街', null, '116.343778', '40.036613', '16', 'dl010102', '2013-07-31 13:16:13', '1');
INSERT INTO t_s_location VALUES ('19', 'dl0101020101', '清河中街A', null, '116.353839', '40.036945', '16', 'dl01010201', '2013-07-16 16:11:19', '1');
INSERT INTO t_s_location VALUES ('20', 'dl0101020102', '清河中街B', null, '116.351997', '40.03653', '18', 'dl01010201', '2013-07-16 16:11:47', '1');
INSERT INTO t_s_location VALUES ('21', 'dl0101020103', '清河中街C', null, '116.349706', '40.036406', '17', 'dl01010201', '2013-07-16 16:12:46', '1');
INSERT INTO t_s_location VALUES ('22', 'dl0101020104', '清河中街D', null, '116.343688', '40.036558', '17', 'dl01010201', '2013-07-31 13:16:19', '1');
INSERT INTO t_s_location VALUES ('23', 'dl0101020105', '清河中街E', null, '116.340166', '40.036668', '17', 'dl01010201', '2013-07-16 16:14:08', '1');
INSERT INTO t_s_location VALUES ('24', 'dl0101020106', '清河中街F', null, '116.35197', '40.036088', '15', 'dl01010201', '2013-07-18 18:44:32', '0');
INSERT INTO t_s_location VALUES ('26', 'dl0101010113', '信息路M', null, '116.312517', '40.050256', '16', 'dl01010101', '2013-07-31 13:16:34', '1');
INSERT INTO t_s_location VALUES ('27', 'dl0101010112', '信息路L', null, '116.316182', '40.044208', '16', 'dl01010201', '2013-08-08 13:28:47', '1');
INSERT INTO t_s_location VALUES ('28', 'dl02', '0', null, '116.654663', '39.805115', '11', 'dl', '2013-10-10 16:59:53', '1');
INSERT INTO t_s_location VALUES ('29', 'dl0102', '北京朝阳', null, '116.485638', '39.958373', '11', 'dl01', '2013-11-12 14:54:55', '1');

-- ----------------------------
-- Table structure for `t_s_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_code` char(20) CHARACTER SET gbk NOT NULL,
  `role_name` char(40) CHARACTER SET gbk NOT NULL,
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
INSERT INTO t_s_role VALUES ('1', 'xtgl', '系统管理员', '2011-03-04 22:12:58', '1');
INSERT INTO t_s_role VALUES ('2', 'ybyh', '一般用户1', '2011-05-22 10:44:54', '1');

-- ----------------------------
-- Table structure for `t_s_rolevalue`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_rolevalue`;
CREATE TABLE `t_s_rolevalue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_code` char(20) CHARACTER SET gbk NOT NULL,
  `ruler_code` char(20) CHARACTER SET gbk NOT NULL,
  `ruler_word` char(20) CHARACTER SET gbk DEFAULT 'QUIDV',
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_rolevalue
-- ----------------------------
INSERT INTO t_s_rolevalue VALUES ('1', 'xtgl', 'xtgl', 'QUIDV', '2011-03-04 22:38:28', '1');
INSERT INTO t_s_rolevalue VALUES ('5', 'xtgl', 'role', 'QUIDV', '2011-03-05 20:44:51', '1');
INSERT INTO t_s_rolevalue VALUES ('2', 'xtgl', 'xtglxx', 'QUIVD', '2013-03-22 09:19:24', '1');
INSERT INTO t_s_rolevalue VALUES ('4', 'xtgl', 'jbxxgl', 'QUIVD', '2013-05-07 09:49:23', '1');
INSERT INTO t_s_rolevalue VALUES ('3', 'xtgl', 'ruler', 'QUIVD', '2013-07-12 09:15:37', '1');
INSERT INTO t_s_rolevalue VALUES ('6', 'xtgl', 'cloud', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('7', 'xtgl', 'sbxxgl', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('8', 'xtgl', 'sbxxglxx', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('9', 'xtgl', 'location', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('10', 'xtgl', 'cloudxx', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('11', 'xtgl', 'reportlist', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('12', 'xtgl', 'car-gis', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('13', 'xtgl', 'filemgr', 'QUIAPLRCM', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('14', 'xtgl', 'watchedFolder', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('15', 'xtgl', 'taskmgr', 'QUIVDG', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('16', 'xtgl', 'baseInformation', 'QUVD', '2013-07-16 09:27:45', '0');
INSERT INTO t_s_rolevalue VALUES ('17', 'xtgl', 'userlog', 'QUIVD', '2013-07-16 09:27:45', '0');
INSERT INTO t_s_rolevalue VALUES ('18', 'xtgl', 'errorlog', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('19', 'xtgl', 'logMgr', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('20', 'xtgl', 'loggMgr', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('21', 'xtgl', 'code', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('22', 'xtgl', 'baseInfo', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('23', 'xtgl', 'backUpData', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('24', 'xtgl', 'person', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('25', 'xtgl', 'dept', 'QUIVD', '2013-07-16 09:27:45', '1');
INSERT INTO t_s_rolevalue VALUES ('26', 'xtgly', 'cloud', 'QUIVD', '2013-07-30 17:32:49', '0');
INSERT INTO t_s_rolevalue VALUES ('27', 'xtgl', 'ajgl', 'QUIVD', '2013-08-01 09:04:15', '0');
INSERT INTO t_s_rolevalue VALUES ('28', 'xtgl', 'ajglxx', 'QUIVD', '2013-08-01 09:04:15', '1');
INSERT INTO t_s_rolevalue VALUES ('29', 'xtgl', 'clgl', 'QUIVD', '2013-08-01 09:04:15', '1');
INSERT INTO t_s_rolevalue VALUES ('30', 'xtgl', 'casemanage', 'QUIVD', '2013-08-01 10:27:55', '1');
INSERT INTO t_s_rolevalue VALUES ('31', 'xtgl', 'casemanageAction', 'QUIVD', '2013-08-01 10:30:07', '1');
INSERT INTO t_s_rolevalue VALUES ('32', 'xtgl', 'casetypeAction', 'QUIDV', '2013-08-02 11:12:29', '1');
INSERT INTO t_s_rolevalue VALUES ('33', 'xtgl', 'userlog', 'QUIVD', '2013-08-02 13:54:26', '1');
INSERT INTO t_s_rolevalue VALUES ('34', 'ybyh', 'cloud', 'QUIVD', '2013-08-02 17:03:28', '1');
INSERT INTO t_s_rolevalue VALUES ('35', 'ybyh', 'logMgr', 'QUIVD', '2013-08-02 17:03:28', '0');
INSERT INTO t_s_rolevalue VALUES ('36', 'ybyh', 'reportlist', 'QUIVD', '2013-08-02 17:05:11', '0');
INSERT INTO t_s_rolevalue VALUES ('37', 'ybyh', 'cloudxx', 'QUIVD', '2013-08-02 17:05:11', '0');
INSERT INTO t_s_rolevalue VALUES ('38', 'ybyh', 'car-gis', 'QUIVD', '2013-08-02 17:05:11', '0');
INSERT INTO t_s_rolevalue VALUES ('39', 'ybyh', 'cloudxx', 'QUIVD', '2013-08-02 17:05:48', '0');
INSERT INTO t_s_rolevalue VALUES ('40', 'ybyh', 'sbxxgl', 'QUIVD', '2013-08-02 17:05:48', '0');
INSERT INTO t_s_rolevalue VALUES ('41', 'ybyh', 'logMgr', 'QUIVD', '2013-08-02 17:05:48', '0');
INSERT INTO t_s_rolevalue VALUES ('42', 'ybyh', 'ajgl', 'QUIVD', '2013-08-02 17:07:12', '1');
INSERT INTO t_s_rolevalue VALUES ('43', 'ybyh', 'ajglxx', 'QUIVD', '2013-08-02 17:07:12', '1');
INSERT INTO t_s_rolevalue VALUES ('44', 'ybyh', 'clgl', 'QUIVD', '2013-08-02 17:07:12', '1');
INSERT INTO t_s_rolevalue VALUES ('45', 'xtgl', 'baseInformation', 'QUVD', '2013-08-08 17:31:37', '1');
INSERT INTO t_s_rolevalue VALUES ('46', 'ybyh', 'cloudxx', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('47', 'ybyh', 'watchedFolder', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('48', 'ybyh', 'baseInformation', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('49', 'ybyh', 'filemgr', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('50', 'ybyh', 'car-gis', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('51', 'ybyh', 'reportlist', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('52', 'ybyh', 'taskmgr', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('53', 'ybyh', 'casemanageAction', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('54', 'ybyh', 'casetypeAction', 'QUIVD', '2013-08-13 17:35:14', '1');
INSERT INTO t_s_rolevalue VALUES ('55', 'ybyh', 'xtgl', 'QUIVD', '2013-08-13 17:36:13', '1');
INSERT INTO t_s_rolevalue VALUES ('56', 'ybyh', 'role', 'QUIVD', '2013-08-13 17:36:13', '1');
INSERT INTO t_s_rolevalue VALUES ('57', 'ybyh', 'jbxxgl', 'QUIVD', '2013-08-13 17:36:13', '1');
INSERT INTO t_s_rolevalue VALUES ('58', 'ybyh', 'person', 'QUIVD', '2013-08-13 17:36:13', '1');
INSERT INTO t_s_rolevalue VALUES ('59', 'ybyh', 'dept', 'QUIVD', '2013-08-13 17:36:13', '1');
INSERT INTO t_s_rolevalue VALUES ('60', 'xtgl', 'blacklistmgr', 'QUIVD', '2013-11-05 10:26:26', '1');
INSERT INTO t_s_rolevalue VALUES ('61', 'xtgl', 'blacklistmgrxx', 'QUIVD', '2013-11-06 15:35:09', '1');
INSERT INTO t_s_rolevalue VALUES ('62', 'xtgl', 'blacklistmgrchart', 'QUIVD', '2013-11-06 15:37:57', '1');
INSERT INTO t_s_rolevalue VALUES ('63', 'xtgl', 'tjfx', 'QUIVD', '2013-11-07 10:38:40', '0');
INSERT INTO t_s_rolevalue VALUES ('64', 'xtgl', 'tjfxxx', 'QUIVD', '2013-11-07 10:38:41', '1');
INSERT INTO t_s_rolevalue VALUES ('65', 'xtgl', 'blackchartbydate', 'QUIVD', '2013-08-07 15:48:41', '1');
INSERT INTO t_s_rolevalue VALUES ('66', 'xtgl', 'blackchartbyfraquen', 'QUIVD', '2013-11-08 15:17:55', '1');
INSERT INTO t_s_rolevalue VALUES ('68', 'xtgl', 'blackchartbyarea', 'QUIVD', '2013-11-11 14:29:50', '1');

-- ----------------------------
-- Table structure for `t_s_ruler`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_ruler`;
CREATE TABLE `t_s_ruler` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ruler_code` varchar(20) CHARACTER SET gbk NOT NULL,
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
  `xuhao` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115129 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_ruler
-- ----------------------------
INSERT INTO t_s_ruler VALUES ('1', 'ruler', '菜单管理', '', '/rulerAction.do', '2', '0', 'xtglxx', '0', '1', '2008-10-31 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('2', 'role', '角色/权限管理', '', '/roleAction.do', '2', '0', 'jbxxgl', '0', '1', '2008-10-31 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('4', 'dept', '机构管理', '', '/deptAction.do', '2', '0', 'jbxxgl', null, '1', '2011-03-27 01:07:31', '0', '0');
INSERT INTO t_s_ruler VALUES ('5', 'person', '人员管理', '', '/personAction.do', '2', '0', 'jbxxgl', null, '1', '2011-03-29 02:08:27', '0', '0');
INSERT INTO t_s_ruler VALUES ('10', 'xtgl', '系统管理', '', '', '0', '0', 'xtgl', null, '1', '2013-05-07 09:42:31', '0', '0');
INSERT INTO t_s_ruler VALUES ('7', 'code', '标准数据管理', '', '/codeAction.do', '2', '0', 'xtglxx', '0', '1', '2008-10-31 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('8', 'xtglxx', '系统信息管理', '', '', '1', '0', 'xtgl', null, '1', '2009-06-10 00:00:00', '0', '1');
INSERT INTO t_s_ruler VALUES ('1521', 'cloudxx', '分析中心', '', '', '1', '0', 'cloud', null, '1', '2013-05-07 13:04:50', '0', '0');
INSERT INTO t_s_ruler VALUES ('600', 'sbxxgl', '设备信息管理', '', '', '0', '0', 'sbxxgl', null, '1', '2012-09-07 01:59:42', '0', '3');
INSERT INTO t_s_ruler VALUES ('1328', 'sbxxglxx', '信息管理', '', '', '1', '0', 'sbxxgl', null, '1', '2012-09-07 02:06:26', '0', '0');
INSERT INTO t_s_ruler VALUES ('1331', 'baseInfo', '系统参数', '', '/baseInfoAction.do', '2', '0', 'xtglxx', null, '1', '2013-03-25 14:37:45', '0', '0');
INSERT INTO t_s_ruler VALUES ('1332', 'location', '地理信息管理', '', '/locationAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-03-26 18:27:55', '0', '0');
INSERT INTO t_s_ruler VALUES ('110', 'backUpData', '数据库备份与恢复', '', '/dataMgrAction.do', '2', '0', 'xtglxx', null, '1', '2013-03-29 13:32:48', '0', '0');
INSERT INTO t_s_ruler VALUES ('1100', 'cloud', '云计算分析中心', '', '', '0', '0', 'cloud', null, '1', '2013-03-30 18:32:13', '0', '2');
INSERT INTO t_s_ruler VALUES ('1536', 'taskmgr', '任务查看', '', '/taskMgrAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:30:22', '0', '0');
INSERT INTO t_s_ruler VALUES ('1553', 'jbxxgl', '基本信息管理', '', '', '1', '0', 'xtgl', null, '1', '2013-07-15 11:10:15', '0', '0');
INSERT INTO t_s_ruler VALUES ('1529', 'loggMgr', '日志管理', '', '', '1', '0', 'xtgl', null, '1', '2013-05-07 16:09:43', '0', '5');
INSERT INTO t_s_ruler VALUES ('1530', 'userlog', '用户日志', '', '/userlogAction.do', '2', '0', 'loggMgr', null, '1', '2013-05-07 16:10:14', '0', '0');
INSERT INTO t_s_ruler VALUES ('1531', 'errorlog', '网页程序异常', '', '/errorlogAction.do', '2', '0', 'loggMgr', null, '1', '2013-05-07 16:10:32', '0', '0');
INSERT INTO t_s_ruler VALUES ('1537', 'reportlist', '报表分析', '', '/statisticAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:30:41', '0', '0');
INSERT INTO t_s_ruler VALUES ('1538', 'car-gis', '车辆轨迹分析', '', '/cloudVehicleTrackAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:31:06', '0', '0');
INSERT INTO t_s_ruler VALUES ('1539', 'filemgr', '文件管理', '', '/fileMgrAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:31:21', '0', '0');
INSERT INTO t_s_ruler VALUES ('1547', 'watchedFolder', '监视列表', '', '/watchedFolderAction.do', '2', '0', 'cloudxx', null, '1', '2013-06-09 11:37:53', '0', '0');
INSERT INTO t_s_ruler VALUES ('1551', 'tjfx', '统计分析', '', '', '0', '0', 'tjfx', null, '1', '2013-07-15 11:05:25', '0', '50');
INSERT INTO t_s_ruler VALUES ('1550', 'baseInformation', '默认参数', '', '/baseInformationAction.do', '2', '0', 'cloudxx', null, '1', '2013-07-01 17:45:18', '0', '0');
INSERT INTO t_s_ruler VALUES ('1554', 'ajgl', '案件管理', '', '', '0', '0', 'ajgl', null, '1', '2013-08-01 09:03:04', '0', '1');
INSERT INTO t_s_ruler VALUES ('1555', 'ajglxx', '案件信息管理', '', '', '1', '0', 'ajgl', null, '1', '2013-08-01 09:03:50', '0', '0');
INSERT INTO t_s_ruler VALUES ('1556', 'clgl', '车辆管理', '', '/clglAction.do', '2', '0', 'ajglxx', null, '1', '2013-08-01 09:04:03', '0', '0');
INSERT INTO t_s_ruler VALUES ('1557', 'casemanageAction', '案件管理', '', '/casemanageAction.do', '2', '0', 'ajglxx', null, '1', '2013-08-01 10:27:35', '0', '0');
INSERT INTO t_s_ruler VALUES ('1558', 'casetypeAction', '案件类型管理', '', '/casetypeAction.do', '2', '0', 'ajglxx', null, '1', '2013-08-02 11:04:04', '0', '0');
INSERT INTO t_s_ruler VALUES ('115123', 'tjfxxx', '统计分析', ' ', ' ', '1', '0', 'tjfx', null, '1', '2013-08-23 12:05:18', '0', '0');
INSERT INTO t_s_ruler VALUES ('115124', 'blacklistmgr', '黑名单管理', '', '', '0', '0', 'blacklistmgr', null, '1', '2013-11-05 10:12:39', '0', '51');
INSERT INTO t_s_ruler VALUES ('115125', 'blacklistmgrxx', '黑名单管理', '', '', '1', '0', 'blacklistmgr', null, '1', '2013-11-06 15:23:22', '0', '0');
INSERT INTO t_s_ruler VALUES ('115126', 'blackchartbydate', '按日统计报表', '', '/blackchartbydateAction.do', '2', '0', 'blacklistmgrxx', null, '1', '2013-11-06 15:36:34', '0', '0');
INSERT INTO t_s_ruler VALUES ('115127', 'blackchartbyfraquen', '按频次统计报表', '', '/blackchartbyfraquencyAction.do', '2', '0', 'blacklistmgrxx', null, '1', '2013-11-08 15:12:27', '0', '0');
INSERT INTO t_s_ruler VALUES ('115128', 'blackchartbyarea', '地图区域显示', '', '/blackchartbyareaAction.do', '2', '0', 'blacklistmgrxx', null, '1', '2013-11-11 11:29:02', '0', '0');

-- ----------------------------
-- Table structure for `t_s_rulervalue`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_rulervalue`;
CREATE TABLE `t_s_rulervalue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ruler_code` varchar(255) DEFAULT NULL,
  `language` varchar(64) DEFAULT NULL,
  `ruler_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_rulervalue
-- ----------------------------
INSERT INTO t_s_rulervalue VALUES ('1', 'ruler', 'zh_CN', '菜单管理');
INSERT INTO t_s_rulervalue VALUES ('2', 'ruler', 'en_US', 'Menu');
INSERT INTO t_s_rulervalue VALUES ('3', 'dept', 'zh_CN', '机构管理');
INSERT INTO t_s_rulervalue VALUES ('4', 'dept', 'en_US', 'Department');
INSERT INTO t_s_rulervalue VALUES ('5', 'xtgl', 'zh_CN', '系统管理');
INSERT INTO t_s_rulervalue VALUES ('6', 'xtgl', 'en_US', 'System');
INSERT INTO t_s_rulervalue VALUES ('7', 'xtglxx', 'zh_CN', '系统信息管理');
INSERT INTO t_s_rulervalue VALUES ('8', 'xtglxx', 'en_US', 'System');
INSERT INTO t_s_rulervalue VALUES ('9', 'sbxxgl', 'zh_CN', '设备信息管理');
INSERT INTO t_s_rulervalue VALUES ('10', 'sbxxgl', 'en_US', 'Equipment');
INSERT INTO t_s_rulervalue VALUES ('11', 'sbxxglxx', 'zh_CN', '信息管理');
INSERT INTO t_s_rulervalue VALUES ('12', 'sbxxglxx', 'en_US', 'Equipment');
INSERT INTO t_s_rulervalue VALUES ('13', 'location', 'zh_CN', '地理信息管理');
INSERT INTO t_s_rulervalue VALUES ('14', 'location', 'en_US', 'Location');
INSERT INTO t_s_rulervalue VALUES ('15', 'cloud', 'zh_CN', '视频处理');
INSERT INTO t_s_rulervalue VALUES ('16', 'cloud', 'en_US', 'Analysis');
INSERT INTO t_s_rulervalue VALUES ('17', 'loggMgr', 'zh_CN', '日志管理');
INSERT INTO t_s_rulervalue VALUES ('18', 'loggMgr', 'en_US', 'Log Manager');
INSERT INTO t_s_rulervalue VALUES ('19', 'userlog', 'zh_CN', '用户日志');
INSERT INTO t_s_rulervalue VALUES ('20', 'userlog', 'en_US', 'User Log');
INSERT INTO t_s_rulervalue VALUES ('21', 'reportlist', 'zh_CN', '报表分析');
INSERT INTO t_s_rulervalue VALUES ('22', 'reportlist', 'en_US', 'Report');
INSERT INTO t_s_rulervalue VALUES ('23', 'filemgr', 'zh_CN', '文件管理');
INSERT INTO t_s_rulervalue VALUES ('24', 'filemgr', 'en_US', 'Video File');
INSERT INTO t_s_rulervalue VALUES ('25', 'logMgr', 'zh_CN', '日志管理');
INSERT INTO t_s_rulervalue VALUES ('26', 'logMgr', 'en_US', 'Log Manager');
INSERT INTO t_s_rulervalue VALUES ('27', 'ajgl', 'zh_CN', '案件管理');
INSERT INTO t_s_rulervalue VALUES ('28', 'ajgl', 'en_US', 'Case');
INSERT INTO t_s_rulervalue VALUES ('29', 'ajglxx', 'zh_CN', '案件信息管理');
INSERT INTO t_s_rulervalue VALUES ('30', 'ajglxx', 'en_US', 'Case');
INSERT INTO t_s_rulervalue VALUES ('31', 'clgl', 'zh_CN', '车辆管理');
INSERT INTO t_s_rulervalue VALUES ('32', 'clgl', 'en_US', 'Vehicle');
INSERT INTO t_s_rulervalue VALUES ('33', 'casemanageAction', 'zh_CN', '案件管理');
INSERT INTO t_s_rulervalue VALUES ('34', 'casemanageAction', 'en_US', 'Case');
INSERT INTO t_s_rulervalue VALUES ('35', 'casetypeAction', 'zh_CN', '案件类型管理');
INSERT INTO t_s_rulervalue VALUES ('36', 'casetypeAction', 'en_US', 'Case Type');
INSERT INTO t_s_rulervalue VALUES ('37', 'role', 'zh_CN', '角色/权限管理');
INSERT INTO t_s_rulervalue VALUES ('38', 'role', 'en_US', 'Role');
INSERT INTO t_s_rulervalue VALUES ('39', 'person', 'zh_CN', '人员管理');
INSERT INTO t_s_rulervalue VALUES ('40', 'person', 'en_US', 'Person');
INSERT INTO t_s_rulervalue VALUES ('41', 'code', 'zh_CN', '标准数据管理');
INSERT INTO t_s_rulervalue VALUES ('42', 'code', 'en_US', 'Standard Data');
INSERT INTO t_s_rulervalue VALUES ('43', 'cloudxx', 'zh_CN', '分析中心');
INSERT INTO t_s_rulervalue VALUES ('44', 'cloudxx', 'en_US', 'Video Analy');
INSERT INTO t_s_rulervalue VALUES ('45', 'baseInfo', 'zh_CN', '系统参数');
INSERT INTO t_s_rulervalue VALUES ('46', 'baseInfo', 'en_US', 'System Parameter');
INSERT INTO t_s_rulervalue VALUES ('47', 'backUpData', 'zh_CN', '数据库备份与恢复');
INSERT INTO t_s_rulervalue VALUES ('48', 'backUpData', 'en_US', 'Database');
INSERT INTO t_s_rulervalue VALUES ('49', 'taskmgr', 'zh_CN', '任务管理');
INSERT INTO t_s_rulervalue VALUES ('50', 'taskmgr', 'en_US', 'Tasks');
INSERT INTO t_s_rulervalue VALUES ('51', 'jbxxgl', 'zh_CN', '基本信息管理');
INSERT INTO t_s_rulervalue VALUES ('52', 'jbxxgl', 'en_US', 'Basic Info');
INSERT INTO t_s_rulervalue VALUES ('53', 'errorlog', 'zh_CN', '网页程序异常');
INSERT INTO t_s_rulervalue VALUES ('54', 'errorlog', 'en_US', 'System Log');
INSERT INTO t_s_rulervalue VALUES ('55', 'car-gis', 'zh_CN', '车辆轨迹分析');
INSERT INTO t_s_rulervalue VALUES ('56', 'car-gis', 'en_US', 'Vehicle GIS');
INSERT INTO t_s_rulervalue VALUES ('57', 'watchedFolder', 'zh_CN', '自动处理和分析');
INSERT INTO t_s_rulervalue VALUES ('58', 'watchedFolder', 'en_US', 'Watch Folder');
INSERT INTO t_s_rulervalue VALUES ('59', 'baseInformation', 'zh_CN', '默认参数');
INSERT INTO t_s_rulervalue VALUES ('60', 'baseInformation', 'en_US', 'Default Parameters');
INSERT INTO t_s_rulervalue VALUES ('61', 'tjfx', 'en_US', 'Statistics');
INSERT INTO t_s_rulervalue VALUES ('62', 'tjfx', 'zh_CN', '统计分析');
INSERT INTO t_s_rulervalue VALUES ('63', 'tjfxxx', 'en_US', 'Statistics');
INSERT INTO t_s_rulervalue VALUES ('64', 'tjfxxx', 'zh_CN', '统计分析');
INSERT INTO t_s_rulervalue VALUES ('65', 'blacklistmgr', 'en_US', 'Black List Manager');
INSERT INTO t_s_rulervalue VALUES ('66', 'blacklistmgr', 'zh_CN', '黑名单管理');
INSERT INTO t_s_rulervalue VALUES ('67', 'blacklistmgrxx', 'en_US', 'Black List Manager');
INSERT INTO t_s_rulervalue VALUES ('68', 'blacklistmgrxx', 'zh_CN', '黑名单管理');
INSERT INTO t_s_rulervalue VALUES ('69', 'blackchartbydate', 'en_US', 'Black List Cahrt By Date');
INSERT INTO t_s_rulervalue VALUES ('70', 'blackchartbydate', 'zh_CN', '按日统计报表');
INSERT INTO t_s_rulervalue VALUES ('71', 'blackchartbyfraquen', 'en_US', 'Black List Cahrt By Fraquency');
INSERT INTO t_s_rulervalue VALUES ('72', 'blackchartbyfraquen', 'zh_CN', '按频次统计报表');
INSERT INTO t_s_rulervalue VALUES ('73', 'blackchartbyarea', 'en_US', 'Black List Area');
INSERT INTO t_s_rulervalue VALUES ('74', 'blackchartbyarea', 'zh_CN', '地图区域显示');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk COMMENT='记录上传文件';

-- ----------------------------
-- Records of t_s_uploadfiles
-- ----------------------------
INSERT INTO t_s_uploadfiles VALUES ('1', '1364525015449', 'logo', 'logo', '/upload/logo/logo_201303290243340.jpg', '2013-07-15 18:10:40', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('2', '1375870177294', 'logo', 'logo', 'nofiles', '2013-08-07 18:09:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('3', '1375870943105', 'logo', 'logo', 'upload/logo/{0_0_20130807182221809}.png', '2013-08-07 18:22:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('4', '1375871031802', 'logo', 'logo', 'upload/logo/{0_0_20130807182350897}.png', '2013-08-07 18:23:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('5', '1376630623955', 'logo', 'logo', 'upload/logo/{0_0_20130816132341288}.png', '2013-08-16 13:23:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('6', '1378171564738', 'logo', 'logo', 'upload/logo/{0_0_20130903092603575}.png', '2013-09-03 09:27:25', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('7', '1378173102918', 'logo', 'logo', 'upload/logo/{0_0_20130903095141998}.png', '2013-09-03 09:51:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('8', '1379065356952', 'logo', 'logo', 'upload/logo/{0_0_20130913174235604}.png', '2013-09-13 17:42:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('9', '1379293187413', 'logo', 'logo', 'upload/logo/{0_0_20130916085946726}.png', '2013-09-16 08:59:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('10', '1379910948720', 'logo', 'logo', 'upload/logo/{0_0_20130923123544399}.png', '2013-09-23 12:35:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('11', '1379912251884', 'logo', 'logo', 'upload/logo/{0_0_20130923125730932}.png', '2013-09-23 12:57:00', null, '1');
INSERT INTO t_s_uploadfiles VALUES ('12', '1381395244041', 'logo', 'logo', 'upload/logo/{0_0_20131010165346897}.jpg', '2013-10-10 16:54:00', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_userrole
-- ----------------------------
INSERT INTO t_s_userrole VALUES ('1', 'admin', 'xtgl', '2011-03-29 07:12:27', '1');
INSERT INTO t_s_userrole VALUES ('2', 'karl', 'ybyh', '2013-08-13 17:35:37', '1');
INSERT INTO t_s_userrole VALUES ('3', 'helen', 'ybyh', '2013-09-26 15:34:58', '1');

-- ----------------------------
-- Table structure for `t_u_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_u_person`;
CREATE TABLE `t_u_person` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '唯一编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户昵称',
  `passwd` varchar(50) COLLATE gbk_bin DEFAULT 'admin',
  `language` varchar(20) COLLATE gbk_bin DEFAULT 'en_US',
  `dept_code` varchar(10) COLLATE gbk_bin DEFAULT 'root',
  `role_code` varchar(10) COLLATE gbk_bin DEFAULT 'ybyh' COMMENT '最终岗位',
  `xb` varchar(10) COLLATE gbk_bin DEFAULT NULL COMMENT '性别',
  `csrq` varchar(20) COLLATE gbk_bin DEFAULT NULL COMMENT '出生日期',
  `sj` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '手机',
  `photo_path` varchar(255) COLLATE gbk_bin DEFAULT 'upload/touxiangIcon.gif' COMMENT '用户头像路径',
  `tel` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '电话',
  `mail` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `tupian` char(255) COLLATE gbk_bin DEFAULT NULL,
  `status` int(10) DEFAULT '1' COMMENT '是否正常',
  PRIMARY KEY (`id`),
  KEY `t_u_perosn_idx2` (`user_code`,`dept_code`,`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_u_person
-- ----------------------------
INSERT INTO t_u_person VALUES ('1', 'admin', '管理员', 'admin', 'zh_CN', 'bm0001', 'xtgl', '男', '', '18653156061', 'upload/photo/{0_0_20130924143449698}.jpg', '', '', '1', '1');
INSERT INTO t_u_person VALUES ('14', 'karl', 'karl', 'admin', 'en_US', 'bm0001', 'xtgl', '男', '', '', 'upload/photo/{0_0_20130926152116383}.png', '', '', null, '1');
INSERT INTO t_u_person VALUES ('15', 'helen', 'helen', 'helen', 'en_US', 'bm0001', 'xtgl', '女', null, null, 'upload/touxiangIcon.gif', null, null, null, '1');

-- ----------------------------
-- View structure for `chart`
-- ----------------------------
DROP VIEW IF EXISTS `chart`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `chart` AS select `t`.`lpNumber` AS `lpNumber`,`t`.`absTime` AS `absTime`,`l`.`locationName` AS `locationName`,date_format(`t`.`absTime`,'%Y-%m-%d') AS `days`,count(`t`.`id`) AS `ct`,`l`.`longitude` AS `longitude`,`l`.`latiTude` AS `latiTude`,`t`.`img` AS `img` from (`total` `t` join `t_s_location` `l`) where (`t`.`location` = `l`.`locationId`) group by date_format(`t`.`absTime`,'%Y-%m-%d'),`t`.`lpNumber`,`t`.`location`;
DELIMITER ;;
CREATE TRIGGER `insert_dj_total` AFTER INSERT ON `dzjc_20130426_183246` FOR EACH ROW begin 
    INSERT INTO total VALUES (NULL,new.LPNumber,(SELECT c.locationId FROM t_s_cameratable c WHERE c.id=new.CLSSID),new.absTime,new.LPNimage);
end
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `insert_kk_total` AFTER INSERT ON `kk_20130508_165150` FOR EACH ROW begin 
    INSERT INTO total VALUES (NULL,new.LPNumber,(SELECT c.locationId FROM t_s_cameratable c WHERE c.id=new.CLSSID),new.absTime,new.LPNimage);
end
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `insert_ma_total` AFTER INSERT ON `t_m_report` FOR EACH ROW begin 
    INSERT INTO total VALUES (NULL,new.LPNumber,(SELECT t.locationId FROM t_m_tasks t WHERE t.taskID=new.taskId),new.absTime,new.picUrl);
end
;;
DELIMITER ;

/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.252
Source Server Version : 50513
Source Host           : 10.168.1.252:3306
Source Database       : tfmobileauth

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2014-01-28 10:50:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `authrec`
-- ----------------------------
DROP TABLE IF EXISTS `authrec`;
CREATE TABLE `authrec` (
  `Seqence` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `DataTime` datetime DEFAULT NULL,
  `fLongitude` varchar(63) DEFAULT NULL,
  `fLatitude` varchar(63) DEFAULT NULL,
  `AuthVideoPath` varchar(255) DEFAULT NULL,
  `AuthVoicePath` varchar(255) DEFAULT NULL,
  `AuthResult` int(11) DEFAULT NULL,
  PRIMARY KEY (`Seqence`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authrec
-- ----------------------------
INSERT INTO authrec VALUES ('1', '1', '2013-11-19 14:31:46', '12.3', '13.5', '', '', '2');
INSERT INTO authrec VALUES ('2', '1', '2013-11-19 14:31:48', '12.3', '13.5', '', '', '2');
INSERT INTO authrec VALUES ('3', '1', '2013-11-19 14:31:50', '12.3', '13.5', '', '', '2');
INSERT INTO authrec VALUES ('4', '1', '2014-01-05 20:42:29', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_03_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_03_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('5', '1', '2014-01-05 20:42:29', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_03_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_03_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('6', '1', '2014-01-05 20:42:37', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_31_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_31_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('7', '1', '2014-01-05 20:42:37', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_31_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_31_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('8', '1', '2014-01-05 20:42:40', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_39_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_39_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('9', '1', '2014-01-05 20:42:40', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_39_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_39_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('10', '1', '2014-01-05 20:42:43', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_42_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_42_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('11', '1', '2014-01-05 20:42:43', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_42_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_42_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('12', '1', '2014-01-05 20:42:47', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_45_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_45_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('13', '1', '2014-01-05 20:42:48', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_45_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_45_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('14', '1', '2014-01-05 20:42:53', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_50_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_50_rec_voice.amr', '2');
INSERT INTO authrec VALUES ('15', '1', '2014-01-05 20:42:55', '12.3', '13.5', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_50_rec_video.mp4', 'F:\\work3\\tfMobileAuth\\bin\\history\\13991913422\\2014-01-05_20_42_50_rec_voice.amr', '2');

-- ----------------------------
-- Table structure for `phoneuser`
-- ----------------------------
DROP TABLE IF EXISTS `phoneuser`;
CREATE TABLE `phoneuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `PhoneNum` varchar(16) NOT NULL,
  `PassWord` int(11) DEFAULT NULL,
  `RandQuestion1` varchar(255) DEFAULT NULL,
  `AnswerQuestion1` varchar(127) DEFAULT NULL,
  `RandQuestion2` varchar(255) DEFAULT NULL,
  `AnswerQuestion2` varchar(127) DEFAULT NULL,
  `RandQuestion3` varchar(255) DEFAULT NULL,
  `AnswerQuestion3` varchar(127) DEFAULT NULL,
  `RandQuestion4` varchar(255) DEFAULT NULL,
  `AnswerQuestion4` varchar(127) DEFAULT NULL,
  `RandQuestion5` varchar(255) DEFAULT NULL,
  `AnswerQuestion5` varchar(127) DEFAULT NULL,
  `RandQuestion6` varchar(255) DEFAULT NULL,
  `AnswerQuestion6` varchar(127) DEFAULT NULL,
  `SysRefPicPath` varchar(255) DEFAULT NULL,
  `SysRefVoicePath` varchar(255) DEFAULT NULL,
  `RegisterTime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phoneuser
-- ----------------------------
INSERT INTO phoneuser VALUES ('1', '1', '13991913422', '123456', '家里的狗名字是', '旺财', '老家的房是几间', '5间', '你孩子的小名是啥', '采采', '', '', '', '', '', '', '/13991913422/xuehz.bmp', '/13991913422/xuehz.amr', '12:23:45');
INSERT INTO phoneuser VALUES ('2', '2', '13991874137', '123456', '我的属相', '猫', '我老家的牛是公是母', '没有牛', '', '', '', '', '', '', '', '', '/13991874137/sdf.bmp', '/13991874137/sdf.amr', '12:23:45');
INSERT INTO phoneuser VALUES ('3', '3', '13999999999', '123456', '新年是几年', '牛', '', '', '', '', '', '', '', '', '', '', '/13999999999/dsf.bmp', '/13999999999/sdf.amr', '23:22:33');
INSERT INTO phoneuser VALUES ('4', '4', '13888888888', '123456', '我不爱用问题', '', '', '', '', '', '', '', '', '', '', '', '/13888888888/dsf.bmp', '/13888888888/dsf.amr', '23:22:33');

-- ----------------------------
-- Table structure for `sqlite_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `sqlite_sequence`;
CREATE TABLE `sqlite_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) DEFAULT NULL,
  `seq` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO sqlite_sequence VALUES ('1', 'AuthRec', '15');

/*
MySQL
Source Server Version: 5.5.13
Source Database: cloudretrieval
*/

/* Date: 2013/7/11 09:12:46 
   author :  qinwei
*/

ALTER table t_u_person  add column language CHAR(255);


ALTER table t_m_report  add column xycd CHAR(255);
ALTER table t_m_report  add column comment CHAR(255);

ALTER table t_u_person drop column jh;
ALTER table t_u_person drop column real_name;
ALTER table t_u_person drop column gzsj;
ALTER table t_u_person drop column zc;
ALTER table t_u_person drop column zw;
ALTER table t_u_person drop column gzzw;
ALTER table t_u_person drop column jtzz;
ALTER table t_u_person drop column lrsj;
ALTER table t_u_person drop column sfdl;
ALTER table t_u_person drop column xl;
ALTER table t_u_person drop column yxsj_xs;

ALTER TABLE t_s_baseinfo CHANGE versionnumber version CHAR(255);

ALTER table t_s_role drop  column dept_level;
ALTER table t_s_role drop  column sfld;
ALTER table t_s_role drop  column sftq;



/* Date: 2013/8/7 16:31:00 
   author :  qinwei
*/
-- ----------------------------
--  Table structure for `t_m_case`
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;


-- ----------------------------
--  Table structure for `t_m_casetype`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_casetype`;
CREATE TABLE `t_m_casetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_m_casevideos`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_casevideos`;
CREATE TABLE `t_m_casevideos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_code` varchar(255) NOT NULL COMMENT '°¸¼þ±àºÅ',
  `video_code` varchar(255) NOT NULL COMMENT 'ÊÓÆµ±àºÅ',
  `status` int(10) NOT NULL DEFAULT '1',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=gbk;

/*
* Date: 2013/8/8 17:17:00
* Author: Karl
* Decription: for menu international 
*/
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=gbk;

/*
* Date: 2013/8/15 16:13:00
* Author: Karl
* Decription: iso language  
*/
-- ----------------------------
--  Table structure for `t_s_language`
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









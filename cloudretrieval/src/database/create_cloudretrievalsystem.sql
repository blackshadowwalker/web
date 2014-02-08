/*
MySQL Backup
Source Server Version: 5.1.55
Source Database: cloudretrieval
Date: 2013/8/15 16:13:02
*/
CREATE DATABASE IF NOT EXISTS cloudretrieval DEFAULT CHARACTER SET GBK;

use cloudretrieval;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `t_m_baseinfo`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_m_casetype`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_casetype`;
CREATE TABLE `t_m_casetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_m_casevideos`
-- ----------------------------
DROP TABLE IF EXISTS `t_m_casevideos`;
CREATE TABLE `t_m_casevideos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_code` varchar(255) NOT NULL COMMENT '案件编号',
  `video_code` varchar(255) NOT NULL COMMENT '视频编号',
  `status` int(10) NOT NULL DEFAULT '1',
  `ctTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_m_report`
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
) ENGINE=MyISAM AUTO_INCREMENT=2782 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_m_tasks`
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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_m_videos`
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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_s_baseinfo`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_s_code`
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
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `t_s_cwlog`
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gbk COMMENT='错误日志';

-- ----------------------------
--  Table structure for `t_s_czlog`
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
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=gbk COMMENT='操作日志';

-- ----------------------------
--  Table structure for `t_s_databack`
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
--  Table structure for `t_s_dept`
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `t_s_deptmgr`
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `t_s_ggfj`
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

-- ----------------------------
--  Table structure for `t_s_location`
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_s_role`
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
--  Table structure for `t_s_rolevalue`
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
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
--  Table structure for `t_s_ruler`
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
  `xuhao` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1559 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
--  Table structure for `t_s_rulervalue`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_rulervalue`;
CREATE TABLE `t_s_rulervalue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ruler_code` varchar(255) DEFAULT NULL,
  `language` varchar(64) DEFAULT NULL,
  `ruler_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `t_s_uploadfiles`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COMMENT='记录上传文件';

-- ----------------------------
--  Table structure for `t_s_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_userrole`;
CREATE TABLE `t_s_userrole` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_code` char(20) CHARACTER SET latin1 NOT NULL,
  `role_code` char(20) CHARACTER SET latin1 NOT NULL,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
--  Table structure for `t_u_person`
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
  `tel` varchar(50) COLLATE gbk_bin DEFAULT NULL COMMENT '电话',
  `mail` varchar(50) COLLATE gbk_bin DEFAULT NULL,
  `tupian` char(255) COLLATE gbk_bin DEFAULT NULL,
  `status` int(10) DEFAULT '1' COMMENT '是否正常',
  PRIMARY KEY (`id`),
  KEY `t_u_perosn_idx2` (`user_code`,`dept_code`,`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
--  View definition for `t_m_report_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_m_report_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t_m_report_view` AS select `r`.`id` AS `id`,`r`.`LPNumber` AS `LPNumber`,`r`.`frameCTS` AS `frameCTS`,`r`.`absTime` AS `absTime` from ((`t_m_report` `r` join `t_m_tasks` `t`) join `t_m_videos` `v`) where ((`r`.`status` = 1) and (`r`.`taskId` = `t`.`taskID`) and (`t`.`inputVideoId` = `v`.`id`) and (`v`.`uploader` = 'admin'));

-- ----------------------------
--  View definition for `t_s_baseinfoview`
-- ----------------------------
DROP VIEW IF EXISTS `t_s_baseinfoview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t_s_baseinfoview` AS select `a`.`id` AS `id`,`b`.`filePath` AS `logPath`,`a`.`mainTitle` AS `mainTitle`,`a`.`footerContent` AS `footerContent`,`a`.`work` AS `work`,`a`.`status` AS `status`,`a`.`ctTime` AS `ctTime` from (`t_s_baseinfo` `a` join `t_s_uploadfiles` `b`) where ((1 = 1) and (`a`.`logo` = `b`.`fileCode`));

-- ----------------------------
--  View definition for `t_v_role_ruler`
-- ----------------------------
DROP VIEW IF EXISTS `t_v_role_ruler`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t_v_role_ruler` AS select `a`.`id` AS `id`,`a`.`ruler_code` AS `ruler_code`,`b`.`ruler_name` AS `ruler_name`,`b`.`language` AS `language`,`a`.`ruler_page` AS `ruler_page`,`a`.`ruler_level` AS `ruler_level`,`a`.`ruler_echo` AS `ruler_echo`,`a`.`ruler_manager` AS `ruler_manager`,`a`.`sffq` AS `sffq`,`a`.`status` AS `STATUS`,`a`.`time` AS `time`,`a`.`target` AS `target`,`a`.`xuhao` AS `xuhao`,`c`.`role_code` AS `role_code`,`c`.`ruler_word` AS `ruler_word` from ((`t_s_ruler` `a` join `t_s_rulervalue` `b`) join `t_s_rolevalue` `c`) where ((`a`.`ruler_code` = `b`.`ruler_code`) and (`a`.`ruler_code` = `c`.`ruler_code`) and (`c`.`status` = 1));

-- ----------------------------
--  View definition for `t_v_ruler`
-- ----------------------------
DROP VIEW IF EXISTS `t_v_ruler`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `t_v_ruler` AS select `a`.`id` AS `id`,`a`.`ruler_code` AS `ruler_code`,`b`.`ruler_name` AS `ruler_name`,`b`.`language` AS `language`,`a`.`ruler_page` AS `ruler_page`,`a`.`ruler_level` AS `ruler_level`,`a`.`ruler_echo` AS `ruler_echo`,`a`.`ruler_manager` AS `ruler_manager`,`a`.`sffq` AS `sffq`,`a`.`status` AS `STATUS`,`a`.`time` AS `time`,`a`.`target` AS `target`,`a`.`xuhao` AS `xuhao` from (`t_s_ruler` `a` join `t_s_rulervalue` `b`) where (`a`.`ruler_code` = `b`.`ruler_code`);

-- ----------------------------
--  View definition for `view_ggfj`
-- ----------------------------
DROP VIEW IF EXISTS `view_ggfj`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ggfj` AS select `a`.`id` AS `id`,`a`.`value` AS `value`,`a`.`path` AS `path`,`b`.`user_name` AS `person`,`a`.`sc_rq` AS `sc_rq`,`a`.`status` AS `status` from (`t_s_ggfj` `a` join `t_u_person` `b`) where ((1 = 1) and (convert(`a`.`person` using utf8) = `b`.`user_code`));

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `t_m_baseinfo` VALUES ('1','admin','resonate','http://10.168.1.160:8080/api/services/soap/','3','http://10.168.1.160:8080','upload/swfupload/swfupload.swf','upload/upload.do?','D:/prod/_schlitterdevMediaRoot/HOME_admin','admin','http://10.168.1.160:81','_schlitterdevMediaRoot/HOME_admin','1','2013-07-11 16:38:52','1');
INSERT INTO `t_m_casetype` VALUES ('1','嫌疑','0'), ('2','特大嫌疑','0'), ('3','毁坏公物','1'), ('4','交通肇事','1');
INSERT INTO `t_s_baseinfo` VALUES ('1','1375847109461','信帧智能交通云分析系统','建议使用IE浏览器，分辨率在1024*768以上','1','1','2013-08-07 16:17:24','0.9.2');
INSERT INTO `t_s_code` VALUES ('1','t_s_ruler.ruler_level','0','一级菜单',NULL,'2011-03-08 10:21:14','1',NULL), ('2','t_s_ruler.ruler_echo','0','菜单显示',NULL,'2011-09-05 13:39:29','1',NULL), ('3','t_s_ruler.ruler_level','1','二级菜单',NULL,'2011-09-05 13:39:29','1',NULL), ('4','t_s_ruler.ruler_level','2','三级菜单','','2013-05-02 11:38:18','1',NULL), ('5','t_s_ruler.ruler_echo','1','菜单不显示',NULL,'2011-09-05 13:39:29','1',NULL), ('9','t_s_dept.dept_level','0','总部',NULL,'2012-09-07 01:35:20','1',NULL), ('11','t_u_khxx.sex','0','男',NULL,'2011-09-05 13:39:29','1',NULL), ('12','t_u_khxx.sex','1','女',NULL,'2011-09-05 13:39:29','1',NULL), ('18','t_u_person.status','0','注销',NULL,'2011-09-05 13:39:29','1',NULL), ('19','t_u_person.status','1','正常',NULL,'2011-09-05 13:39:29','1',NULL), ('20','t_s_bz','1','是',NULL,'2011-09-05 13:39:29','1',NULL), ('21','t_s_bz','0','否',NULL,'2011-09-05 13:39:29','1',NULL), ('22','t_s_dept_kf.table_name','t_s_rwgl','任务执行',NULL,'2011-09-05 13:39:29','1',NULL), ('23','t_s_dept_kf.status','1','正常',NULL,'2011-09-05 13:39:29','1',NULL), ('24','t_s_dept_kf.status','0','已取消',NULL,'2011-09-05 13:39:29','1',NULL), ('25','t_s_qjlx.bz','0','否',NULL,'2011-09-05 13:39:29','1',NULL), ('26','t_s_qjlx.bz','1','是',NULL,'2011-09-05 13:39:29','1',NULL), ('69','t_z_zlk.zllx','1','word文档','','2011-09-06 08:42:27','1',NULL), ('70','t_z_zlk.zllx','2','execl文档','','2011-09-06 08:42:43','1',NULL), ('71','t_z_zlk.zllx','3','ppt文档','','2011-09-06 08:42:52','1',NULL), ('72','t_z_zlk.zllx','4','rar文档','','2011-09-06 08:43:01','1',NULL), ('73','t_z_zlk.zllx','5','视频资料','','2011-09-06 09:02:18','1',NULL), ('74','t_z_zlk.zllx','6','其他的','','2013-03-28 15:47:20','1',NULL), ('75','t_m_report.xycd','0','一般',NULL,'2013-08-01 15:40:48','1',NULL), ('76','t_m_report.xycd','1','高','','2013-08-13 11:47:51','1',NULL), ('77','t_m_report.xycd','2','很高','','2013-08-13 11:47:05','1',NULL), ('138','t_m_report.xycd','3','排除','','2013-08-01 17:27:59','1',NULL);
INSERT INTO `t_s_dept` VALUES ('1','bm0001','XX总部','bm0001','10','10','007598','2011-05-25 23:30:30','1','0');
INSERT INTO `t_s_deptmgr` VALUES ('1','bm0001','bm0001','10','10','2013-07-15 18:00:03');
INSERT INTO `t_s_ggfj` VALUES ('1','信帧智能监控WEB系统使用手册','upload/public/ggfj_20130425142955.pdf','2013-08-14 10:48:54','admin','2013-08-14 10:47:32','1'), ('2','帮助文档','upload/public/ggfj_20130425142955.pdf','2013-08-14 10:48:57','admin','2013-08-14 10:47:23','1');
INSERT INTO `t_s_language` VALUES ('1','zh_CN','zh','China','Chinese(S)','简体中文','1','1'), ('2','zh_TW','zh','China','Chinese (T)','繁體中文','0','1'), ('3','zh_SG','zh','Singapore','Chinese (Singapore)','Singapore','0','1'), ('4','en_US','en','United States','English (United States)','United States','1','1'), ('5','fr_FR','fr','France','French (France)','France','0','1');
INSERT INTO `t_s_location` VALUES ('1','dl','中国',NULL,'116.406942','39.857582','6','','2013-07-15 18:02:07','1');
INSERT INTO `t_s_role` VALUES ('1','xtgl','系统管理员','2011-03-04 22:12:58','1'), ('2','ybyh','一般用户1','2011-05-22 10:44:54','1');
INSERT INTO `t_s_rolevalue` VALUES ('1','xtgl','xtgl','QUIDV','2011-03-04 22:38:28','1'), ('5','xtgl','role','QUIDV','2011-03-05 20:44:51','1'), ('2','xtgl','xtglxx','QUIVD','2013-03-22 09:19:24','1'), ('4','xtgl','jbxxgl','QUIVD','2013-05-07 09:49:23','1'), ('3','xtgl','ruler','QUIVD','2013-07-12 09:15:37','1');
INSERT INTO `t_s_ruler` VALUES ('1','ruler','菜单管理','','/rulerAction.do','2','0','xtglxx','0','1','2008-10-31 00:00:00','0','0'), ('2','role','角色/权限管理','','/roleAction.do','2','0','jbxxgl','0','1','2008-10-31 00:00:00','0','0'), ('4','dept','机构管理','','/deptAction.do','2','0','jbxxgl',NULL,'1','2011-03-27 01:07:31','0','0'), ('5','person','人员管理','','/personAction.do','2','0','jbxxgl',NULL,'1','2011-03-29 02:08:27','0','0'), ('10','xtgl','系统管理','','','0','0','xtgl',NULL,'1','2013-05-07 09:42:31','0','0'), ('7','code','标准数据管理','','/codeAction.do','2','0','xtglxx','0','1','2008-10-31 00:00:00','0','0'), ('8','xtglxx','系统信息管理','','','1','0','xtgl',NULL,'1','2009-06-10 00:00:00','0','0'), ('1521','cloudxx','分析中心','','','1','0','cloud',NULL,'1','2013-05-07 13:04:50','0','0'), ('600','sbxxgl','设备信息管理','','','0','0','sbxxgl',NULL,'1','2012-09-07 01:59:42','0','3'), ('1328','sbxxglxx','信息管理','','','1','0','sbxxgl',NULL,'1','2012-09-07 02:06:26','0','0'), ('1331','baseInfo','系统参数','','/baseInfoAction.do','2','0','xtglxx',NULL,'1','2013-03-25 14:37:45','0','0'), ('1332','location','地理信息管理','','/locationAction.do','2','0','sbxxglxx',NULL,'1','2013-03-26 18:27:55','0','0'), ('110','backUpData','数据库备份与恢复','','/dataMgrAction.do','2','0','xtglxx',NULL,'1','2013-03-29 13:32:48','0','0'), ('1100','cloud','云计算分析中心','','','0','0','cloud',NULL,'1','2013-03-30 18:32:13','','2'), ('1536','taskmgr','任务管理','','/taskMgrAction.do','2','0','cloudxx',NULL,'1','2013-05-07 18:30:22','0','0'), ('1553','jbxxgl','基本信息管理','','','1','0','xtgl',NULL,'1','2013-07-15 11:10:15','0','0'), ('1529','loggMgr','日志管理','','','1','0','logMgr',NULL,'1','2013-05-07 16:09:43','0','0'), ('1530','userlog','用户日志','','/userlogAction.do','2','0','loggMgr',NULL,'1','2013-05-07 16:10:14','0','0'), ('1531','errorlog','网页程序异常','','/errorlogAction.do','2','0','loggMgr',NULL,'1','2013-05-07 16:10:32','0','0'), ('1537','reportlist','报表分析','','/statisticAction.do','2','0','cloudxx',NULL,'1','2013-05-07 18:30:41','0','0'), ('1538','car-gis','车辆轨迹分析','','/cloudVehicleTrackAction.do','2','0','cloudxx',NULL,'1','2013-05-07 18:31:06','0','0'), ('1539','filemgr','文件管理','','/fileMgrAction.do','2','0','cloudxx',NULL,'1','2013-05-07 18:31:21','0','0'), ('1547','watchedFolder','监视列表','','/watchedFolderAction.do','2','0','cloudxx',NULL,'1','2013-06-09 11:37:53','0','0'), ('1551','logMgr','日志管理','','','0','0','logMgr',NULL,'1','2013-07-15 11:05:25','0','50'), ('1550','baseInformation','默认参数','','/baseInformationAction.do','2','0','cloudxx',NULL,'1','2013-07-01 17:45:18','0','0'), ('1554','ajgl','案件管理','','','0','0','ajgl',NULL,'1','2013-08-01 09:03:04','0','1'), ('1555','ajglxx','案件信息管理','','','1','0','ajgl',NULL,'1','2013-08-01 09:03:50','0','0'), ('1556','clgl','车辆管理','','/clglAction.do','2','0','ajglxx',NULL,'1','2013-08-01 09:04:03','0','0'), ('1557','casemanageAction','案件管理','','/casemanageAction.do','2','0','ajglxx',NULL,'1','2013-08-01 10:27:35','0','0'), ('1558','casetypeAction','案件类型管理','','/casetypeAction.do','2','0','ajglxx',NULL,'1','2013-08-02 11:04:04','0','0');
INSERT INTO `t_s_rulervalue` VALUES ('1','ruler','zh_CN','菜单管理'), ('2','ruler','en_US','Menu'), ('3','dept','zh_CN','机构管理'), ('4','dept','en_US','Department'), ('5','xtgl','zh_CN','系统管理'), ('6','xtgl','en_US','System'), ('7','xtglxx','zh_CN','系统信息管理'), ('8','xtglxx','en_US','System'), ('9','sbxxgl','zh_CN','设备信息管理'), ('10','sbxxgl','en_US','Equipment'), ('11','sbxxglxx','zh_CN','信息管理'), ('12','sbxxglxx','en_US','Equipment'), ('13','location','zh_CN','地理信息管理'), ('14','location','en_US','Location'), ('15','cloud','zh_CN','云计算分析中心'), ('16','cloud','en_US','Analysis'), ('17','loggMgr','zh_CN','日志管理'), ('18','loggMgr','en_US','Log Manager'), ('19','userlog','zh_CN','用户日志'), ('20','userlog','en_US','User Log'), ('21','reportlist','zh_CN','报表分析'), ('22','reportlist','en_US','Report'), ('23','filemgr','zh_CN','文件管理'), ('24','filemgr','en_US','Video File'), ('25','logMgr','zh_CN','日志管理'), ('26','logMgr','en_US','Log Manager'), ('27','ajgl','zh_CN','案件管理'), ('28','ajgl','en_US','Case'), ('29','ajglxx','zh_CN','案件信息管理'), ('30','ajglxx','en_US','Case'), ('31','clgl','zh_CN','车辆管理'), ('32','clgl','en_US','Vehicle'), ('33','casemanageAction','zh_CN','案件管理'), ('34','casemanageAction','en_US','Case'), ('35','casetypeAction','zh_CN','案件类型管理'), ('36','casetypeAction','en_US','Case Type'), ('37','role','zh_CN','角色/权限管理'), ('38','role','en_US','Role'), ('39','person','zh_CN','人员管理'), ('40','person','en_US','Person'), ('41','code','zh_CN','标准数据管理'), ('42','code','en_US','BaseData'), ('43','cloudxx','zh_CN','分析中心'), ('44','cloudxx','en_US','Video Analy'), ('45','baseInfo','zh_CN','系统参数'), ('46','baseInfo','en_US','System Parameter'), ('47','backUpData','zh_CN','数据库备份与恢复'), ('48','backUpData','en_US','Database'), ('49','taskmgr','zh_CN','任务管理'), ('50','taskmgr','en_US','Tasks'), ('51','jbxxgl','zh_CN','基本信息管理'), ('52','jbxxgl','en_US','BaseInfo'), ('53','errorlog','zh_CN','网页程序异常'), ('54','errorlog','en_US','Sys Log'), ('55','car-gis','zh_CN','车辆轨迹分析'), ('56','car-gis','en_US','Car GIS'), ('57','watchedFolder','zh_CN','监视列表'), ('58','watchedFolder','en_US','WatchFolder'), ('59','baseInformation','zh_CN','默认参数'), ('60','baseInformation','en_US','Default Parameters');
INSERT INTO `t_s_uploadfiles` VALUES ('1','1364525015449','logo','logo','/upload/logo/logo_201303290243340.jpg','2013-07-15 18:10:40',NULL,'1');
INSERT INTO `t_s_userrole` VALUES ('1','admin','xtgl','2011-03-29 07:12:27','1');
INSERT INTO `t_u_person` VALUES ('1','admin','管理员','admin','en_US','bm0001','xtgl','男','','18653156061','','','1','1');


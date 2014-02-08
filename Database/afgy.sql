/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.252
Source Server Version : 50513
Source Host           : 10.168.1.252:3306
Source Database       : afgy

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2014-01-28 10:51:59
*/

SET FOREIGN_KEY_CHECKS=0;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_baseinfo
-- ----------------------------
INSERT INTO t_s_baseinfo VALUES ('2', '1387176575122', '公安图像侦查实战平台', '建议使用IE浏览器，分辨率在1600*900以上', '1', '1', '2013-12-20 23:22:29', '2.0');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gbk COMMENT='错误日志';

-- ----------------------------
-- Records of t_s_cwlog
-- ----------------------------
INSERT INTO t_s_cwlog VALUES ('5', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2013-12-17 14:45:22', 'ycyjBean.detailycyj出现数据库连接错误，操作为：根据id查询异常预警详细信息管理失败！Column \'id\' in where clause is ambiguous', '1');
INSERT INTO t_s_cwlog VALUES ('6', 'admin', '系统管理员', '127.0.0.1', '2013-12-17 16:13:47', 'spnsBean.queryspns出现数据库连接错误，操作为：根据条件查询摄像头信息管理失败！Unknown column \'c.id\' in \'order clause\'', '1');
INSERT INTO t_s_cwlog VALUES ('7', 'admin', '系统管理员', '127.0.0.1', '2013-12-17 16:15:23', 'spnsBean.queryspns出现数据库连接错误，操作为：根据条件查询摄像头信息管理失败！Unknown column \'c.id\' in \'order clause\'', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=51082 DEFAULT CHARSET=gbk COMMENT='操作日志';

-- ----------------------------
-- Records of t_s_czlog
-- ----------------------------

INSERT INTO t_s_czlog VALUES ('51074', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:43:54', '角色管理修改前权限树生成成功！', '1');
INSERT INTO t_s_czlog VALUES ('51075', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:43:55', '根据条件查询角色成功！', '1');
INSERT INTO t_s_czlog VALUES ('51076', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:43:56', '查看角色管理详细信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('51077', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:44:11', '根据条件查询用户信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('51078', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:44:14', '修改前查询用户详细信息成功！', '1');
INSERT INTO t_s_czlog VALUES ('51079', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:44:18', '角色管理修改前权限树生成成功！', '1');
INSERT INTO t_s_czlog VALUES ('51080', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:44:19', '根据条件查询角色成功！', '1');
INSERT INTO t_s_czlog VALUES ('51081', 'admin', '系统管理员', '0:0:0:0:0:0:0:1', '2014-01-02 13:44:23', '查看角色管理详细信息成功！', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_databack
-- ----------------------------
INSERT INTO t_s_databack VALUES ('311', 'system', '20140101001550.sql', '20140101001550.sql', 'c:/webapps/database/afgy/20140101001550.sql', '1083', '2014-01-01 00:15:50', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('312', 'system', '20140102001550.sql', '20140102001550.sql', 'c:/webapps/database/afgy/20140102001550.sql', '1084', '2014-01-02 00:15:50', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('313', 'system', '20140103001550.sql', '20140103001550.sql', 'c:/webapps/database/afgy/20140103001550.sql', '1084', '2014-01-03 00:15:51', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('314', 'system', '20140104001550.sql', '20140104001550.sql', 'c:/webapps/database/afgy/20140104001550.sql', '1084', '2014-01-04 00:15:51', '', '', '0', '1');
INSERT INTO t_s_databack VALUES ('315', 'system', '20140105001551.sql', '20140105001551.sql', 'c:/webapps/database/afgy/20140105001551.sql', '1084', '2014-01-05 00:15:51', '', '', '0', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO t_s_dept VALUES ('86', '1', '1', '1', null, null, '1', '2013-10-10 16:30:54', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO t_s_deptmgr VALUES ('171', '1', '1', '10', '10', '2013-10-10 16:30:54');

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
  PRIMARY KEY (`id`),
  KEY `index_locationId` (`locationId`)
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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
INSERT INTO t_s_role VALUES ('1', 'xtgl', '系统管理员', '0', '1', '1', '2011-03-04 22:12:58', '1', null);
INSERT INTO t_s_role VALUES ('2', 'ybyh', '一般用户', '0', '0', '0', '2011-05-22 10:44:54', '1', null);
INSERT INTO t_s_role VALUES ('4', 'spuer', '超级管理员', '0', '1', '1', '2011-05-31 10:45:56', '1', '0');
INSERT INTO t_s_role VALUES ('5', 'glzx', '管理中心', '10', '1', '0', '2011-05-31 15:01:46', '1', '2');
INSERT INTO t_s_role VALUES ('40', 'Test', '测试组', '10', '0', '0', '2013-03-22 09:22:38', '1', null);
INSERT INTO t_s_role VALUES ('41', 'xftdGroup', '消防通道组', '10', '0', '0', '2013-05-07 10:19:02', '1', null);
INSERT INTO t_s_role VALUES ('42', 'dzjcGroup', '电子警察组', '10', '0', '0', '2013-05-07 10:23:23', '1', null);
INSERT INTO t_s_role VALUES ('43', '1', '1', '10', '1', '1', '2013-10-10 16:29:10', '0', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=3263 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

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
INSERT INTO t_s_rolevalue VALUES ('2679', 'spuer', 'xxgl', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2680', 'spuer', 'xxglxx', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2681', 'spuer', 'xtgl', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2682', 'spuer', 'jcxx', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2683', 'spuer', 'person', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2684', 'spuer', 'dept', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2685', 'spuer', 'bzsj', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2686', 'spuer', 'code', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2687', 'spuer', 'role', 'QUIVD', '2012-09-07 02:06:45', '1');
INSERT INTO t_s_rolevalue VALUES ('2688', 'spuer', 'ruler', 'QUIVD', '2012-09-07 02:06:45', '0');
INSERT INTO t_s_rolevalue VALUES ('2689', 'glzx', 'xxgl', 'QUIVD', '2012-09-07 02:07:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2690', 'glzx', 'xxglxx', 'QUIVD', '2012-09-07 02:07:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2859', 'xtgl', 'xtxxgl', 'QUIVD', '2013-05-07 09:45:41', '1');
INSERT INTO t_s_rolevalue VALUES ('2692', 'spuer', 'xsxxgl', 'QUIVD', '2012-09-07 02:08:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2693', 'xtgl', 'tzgl', 'QUIVD', '2012-09-07 02:09:07', '1');
INSERT INTO t_s_rolevalue VALUES ('2694', 'spuer', 'tzgl', 'QUIVD', '2012-09-07 02:09:13', '1');
INSERT INTO t_s_rolevalue VALUES ('2695', 'glzx', 'xtgl', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2696', 'glzx', 'bzsj', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2697', 'glzx', 'ruler', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2698', 'glzx', 'role', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2699', 'glzx', 'code', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2700', 'glzx', 'jcxx', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2701', 'glzx', 'dept', 'QUIVD', '2013-03-20 18:19:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2702', 'glzx', 'person', 'QUIVD', '2013-03-20 18:19:42', '1');
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
INSERT INTO t_s_rolevalue VALUES ('2713', 'Test', 'xxgl', 'QUIVD', '2013-03-22 09:22:38', '1');
INSERT INTO t_s_rolevalue VALUES ('2714', 'Test', 'xxglxx', 'QUIVD', '2013-03-22 09:22:38', '1');
INSERT INTO t_s_rolevalue VALUES ('2860', 'xtgl', 'carTrack', 'QUIVD', '2013-05-07 09:45:41', '1');
INSERT INTO t_s_rolevalue VALUES ('2716', 'Test', 'person', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2717', 'Test', 'dept', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2718', 'Test', 'jcxx', 'QUIVD', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2719', 'Test', 'bzsj', 'QUIVD', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2720', 'Test', 'code', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2721', 'Test', 'role', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2722', 'Test', 'ruler', 'Q', '2013-03-22 09:22:38', '0');
INSERT INTO t_s_rolevalue VALUES ('2723', 'xtgl', 'baseInfo', 'QUIVD', '2013-03-25 14:38:24', '1');
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
INSERT INTO t_s_rolevalue VALUES ('2744', 'xtgl', 'backUpData', 'QUIVD', '2013-03-29 13:33:08', '0');
INSERT INTO t_s_rolevalue VALUES ('2745', 'xtgl', 'analyServer', 'QUIVD', '2013-03-29 13:54:54', '1');
INSERT INTO t_s_rolevalue VALUES ('2746', 'xtgl', 'eventTableMgr', 'QUIVD', '2013-03-29 13:54:54', '0');
INSERT INTO t_s_rolevalue VALUES ('2747', 'xtgl', 'eventTypeProperty', 'QUIVD', '2013-03-29 13:54:54', '1');
INSERT INTO t_s_rolevalue VALUES ('2748', 'xtgl', 'eventType', 'QUIVD', '2013-03-29 13:54:54', '1');
INSERT INTO t_s_rolevalue VALUES ('2749', 'xtgl', 'areaset', 'QUIVD', '2013-03-29 13:54:54', '0');
INSERT INTO t_s_rolevalue VALUES ('2750', 'xtgl', 'znxs', 'QUIVD', '2013-03-29 14:06:50', '0');
INSERT INTO t_s_rolevalue VALUES ('2751', 'xtgl', 'xczb', 'QUIVD', '2013-03-29 14:06:50', '1');
INSERT INTO t_s_rolevalue VALUES ('2752', 'xtgl', 'nksbfb', 'QUIVD', '2013-03-29 14:06:50', '1');
INSERT INTO t_s_rolevalue VALUES ('2753', 'xtgl', 'carTrack', 'QUIVD', '2013-03-29 14:06:50', '0');
INSERT INTO t_s_rolevalue VALUES ('2754', 'xtgl', 'cameraDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2755', 'xtgl', 'analySerDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2756', 'xtgl', 'nvrDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2757', 'xtgl', 'allDevDistribution', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2758', 'xtgl', 'mapVideo', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2759', 'xtgl', 'wallVideo', 'QUIVD', '2013-03-29 14:29:06', '1');
INSERT INTO t_s_rolevalue VALUES ('2760', 'xtgl', 'tjfx', 'QUIVD', '2013-03-29 14:34:16', '0');
INSERT INTO t_s_rolevalue VALUES ('2761', 'xtgl', 'tjfxxx', 'QUIVD', '2013-03-29 14:34:16', '1');
INSERT INTO t_s_rolevalue VALUES ('2762', 'xtgl', 'dayReport', 'QUIVD', '2013-03-29 14:34:16', '1');
INSERT INTO t_s_rolevalue VALUES ('2763', 'xtgl', 'monthReport', 'QUIVD', '2013-03-29 14:34:16', '1');
INSERT INTO t_s_rolevalue VALUES ('2764', 'xtgl', 'eventReport', 'QUIVD', '2013-03-29 14:46:58', '1');
INSERT INTO t_s_rolevalue VALUES ('2765', 'xtgl', 'IntelligentShow', 'QUIVD', '2013-03-29 15:36:42', '1');
INSERT INTO t_s_rolevalue VALUES ('2766', 'xtgl', 'cloud', 'QUIVD', '2013-03-30 18:32:26', '0');
INSERT INTO t_s_rolevalue VALUES ('2767', 'ybyh', 'eventType', 'Q', '2013-04-07 11:22:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2768', 'ybyh', 'eventTypeProperty', 'QUIVD', '2013-04-07 11:22:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2769', 'ybyh', 'eventTableMgr', 'Q', '2013-04-07 11:22:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2770', 'xtgl', 'base_one_eventReport', 'QUIVD', '2013-04-08 14:54:20', '1');
INSERT INTO t_s_rolevalue VALUES ('2771', 'xtgl', 'web_one', 'QUIVD', '2013-04-09 15:26:39', '0');
INSERT INTO t_s_rolevalue VALUES ('2772', 'xtgl', 'web_one_one', 'QUIVD', '2013-04-09 15:29:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2773', 'xtgl', 'camera_event', 'QUIVD', '2013-04-09 15:43:02', '1');
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
INSERT INTO t_s_rolevalue VALUES ('2812', 'Test', 'location', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2813', 'Test', 'eventTableMgr', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2814', 'Test', 'eventType', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2815', 'Test', 'sbgl', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2816', 'Test', 'cameraInfo', 'QV', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2817', 'Test', 'analyServer', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2818', 'Test', 'dataManagement', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2819', 'Test', 'backUpData', 'QU', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2820', 'Test', 'web_one', 'QUIVD', '2013-04-25 10:59:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2821', 'Test', 'web_one_one', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2822', 'Test', 'web_one_znxs', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2823', 'Test', 'camera_event', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2824', 'Test', 'monitor_event', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2825', 'Test', 'web_one_cameraInfo', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2826', 'Test', 'web_one_headServer', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2827', 'Test', 'cloud', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2828', 'Test', 'znxs', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2829', 'Test', 'xczb', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2830', 'Test', 'intelligentShow', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2831', 'Test', 'wallVideo', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2832', 'Test', 'mapVideo', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2833', 'Test', 'nksbfb', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2834', 'Test', 'nvrDistribution', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2835', 'Test', 'allDevDistribution', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2836', 'Test', 'analySerDistribution', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2837', 'Test', 'cameraDistribution', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2838', 'Test', 'carTrack', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2839', 'Test', 'znfp', 'QUIVD', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2840', 'Test', 'znfpCamera2Analy', 'Q', '2013-04-25 10:59:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2841', 'Test', 'xtgl', 'QUIVD', '2013-04-25 14:46:47', '1');
INSERT INTO t_s_rolevalue VALUES ('2842', 'xtgl', 'ggfj', 'QUIVD', '2013-04-25 15:53:08', '0');
INSERT INTO t_s_rolevalue VALUES ('2843', 'Test', 'znpz', 'QUIVD', '2013-04-25 16:31:26', '1');
INSERT INTO t_s_rolevalue VALUES ('2844', 'xtgl', 'blacklist', 'QUIVD BC', '2013-04-25 17:01:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2845', 'xtgl', 'eventTypeTitle', 'QUIVD', '2013-04-26 16:24:39', '1');
INSERT INTO t_s_rolevalue VALUES ('2846', 'xtgl', 'vehicleTrack', 'QUIVD', '2013-04-28 10:44:58', '1');
INSERT INTO t_s_rolevalue VALUES ('2847', 'Test', 'blacklist', 'Q', '2013-04-28 11:42:35', '1');
INSERT INTO t_s_rolevalue VALUES ('2848', 'Test', 'vehicleTrack', 'QUIVD', '2013-04-28 11:42:35', '1');
INSERT INTO t_s_rolevalue VALUES ('2849', 'xtgl', 'dzjc', 'QUIVD', '2013-05-02 12:01:33', '0');
INSERT INTO t_s_rolevalue VALUES ('2850', 'xtgl', 'cd', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2851', 'xtgl', 'cdzs', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2852', 'xtgl', 'webqq', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2853', 'xtgl', 'oa', 'QUIVD', '2013-05-03 12:45:17', '0');
INSERT INTO t_s_rolevalue VALUES ('2854', 'Test', 'tjfx', 'QUIVD', '2013-05-06 09:57:59', '1');
INSERT INTO t_s_rolevalue VALUES ('2855', 'Test', 'tjfxxx', 'QUIVD', '2013-05-06 09:57:59', '1');
INSERT INTO t_s_rolevalue VALUES ('2856', 'Test', 'dzjc', 'QV', '2013-05-06 09:57:59', '1');
INSERT INTO t_s_rolevalue VALUES ('2857', 'xtgl', 'jtsjtj', 'QUIVD', '2013-05-06 15:17:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2858', 'xtgl', 'jtsjforday', 'QUIVD', '2013-05-06 15:21:11', '1');
INSERT INTO t_s_rolevalue VALUES ('2861', 'xtgl', 'jbxxgl', 'QUIVD', '2013-05-07 09:49:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2862', 'xftdGroup', 'web_one', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2863', 'xftdGroup', 'monitor_event', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2864', 'xftdGroup', 'web_one_one', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2865', 'xftdGroup', 'web_one_znxs', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2866', 'xftdGroup', 'web_one_headServer', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2867', 'xftdGroup', 'web_one_cameraInfo', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2868', 'xftdGroup', 'xtgl', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2869', 'xftdGroup', 'jbxxgl', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2870', 'xftdGroup', 'person', 'Q', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2871', 'xftdGroup', 'xtglxx', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2872', 'xftdGroup', 'backUpData', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2873', 'xftdGroup', 'tjfx', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2874', 'xftdGroup', 'tjfxxx', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2875', 'xftdGroup', 'monthReport', 'QUIVD', '2013-05-07 10:19:02', '0');
INSERT INTO t_s_rolevalue VALUES ('2876', 'xftdGroup', 'dayReport', 'QUIVD', '2013-05-07 10:19:02', '1');
INSERT INTO t_s_rolevalue VALUES ('2877', 'dzjcGroup', 'web_one', 'QUIVD', '2013-05-07 10:23:23', '0');
INSERT INTO t_s_rolevalue VALUES ('2878', 'dzjcGroup', 'web_one_one', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2879', 'dzjcGroup', 'camera_event', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2880', 'dzjcGroup', 'web_one_znxs', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2881', 'dzjcGroup', 'web_one_headServer', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2882', 'dzjcGroup', 'web_one_cameraInfo', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2883', 'dzjcGroup', 'tjfx', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2884', 'dzjcGroup', 'tjfxxx', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2885', 'dzjcGroup', 'monthReport', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2886', 'dzjcGroup', 'dayReport', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2887', 'dzjcGroup', 'xtgl', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2888', 'dzjcGroup', 'jbxxgl', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2889', 'dzjcGroup', 'person', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2890', 'dzjcGroup', 'xtglxx', 'QUIVD', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2891', 'dzjcGroup', 'backUpData', 'QU', '2013-05-07 10:23:23', '1');
INSERT INTO t_s_rolevalue VALUES ('2892', 'xtgl', 'zngg', 'QUIVD', '2013-05-07 10:37:18', '0');
INSERT INTO t_s_rolevalue VALUES ('2893', 'Test', 'role', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2894', 'Test', 'jbxxgl', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2895', 'Test', 'dept', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2896', 'Test', 'person', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2897', 'Test', 'zngg', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2898', 'Test', 'xtglxx', 'QUIVD', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2899', 'Test', 'code', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2900', 'Test', 'baseInfo', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2901', 'Test', 'ruler', 'Q', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2902', 'Test', 'web_one', 'QUIVD', '2013-05-07 10:39:05', '1');
INSERT INTO t_s_rolevalue VALUES ('2903', 'Test', 'eventTypeTitle', 'Q', '2013-05-07 10:41:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2904', 'xtgl', 'spjk', 'QUIVD', '2013-05-07 10:50:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2905', 'xtgl', 'jcbk', 'QUIVD', '2013-05-07 10:50:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2906', 'xtgl', 'jcbkxx', 'QUIVD', '2013-05-07 10:54:44', '1');
INSERT INTO t_s_rolevalue VALUES ('2907', 'xtgl', 'whiteList', 'QUIVD', '2013-05-07 11:09:44', '1');
INSERT INTO t_s_rolevalue VALUES ('2908', 'Test', 'areaset', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2909', 'Test', 'cameraDecParam', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2910', 'Test', 'cameraDecTimestamp', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2911', 'Test', 'cameraDecEvent', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2912', 'Test', 'znfpCamera2Nvr', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2913', 'Test', 'nvr', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2914', 'Test', 'eventReport', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2915', 'Test', 'monthReport', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2916', 'Test', 'dayReport', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2917', 'Test', 'jtsjforday', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2918', 'Test', 'jtsjtj', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2919', 'Test', 'ggfj', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2920', 'Test', 'spjk', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2921', 'Test', 'jcbk', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2922', 'Test', 'jcbkxx', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2923', 'Test', 'whiteList', 'QUIVD', '2013-05-07 11:11:29', '1');
INSERT INTO t_s_rolevalue VALUES ('2924', 'xtgl', 'sbxxgl', 'QUIVD', '2013-05-07 11:27:34', '0');
INSERT INTO t_s_rolevalue VALUES ('2925', 'xtgl', 'sbxxglxx', 'QUIVD', '2013-05-07 11:29:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2926', 'xtgl', 'dzjc', 'QUIVD', '2013-05-07 11:42:14', '1');
INSERT INTO t_s_rolevalue VALUES ('2927', 'xtgl', 'wfcl', 'QUIVD', '2013-05-07 11:47:52', '0');
INSERT INTO t_s_rolevalue VALUES ('2928', 'xtgl', 'wfclxx', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2929', 'xtgl', 'wfsjll', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2930', 'xtgl', 'wfsjlr', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2931', 'xtgl', 'wfsjsh', 'QUIVD', '2013-05-07 11:47:52', '1');
INSERT INTO t_s_rolevalue VALUES ('2932', 'xtgl', 'wfsjxg', 'QUIVD', '2013-05-07 12:09:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2933', 'xtgl', 'jxwfcx', 'QUIVD', '2013-05-07 12:09:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2934', 'xtgl', 'wfclblackList', 'QUIVD', '2013-05-07 12:09:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2935', 'xtgl', 'databaseDesp', 'QUIVD', '2013-05-07 12:24:17', '1');
INSERT INTO t_s_rolevalue VALUES ('2936', 'xtgl', 'wfxw', 'QUIVD', '2013-05-07 12:45:09', '1');
INSERT INTO t_s_rolevalue VALUES ('2937', 'Test', 'databaseDesp', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2938', 'Test', 'wfcl', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2939', 'Test', 'wfclxx', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2940', 'Test', 'wfclblackList', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2941', 'Test', 'jxwfcx', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2942', 'Test', 'wfsjxg', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2943', 'Test', 'wfsjlr', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2944', 'Test', 'wfsjll', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2945', 'Test', 'wfxw', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2946', 'Test', 'sbxxgl', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2947', 'Test', 'sbxxglxx', 'QUIVD', '2013-05-07 12:45:28', '1');
INSERT INTO t_s_rolevalue VALUES ('2948', 'xtgl', 'llzk', 'QUIVD', '2013-05-07 13:03:25', '0');
INSERT INTO t_s_rolevalue VALUES ('2949', 'xtgl', 'llzkxx', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2950', 'xtgl', 'car-day', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2951', 'xtgl', 'car-month', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2952', 'xtgl', 'car-year', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2953', 'xtgl', 'car-timespan', 'QUIVD', '2013-05-07 13:03:25', '1');
INSERT INTO t_s_rolevalue VALUES ('2954', 'Test', 'llzk', 'QUIVD', '2013-05-07 13:03:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2955', 'Test', 'llzkxx', 'QUIVD', '2013-05-07 13:03:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2956', 'Test', 'car-day', 'QUIVD', '2013-05-07 13:03:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2957', 'Test', 'car-month', 'QUIVD', '2013-05-07 13:03:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2958', 'Test', 'car-year', 'QUIVD', '2013-05-07 13:03:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2959', 'Test', 'car-timespan', 'QUIVD', '2013-05-07 13:03:33', '1');
INSERT INTO t_s_rolevalue VALUES ('2960', 'xtgl', 'cloud', 'QUIVD', '2013-05-07 13:03:40', '1');
INSERT INTO t_s_rolevalue VALUES ('2961', 'Test', 'cloudxx', 'QUIVD', '2013-05-07 13:05:30', '1');
INSERT INTO t_s_rolevalue VALUES ('2962', 'Test', 'realtime-fenxi', 'QUIVD', '2013-05-07 13:06:44', '1');
INSERT INTO t_s_rolevalue VALUES ('2963', 'xtgl', 'cloudxx', 'QUIVD', '2013-05-07 13:06:51', '1');
INSERT INTO t_s_rolevalue VALUES ('2964', 'xtgl', 'realtime-fenxi', 'QUIVD', '2013-05-07 13:06:51', '1');
INSERT INTO t_s_rolevalue VALUES ('2965', 'Test', 'history-play', 'QUIVD', '2013-05-07 13:45:51', '1');
INSERT INTO t_s_rolevalue VALUES ('2966', 'xtgl', 'history-play', 'QUIVD', '2013-05-07 13:45:57', '0');
INSERT INTO t_s_rolevalue VALUES ('2967', 'xtgl', 'dzjcQuery', 'QUIVD', '2013-05-07 13:51:47', '1');
INSERT INTO t_s_rolevalue VALUES ('2968', 'xtgl', 'jcbkType', 'QUIVD', '2013-05-07 13:52:10', '1');
INSERT INTO t_s_rolevalue VALUES ('2969', 'Test', 'jcbkType', 'QUIVD', '2013-05-07 13:52:19', '1');
INSERT INTO t_s_rolevalue VALUES ('2970', 'Test', 'dzjcQuery', 'QUIVD', '2013-05-07 13:52:19', '1');
INSERT INTO t_s_rolevalue VALUES ('2971', 'xtgl', 'clgjQuery', 'QUIVD', '2013-05-07 13:55:20', '1');
INSERT INTO t_s_rolevalue VALUES ('2972', 'Test', 'clgjQuery', 'QUIVD', '2013-05-07 13:55:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2973', 'dzjcGroup', 'eventReport', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2974', 'dzjcGroup', 'jtsjtj', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2975', 'dzjcGroup', 'jtsjforday', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2976', 'dzjcGroup', 'dzjc', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2977', 'dzjcGroup', 'zngg', 'QI', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2978', 'dzjcGroup', 'cloud', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2979', 'dzjcGroup', 'cloudxx', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2980', 'dzjcGroup', 'realtime-fenxi', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2981', 'dzjcGroup', 'llzk', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2982', 'dzjcGroup', 'llzkxx', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2983', 'dzjcGroup', 'car-day', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2984', 'dzjcGroup', 'car-month', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2985', 'dzjcGroup', 'car-year', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2986', 'dzjcGroup', 'car-timespan', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2987', 'dzjcGroup', 'sbxxgl', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2988', 'dzjcGroup', 'nksbfb', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2989', 'dzjcGroup', 'allDevDistribution', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2990', 'dzjcGroup', 'nvrDistribution', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2991', 'dzjcGroup', 'analySerDistribution', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2992', 'dzjcGroup', 'cameraDistribution', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2993', 'dzjcGroup', 'sbxxglxx', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2994', 'dzjcGroup', 'cameraDecTimestamp', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2995', 'dzjcGroup', 'cameraDecEvent', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2996', 'dzjcGroup', 'location', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2997', 'dzjcGroup', 'cameraDecParam', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('2998', 'dzjcGroup', 'eventType', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('2999', 'dzjcGroup', 'eventTableMgr', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3000', 'dzjcGroup', 'areaset', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3001', 'dzjcGroup', 'sbgl', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3002', 'dzjcGroup', 'znfpCamera2Nvr', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3003', 'dzjcGroup', 'znfpCamera2Analy', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3004', 'dzjcGroup', 'nvr', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3005', 'dzjcGroup', 'cameraInfo', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3006', 'dzjcGroup', 'analyServer', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3007', 'dzjcGroup', 'jcbk', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3008', 'dzjcGroup', 'jcbkxx', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3009', 'dzjcGroup', 'jcbkType', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3010', 'dzjcGroup', 'dzjcQuery', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3011', 'dzjcGroup', 'whiteList', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3012', 'dzjcGroup', 'clgjQuery', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3013', 'dzjcGroup', 'blacklist', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3014', 'dzjcGroup', 'wfcl', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3015', 'dzjcGroup', 'wfclxx', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3016', 'dzjcGroup', 'wfsjlr', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3017', 'dzjcGroup', 'wfsjll', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3018', 'dzjcGroup', 'wfsjxg', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3019', 'dzjcGroup', 'jxwfcx', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3020', 'dzjcGroup', 'wfxw', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3021', 'dzjcGroup', 'wfclblackList', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3022', 'dzjcGroup', 'znxs', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3023', 'dzjcGroup', 'xczb', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3024', 'dzjcGroup', 'history-play', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3025', 'dzjcGroup', 'intelligentShow', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3026', 'dzjcGroup', 'wallVideo', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3027', 'dzjcGroup', 'mapVideo', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3028', 'dzjcGroup', 'carTrack', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3029', 'dzjcGroup', 'vehicleTrack', 'QUIVD', '2013-05-07 13:57:27', '1');
INSERT INTO t_s_rolevalue VALUES ('3030', 'dzjcGroup', 'baseInfo', 'QUIVD', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3031', 'dzjcGroup', 'code', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3032', 'dzjcGroup', 'ruler', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3033', 'dzjcGroup', 'eventTypeTitle', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3034', 'dzjcGroup', 'databaseDesp', 'Q', '2013-05-07 13:57:27', '0');
INSERT INTO t_s_rolevalue VALUES ('3035', 'dzjcGroup', 'role', 'QUIVD', '2013-05-07 13:57:27', '1');
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
INSERT INTO t_s_rolevalue VALUES ('3081', 'xtgl', 'yearReport', 'QUIVD', '2013-05-07 16:19:44', '1');
INSERT INTO t_s_rolevalue VALUES ('3082', 'xtgl', 'imageSize', 'QUIVD', '2013-05-07 16:19:44', '0');
INSERT INTO t_s_rolevalue VALUES ('3083', 'Test', 'imageSize', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3084', 'Test', 'yearReport', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3085', 'Test', 'logMgr', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3086', 'Test', 'errorlog', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3087', 'Test', 'userlog', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3088', 'Test', 'syslog', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3089', 'Test', 'tptj', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3090', 'Test', 'wfxxsh', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3091', 'Test', 'sctpfs', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3092', 'Test', 'wfxxzs', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3093', 'Test', 'wfxxfs', 'QUIVD', '2013-05-07 16:20:00', '1');
INSERT INTO t_s_rolevalue VALUES ('3094', 'xtgl', 'wfxwtj', 'QUIVD', '2013-05-07 16:22:55', '0');
INSERT INTO t_s_rolevalue VALUES ('3095', 'xtgl', 'deletepictj', 'QUIVD', '2013-05-07 16:22:55', '0');
INSERT INTO t_s_rolevalue VALUES ('3096', 'xtgl', 'timespantj', 'QUIVD', '2013-05-07 16:22:55', '1');
INSERT INTO t_s_rolevalue VALUES ('3097', 'Test', 'wfxwtj', 'QUIVD', '2013-05-07 16:23:03', '1');
INSERT INTO t_s_rolevalue VALUES ('3098', 'Test', 'deletepictj', 'QUIVD', '2013-05-07 16:23:03', '1');
INSERT INTO t_s_rolevalue VALUES ('3099', 'Test', 'timespantj', 'QUIVD', '2013-05-07 16:23:03', '1');
INSERT INTO t_s_rolevalue VALUES ('3100', 'xtgl', 'taskmgr', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3101', 'xtgl', 'reportlist', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3102', 'xtgl', 'car-gis', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3103', 'xtgl', 'filemgr', 'QUIVD', '2013-05-07 18:31:33', '1');
INSERT INTO t_s_rolevalue VALUES ('3104', 'dzjcGroup', 'timespantj', 'QUIVD', '2013-05-15 17:32:48', '1');
INSERT INTO t_s_rolevalue VALUES ('3105', 'dzjcGroup', 'yearReport', 'QUIVD', '2013-05-15 17:32:48', '1');
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
INSERT INTO t_s_rolevalue VALUES ('3127', 'xtgl', 'wfxwtj', 'QUIVD', '2013-05-24 12:04:57', '1');
INSERT INTO t_s_rolevalue VALUES ('3128', 'xftdGroup', 'xfsjforyear', 'QUIVD', '2013-05-24 12:13:51', '1');
INSERT INTO t_s_rolevalue VALUES ('3129', 'xftdGroup', 'xfsjfortimetotime', 'QUIVD', '2013-05-24 12:13:51', '1');
INSERT INTO t_s_rolevalue VALUES ('3130', 'xftdGroup', 'xfsjformonth', 'QUIVD', '2013-05-24 12:13:51', '1');
INSERT INTO t_s_rolevalue VALUES ('3131', 'xftdGroup', 'xfsjforday', 'QUIVD', '2013-05-24 12:13:51', '1');
INSERT INTO t_s_rolevalue VALUES ('3132', 'dzjcGroup', 'wfclgl', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3133', 'dzjcGroup', 'jtwfcx', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3134', 'dzjcGroup', 'tptj', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3135', 'dzjcGroup', 'wfsjgl', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3136', 'dzjcGroup', 'wfxxsh', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3137', 'dzjcGroup', 'wfxxfs', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3138', 'dzjcGroup', 'wfxxzs', 'QUIVD', '2013-05-24 12:15:26', '1');
INSERT INTO t_s_rolevalue VALUES ('3139', 'dzjcGroup', 'wfxwtj', 'QUIVD', '2013-05-24 18:03:53', '0');
INSERT INTO t_s_rolevalue VALUES ('3140', 'xtgl', 'yggzl', 'QUIVD', '2013-06-03 14:52:48', '1');
INSERT INTO t_s_rolevalue VALUES ('3141', 'xtgl', 'watchedFolder', 'QUIVD', '2013-06-09 11:38:16', '1');
INSERT INTO t_s_rolevalue VALUES ('3142', 'dzjcGroup', 'yggzl', 'QUIVD', '2013-06-14 10:50:01', '0');
INSERT INTO t_s_rolevalue VALUES ('3143', 'dzjcGroup', 'logMgr', 'QUIVD', '2013-06-14 10:50:01', '1');
INSERT INTO t_s_rolevalue VALUES ('3144', 'dzjcGroup', 'userlog', 'QUIVD', '2013-06-14 10:50:01', '1');
INSERT INTO t_s_rolevalue VALUES ('3145', 'dzjcGroup', 'reportlist', 'QUIVD', '2013-06-14 10:50:01', '1');
INSERT INTO t_s_rolevalue VALUES ('3146', 'xtgl', 'wfclblack', 'QUIVD', '2013-06-17 11:58:51', '1');
INSERT INTO t_s_rolevalue VALUES ('3147', 'dzjcGroup', 'dept', 'QUIVD', '2013-06-17 16:34:57', '1');
INSERT INTO t_s_rolevalue VALUES ('3148', 'dzjcGroup', 'wfclblack', 'QUIVD', '2013-06-17 18:06:55', '1');
INSERT INTO t_s_rolevalue VALUES ('3149', 'spuer', 'xtglxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3150', 'spuer', 'databaseDesp', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3151', 'spuer', 'backUpData', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3152', 'spuer', 'baseInfo', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3153', 'spuer', 'eventTypeTitle', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3154', 'spuer', 'jbxxgl', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3155', 'spuer', 'ggfj', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3156', 'spuer', 'zngg', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3157', 'spuer', 'web_one', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3158', 'spuer', 'web_one_one', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3159', 'spuer', 'web_one_znxs', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3160', 'spuer', 'web_one_headServer', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3161', 'spuer', 'web_one_cameraInfo', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3162', 'spuer', 'monitor_event', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3163', 'spuer', 'camera_event', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3164', 'spuer', 'llzk', 'QUIVD', '2013-06-20 10:25:08', '0');
INSERT INTO t_s_rolevalue VALUES ('3165', 'spuer', 'llzkxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3166', 'spuer', 'car-timespan', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3167', 'spuer', 'car-year', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3168', 'spuer', 'car-month', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3169', 'spuer', 'car-day', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3170', 'spuer', 'znxs', 'QUIVD', '2013-06-20 10:25:08', '0');
INSERT INTO t_s_rolevalue VALUES ('3171', 'spuer', 'carTrack', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3172', 'spuer', 'vehicleTrack', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3173', 'spuer', 'xczb', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3174', 'spuer', 'history-play', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3175', 'spuer', 'wallVideo', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3176', 'spuer', 'mapVideo', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3177', 'spuer', 'intelligentShow', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3178', 'spuer', 'jcbk', 'QUIVD', '2013-06-20 10:25:08', '0');
INSERT INTO t_s_rolevalue VALUES ('3179', 'spuer', 'jcbkxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3180', 'spuer', 'jcbkType', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3181', 'spuer', 'dzjcQuery', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3182', 'spuer', 'clgjQuery', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3183', 'spuer', 'whiteList', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3184', 'spuer', 'blacklist', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3185', 'spuer', 'tjfx', 'QUIVD', '2013-06-20 10:25:08', '0');
INSERT INTO t_s_rolevalue VALUES ('3186', 'spuer', 'tjfxxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3187', 'spuer', 'yggzl', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3188', 'spuer', 'xfsjforyear', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3189', 'spuer', 'xfsjfortimetotime', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3190', 'spuer', 'xfsjformonth', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3191', 'spuer', 'xfsjforday', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3192', 'spuer', 'timespantj', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3193', 'spuer', 'deletepictj', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3194', 'spuer', 'wfxwtj', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3195', 'spuer', 'yearReport', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3196', 'spuer', 'monthReport', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3197', 'spuer', 'jtsjforday', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3198', 'spuer', 'logMgr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3199', 'spuer', 'syslog', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3200', 'spuer', 'errorlog', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3201', 'spuer', 'userlog', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3202', 'spuer', 'sbxxgl', 'QUIVD', '2013-06-20 10:25:08', '0');
INSERT INTO t_s_rolevalue VALUES ('3203', 'spuer', 'nksbfb', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3204', 'spuer', 'nvrDistribution', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3205', 'spuer', 'analySerDistribution', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3206', 'spuer', 'cameraDistribution', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3207', 'spuer', 'allDevDistribution', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3208', 'spuer', 'sbxxglxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3209', 'spuer', 'imageSize', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3210', 'spuer', 'areaset', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3211', 'spuer', 'eventTableMgr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3212', 'spuer', 'eventType', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3213', 'spuer', 'location', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3214', 'spuer', 'sbgl', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3215', 'spuer', 'nvr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3216', 'spuer', 'analyServer', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3217', 'spuer', 'znfpCamera2Nvr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3218', 'spuer', 'znfpCamera2Analy', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3219', 'spuer', 'cameraInfo', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3220', 'spuer', 'wfcl', 'QUIVD', '2013-06-20 10:25:08', '0');
INSERT INTO t_s_rolevalue VALUES ('3221', 'spuer', 'wfxxsh', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3222', 'spuer', 'sctpfs', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3223', 'spuer', 'wfxxfs', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3224', 'spuer', 'wfxxzs', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3225', 'spuer', 'wfclxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3226', 'spuer', 'wfxw', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3227', 'spuer', 'wfsjlr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3228', 'spuer', 'wfclgl', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3229', 'spuer', 'tptj', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3230', 'spuer', 'wfclblack', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3231', 'spuer', 'wfclblackList', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3232', 'spuer', 'jtwfcx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3233', 'spuer', 'wfsjgl', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3234', 'spuer', 'cloud', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3235', 'spuer', 'cloudxx', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3236', 'spuer', 'realtime-fenxi', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3237', 'spuer', 'watchedFolder', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3238', 'spuer', 'filemgr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3239', 'spuer', 'car-gis', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3240', 'spuer', 'reportlist', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3241', 'spuer', 'taskmgr', 'QUIVD', '2013-06-20 10:25:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3242', 'spuer', 'ruler', 'QUIVD', '2013-06-20 10:26:57', '1');
INSERT INTO t_s_rolevalue VALUES ('3243', 'spuer', 'cameraDecTimestamp', 'QUIVD', '2013-06-20 10:30:01', '1');
INSERT INTO t_s_rolevalue VALUES ('3244', 'dzjcGroup', 'sctpfs', 'QUIVD', '2013-06-20 14:27:32', '1');
INSERT INTO t_s_rolevalue VALUES ('3245', 'dzjcGroup', 'errorlog', 'QUIVD', '2013-06-20 14:27:32', '1');
INSERT INTO t_s_rolevalue VALUES ('3246', 'dzjcGroup', 'syslog', 'QUIVD', '2013-06-20 14:27:32', '1');
INSERT INTO t_s_rolevalue VALUES ('3247', 'xtgl', 'offlineShow', 'QUIVD', '2013-06-21 11:29:11', '1');
INSERT INTO t_s_rolevalue VALUES ('3248', 'Test', 'watchedFolder', 'QUIVD', '2013-06-24 12:03:57', '1');
INSERT INTO t_s_rolevalue VALUES ('3249', 'dzjcGroup', 'offlineShow', 'QUIVD', '2013-06-25 13:28:41', '1');
INSERT INTO t_s_rolevalue VALUES ('3250', 'xtgl', 'syslog', 'QUIVD', '2013-06-26 09:24:09', '1');
INSERT INTO t_s_rolevalue VALUES ('3251', 'xtgl', 'dept', 'QUIVD', '2013-06-26 09:24:09', '1');
INSERT INTO t_s_rolevalue VALUES ('3252', 'xtgl', 'wfcl', 'QUIVD', '2013-06-26 09:34:50', '0');
INSERT INTO t_s_rolevalue VALUES ('3253', 'xftdGroup', 'baseInfo', 'QUIVD', '2013-08-27 10:42:09', '1');
INSERT INTO t_s_rolevalue VALUES ('3254', '1', 'wfcl', 'QUIVD', '2013-10-10 16:29:10', '0');
INSERT INTO t_s_rolevalue VALUES ('3255', '1', 'wfxxsh', 'QUIVD', '2013-10-10 16:29:40', '0');
INSERT INTO t_s_rolevalue VALUES ('3256', 'xtgl', 'afintelligentShow', 'QUIVD', '2013-10-12 10:04:08', '1');
INSERT INTO t_s_rolevalue VALUES ('3257', 'xtgl', 'spns', 'QUIVD', '2013-12-16 10:37:03', '1');
INSERT INTO t_s_rolevalue VALUES ('3258', 'xtgl', 'ycyj', 'QUIVD', '2013-12-16 10:37:03', '1');
INSERT INTO t_s_rolevalue VALUES ('3259', 'xtgl', 'ycyjxx', 'QUIVD', '2013-12-16 10:40:47', '1');
INSERT INTO t_s_rolevalue VALUES ('3260', 'xtgl', 'spnsxx', 'QUIVD', '2013-12-16 10:40:47', '1');
INSERT INTO t_s_rolevalue VALUES ('3261', 'xtgl', 'spnsxxxx', 'QUIVD', '2013-12-16 15:15:05', '1');
INSERT INTO t_s_rolevalue VALUES ('3262', 'xtgl', 'ycyjxxxx', 'QUIVD', '2013-12-16 15:15:05', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=1558 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_s_ruler
-- ----------------------------
INSERT INTO t_s_ruler VALUES ('102', 'ruler', '菜单管理', '', '/rulerAction.do', '2', '0', 'xtglxx', '0', '1', '2008-10-31 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('103', 'role', '角色/权限管理', '', '/roleAction.do', '2', '0', 'jbxxgl', '0', '1', '2008-10-31 00:00:00', '0', '1');
INSERT INTO t_s_ruler VALUES ('106', 'dept', '机构管理', '', '/deptAction.do', '2', '0', 'jbxxgl', null, '1', '2011-03-27 01:07:31', '0', null);
INSERT INTO t_s_ruler VALUES ('107', 'person', '人员管理', '', '/personAction.do', '2', '0', 'jbxxgl', null, '1', '2011-03-29 02:08:27', '0', null);
INSERT INTO t_s_ruler VALUES ('100', 'xtgl', '系统管理', '', '', '0', '0', 'xtgl', null, '1', '2013-05-07 09:42:31', '0', '1');
INSERT INTO t_s_ruler VALUES ('105', 'code', '标准数据管理', '', '/codeAction.do', '2', '1', 'xtglxx', '0', '1', '2008-10-31 00:00:00', '0', '2');
INSERT INTO t_s_ruler VALUES ('101', 'xtglxx', '系统信息管理', '', '', '1', '0', 'xtgl', null, '1', '2009-06-10 00:00:00', '0', '0');
INSERT INTO t_s_ruler VALUES ('1145', 'jbxxgl', '基本信息管理', '', '', '1', '0', 'xtgl', null, '1', '2011-03-08 15:16:07', '0', '1');
INSERT INTO t_s_ruler VALUES ('1521', 'cloudxx', '分析中心', '', '', '1', '0', 'cloud', null, '1', '2013-05-07 13:04:50', '0', null);
INSERT INTO t_s_ruler VALUES ('1385', 'zngg', '站内公告', '', '/NotFoundAction.do', '2', '0', 'jbxxgl', null, '1', '2013-05-07 10:37:05', '0', null);
INSERT INTO t_s_ruler VALUES ('1328', 'sbxxglxx', '信息管理', '', '', '1', '0', 'sbxxgl', null, '1', '2012-09-07 02:06:26', '0', null);
INSERT INTO t_s_ruler VALUES ('1331', 'baseInfo', '系统参数', '', '/baseInfoAction.do', '2', '0', 'xtglxx', null, '1', '2013-03-25 14:37:45', '0', null);
INSERT INTO t_s_ruler VALUES ('1332', 'location', '地理信息管理', '', '/locationAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-03-26 18:27:55', '0', null);
INSERT INTO t_s_ruler VALUES ('1378', 'ggfj', '公共附件管理', '', '/ggfjAction.do', '2', '0', 'jbxxgl', null, '1', '2013-04-25 15:52:54', '0', null);
INSERT INTO t_s_ruler VALUES ('1380', 'eventTypeTitle', '事件表字段管理', '', '/eventTypeTitleAction.do', '2', '1', 'xtglxx', null, '1', '2013-04-26 16:22:58', '0', null);
INSERT INTO t_s_ruler VALUES ('1381', 'vehicleTrack', '车辆追踪[GIS]', '', '/vehicleTrackAction.do', '2', '1', 'carTrack', null, '1', '2013-04-28 10:44:45', '0', null);
INSERT INTO t_s_ruler VALUES ('1523', 'history-play', '历史回放', '', '/NotFoundAction.do', '2', '0', 'xczb', null, '1', '2013-05-07 13:44:05', '0', null);
INSERT INTO t_s_ruler VALUES ('1528', 'imageSize', '图片尺寸', '', '/NotFoundAction.do', '2', '0', 'sbxxglxx', null, '1', '2013-05-07 15:08:39', '0', null);
INSERT INTO t_s_ruler VALUES ('1529', 'logMgr', '日志管理', '', '', '1', '0', 'xtgl', null, '1', '2013-05-07 16:09:43', '0', null);
INSERT INTO t_s_ruler VALUES ('1530', 'userlog', '用户日志', '', '/userlogAction.do', '2', '0', 'logMgr', null, '1', '2013-05-07 16:10:14', '0', null);
INSERT INTO t_s_ruler VALUES ('1531', 'errorlog', '网页程序异常', '', '/errorlogAction.do', '2', '0', 'logMgr', null, '1', '2013-05-07 16:10:32', '0', null);
INSERT INTO t_s_ruler VALUES ('1532', 'syslog', '系统日志', '', '/NotFoundAction.do', '2', '1', 'logMgr', null, '1', '2013-05-07 16:10:48', '0', null);
INSERT INTO t_s_ruler VALUES ('1534', 'deletepictj', '删除图片统计', '', '/NotFoundAction.do', '2', '0', 'tjfxxx', null, '1', '2013-05-07 16:21:29', '0', null);
INSERT INTO t_s_ruler VALUES ('1538', 'car-gis', '车辆GIS信息', '', '/vehicleTrackAction.do', '2', '1', 'cloudxx', null, '1', '2013-05-07 18:31:06', '0', null);
INSERT INTO t_s_ruler VALUES ('1539', 'filemgr', '文件管理', '', '/NotFoundAction.do', '2', '0', 'cloudxx', null, '1', '2013-05-07 18:31:21', '0', null);
INSERT INTO t_s_ruler VALUES ('1557', 'ycyjxxxx', '异常预警', '', '/ycyjAction.do', '2', '0', 'ycyjxx', null, '1', '2013-12-16 15:14:38', '0', null);
INSERT INTO t_s_ruler VALUES ('1556', 'spnsxxxx', '视频浓缩', '', '/spnsAction.do', '2', '0', 'spnsxx', null, '1', '2013-12-16 15:13:55', '0', null);
INSERT INTO t_s_ruler VALUES ('1552', 'ycyj', '异常预警', '', '', '0', '0', 'ycyj', null, '1', '2013-12-16 10:35:59', '0', null);
INSERT INTO t_s_ruler VALUES ('1553', 'spns', '视频浓缩', '', '', '0', '0', 'spns', null, '1', '2013-12-16 10:36:34', '0', null);
INSERT INTO t_s_ruler VALUES ('1554', 'ycyjxx', '异常行为预警', '', '', '1', '0', 'ycyj', null, '1', '2013-12-16 10:39:49', '0', null);
INSERT INTO t_s_ruler VALUES ('1555', 'spnsxx', '视频浓缩', '', '', '1', '0', 'spns', null, '1', '2013-12-16 10:40:33', '0', null);

-- ----------------------------
-- Table structure for `t_s_uploadfiles`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_uploadfiles`;
CREATE TABLE `t_s_uploadfiles` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `fileCode` char(255) DEFAULT NULL COMMENT '文件code',
  `fileName` char(255) DEFAULT NULL,
  `fileType` char(255) DEFAULT NULL COMMENT '文件类型，若是logo，则一律填写logo',
  `filePath` char(255) DEFAULT 'images/base/404top.png',
  `ctTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `userCode` char(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=gbk COMMENT='记录上传文件';

-- ----------------------------
-- Records of t_s_uploadfiles
-- ----------------------------
INSERT INTO t_s_uploadfiles VALUES ('70', '1387176575122', 'logo', 'logo', '/upload/logo/logo_201312161449210.png', '2013-12-16 14:49:00', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

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
INSERT INTO t_s_userrole VALUES ('326', '100284', 'ybyh', '2013-10-10 16:32:04', '1');

-- ----------------------------
-- Table structure for `t_s_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_video`;
CREATE TABLE `t_s_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inputUrl` varchar(255) DEFAULT NULL,
  `outputUrl` varchar(255) DEFAULT NULL,
  `vedioLength` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_video
-- ----------------------------
INSERT INTO t_s_video VALUES ('1', 'http://teleframe.xicp.net/afgy/upload/3.avi', 'http://teleframe.xicp.net/afgy/upload/test.avi', '5', '1');

-- ----------------------------
-- Table structure for `t_s_warning`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_warning`;
CREATE TABLE `t_s_warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseType` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `location` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `absTime` timestamp NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `video` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `videoTime` varchar(60) CHARACTER SET gbk DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_warning
-- ----------------------------
INSERT INTO t_s_warning VALUES ('1', 'lhf', '上地', '2013-12-16 16:34:22', '0dc31ef15b430a7eb310c91f45df37e3.jpg', 'http://10.168.1.188:8080/afgy/upload/test.avi', '25', '1');
INSERT INTO t_s_warning VALUES ('2', 'scd', '西二旗', '2013-12-18 15:47:09', 'b6f7bc28aab2cded771956994ba6ccc8.jpg', 'http://10.168.1.188:8080/afgy/upload/test.avi', '35', '1');

-- ----------------------------
-- Table structure for `t_s_warningtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_warningtype`;
CREATE TABLE `t_s_warningtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `value` varchar(30) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_s_warningtype
-- ----------------------------
INSERT INTO t_s_warningtype VALUES ('1', 'lhf', '拉横幅', '1');
INSERT INTO t_s_warningtype VALUES ('2', 'scd', '撒传单', '1');
INSERT INTO t_s_warningtype VALUES ('3', 'cr', '闯入', '1');
INSERT INTO t_s_warningtype VALUES ('4', 'cc', '闯出', '1');
INSERT INTO t_s_warningtype VALUES ('5', 'bp', '奔跑', '1');
INSERT INTO t_s_warningtype VALUES ('6', 'rqjj', '人群聚集', '1');
INSERT INTO t_s_warningtype VALUES ('7', 'y', '烟', '1');
INSERT INTO t_s_warningtype VALUES ('8', 'h', '火', '1');
INSERT INTO t_s_warningtype VALUES ('9', 'yh', '烟火', '1');

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
  `photo_path` varchar(255) COLLATE gbk_bin DEFAULT 'images/base/touxiangIcon.gif' COMMENT '用户头像路径',
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
) ENGINE=InnoDB AUTO_INCREMENT=100838 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_u_person
-- ----------------------------
INSERT INTO t_u_person VALUES ('1', 'admin', 'admin', '系统管理员', 'admin', null, 'bm0001', '男', '', '', '', 'xtgl', '0', '18653156061', '', 'images/base/touxiangIcon.gif', '', '', '1', '2011-06-23 17:46:17', '0', '1', 'xtgl', null, '1');
INSERT INTO t_u_person VALUES ('2', 'karl', 'karl', 'Karl', 'karl', null, 'bm0001', '男', '2011-01-01', '2011-07-07', '', 'spuer', '0', '18653156061', '', null, '', '', '1', '2011-07-07 09:08:55', '0', '28', 'spuer', null, '1');
INSERT INTO t_u_person VALUES ('3', 'zzzx', 'zzzx', '管理中心', 'admin', null, 'bm0004', '女', '1970-07-06', '1989-05-01', '', 'jtkgq', '0', '15552570666', '', null, '', '', '0', '2011-07-14 15:20:06', '0', '28', 'jtkgq', null, '1');
INSERT INTO t_u_person VALUES ('4', 'xtxj', 'xtxj', '系统巡查', 'admin', null, 'bm0001', '男', '2012-02-24', '2012-02-24', '', 'xtxc', '0', '', '', null, '', '', '0', '2012-02-24 16:18:14', '0', '28', 'xtxc', '0', '1');
INSERT INTO t_u_person VALUES ('5', 'cs', 'cs', 'cs', '1', 'cs', 'bm0001', '男', '', '', '', 'Test', '0', '', '', null, '', '', '1', '2013-03-22 09:24:47', '0', '28', 'Test', null, '1');
INSERT INTO t_u_person VALUES ('100830', 'lijian', 'lijian', '李建', 'admin', null, 'bm0001', '男', '', '', '', 'ybyh', '0', '', '', 'upload/photo/{0_0_20130909181847279}.jpg', '', '', '1', '2013-04-13 14:58:34', '0', '28', 'ybyh', null, '1');
INSERT INTO t_u_person VALUES ('100831', 'xf', 'xf', '消防', '1', null, 'bm0001', '女', '', '', '', 'xftdGroup', '0', '', '', null, '', '', '1', '2013-05-07 10:16:06', '0', '28', 'xftdGroup', null, '1');
INSERT INTO t_u_person VALUES ('100832', 'dj', 'dj', '电子警察', '1', null, 'bm0001', '男', '', '', '', 'dzjcGroup', '0', '', '', 'upload/photo/{0_0_20130910133225542}.jpg', '', '', '1', '2013-05-07 10:23:59', '0', '28', 'dzjcGroup', null, '1');
INSERT INTO t_u_person VALUES ('100833', 'jt', 'jt', '交通', '1', null, 'bm0003', '男', '', '', '', 'dzjcGroup', '0', '', '', 'upload/photo/{0_0_20130910090416105}.jpg', '', '', '1', '2013-05-08 09:34:30', '0', '28', 'dzjcGroup', null, '1');
INSERT INTO t_u_person VALUES ('100834', 'liu', 'liu', '刘总', '1', null, 'bm0001', '男', '', '', '', 'ybyh', '0', '', '', null, '', '', '1', '2013-05-19 21:09:49', '0', '28', 'ybyh', null, '1');
INSERT INTO t_u_person VALUES ('100835', 'helen', 'helen', 'helen', 'helen', null, 'bm0002', '女', '', '', '', 'dzjcGroup', 'dzjcGroup', '', '', '/monitor//monitor/', '', '', '1', '2013-05-31 13:32:03', '0', '28', 'dzjcGroup', null, '1');
INSERT INTO t_u_person VALUES ('100836', 'leo', 'leo', 'leo', '1', null, 'bm0003', '男', '', '', '', 'Test', 'spuer', '', '', null, '', '', '1', '2013-06-18 14:20:33', '0', '28', 'spuer', null, '1');
INSERT INTO t_u_person VALUES ('100837', '1', null, '1', 'admin', null, 'bm0001', '', '', '', '', 'dzjcGroup', 'Test', '', '', '/its/images/base/touxiangIcon.gif', '', '', '1', '2013-10-10 16:32:04', '0', '28', 'Test', null, '1');

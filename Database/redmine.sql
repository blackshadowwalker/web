/*
Navicat MySQL Data Transfer

Source Server         : 10.168.1.251
Source Server Version : 50167
Source Host           : 10.168.1.251:3306
Source Database       : redmine

Target Server Type    : MYSQL
Target Server Version : 50167
File Encoding         : 65001

Date: 2014-01-28 10:52:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `attachments`
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(40) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachments
-- ----------------------------
INSERT INTO attachments VALUES ('1', '1', 'Issue', 'Local File.jpg', '130426153105_34cb25d20df4ada93d731a40089783f1.jpg', '11335', null, 'a295c69eddb48aed5bd28e2784acbd18', '0', '4', '2013-04-26 15:31:05', '', '2013/04');
INSERT INTO attachments VALUES ('2', '2', 'Document', '“平安丽江”项目建设方案2013.2.161.doc', '130426183042_e36c243a3037e3cdd1b928c828513b52.doc', '40983221', null, '807db0b4d75be001bd88c989b2593dff', '0', '10', '2013-04-26 18:30:42', '', '2013/04');
INSERT INTO attachments VALUES ('3', '10', 'Issue', 'QQ截图20130426185647.jpg', '130426190209_b560534a588fbb495541a546d5f8d0fa.jpg', '31478', null, '68724088ec56b4adc7cbdb16abd30ef2', '0', '3', '2013-04-26 19:02:09', 'Error page', '2013/04');
INSERT INTO attachments VALUES ('4', '10', 'Issue', 'QQ截图20130426190011.jpg', '130426190209_df5faa79e2c0433d03e796e819419d82.jpg', '30706', null, '152af9f877ea9707b51ac0978286154f', '0', '3', '2013-04-26 19:02:09', 'Right page', '2013/04');
INSERT INTO attachments VALUES ('5', '4', 'Document', '2013-04-26_Medianate-Teleframe.ppt', '130426212351_2013-04-26_Medianate-Teleframe.ppt', '12228608', null, 'c3dfa78cbcc1769fa1d6ebbc598d0aeb', '0', '10', '2013-04-26 21:23:51', '', '2013/04');
INSERT INTO attachments VALUES ('6', '5', 'Document', '电子警察研发计划(2013.04.24-2013.05.31).doc', '130427104534_380d1d33166751f79242bc52b431a312.doc', '15872', null, '0a05f3ad1dcf73f4f9d50f4b441eb50c', '0', '6', '2013-04-27 10:45:34', '', '2013/04');
INSERT INTO attachments VALUES ('7', '5', 'Document', '电子警察需求分析-0424.xls', '130427104534_95b551f9798da779aa5ebfcbed4529ef.xls', '91136', null, '253fbd254fa928ee6b1d11e6236a54cb', '0', '6', '2013-04-27 10:45:34', '', '2013/04');
INSERT INTO attachments VALUES ('9', '6', 'Document', '2013_4_22.zip', '130427111107_2013_4_22.zip', '59784', null, '67347f6db33a7a36853cd17a633ab5c4', '0', '6', '2013-04-27 11:11:07', '', '2013/04');
INSERT INTO attachments VALUES ('11', '4', 'Document', 'translated version-2013-04-26_Medianate-Teleframe - .ppt', '130427145323_0e2da53c962db2ff125ee20333888d3c.ppt', '12439040', null, 'ea6878632bbcc2cb15a512ef9d732137', '0', '5', '2013-04-27 14:53:23', 'The translation is finished', '2013/04');
INSERT INTO attachments VALUES ('12', '11', 'Issue', 'translated version-2013-04-26_Medianate-Teleframe - .ppt', '130427151556_0e2da53c962db2ff125ee20333888d3c.ppt', '12439040', null, 'ea6878632bbcc2cb15a512ef9d732137', '0', '5', '2013-04-27 15:15:56', '', '2013/04');
INSERT INTO attachments VALUES ('13', null, null, 'translated version-2013-04-26_Medianate-Teleframe - .ppt', '130427151852_0e2da53c962db2ff125ee20333888d3c.ppt', '12439040', '', 'ea6878632bbcc2cb15a512ef9d732137', '0', '5', '2013-04-27 15:18:52', null, '2013/04');
INSERT INTO attachments VALUES ('14', '7', 'Document', '电子警察需求分析-0424.xls', '130427153610_95b551f9798da779aa5ebfcbed4529ef.xls', '112128', null, '6d555cc21d24f5a279d3bd099bdfe620', '0', '5', '2013-04-27 15:36:10', '', '2013/04');
INSERT INTO attachments VALUES ('15', '20', 'Issue', '电子警察需求分析-0424.xls', '130427154033_95b551f9798da779aa5ebfcbed4529ef.xls', '112128', null, '6d555cc21d24f5a279d3bd099bdfe620', '0', '5', '2013-04-27 15:40:33', '', '2013/04');
INSERT INTO attachments VALUES ('18', '27', 'Issue', 'Database Medianate.vsd', '130427164415_31056297d2bdc3dce03de61affe158b0.vsd', '120320', null, '2a0ae2d6fb1e667a9344e14d6411a394', '0', '3', '2013-04-27 16:44:15', '', '2013/04');
INSERT INTO attachments VALUES ('20', '27', 'Issue', 'WEB of Medianate.vsd', '130427181816_bfc807f1a528aa619acdec88893f5d82.vsd', '2020864', null, '6cb6c8a1f6175203ddbc494b4b0c7107', '0', '3', '2013-04-27 18:18:16', '', '2013/04');
INSERT INTO attachments VALUES ('21', '2', 'Document', 'Catalogue-“平安丽江”项目建设方案2013.2.161 -.doc', '130428104944_6c1aa97574e3267d15109ba60259b942.doc', '40916480', null, 'e871797eb25fa6b6a5173bb5feac7d0b', '0', '5', '2013-04-28 10:49:44', 'Only the catalogue is translated in this document, any other parts needed, please let me know. No one knows its author because it is a reference document from other company.', '2013/04');
INSERT INTO attachments VALUES ('22', '9', 'Issue', 'Catalogue-“平安丽江”项目建设方案2013.2.161 -.doc', '130428110414_6c1aa97574e3267d15109ba60259b942.doc', '40916480', null, 'e871797eb25fa6b6a5173bb5feac7d0b', '0', '5', '2013-04-28 11:04:14', '', '2013/04');
INSERT INTO attachments VALUES ('24', '20', 'Issue', 'English version-电子警察需求分析-0422 .xls', '130428155344_774f8a754fa4cd905ed98dc166bbd96f.xls', '123904', null, '8cfb6e01e27cf85af058ce91dabbd930', '0', '5', '2013-04-28 15:53:44', '', '2013/04');
INSERT INTO attachments VALUES ('26', '27', 'Issue', '信帧智能监控WEB系统-开发文档.docx', '130428192927_dd5e005a7e7d93956bcd6ef907913844.docx', '10650208', null, '3614b3ad52b49d18d63d7b3bf974a838', '0', '3', '2013-04-28 19:29:28', '', '2013/04');
INSERT INTO attachments VALUES ('27', '22', 'Issue', '周工作汇总 - 李建 - 2013.4.22 - 4.28.doc', '130501134523_0573cdc08d75fed0329e3b8adbc000fc.doc', '60928', null, '82f11bb7aa4bee1b7133b7ae64c49818', '0', '3', '2013-05-01 13:45:23', '', '2013/05');
INSERT INTO attachments VALUES ('28', '4', 'Document', '信帧云检索产品介绍_v1.ppt', '130502092610_5a648ff29b31fc40a9849b90c025449c.ppt', '23108096', null, '181aa316b0781e4a4aa96c2095a3b56e', '0', '5', '2013-05-02 09:26:10', 'Correction -Introduction to Teleframe Cloud Retriveval Product', '2013/05');
INSERT INTO attachments VALUES ('29', '11', 'Issue', '信帧云检索产品介绍_v1.ppt', '130502093316_5a648ff29b31fc40a9849b90c025449c.ppt', '23108096', null, '181aa316b0781e4a4aa96c2095a3b56e', '0', '5', '2013-05-02 09:33:16', '', '2013/05');
INSERT INTO attachments VALUES ('31', '32', 'Issue', '消防需求分析-0423.xlsx', '130502145041_ff46cf741519b02a91726adf93951739.xlsx', '31712', null, '3b57819aa5186346d2a7ec1c2fc82160', '0', '12', '2013-05-02 14:50:41', '', '2013/05');
INSERT INTO attachments VALUES ('32', '7', 'Project', '目标跟踪算法室内测试报告_by lvqian.docx', '130502160830_d7ac867e8aa1f725d3b68838f82a064c.docx', '17173', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'c2682e9a577c9af3d0d3b1d3f714c4b9', '0', '16', '2013-05-02 16:08:30', '', '2013/05');
INSERT INTO attachments VALUES ('33', '7', 'Document', 'English version-电子警察需求分析-0424 .xls', '130502171638_60a059a8fa7f5663c3ae6708d80a086d.xls', '123904', null, '8cfb6e01e27cf85af058ce91dabbd930', '0', '5', '2013-05-02 17:16:38', 'The format(such as capital and small letter) has not been corrected yet.', '2013/05');
INSERT INTO attachments VALUES ('34', '9', 'Document', 'messages_en.properties', '130502172138_messages_en.properties', '37411', null, '4ee1052ecaa38f5b1801caf43aa2fab5', '0', '5', '2013-05-02 17:21:38', 'This is the English version of the Medianate user interface', '2013/05');
INSERT INTO attachments VALUES ('36', '33', 'Issue', 'messages_en.properties', '130502172703_messages_en.properties', '37411', null, '4ee1052ecaa38f5b1801caf43aa2fab5', '0', '5', '2013-05-02 17:27:03', 'Original English version', '2013/05');
INSERT INTO attachments VALUES ('37', '33', 'Issue', 'messages_cn.properties', '130502172717_messages_cn.properties', '41936', null, '2ff2a1156bd3b172410695a4a82d718b', '0', '5', '2013-05-02 17:27:17', 'Initial translation of Li Jian', '2013/05');
INSERT INTO attachments VALUES ('38', '9', 'Document', 'messages_cn.properties', '130502173202_messages_cn.properties', '41936', null, '2ff2a1156bd3b172410695a4a82d718b', '0', '5', '2013-05-02 17:32:02', 'This is the initial translation by Li Jian', '2013/05');
INSERT INTO attachments VALUES ('39', '34', 'Issue', 'QQ截图20130502162650.jpg', '130502181839_952a0a4d4439c6b57bf34e0fb580f1fa.jpg', '59638', null, '491c38d23d9ffdf8787c1dad61be1692', '0', '3', '2013-05-02 18:18:39', '', '2013/05');
INSERT INTO attachments VALUES ('40', '34', 'Issue', 'QQ截图20130502162702.jpg', '130502181839_2f455b3d5c2a2de7b4eadd8a5e912d37.jpg', '59272', null, 'd697de0f60a1cbba3894d2cd44534bf2', '0', '3', '2013-05-02 18:18:39', '', '2013/05');
INSERT INTO attachments VALUES ('45', '36', 'Issue', '子菜单-检测区域设置-设置车道属性.jpg', '130506100110_fd7edefa3c7f4d84b5d850233877a406.jpg', '140375', 'image/jpeg', '5345740476de4255c81f697f60d4e896', '0', '9', '2013-05-06 10:01:10', '', '2013/05');
INSERT INTO attachments VALUES ('46', '36', 'Issue', '子菜单-检测区域设置-设置车道线.jpg', '130506100110_5d0e710188ddf9791d40f4f8b072ca85.jpg', '137919', 'image/jpeg', 'd53463fd37d85a88ec76d7c1ff66e087', '0', '9', '2013-05-06 10:01:10', '', '2013/05');
INSERT INTO attachments VALUES ('47', '36', 'Issue', '子菜单-检测区域设置-设置感兴趣区域.jpg', '130506100110_ab38e2795d3a19490ab231ec38babeeb.jpg', '152773', 'image/jpeg', '4ba28cb00065ea92b3d7a72647d70d7e', '0', '9', '2013-05-06 10:01:10', '', '2013/05');
INSERT INTO attachments VALUES ('48', '36', 'Issue', '子菜单-检测区域设置-设置流量区域.jpg', '130506100111_e449da23b0bfe133d090dda2f6950126.jpg', '137850', 'image/jpeg', 'f914b6f4237ea039de359fce6e8ec828', '0', '9', '2013-05-06 10:01:11', '', '2013/05');
INSERT INTO attachments VALUES ('49', null, null, '子菜单-红灯视频检测.jpg', '130506101453_f178033c2997d1d4bdab276b2cbe4d60.jpg', '53017', '', '5bd9d2ee71192c6765fad43ce1535612', '0', '9', '2013-05-06 10:14:53', null, '2013/05');
INSERT INTO attachments VALUES ('50', '4', 'Document', '信帧云检索产品介绍_v1 --Introduction to Teleframe Cloud Retrieval Product_v1-.ppt', '130506120452_bb3c37ade2fa24c27b958a5a39f5fdfc.ppt', '19352064', null, 'cd381b149714b110d21b766db17b4ebc', '0', '5', '2013-05-06 12:04:52', 'Translation of the PPT corrected by Doctor Liu', '2013/05');
INSERT INTO attachments VALUES ('51', null, null, '信帧云检索产品介绍_v1 --Introduction to Teleframe Cloud Retrieval Product_v1-.ppt', '130506121337_bb3c37ade2fa24c27b958a5a39f5fdfc.ppt', '19352064', '', 'cd381b149714b110d21b766db17b4ebc', '0', '5', '2013-05-06 12:13:37', null, '2013/05');
INSERT INTO attachments VALUES ('52', null, null, '信帧云检索产品介绍_v1 --Introduction to Teleframe Cloud Retrieval Product_v1-.ppt', '130506121706_bb3c37ade2fa24c27b958a5a39f5fdfc.ppt', '19352064', '', 'cd381b149714b110d21b766db17b4ebc', '0', '5', '2013-05-06 12:17:06', null, '2013/05');
INSERT INTO attachments VALUES ('53', null, null, '信帧云检索产品介绍_v1 --Introduction to Teleframe Cloud Retrieval Product_v1-.ppt', '130506123101_bb3c37ade2fa24c27b958a5a39f5fdfc.ppt', '19352064', '', 'cd381b149714b110d21b766db17b4ebc', '0', '5', '2013-05-06 12:31:01', null, '2013/05');
INSERT INTO attachments VALUES ('55', '9', 'Document', 'messages-correction-cn&en.properties', '130507121036_39b48723503e277d3051bf21dadcf22a.properties', '43851', null, '864ba976ab2ef0648b66a3a83b4a2f39', '0', '5', '2013-05-07 12:10:36', 'This version is still bilingual display and some lines need to be further discussed with Frederic', '2013/05');
INSERT INTO attachments VALUES ('56', '9', 'Document', 'messages-correction-only Chinese.properties', '130507121648_0c474cb8e31bdf61ff7c06d8a903562b.properties', '33410', null, '8df5aa7b719e3821dee81da70dc1806a', '0', '5', '2013-05-07 12:16:48', 'This is Chinese translation of the user interface and some lines need to be further discussed.', '2013/05');
INSERT INTO attachments VALUES ('57', '33', 'Issue', 'messages-correction-cn&en.properties', '130507122525_39b48723503e277d3051bf21dadcf22a.properties', '43851', null, '864ba976ab2ef0648b66a3a83b4a2f39', '0', '5', '2013-05-07 12:25:25', 'Bilingual version', '2013/05');
INSERT INTO attachments VALUES ('58', '33', 'Issue', 'messages-correction-only Chinese.properties', '130507122530_0c474cb8e31bdf61ff7c06d8a903562b.properties', '33410', null, '8df5aa7b719e3821dee81da70dc1806a', '0', '5', '2013-05-07 12:25:30', 'Chinese only', '2013/05');
INSERT INTO attachments VALUES ('59', '37', 'Issue', '信帧智能监控WEB系统(新).docx', '130507184834_1795c6d50bd0e18fbc81d99e0db1f8aa.docx', '22415', null, '4a10365e490559ab33c5cf5994fc01e1', '0', '3', '2013-05-07 18:48:34', '此文档是根据文档智能交通综合管理平台用户手册标准版1.pdf又增加和修改完善了部分功能', '2013/05');
INSERT INTO attachments VALUES ('60', '37', 'Issue', '智能交通综合管理平台用户手册标准版1.pdf', '130507184855_e01f913ba306d5fdc9a57dd3f8ea49ce.pdf', '12446204', null, 'f2da1b8f77178a79f0ad72e064d4318f', '0', '3', '2013-05-07 18:48:55', '', '2013/05');
INSERT INTO attachments VALUES ('61', '37', 'Issue', '电子警察WEB系整理-李建.docx', '130508100038_d6a36823150d1c77c9694cba84405fb0.docx', '103894', null, '0286e3560939aebacfed93e2687338c6', '0', '3', '2013-05-08 10:00:38', '', '2013/05');
INSERT INTO attachments VALUES ('62', '27', 'Issue', 'web2.0功能列表(1).jpg', '130509091455_7d411def38377d2433bbee5e6cbb40b0.jpg', '164894', null, '80ddddb5b1b54b0c001d957573825a8b', '0', '19', '2013-05-09 09:14:55', 'web最初计划功能列表', '2013/05');
INSERT INTO attachments VALUES ('63', '27', 'Issue', '电子警察需求分析 - WEB综合管理平台功能(1).xls', '130509092145_5fa556cad4c62ce10caf9d6b343a9264.xls', '134656', null, 'acb9b42e482d7672ebcd39a2e9bc2044', '0', '19', '2013-05-09 09:21:45', '电子警察需求分析-web综合管理平台（初步）', '2013/05');
INSERT INTO attachments VALUES ('64', '10', 'Document', 'WEB of Medianate.vsd', '130509132722_bfc807f1a528aa619acdec88893f5d82.vsd', '2020864', null, '6f0b4676d56bdf333bc7ce228daed7cf', '0', '3', '2013-05-09 13:27:22', '', '2013/05');
INSERT INTO attachments VALUES ('65', '10', 'Document', 'web2.0功能列表(1).jpg', '130509132742_7d411def38377d2433bbee5e6cbb40b0.jpg', '164894', null, '80ddddb5b1b54b0c001d957573825a8b', '0', '3', '2013-05-09 13:27:42', '', '2013/05');
INSERT INTO attachments VALUES ('66', '10', 'Document', '信帧智能监控WEB系统-开发文档.docx', '130509132805_dd5e005a7e7d93956bcd6ef907913844.docx', '10993681', null, 'd3cc4c028c1589ce278a153a44f55c83', '0', '3', '2013-05-09 13:28:05', '', '2013/05');
INSERT INTO attachments VALUES ('67', '10', 'Document', '电子警察需求分析 - WEB综合管理平台功能(1).xls', '130509132831_5fa556cad4c62ce10caf9d6b343a9264.xls', '134656', null, 'dac8acf4026cc210cb434a3a4ad28db7', '0', '3', '2013-05-09 13:28:31', '', '2013/05');
INSERT INTO attachments VALUES ('68', '10', 'Document', '智能交通综合管理平台用户手册标准版1.pdf', '130509132837_e01f913ba306d5fdc9a57dd3f8ea49ce.pdf', '12446204', null, 'f2da1b8f77178a79f0ad72e064d4318f', '0', '3', '2013-05-09 13:28:37', '', '2013/05');
INSERT INTO attachments VALUES ('69', '11', 'Document', '信帧智能监控WEB系统-开发文档.docx', '130509140412_dd5e005a7e7d93956bcd6ef907913844.docx', '10650208', null, '3614b3ad52b49d18d63d7b3bf974a838', '0', '5', '2013-05-09 14:04:12', '', '2013/05');
INSERT INTO attachments VALUES ('70', '38', 'Issue', '信帧智能监控WEB系统-开发文档.docx', '130509141410_dd5e005a7e7d93956bcd6ef907913844.docx', '10650208', null, '3614b3ad52b49d18d63d7b3bf974a838', '0', '5', '2013-05-09 14:14:10', '', '2013/05');
INSERT INTO attachments VALUES ('71', '12', 'Document', '信帧智能监控WEB系统(新).docx', '130509154309_1795c6d50bd0e18fbc81d99e0db1f8aa.docx', '22415', null, '4a10365e490559ab33c5cf5994fc01e1', '0', '3', '2013-05-09 15:43:09', '', '2013/05');
INSERT INTO attachments VALUES ('72', '12', 'Document', '电子警察WEB系整理-李建.docx', '130509154309_d6a36823150d1c77c9694cba84405fb0.docx', '103894', null, '0286e3560939aebacfed93e2687338c6', '0', '3', '2013-05-09 15:43:09', '', '2013/05');
INSERT INTO attachments VALUES ('73', '12', 'Document', '智能交通综合管理平台用户手册标准版1.pdf', '130509154315_e01f913ba306d5fdc9a57dd3f8ea49ce.pdf', '12638601', null, 'c5eea66bd974aa99957fcd000065e237', '0', '3', '2013-05-09 15:43:15', '', '2013/05');
INSERT INTO attachments VALUES ('74', '11', 'Document', '信帧智能监控WEB系统-Enlish.docx', '130513191553_9134b710f7bd3e45dc2ec1323d5ad50b.docx', '7738668', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '9ae8110a961afeaa0a19189fb04a8d5c', '0', '5', '2013-05-13 19:15:53', '', '2013/05');
INSERT INTO attachments VALUES ('75', '38', 'Issue', '信帧智能监控WEB系统-Enlish.docx', '130513191942_9134b710f7bd3e45dc2ec1323d5ad50b.docx', '7738668', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '9ae8110a961afeaa0a19189fb04a8d5c', '0', '5', '2013-05-13 19:19:42', '', '2013/05');
INSERT INTO attachments VALUES ('76', null, null, 'cyeweb.zip', '130514103335_cyeweb.zip', '85571924', '', '40e66d089780516c9fe2cb92650c5829', '0', '6', '2013-05-14 10:33:35', null, '2013/05');
INSERT INTO attachments VALUES ('77', '13', 'Document', 'cyeweb.zip', '130514104612_cyeweb.zip', '85571924', null, '40e66d089780516c9fe2cb92650c5829', '0', '6', '2013-05-14 10:46:12', '', '2013/05');
INSERT INTO attachments VALUES ('80', '40', 'Issue', 'picture.jpg', '130515145218_picture.jpg', '43393', 'image/jpeg', 'e1c8dca1185f475c84d32eff6fc0d109', '0', '5', '2013-05-15 14:52:18', '', '2013/05');
INSERT INTO attachments VALUES ('81', null, null, 'ITSconfigToolK v1.5.zip', '130517011618_04b7061039359b5fd3100596aa286ada.zip', '1939294', '', '9ff9fe51868b74f0220a33c188bc1f71', '0', '3', '2013-05-17 01:16:18', null, '2013/05');
INSERT INTO attachments VALUES ('82', '36', 'Issue', 'ITSconfigToolK v1.5.zip', '130517011826_04b7061039359b5fd3100596aa286ada.zip', '1939294', null, '9ff9fe51868b74f0220a33c188bc1f71', '0', '3', '2013-05-17 01:18:26', '算法配置检测区域设置工具完成', '2013/05');
INSERT INTO attachments VALUES ('83', '36', 'Issue', 'ITSconfigToolK v1.6.zip', '130518134338_1ecc8b4973042ba748cfb1ce9425994c.zip', '1941963', null, '439468c6b2743e260fbd1e7e2c77ff4f', '0', '3', '2013-05-18 13:43:38', 'ITSconfigToolK Updated!', '2013/05');
INSERT INTO attachments VALUES ('84', '36', 'Issue', 'ITSconfigToolK使用说明.docx', '130520102746_7d8af80fbb7f53c0f2a021c89afed9f0.docx', '357792', 'application/x-zip-compressed', '56f8887968a77a48efd898b5437bd0ec', '0', '3', '2013-05-20 10:27:46', '', '2013/05');
INSERT INTO attachments VALUES ('85', null, null, 'ITSconfigToolK使用说明.docx', '130520102758_7d8af80fbb7f53c0f2a021c89afed9f0.docx', '357792', 'application/x-zip-compressed', '56f8887968a77a48efd898b5437bd0ec', '0', '3', '2013-05-20 10:27:58', null, '2013/05');
INSERT INTO attachments VALUES ('87', '41', 'Issue', '信帧智能交通系统.ppt', '130521165001_159187b63c8c22733c01c5985e0970dc.ppt', '20977664', null, 'a7983d81011c2143280354ebf839508a', '0', '5', '2013-05-21 16:50:01', 'Chinese version', '2013/05');
INSERT INTO attachments VALUES ('88', '9', 'Document', 'messages-version 2-cn&en.properties', '130521165551_8ec179ba71185cd6944a3e80da39ce8c.properties', '42907', null, '616c435ab5d7d913d8d5e4ad13ef6e49', '0', '5', '2013-05-21 16:55:51', 'billingual version', '2013/05');
INSERT INTO attachments VALUES ('89', '9', 'Document', 'messages-version 2-Chinese only.properties', '130521165645_3ce64656c4c433e5db6a74cab4e5aa17.properties', '31931', null, 'c73144127d16294b925cd6ae0ab3b091', '0', '5', '2013-05-21 16:56:45', 'Chinese only', '2013/05');
INSERT INTO attachments VALUES ('90', '33', 'Issue', 'messages-version 2-cn&en.properties', '130521165739_8ec179ba71185cd6944a3e80da39ce8c.properties', '42907', null, '616c435ab5d7d913d8d5e4ad13ef6e49', '0', '5', '2013-05-21 16:57:39', 'This is the latest bilingual version', '2013/05');
INSERT INTO attachments VALUES ('91', '33', 'Issue', 'messages-version 2-Chinese only.properties', '130521165945_3ce64656c4c433e5db6a74cab4e5aa17.properties', '31931', null, 'c73144127d16294b925cd6ae0ab3b091', '0', '5', '2013-05-21 16:59:45', 'This is the latest Chinese version.', '2013/05');
INSERT INTO attachments VALUES ('92', '9', 'Document', 'messages-version 3-chinese only.properties(fred)', '130522100208_a79688a97bc66d8766fae05dd34fecb5', '32078', null, '77ee16c057bf521f327ebc3886456d87', '0', '5', '2013-05-22 10:02:08', 'This is the latest Chinese version.', '2013/05');
INSERT INTO attachments VALUES ('93', '9', 'Document', 'messages-version 3-cn&en.properties(fred)', '130522100231_95d228e09b73ab7c3b79f8aa37ed78a7', '43100', null, '231f7f78eceeab1aa468b2a9a02c0c49', '0', '5', '2013-05-22 10:02:31', 'This is the latest bilingual version', '2013/05');
INSERT INTO attachments VALUES ('94', '33', 'Issue', 'messages-version 3-cn&en.properties(fred)', '130522100348_95d228e09b73ab7c3b79f8aa37ed78a7', '43100', null, '231f7f78eceeab1aa468b2a9a02c0c49', '0', '5', '2013-05-22 10:03:48', 'This is the latest bilingual version', '2013/05');
INSERT INTO attachments VALUES ('95', '33', 'Issue', 'messages-version 3-chinese only.properties(fred)', '130522100407_a79688a97bc66d8766fae05dd34fecb5', '32078', null, '77ee16c057bf521f327ebc3886456d87', '0', '5', '2013-05-22 10:04:07', 'This is the latest Chinese version', '2013/05');
INSERT INTO attachments VALUES ('96', '42', 'Issue', 'picture.jpg', '130523140654_picture.jpg', '70541', null, '927807281b78b37c0ae7645639a701e5', '0', '5', '2013-05-23 14:06:54', 'failed tasks', '2013/05');
INSERT INTO attachments VALUES ('97', '14', 'Document', '信帧智能交通系统最终.ppt', '130524142339_653a0a16860dd7bf7a3e1b05b64c0e78.ppt', '18866176', null, '25b2008818125be395d9933775aa6ce7', '0', '5', '2013-05-24 14:23:39', 'This is the final PPT presented to Datang', '2013/05');
INSERT INTO attachments VALUES ('98', '14', 'Document', 'English-信帧智能交通系最终.ppt', '130524142416_af5c34082d92945bafa9431b54bd6914.ppt', '20805120', null, '5db8946385647d0f6c7f95728bdb6b79', '0', '5', '2013-05-24 14:24:16', 'This is the English version for the final PPT presented to Datang on May 23.', '2013/05');
INSERT INTO attachments VALUES ('99', '41', 'Issue', '信帧智能交通系统最终.ppt', '130524142609_653a0a16860dd7bf7a3e1b05b64c0e78.ppt', '18866176', null, '25b2008818125be395d9933775aa6ce7', '0', '5', '2013-05-24 14:26:09', 'This is the final PPT presented to Datang', '2013/05');
INSERT INTO attachments VALUES ('100', '41', 'Issue', 'English-信帧智能交通系最终.ppt', '130524142624_af5c34082d92945bafa9431b54bd6914.ppt', '20805120', null, '5db8946385647d0f6c7f95728bdb6b79', '0', '5', '2013-05-24 14:26:24', 'This is the English version of the final PPT presented to Datang on May 23.', '2013/05');
INSERT INTO attachments VALUES ('101', '36', 'Issue', 'ITSconfigToolK v1.7.zip', '130525232130_3e7333f515cb73554678a5105ee1cf5b.zip', '3176227', 'application/x-zip-compressed', '599ff33862047832919671f484ef1372', '0', '3', '2013-05-25 23:21:30', '修正了一个操作逻辑bug，当删除车道ID非最大的一个车道后，车道的ID会出现不对号的问题;现在支持选择某个车道/停止线后，会用不同的颜色来标记', '2013/05');
INSERT INTO attachments VALUES ('102', null, null, 'ITSconfigToolK v1.8.zip', '130528100537_c6a53f7a43626ff7dfe94f67684f0729.zip', '2298913', '', '0495a171edecd02e31042e9a49274e1d', '0', '3', '2013-05-28 10:05:37', null, '2013/05');
INSERT INTO attachments VALUES ('103', '36', 'Issue', 'ITSconfigToolK v1.8.zip', '130528101637_c6a53f7a43626ff7dfe94f67684f0729.zip', '2298913', 'application/x-zip-compressed', '0495a171edecd02e31042e9a49274e1d', '0', '3', '2013-05-28 10:16:37', '', '2013/05');
INSERT INTO attachments VALUES ('104', '36', 'Issue', 'ITSconfigToolK v1.9.zip', '130528104150_15396656828def141e8e5198ce54a2c1.zip', '2298889', 'application/x-zip-compressed', 'c45b3ae4ef3562a3dcb74bd92fba2ac5', '0', '3', '2013-05-28 10:41:50', '1.修改“信号灯ID”范围为(1 2 3 4)', '2013/05');
INSERT INTO attachments VALUES ('105', '15', 'Document', 'User Manual.docx', '130604100712_b732cf95aef7f6880c3ee6a2cae1dc46.docx', '2974330', null, '9f9b9f709fc54a4f08aa371ea489cce4', '0', '5', '2013-06-04 10:07:12', 'the draft', '2013/06');
INSERT INTO attachments VALUES ('106', '15', 'Document', 'medianate_basic_2013-01-23.pdf', '130604101139_medianate_basic_2013-01-23.pdf', '782075', null, 'e83a9163b4446da16e41215f6afb5c66', '0', '5', '2013-06-04 10:11:39', 'the original English guidance document', '2013/06');
INSERT INTO attachments VALUES ('107', '48', 'Issue', 'medianate_basic_2013-01-23.pdf', '130604102509_medianate_basic_2013-01-23.pdf', '782075', null, 'e83a9163b4446da16e41215f6afb5c66', '0', '5', '2013-06-04 10:25:09', 'the original English technical description document', '2013/06');
INSERT INTO attachments VALUES ('108', '48', 'Issue', 'User Manual.docx', '130604102509_b732cf95aef7f6880c3ee6a2cae1dc46.docx', '2974330', null, '9f9b9f709fc54a4f08aa371ea489cce4', '0', '5', '2013-06-04 10:25:09', 'the draft', '2013/06');
INSERT INTO attachments VALUES ('109', '2', 'WikiPage', 'medianate-api-client.zip', '130604174101_medianate-api-client.zip', '442050', null, '1411d8e43cf2c16aa2f8b9035b7b17d6', '0', '10', '2013-06-04 17:41:01', '', '2013/06');
INSERT INTO attachments VALUES ('110', '11', 'Document', '信帧智能监控WEB系统-Enlish 2.docx', '130607175109_9d994fee565951057047766ce7425e5c.docx', '7543615', null, '2770c55774a52532c4ba1063d60a56a6', '0', '5', '2013-06-07 17:51:09', 'latest vesion', '2013/06');
INSERT INTO attachments VALUES ('111', '38', 'Issue', '信帧智能监控WEB系统-Enlish 2.docx', '130607175415_9d994fee565951057047766ce7425e5c.docx', '7543615', null, '2770c55774a52532c4ba1063d60a56a6', '0', '5', '2013-06-07 17:54:15', 'latest vesion', '2013/06');
INSERT INTO attachments VALUES ('112', '50', 'Issue', 'General_PlaySDK_EngChn_IS_V3.32.0.R.111107.zip', '130609152144_General_PlaySDK_EngChn_IS_V3.32.0.R.111107.zip', '3098802', 'application/x-zip-compressed', 'b00790b8aae8a09dd3f5b375c28ecb3f', '0', '6', '2013-06-09 15:21:44', '', '2013/06');
INSERT INTO attachments VALUES ('114', '51', 'Issue', 'Chinese charaters remaining.docx', '130613133856_4dbd4d5ee7704df3ae63d23cb6673d01.docx', '103121', null, '22791feb948eee937aa977be1c7cdb2c', '0', '5', '2013-06-13 13:38:56', '', '2013/06');
INSERT INTO attachments VALUES ('115', '54', 'Issue', 'screenshot.jpg', '130613173419_screenshot.jpg', '41481', null, '66bc90437f130b826d5c614e459a4475', '0', '5', '2013-06-13 17:34:19', '', '2013/06');
INSERT INTO attachments VALUES ('116', '55', 'Issue', 'screenshot.png', '130613180151_screenshot.png', '34583', null, 'a4e13d9e1cf39f819a8825106b89a808', '0', '5', '2013-06-13 18:01:51', '', '2013/06');
INSERT INTO attachments VALUES ('117', null, null, '智能交通综合管理平台用户手册标准版1.pdf', '130617185427_e01f913ba306d5fdc9a57dd3f8ea49ce.pdf', '12446204', '', 'f2da1b8f77178a79f0ad72e064d4318f', '0', '10', '2013-06-17 18:54:27', null, '2013/06');
INSERT INTO attachments VALUES ('118', null, null, 'differences between our system and the competitor_s.docx', '130617185509_acd9610e6e8ac7491fa62e90b441cc4d.docx', '2448544', '', '7e0d30cb871642a118449a7e8c82943a', '0', '10', '2013-06-17 18:55:09', null, '2013/06');
INSERT INTO attachments VALUES ('119', null, null, '智能交通综合管理平台用户手册标准版1.pdf', '130617190124_e01f913ba306d5fdc9a57dd3f8ea49ce.pdf', '12446204', '', 'f2da1b8f77178a79f0ad72e064d4318f', '0', '10', '2013-06-17 19:01:24', null, '2013/06');
INSERT INTO attachments VALUES ('120', null, null, 'differences between our system and the competitor_s.docx', '130617190140_acd9610e6e8ac7491fa62e90b441cc4d.docx', '2448544', '', '7e0d30cb871642a118449a7e8c82943a', '0', '10', '2013-06-17 19:01:40', null, '2013/06');
INSERT INTO attachments VALUES ('121', '60', 'Issue', '智能交通综合管理平台用户手册标准版1.pdf', '130617190824_e01f913ba306d5fdc9a57dd3f8ea49ce.pdf', '12446204', null, 'f2da1b8f77178a79f0ad72e064d4318f', '0', '10', '2013-06-17 19:08:24', 'Original input document (competitor)', '2013/06');
INSERT INTO attachments VALUES ('122', '60', 'Issue', 'differences between our system and the competitor_s.docx', '130617190846_acd9610e6e8ac7491fa62e90b441cc4d.docx', '2448544', null, '7e0d30cb871642a118449a7e8c82943a', '0', '10', '2013-06-17 19:08:46', 'Comparaison made in English', '2013/06');
INSERT INTO attachments VALUES ('124', '61', 'Issue', '电子警察需求分析 - WEB综合管理平台功能(1).xls', '130617193527_5fa556cad4c62ce10caf9d6b343a9264.xls', '125440', null, '5f6cb632412d123d778c0b779c563543', '0', '19', '2013-06-17 19:35:27', '电子警察web需求分析', '2013/06');
INSERT INTO attachments VALUES ('126', null, null, 'Prodcut description manual for TeleFrame Electronic Policeman信帧电子警察产品说明手册.doc', '130625121125_78d49508f7138a15c27a25781aa08ce3.doc', '5318144', '', '5b9c49980d499d90aabe96a9fe952bf9', '0', '5', '2013-06-25 12:11:25', null, '2013/06');
INSERT INTO attachments VALUES ('127', '16', 'Document', 'Prodcut description manual for TeleFrame Electronic Policeman信帧电子警察产品说明手册.doc', '130625121447_78d49508f7138a15c27a25781aa08ce3.doc', '5318144', null, '5b9c49980d499d90aabe96a9fe952bf9', '0', '5', '2013-06-25 12:14:47', 'Description of the engineer\'s interface', '2013/06');
INSERT INTO attachments VALUES ('128', '74', 'Issue', 'Prodcut description manual for TeleFrame Electronic Policeman信帧电子警察产品说明手册.doc', '130625121810_78d49508f7138a15c27a25781aa08ce3.doc', '5318144', null, '5b9c49980d499d90aabe96a9fe952bf9', '0', '5', '2013-06-25 12:18:10', '', '2013/06');
INSERT INTO attachments VALUES ('129', '17', 'Document', 'Teleframe electronic policeman 2.ppt', '130627170246_32a53b7c3ec2ece9b34ff2147da14408.ppt', '3678720', null, '8b4433b38551fd266fd5347fac8f25c9', '0', '5', '2013-06-27 17:02:46', '', '2013/06');
INSERT INTO attachments VALUES ('130', '76', 'Issue', 'Teleframe electronic policeman 2.ppt', '130627171128_32a53b7c3ec2ece9b34ff2147da14408.ppt', '3678720', null, '8b4433b38551fd266fd5347fac8f25c9', '0', '5', '2013-06-27 17:11:28', '', '2013/06');
INSERT INTO attachments VALUES ('132', '5', 'WikiPage', 'QQ截图20130628160414.jpg', '130628170528_53a9fb802c1a64657293ceb4994b3cb3.jpg', '22970', null, '5aaf7386877b6d405340afb9b815c409', '0', '3', '2013-06-28 17:05:28', '', '2013/06');
INSERT INTO attachments VALUES ('133', '64', 'Issue', 'ShowLastTaskByWatchedFolderTest.java', '130701204536_ShowLastTaskByWatchedFolderTest.java', '5617', null, 'b3ddde1305fe60ea46a66a814523d039', '0', '10', '2013-07-01 20:45:36', 'Java source code example', '2013/07');
INSERT INTO attachments VALUES ('135', null, null, 'messages_cn.properties', '130703151445_messages_cn.properties', '35504', '', '6d93f5f8267c44d37179f5042e11ef66', '0', '5', '2013-07-03 15:14:45', null, '2013/07');
INSERT INTO attachments VALUES ('139', '9', 'Document', 'messages_cn.properties', '130703162755_messages_cn.properties', '35516', null, '7312fa52ae9b7f9946e31e1382ff4bfd', '0', '5', '2013-07-03 16:27:55', 'final version', '2013/07');
INSERT INTO attachments VALUES ('140', '33', 'Issue', 'messages_cn.properties', '130703163846_messages_cn.properties', '35516', null, '7312fa52ae9b7f9946e31e1382ff4bfd', '0', '5', '2013-07-03 16:38:46', 'final version', '2013/07');
INSERT INTO attachments VALUES ('141', '18', 'Document', 'r4582.zip', '130704134509_r4582.zip', '423286', null, 'b0eae18648d75970fd910ffeeb3b1dcc', '0', '10', '2013-07-04 13:45:09', '', '2013/07');
INSERT INTO attachments VALUES ('142', '4', 'Issue', 'screenshot.png', '130705171028_screenshot.png', '13851', null, '66d3aa9d3d865ba0504361582117c61e', '0', '10', '2013-07-05 17:10:28', '', '2013/07');
INSERT INTO attachments VALUES ('143', '79', 'Issue', 'm2e_eclipse_plugin.png', '130709181423_m2e_eclipse_plugin.png', '46332', null, '72a7867b0f14daefa65158751dcdddfa', '0', '10', '2013-07-09 18:14:23', '', '2013/07');
INSERT INTO attachments VALUES ('144', '79', 'Issue', 'm2e_eclipse_plugin.png', '130709181658_m2e_eclipse_plugin.png', '84874', null, '16b1154c151697585ea05e506de7073c', '0', '10', '2013-07-09 18:16:58', '', '2013/07');
INSERT INTO attachments VALUES ('147', '85', 'Issue', 'image.png', '130712165318_image.png', '267943', null, 'b1e6d96c4ce2938578fff4a4a0ba7b24', '0', '10', '2013-07-12 16:53:19', 'screen shot of google maps', '2013/07');
INSERT INTO attachments VALUES ('148', '19', 'Document', 'Test_GIS.values_Clean.sql', '130716155227_Test_GIS.values_Clean.sql', '312', null, '460caa0a83bb3c2d24bcd32ede849128', '0', '3', '2013-07-16 15:52:27', 'after test GIS execute the sql script to clean', '2013/07');
INSERT INTO attachments VALUES ('149', '19', 'Document', 'Test_GIS.values.sql', '130716155227_Test_GIS.values.sql', '8597', null, '70f42311de939cce373d94f720b9773c', '0', '3', '2013-07-16 15:52:27', 'before test GIS execute the sql script to init', '2013/07');
INSERT INTO attachments VALUES ('150', '56', 'Issue', 'screenshot.png', '130716160540_screenshot.png', '500633', null, 'a8e21a83b729e87cd85a1c906580f175', '0', '10', '2013-07-16 16:05:40', 'screen shot (WMP in web app versu VLC)', '2013/07');
INSERT INTO attachments VALUES ('151', '19', 'Document', 't_s_location_init.sql', '130716161525_t_s_location_init.sql', '3408', null, 'b9af92f0c8fc976b3a7f77b17e0cb3f1', '0', '3', '2013-07-16 16:15:25', 'location initialize data', '2013/07');
INSERT INTO attachments VALUES ('153', '94', 'Issue', 'picture.jpg', '130722145425_picture.jpg', '59355', null, '631e4f63d090a1e13fdd234a0135b865', '0', '5', '2013-07-22 14:54:25', '', '2013/07');
INSERT INTO attachments VALUES ('154', null, null, 'QQ截图20130626132051.jpg', '130723133532_348ebccadfd36c7714407b899a134edc.jpg', '208622', '', 'bd4894ca0e5a39290162c4d7f5361b4a', '0', '3', '2013-07-23 13:35:32', null, '2013/07');
INSERT INTO attachments VALUES ('155', '85', 'Issue', 'QQ截图20130723133200.png', '130723134534_10ac7730c72b4a4bad2a99d84601b2c9.png', '273926', null, '1b7c2bda09cac23d9cd170adb32b6fe1', '0', '19', '2013-07-23 13:45:34', '', '2013/07');
INSERT INTO attachments VALUES ('156', '85', 'Issue', 'QQ截图20130723133232.png', '130723134541_f45d828f5eba3bf80796fbe263ab13f4.png', '261917', null, 'a0e96684be6958c1b5ed6c531cfc34c8', '0', '19', '2013-07-23 13:45:41', '', '2013/07');
INSERT INTO attachments VALUES ('159', '98', 'Issue', 'QQ20130724152602.jpg', '130724152905_QQ20130724152602.jpg', '176739', null, '62dc3d8e3bfeb95f7aefe83b95a69912', '0', '3', '2013-07-24 15:29:05', '', '2013/07');
INSERT INTO attachments VALUES ('162', '113', 'Issue', '1.jpg', '130819143156_1.jpg', '87477', null, '3144440a92a3af64542b8dee61d132df', '0', '5', '2013-08-19 14:31:56', '', '2013/08');
INSERT INTO attachments VALUES ('163', '113', 'Issue', '2.jpg', '130819143826_2.jpg', '55349', null, 'c026246a902d920dd3141e251c246f9c', '0', '5', '2013-08-19 14:38:26', '', '2013/08');
INSERT INTO attachments VALUES ('164', null, null, 'QQ截图20130829105310.png', '130829105227_a671aa68690d37925d59fb02d4d6b22a.png', '353385', '', 'be5ed0c4628254057a2a3b1c76213ac2', '0', '3', '2013-08-29 10:52:27', null, '2013/08');
INSERT INTO attachments VALUES ('165', '123', 'Issue', '20130829105310.png', '130829105853_20130829105310.png', '353385', null, 'be5ed0c4628254057a2a3b1c76213ac2', '0', '3', '2013-08-29 10:58:53', '', '2013/08');
INSERT INTO attachments VALUES ('166', '94', 'Issue', 'QQscreenshot .jpg', '130830112336_d412fd5a428deff377552f65965415b9.jpg', '29248', null, '024a3bb4dca2205fd490e73249810641', '0', '5', '2013-08-30 11:23:36', '', '2013/08');
INSERT INTO attachments VALUES ('167', '118', 'Issue', 'fileupload20130830171710.png', '130830182528_fileupload20130830171710.png', '58049', null, 'efab708e25200adfacc155603026be4a', '0', '3', '2013-08-30 18:25:28', '', '2013/08');
INSERT INTO attachments VALUES ('168', '112', 'Issue', 'image_missing.png', '130902121057_image_missing.png', '65209', null, 'c15b5ba71a137b9b77743709176447d1', '0', '10', '2013-09-02 12:10:57', '', '2013/09');
INSERT INTO attachments VALUES ('169', '112', 'Issue', 'image_missing2.png', '130902121344_image_missing2.png', '54386', null, '788aa6eeb5eafceaa548ab617d1f1707', '0', '10', '2013-09-02 12:13:44', '', '2013/09');
INSERT INTO attachments VALUES ('170', '118', 'Issue', 'fileupload20130903154715.jpg', '130903155332_fileupload20130903154715.jpg', '63888', null, 'c6eb392ff674b27e7205e82c63bd2072', '0', '3', '2013-09-03 15:53:32', '', '2013/09');
INSERT INTO attachments VALUES ('172', '124', 'Issue', 'photo20130903212349.jpg', '130903212614_photo20130903212349.jpg', '45028', null, '98086fa9c0f1cc4e139aa141b56bdf75', '0', '3', '2013-09-03 21:26:14', '', '2013/09');
INSERT INTO attachments VALUES ('173', '124', 'Issue', 'touxiangIcon.gif', '130903212616_touxiangIcon.gif', '2575', null, '36412e2e3877dff85c6f1115888bca7f', '0', '3', '2013-09-03 21:26:16', '', '2013/09');
INSERT INTO attachments VALUES ('174', null, null, '缺陷报告-2013.10.10.xlsx', '131010134815_e43f00f369d259acb1f07bf9b90adba8.xlsx', '3112124', '', 'fdb1911b69b4a6c735afa7ac44c4b1dc', '0', '25', '2013-10-10 13:48:15', null, '2013/10');
INSERT INTO attachments VALUES ('175', '20', 'Document', '项目开发文档-模版.zip', '131025114831_e85940d74cc7fe798e1becd20123e6cf.zip', '2962982', null, '07dc7e7641dbfab36f5193da7ab3d73f', '0', '3', '2013-10-25 11:48:31', '', '2013/10');

-- ----------------------------
-- Table structure for `auth_sources`
-- ----------------------------
DROP TABLE IF EXISTS `auth_sources`;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_sources
-- ----------------------------

-- ----------------------------
-- Table structure for `boards`
-- ----------------------------
DROP TABLE IF EXISTS `boards`;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boards
-- ----------------------------

-- ----------------------------
-- Table structure for `changes`
-- ----------------------------
DROP TABLE IF EXISTS `changes`;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changes
-- ----------------------------

-- ----------------------------
-- Table structure for `changesets`
-- ----------------------------
DROP TABLE IF EXISTS `changesets`;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` text,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changesets
-- ----------------------------

-- ----------------------------
-- Table structure for `changesets_issues`
-- ----------------------------
DROP TABLE IF EXISTS `changesets_issues`;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changesets_issues
-- ----------------------------

-- ----------------------------
-- Table structure for `changeset_parents`
-- ----------------------------
DROP TABLE IF EXISTS `changeset_parents`;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changeset_parents
-- ----------------------------

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO comments VALUES ('1', 'News', '2', '10', 'Documentation of the API is still available at http://10.168.1.160:8080/api\r\n', '2013-06-03 17:53:57', '2013-06-03 17:53:57');
INSERT INTO comments VALUES ('2', 'News', '5', '10', '\"Download package r4582\":http://10.168.1.251:3000/documents/18', '2013-07-04 17:14:14', '2013-07-04 17:14:14');

-- ----------------------------
-- Table structure for `custom_fields`
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` int(11) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_fields
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_fields_projects`
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields_projects`;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_fields_projects
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_fields_trackers`
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields_trackers`;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_fields_trackers
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_values`
-- ----------------------------
DROP TABLE IF EXISTS `custom_values`;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_values
-- ----------------------------

-- ----------------------------
-- Table structure for `documents`
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents
-- ----------------------------
INSERT INTO documents VALUES ('2', '5', '7', 'Project Construction Scheme for \"Safe Lijiang\" - 平安丽江”项目建设方案', 'This document has been provided by Mr Ding and Zhongxuan on 26/04/13. This the orginal one in Chinese.\r\n', '2013-04-26 18:30:56');
INSERT INTO documents VALUES ('4', '5', '6', 'Medianate presentation for \'car retrieval\' application.', 'PPT file as required by Zhongxuan. This is a first version that should be translated in Chinese (Helen) and adapted if necessary by marketing/sale people maybe.', '2013-04-26 21:23:57');
INSERT INTO documents VALUES ('5', '3', '7', '需求分析与研发计划文档', '', '2013-04-27 10:45:55');
INSERT INTO documents VALUES ('6', '6', '6', '2013/4/22周报', '', '2013-04-27 11:11:09');
INSERT INTO documents VALUES ('7', '5', '6', 'Software Development Requirement List', 'This Software Davelopment Requirement List is from Mr. Wang Haifeng, and it illustrates everyone‘s tasks in detail.It was sent to Helen on April 26, 2013.', '2013-04-27 15:36:31');
INSERT INTO documents VALUES ('9', '5', '7', 'Chinese translation of the Medianate user interface', 'The Medianate user interface needs to be translated in Chinese for better understanding.', '2013-05-02 17:24:26');
INSERT INTO documents VALUES ('10', '9', '7', 'Documents for web development.', 'Documents for web development.', '2013-05-09 13:28:43');
INSERT INTO documents VALUES ('11', '5', '6', 'Intelligent Monitoring WEB System-Development document', '', '2013-05-09 14:05:02');
INSERT INTO documents VALUES ('12', '9', '6', 'Reference file', '', '2013-05-09 15:43:20');
INSERT INTO documents VALUES ('13', '11', '6', '参考产品cyeweb', '', '2013-05-14 10:46:16');
INSERT INTO documents VALUES ('14', '5', '6', 'PPT prepared for Datang', 'This is the PPT prepared for Datang. Electronic Police System, Intelligent Bayonet System and the Cloud system merges into one PPT eventually. ', '2013-05-21 16:45:22');
INSERT INTO documents VALUES ('15', '5', '6', 'User Manual of Teleframe Cloud System ', 'There are two documents about the user manual of Teleframe Cloud System. One is the original technical description of Medianate, the other is the one I created refering to \"User Manual of Intelligent Traffic General Management Platform -standard version\"(智能交通综合管理平台用户手册标准版). It is different logic between these two documents. I can\'t decide which is better by myself. The original one seem more professional? ', '2013-06-04 10:22:05');
INSERT INTO documents VALUES ('16', '5', '6', 'Prodcut description manual for Electronic Policeman', 'This is the description of the engineer\'s interface of ITS.', '2013-06-25 12:16:05');
INSERT INTO documents VALUES ('17', '5', '6', 'Electronic Policeman PPT for the product release meeting', 'New content is added in this PPT comparing with the one of last product release meeting, including the Personnel Structure, Analysis End Architecture, Algorithm Architecture, system improvement history and general condition about the test work. ', '2013-06-27 17:04:29');
INSERT INTO documents VALUES ('18', '2', '7', 'Medianate API client jars and examples - r4582', 'Client JAR files for *r4582* revision of Medianate \'Tasks Scheduler\'. The corresponding api.war has been installed on the *22/05/2013*.\r\n\r\nTwo examples of Java source code are also provide in this package: \r\n- \'CopyDirectTaskTest\' to create, start and monitor a task,\r\n- \'ShowLastTaskByWatchedFolderTest\' to search based on \'watchfolder\' id and min/max \'creation date\' in search criteria.   ', '2013-07-04 13:50:17');
INSERT INTO documents VALUES ('19', '9', '6', 'Test For Cloud Retrieval GIS ', 'Sql script for  For Cloud Retrieval GIS ', '2013-07-12 16:44:16');
INSERT INTO documents VALUES ('20', '9', '7', 'Project Management Documents', '', '2013-10-25 11:48:43');

-- ----------------------------
-- Table structure for `enabled_modules`
-- ----------------------------
DROP TABLE IF EXISTS `enabled_modules`;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enabled_modules
-- ----------------------------
INSERT INTO enabled_modules VALUES ('1', '1', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('2', '1', 'time_tracking');
INSERT INTO enabled_modules VALUES ('3', '1', 'news');
INSERT INTO enabled_modules VALUES ('4', '1', 'documents');
INSERT INTO enabled_modules VALUES ('5', '1', 'files');
INSERT INTO enabled_modules VALUES ('6', '1', 'wiki');
INSERT INTO enabled_modules VALUES ('7', '1', 'repository');
INSERT INTO enabled_modules VALUES ('8', '1', 'boards');
INSERT INTO enabled_modules VALUES ('9', '1', 'calendar');
INSERT INTO enabled_modules VALUES ('10', '1', 'gantt');
INSERT INTO enabled_modules VALUES ('11', '2', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('12', '2', 'time_tracking');
INSERT INTO enabled_modules VALUES ('13', '2', 'news');
INSERT INTO enabled_modules VALUES ('14', '2', 'documents');
INSERT INTO enabled_modules VALUES ('15', '2', 'files');
INSERT INTO enabled_modules VALUES ('16', '2', 'wiki');
INSERT INTO enabled_modules VALUES ('17', '2', 'repository');
INSERT INTO enabled_modules VALUES ('18', '2', 'boards');
INSERT INTO enabled_modules VALUES ('19', '2', 'calendar');
INSERT INTO enabled_modules VALUES ('20', '2', 'gantt');
INSERT INTO enabled_modules VALUES ('21', '3', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('22', '3', 'time_tracking');
INSERT INTO enabled_modules VALUES ('23', '3', 'news');
INSERT INTO enabled_modules VALUES ('24', '3', 'documents');
INSERT INTO enabled_modules VALUES ('25', '3', 'files');
INSERT INTO enabled_modules VALUES ('26', '3', 'wiki');
INSERT INTO enabled_modules VALUES ('27', '3', 'repository');
INSERT INTO enabled_modules VALUES ('28', '3', 'boards');
INSERT INTO enabled_modules VALUES ('29', '3', 'calendar');
INSERT INTO enabled_modules VALUES ('30', '3', 'gantt');
INSERT INTO enabled_modules VALUES ('31', '4', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('32', '4', 'time_tracking');
INSERT INTO enabled_modules VALUES ('33', '4', 'news');
INSERT INTO enabled_modules VALUES ('34', '4', 'documents');
INSERT INTO enabled_modules VALUES ('35', '4', 'files');
INSERT INTO enabled_modules VALUES ('36', '4', 'wiki');
INSERT INTO enabled_modules VALUES ('39', '4', 'calendar');
INSERT INTO enabled_modules VALUES ('40', '4', 'gantt');
INSERT INTO enabled_modules VALUES ('41', '5', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('42', '5', 'time_tracking');
INSERT INTO enabled_modules VALUES ('43', '5', 'news');
INSERT INTO enabled_modules VALUES ('44', '5', 'documents');
INSERT INTO enabled_modules VALUES ('45', '5', 'files');
INSERT INTO enabled_modules VALUES ('46', '5', 'wiki');
INSERT INTO enabled_modules VALUES ('47', '5', 'repository');
INSERT INTO enabled_modules VALUES ('48', '5', 'boards');
INSERT INTO enabled_modules VALUES ('49', '5', 'calendar');
INSERT INTO enabled_modules VALUES ('50', '5', 'gantt');
INSERT INTO enabled_modules VALUES ('51', '6', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('52', '6', 'time_tracking');
INSERT INTO enabled_modules VALUES ('53', '6', 'news');
INSERT INTO enabled_modules VALUES ('54', '6', 'documents');
INSERT INTO enabled_modules VALUES ('55', '6', 'files');
INSERT INTO enabled_modules VALUES ('56', '6', 'wiki');
INSERT INTO enabled_modules VALUES ('57', '6', 'repository');
INSERT INTO enabled_modules VALUES ('58', '6', 'boards');
INSERT INTO enabled_modules VALUES ('59', '6', 'calendar');
INSERT INTO enabled_modules VALUES ('60', '6', 'gantt');
INSERT INTO enabled_modules VALUES ('61', '7', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('62', '7', 'time_tracking');
INSERT INTO enabled_modules VALUES ('63', '7', 'news');
INSERT INTO enabled_modules VALUES ('64', '7', 'documents');
INSERT INTO enabled_modules VALUES ('65', '7', 'files');
INSERT INTO enabled_modules VALUES ('66', '7', 'wiki');
INSERT INTO enabled_modules VALUES ('67', '7', 'repository');
INSERT INTO enabled_modules VALUES ('68', '7', 'boards');
INSERT INTO enabled_modules VALUES ('69', '7', 'calendar');
INSERT INTO enabled_modules VALUES ('70', '7', 'gantt');
INSERT INTO enabled_modules VALUES ('71', '8', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('72', '8', 'time_tracking');
INSERT INTO enabled_modules VALUES ('73', '8', 'news');
INSERT INTO enabled_modules VALUES ('74', '8', 'documents');
INSERT INTO enabled_modules VALUES ('75', '8', 'files');
INSERT INTO enabled_modules VALUES ('76', '8', 'wiki');
INSERT INTO enabled_modules VALUES ('77', '8', 'repository');
INSERT INTO enabled_modules VALUES ('78', '8', 'boards');
INSERT INTO enabled_modules VALUES ('79', '8', 'calendar');
INSERT INTO enabled_modules VALUES ('80', '8', 'gantt');
INSERT INTO enabled_modules VALUES ('81', '9', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('82', '9', 'time_tracking');
INSERT INTO enabled_modules VALUES ('83', '9', 'news');
INSERT INTO enabled_modules VALUES ('84', '9', 'documents');
INSERT INTO enabled_modules VALUES ('85', '9', 'files');
INSERT INTO enabled_modules VALUES ('86', '9', 'wiki');
INSERT INTO enabled_modules VALUES ('87', '9', 'repository');
INSERT INTO enabled_modules VALUES ('88', '9', 'boards');
INSERT INTO enabled_modules VALUES ('89', '9', 'calendar');
INSERT INTO enabled_modules VALUES ('90', '9', 'gantt');
INSERT INTO enabled_modules VALUES ('101', '4', 'repository');
INSERT INTO enabled_modules VALUES ('102', '4', 'boards');
INSERT INTO enabled_modules VALUES ('103', '11', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('104', '11', 'time_tracking');
INSERT INTO enabled_modules VALUES ('105', '11', 'news');
INSERT INTO enabled_modules VALUES ('106', '11', 'documents');
INSERT INTO enabled_modules VALUES ('107', '11', 'files');
INSERT INTO enabled_modules VALUES ('108', '11', 'wiki');
INSERT INTO enabled_modules VALUES ('109', '11', 'repository');
INSERT INTO enabled_modules VALUES ('110', '11', 'boards');
INSERT INTO enabled_modules VALUES ('111', '11', 'calendar');
INSERT INTO enabled_modules VALUES ('112', '11', 'gantt');
INSERT INTO enabled_modules VALUES ('113', '12', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('114', '12', 'time_tracking');
INSERT INTO enabled_modules VALUES ('115', '12', 'news');
INSERT INTO enabled_modules VALUES ('116', '12', 'documents');
INSERT INTO enabled_modules VALUES ('117', '12', 'files');
INSERT INTO enabled_modules VALUES ('118', '12', 'wiki');
INSERT INTO enabled_modules VALUES ('119', '12', 'repository');
INSERT INTO enabled_modules VALUES ('120', '12', 'boards');
INSERT INTO enabled_modules VALUES ('121', '12', 'calendar');
INSERT INTO enabled_modules VALUES ('122', '12', 'gantt');
INSERT INTO enabled_modules VALUES ('123', '13', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('124', '13', 'time_tracking');
INSERT INTO enabled_modules VALUES ('125', '13', 'news');
INSERT INTO enabled_modules VALUES ('126', '13', 'documents');
INSERT INTO enabled_modules VALUES ('127', '13', 'files');
INSERT INTO enabled_modules VALUES ('128', '13', 'wiki');
INSERT INTO enabled_modules VALUES ('129', '13', 'repository');
INSERT INTO enabled_modules VALUES ('130', '13', 'boards');
INSERT INTO enabled_modules VALUES ('131', '13', 'calendar');
INSERT INTO enabled_modules VALUES ('132', '13', 'gantt');
INSERT INTO enabled_modules VALUES ('133', '14', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('134', '14', 'time_tracking');
INSERT INTO enabled_modules VALUES ('135', '14', 'news');
INSERT INTO enabled_modules VALUES ('136', '14', 'documents');
INSERT INTO enabled_modules VALUES ('137', '14', 'files');
INSERT INTO enabled_modules VALUES ('138', '14', 'wiki');
INSERT INTO enabled_modules VALUES ('139', '14', 'repository');
INSERT INTO enabled_modules VALUES ('140', '14', 'boards');
INSERT INTO enabled_modules VALUES ('141', '14', 'calendar');
INSERT INTO enabled_modules VALUES ('142', '14', 'gantt');
INSERT INTO enabled_modules VALUES ('183', '19', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('184', '19', 'time_tracking');
INSERT INTO enabled_modules VALUES ('185', '19', 'news');
INSERT INTO enabled_modules VALUES ('186', '19', 'documents');
INSERT INTO enabled_modules VALUES ('187', '19', 'files');
INSERT INTO enabled_modules VALUES ('188', '19', 'wiki');
INSERT INTO enabled_modules VALUES ('189', '19', 'repository');
INSERT INTO enabled_modules VALUES ('190', '19', 'boards');
INSERT INTO enabled_modules VALUES ('191', '19', 'calendar');
INSERT INTO enabled_modules VALUES ('192', '19', 'gantt');
INSERT INTO enabled_modules VALUES ('193', '20', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('194', '20', 'time_tracking');
INSERT INTO enabled_modules VALUES ('195', '20', 'news');
INSERT INTO enabled_modules VALUES ('196', '20', 'documents');
INSERT INTO enabled_modules VALUES ('197', '20', 'files');
INSERT INTO enabled_modules VALUES ('198', '20', 'wiki');
INSERT INTO enabled_modules VALUES ('199', '20', 'repository');
INSERT INTO enabled_modules VALUES ('200', '20', 'boards');
INSERT INTO enabled_modules VALUES ('201', '20', 'calendar');
INSERT INTO enabled_modules VALUES ('202', '20', 'gantt');
INSERT INTO enabled_modules VALUES ('203', '21', 'issue_tracking');
INSERT INTO enabled_modules VALUES ('204', '21', 'time_tracking');
INSERT INTO enabled_modules VALUES ('205', '21', 'news');
INSERT INTO enabled_modules VALUES ('206', '21', 'documents');
INSERT INTO enabled_modules VALUES ('207', '21', 'files');
INSERT INTO enabled_modules VALUES ('208', '21', 'wiki');
INSERT INTO enabled_modules VALUES ('209', '21', 'repository');
INSERT INTO enabled_modules VALUES ('210', '21', 'boards');
INSERT INTO enabled_modules VALUES ('211', '21', 'calendar');
INSERT INTO enabled_modules VALUES ('212', '21', 'gantt');

-- ----------------------------
-- Table structure for `enumerations`
-- ----------------------------
DROP TABLE IF EXISTS `enumerations`;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enumerations
-- ----------------------------
INSERT INTO enumerations VALUES ('1', 'Low', '1', '0', 'IssuePriority', '1', null, null, 'lowest');
INSERT INTO enumerations VALUES ('2', 'Normal', '2', '1', 'IssuePriority', '1', null, null, 'default');
INSERT INTO enumerations VALUES ('3', 'High', '3', '0', 'IssuePriority', '1', null, null, 'high3');
INSERT INTO enumerations VALUES ('4', 'Urgent', '4', '0', 'IssuePriority', '1', null, null, 'high2');
INSERT INTO enumerations VALUES ('5', 'Immediate', '5', '0', 'IssuePriority', '1', null, null, 'highest');
INSERT INTO enumerations VALUES ('6', 'User documentation', '1', '0', 'DocumentCategory', '1', null, null, null);
INSERT INTO enumerations VALUES ('7', 'Technical documentation', '2', '0', 'DocumentCategory', '1', null, null, null);
INSERT INTO enumerations VALUES ('8', 'Design', '1', '0', 'TimeEntryActivity', '1', null, null, null);
INSERT INTO enumerations VALUES ('9', 'Development', '2', '0', 'TimeEntryActivity', '1', null, null, null);

-- ----------------------------
-- Table structure for `groups_users`
-- ----------------------------
DROP TABLE IF EXISTS `groups_users`;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups_users
-- ----------------------------
INSERT INTO groups_users VALUES ('11', '8');

-- ----------------------------
-- Table structure for `issues`
-- ----------------------------
DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of issues
-- ----------------------------
INSERT INTO issues VALUES ('1', '3', '1', 'Tleframe Medianate does not support linux file path', 'Tleframe Medianate does not support linux file path\r\nI guess that may be caused due to the path \'/\' and \'\\ \\\'.', null, null, '1', null, '2', null, '4', '0', '2013-04-26 15:33:50', '2013-04-26 15:33:50', '2013-04-26', '0', null, null, '1', '1', '2', '0', null);
INSERT INTO issues VALUES ('2', '2', '2', 'Chinese character in file name and uri', 'Chinese characters should be supported for input/output file names and directory names.', '2013-07-12', null, '1', '10', '3', null, '10', '1', '2013-04-26 16:02:24', '2013-07-04 21:43:23', '2013-04-26', '50', null, null, '2', '3', '4', '0', null);
INSERT INTO issues VALUES ('4', '1', '2', 'Frame cts problem', 'Now the frame cts is always 0 for minute.', null, null, '3', null, '2', null, '6', '1', '2013-04-26 16:47:13', '2013-07-05 17:11:10', '2013-04-26', '100', null, null, '4', '3', '4', '0', null);
INSERT INTO issues VALUES ('9', '3', '5', 'Partial translation of Safe Lijiang documentation', 'The ToC (table of content) should be first translated in English, and maybe some parts if Frederic needs it.', null, null, '3', '10', '2', null, '10', '2', '2013-04-26 18:35:14', '2013-04-28 11:04:57', '2013-04-26', '100', null, null, '9', '5', '6', '0', null);
INSERT INTO issues VALUES ('10', '1', '2', 'About the watch folder', '在增加 watch folder的时候，如果没有在folder名字后面增加一条斜杠,会导致 watch folder监控程序崩溃\r\n如：\r\n/mywatchfolder   会导致 程序崩溃，进而导致 watch folder 不能够自动处理视频 \r\n\r\n[目前]正确的输入应该是: /mywatchfolder/ \r\n\r\n请Frederic修正此Bug', null, null, '1', null, '2', null, '3', '1', '2013-04-26 19:03:05', '2013-04-27 11:53:41', '2013-04-26', '0', null, null, '10', '3', '4', '0', null);
INSERT INTO issues VALUES ('11', '3', '5', 'PPT for Introduction of Teleframe Cloud Retrieval Product', 'First version: http://10.168.1.251:3000/documents/4.\r\nTo be translated and adapted (if necessary) by marketing/sales people.', null, null, '5', '10', '3', null, '10', '3', '2013-04-26 21:29:27', '2013-05-02 09:33:40', '2013-04-26', '100', null, null, '11', '7', '8', '0', '2013-04-27 15:17:10');
INSERT INTO issues VALUES ('15', '3', '7', '关于现有算法可见光摄像头室内测试工作', '', '2013-05-02', null, '1', '16', '2', null, '6', '0', '2013-04-27 10:33:12', '2013-04-27 10:33:12', '2013-04-27', '0', null, null, '15', '1', '2', '0', null);
INSERT INTO issues VALUES ('17', '2', '8', '公司内部网站测试与确定更新方式', '对邵岩做的web放到公司内网供公司人员审查；\r\n与原有网站负责公司交流更新情况。', '2013-05-03', null, '1', null, '2', null, '6', '1', '2013-04-27 11:07:03', '2013-04-27 11:11:59', '2013-04-27', '0', null, null, '17', '3', '4', '0', null);
INSERT INTO issues VALUES ('19', '3', '2', 'Teleframe Medianate does not support linux file path', 'Tleframe Medianate does not support linux file path\r\nI guess that may be caused due to the path \'/\' and \'\\ \\\'.\r\n', null, null, '1', null, '2', null, '4', '4', '2013-04-27 11:45:12', '2013-09-26 14:10:06', '2013-04-27', '0', null, null, '19', '9', '10', '0', null);
INSERT INTO issues VALUES ('20', '3', '5', 'Software Development Requirement List', 'The original version: http://10.168.1.251:3000/documents/7  ', '2013-04-28', null, '3', '10', '1', null, '5', '1', '2013-04-27 15:41:05', '2013-04-28 15:54:19', '2013-04-27', '100', null, null, '20', '3', '4', '0', null);
INSERT INTO issues VALUES ('22', '3', '9', '周工作总结和计划', '', null, null, '1', null, '2', null, '3', '1', '2013-04-27 16:14:04', '2013-05-01 13:45:30', '2013-04-27', '0', null, null, '22', '3', '4', '0', null);
INSERT INTO issues VALUES ('27', '3', '9', 'Documents for web development.', 'Documents for web development.', null, null, '1', null, '2', null, '3', '7', '2013-04-27 16:43:44', '2013-05-09 09:22:24', '2013-04-27', '0', null, null, '27', '15', '16', '0', null);
INSERT INTO issues VALUES ('28', '3', '9', 'WEB UI 工程师(需求)', 'WEB需要1名UI工程师改进页面，上一名[郑亚薇]又不来了，目前还在招募新人中', null, null, '5', null, '2', null, '3', '2', '2013-04-28 10:18:17', '2013-05-09 15:26:49', '2013-04-28', '0', null, null, '28', '5', '6', '0', '2013-05-09 15:26:49');
INSERT INTO issues VALUES ('29', '2', '2', 'Adding location of cameras on map', 'For every video, a position (position of the camera capturing the video) is given. When selecting a video or a camera, a button is pushed before turing to map which display position of camera. When openning the map, the positions of all the cameras are displayed.', '2013-05-15', null, '1', '10', '2', null, '6', '0', '2013-05-02 08:36:06', '2013-05-02 08:36:06', '2013-05-02', '0', null, null, '29', '1', '2', '0', null);
INSERT INTO issues VALUES ('31', '2', '2', 'Adding group of videos', 'In \"view tasks\", adding the column of video groups. After openning the video group, the videos belonging to this group are shown which is just as what it likes now. ', '2013-05-23', null, '1', '10', '2', null, '6', '0', '2013-05-02 09:38:06', '2013-05-02 09:38:06', '2013-05-02', '0', null, null, '31', '1', '2', '0', null);
INSERT INTO issues VALUES ('32', '3', '4', '消防监控需求分析文档', '消防监控需求分析文档\r\n\r\n以下模块与电子警察产品公用:\r\nWEB综合管理平台,分析服务器MFC平台(功能)\r\n以下模块暂停:\r\n分析服务器MFC平台(界面)\r\n', null, null, '1', '4', '2', null, '12', '0', '2013-05-02 14:51:17', '2013-05-02 14:51:17', '2013-05-02', '0', null, null, '32', '1', '2', '0', null);
INSERT INTO issues VALUES ('33', '3', '5', 'Chinese Translation of the Medianate user interface', 'The original English version and the initial translation are here: http://10.168.1.251:3000/documents/9 ', null, null, '3', '10', '2', null, '5', '7', '2013-05-02 17:29:19', '2013-07-03 16:39:14', '2013-05-02', '100', null, null, '33', '15', '16', '0', null);
INSERT INTO issues VALUES ('34', '1', '2', 'Player', 'IE is right when play the video.\r\nBut it will goes wrong with google chrome\r\nThe pictrue shows the bug:\r\n\r\nQQ截图20130502162650.jpg\r\nQQ截图20130502162702.jpg', null, null, '3', null, '2', null, '3', '1', '2013-05-02 18:19:07', '2013-05-09 16:38:47', '2013-05-02', '0', null, null, '34', '3', '4', '0', null);
INSERT INTO issues VALUES ('36', '2', '3', '开发算法配置检测区域设置', '开发配置界面,\r\n可以读取\r\n    TF_EPolice\\bin\\config\\default 下的配置文件 显示配置信心\r\n可以修改配置重新保存参数到\r\n    TF_EPolice\\bin\\config\\default 下的配置文件\r\n', '2013-05-18', null, '5', '3', '2', null, '9', '7', '2013-05-06 10:01:11', '2013-05-28 10:41:50', '2013-05-06', '100', '50', null, '36', '15', '16', '0', '2013-05-28 10:21:04');
INSERT INTO issues VALUES ('37', '3', '9', '参考文档', '', null, null, '1', null, '2', null, '3', '2', '2013-05-06 15:20:49', '2013-05-08 10:00:42', '2013-05-06', '0', null, null, '37', '5', '6', '0', null);
INSERT INTO issues VALUES ('38', '3', '5', 'Intelligent Monitoring Web System', 'The original version is here: http://10.168.1.251:3000/documents/11 \r\nIt is also located in the \"Documents for web deveopment\" of project \"Intelligent Monitoring Web Systems\" in Redmine : http://10.168.1.251:3000/issues/27 with the name :信帧智能监控WEB系统-开发文档.docx ', null, null, '1', '5', '3', null, '5', '2', '2013-05-09 14:14:12', '2013-06-07 17:54:42', '2013-05-09', '0', null, null, '38', '5', '6', '0', null);
INSERT INTO issues VALUES ('40', '1', '2', 'can\'t upload video file in IE', 'I can\'t upload video file in IE. I have tried files with avi, mp4, asf format, and all faild. It shows invalid character in the dialog window.', null, null, '1', null, '2', null, '5', '0', '2013-05-15 14:52:18', '2013-05-15 14:52:18', '2013-05-15', '0', null, null, '40', '1', '2', '0', null);
INSERT INTO issues VALUES ('41', '1', '5', 'Translation of PPT( product introduction) prepared for Datang', 'The original version is here：http://10.168.1.251:3000/documents/14 ', null, null, '1', null, '2', null, '5', '1', '2013-05-21 16:50:19', '2013-05-24 14:28:54', '2013-05-21', '0', null, null, '41', '3', '4', '0', null);
INSERT INTO issues VALUES ('42', '1', '2', 'The watch folder doesn\'t work', 'In the evening of May 22, the watch folder runs normally in the new version before Frederic leaves.\r\nOn May 23, I have created two new accounts and began the detection. However, the watch folder doesn\'t work: when you upload videos in the folder, the videos won\'t be processed automatically.I have restarted the executive program twice. Each time I restarted it, a new task comes out but it shows that the task is failed. And when I re-upload videos in the folder, it doesn\'t process the task as before. ', null, null, '5', null, '2', null, '5', '1', '2013-05-23 14:08:19', '2013-06-13 13:14:49', '2013-05-23', '0', null, null, '42', '3', '4', '0', '2013-06-13 13:14:49');
INSERT INTO issues VALUES ('43', '2', '3', '车道参数配置模块中鼠标拖动线段', '现在的车道参数配置模块中不能对所画线段进行拖动，应该支持拖动，并且车辆检测区域，应该用颜色将区域标记出来。', '2013-08-21', null, '3', '3', '2', null, '13', '3', '2013-05-28 09:11:21', '2013-08-22 13:21:52', '2013-08-19', '100', null, null, '43', '7', '8', '0', null);
INSERT INTO issues VALUES ('44', '1', '3', '车道线配置模块中有关信号灯组数和信号灯ID选项', '车道线配置模块中，要将 “信号灯组数”选单中添加入数字(1 2 3 4 )， “信号灯ID”选项中要添加入信号灯ID选项(1 2 3 4)。', '2013-05-31', null, '3', '3', '3', null, '13', '4', '2013-05-28 09:16:43', '2013-08-19 12:30:11', '2013-05-28', '100', null, null, '44', '9', '10', '0', null);
INSERT INTO issues VALUES ('45', '1', '3', '程序稳定性', '长时间 出现蹦的状况 算法和平台都要优化', null, null, '1', null, '3', null, '8', '0', '2013-05-28 09:33:49', '2013-05-28 09:33:49', '2013-05-28', '0', null, null, '45', '1', '2', '0', null);
INSERT INTO issues VALUES ('46', '1', '3', '红灯配置', '程序模块还没有实现', null, null, '1', '8', '3', null, '8', '1', '2013-05-28 09:36:00', '2013-05-28 14:40:59', '2013-05-28', '0', null, null, '46', '3', '4', '0', null);
INSERT INTO issues VALUES ('47', '1', '3', '内存占用大', '程序只能播放一路视频 第二路内存不足 而且有Bug', null, null, '1', '13', '3', null, '8', '1', '2013-05-28 09:37:56', '2013-05-28 10:20:26', '2013-05-28', '0', null, null, '47', '3', '4', '0', null);
INSERT INTO issues VALUES ('48', '3', '5', 'User Manual of Teleframe Cloud System ', 'Pls see the documents at http://10.168.1.251:3000/documents/15 .\r\nThere are two documents about the user manual of Teleframe Cloud System. One is the original technical description of Medianate, the other is the one I created refering to \"User Manual of Intelligent Traffic General Management Platform -standard version\"(智能交通综合管理平台用户手册标准版). It is different logic between these two documents. I can\'t decide which is better by myself. The original one seem more professional?', null, null, '1', null, '2', null, '5', '0', '2013-06-04 10:26:48', '2013-06-04 10:26:48', '2013-06-04', '0', null, null, '48', '1', '2', '0', null);
INSERT INTO issues VALUES ('49', '3', '5', 'width x height dimension consistency of input video', '1) about all video files that are here : \r\n/Video/解码测试录像资料/大华_Dahua\r\n/Video/解码测试录像资料/天工开视_Tiangongkaishi\r\n/Video/解码测试录像资料/海康_Haikang\r\nWho produced them ? Were they made directly from cameras (or a software) ? \r\n1 \"read me\" text file should be put inside each folder to say it. \r\n \r\n2) 2560x1920 and 2464x2048 : asking Mr Liu if we need a so high image definition for plate recognition ? or is it only a need of ITS analysis ?\r\n\r\n3) \\\\10.168.1.160\\HOME_admin\\wf_platerecognition\\processed_input_files\\bayonetdemo0003.avi : who produced this file ? how was it made ? why is the defintion equal to 1280x720 (and not 2560x1920 and 2464x2048)  \r\n\r\n\r\n\r\n', null, null, '2', '5', '2', null, '10', '7', '2013-06-09 13:33:41', '2013-07-17 11:03:15', '2013-06-09', '90', null, null, '49', '15', '16', '0', null);
INSERT INTO issues VALUES ('50', '2', '2', 'About video format support', '', null, null, '1', '10', '2', null, '6', '2', '2013-06-09 15:20:01', '2013-07-12 17:28:31', '2013-06-09', '0', null, null, '50', '5', '6', '0', null);
INSERT INTO issues VALUES ('51', '2', '2', 'Remaining English characters in the Chinese user interface of Medianate', 'Sorry I deleted the original issue due to wrong operation( I intend to delete the latest update and replace it with a new one).\r\n\r\nThere are some chinese characters remaining in the Chinese user interface of Medianate. I have listed them as well as the screenshots in the attachment. ', null, null, '2', null, '2', null, '5', '2', '2013-06-13 14:07:34', '2013-07-04 21:54:13', '2013-06-13', '90', null, null, '51', '5', '6', '0', null);
INSERT INTO issues VALUES ('52', '1', '2', 'problem with  “disable” and “enable” button ', 'The “disable” and “enable” button have to be press twice *+usually+* to enable or disable the folder.', null, null, '1', '10', '2', null, '5', '2', '2013-06-13 17:24:31', '2013-07-03 09:41:35', '2013-06-13', '0', null, null, '52', '5', '6', '0', null);
INSERT INTO issues VALUES ('54', '2', '2', 'Add the “retract” function', 'In the “View task\" page,\r\nIf the reports information could be retracted when pressing the title bar, it may be more convenient to see the following content in the following two title bars. ', null, null, '1', null, '2', null, '5', '0', '2013-06-13 17:38:53', '2013-06-13 17:38:53', '2013-06-13', '0', null, null, '54', '1', '2', '0', null);
INSERT INTO issues VALUES ('55', '2', '2', 'report full content could be shown only moving the mouse up for the lines at the bottom', 'If the step report is very long, then you press one line related to a car at the bottom of the step report page, on the right side the you couldn\'t see the correspondent report full content unless you move the mouse up. It\'s not very convenient for the user.', null, null, '1', null, '2', null, '5', '0', '2013-06-13 18:01:57', '2013-06-13 18:01:57', '2013-06-13', '0', null, null, '55', '1', '2', '0', null);
INSERT INTO issues VALUES ('56', '2', '19', 'Integration of video player', 'One of these 2 possibilities of players (JW Player or OSMF Strobe) should be integrate : \r\nhttp://10.168.1.251:3000/projects/cloud-retrieval-medianate/wiki#4-How-to-embed-a-video-player-in-web-pages-', '2013-06-28', null, '3', '19', '2', null, '10', '9', '2013-06-14 13:59:21', '2013-08-30 10:21:01', '2013-06-24', '100', null, null, '56', '19', '20', '0', null);
INSERT INTO issues VALUES ('58', '2', '19', 'Getting and monitoring tasks created by watch folder', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n\r\n 1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n 2) Specify in the input criteria the watch folder Id:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n 3) Precise the tasks state if necessary:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n(EDITION PROCESSING FAILED COMPLETED)\r\n\r\nReference: \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki', '2013-07-05', null, '3', '19', '2', null, '19', '15', '2013-06-14 17:51:13', '2013-08-30 10:22:29', '2013-06-14', '100', null, '64', '64', '14', '15', '0', null);
INSERT INTO issues VALUES ('59', '1', '9', 'Debugging work related to MFC data upload', 'Upload real time data and picture by MFC. I am cooperate with Mr. Xin about the debugging work, such as the decoding method and user interface adjustment.', '2013-06-19', null, '5', '19', '2', null, '19', '1', '2013-06-14 17:57:31', '2013-06-26 10:30:55', '2013-06-14', '100', null, null, '59', '3', '4', '0', '2013-06-26 10:30:55');
INSERT INTO issues VALUES ('60', '3', '5', 'ITS retrieval web application  - comparaison with competitor product', 'This is to define the remaining features to be integrated in the retrieval part of ITS.', null, null, '1', '10', '2', null, '10', '2', '2013-06-17 19:09:22', '2013-06-17 19:16:02', '2013-06-17', '0', null, null, '60', '5', '6', '0', null);
INSERT INTO issues VALUES ('61', '2', '9', 'web还需开发的功能', '时间配置、参数配置、区域配置、远程维护\r\n\r\n', null, null, '1', null, '2', null, '19', '0', '2013-06-17 19:36:46', '2013-06-17 19:36:46', '2013-06-17', '0', null, null, '61', '1', '2', '0', null);
INSERT INTO issues VALUES ('62', '2', '19', 'multi files selection with IE browser', 'By default, it\'s not possible today to select several input video files in IE (when it\'s possible with FF and Chrome). \r\nSome web user interfaces on Internet (e.g. QQ web application) manage to select several input files. We must find the solution they use and use the same.\r\n ', '2013-07-05', null, '3', '3', '2', null, '10', '15', '2013-06-21 16:02:42', '2013-08-30 10:24:09', '2013-06-20', '100', null, null, '62', '33', '36', '0', null);
INSERT INTO issues VALUES ('63', '2', '19', 'File Manager', 'Functions:\r\n-> Upload File: User can select several files for upload at one time.\r\n-> Process: User can select several files witch is exist in the database with click checkbox, then process them.\r\n-> Download: download files, the user must have the authority.', '2013-07-05', null, '3', '3', '2', null, '3', '13', '2013-06-21 19:44:14', '2013-08-30 10:49:54', '2013-06-20', '100', null, '62', '62', '34', '35', '0', null);
INSERT INTO issues VALUES ('64', '2', '19', 'Immediate Processing last files', 'User select files and  click process, then can get the report.\r\n\r\nAfter user selected files, the programe will upload the file and process them automatically.\r\nAfter finished, user can get the report of the last processed tasks.', '2013-07-05', null, '3', '3', '2', null, '3', '15', '2013-06-21 19:49:24', '2013-08-30 10:50:37', '2013-06-14', '100', null, null, '64', '13', '16', '0', null);
INSERT INTO issues VALUES ('65', '2', '19', 'Task Manager', '-> Show the tasks\r\n-> User can select several tasks and get the report of the tasks.', '2013-06-28', null, '3', '18', '2', null, '3', '5', '2013-06-21 19:53:35', '2013-08-30 10:51:20', '2013-06-24', '100', null, null, '65', '11', '12', '0', null);
INSERT INTO issues VALUES ('66', '2', '14', '(Cloud Retrieval System) Vehicle Trajectory [GIS]', '-> input the License plate number and show the GIS route.', '2013-07-05', null, '3', '19', '2', null, '3', '7', '2013-06-21 20:01:26', '2013-08-19 11:12:03', '2013-07-05', '100', null, null, '66', '15', '16', '0', null);
INSERT INTO issues VALUES ('67', '2', '14', 'WatchFolder', '', '2013-06-28', null, '3', '19', '2', null, '3', '2', '2013-06-21 20:02:37', '2013-08-19 11:12:59', '2013-06-24', '100', null, null, '67', '5', '6', '0', null);
INSERT INTO issues VALUES ('68', '2', '19', 'Report & Statistics', '-> chart according to time\r\n-> detail ', '2013-07-09', null, '3', '19', '1', null, '3', '10', '2013-06-21 20:05:09', '2013-08-30 10:51:53', '2013-07-01', '100', null, null, '68', '21', '22', '0', null);
INSERT INTO issues VALUES ('69', '2', '19', 'System Parameter', '-> System default parameters.', '2013-07-05', null, '3', '18', '1', null, '3', '8', '2013-06-21 20:12:56', '2013-08-30 10:52:48', '2013-07-01', '100', null, null, '69', '17', '18', '0', null);
INSERT INTO issues VALUES ('73', '1', '12', 'Ftp username and password', 'We need the username and password of ftp://teleframe.cn to update pages.\r\n\r\nWe are connecting the service...', '2013-07-05', null, '5', '3', '2', null, '3', '3', '2013-06-24 15:04:46', '2013-07-09 16:09:19', '2013-07-01', '100', null, null, '73', '7', '8', '0', '2013-07-09 16:09:19');
INSERT INTO issues VALUES ('74', '3', '5', 'Prodcut description manual for Electronic Policeman', 'This is a document descripting how to operate in the engineer\'s interface.\r\nSee the file here: http://10.168.1.251:3000/documents/16 ', null, null, '1', null, '2', null, '5', '0', '2013-06-25 12:18:33', '2013-06-25 12:18:33', '2013-06-25', '100', null, null, '74', '1', '2', '0', null);
INSERT INTO issues VALUES ('76', '3', '5', 'PPT for the Electronic Policeman Product Release Meeting', 'New content is added to this one comparing with the PPT of last product release meeting, including the Personnel Structure, Analysis End Architecture, Algorithm Architecture, system improvement history and general condition about the test work. \r\nSee the file here；http://10.168.1.251:3000/documents/17 ', null, null, '1', null, '2', null, '5', '0', '2013-06-27 17:11:33', '2013-06-27 17:11:33', '2013-06-27', '100', null, null, '76', '1', '2', '0', null);
INSERT INTO issues VALUES ('77', '1', '3', '图片叠加，更改坐标后无法更新显示', '在电子警察1.0.1里，图片叠加配置功能里，\r\n先增加底图，\r\n显示了图片叠加效果\r\n修改了叠加选项的坐标，\r\n图片叠加效果不更新', '2013-06-28', null, '1', '23', '2', null, '23', '0', '2013-07-03 09:52:20', '2013-07-03 09:52:20', '2013-06-24', '100', '24', null, '77', '1', '2', '0', null);
INSERT INTO issues VALUES ('78', '3', '9', 'Deployement of WAR file on Tomcat ', 'Stop to use Eclipse for deploying the web application on the testing platform\r\n1) packaging it in a WAR file,\r\n2) deploying it in Tomcat with Tomcat manager or others ways.\r\n \r\n', '2013-07-09', null, '3', '3', '2', null, '10', '4', '2013-07-05 11:28:49', '2013-08-30 11:07:54', '2013-07-08', '100', null, null, '78', '9', '10', '0', null);
INSERT INTO issues VALUES ('79', '3', '9', 'Continuous Integration with Automated Build and Tests Execution', 'The final goal is to build, deploy and automaticaly run tests (unit tests and integration tests) on a reference test platform each time a new SVN commit is made by a member of the development project team.\r\n\r\n+Selection of tools to be integrated:+\r\n- Continuous Integration: \"*Jenkins*\":http://jenkins-ci.org/  \r\n- Build and Tests Automation: \"Apache *Maven*\":http://maven.apache.org/ for Java project \"Microsoft *MSBuild*\":http://msdn.microsoft.com/en-us/library/wea2sca5%28v=vs.90%29.aspx for VC++ project. \r\n- Versioning Control: \"Apache Subversion *SVN*\":http://subversion.apache.org/', null, null, '1', '3', '2', null, '10', '8', '2013-07-05 16:01:12', '2013-08-30 11:10:20', '2013-07-05', '0', null, null, '79', '17', '18', '0', null);
INSERT INTO issues VALUES ('80', '3', '5', 'Translation of the Cloud Retrieval System User Interface', 'Now the user interface of cloud retrieval system has been initially finished and I shall translate it for reference. ', '2013-07-10', null, '1', '5', '3', null, '5', '0', '2013-07-09 14:54:36', '2013-07-09 14:54:36', '2013-07-09', '0', null, null, '80', '1', '2', '0', null);
INSERT INTO issues VALUES ('81', '2', '9', 'External system configuration parameters', 'To enable the change some system configuration parameters without rebuilding, repackaging and deploying a new WAR file int Tomcat.  \r\nAddind an /etc directory in Tomcat at the same level as /webapps, /conf... and creating zzz.properties inside it.  \r\n\r\nList of parameters :\r\n- url of the database, login and pwd,\r\n- directory path where to store the data base backups,  \r\n- url of the Medianate SOAP API url, login and pwd,\r\n- the menu text titles (only Chinese for now, but we could add new languagues and switching capability in future),\r\n_- others ?..._\r\n', '2013-08-06', null, '3', '19', '2', null, '10', '8', '2013-07-11 11:46:04', '2013-08-30 11:10:51', '2013-07-11', '100', null, null, '81', '17', '18', '0', null);
INSERT INTO issues VALUES ('82', '1', '9', 'Clean sql script to build the database', '- Making (and updating when necessary) a clean *create_cloudretrievalsystem.sql* script to create the data base. Commit it to SVN. \r\nThe \'cloudretrieval\' data base on 10.168.1.160:3306 should have been created from this sql script. \r\n\r\n- Making (and updating when necessary) a clean *alter_cloudretrievalsystem.sql* script to keep the history of all changes made in the data base structure during the development. Commit it to SVN. The \'cloudretrieval\' data base on 10.168.1.160:3306 should be the last version of altered database.\r\n    \r\n', '2013-07-15', null, '3', '18', '4', null, '10', '6', '2013-07-11 18:18:49', '2013-08-30 11:12:02', '2013-07-11', '100', null, null, '82', '13', '14', '0', null);
INSERT INTO issues VALUES ('83', '3', '9', 'Two separate \'devt\' and \'prod\' environments', 'We must have 2 separate deployment servers: \r\n\r\n- *Developement* (devt) platform where all builds and WAR packages made either manually (today) or automatically (later) by Jenkins + Maven after SVN commits are deployed for being tested by development project members \r\n\r\n- *Production* (prod) platfom where all realeases (after testing on \'devt\' platform) should be deployed for +demonstrations+ and also some testing by any Teleframe colleagues.   \r\n\r\nThey must be *+clearly technically separate+*: no direct dependence or indirect dependence on some common sofware instances should appear. If the \'devt\' is broken, the \'prod\' should still work with no matter.  ', '2013-07-12', null, '3', '3', '5', null, '10', '8', '2013-07-12 11:47:19', '2013-08-30 11:12:21', '2013-07-12', '100', null, null, '83', '17', '18', '0', null);
INSERT INTO issues VALUES ('84', '3', '9', 'Keeping always clean SVN repository', 'Cleaning the SVN repository of Cloud Retrieval System project to satisfy the rule 1) below\r\n\r\nSVN is not a server for backuping binary files (such as class, lib, dll etc...) files. It is a version control system to control the version of the source code and so the follow up of the development for everybody. This means that 3 rules must be adopted:\r\n\r\n1) Only source code, minimum of environment (Eclipse, MS Visual ...) and required configuration parameters files should be committed with short comments about the changes or corrections that are committed (eg : a \'bug\' issue #23 is created in Redmine, then a correction is commited => the comment should be \"correction about the issue #23: crash of zzz function).\r\n\r\n2) SVN commits should be done only after merge and test with the last version available on SVN server => Frequent SVN updates are required. Consequence: at any time and SVN checkout should retrieve source code and project files ready to be compiled and run with no error.\r\n\r\n3) SVN commits should be processed very frequently to improve the quality of the follow up.\r\n\r\n\r\n\r\n        \r\n\r\n\r\n\r\n', '2013-07-12', null, '3', '3', '4', null, '10', '6', '2013-07-12 14:58:21', '2013-08-30 11:14:53', '2013-07-12', '100', null, null, '84', '13', '14', '0', null);
INSERT INTO issues VALUES ('85', '2', '19', 'Vehicle Trajectory [GIS] show image and video', 'Enable the user to show the picture and also to play the video by seeking at the right time stamp.\r\n\r\nLike that (ref. google maps with activated photos and video):\r\n!image.png! \r\n ', '2013-07-24', null, '3', '19', '2', null, '10', '5', '2013-07-12 16:54:55', '2013-08-30 11:13:33', '2013-07-22', '100', null, null, '85', '11', '12', '0', null);
INSERT INTO issues VALUES ('86', '1', '9', 'failure to upload large files', 'It is always failed to upload large files( about 100M or bigger), for example, the file 224.avi.\r\n', '2013-07-12', null, '3', '3', '2', null, '5', '3', '2013-07-12 17:54:03', '2013-07-16 09:50:10', '2013-07-11', '100', '8', null, '86', '7', '8', '0', null);
INSERT INTO issues VALUES ('87', '2', '19', 'GIS search, display the status + cancel action.', '- Status : the user needs to know what the system doing the system => a status has to be displayed (eg \'searching\', \'completed\').\r\n- Cancel : during \'searching\' status, the user should be bale to cancel.  ', '2013-07-23', null, '3', '19', '2', null, '10', '4', '2013-07-17 13:12:06', '2013-08-30 11:13:57', '2013-07-22', '100', null, null, '87', '9', '10', '0', null);
INSERT INTO issues VALUES ('88', '1', '19', 'seeking in windows media player when paused', 'When the player is paused, the player should display the right picture when the user seeks :\r\n- either by clicking on the extracted still picture, \r\n- or by clicking in the time line of the player.', null, null, '3', '19', '3', null, '10', '4', '2013-07-17 18:04:10', '2013-08-30 11:15:22', '2013-07-17', '100', null, null, '88', '9', '10', '0', null);
INSERT INTO issues VALUES ('89', '1', '19', 'report & statistics no line for non continuous phenomenon ', 'If the chart represents the number of vehicle that is measured by day, no line should be drawn as it doesn\'t make sense: this is a discrete measure here, and not a some measurement samples of a continuous phenomenon.', '2013-07-18', null, '3', null, '3', null, '10', '3', '2013-07-17 18:49:50', '2013-08-30 11:16:40', '2013-07-17', '100', '1', null, '89', '7', '8', '0', null);
INSERT INTO issues VALUES ('90', '2', '19', 'The curve chart is improper ', 'Mr. Frederic points out that the curve chart showing the Traffic flow statistics (by time) is improper and it should be changed to bar graph or something else. And Karl would like to assign this work to Yinglai.  \r\n', null, null, '3', '19', '4', null, '5', '3', '2013-07-18 10:28:49', '2013-08-30 11:18:34', '2013-07-18', '100', null, null, '90', '7', '8', '0', null);
INSERT INTO issues VALUES ('91', '1', '9', '(Cloud Retrieval System)-Uploading function is stopped when clicking other buttons ', 'I clicked other buttons when uploading a file in the file management page, for example, the \"vehicle GIS information \", and when I returned to the file management page, Ｉsaw nothing, I clicked \"query\", still I could\'t see the file I uploaded just few minutes ago. So I think the upload function is stopped when I click other buttons while uploading. ', null, null, '6', '3', '2', null, '5', '2', '2013-07-22 10:30:38', '2013-09-03 15:59:27', '2013-07-22', '100', null, null, '91', '5', '6', '0', '2013-07-22 13:26:04');
INSERT INTO issues VALUES ('92', '2', '19', ' auto-refresh function', 'Would it be better to add the \"automatically refresh\" button just like medianate? That will be more convenient for the user. \r\n\r\n', '2013-07-26', null, '3', '18', '2', null, '5', '3', '2013-07-22 11:26:43', '2013-08-30 11:19:24', '2013-07-26', '100', null, null, '92', '7', '8', '0', null);
INSERT INTO issues VALUES ('93', '2', '19', 'clean the project code.', 'The database table cleaned.\r\nNext step:\r\n->Clean the columns of the database table.\r\n->Clean the code to make the project minimal.\r\n->Test CloudRetrieval to make sure everything be OK.', '2013-07-25', null, '3', '18', '2', null, '3', '3', '2013-07-22 14:28:43', '2013-08-30 11:20:14', '2013-07-22', '100', null, null, '93', '7', '8', '0', null);
INSERT INTO issues VALUES ('94', '1', '9', 'status of tasks', 'The status of tasks is not always correct. For the failed task, the status is still \"processing\".', '2013-07-26', null, '2', '3', '2', null, '5', '6', '2013-07-22 14:55:33', '2013-09-03 16:01:27', '2013-07-22', '60', null, null, '94', '13', '14', '0', null);
INSERT INTO issues VALUES ('98', '2', '14', 'New function-Make web app internationalization.', 'Using the *.properties to change interface language.\r\n\r\nh3. 1. create the properties and create all the key and it\'s values:\r\n<pre>\r\nlanguage_en_US.properties\r\nlanguage_zh_CN.properties\r\n</pre>\r\n\r\nh3. 2. modefy *Action.java\r\nadd the follow code \r\n<pre>\r\nrequest.setAttribute(\"language\", bform.language);\r\n</pre>\r\nafter \r\n<pre>\r\nif (bform==null)  return mapping.findForward(\"failure\");\r\n</pre>\r\n\r\nh3. 3.modefy all the jsp page\r\nreplaceAll the label with bean:message.key, su as:\r\n<pre>\r\n<bean:message key=\"filemgr.title\" bundle=\"${requestScope.language}\"/>\r\n</pre>\r\n\r\nh3. 4. Change the menu language \r\nBecause the menu are get from database, so need another way to change the menu language.\r\n', '2013-08-16', null, '3', '3', '3', null, '3', '19', '2013-07-23 18:47:20', '2013-08-30 11:26:02', '2013-07-23', '100', null, null, '98', '37', '38', '0', null);
INSERT INTO issues VALUES ('103', '2', '20', 'new function-Case Management', 'The main functions include the establishment of a case, case checking, correcting, filtering(fuzzy query), and deleting. The case information includes : case name, case type, case serial No., receipt No., establisher, department, case time, status, zone and location. The reference is the product from Sobey.', '2013-08-09', null, '3', '19', '3', null, '5', '9', '2013-07-31 15:14:45', '2013-08-30 11:32:23', '2013-07-31', '100', null, null, '103', '19', '20', '0', null);
INSERT INTO issues VALUES ('104', '2', '20', 'new function-video distribution', 'This function should support:\r\n-Distribute correspondent videos which were uploaded in the \"File Management\" part to one specific case.\r\n-Videos watching function: The system should support to the playing of video( not relatd to plate recognition, simple playing function. So that the user could watch, eg. the process of a traffic accident. \r\n\r\n视频分发：将与案件有关的视频分发到具体案件，并且可以浏览此视频\r\n\r\n-分发到某个案件：在“文件管理”处将上传的某些视频分发到某个案件\r\n-视频浏览功能：系统需要支持离线视频的播放，也就是说上传视频，不进行车牌分析，观看案件视频。此种情况适用于 案件发生在摄像头监控范围之内。\r\n', '2013-08-09', null, '3', '18', '3', null, '5', '4', '2013-07-31 15:29:06', '2013-08-30 11:35:05', '2013-08-02', '100', null, null, '104', '9', '10', '0', null);
INSERT INTO issues VALUES ('105', '2', '20', 'new function-labeling and retrivel of suspicious vehicle', 'This function should support:\r\n\r\n-Labeling of suspicious vehicle. pagepath:\" Case Management\"\" Vehicle Inforamtion Management\", label the suspicious vechile by adding some description of the vehicle. In this part the user could also check the correspondent videos fastly.\r\n-Retrivel of syspicious vehicle. The user could retrivel according to the content entered. There is the dropdown menu to select \" 1. Some sort of suspicious, 2. suspicious\", 3. very suspicious. \r\n\r\n嫌疑车辆标注-在“案件管理(英来做）-车辆信息管理（信息查看，英来做）”某辆车的具体信息处标注嫌疑车辆，该车辆信息管理报表支持快速切入某一辆车的相关视频的功能。\r\n嫌疑车辆检索-支持根据标注内容进行检索，有下拉菜单可以选择嫌疑车辆嫌疑程度。\r\n', '2013-08-01', null, '3', '18', '3', null, '5', '5', '2013-07-31 15:42:33', '2013-08-30 11:34:24', '2013-07-31', '100', null, null, '105', '11', '12', '0', null);
INSERT INTO issues VALUES ('106', '2', '9', 'Circle the specific area in the map', 'Circle the specific area in the map and retriel it, in \"case management\"-\"vechile information management\", click \"retrivel by area\", could circle the specific area in the map and retrivel the vehicles and also make fuzzy query.\r\n\r\n在地图上检索出区域内的车	在\"案件管理“-“车辆信息管理”处点击“区域检索”出现地图，在地图上圈定指定区域，可检索出区域内的路口，可模糊查询具有某些特征的车\r\n', null, null, '1', null, '1', null, '5', '1', '2013-07-31 15:51:26', '2013-08-16 16:25:24', '2013-08-12', '0', null, null, '106', '3', '4', '0', null);
INSERT INTO issues VALUES ('107', '2', '9', 'new function-Image Enhancement', '\"Case Management\"-\"Vehicle information management\", click one piece of inforamtion of a car, and the related picture and video could be showned, here a new button of \"Image Enhancement\" should be added.\r\n\r\n在“案件管理-车辆信息管理”点击某辆车信息，会弹出该车的图片和视频信息，此处有“图像质量增强”按钮可以处理模糊图像\r\n', '2013-08-16', null, '3', '3', '3', null, '5', '6', '2013-07-31 15:54:45', '2013-08-30 11:29:33', '2013-08-12', '100', null, null, '107', '13', '14', '0', null);
INSERT INTO issues VALUES ('108', '2', '9', 'new function-Touch screen and voice entering', 'Realize touch screen and voice entering. \r\n实现触摸屏和语音输入\r\n', '2013-09-06', null, '1', '3', '1', null, '5', '1', '2013-07-31 15:59:35', '2013-08-30 11:27:53', '2013-08-19', '0', null, null, '108', '3', '4', '0', null);
INSERT INTO issues VALUES ('109', '2', '20', 'new function-labeling the suspicious vehicle in the video', 'In the case management, when watching a video of the case, the user could label and make comment of one suspicious vehicle for the video so that when the user watches it, the user will know which is the suspicious vehicle and when he clicks the reports of the suspicious vehicle, it will jump to the related video.\r\n\r\n在案件管理处，当观看某个案件的某段视频时，可以标记某个嫌疑车辆，并可以写描述，这样用户在观看此视频时，会知道哪辆车是嫌疑车，当他点击那些标注时，可以跳到相应视频帧。   ', '2013-08-21', null, '3', '19', '2', null, '5', '5', '2013-08-16 16:34:13', '2013-08-30 11:32:56', '2013-08-16', '100', null, null, '109', '11', '12', '0', null);
INSERT INTO issues VALUES ('112', '2', '13', '(ITS)Image Enhancement', 'Description\r\n\r\nIllegal treatment - illegal information audit - illegal information review, click one piece of inforamtion of a car, and the related picture and video could be showned, here a new button of \"Image Enhancement\" should be added.\r\n\r\n在“违法处理-违法信息审核-违法信息复审”点击某辆车信息，会弹出该车的图片和视频信息，此处有“图像质量增强”按钮可以处理模糊图像\r\n', '2013-08-22', null, '3', '18', '3', null, '3', '7', '2013-08-19 12:27:46', '2013-09-03 16:17:52', '2013-08-19', '100', null, null, '112', '15', '16', '0', null);
INSERT INTO issues VALUES ('113', '1', '9', '(Cloud Retrieval System)-problems of video playing and download in \"File Management\"', 'Click the \"video playing\" button in the file management, the video can\'t be played normally. And click the \"Download\" button, there is a bug. Pls see the attached picture for reference. \r\n\r\n文件管理处的视频播放 不能正常播放视频.点击“下载”，出现bug.请参考附件中的图片。', '2013-08-27', null, '3', '3', '2', null, '5', '3', '2013-08-19 14:41:26', '2013-08-27 18:40:03', '2013-08-27', '100', null, null, '113', '7', '8', '0', null);
INSERT INTO issues VALUES ('114', '2', '9', 'CaptchaCode', 'add CaptchaCode at login page.', '2013-08-21', null, '3', '3', '3', null, '3', '5', '2013-08-21 15:49:09', '2013-08-30 09:57:49', '2013-08-21', '100', '5', null, '114', '11', '12', '0', null);
INSERT INTO issues VALUES ('116', '1', '9', 'No picture does not show red x', '\r\nSystem :\r\nCloudretireval\r\nITS\r\n\r\nall pages.', '2013-08-23', null, '3', '18', '2', null, '3', '2', '2013-08-22 09:46:53', '2013-08-23 17:43:24', '2013-08-22', '100', null, null, '116', '5', '6', '0', null);
INSERT INTO issues VALUES ('117', '2', '13', '(ITS) Video Play Wall Page ReWrite', '', null, null, '3', '19', '2', null, '3', '5', '2013-08-22 09:50:12', '2013-08-29 09:20:30', '2013-08-22', '100', null, null, '117', '11', '12', '0', null);
INSERT INTO issues VALUES ('118', '2', '20', 'File Manager ReWrite', 'ReWrite\r\nAdd progress bar', '2013-09-03', null, '3', '3', '2', null, '3', '6', '2013-08-22 09:55:46', '2013-09-03 15:54:14', '2013-08-28', '100', null, null, '118', '13', '14', '0', null);
INSERT INTO issues VALUES ('119', '2', '9', 'Check & Rename &  Reorder  Menu', 'Lijian(Karl) & Wangren(Helen)\r\n\r\n', '2013-08-27', null, '2', null, '2', null, '3', '5', '2013-08-22 09:57:50', '2013-09-16 15:46:57', '2013-08-22', '100', null, null, '119', '11', '12', '0', null);
INSERT INTO issues VALUES ('120', '2', '9', 'The Left Menu Rewrite', '\r\nSystem:\r\nCloudretrieval\r\nITS', '2013-08-26', null, '3', '19', '2', null, '3', '6', '2013-08-22 10:00:41', '2013-08-26 16:16:02', '2013-08-22', '100', null, null, '120', '13', '14', '0', null);
INSERT INTO issues VALUES ('121', '2', '9', 'Login Page Rewrite', 'Change the background and rewrite this page.', '2013-08-26', null, '3', '3', '2', null, '3', '4', '2013-08-22 10:01:42', '2013-08-26 16:15:14', '2013-08-22', '100', null, null, '121', '9', '10', '0', null);
INSERT INTO issues VALUES ('122', '2', '9', '3D & Satellite Maps', '3D & Satellite Maps for gis.\r\n\r\nGIS地图可以切换为地图、3D和卫星地图', '2013-08-30', null, '3', '18', '2', null, '3', '4', '2013-08-29 10:16:03', '2013-08-30 17:52:30', '2013-08-29', '100', null, null, '122', '9', '10', '0', null);
INSERT INTO issues VALUES ('123', '2', '13', 'Thumbnail display', 'Thumbnail display\r\n\r\n视频监控--显示分析\r\n实时车辆信息修改成缩略图显示\r\n!20130829105310.png!', '2013-09-03', null, '3', '19', '2', null, '3', '7', '2013-08-29 10:59:39', '2013-09-03 15:13:35', '2013-08-29', '100', null, null, '123', '15', '16', '0', null);
INSERT INTO issues VALUES ('124', '2', '9', 'User Profile Photo', 'User Profile Photo\r\nUsers can modify their \'Profile Photo\'. When a new user created,the user\'s profile photo should as a default photo.\r\n\r\n用户个人头像\r\n\r\n\r\nSystem:\r\nCloudretrieval\r\nITS\r\n\r\n!photo20130903212349.jpg!\r\n\r\nDefault photo:\r\n!touxiangIcon.gif!\r\n\r\n', '2013-09-06', null, '3', '18', '2', null, '3', '4', '2013-09-03 21:27:17', '2013-09-09 17:51:41', '2013-09-03', '100', null, null, '124', '9', '10', '0', null);
INSERT INTO issues VALUES ('125', '2', '13', 'Image Enhancement', '1. 写成一个公共的图像增强功能，其他页面如\"违法处理-违法信息审核-违法信息复审\",如需对图像进行图像增强处理，只需要将该图片的完整URL传送到图像增强系统进行处理，完成后将最终的图像URL返回\r\n2. (ITS)违法处理-违法信息审核-违法信息复审 页面修改成调用公共图像增强插件\r\n\r\n图像增强详述:\r\n参考ITS的违法处理-违法信息审核-违法信息复审[修改]中的图像增加，在现有的基础上进行增加参数，如设定的某些阈值(利用滑动条Slider实现)，当后天进行处理时，处理按钮禁用并友好提示用户正在处理\r\n\r\n要点：\r\n通过URL将图片下载到本地，然后进行处理，处理完成后以URL形式进行返回\r\n', '2013-09-12', null, '3', '19', '2', null, '3', '7', '2013-09-05 12:04:45', '2013-09-12 13:56:04', '2013-09-05', '100', null, null, '125', '15', '16', '0', null);
INSERT INTO issues VALUES ('126', '2', '3', 'Integrate  Lingyun camera.', 'Familiar with electronic police platform\r\nConnect Lingyun camera.\r\n\r\n熟悉电子警察平台，接入凌云相机.', '2013-10-05', null, '2', '3', '2', null, '3', '4', '2013-09-05 12:33:53', '2013-09-12 15:19:32', '2013-09-05', '60', null, null, '126', '9', '10', '0', null);
INSERT INTO issues VALUES ('127', '2', '21', '视频监控--显示分析', '视频监控--显示分析\r\n显示实时分析的数据信息', '2013-09-18', null, '3', '19', '2', null, '3', '2', '2013-09-16 10:36:06', '2013-09-17 15:42:08', '2013-09-16', '100', null, null, '127', '5', '6', '0', null);
INSERT INTO issues VALUES ('128', '2', '2', 'Thumbnail extraction - current analyzed frame - (frame offset) ', 'Adding the possibility in the source code of Medianate plugin wrapper to request Medianate to extract as thumbnail not the current analyzed frame but a previous one.\r\n\r\nExplanation: Analysis algorithms (e.g. plate recognition) need few consecutive frames analysis to be sure to have recognized an object. The extracted thumbnail should correspond to the 1st of these frames and not the last one for which the analysis result is return with good level of confidence. This last one is too late ant the object (e.g. vehicle with its plate) can be just out of the frame.         ', null, null, '1', '10', '2', null, '10', '0', '2013-11-11 12:01:00', '2013-11-11 12:01:00', '2013-11-11', '0', null, null, '128', '1', '2', '0', null);
INSERT INTO issues VALUES ('129', '2', '2', 'Thumbnail extraction - current analyzed frame - (frame offset) ', 'Adding the possibility in the source code of Medianate plugin wrapper to request Medianate to extract as thumbnail not the current analyzed frame but a previous one.\r\n\r\nExplanation: Analysis algorithms (e.g. plate recognition) need few consecutive frames analysis to be sure to have recognized an object. The extracted thumbnail should correspond to the 1st of these frames and not the last one for which the analysis result is return with good level of confidence. This last one is too late ant the object (e.g. vehicle with its plate) can be just out of the frame.         ', null, null, '1', '10', '2', null, '10', '0', '2013-11-11 12:08:12', '2013-11-11 12:08:12', '2013-11-11', '0', null, null, '129', '1', '2', '0', null);

-- ----------------------------
-- Table structure for `issue_categories`
-- ----------------------------
DROP TABLE IF EXISTS `issue_categories`;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of issue_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `issue_relations`
-- ----------------------------
DROP TABLE IF EXISTS `issue_relations`;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of issue_relations
-- ----------------------------

-- ----------------------------
-- Table structure for `issue_statuses`
-- ----------------------------
DROP TABLE IF EXISTS `issue_statuses`;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`),
  KEY `index_issue_statuses_on_is_default` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of issue_statuses
-- ----------------------------
INSERT INTO issue_statuses VALUES ('1', 'New', '0', '1', '1', null);
INSERT INTO issue_statuses VALUES ('2', 'In Progress', '0', '0', '2', null);
INSERT INTO issue_statuses VALUES ('3', 'Resolved', '0', '0', '3', null);
INSERT INTO issue_statuses VALUES ('4', 'Feedback', '0', '0', '4', null);
INSERT INTO issue_statuses VALUES ('5', 'Closed', '1', '0', '5', null);
INSERT INTO issue_statuses VALUES ('6', 'Rejected', '1', '0', '6', null);

-- ----------------------------
-- Table structure for `journals`
-- ----------------------------
DROP TABLE IF EXISTS `journals`;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journals
-- ----------------------------
INSERT INTO journals VALUES ('1', '9', 'Issue', '10', 'Original document is here: http://10.168.1.251:3000/documents/2 ', '2013-04-26 18:36:52', '0');
INSERT INTO journals VALUES ('2', '11', 'Issue', '10', '', '2013-04-26 21:37:24', '0');
INSERT INTO journals VALUES ('3', '17', 'Issue', '3', '公司的宣传彩页还没完成，邵岩还在做，暂时把公司网站的修改推迟', '2013-04-27 11:11:59', '0');
INSERT INTO journals VALUES ('4', '10', 'Issue', '3', '新建watch folder，添加文件后，视频没有被自动处理，只有在重新开启watchfolder.exe才会进行处理', '2013-04-27 11:53:42', '0');
INSERT INTO journals VALUES ('5', '11', 'Issue', '5', 'The translated version:http://10.168.1.251:3000/documents/4', '2013-04-27 15:17:10', '0');
INSERT INTO journals VALUES ('6', '27', 'Issue', '3', 'Database and functions short Design.', '2013-04-27 16:46:22', '0');
INSERT INTO journals VALUES ('7', '27', 'Issue', '3', 'WEB of Medianate Updated!', '2013-04-27 18:18:38', '0');
INSERT INTO journals VALUES ('8', '9', 'Issue', '5', 'The catalogue translation version is here: http://10.168.1.251:3000/documents/2 \r\nThough reading the content, I think the proper name for this document should be Project Construction Scheme for \"Safe Lijiang\".', '2013-04-28 11:04:57', '0');
INSERT INTO journals VALUES ('9', '20', 'Issue', '5', 'English version: http://10.168.1.251:3000/documents/7 \r\nThe form may need to revise and correct such as the capital and small letter. It is uploaded here today so that you may read it in the holiday.', '2013-04-28 15:54:19', '0');
INSERT INTO journals VALUES ('10', '27', 'Issue', '3', '', '2013-04-28 19:29:33', '0');
INSERT INTO journals VALUES ('11', '19', 'Issue', '10', 'Jianbo, \r\nI don\'t understand this issue because Medianate supports linux file path. Could you please precise an example ?', '2013-04-28 21:24:28', '0');
INSERT INTO journals VALUES ('12', '27', 'Issue', '10', '@Karl,\r\nAbout \'Database Medianate.vsd\': Do you really think you need \'t_m_tasks\' and \'t_m_report\' ? All \"tasks\" and \"reports\" information are already stored inside the Medianate database and you can get all of them through the Medianate web services API.   ', '2013-04-28 21:48:41', '0');
INSERT INTO journals VALUES ('13', '22', 'Issue', '3', '', '2013-05-01 13:45:30', '0');
INSERT INTO journals VALUES ('14', '27', 'Issue', '3', ' @ Frederic Bouilhaguet\r\nYes,I think I need \'t_m_tasks\' and \'t_m_report\' for the web system running more stable .', '2013-05-01 13:52:14', '0');
INSERT INTO journals VALUES ('15', '11', 'Issue', '5', 'The PPT which has been corrected by Doctor Liu is here: http://10.168.1.251:3000/documents/4 ', '2013-05-02 09:33:40', '0');
INSERT INTO journals VALUES ('16', '33', 'Issue', '3', 'Test', '2013-05-06 12:27:32', '0');
INSERT INTO journals VALUES ('17', '33', 'Issue', '5', 'There are two documents related to the correction of the Chinese translation of the user interface: one is bilingual and the other is Chinese only. The bilingual one is for re-examination in the future. \r\n\r\nSome lines are still not settled, we need to discuss with Frederic for better understanding the expression.', '2013-05-07 12:26:33', '0');
INSERT INTO journals VALUES ('18', '37', 'Issue', '3', '', '2013-05-07 18:49:03', '0');
INSERT INTO journals VALUES ('19', '37', 'Issue', '3', '', '2013-05-08 10:00:42', '0');
INSERT INTO journals VALUES ('20', '27', 'Issue', '19', 'web最初计划功能列表', '2013-05-09 09:15:42', '0');
INSERT INTO journals VALUES ('21', '27', 'Issue', '19', '电子警察需求分析-web综合管理平台（初步）', '2013-05-09 09:22:24', '0');
INSERT INTO journals VALUES ('22', '27', 'Issue', '3', '', '2013-05-09 11:21:58', '0');
INSERT INTO journals VALUES ('23', '37', 'Issue', '3', '', '2013-05-09 11:22:23', '0');
INSERT INTO journals VALUES ('24', '28', 'Issue', '10', '@Karl, could you please (re)precise here the Java frameworks and related technologies with which you plan to develop this web user interface ? Thank you. \r\n', '2013-05-09 12:03:09', '0');
INSERT INTO journals VALUES ('25', '28', 'Issue', '3', '', '2013-05-09 15:26:49', '0');
INSERT INTO journals VALUES ('26', '34', 'Issue', '3', '是google浏览器的flash player插件问题，只要将google chrome 的flash player禁用，然后去adobe官网下载google chrome的flash player插件即可解决播放问题', '2013-05-09 16:38:47', '0');
INSERT INTO journals VALUES ('27', '38', 'Issue', '5', 'The translation of the user interface is here: http://teleframe.xicp.net:3000/documents/11\r\nIt need further supplement since this system is not complete at present. ', '2013-05-13 19:19:42', '0');
INSERT INTO journals VALUES ('28', '36', 'Issue', '3', '算法配置检测区域设置工具完成', '2013-05-17 01:18:56', '0');
INSERT INTO journals VALUES ('29', '36', 'Issue', '3', '【2013.5.18】\r\n1.增加了图片和显示Rect之间的坐标转换\r\n2.修正了在画区域时的逻辑Bug', '2013-05-18 13:44:51', '0');
INSERT INTO journals VALUES ('30', '36', 'Issue', '3', '', '2013-05-20 10:27:46', '0');
INSERT INTO journals VALUES ('31', '33', 'Issue', '5', 'http://10.168.1.251:3000/documents/9', '2013-05-21 16:58:45', '0');
INSERT INTO journals VALUES ('32', '33', 'Issue', '5', 'http://10.168.1.251:3000/documents/9 ', '2013-05-21 17:00:15', '0');
INSERT INTO journals VALUES ('33', '33', 'Issue', '5', 'See the files here: http://10.168.1.251:3000/documents/9 \r\n\r\nThe latest version is the version 3.', '2013-05-22 10:05:18', '0');
INSERT INTO journals VALUES ('34', '41', 'Issue', '5', 'Before going to Datang, Doctor Liu made further correction of the PPT. So I have delete the original one and upload the final version presented on May 23 and its translation here: http://10.168.1.251:3000/documents/14  ', '2013-05-24 14:28:54', '0');
INSERT INTO journals VALUES ('35', '36', 'Issue', '3', '1. 修正了一个操作逻辑bug，当删除车道ID非最大的一个车道后，车道的ID会出现不对号的问题\r\n2. 现在支持选择某个车道/停止线后，会用不同的颜色来标记', '2013-05-25 23:21:31', '0');
INSERT INTO journals VALUES ('36', '44', 'Issue', '3', '“信号灯ID”的范围应该是 1 ~ “信号灯组数”吧？\r\n', '2013-05-28 10:03:54', '0');
INSERT INTO journals VALUES ('37', '36', 'Issue', '3', '', '2013-05-28 10:16:37', '0');
INSERT INTO journals VALUES ('38', '47', 'Issue', '13', '', '2013-05-28 10:20:26', '0');
INSERT INTO journals VALUES ('39', '36', 'Issue', '3', '', '2013-05-28 10:21:04', '0');
INSERT INTO journals VALUES ('40', '36', 'Issue', '3', ' 1.修改“信号灯ID”范围为(1 2 3 4)', '2013-05-28 10:41:50', '0');
INSERT INTO journals VALUES ('41', '44', 'Issue', '3', '已完成，获取代码点\"此处\":http://10.168.1.251:3000/attachments/download/104/ITSconfigToolK%20v1.9.zip', '2013-05-28 10:43:18', '0');
INSERT INTO journals VALUES ('42', '44', 'Issue', '3', '', '2013-05-28 10:49:38', '0');
INSERT INTO journals VALUES ('43', '46', 'Issue', '6', '', '2013-05-28 14:40:59', '0');
INSERT INTO journals VALUES ('44', '38', 'Issue', '5', 'The latest version is here: http://10.168.1.251:3000/documents/11\r\n\r\nSince the engineers complete more development work on the User interface of ITS& Cloud system, I have made supplement for the original file. But some parts are still lack of content since they have not finished it completely.', '2013-06-07 17:54:42', '0');
INSERT INTO journals VALUES ('46', '49', 'Issue', '10', 'Frederic Bouilhaguet wrote:\r\n1) about all video files that are here : \r\n /Video/解码测试录像资料/大华_Dahua\r\n /Video/解码测试录像资料/天工开视_Tiangongkaishi\r\n /Video/解码测试录像资料/海康_Haikang\r\nWho produced them ? Were they made directly from cameras (or a software) ? \r\n1 \"read me\" text file should be put inside each folder to say it. \r\n  \r\n2) 2560x1920 and 2464x2048 : asking Mr Liu if we need a so high image definition for plate recognition ? or is it only a need of ITS analysis ?\r\n \r\n3) \\\\10.168.1.160\\HOME_admin\\wf_platerecognition\\processed_input_files\\bayonetdemo.avi : who produced this file ? how was it made ? why is the defintion equal to 1280x720 (and not 2560x1920 and 2464x2048)\r\n\r\n', '2013-06-09 13:40:44', '0');
INSERT INTO journals VALUES ('47', '50', 'Issue', '6', '', '2013-06-09 15:21:44', '0');
INSERT INTO journals VALUES ('49', '42', 'Issue', '5', '', '2013-06-13 13:14:49', '0');
INSERT INTO journals VALUES ('51', '58', 'Issue', '10', '', '2013-06-14 18:57:43', '0');
INSERT INTO journals VALUES ('52', '60', 'Issue', '10', 'related to http://10.168.1.251:3000/issues/37\r\n\r\n+List of features:+\r\n- Diagram of traffic flow,\r\n- Recording video functions,\r\n- Sending alarms and input event type, \r\n- Selection of input cameras to turn it on/off\r\n- Input the reason of a removing any vehicle items from the black/white/etc list\r\n\r\nTO DO : to complete the list and validate it with all concerned people.\r\n', '2013-06-17 19:10:47', '0');
INSERT INTO journals VALUES ('53', '60', 'Issue', '10', '', '2013-06-17 19:16:02', '0');
INSERT INTO journals VALUES ('54', '56', 'Issue', '10', '', '2013-06-21 16:05:04', '0');
INSERT INTO journals VALUES ('55', '58', 'Issue', '10', '', '2013-06-21 16:07:06', '0');
INSERT INTO journals VALUES ('56', '71', 'Issue', '3', '', '2013-06-24 15:05:41', '0');
INSERT INTO journals VALUES ('57', '63', 'Issue', '3', 'I found a flash plugin named \"SWFUpload\":http://baike.baidu.com/view/1332553.htm\r\nI\'m learning...\r\n\r\nh2. MoreInfomation:\r\n\"SWFUpload\":http://demo.swfupload.org/v220/index.htm\r\n\"SWFUpload v2.2.0.1 Documentation\":http://demo.swfupload.org/Documentation/', '2013-06-25 09:53:24', '0');
INSERT INTO journals VALUES ('58', '59', 'Issue', '19', '', '2013-06-26 10:30:55', '0');
INSERT INTO journals VALUES ('59', '63', 'Issue', '3', '\"File upload\" were Finished.\r\n\r\nHere a \"demo\":http://10.168.1.250:8888/fileUpload I wrote of SWFUpload.', '2013-06-26 10:38:36', '0');
INSERT INTO journals VALUES ('60', '73', 'Issue', '3', 'ftp://teleframe.cn/\r\n\r\nToday I got the userName and password.\r\n\r\n\r\n主机域名：teleframe.cn                                                                   \r\n管理员账号：hmw143040      \r\n管理员密码：********                                                                        \r\nIP地址：112.127.183.40\r\n', '2013-06-26 10:47:08', '0');
INSERT INTO journals VALUES ('61', '63', 'Issue', '3', 'File Manager Finished.', '2013-06-27 10:37:53', '0');
INSERT INTO journals VALUES ('62', '63', 'Issue', '3', '', '2013-06-27 10:39:11', '0');
INSERT INTO journals VALUES ('63', '62', 'Issue', '3', '', '2013-06-27 10:41:26', '0');
INSERT INTO journals VALUES ('64', '64', 'Issue', '3', '', '2013-06-27 10:42:29', '0');
INSERT INTO journals VALUES ('65', '56', 'Issue', '19', '', '2013-06-27 11:17:55', '0');
INSERT INTO journals VALUES ('66', '56', 'Issue', '19', '', '2013-06-27 11:18:51', '0');
INSERT INTO journals VALUES ('67', '58', 'Issue', '19', '', '2013-06-27 11:20:31', '0');
INSERT INTO journals VALUES ('68', '65', 'Issue', '18', '', '2013-06-28 17:37:36', '0');
INSERT INTO journals VALUES ('69', '67', 'Issue', '19', '', '2013-06-28 18:42:34', '0');
INSERT INTO journals VALUES ('70', '64', 'Issue', '10', 'Here it is an example of how to use TaskSearchCriteria to get last tasks created by a watchfolder : ShowLastTaskByWatchedFolderTest.java.', '2013-07-01 20:46:30', '0');
INSERT INTO journals VALUES ('71', '64', 'Issue', '3', '', '2013-07-02 10:03:37', '0');
INSERT INTO journals VALUES ('72', '64', 'Issue', '10', 'Date minCreationDate = ft.parse(\"2013-06-01 06:00:00\"); \r\nDate maxCreationDate = ft.parse(\"2013-07-01 18:00:00\");\r\n=> Of course you can replace the \"2013-07-01 18:00:00\" value (that was just an example) by the \'now\' value and \"2013-06-01 06:00:00\" by the (\'now\' - (1 + 5%)x(T2-T1)) value. With T1 = (time of the 1st upload) and T2 = (time of the last upload end), as we discussed yesterday morning.\r\n@Karl, can you validate in this issue that this is exactly what you need ? So that I can be sure to have understood the point.   ', '2013-07-02 10:19:09', '0');
INSERT INTO journals VALUES ('73', '64', 'Issue', '3', 'Yes, this is what I need. Thank you.', '2013-07-02 10:27:13', '0');
INSERT INTO journals VALUES ('74', '65', 'Issue', '3', '', '2013-07-02 10:30:30', '0');
INSERT INTO journals VALUES ('75', '58', 'Issue', '10', 'Reference : \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki', '2013-07-02 11:59:10', '0');
INSERT INTO journals VALUES ('76', '64', 'Issue', '10', 'Is this issue here related to the \"Getting and monitoring tasks created by watch folder\":http://teleframe.xicp.net:3000/issues/58 one ?', '2013-07-02 12:16:15', '0');
INSERT INTO journals VALUES ('77', '58', 'Issue', '10', '', '2013-07-02 12:23:04', '0');
INSERT INTO journals VALUES ('78', '58', 'Issue', '10', '', '2013-07-02 12:34:54', '0');
INSERT INTO journals VALUES ('79', '58', 'Issue', '10', '', '2013-07-02 13:06:51', '0');
INSERT INTO journals VALUES ('80', '19', 'Issue', '10', '@Karl,\r\nAs I did not get any feedback from Jianbo, could tell me the point here ? Please, just give me an example of linux file path that show the problem ? Then, is critical for \'Cloud Retrieval System\' ? ', '2013-07-02 13:31:33', '0');
INSERT INTO journals VALUES ('81', '19', 'Issue', '3', 'Sorry, I don\'t know.', '2013-07-02 13:55:52', '0');
INSERT INTO journals VALUES ('82', '52', 'Issue', '10', '@Helen,\r\nI can not reproduce the problem. Can you recheck that the problem still exists ? If yes, can you provide an actions list to reproduce it ?', '2013-07-02 14:54:19', '0');
INSERT INTO journals VALUES ('83', '51', 'Issue', '10', '@Helen,\r\n- Is the \"Http streaming setting\" translation to \"HTTP流设置\" correct ?\r\n- Can you check last version http://10.168.1.160:8080/Flexv1.11.9.1/Medianate.html to validate that this issue is \'resolved\' now ? If yes, please change the progression to the 100% value and set the status to \'resolved\'. ', '2013-07-02 16:35:01', '0');
INSERT INTO journals VALUES ('84', '64', 'Issue', '3', '', '2013-07-03 09:25:46', '0');
INSERT INTO journals VALUES ('85', '52', 'Issue', '5', 'Yes, it still exists. To find this bug, we must repeat our actions. The bug is not always there, but you could find it by just repeating several times.\r\n \r\nTime         Action                                    Status         \r\n9:25        select Watch folder ID=1, click\"disable\"     True\r\n9:25        select Watch folder ID=1, click\"disable\"     false\r\n9:25         select Watch folder ID=1, click\"enable\"     false \r\n9:25        select Watch folder ID=1, click\"enable\"      True\r\n9:25        select Watch folder ID=1, click\"disable\"     false\r\n9:25        select Watch folder ID=1, click\"ensable\"     True\r\n9:26        select Watch folder ID=1, click\"disable\"     false\r\n9:26        select Watch folder ID=1, click\"enable\"     false\r\n9:26        select Watch folder ID=1, click\"enable\"     True\r\n9:26        select Watch folder ID=1, click\"disable\"     True\r\n9:26        select Watch folder ID=1, click\"disable\"     false\r\n9:26        select Watch folder ID=1, click\"enable\"      false \r\n9:27        select Watch folder ID=1, click\"enable\"      True\r\n......\r\nSame situation also in other folders\r\n\r\nAnd I found another problem, the following is an example:\r\nAction                                                        \r\nselect Watch folder ID=1, click\"disable\" , status is still true\r\nSelect watch folder ID=10 (the initial status is true, click \"disable\", the status of folder ID=10 is still true, but the status of watch folder ID=1 changes to \"false\".\r\n', '2013-07-03 09:41:36', '0');
INSERT INTO journals VALUES ('86', '69', 'Issue', '18', '', '2013-07-03 13:02:04', '0');
INSERT INTO journals VALUES ('87', '66', 'Issue', '10', 'Is this issue specific to Cloud Retrieval System ? If yes please add \"(Cloud Retrieval System)\" in the subject title. Please, set also a \"due date\" and also the \"estimated time\" (= the number of hours you think you need to resolve the issue).\r\nAlso, could you describe on the wiki in few precise lines how you plan to implement the \'vehicle trajectory\' : Baidu map API ? which functions do you plan to use ?. Please describe actions sequences that the user will specifically do to get \'vehicle trajectory\' (step 1 : ...., step 2 : ... etc.).         ', '2013-07-03 13:15:43', '0');
INSERT INTO journals VALUES ('88', '63', 'Issue', '3', '', '2013-07-03 13:21:29', '0');
INSERT INTO journals VALUES ('89', '64', 'Issue', '3', '', '2013-07-03 13:22:14', '0');
INSERT INTO journals VALUES ('90', '65', 'Issue', '3', '', '2013-07-03 13:30:11', '0');
INSERT INTO journals VALUES ('91', '58', 'Issue', '10', '', '2013-07-03 13:37:51', '0');
INSERT INTO journals VALUES ('92', '56', 'Issue', '10', '', '2013-07-03 13:39:59', '0');
INSERT INTO journals VALUES ('93', '62', 'Issue', '10', '', '2013-07-03 13:41:17', '0');
INSERT INTO journals VALUES ('94', '63', 'Issue', '3', 'h1. Functions:\r\n\r\n-> Upload File: User can select several files for upload at one time.User need set the absolute time and location.\r\n\r\n-> Process: User can select several files(witch are exist in the database) with click checkbox, then process/reprocess them.\r\n   Some people only have the authority to upload file and some manager can process them.\r\n   Reason for reprocess:The algorithm updated, reprocess all the videos\r\n\r\n-> Modefy: Every video have a physical name and remark which is described with human language(such as Chinese),\r\n   so user can find the files that they want quickly.\r\n   \r\n-> Download: download files, the user must have the authority.', '2013-07-03 14:08:03', '0');
INSERT INTO journals VALUES ('95', '64', 'Issue', '3', '@\r\n<pre>\r\nFrederic Bouilhaguet wrote:\r\n> Is this issue here related to the \"Getting and monitoring tasks created by watch folder\":http://teleframe.xicp.net:3000/issues/58 one ?\r\n</pre>\r\n\r\nToday it is.\r\nThe original plan is management the watch folder attribute and upload files(do not care the process and report).\r\nBut it is changed today.', '2013-07-03 14:12:30', '0');
INSERT INTO journals VALUES ('96', '69', 'Issue', '3', '', '2013-07-03 14:13:02', '0');
INSERT INTO journals VALUES ('97', '68', 'Issue', '3', '', '2013-07-03 14:13:40', '0');
INSERT INTO journals VALUES ('98', '66', 'Issue', '3', '', '2013-07-03 14:14:23', '0');
INSERT INTO journals VALUES ('99', '68', 'Issue', '3', '\r\n-> Set time & location to get the detail of report including \"License Plate\",\"Absolute Time\",\"Location\",\"Picture\"\r\n\r\n-> Chart analysis ', '2013-07-03 14:38:48', '0');
INSERT INTO journals VALUES ('100', '68', 'Issue', '3', '', '2013-07-03 14:39:39', '0');
INSERT INTO journals VALUES ('101', '33', 'Issue', '5', 'see the final version here:\r\nhttp://teleframe.xicp.net:3000/documents/9\r\n\r\nIn the final version, I have corrected two words, the original ones are right but the corrected ones are better.\r\n\r\nThey are the following:\r\ntask.show.producedFiles=生成文件 the original translation is “产生文件”          \r\nPARC_reportId_label = 报告ID   the original translation is “报告的ID”               ', '2013-07-03 15:37:58', '0');
INSERT INTO journals VALUES ('102', '33', 'Issue', '5', '', '2013-07-03 16:34:10', '0');
INSERT INTO journals VALUES ('103', '33', 'Issue', '5', 'see the final version here:\r\nhttp://teleframe.xicp.net:3000/documents/9\r\n\r\nIn the final version, I have corrected four words.\r\n\r\nThey are the following:\r\ntask.show.producedFiles=生成文件 the original translation is “产生文件”\r\nPARC_reportId_label = 报告ID the original translation is “报告的ID”\r\nVP_thumbnails_byDefault_label = 视频片段（默认抽取）\r\ntask.view.sourcesDiffusionsUrlsLabel=源文件 Urls', '2013-07-03 16:39:14', '0');
INSERT INTO journals VALUES ('104', '63', 'Issue', '3', '', '2013-07-04 11:17:55', '0');
INSERT INTO journals VALUES ('105', '66', 'Issue', '10', '*Please take 15 minutes* (no more) to describe on the wiki in few lines how you started to implement the \'vehicle trajectory\': with Baidu map API ? which functions ? Provide actions sequences that the user will do to retrieve \'vehicle trajectory\' (step 1 : ...., step 2 : ... etc.)', '2013-07-04 14:14:39', '0');
INSERT INTO journals VALUES ('106', '63', 'Issue', '10', 'next step to develop Process & Download', '2013-07-04 15:51:41', '0');
INSERT INTO journals VALUES ('107', '69', 'Issue', '10', '', '2013-07-04 15:53:06', '0');
INSERT INTO journals VALUES ('108', '66', 'Issue', '10', '', '2013-07-04 15:53:58', '0');
INSERT INTO journals VALUES ('109', '62', 'Issue', '10', '', '2013-07-04 15:58:08', '0');
INSERT INTO journals VALUES ('110', '64', 'Issue', '10', '', '2013-07-04 16:07:06', '0');
INSERT INTO journals VALUES ('111', '58', 'Issue', '10', '', '2013-07-04 16:09:13', '0');
INSERT INTO journals VALUES ('112', '58', 'Issue', '19', 'user could get the report created by his own watched folder(plate number,time,location,picture,video...)\r\nalso could upload videos to his own watched folder\r\n', '2013-07-04 18:42:29', '0');
INSERT INTO journals VALUES ('113', '63', 'Issue', '3', 'Save code and tomorrow will go on at download and process ', '2013-07-04 18:48:24', '0');
INSERT INTO journals VALUES ('114', '66', 'Issue', '19', '1.input plate number\r\n2.input start time and end time \r\n3.click serch button\r\n4.get the longitude and latitude and time from the database\r\n5.use baiduMap API to draw line on the map\r\n', '2013-07-04 18:57:11', '0');
INSERT INTO journals VALUES ('115', '69', 'Issue', '18', 'main parameters\r\n\r\ndefaultAuthName = admin\r\ndefaultAuthPwd  = resonate\r\ndefaultSoapUrl  =http://10.168.1.160:8080/api/services/soap/\r\ndefaultTaskpriority  =4\r\nuploadurl      =http://10.168.1.160:8080\r\nuploadflash    =fileUpload/swfupload/swfupload.swf\r\nuploadServer   =fileUpload/upload.jsp\r\nuploadroot     =D:/prod/_schlitterdevMediaRoot/HOME_admin\r\ndefaultuploadpath  =admin\r\nwork           =1', '2013-07-04 18:57:24', '0');
INSERT INTO journals VALUES ('116', '58', 'Issue', '10', 'Could the user get \"on-the-fly\" the report for a task (i.e. before it is finished) ? You have to request periodiacally Medianate to refresh the report content when the task is progressing from 0% to 100%.    ', '2013-07-04 19:59:54', '0');
INSERT INTO journals VALUES ('117', '69', 'Issue', '10', 'Is uploadurl = http://10.168.1.160:8080/api/upload for example ? What are uploadroot and defaultuploadpath used for ?  ', '2013-07-04 20:03:43', '0');
INSERT INTO journals VALUES ('118', '2', 'Issue', '10', 'Development work is still on going. The current target is for the release of \'Cloud Retrieval System\' on the 12th of July.  ', '2013-07-04 21:43:23', '0');
INSERT INTO journals VALUES ('119', '51', 'Issue', '10', 'About, the version \"v1.11.9.1\":http://10.168.1.251:3000/news/4 of Medianate user interface, Helen wrote in http://10.168.1.251:3000/issues/33#note-8 :\r\n- task.show.producedFiles=生成文件 the original translation is “产生文件”\r\n- PARC_reportId_label = 报告ID the original translation is “报告的ID”\r\n- VP_thumbnails_byDefault_label = 视频片段（默认抽取）\r\n- task.view.sourcesDiffusionsUrlsLabel=源文件 Urls\r\n\r\nCorrection for these is 4 points is on going now. \r\n', '2013-07-04 21:54:13', '0');
INSERT INTO journals VALUES ('120', '66', 'Issue', '19', '', '2013-07-05 10:02:42', '0');
INSERT INTO journals VALUES ('121', '69', 'Issue', '18', 'main parameters\r\n\r\ndefaultAuthName = admin\r\ndefaultAuthPwd  = resonate\r\ndefaultSoapUrl  =http://10.168.1.160:8080/api/services/soap/\r\ndefaultTaskpriority  =4\r\nuploadurl      =http://10.168.1.160:8080\r\nuploadflash    =fileUpload/swfupload/swfupload.swf\r\nuploadServer   =fileUpload/upload.jsp\r\nuploadroot     =D:/prod/_schlitterdevMediaRoot/HOME_admin\r\ndefaultuploadpath  =admin\r\nwork           =1', '2013-07-05 10:45:37', '0');
INSERT INTO journals VALUES ('122', '78', 'Issue', '10', '', '2013-07-05 11:30:44', '0');
INSERT INTO journals VALUES ('123', '4', 'Issue', '10', 'Tested on the +version 1.11.9.1+ of the flex web user interface. \r\n\r\n!screenshot.png!', '2013-07-05 17:11:10', '0');
INSERT INTO journals VALUES ('124', '68', 'Issue', '19', '', '2013-07-08 10:24:29', '0');
INSERT INTO journals VALUES ('125', '49', 'Issue', '10', 'Reference *224.avi* file that we used for the testiong the integragation of LPR algorithm in Medianate has a resolution of *1920x1080*.', '2013-07-08 10:36:56', '0');
INSERT INTO journals VALUES ('126', '68', 'Issue', '10', 'dear Yinglai, Karl,\r\nCould you please list all statistics report chart types we want to implement and display by priority ?\r\nFor example : \r\n1) _The Measurement of the \"Recognized\" Traffic Flow by Camera In Time_ = By camera position, this is the variation of vehicle numbers that we recognized the plate value from versus time.\r\n2) etc ...\r\n', '2013-07-08 11:15:29', '0');
INSERT INTO journals VALUES ('127', '78', 'Issue', '10', 'We should be able to know how to package as soon as possible with Maven by the \"mvn package\" command. ', '2013-07-08 13:36:03', '0');
INSERT INTO journals VALUES ('128', '49', 'Issue', '5', '1. Mr. Gong agreed that \"read me\" should be put inside the folder.\r\n2. 500W camera(camera with 5 million resolution) could cover three lanes and 200W camera could cover only two lanes. Since 500W and 200W camera are the cameras people commonly used, the conresponent resolutions are 1920*1080(200W Camera), 2464*2048(500W Camera) and 2560*1920(500W camera), so the requirement to support a high definition is not only for ITS, but also for plate recognition. \r\n3. \\\\10.168.1.160\\HOME_admin\\wf_platerecognition\\processed_input_files\\bayonetdemo.avi : This video is sent to Mr. Haifeng by other people and Haifeng don\'t know who produces this video. Nevertheless, it doesn\'t matter since we could figure out the camera producing it is a 100W camera from 1280*720. It is not 2560x1920 and 2464x2048 because it is produced by a 100w camera and not a 500W camera. But nowadays not much people use 100W camera ( you could see from the video it is taken in 2009), most people use 200W and 500W cameras. \r\n4.I figure out Reference 224.avi is taken by a 200W camera.\r\n5. The test video in the Ftp \"解码测试录像资料（video sample for decoding test)-\"Dahua\", \"Tiangong Kaishi\" and \"Haikang\" are produced by Mr. Gong and Mr. Wenjun. The date is usually the video name. Tiangong Kaishi is just a camera manufacture and it is not our partner nor supplier. The Tiangong Kaishi camera used by Mr. Gong is a camera he has used before in his former work and he borrowed it from his previous company.\r\n6. I would upload more video samples in the \"video sample for decding test\". However, most of the video samples are for Electronic Policeman system and i don\'t know whether it is fit for plate recognition in Medianate. Mr. Wenjun said yes and he added if there are some cars missing, i.e. the system doesn\'t recognize the plate of the car and the car is leaked, it is the problem of the algorithm and Mr. Haifeng should improve the algorithm then.', '2013-07-08 15:31:01', '0');
INSERT INTO journals VALUES ('129', '63', 'Issue', '3', 'Finished the function \"modify file\" (\"File Manager\")\r\n\r\nAdd video time length when user select several file to set absTime of ervery video.', '2013-07-08 15:57:27', '0');
INSERT INTO journals VALUES ('130', '69', 'Issue', '18', '', '2013-07-08 15:59:18', '0');
INSERT INTO journals VALUES ('131', '68', 'Issue', '3', '1) Set time period & location to get the detail of report including \"License Plate\",\"Absolute Time\",\"Location\",\"Picture\".\r\n2) Select a location & set the time period to get the Plotting（x-axis: time,day, y-axis: flows）\r\n3) Select a location to get the Histogram (x: subLocation name, y:flows)', '2013-07-08 16:41:30', '0');
INSERT INTO journals VALUES ('132', '49', 'Issue', '10', 'width  height 	    pixels	\r\n1280	 720	   921 600   	100W\r\n1920	1080	 2 073 600   	200W\r\n2560	1920	 4 915 200   	500W \r\n2464	2048	 5 046 272      500W \r\n\r\n*+Made from Dahua:+*\r\n- 224.avi (made with DAVtoAVI Dahua converter): 1920x1080 (200W) Mpeg4ASP 25fps.\r\n- \"2013-4-11  15.16.3.avi\" (made with an DAVtoAVI converter different from the one provide by Dahua): 1280x720 (100W) h264Main 25fps.  \r\n- Dahua .dav files: 1280x720 (100W) h264Main 15fps.\r\n\r\n1) FPS: 15fps have been set by Mr Gong on Dahua camera to produce DAV files. 25fps have been set by Haifeng (with DAVtoAVI Dahua converter) and Wenjun (with an other DAVtoAVI converter. So, what should be the 1st value to test ?\r\n\r\n2) Duration: *We need* first short duration video (5 min max). \"2013-4-11  15.16.3.avi\" lasts 24 min.\r\n\r\n3) DAV format: *We need* vehicle traffic video reference sample (5 min max) equivalent to what 224.avi is.\r\nThe ones available on the ftp are only video of the corridor. We need vehicle traffic video. \r\n\r\n4) What is the reference DAVtoAVI converter tool ? Dahua or not ? And Mpeg4ASP or h264Main in the AVI file ?   \r\n\r\n*+Made from Haikang:+*\r\n- 20130427_195657.mp4: 2560x1920 (500W) h264High 25fps (?)\r\n- 10.168.1.143_01_201305212009462_4.mp4: 2560x1920 (500W) h264High ? fps\r\nBoth files are in the evening and too long (14 min  and 21 min).\r\n\r\n5) *We need* at least one vehicle traffic video reference sample (5 min max) equivalent to what 224.avi is.\r\n\r\n*+Made from Tiangongkaishi:+*\r\n- 天工开视500w_sony芯片_1.avi: tiangongkaishi 2464x2048 (500W) h264High 9fps \r\n- 天工开视500w_sony芯片_2.avi: tiangongkaishi 2464x2048 (500W) h264High 9fps\r\nBoth files are video of static building (2 min).\r\n\r\n6) *We need* at least one vehicle traffic video reference sample (5 min max) equivalent to what 224.avi is.\r\n\r\n       \r\n\r\n\r\n\r\n\r\n', '2013-07-08 16:50:06', '0');
INSERT INTO journals VALUES ('133', '68', 'Issue', '19', '', '2013-07-08 18:04:23', '0');
INSERT INTO journals VALUES ('134', '68', 'Issue', '19', '', '2013-07-09 10:34:11', '0');
INSERT INTO journals VALUES ('135', '62', 'Issue', '3', '', '2013-07-09 11:00:55', '0');
INSERT INTO journals VALUES ('136', '64', 'Issue', '3', '', '2013-07-09 11:03:56', '0');
INSERT INTO journals VALUES ('137', '78', 'Issue', '3', 'ITS & CloudRetrieval & Dev_monitor packaged and deployed in tomcat.\r\n\r\nBut there\'s a new problem: when backup database, we got failure. But if I copy the command and paste to the cmd.exe, then got success.Maybe because the authority of writting file.', '2013-07-09 15:43:21', '0');
INSERT INTO journals VALUES ('138', '73', 'Issue', '3', 'Updated by Yan.Shao(邵岩).\r\n\r\nAdded our productions.\r\n\r\n[http://www.teleframe.cn/]', '2013-07-09 16:08:26', '0');
INSERT INTO journals VALUES ('139', '73', 'Issue', '3', '', '2013-07-09 16:09:19', '0');
INSERT INTO journals VALUES ('140', '79', 'Issue', '3', 'I got how to package a project.\r\n\r\nBut the Teleframe Web Application is not a maven project.', '2013-07-09 17:32:46', '0');
INSERT INTO journals VALUES ('141', '79', 'Issue', '10', '', '2013-07-09 17:51:55', '0');
INSERT INTO journals VALUES ('142', '79', 'Issue', '10', 'Solution = Convert Eclipse project to Maven project. The M2Eclipse (m2e) plugin is done for this purpose.\r\n!m2e_eclipse_plugin.png!', '2013-07-09 18:13:09', '0');
INSERT INTO journals VALUES ('143', '79', 'Issue', '10', '', '2013-07-09 18:14:37', '0');
INSERT INTO journals VALUES ('144', '79', 'Issue', '10', '', '2013-07-09 18:17:25', '0');
INSERT INTO journals VALUES ('145', '49', 'Issue', '10', '+Conclusion:+\r\nMr Gong will provide next Monday 3 video files of the same vehicle traffic content made with \r\n- Dahua: DAV file with ?x? (300W) h264Main,\r\n  => to be converted also by a reference DAVtoAVI converter.   \r\n- Haikang: MP4 file with 2560x1920 (500W) h264High.\r\n- Tiangongkaishi: AVI file with 2464x2048 (500W) h264High.\r\n\r\nThis is to test not only the decoding of Medianate, but also all the processing capabilities.   ', '2013-07-09 18:36:23', '0');
INSERT INTO journals VALUES ('146', '82', 'Issue', '10', '', '2013-07-11 18:22:16', '0');
INSERT INTO journals VALUES ('147', '82', 'Issue', '3', '', '2013-07-11 19:03:39', '0');
INSERT INTO journals VALUES ('148', '81', 'Issue', '3', '', '2013-07-11 19:04:09', '0');
INSERT INTO journals VALUES ('149', '83', 'Issue', '10', 'The best solution is to have 2 separate machines with installation of Java runtime environment, Tomcat and MySQL. \r\n\r\nIf we can not, an intermediate solution is \r\n- to install on the same machine 2 separate instances of Tomcat (listening 2 different ports) with one reserved for the \'prod\' and the orther for \'devt\',\r\n- to have 2 data bases (one for \'prod\', one for \'devt\') on same MySQL. We can also install 2 separate MySQL.\r\n(this requires the db url configuration is out of the WAR file => \"issue #81\":http://10.168.1.251:3000/issues/81) ', '2013-07-12 12:08:16', '0');
INSERT INTO journals VALUES ('150', '83', 'Issue', '10', 'We need the \'prod\' environment today to deploy the release of the 12th of July so that we can demonstrate it from next Monday with no interference on the devt works. ', '2013-07-12 12:12:19', '0');
INSERT INTO journals VALUES ('151', '83', 'Issue', '10', '', '2013-07-12 12:13:09', '0');
INSERT INTO journals VALUES ('152', '83', 'Issue', '10', '', '2013-07-12 14:07:20', '0');
INSERT INTO journals VALUES ('153', '83', 'Issue', '10', 'Finally, it will be on 2 separate machines: \r\n- PROD 10.168.1.252 (Windows Server 2008 R2)\r\n- DEVT 10.168.1.250 (Windows Server 2008 R2)', '2013-07-12 14:14:57', '0');
INSERT INTO journals VALUES ('154', '83', 'Issue', '3', 'Steps:\r\n1. Get a PC.(T)\r\n2. Format the disk and divided be two partion.(T)\r\n3. Install Operation Windows Server 2008 R2.(T)\r\n4. Install Environment: Jdk, Tomcat, MySql, Ftp, Oray.(T)\r\n5. Open the Port 80 & 8080 & 3306 & 180 & 5466.(T)\r\n6. Install English Language Pack.(T)\r\n7. Run window backup server to backup the Environment.(T)\r\n8. Deploy the Production \"Cloud Retieval\" and \"ITS\".(T)\r\n\r\nT: Finished.\r\nF: Not Yet Finished.', '2013-07-12 15:23:24', '0');
INSERT INTO journals VALUES ('155', '83', 'Issue', '3', '', '2013-07-12 16:14:19', '0');
INSERT INTO journals VALUES ('156', '84', 'Issue', '3', '1. The classes has been deleted.\r\n2. Only commit source code, how about *.jar ?', '2013-07-12 16:22:48', '0');
INSERT INTO journals VALUES ('157', '85', 'Issue', '10', '', '2013-07-12 16:55:39', '0');
INSERT INTO journals VALUES ('158', '50', 'Issue', '10', '- Test made with Haikang = OK: http://10.168.1.160:8080/api/services/rest/tasks/589/edl\r\n- Test made with Dahua converter output = OK: http://10.168.1.160:8080/api/services/rest/tasks/590/edl ', '2013-07-12 17:28:31', '0');
INSERT INTO journals VALUES ('159', '49', 'Issue', '10', 'For now :\r\n- Test made with Haikang = OK: http://10.168.1.160:8080/api/services/rest/tasks/589/edl\r\n- Test made with Dahua converter output = OK: http://10.168.1.160:8080/api/services/rest/tasks/590/edl \r\nto be continued (next week).', '2013-07-12 17:29:11', '0');
INSERT INTO journals VALUES ('160', '81', 'Issue', '19', 'Today I was studying the first item:  url of the database, login and pwd, however, I met a problem. \r\nThe problem is our database is configured inside struts-config.xml, and struts-config.xml can\'t read other configuration files, such as zzz.properties.', '2013-07-12 18:06:54', '0');
INSERT INTO journals VALUES ('161', '86', 'Issue', '3', 'Updated the file upload war. \r\n\r\nToday I tested a big traffic video(1.96GB), uploaded success.', '2013-07-12 19:04:52', '0');
INSERT INTO journals VALUES ('162', '86', 'Issue', '10', 'What is this video(1.96GB) file ? Is it \'admin/{0_0_20130712175045494}.avi\' of \"task 597\":http://10.168.1.160:8080/api/services/rest/tasks/597/edl ? ', '2013-07-15 11:12:13', '0');
INSERT INTO journals VALUES ('163', '84', 'Issue', '3', '1. The classes has been deleted.\r\n2. Only commit source code, how about *.jar ?', '2013-07-15 11:35:22', '0');
INSERT INTO journals VALUES ('164', '84', 'Issue', '10', '1) *without Maven* : all jar files have to be in svn (unfortunately !).\r\n\r\n2) *with Maven* : all common jar files from all common frameworks are downloaded from the \"Maven central repository\":http://search.maven.org at the first execution of Maven command and they are cached in local machine (i.e. the local Maven repository). So only Medianate client jar files should be in SVN.\r\nPlease have a look on \"Why not Store JARs in CVS?\":http://maven.apache.org/guides/introduction/introduction-to-repositories.html#Why_not_Store_JARs_in_CVS to be convinced.', '2013-07-15 13:54:30', '0');
INSERT INTO journals VALUES ('165', '82', 'Issue', '3', 'please check svn : https://10.168.1.250/svn/TeleframeWeb/TeleframeMonitor/database\r\n\r\n\"alter_cloudretrievalsystem.sql\":https://10.168.1.250/svn/TeleframeWeb/TeleframeMonitor/database/alter_cloudretrievalsystem.sql\r\n\"create_cloudretrievalsystem.sql\":https://10.168.1.250/svn/TeleframeWeb/TeleframeMonitor/database/create_cloudretrievalsystem.sql', '2013-07-15 18:50:58', '0');
INSERT INTO journals VALUES ('166', '81', 'Issue', '10', 'Please, check how to use PropertyPlaceholderConfigurer class in Spring framework to read properties from external files.\r\n\r\n_## Specify the location of the properties file location:_\r\n<context:property-placeholder location=\"classpath:myfile1.properties, \r\n                                        classpath:myfile2.properties\"/>\r\n\r\n\r\n_## in myfile1.properties for example you set a property value:_\r\nmedianate.soap.ws.base.url=\"http://10.168.1.160:8080/api/services/soap/\"\r\n\r\n_## then you reuse the value to set a parameter in Java source code:_\r\npublic class myClass {\r\n\r\n @Value(\"${medianate.soap.ws.base.url}\")\r\n private String soapWsBaseUrl;\r\n\r\n public void myMethod() {\r\n  ...\r\n  service = new TaskEndpointImpl(soapWsBaseUrl + \"TaskEndpointService\");\r\n  ...\r\n }\r\n\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2013-07-15 20:04:58', '0');
INSERT INTO journals VALUES ('167', '81', 'Issue', '10', 'Some examples:\r\n- http://static.springsource.org/spring-framework/docs/3.2.0.RELEASE/spring-framework-reference/html/beans.html#beans-factory-placeholderconfigurer\r\n- http://www.javacodegeeks.com/2013/01/spring-property-placeholder-configurer-a-few-not-so-obvious-options.html', '2013-07-15 20:09:55', '0');
INSERT INTO journals VALUES ('168', '86', 'Issue', '3', 'Yes, all right.', '2013-07-16 09:50:10', '0');
INSERT INTO journals VALUES ('169', '81', 'Issue', '10', 'Then, to read all your properties files from an *etc* sub directory, add the *etc* location to be searched by the \"common\" classloader inside */conf/catalina.properties* :\r\n<pre>\r\ncommon.loader=${catalina.base}/lib,${catalina.base}/lib/*.jar,${catalina.home}/lib,${catalina.home}/lib/*.jar,${catalina.base}/etc\r\n</pre>\r\n\r\nTomcat 6.0\r\n /bin\r\n /conf \r\n */etc*\r\n /webapps\r\n /lib\r\n /logs \r\n\r\n', '2013-07-16 10:49:12', '0');
INSERT INTO journals VALUES ('170', '79', 'Issue', '10', 'For *Integrations Tests* on the user interface in IE : use \"Selenium WebDriver\":http://docs.seleniumhq.org/\r\n_\"Driving a browser natively as a user would either locally or on a remote machine using the Selenium Server it marks a leap forward in terms of browser automation.\"_ ', '2013-07-16 13:09:14', '0');
INSERT INTO journals VALUES ('171', '82', 'Issue', '10', 'about *create_cloudretrievalsystem.sql*:\r\n- No CREATE DATABASE command. So it will not create any database.\r\n  => one more time : the script should be executed \"as is\" to create and intialize the data base.\r\n- Many columns (e.g. t_u_person.csrq, t_u_person.gzsj etc...) should be removed to make a clean data base. ', '2013-07-16 15:30:51', '0');
INSERT INTO journals VALUES ('172', '56', 'Issue', '10', '', '2013-07-16 16:06:22', '0');
INSERT INTO journals VALUES ('173', '56', 'Issue', '10', 'How are the Windows Media player width and height of the player set ?\r\n!screenshot.png!', '2013-07-16 16:08:07', '0');
INSERT INTO journals VALUES ('174', '56', 'Issue', '19', 'The Windows Media player width and height are set by the size of Dialog Box. And the size of Dialog Box is set by me. ', '2013-07-16 16:18:48', '0');
INSERT INTO journals VALUES ('175', '84', 'Issue', '3', 'I got it. It is the next step with maven.', '2013-07-16 16:31:18', '0');
INSERT INTO journals VALUES ('176', '84', 'Issue', '3', 'Cleaned the jars.', '2013-07-16 16:57:39', '0');
INSERT INTO journals VALUES ('177', '62', 'Issue', '10', 'Multi inputs of several values of date & time and location should be possible. One date & time + location by video file.  ', '2013-07-16 18:40:57', '0');
INSERT INTO journals VALUES ('178', '49', 'Issue', '10', 'We should ask for video files samples that enable us to demonstrate the Cloud Retrieval System functionnality to upload and analyze N continuous video files coming from the same camera. \r\nAsk Mr Xin or Mr Gong: Which cameras can do it by setting the max duration of evry files (eg 5 minutes) : Dahua, Haikang, Tiangongkaish ?  \r\n    ', '2013-07-17 11:03:15', '0');
INSERT INTO journals VALUES ('179', '88', 'Issue', '10', '', '2013-07-17 18:05:23', '0');
INSERT INTO journals VALUES ('180', '89', 'Issue', '10', '', '2013-07-17 18:54:37', '0');
INSERT INTO journals VALUES ('181', '82', 'Issue', '3', 'Updated the sql script\r\n\r\nadd\r\n<pre>\r\nCREATE DATABASE IF NOT EXISTS cloudretrieval DEFAULT CHARACTER SET GBK;\r\n\r\nuse cloudretrieval;\r\n</pre>\r\n', '2013-07-18 09:58:43', '0');
INSERT INTO journals VALUES ('182', '88', 'Issue', '5', 'There is a problem when playing the video of this step report\"*京BK*826  2013-07-13 12：10：30.0 清河中街E“* . It is finished within a few seconds.\r\n\r\nAnd there is a common problem for all video playing: when the whole video is over， the user couldn\'t replay it by clicking the correspondent picture. The user has to click the \"play\" button in the video.', '2013-07-18 10:15:48', '0');
INSERT INTO journals VALUES ('183', '90', 'Issue', '19', 'change line chart to bar chart', '2013-07-18 10:37:46', '0');
INSERT INTO journals VALUES ('184', '90', 'Issue', '10', '', '2013-07-18 10:58:15', '0');
INSERT INTO journals VALUES ('185', '88', 'Issue', '19', '', '2013-07-18 11:12:30', '0');
INSERT INTO journals VALUES ('186', '89', 'Issue', '3', '', '2013-07-19 09:44:24', '0');
INSERT INTO journals VALUES ('187', '85', 'Issue', '3', '', '2013-07-22 12:43:39', '0');
INSERT INTO journals VALUES ('188', '87', 'Issue', '3', '', '2013-07-22 12:45:06', '0');
INSERT INTO journals VALUES ('189', '91', 'Issue', '3', 'That because when you click other buttons, this page will be destoryed.', '2013-07-22 13:26:04', '0');
INSERT INTO journals VALUES ('190', '85', 'Issue', '19', 'there is a problem if use the picture mark every point on the map. because when the points are dense the pictures will be overlapping each other', '2013-07-22 13:56:54', '0');
INSERT INTO journals VALUES ('191', '87', 'Issue', '19', '', '2013-07-22 14:43:25', '0');
INSERT INTO journals VALUES ('192', '87', 'Issue', '19', '', '2013-07-22 14:44:08', '0');
INSERT INTO journals VALUES ('193', '93', 'Issue', '18', '', '2013-07-23 09:54:59', '0');
INSERT INTO journals VALUES ('194', '94', 'Issue', '3', '', '2013-07-23 12:07:19', '0');
INSERT INTO journals VALUES ('195', '85', 'Issue', '19', 'user can switch the picture and video by click the link in the opened window\r\n\r\n!QQ截图20130723133200.png!\r\n!QQ截图20130723133232.png!', '2013-07-23 13:52:09', '0');
INSERT INTO journals VALUES ('196', '98', 'Issue', '3', '', '2013-07-23 18:51:23', '0');
INSERT INTO journals VALUES ('197', '98', 'Issue', '3', 'The basic step:\r\nh3. 1. Config Servlet\r\nadd the servlet into web.xml\r\n<pre>\r\n<servlet-mapping>\r\n	<servlet-name>jsp</servlet-name>\r\n	<url-pattern>*.js</url-pattern>  \r\n</servlet-mapping>\r\n</pre> \r\nThen we can use jsp/java in js file.\r\n\r\n2. Add code to js file\r\nadd the follow code to every js file.\r\n<pre>\r\n<%@ page language=\"java\" contentType=\"text/html;charset=GBK\" %>\r\n<%@ page isELIgnored=\"false\" %>\r\n<%@ taglib uri=\"/WEB-INF/struts-html.tld\" prefix=\"html\"%>\r\n<%@ taglib uri=\"/WEB-INF/struts-tiles.tld\" prefix=\"tiles\"%>\r\n<%@ taglib uri=\"/WEB-INF/struts-bean.tld\" prefix=\"bean\"%> \r\n<%@ taglib uri=\"/WEB-INF/struts-logic.tld\" prefix=\"logic\"%>\r\n<%@ page import=\"java.util.*\"%>\r\n<%@ page import=\"modules.base.*\"%>\r\n<%\r\n	baseForm bform=(baseForm)(request.getSession()).getAttribute(\"baseuser\");\r\n	String language = bform.language;\r\n	System.out.println(language);\r\n%>\r\n</pre>\r\n\r\n3. Modefy messages;\r\nReplace all the messages with bean:message, like:\r\n<pre>\r\n<bean:message key=\"filemgr.title\" bundle=\"<%=language%>\"/>\r\nor\r\n<bean:message key=\"filemgr.title\"  bundle=\"${language}\" />  // without code \"String language = bform.language;\", with code\"<%@ page isELIgnored=\"false\" %>\"\r\n</pre>\r\nThe error message :\r\n<pre>\r\nalert(\"<bean:message key=\"data.error.dataEmputy\" bundle=\"<%=language%>\"/>\");\r\n</pre>\r\nThe exceptionHandler we need find another way to show later.', '2013-07-24 11:07:10', '0');
INSERT INTO journals VALUES ('198', '98', 'Issue', '3', 'All the properties file encoding must be UTF-8\r\nAfter edit the Chinese properties file \"language_zh_CN_bak.properties\", convert this file\'s content to unicode \r\n<pre>\r\nnative2ascii -encoding gb2312 language_zh_CN_bak.properties  language_zh_CN.properties\r\n</pre>', '2013-07-24 11:50:29', '0');
INSERT INTO journals VALUES ('199', '98', 'Issue', '3', 'Build the basic information for internationalization.\r\nCompleted one page \"fileMgr\" as a demo or model(including *Action.java, *.jsp, *.js).\r\n!QQ20130724152602.jpg!', '2013-07-24 15:29:14', '0');
INSERT INTO journals VALUES ('200', '98', 'Issue', '3', '', '2013-07-24 15:30:44', '0');
INSERT INTO journals VALUES ('201', '98', 'Issue', '3', '', '2013-07-24 15:31:41', '0');
INSERT INTO journals VALUES ('202', '98', 'Issue', '3', 'Next step :　Follow up demo \"File Manager\".', '2013-07-24 15:32:40', '0');
INSERT INTO journals VALUES ('203', '98', 'Issue', '3', '', '2013-07-24 15:33:00', '0');
INSERT INTO journals VALUES ('204', '94', 'Issue', '3', '', '2013-07-24 17:26:07', '0');
INSERT INTO journals VALUES ('205', '94', 'Issue', '3', 'SVN: https://10.168.1.250/svn/TeleframeWeb/cloudretrieval', '2013-07-24 17:39:59', '0');
INSERT INTO journals VALUES ('206', '92', 'Issue', '3', '', '2013-07-25 20:33:52', '0');
INSERT INTO journals VALUES ('207', '92', 'Issue', '18', '', '2013-07-26 14:16:16', '0');
INSERT INTO journals VALUES ('208', '98', 'Issue', '3', '', '2013-07-31 11:12:40', '0');
INSERT INTO journals VALUES ('209', '98', 'Issue', '5', '', '2013-07-31 15:44:15', '0');
INSERT INTO journals VALUES ('210', '103', 'Issue', '19', '', '2013-08-01 10:42:31', '0');
INSERT INTO journals VALUES ('211', '105', 'Issue', '18', '', '2013-08-01 10:45:03', '0');
INSERT INTO journals VALUES ('212', '105', 'Issue', '18', '', '2013-08-01 17:51:15', '0');
INSERT INTO journals VALUES ('213', '103', 'Issue', '19', '', '2013-08-01 18:08:06', '0');
INSERT INTO journals VALUES ('214', '98', 'Issue', '3', '', '2013-08-02 10:18:23', '0');
INSERT INTO journals VALUES ('215', '98', 'Issue', '3', 'Finish \"person management\"', '2013-08-02 14:29:55', '0');
INSERT INTO journals VALUES ('216', '103', 'Issue', '19', '', '2013-08-02 18:06:48', '0');
INSERT INTO journals VALUES ('217', '104', 'Issue', '18', '', '2013-08-02 18:07:37', '0');
INSERT INTO journals VALUES ('218', '98', 'Issue', '3', 'Finished at SVN verson:1120\r\nrole manager including QUIDV\r\nperson manager including QUIDV', '2013-08-02 18:31:15', '0');
INSERT INTO journals VALUES ('219', '103', 'Issue', '19', '', '2013-08-05 18:04:40', '0');
INSERT INTO journals VALUES ('220', '104', 'Issue', '18', '', '2013-08-05 18:26:49', '0');
INSERT INTO journals VALUES ('221', '103', 'Issue', '19', '', '2013-08-06 09:25:11', '0');
INSERT INTO journals VALUES ('222', '103', 'Issue', '19', '', '2013-08-06 11:28:00', '0');
INSERT INTO journals VALUES ('223', '103', 'Issue', '19', '', '2013-08-06 11:43:48', '0');
INSERT INTO journals VALUES ('224', '81', 'Issue', '3', '<pre>\r\n<bean id=\"mappings\"   \r\n     class=\"org.springframework.beans.factory.config.PropertyPlaceholderConfigurer\">   \r\n     <property name=\"locations\" value=\"file:${catalina.base}/config/cloudretrieval/jdbc.properties\"></property>   \r\n</bean>  \r\n</pre> ', '2013-08-06 16:25:00', '0');
INSERT INTO journals VALUES ('225', '81', 'Issue', '3', 'Resolved with spring.', '2013-08-06 18:51:03', '0');
INSERT INTO journals VALUES ('226', '107', 'Issue', '3', '', '2013-08-07 09:09:00', '0');
INSERT INTO journals VALUES ('227', '103', 'Issue', '19', '', '2013-08-07 16:13:57', '0');
INSERT INTO journals VALUES ('228', '104', 'Issue', '18', '', '2013-08-07 16:46:16', '0');
INSERT INTO journals VALUES ('229', '93', 'Issue', '18', '', '2013-08-07 18:07:10', '0');
INSERT INTO journals VALUES ('230', '98', 'Issue', '3', '', '2013-08-08 11:51:36', '0');
INSERT INTO journals VALUES ('231', '98', 'Issue', '3', 'Finish Menu Translation @ database', '2013-08-08 17:36:41', '0');
INSERT INTO journals VALUES ('232', '98', 'Issue', '3', '1) change language\r\n<pre>\r\nLocale locale = Locale.ENGLISH;\r\nsession.setAttribute(Globals.LOCALE_KEY, locale);\r\nor\r\nsession.setAttribute(Globals.LOCALE_KEY, BaseLanguage.getLocale(language));\r\nResourceBundle resourceBundle=ResourceBundle.getBundle(BaseLanguage.BASENAME,(Locale)session.getAttribute(Globals.LOCALE_KEY));\r\nsession.setAttribute(\"resourceBundle\", resourceBundle);\r\n</pre>\r\n2) throw new Exception\r\n<pre>\r\nResourceBundle rb = (ResourceBundle)session.getAttribute(\"resourceBundle\");\r\nthrow new CustomException(rb.getString(\"exp.login.pleaseCheckUsernameAndPassword\"));\r\n</pre>', '2013-08-09 19:09:29', '0');
INSERT INTO journals VALUES ('233', '79', 'Issue', '3', 'http://maven.apache.org/plugins/index.html\r\nhttp://repo.maven.apache.org/maven2/org/apache/maven/plugins/\r\n\r\nhttp://mvnrepository.com/\r\n\r\nhttp://repo1.maven.org/maven2/org/apache/struts/\r\nhttp://repo1.maven.org/maven2/org/springframework/\r\nhttp://repo1.maven.org/maven2/org/hibernate/\r\nhttp://repo1.maven.org/maven2/org/slf4j/', '2013-08-11 14:56:52', '0');
INSERT INTO journals VALUES ('234', '98', 'Issue', '3', 'The page internationalization near the end.\r\nThe  javaBean throw Exception in progress.\r\n\r\nIhe remained jsp and javaeBean will be done by Yinglai and Qinwei.\r\nKarl will do the Feature #107 -Image Enhancement \r\n', '2013-08-13 10:08:42', '0');
INSERT INTO journals VALUES ('235', '107', 'Issue', '3', '', '2013-08-13 17:11:58', '0');
INSERT INTO journals VALUES ('236', '107', 'Issue', '3', 'Finished function.\r\nNext need check & test.', '2013-08-15 09:53:04', '0');
INSERT INTO journals VALUES ('237', '98', 'Issue', '3', 'at the end of  the translate\r\njsp&js&java', '2013-08-15 09:54:20', '0');
INSERT INTO journals VALUES ('238', '105', 'Issue', '3', '嫌疑车辆标注-在“案件管理(英来做）-车辆信息管理（秦玮）某辆车的具体信息处标注嫌疑车辆，该车辆信息管理报表支持快速切入某一辆车的相关视频的功能。', '2013-08-16 16:14:43', '0');
INSERT INTO journals VALUES ('239', '107', 'Issue', '3', '', '2013-08-16 16:16:53', '0');
INSERT INTO journals VALUES ('240', '98', 'Issue', '3', '', '2013-08-16 16:17:20', '0');
INSERT INTO journals VALUES ('241', '106', 'Issue', '3', '', '2013-08-16 16:25:24', '0');
INSERT INTO journals VALUES ('242', '105', 'Issue', '18', '', '2013-08-16 17:55:44', '0');
INSERT INTO journals VALUES ('243', '109', 'Issue', '19', '', '2013-08-19 08:59:41', '0');
INSERT INTO journals VALUES ('244', '62', 'Issue', '3', '', '2013-08-19 11:07:49', '0');
INSERT INTO journals VALUES ('245', '56', 'Issue', '3', '', '2013-08-19 11:10:03', '0');
INSERT INTO journals VALUES ('246', '65', 'Issue', '3', '', '2013-08-19 11:10:33', '0');
INSERT INTO journals VALUES ('247', '64', 'Issue', '3', '', '2013-08-19 11:11:36', '0');
INSERT INTO journals VALUES ('248', '66', 'Issue', '3', '', '2013-08-19 11:12:03', '0');
INSERT INTO journals VALUES ('249', '67', 'Issue', '3', '', '2013-08-19 11:12:59', '0');
INSERT INTO journals VALUES ('250', '68', 'Issue', '3', '', '2013-08-19 11:13:39', '0');
INSERT INTO journals VALUES ('252', '44', 'Issue', '3', '', '2013-08-19 12:30:11', '0');
INSERT INTO journals VALUES ('253', '43', 'Issue', '3', '', '2013-08-19 12:32:28', '0');
INSERT INTO journals VALUES ('254', '113', 'Issue', '5', '', '2013-08-19 14:46:08', '0');
INSERT INTO journals VALUES ('255', '62', 'Issue', '3', '', '2013-08-19 14:59:43', '0');
INSERT INTO journals VALUES ('256', '109', 'Issue', '19', '', '2013-08-19 18:07:05', '0');
INSERT INTO journals VALUES ('257', '112', 'Issue', '18', '', '2013-08-20 17:51:26', '0');
INSERT INTO journals VALUES ('258', '109', 'Issue', '19', '', '2013-08-20 18:04:56', '0');
INSERT INTO journals VALUES ('259', '109', 'Issue', '19', '', '2013-08-21 11:30:55', '0');
INSERT INTO journals VALUES ('260', '114', 'Issue', '3', '', '2013-08-21 15:50:24', '0');
INSERT INTO journals VALUES ('261', '112', 'Issue', '18', '', '2013-08-21 15:51:10', '0');
INSERT INTO journals VALUES ('262', '114', 'Issue', '3', '', '2013-08-21 15:52:41', '0');
INSERT INTO journals VALUES ('263', '114', 'Issue', '3', '', '2013-08-21 15:54:55', '0');
INSERT INTO journals VALUES ('264', '117', 'Issue', '3', '', '2013-08-22 10:05:54', '0');
INSERT INTO journals VALUES ('265', '43', 'Issue', '3', '', '2013-08-22 10:07:33', '0');
INSERT INTO journals VALUES ('266', '120', 'Issue', '19', '', '2013-08-22 11:36:14', '0');
INSERT INTO journals VALUES ('267', '43', 'Issue', '3', '', '2013-08-22 13:21:52', '0');
INSERT INTO journals VALUES ('268', '116', 'Issue', '18', '', '2013-08-22 17:46:43', '0');
INSERT INTO journals VALUES ('269', '120', 'Issue', '19', '', '2013-08-22 17:59:57', '0');
INSERT INTO journals VALUES ('270', '121', 'Issue', '3', '', '2013-08-23 09:23:41', '0');
INSERT INTO journals VALUES ('271', '119', 'Issue', '3', '', '2013-08-23 12:08:50', '0');
INSERT INTO journals VALUES ('272', '120', 'Issue', '19', '', '2013-08-23 16:54:09', '0');
INSERT INTO journals VALUES ('273', '116', 'Issue', '18', '', '2013-08-23 17:43:24', '0');
INSERT INTO journals VALUES ('274', '121', 'Issue', '3', 'Finished Cloudretrieval login page.', '2013-08-26 09:07:52', '0');
INSERT INTO journals VALUES ('275', '120', 'Issue', '19', 'The Left Menu Of Cloud Retrieval Rewrite Has Been Finished，Next Is The Left Menu Of ITS Rewrite', '2013-08-26 09:15:22', '0');
INSERT INTO journals VALUES ('276', '121', 'Issue', '3', 'Finished ITS login page.', '2013-08-26 10:37:37', '0');
INSERT INTO journals VALUES ('277', '120', 'Issue', '19', '', '2013-08-26 16:11:36', '0');
INSERT INTO journals VALUES ('278', '119', 'Issue', '3', 'Cloudretrieval \r\nMenu and translations finished.\r\n\r\nNext:\r\nITS ', '2013-08-26 16:14:36', '0');
INSERT INTO journals VALUES ('279', '121', 'Issue', '3', '', '2013-08-26 16:15:14', '0');
INSERT INTO journals VALUES ('280', '120', 'Issue', '3', '', '2013-08-26 16:16:02', '0');
INSERT INTO journals VALUES ('281', '119', 'Issue', '3', '', '2013-08-26 16:16:55', '0');
INSERT INTO journals VALUES ('282', '117', 'Issue', '3', '', '2013-08-26 17:20:52', '0');
INSERT INTO journals VALUES ('283', '113', 'Issue', '3', '', '2013-08-27 17:12:28', '0');
INSERT INTO journals VALUES ('284', '117', 'Issue', '19', '', '2013-08-27 18:25:25', '0');
INSERT INTO journals VALUES ('285', '113', 'Issue', '3', '', '2013-08-27 18:40:03', '0');
INSERT INTO journals VALUES ('286', '118', 'Issue', '3', '', '2013-08-28 11:15:38', '0');
INSERT INTO journals VALUES ('287', '117', 'Issue', '19', '', '2013-08-28 18:19:00', '0');
INSERT INTO journals VALUES ('288', '117', 'Issue', '19', '', '2013-08-29 09:20:30', '0');
INSERT INTO journals VALUES ('289', '122', 'Issue', '3', '\r\nSystem：\r\nITS\r\nCloudretrieval\r\n', '2013-08-29 10:16:38', '0');
INSERT INTO journals VALUES ('290', '122', 'Issue', '18', '', '2013-08-29 11:57:46', '0');
INSERT INTO journals VALUES ('291', '122', 'Issue', '18', '', '2013-08-29 17:57:06', '0');
INSERT INTO journals VALUES ('292', '123', 'Issue', '19', '', '2013-08-29 18:05:28', '0');
INSERT INTO journals VALUES ('293', '114', 'Issue', '5', 'CaptchaCode', '2013-08-30 09:53:34', '0');
INSERT INTO journals VALUES ('294', '114', 'Issue', '5', '', '2013-08-30 09:57:49', '0');
INSERT INTO journals VALUES ('295', '118', 'Issue', '5', '', '2013-08-30 09:58:54', '0');
INSERT INTO journals VALUES ('296', '56', 'Issue', '5', '', '2013-08-30 10:21:01', '0');
INSERT INTO journals VALUES ('297', '58', 'Issue', '5', '', '2013-08-30 10:22:29', '0');
INSERT INTO journals VALUES ('298', '62', 'Issue', '5', '', '2013-08-30 10:24:09', '0');
INSERT INTO journals VALUES ('299', '63', 'Issue', '5', '', '2013-08-30 10:49:54', '0');
INSERT INTO journals VALUES ('300', '64', 'Issue', '5', '', '2013-08-30 10:50:37', '0');
INSERT INTO journals VALUES ('301', '65', 'Issue', '5', '', '2013-08-30 10:51:20', '0');
INSERT INTO journals VALUES ('302', '68', 'Issue', '5', '', '2013-08-30 10:51:53', '0');
INSERT INTO journals VALUES ('303', '69', 'Issue', '5', '', '2013-08-30 10:52:48', '0');
INSERT INTO journals VALUES ('304', '78', 'Issue', '5', '', '2013-08-30 11:07:54', '0');
INSERT INTO journals VALUES ('305', '79', 'Issue', '5', '', '2013-08-30 11:10:20', '0');
INSERT INTO journals VALUES ('306', '81', 'Issue', '5', '', '2013-08-30 11:10:51', '0');
INSERT INTO journals VALUES ('307', '82', 'Issue', '5', '', '2013-08-30 11:12:02', '0');
INSERT INTO journals VALUES ('308', '83', 'Issue', '5', '', '2013-08-30 11:12:21', '0');
INSERT INTO journals VALUES ('309', '85', 'Issue', '5', '', '2013-08-30 11:13:33', '0');
INSERT INTO journals VALUES ('310', '87', 'Issue', '5', '', '2013-08-30 11:13:57', '0');
INSERT INTO journals VALUES ('311', '84', 'Issue', '5', '', '2013-08-30 11:14:53', '0');
INSERT INTO journals VALUES ('312', '88', 'Issue', '5', '', '2013-08-30 11:15:22', '0');
INSERT INTO journals VALUES ('313', '89', 'Issue', '5', '', '2013-08-30 11:16:40', '0');
INSERT INTO journals VALUES ('314', '90', 'Issue', '5', '', '2013-08-30 11:18:34', '0');
INSERT INTO journals VALUES ('315', '92', 'Issue', '5', '', '2013-08-30 11:19:24', '0');
INSERT INTO journals VALUES ('316', '93', 'Issue', '5', '', '2013-08-30 11:20:14', '0');
INSERT INTO journals VALUES ('317', '94', 'Issue', '5', 'Pls pay attention this problem is not solved yet.', '2013-08-30 11:23:38', '0');
INSERT INTO journals VALUES ('318', '94', 'Issue', '5', '', '2013-08-30 11:25:12', '0');
INSERT INTO journals VALUES ('319', '98', 'Issue', '5', '', '2013-08-30 11:26:03', '0');
INSERT INTO journals VALUES ('320', '107', 'Issue', '5', '', '2013-08-30 11:27:25', '0');
INSERT INTO journals VALUES ('321', '108', 'Issue', '5', '', '2013-08-30 11:27:53', '0');
INSERT INTO journals VALUES ('322', '107', 'Issue', '5', '', '2013-08-30 11:29:33', '0');
INSERT INTO journals VALUES ('323', '103', 'Issue', '5', '', '2013-08-30 11:32:23', '0');
INSERT INTO journals VALUES ('324', '109', 'Issue', '5', '', '2013-08-30 11:32:56', '0');
INSERT INTO journals VALUES ('325', '105', 'Issue', '5', '', '2013-08-30 11:34:24', '0');
INSERT INTO journals VALUES ('326', '104', 'Issue', '5', '', '2013-08-30 11:35:06', '0');
INSERT INTO journals VALUES ('327', '123', 'Issue', '3', '', '2013-08-30 15:17:30', '0');
INSERT INTO journals VALUES ('328', '112', 'Issue', '3', '', '2013-08-30 15:20:20', '0');
INSERT INTO journals VALUES ('329', '123', 'Issue', '19', '', '2013-08-30 17:52:07', '0');
INSERT INTO journals VALUES ('330', '122', 'Issue', '18', '', '2013-08-30 17:52:30', '0');
INSERT INTO journals VALUES ('331', '118', 'Issue', '3', 'created a new pulbic page for upload.\r\n!fileupload20130830171710.png!\r\n', '2013-08-30 18:25:50', '0');
INSERT INTO journals VALUES ('332', '112', 'Issue', '10', '', '2013-09-02 12:11:00', '0');
INSERT INTO journals VALUES ('333', '112', 'Issue', '10', '', '2013-09-02 12:13:51', '0');
INSERT INTO journals VALUES ('334', '112', 'Issue', '10', 'Why no picture is displayed ?\r\n!http://10.168.1.251:3000/attachments/download/169/image_missing2.png!', '2013-09-02 12:15:20', '0');
INSERT INTO journals VALUES ('335', '123', 'Issue', '19', '', '2013-09-02 17:34:39', '0');
INSERT INTO journals VALUES ('336', '118', 'Issue', '3', 'There\'s some bug about session. I will check tomorrow.', '2013-09-02 18:45:32', '0');
INSERT INTO journals VALUES ('337', '123', 'Issue', '19', '当页面显示多个图片时，由于图片内存较大（平均1M左右），导致在页面上大量图片无法显示，且占用电脑内存较大，因此，现需先将每张原图生成一张缩略图再显示到页面', '2013-09-03 11:41:12', '0');
INSERT INTO journals VALUES ('338', '123', 'Issue', '19', 'When there are multiple pictures displayed in one page, as the internal memory of the pictures is pretty large( about 1M)，a lot pictures couldn\'t be displayed in the page , and it also occupys to much internal memory of the PC, so now I need to turn every original picture to a thumbnail to display it in the webpage.\r\n', '2013-09-03 12:08:38', '0');
INSERT INTO journals VALUES ('339', '123', 'Issue', '19', '', '2013-09-03 15:13:35', '0');
INSERT INTO journals VALUES ('340', '118', 'Issue', '3', 'Finished!\r\n!fileupload20130903154715.jpg!', '2013-09-03 15:53:49', '0');
INSERT INTO journals VALUES ('341', '118', 'Issue', '3', '', '2013-09-03 15:54:14', '0');
INSERT INTO journals VALUES ('342', '91', 'Issue', '3', 'rewrited upload function with new upload page.', '2013-09-03 15:59:27', '0');
INSERT INTO journals VALUES ('343', '94', 'Issue', '3', 'I didn\'t get the bug. Please try again and reply.', '2013-09-03 16:01:27', '0');
INSERT INTO journals VALUES ('344', '112', 'Issue', '3', 'resolved the bug.Please check.', '2013-09-03 16:17:52', '0');
INSERT INTO journals VALUES ('345', '124', 'Issue', '18', '', '2013-09-04 18:00:23', '0');
INSERT INTO journals VALUES ('346', '125', 'Issue', '3', '', '2013-09-05 12:05:14', '0');
INSERT INTO journals VALUES ('347', '126', 'Issue', '3', '', '2013-09-05 12:34:16', '0');
INSERT INTO journals VALUES ('348', '124', 'Issue', '3', '', '2013-09-05 12:36:32', '0');
INSERT INTO journals VALUES ('349', '125', 'Issue', '19', '', '2013-09-06 09:41:53', '0');
INSERT INTO journals VALUES ('350', '125', 'Issue', '19', '', '2013-09-06 18:05:03', '0');
INSERT INTO journals VALUES ('351', '124', 'Issue', '18', '', '2013-09-06 18:06:21', '0');
INSERT INTO journals VALUES ('352', '125', 'Issue', '19', '', '2013-09-09 17:44:10', '0');
INSERT INTO journals VALUES ('353', '124', 'Issue', '18', '', '2013-09-09 17:51:41', '0');
INSERT INTO journals VALUES ('354', '126', 'Issue', '3', 'Writted a test demo. Next try to integrate to MFC', '2013-09-10 09:15:11', '0');
INSERT INTO journals VALUES ('355', '126', 'Issue', '3', '', '2013-09-10 09:16:01', '0');
INSERT INTO journals VALUES ('356', '125', 'Issue', '19', '', '2013-09-10 17:53:44', '0');
INSERT INTO journals VALUES ('357', '125', 'Issue', '19', '', '2013-09-11 18:06:46', '0');
INSERT INTO journals VALUES ('358', '125', 'Issue', '19', '', '2013-09-12 13:56:04', '0');
INSERT INTO journals VALUES ('359', '126', 'Issue', '3', 'Connected & next to support more than 1 cameras.', '2013-09-12 15:19:32', '0');
INSERT INTO journals VALUES ('360', '119', 'Issue', '3', '电子警察各个菜单的名称还有什么问题吗？排列顺序呢？ @Wangren(Helen) ', '2013-09-16 09:21:57', '0');
INSERT INTO journals VALUES ('361', '119', 'Issue', '3', '', '2013-09-16 15:46:57', '0');
INSERT INTO journals VALUES ('362', '127', 'Issue', '19', '', '2013-09-16 17:42:38', '0');
INSERT INTO journals VALUES ('363', '127', 'Issue', '19', '', '2013-09-17 15:42:08', '0');
INSERT INTO journals VALUES ('364', '19', 'Issue', '10', 'Could we close this issue ?', '2013-09-26 14:10:06', '0');

-- ----------------------------
-- Table structure for `journal_details`
-- ----------------------------
DROP TABLE IF EXISTS `journal_details`;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` text,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journal_details
-- ----------------------------
INSERT INTO journal_details VALUES ('1', '2', 'attr', 'assigned_to_id', null, '5');
INSERT INTO journal_details VALUES ('2', '2', 'attr', 'priority_id', '2', '3');
INSERT INTO journal_details VALUES ('3', '5', 'attachment', '12', null, 'translated version-2013-04-26_Medianate-Teleframe - .ppt');
INSERT INTO journal_details VALUES ('4', '5', 'attr', 'status_id', '1', '5');
INSERT INTO journal_details VALUES ('5', '5', 'attr', 'assigned_to_id', '5', '10');
INSERT INTO journal_details VALUES ('6', '5', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('7', '6', 'attachment', '18', null, 'Database Medianate.vsd');
INSERT INTO journal_details VALUES ('8', '6', 'attachment', '19', null, 'WEB of Medianate.vsd');
INSERT INTO journal_details VALUES ('9', '7', 'attachment', '20', null, 'WEB of Medianate.vsd');
INSERT INTO journal_details VALUES ('10', '8', 'attachment', '22', null, 'Catalogue-“平安丽江”项目建设方案2013.2.161 -.doc');
INSERT INTO journal_details VALUES ('11', '8', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('12', '8', 'attr', 'assigned_to_id', '5', '10');
INSERT INTO journal_details VALUES ('13', '8', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('14', '9', 'attachment', '24', null, 'English version-电子警察需求分析-0422 .xls');
INSERT INTO journal_details VALUES ('15', '9', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('16', '9', 'attr', 'done_ratio', '70', '100');
INSERT INTO journal_details VALUES ('17', '10', 'attachment', '26', null, '信帧智能监控WEB系统-开发文档.docx');
INSERT INTO journal_details VALUES ('18', '11', 'attr', 'subject', 'Tleframe Medianate does not support linux file path', 'Teleframe Medianate does not support linux file path');
INSERT INTO journal_details VALUES ('19', '13', 'attachment', '27', null, '周工作汇总 - 李建 - 2013.4.22 - 4.28.doc');
INSERT INTO journal_details VALUES ('20', '15', 'attachment', '29', null, '信帧云检索产品介绍_v1.ppt');
INSERT INTO journal_details VALUES ('21', '15', 'attr', 'subject', 'PPT for Medianate \"car retrieval\" application', 'PPT for Introduction of Teleframe Cloud Retrieval Product');
INSERT INTO journal_details VALUES ('22', '17', 'attachment', '57', null, 'messages-correction-cn&en.properties');
INSERT INTO journal_details VALUES ('23', '17', 'attachment', '58', null, 'messages-correction-only Chinese.properties');
INSERT INTO journal_details VALUES ('24', '17', 'attr', 'assigned_to_id', '10', '5');
INSERT INTO journal_details VALUES ('25', '18', 'attachment', '59', null, '信帧智能监控WEB系统(新).docx');
INSERT INTO journal_details VALUES ('26', '18', 'attachment', '60', null, '智能交通综合管理平台用户手册标准版1.pdf');
INSERT INTO journal_details VALUES ('27', '19', 'attachment', '61', null, '电子警察WEB系整理-李建.docx');
INSERT INTO journal_details VALUES ('28', '20', 'attachment', '62', null, 'web2.0功能列表(1).jpg');
INSERT INTO journal_details VALUES ('29', '21', 'attachment', '63', null, '电子警察需求分析 - WEB综合管理平台功能(1).xls');
INSERT INTO journal_details VALUES ('30', '22', 'attachment', '19', 'WEB of Medianate.vsd', null);
INSERT INTO journal_details VALUES ('31', '23', 'attachment', '54', '智能交通综合管理平台用户手册标准版1.pdf', null);
INSERT INTO journal_details VALUES ('32', '25', 'attr', 'status_id', '1', '5');
INSERT INTO journal_details VALUES ('33', '26', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('34', '27', 'attachment', '75', null, '信帧智能监控WEB系统-Enlish.docx');
INSERT INTO journal_details VALUES ('35', '27', 'attr', 'tracker_id', '1', '3');
INSERT INTO journal_details VALUES ('36', '28', 'attachment', '82', null, 'ITSconfigToolK v1.5.zip');
INSERT INTO journal_details VALUES ('37', '28', 'attr', 'status_id', '1', '6');
INSERT INTO journal_details VALUES ('38', '29', 'attachment', '83', null, 'ITSconfigToolK v1.6.zip');
INSERT INTO journal_details VALUES ('39', '30', 'attachment', '84', null, 'ITSconfigToolK使用说明.docx');
INSERT INTO journal_details VALUES ('40', '31', 'attachment', '90', null, 'messages-version 2-cn&en.properties');
INSERT INTO journal_details VALUES ('41', '32', 'attachment', '91', null, 'messages-version 2-Chinese only.properties');
INSERT INTO journal_details VALUES ('42', '33', 'attachment', '94', null, 'messages-version 3-cn&en.properties(fred)');
INSERT INTO journal_details VALUES ('43', '33', 'attachment', '95', null, 'messages-version 3-chinese only.properties(fred)');
INSERT INTO journal_details VALUES ('44', '34', 'attachment', '99', null, '信帧智能交通系统最终.ppt');
INSERT INTO journal_details VALUES ('45', '34', 'attachment', '100', null, 'English-信帧智能交通系最终.ppt');
INSERT INTO journal_details VALUES ('46', '35', 'attachment', '101', null, 'ITSconfigToolK v1.7.zip');
INSERT INTO journal_details VALUES ('47', '37', 'attachment', '103', null, 'ITSconfigToolK v1.8.zip');
INSERT INTO journal_details VALUES ('48', '38', 'attr', 'assigned_to_id', null, '13');
INSERT INTO journal_details VALUES ('49', '39', 'attr', 'status_id', '3', '5');
INSERT INTO journal_details VALUES ('50', '40', 'attachment', '104', null, 'ITSconfigToolK v1.9.zip');
INSERT INTO journal_details VALUES ('51', '42', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('52', '43', 'attr', 'assigned_to_id', null, '8');
INSERT INTO journal_details VALUES ('53', '44', 'attachment', '111', null, '信帧智能监控WEB系统-Enlish 2.docx');
INSERT INTO journal_details VALUES ('54', '44', 'attr', 'subject', 'Intelligent Monitoring Web System-Development document', 'Intelligent Monitoring Web System');
INSERT INTO journal_details VALUES ('59', '47', 'attachment', '112', null, 'General_PlaySDK_EngChn_IS_V3.32.0.R.111107.zip');
INSERT INTO journal_details VALUES ('61', '49', 'attr', 'status_id', '1', '5');
INSERT INTO journal_details VALUES ('63', '51', 'attr', 'subject', 'Watch folder mechanism in web system', '(Cloud retrieval Medianate) - Getting and monitoring tasks created by watch folder');
INSERT INTO journal_details VALUES ('64', '53', 'attr', 'assigned_to_id', null, '10');
INSERT INTO journal_details VALUES ('65', '54', 'attr', 'due_date', null, '2013-06-28');
INSERT INTO journal_details VALUES ('66', '54', 'attr', 'start_date', '2013-06-14', '2013-06-24');
INSERT INTO journal_details VALUES ('67', '55', 'attr', 'due_date', null, '2013-06-28');
INSERT INTO journal_details VALUES ('68', '55', 'attr', 'priority_id', '2', '3');
INSERT INTO journal_details VALUES ('69', '55', 'attr', 'start_date', '2013-06-14', '2013-06-24');
INSERT INTO journal_details VALUES ('70', '56', 'attr', 'status_id', '1', '5');
INSERT INTO journal_details VALUES ('71', '58', 'attr', 'due_date', null, '2013-06-19');
INSERT INTO journal_details VALUES ('72', '58', 'attr', 'status_id', '1', '5');
INSERT INTO journal_details VALUES ('73', '58', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('74', '59', 'attr', 'subject', 'FIle Manager', '(Cloud retrieval Medianate) - FIle Manager');
INSERT INTO journal_details VALUES ('75', '59', 'attr', 'done_ratio', '0', '30');
INSERT INTO journal_details VALUES ('76', '60', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('77', '61', 'attr', 'subject', '(Cloud retrieval Medianate) - FIle Manager', '(Cloud retrieval Medianate) - File Manager');
INSERT INTO journal_details VALUES ('78', '61', 'attr', 'done_ratio', '30', '100');
INSERT INTO journal_details VALUES ('79', '62', 'attr', 'subject', '(Cloud retrieval Medianate) - FIle Manager', '(Cloud retrieval Medianate) - File Manager');
INSERT INTO journal_details VALUES ('80', '62', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('81', '62', 'attr', 'done_ratio', '30', '100');
INSERT INTO journal_details VALUES ('82', '63', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('83', '64', 'attr', 'subject', 'Realtime Analysis', '(Cloud retrieval Medianate) - Realtime Analysis');
INSERT INTO journal_details VALUES ('84', '65', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('85', '66', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('86', '67', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('87', '67', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('88', '68', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('89', '68', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('90', '69', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('91', '69', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('92', '70', 'attachment', '133', null, 'ShowLastTaskByWatchedFolderTest.java');
INSERT INTO journal_details VALUES ('93', '71', 'attr', 'subject', '(Cloud retrieval Medianate) - Realtime Analysis', '(Cloud retrieval Medianate) - Immediate Processing last files');
INSERT INTO journal_details VALUES ('94', '74', 'attr', 'subject', 'Task Manager', '(Cloud retrieval ) Task Manager');
INSERT INTO journal_details VALUES ('95', '77', 'attr', 'description', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n2) Specify in the input criteria the watch folder Id :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n3) Precise the tasks state if necessary :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n(EDITION PROCESSING FAILED COMPLETED)', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n2) Specify in the input criteria the watch folder Id :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n3) Precise the tasks state if necessary :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n\r\nReference : \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki\r\n(EDITION PROCESSING FAILED COMPLETED)');
INSERT INTO journal_details VALUES ('96', '78', 'attr', 'description', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n2) Specify in the input criteria the watch folder Id :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n3) Precise the tasks state if necessary :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n\r\nReference : \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki\r\n(EDITION PROCESSING FAILED COMPLETED)', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n 1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n 2) Specify in the input criteria the watch folder Id:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n 3) Precise the tasks state if necessary:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n(EDITION PROCESSING FAILED COMPLETED)\r\n\r\nReference: \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki');
INSERT INTO journal_details VALUES ('97', '79', 'attr', 'description', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n 1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n 2) Specify in the input criteria the watch folder Id:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n 3) Precise the tasks state if necessary:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n(EDITION PROCESSING FAILED COMPLETED)\r\n\r\nReference: \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki', 'I need to add the watch folder principle in the web system. \r\n\r\nThe following is guidance from MR. Frederic:\r\n\r\n1/ How to get all the tasks created by one specific \'watch folder\' ?\r\n\r\n 1) Using the search method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n 2) Specify in the input criteria the watch folder Id:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\nwatchedFolderId : The \"watchedFolder\" from which the task has been created\r\n\r\n 3) Precise the tasks state if necessary:\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n(EDITION PROCESSING FAILED COMPLETED)\r\n\r\nReference: \"cloud-retrieval-medianate wiki\":http://teleframe.xicp.net:3000/projects/cloud-retrieval-medianate/wiki');
INSERT INTO journal_details VALUES ('98', '84', 'attr', 'subject', '(Cloud retrieval Medianate) - Immediate Processing last files', '(Cloud retrieval) - Immediate Processing last files');
INSERT INTO journal_details VALUES ('99', '84', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('100', '85', 'attr', 'assigned_to_id', null, '10');
INSERT INTO journal_details VALUES ('101', '86', 'attr', 'done_ratio', '0', '20');
INSERT INTO journal_details VALUES ('102', '88', 'attr', 'subject', '(Cloud retrieval Medianate) - File Manager', '(Cloud Retrieval System) - File Manager');
INSERT INTO journal_details VALUES ('103', '89', 'attr', 'subject', '(Cloud retrieval) - Immediate Processing last files', '(Cloud Retrieval System) - Immediate Processing last files');
INSERT INTO journal_details VALUES ('104', '89', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('105', '90', 'attr', 'subject', '(Cloud retrieval ) Task Manager', '(Cloud Retrieval System) Task Manager');
INSERT INTO journal_details VALUES ('106', '91', 'attr', 'subject', '(Cloud retrieval Medianate) - Getting and monitoring tasks created by watch folder', '(Cloud Retrieval System) - Getting and monitoring tasks created by watch folder');
INSERT INTO journal_details VALUES ('107', '92', 'attr', 'subject', '(Cloud retrieval Medianate) - Integration of a video player', '(Cloud Retrieval System) - Integration of video player');
INSERT INTO journal_details VALUES ('108', '93', 'attr', 'subject', '(Cloud retrieval Medianate) - multi files selection with IE browser', '(Cloud Retrieval System) - multi files selection with IE browser');
INSERT INTO journal_details VALUES ('109', '95', 'attr', 'parent_id', null, '58');
INSERT INTO journal_details VALUES ('110', '96', 'attr', 'subject', 'System Parameter', '(Cloud Retrieval System) System Parameter');
INSERT INTO journal_details VALUES ('111', '96', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('112', '97', 'attr', 'subject', 'Report', '(Cloud Retrieval System) Report');
INSERT INTO journal_details VALUES ('113', '97', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('114', '98', 'attr', 'subject', 'Vehicle Trajectory [GIS]', '(Cloud Retrieval System) Vehicle Trajectory [GIS]');
INSERT INTO journal_details VALUES ('115', '98', 'attr', 'due_date', null, '2013-07-05');
INSERT INTO journal_details VALUES ('116', '98', 'attr', 'done_ratio', '0', '80');
INSERT INTO journal_details VALUES ('117', '99', 'attr', 'subject', '(Cloud Retrieval System) Report', '(Cloud Retrieval System) Report & Statistics');
INSERT INTO journal_details VALUES ('118', '99', 'attr', 'estimated_hours', null, '24.00');
INSERT INTO journal_details VALUES ('119', '100', 'attr', 'due_date', '2013-07-05', '2013-07-09');
INSERT INTO journal_details VALUES ('120', '100', 'attr', 'status_id', '2', '1');
INSERT INTO journal_details VALUES ('121', '100', 'attr', 'estimated_hours', '24.00', null);
INSERT INTO journal_details VALUES ('122', '101', 'attachment', '138', null, 'messages_cn.properties');
INSERT INTO journal_details VALUES ('123', '101', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('124', '101', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('125', '102', 'attachment', '138', 'messages_cn.properties', null);
INSERT INTO journal_details VALUES ('126', '103', 'attachment', '140', null, 'messages_cn.properties');
INSERT INTO journal_details VALUES ('127', '103', 'attr', 'assigned_to_id', '5', '10');
INSERT INTO journal_details VALUES ('128', '104', 'attr', 'status_id', '3', '2');
INSERT INTO journal_details VALUES ('129', '104', 'attr', 'done_ratio', '100', '70');
INSERT INTO journal_details VALUES ('130', '106', 'attr', 'due_date', '2013-06-27', '2013-07-05');
INSERT INTO journal_details VALUES ('131', '107', 'attr', 'done_ratio', '20', '70');
INSERT INTO journal_details VALUES ('132', '108', 'attr', 'start_date', '2013-06-21', '2013-07-05');
INSERT INTO journal_details VALUES ('133', '108', 'attr', 'done_ratio', '80', '0');
INSERT INTO journal_details VALUES ('134', '109', 'attr', 'status_id', '3', '2');
INSERT INTO journal_details VALUES ('135', '110', 'attr', 'parent_id', '58', null);
INSERT INTO journal_details VALUES ('136', '111', 'attr', 'due_date', null, '2013-07-05');
INSERT INTO journal_details VALUES ('137', '111', 'attr', 'start_date', null, '2013-06-14');
INSERT INTO journal_details VALUES ('138', '111', 'attr', 'done_ratio', '50', '70');
INSERT INTO journal_details VALUES ('139', '111', 'attr', 'parent_id', null, '64');
INSERT INTO journal_details VALUES ('140', '112', 'attr', 'done_ratio', '70', '100');
INSERT INTO journal_details VALUES ('141', '113', 'attr', 'done_ratio', '70', '80');
INSERT INTO journal_details VALUES ('142', '118', 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details VALUES ('143', '118', 'attr', 'due_date', null, '2013-07-12');
INSERT INTO journal_details VALUES ('144', '118', 'attr', 'priority_id', '2', '3');
INSERT INTO journal_details VALUES ('145', '118', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('146', '120', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('147', '120', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('148', '122', 'attr', 'tracker_id', '1', '3');
INSERT INTO journal_details VALUES ('149', '122', 'attr', 'assigned_to_id', null, '3');
INSERT INTO journal_details VALUES ('150', '123', 'attachment', '142', null, 'screenshot.png');
INSERT INTO journal_details VALUES ('151', '123', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('152', '123', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('153', '124', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('154', '128', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('155', '128', 'attr', 'done_ratio', '0', '90');
INSERT INTO journal_details VALUES ('156', '129', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('157', '129', 'attr', 'done_ratio', '80', '100');
INSERT INTO journal_details VALUES ('158', '130', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('159', '130', 'attr', 'done_ratio', '70', '100');
INSERT INTO journal_details VALUES ('160', '133', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('161', '134', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('162', '134', 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details VALUES ('163', '135', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('164', '136', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('165', '137', 'attr', 'due_date', null, '2013-07-09');
INSERT INTO journal_details VALUES ('166', '137', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('167', '137', 'attr', 'start_date', '2013-07-05', '2013-07-08');
INSERT INTO journal_details VALUES ('168', '137', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('169', '138', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('170', '138', 'attr', 'done_ratio', '10', '100');
INSERT INTO journal_details VALUES ('171', '139', 'attr', 'status_id', '3', '5');
INSERT INTO journal_details VALUES ('172', '141', 'attr', 'subject', '(Cloud Retrieval System) but no only - Continuous Integration with automated build and test execution', '(Cloud Retrieval System) but no only - Continuous Integration with Automated Build and Tests Execution');
INSERT INTO journal_details VALUES ('173', '141', 'attr', 'description', 'Integration of \"Jenkins\":http://jenkins-ci.org/ with \"Maven\":http://maven.apache.org/.\r\n\"Jenkins with Maven2/3\":https://wiki.jenkins-ci.org/display/JENKINS/Building+a+maven2+project \r\n\r\n\r\n', 'The final goal is to build, deploy and automaticaly run tests (unit tests and integration tests) on a reference test platform each time a new SVN commit is made by a member of the development project team.\r\n\r\n+Selection of tools to be integrated:+\r\n- Continuous Integration: \"*Jenkins*\":http://jenkins-ci.org/  \r\n- Build and Tests Automation: \"Apache *Maven*\":http://maven.apache.org/ for Java project \"Microsoft *MSBuild*\":http://msdn.microsoft.com/en-us/library/wea2sca5%28v=vs.90%29.aspx for VC++ project. \r\n- Versioning Control: \"Apache Subversion *SVN*\":http://subversion.apache.org/');
INSERT INTO journal_details VALUES ('174', '143', 'attachment', '143', null, 'm2e_eclipse_plugin.png');
INSERT INTO journal_details VALUES ('175', '144', 'attachment', '144', null, 'm2e_eclipse_plugin.png');
INSERT INTO journal_details VALUES ('176', '146', 'attr', 'priority_id', '2', '4');
INSERT INTO journal_details VALUES ('177', '147', 'attr', 'assigned_to_id', null, '18');
INSERT INTO journal_details VALUES ('178', '148', 'attr', 'assigned_to_id', null, '19');
INSERT INTO journal_details VALUES ('179', '150', 'attr', 'due_date', null, '2013-07-12');
INSERT INTO journal_details VALUES ('180', '151', 'attr', 'description', 'We must have 2 separate deployment server: \r\n\r\n- *Developement* (devt) platform where all builds and WAR packages made either manually (today) or automatically (later) by Jenkins + Maven after SVN commits are deployed for being tested by development project members \r\n\r\n- *Production* (prod) platfom where all realeases (after testing on \'devt\' platform) should be deployed for +demonstrations+ and also some testing by any Teleframe colleagues.   \r\n\r\nThey must be *+clearly technically separate+*: no direct dependence or indirect dependence on some common sofware instances should appear. If the \'devt\' is broken, the \'prod\' should still work with no matter.  ', 'We must have 2 separate deployment servers: \r\n\r\n- *Developement* (devt) platform where all builds and WAR packages made either manually (today) or automatically (later) by Jenkins + Maven after SVN commits are deployed for being tested by development project members \r\n\r\n- *Production* (prod) platfom where all realeases (after testing on \'devt\' platform) should be deployed for +demonstrations+ and also some testing by any Teleframe colleagues.   \r\n\r\nThey must be *+clearly technically separate+*: no direct dependence or indirect dependence on some common sofware instances should appear. If the \'devt\' is broken, the \'prod\' should still work with no matter.  ');
INSERT INTO journal_details VALUES ('181', '152', 'attr', 'tracker_id', '1', '3');
INSERT INTO journal_details VALUES ('182', '153', 'attr', 'assigned_to_id', null, '3');
INSERT INTO journal_details VALUES ('183', '154', 'attr', 'done_ratio', '0', '80');
INSERT INTO journal_details VALUES ('184', '155', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('185', '155', 'attr', 'done_ratio', '80', '100');
INSERT INTO journal_details VALUES ('186', '157', 'attr', 'description', 'Enable the user to show the picture and also to play the video by seeking at the right time stamp.\r\n\r\nLike that (ref. google maps with activated photos and video):\r\n\'image.png\' \r\n ', 'Enable the user to show the picture and also to play the video by seeking at the right time stamp.\r\n\r\nLike that (ref. google maps with activated photos and video):\r\n!image.png! \r\n ');
INSERT INTO journal_details VALUES ('187', '161', 'attr', 'due_date', null, '2013-07-12');
INSERT INTO journal_details VALUES ('188', '161', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('189', '161', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('190', '161', 'attr', 'estimated_hours', null, '8.00');
INSERT INTO journal_details VALUES ('191', '165', 'attr', 'due_date', null, '2013-07-15');
INSERT INTO journal_details VALUES ('192', '165', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('193', '165', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('194', '172', 'attachment', '150', null, 'screenshot.png');
INSERT INTO journal_details VALUES ('195', '176', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('196', '176', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('197', '177', 'attr', 'status_id', '3', '2');
INSERT INTO journal_details VALUES ('198', '179', 'attr', 'subject', '(Cloud Retrieval System) - seeking in windows media player ', '(Cloud Retrieval System) - seeking in windows media player when paused');
INSERT INTO journal_details VALUES ('199', '180', 'attr', 'subject', '(Cloud Retrieval System) report & statistics no line for non continuous phenomenon ', '(Cloud Retrieval System) - report & statistics no line for non continuous phenomenon ');
INSERT INTO journal_details VALUES ('200', '183', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('201', '183', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('202', '184', 'attr', 'subject', 'The curve chart is improper ', '(Cloud Retrieval System) - The curve chart is improper ');
INSERT INTO journal_details VALUES ('203', '185', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('204', '185', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('205', '186', 'attr', 'due_date', null, '2013-07-18');
INSERT INTO journal_details VALUES ('206', '186', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('207', '186', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('208', '186', 'attr', 'estimated_hours', null, '1.00');
INSERT INTO journal_details VALUES ('209', '187', 'attr', 'due_date', null, '2013-07-24');
INSERT INTO journal_details VALUES ('210', '187', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('211', '187', 'attr', 'assigned_to_id', null, '19');
INSERT INTO journal_details VALUES ('212', '187', 'attr', 'start_date', '2013-07-12', '2013-07-22');
INSERT INTO journal_details VALUES ('213', '188', 'attr', 'due_date', null, '2013-07-23');
INSERT INTO journal_details VALUES ('214', '188', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('215', '188', 'attr', 'assigned_to_id', null, '19');
INSERT INTO journal_details VALUES ('216', '188', 'attr', 'start_date', '2013-07-17', '2013-07-22');
INSERT INTO journal_details VALUES ('217', '189', 'attr', 'status_id', '1', '6');
INSERT INTO journal_details VALUES ('218', '191', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('219', '192', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('220', '193', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('221', '194', 'attr', 'due_date', null, '2013-07-26');
INSERT INTO journal_details VALUES ('222', '194', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('223', '195', 'attachment', '155', null, 'QQ截图20130723133200.png');
INSERT INTO journal_details VALUES ('224', '195', 'attachment', '156', null, 'QQ截图20130723133232.png');
INSERT INTO journal_details VALUES ('225', '195', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('226', '195', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('227', '196', 'attr', 'subject', 'Make web app internationalization.', '(Cloud Retrieval System)-Make web app internationalization.');
INSERT INTO journal_details VALUES ('228', '199', 'attachment', '159', null, 'QQ20130724152602.jpg');
INSERT INTO journal_details VALUES ('229', '200', 'attachment', '160', null, 'QQ20130724152602.jpg');
INSERT INTO journal_details VALUES ('230', '201', 'attachment', '160', 'QQ20130724152602.jpg', null);
INSERT INTO journal_details VALUES ('231', '203', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('232', '204', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('233', '204', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('234', '206', 'attr', 'due_date', null, '2013-07-26');
INSERT INTO journal_details VALUES ('235', '206', 'attr', 'assigned_to_id', null, '18');
INSERT INTO journal_details VALUES ('236', '206', 'attr', 'start_date', '2013-07-22', '2013-07-26');
INSERT INTO journal_details VALUES ('237', '207', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('238', '207', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('239', '208', 'attr', 'due_date', null, '2013-08-16');
INSERT INTO journal_details VALUES ('240', '208', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('241', '208', 'attr', 'assigned_to_id', null, '3');
INSERT INTO journal_details VALUES ('242', '209', 'attr', 'subject', '(Cloud Retrieval System)-Make web app internationalization.', '(Cloud Retrieval System)-New function-Make web app internationalization.');
INSERT INTO journal_details VALUES ('243', '209', 'attr', 'priority_id', '2', '3');
INSERT INTO journal_details VALUES ('244', '210', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('245', '211', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('246', '212', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('247', '212', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('248', '213', 'attr', 'done_ratio', '0', '30');
INSERT INTO journal_details VALUES ('249', '214', 'attr', 'done_ratio', '10', '20');
INSERT INTO journal_details VALUES ('250', '216', 'attr', 'done_ratio', '30', '60');
INSERT INTO journal_details VALUES ('251', '217', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('252', '219', 'attr', 'done_ratio', '60', '90');
INSERT INTO journal_details VALUES ('253', '220', 'attr', 'done_ratio', '0', '90');
INSERT INTO journal_details VALUES ('254', '221', 'attr', 'done_ratio', '90', '100');
INSERT INTO journal_details VALUES ('255', '222', 'attr', 'done_ratio', '100', '80');
INSERT INTO journal_details VALUES ('256', '223', 'attr', 'done_ratio', '80', '70');
INSERT INTO journal_details VALUES ('257', '225', 'attr', 'due_date', null, '2013-08-06');
INSERT INTO journal_details VALUES ('258', '225', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('259', '225', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('260', '226', 'attr', 'start_date', '2013-08-05', '2013-08-11');
INSERT INTO journal_details VALUES ('261', '227', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('262', '227', 'attr', 'done_ratio', '70', '100');
INSERT INTO journal_details VALUES ('263', '228', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('264', '228', 'attr', 'done_ratio', '90', '100');
INSERT INTO journal_details VALUES ('265', '229', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('266', '229', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('267', '230', 'attr', 'done_ratio', '20', '30');
INSERT INTO journal_details VALUES ('268', '231', 'attr', 'done_ratio', '30', '50');
INSERT INTO journal_details VALUES ('269', '232', 'attr', 'done_ratio', '50', '60');
INSERT INTO journal_details VALUES ('270', '234', 'attr', 'done_ratio', '60', '70');
INSERT INTO journal_details VALUES ('271', '235', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('272', '235', 'attr', 'start_date', '2013-08-11', '2013-08-12');
INSERT INTO journal_details VALUES ('273', '235', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('274', '236', 'attr', 'done_ratio', '50', '90');
INSERT INTO journal_details VALUES ('275', '237', 'attr', 'done_ratio', '70', '90');
INSERT INTO journal_details VALUES ('276', '238', 'attr', 'done_ratio', '100', '90');
INSERT INTO journal_details VALUES ('277', '239', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('278', '239', 'attr', 'done_ratio', '90', '100');
INSERT INTO journal_details VALUES ('279', '240', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('280', '240', 'attr', 'done_ratio', '60', '100');
INSERT INTO journal_details VALUES ('281', '241', 'attr', 'due_date', '2013-08-16', null);
INSERT INTO journal_details VALUES ('282', '241', 'attr', 'assigned_to_id', '19', null);
INSERT INTO journal_details VALUES ('283', '241', 'attr', 'priority_id', '2', '1');
INSERT INTO journal_details VALUES ('284', '242', 'attr', 'done_ratio', '90', '100');
INSERT INTO journal_details VALUES ('285', '243', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('286', '244', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('287', '245', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('288', '246', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('289', '247', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('290', '248', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('291', '249', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('292', '250', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('294', '252', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('295', '253', 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details VALUES ('296', '253', 'attr', 'due_date', '2013-06-07', '2013-08-21');
INSERT INTO journal_details VALUES ('297', '253', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('298', '253', 'attr', 'start_date', '2013-05-28', '2013-08-19');
INSERT INTO journal_details VALUES ('299', '254', 'attr', 'subject', '(Cloud Retrieval System)-', '(Cloud Retrieval System)-problems of video playing and download in \"File Management\"');
INSERT INTO journal_details VALUES ('300', '255', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('301', '256', 'attr', 'done_ratio', '0', '40');
INSERT INTO journal_details VALUES ('302', '257', 'attr', 'done_ratio', '0', '60');
INSERT INTO journal_details VALUES ('303', '258', 'attr', 'done_ratio', '40', '80');
INSERT INTO journal_details VALUES ('304', '259', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('305', '259', 'attr', 'done_ratio', '80', '100');
INSERT INTO journal_details VALUES ('306', '260', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('307', '260', 'attr', 'estimated_hours', null, '5.00');
INSERT INTO journal_details VALUES ('308', '261', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('309', '261', 'attr', 'done_ratio', '60', '100');
INSERT INTO journal_details VALUES ('310', '262', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('311', '263', 'attr', 'status_id', '1', '3');
INSERT INTO journal_details VALUES ('312', '264', 'attr', 'project_id', '9', '13');
INSERT INTO journal_details VALUES ('313', '265', 'attr', 'done_ratio', '0', '80');
INSERT INTO journal_details VALUES ('314', '266', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('315', '267', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('316', '267', 'attr', 'done_ratio', '80', '100');
INSERT INTO journal_details VALUES ('317', '268', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('318', '269', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('319', '270', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('320', '270', 'attr', 'assigned_to_id', '17', '3');
INSERT INTO journal_details VALUES ('321', '271', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('322', '272', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('323', '272', 'attr', 'done_ratio', '10', '100');
INSERT INTO journal_details VALUES ('324', '273', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('325', '273', 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details VALUES ('326', '274', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('327', '275', 'attr', 'status_id', '3', '2');
INSERT INTO journal_details VALUES ('328', '275', 'attr', 'done_ratio', '100', '50');
INSERT INTO journal_details VALUES ('329', '276', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('330', '276', 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details VALUES ('331', '277', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('332', '277', 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details VALUES ('333', '278', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('334', '279', 'attr', 'due_date', null, '2013-08-26');
INSERT INTO journal_details VALUES ('335', '280', 'attr', 'due_date', null, '2013-08-26');
INSERT INTO journal_details VALUES ('336', '281', 'attr', 'due_date', null, '2013-08-27');
INSERT INTO journal_details VALUES ('337', '282', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('338', '282', 'attr', 'assigned_to_id', null, '19');
INSERT INTO journal_details VALUES ('339', '283', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('340', '284', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('341', '285', 'attr', 'due_date', null, '2013-08-27');
INSERT INTO journal_details VALUES ('342', '285', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('343', '285', 'attr', 'start_date', '2013-08-19', '2013-08-27');
INSERT INTO journal_details VALUES ('344', '285', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('345', '286', 'attr', 'due_date', null, '2013-08-29');
INSERT INTO journal_details VALUES ('346', '286', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('347', '286', 'attr', 'start_date', '2013-08-22', '2013-08-28');
INSERT INTO journal_details VALUES ('348', '287', 'attr', 'done_ratio', '10', '90');
INSERT INTO journal_details VALUES ('349', '288', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('350', '288', 'attr', 'done_ratio', '90', '100');
INSERT INTO journal_details VALUES ('351', '289', 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details VALUES ('352', '290', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('353', '291', 'attr', 'done_ratio', '0', '80');
INSERT INTO journal_details VALUES ('354', '292', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('355', '293', 'attr', 'subject', '(Cloud Retrieval System)-CaptchaCode', 'CaptchaCode');
INSERT INTO journal_details VALUES ('356', '294', 'attr', 'project_id', '14', '9');
INSERT INTO journal_details VALUES ('357', '295', 'attr', 'project_id', '14', '20');
INSERT INTO journal_details VALUES ('358', '295', 'attr', 'subject', '(Cloud Retrieval System)-File Manager ReWrite', 'File Manager ReWrite');
INSERT INTO journal_details VALUES ('359', '296', 'attr', 'project_id', '14', '19');
INSERT INTO journal_details VALUES ('360', '296', 'attr', 'subject', '(Cloud Retrieval System) - Integration of video player', 'Integration of video player');
INSERT INTO journal_details VALUES ('361', '297', 'attr', 'project_id', '14', '19');
INSERT INTO journal_details VALUES ('362', '297', 'attr', 'subject', '(Cloud Retrieval System) - Getting and monitoring tasks created by watch folder', 'Getting and monitoring tasks created by watch folder');
INSERT INTO journal_details VALUES ('363', '298', 'attr', 'project_id', '14', '19');
INSERT INTO journal_details VALUES ('364', '298', 'attr', 'subject', '(Cloud Retrieval System) - multi files selection with IE browser', 'multi files selection with IE browser');
INSERT INTO journal_details VALUES ('365', '299', 'attr', 'subject', '(Cloud Retrieval System) - File Manager', 'File Manager');
INSERT INTO journal_details VALUES ('366', '300', 'attr', 'project_id', '14', '19');
INSERT INTO journal_details VALUES ('367', '300', 'attr', 'subject', '(Cloud Retrieval System) - Immediate Processing last files', 'Immediate Processing last files');
INSERT INTO journal_details VALUES ('368', '301', 'attr', 'project_id', '14', '19');
INSERT INTO journal_details VALUES ('369', '301', 'attr', 'subject', '(Cloud Retrieval System) Task Manager', 'Task Manager');
INSERT INTO journal_details VALUES ('370', '302', 'attr', 'project_id', '14', '19');
INSERT INTO journal_details VALUES ('371', '302', 'attr', 'subject', '(Cloud Retrieval System) Report & Statistics', 'Report & Statistics');
INSERT INTO journal_details VALUES ('372', '303', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('373', '303', 'attr', 'subject', '(Cloud Retrieval System) System Parameter', 'System Parameter');
INSERT INTO journal_details VALUES ('374', '304', 'attr', 'subject', '(Cloud Retrieval System) but no only - Deployement of WAR file on Tomcat ', 'Deployement of WAR file on Tomcat ');
INSERT INTO journal_details VALUES ('375', '305', 'attr', 'subject', '(Cloud Retrieval System) but no only - Continuous Integration with Automated Build and Tests Execution', 'Continuous Integration with Automated Build and Tests Execution');
INSERT INTO journal_details VALUES ('376', '306', 'attr', 'subject', '(Cloud Retrieval System) - External system configuration parameters', 'External system configuration parameters');
INSERT INTO journal_details VALUES ('377', '307', 'attr', 'subject', '(Cloud Retrieval System) - Clean sql script to build the database', 'Clean sql script to build the database');
INSERT INTO journal_details VALUES ('378', '308', 'attr', 'subject', '(Cloud Retrieval System) but no only - Two separate \'devt\' and \'prod\' environments', 'Two separate \'devt\' and \'prod\' environments');
INSERT INTO journal_details VALUES ('379', '309', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('380', '309', 'attr', 'subject', '(Cloud Retrieval System) - Vehicle Trajectory [GIS] show image and video', 'Vehicle Trajectory [GIS] show image and video');
INSERT INTO journal_details VALUES ('381', '310', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('382', '310', 'attr', 'subject', '(Cloud Retrieval System) - GIS search, display the status + cancel action.', 'GIS search, display the status + cancel action.');
INSERT INTO journal_details VALUES ('383', '311', 'attr', 'subject', '(Cloud Retrieval System) but no only - Keeping always clean SVN repository', 'Keeping always clean SVN repository');
INSERT INTO journal_details VALUES ('384', '312', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('385', '312', 'attr', 'subject', '(Cloud Retrieval System) - seeking in windows media player when paused', 'seeking in windows media player when paused');
INSERT INTO journal_details VALUES ('386', '313', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('387', '313', 'attr', 'subject', '(Cloud Retrieval System) - report & statistics no line for non continuous phenomenon ', 'report & statistics no line for non continuous phenomenon ');
INSERT INTO journal_details VALUES ('388', '314', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('389', '314', 'attr', 'subject', '(Cloud Retrieval System) - The curve chart is improper ', 'The curve chart is improper ');
INSERT INTO journal_details VALUES ('390', '315', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('391', '315', 'attr', 'subject', '(Cloud Retrieval System) auto-refresh function', ' auto-refresh function');
INSERT INTO journal_details VALUES ('392', '316', 'attr', 'project_id', '9', '19');
INSERT INTO journal_details VALUES ('393', '316', 'attr', 'subject', '(Cloud Retrieval System) clean the project code.', 'clean the project code.');
INSERT INTO journal_details VALUES ('394', '317', 'attachment', '166', null, 'QQscreenshot .jpg');
INSERT INTO journal_details VALUES ('395', '317', 'attr', 'subject', '(Cloud Retrieval System)-status of tasks', 'status of tasks');
INSERT INTO journal_details VALUES ('396', '318', 'attr', 'status_id', '3', '2');
INSERT INTO journal_details VALUES ('397', '318', 'attr', 'done_ratio', '100', '60');
INSERT INTO journal_details VALUES ('398', '319', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('399', '319', 'attr', 'subject', '(Cloud Retrieval System)-New function-Make web app internationalization.', 'New function-Make web app internationalization.');
INSERT INTO journal_details VALUES ('400', '320', 'attr', 'project_id', '9', '14');
INSERT INTO journal_details VALUES ('401', '320', 'attr', 'subject', '(Cloud Retrieval System)-new function-Image Enhancement', 'new function-Image Enhancement');
INSERT INTO journal_details VALUES ('402', '321', 'attr', 'subject', '(Cloud Retrieval System)-new function-Touch screen and voice entering', 'new function-Touch screen and voice entering');
INSERT INTO journal_details VALUES ('403', '322', 'attr', 'project_id', '14', '9');
INSERT INTO journal_details VALUES ('404', '323', 'attr', 'project_id', '9', '20');
INSERT INTO journal_details VALUES ('405', '323', 'attr', 'subject', '(Cloud Retrieval System)-new function-Case Management', 'new function-Case Management');
INSERT INTO journal_details VALUES ('406', '324', 'attr', 'project_id', '9', '20');
INSERT INTO journal_details VALUES ('407', '324', 'attr', 'subject', '(Cloud Retrieval System)-new function-labeling the suspicious vehicle in the video', 'new function-labeling the suspicious vehicle in the video');
INSERT INTO journal_details VALUES ('408', '325', 'attr', 'project_id', '9', '20');
INSERT INTO journal_details VALUES ('409', '325', 'attr', 'subject', '(Cloud Retrieval System)-new function-labeling and retrivel of suspicious vehicle', 'new function-labeling and retrivel of suspicious vehicle');
INSERT INTO journal_details VALUES ('410', '326', 'attr', 'project_id', '9', '20');
INSERT INTO journal_details VALUES ('411', '326', 'attr', 'subject', '(Cloud Retrieval System)-new function-video distribution', 'new function-video distribution');
INSERT INTO journal_details VALUES ('412', '327', 'attr', 'project_id', '9', '13');
INSERT INTO journal_details VALUES ('413', '328', 'attr', 'subject', 'Image Enhancement', '(ITS)Image Enhancement');
INSERT INTO journal_details VALUES ('414', '329', 'attr', 'done_ratio', '10', '30');
INSERT INTO journal_details VALUES ('415', '330', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('416', '330', 'attr', 'done_ratio', '80', '100');
INSERT INTO journal_details VALUES ('417', '331', 'attachment', '167', null, 'fileupload20130830171710.png');
INSERT INTO journal_details VALUES ('418', '331', 'attr', 'due_date', '2013-08-29', '2013-09-03');
INSERT INTO journal_details VALUES ('419', '331', 'attr', 'done_ratio', '0', '60');
INSERT INTO journal_details VALUES ('420', '332', 'attachment', '168', null, 'image_missing.png');
INSERT INTO journal_details VALUES ('421', '333', 'attachment', '169', null, 'image_missing2.png');
INSERT INTO journal_details VALUES ('422', '335', 'attr', 'done_ratio', '30', '60');
INSERT INTO journal_details VALUES ('423', '336', 'attr', 'done_ratio', '60', '90');
INSERT INTO journal_details VALUES ('424', '339', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('425', '339', 'attr', 'done_ratio', '60', '100');
INSERT INTO journal_details VALUES ('426', '340', 'attachment', '170', null, 'fileupload20130903154715.jpg');
INSERT INTO journal_details VALUES ('427', '341', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('428', '341', 'attr', 'done_ratio', '90', '100');
INSERT INTO journal_details VALUES ('429', '342', 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details VALUES ('430', '345', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('431', '345', 'attr', 'done_ratio', '0', '20');
INSERT INTO journal_details VALUES ('432', '346', 'attr', 'project_id', '9', '13');
INSERT INTO journal_details VALUES ('433', '347', 'attr', 'assigned_to_id', null, '3');
INSERT INTO journal_details VALUES ('434', '348', 'attr', 'due_date', null, '2013-09-06');
INSERT INTO journal_details VALUES ('435', '349', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('436', '350', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('437', '351', 'attr', 'done_ratio', '20', '50');
INSERT INTO journal_details VALUES ('438', '352', 'attr', 'done_ratio', '10', '30');
INSERT INTO journal_details VALUES ('439', '353', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('440', '353', 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details VALUES ('441', '354', 'attr', 'subject', 'Connect Lingyun camera.', 'Integrate  Lingyun camera.');
INSERT INTO journal_details VALUES ('442', '355', 'attr', 'done_ratio', '0', '10');
INSERT INTO journal_details VALUES ('443', '356', 'attr', 'done_ratio', '30', '50');
INSERT INTO journal_details VALUES ('444', '357', 'attr', 'done_ratio', '50', '70');
INSERT INTO journal_details VALUES ('445', '358', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('446', '358', 'attr', 'done_ratio', '70', '100');
INSERT INTO journal_details VALUES ('447', '359', 'attr', 'done_ratio', '10', '60');
INSERT INTO journal_details VALUES ('448', '361', 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details VALUES ('449', '362', 'attr', 'status_id', '1', '2');
INSERT INTO journal_details VALUES ('450', '362', 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details VALUES ('451', '363', 'attr', 'status_id', '2', '3');
INSERT INTO journal_details VALUES ('452', '363', 'attr', 'done_ratio', '50', '100');

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO members VALUES ('1', '10', '2', '2013-04-26 16:35:02', '0');
INSERT INTO members VALUES ('2', '5', '2', '2013-04-26 16:35:02', '0');
INSERT INTO members VALUES ('4', '6', '2', '2013-04-26 16:35:02', '0');
INSERT INTO members VALUES ('5', '10', '1', '2013-04-26 17:22:38', '0');
INSERT INTO members VALUES ('6', '4', '1', '2013-04-26 17:22:38', '0');
INSERT INTO members VALUES ('8', '4', '4', '2013-04-26 18:12:18', '0');
INSERT INTO members VALUES ('11', '8', '4', '2013-04-26 18:12:18', '0');
INSERT INTO members VALUES ('12', '9', '4', '2013-04-26 18:12:18', '0');
INSERT INTO members VALUES ('13', '12', '4', '2013-04-26 18:12:35', '0');
INSERT INTO members VALUES ('14', '13', '3', '2013-04-26 18:14:43', '0');
INSERT INTO members VALUES ('15', '4', '3', '2013-04-26 18:15:06', '0');
INSERT INTO members VALUES ('17', '8', '3', '2013-04-26 18:15:06', '0');
INSERT INTO members VALUES ('18', '9', '3', '2013-04-26 18:15:06', '0');
INSERT INTO members VALUES ('19', '10', '5', '2013-04-26 18:23:24', '0');
INSERT INTO members VALUES ('20', '5', '5', '2013-04-26 18:23:25', '0');
INSERT INTO members VALUES ('21', '6', '5', '2013-04-26 21:27:56', '0');
INSERT INTO members VALUES ('22', '10', '6', '2013-04-27 09:58:02', '0');
INSERT INTO members VALUES ('24', '12', '6', '2013-04-27 09:58:02', '0');
INSERT INTO members VALUES ('25', '13', '6', '2013-04-27 09:58:02', '0');
INSERT INTO members VALUES ('26', '9', '6', '2013-04-27 09:58:02', '0');
INSERT INTO members VALUES ('27', '6', '6', '2013-04-27 09:58:20', '0');
INSERT INTO members VALUES ('29', '6', '7', '2013-04-27 10:21:30', '0');
INSERT INTO members VALUES ('31', '16', '7', '2013-04-27 10:26:10', '0');
INSERT INTO members VALUES ('32', '10', '8', '2013-04-27 11:02:00', '0');
INSERT INTO members VALUES ('34', '12', '8', '2013-04-27 11:02:00', '0');
INSERT INTO members VALUES ('35', '13', '8', '2013-04-27 11:02:00', '0');
INSERT INTO members VALUES ('37', '6', '8', '2013-04-27 11:02:10', '0');
INSERT INTO members VALUES ('38', '4', '2', '2013-04-27 11:40:17', '0');
INSERT INTO members VALUES ('47', '11', '1', '2013-04-27 14:52:21', '0');
INSERT INTO members VALUES ('48', '8', '1', '2013-04-27 14:52:21', '0');
INSERT INTO members VALUES ('49', '10', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('50', '5', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('51', '4', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('52', '12', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('53', '6', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('54', '13', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('55', '9', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('56', '17', '9', '2013-04-27 14:52:43', '0');
INSERT INTO members VALUES ('60', '3', '3', '2013-04-27 15:06:17', '0');
INSERT INTO members VALUES ('61', '18', '9', '2013-04-27 16:12:38', '0');
INSERT INTO members VALUES ('62', '19', '9', '2013-04-27 16:13:22', '0');
INSERT INTO members VALUES ('63', '10', '4', '2013-05-08 13:08:16', '0');
INSERT INTO members VALUES ('64', '10', '3', '2013-05-08 13:17:25', '0');
INSERT INTO members VALUES ('65', '20', '8', '2013-05-08 13:22:25', '0');
INSERT INTO members VALUES ('66', '3', '9', '2013-05-08 13:25:12', '0');
INSERT INTO members VALUES ('67', '3', '2', '2013-05-08 13:30:48', '0');
INSERT INTO members VALUES ('68', '4', '11', '2013-05-14 10:29:44', '0');
INSERT INTO members VALUES ('69', '8', '11', '2013-05-14 10:29:44', '0');
INSERT INTO members VALUES ('70', '9', '11', '2013-05-14 10:29:49', '0');
INSERT INTO members VALUES ('71', '12', '11', '2013-05-14 10:30:14', '0');
INSERT INTO members VALUES ('72', '13', '11', '2013-05-14 10:30:14', '0');
INSERT INTO members VALUES ('73', '10', '11', '2013-05-14 10:30:35', '0');
INSERT INTO members VALUES ('74', '6', '11', '2013-05-14 10:30:35', '0');
INSERT INTO members VALUES ('75', '19', '2', '2013-06-03 16:23:55', '0');
INSERT INTO members VALUES ('76', '9', '2', '2013-06-09 15:20:32', '0');
INSERT INTO members VALUES ('77', '10', '12', '2013-06-24 15:03:18', '0');
INSERT INTO members VALUES ('78', '6', '12', '2013-06-24 15:03:18', '0');
INSERT INTO members VALUES ('79', '3', '12', '2013-06-24 15:03:29', '0');
INSERT INTO members VALUES ('80', '18', '2', '2013-07-02 17:05:41', '0');
INSERT INTO members VALUES ('81', '10', '13', '2013-08-19 11:17:19', '0');
INSERT INTO members VALUES ('82', '5', '13', '2013-08-19 11:17:19', '0');
INSERT INTO members VALUES ('83', '4', '13', '2013-08-19 11:17:19', '0');
INSERT INTO members VALUES ('84', '12', '13', '2013-08-19 11:17:19', '0');
INSERT INTO members VALUES ('85', '6', '13', '2013-08-19 11:17:19', '0');
INSERT INTO members VALUES ('86', '13', '13', '2013-08-19 11:17:19', '0');
INSERT INTO members VALUES ('87', '9', '13', '2013-08-19 11:17:20', '0');
INSERT INTO members VALUES ('88', '17', '13', '2013-08-19 11:17:20', '0');
INSERT INTO members VALUES ('89', '18', '13', '2013-08-19 11:17:20', '0');
INSERT INTO members VALUES ('90', '19', '13', '2013-08-19 11:17:20', '0');
INSERT INTO members VALUES ('91', '3', '13', '2013-08-19 11:17:20', '0');
INSERT INTO members VALUES ('92', '10', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('93', '5', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('94', '4', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('95', '12', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('96', '6', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('97', '13', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('98', '9', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('99', '17', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('100', '18', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('101', '19', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('102', '3', '14', '2013-08-19 11:17:45', '0');
INSERT INTO members VALUES ('114', '5', '3', '2013-08-19 12:33:48', '0');
INSERT INTO members VALUES ('137', '10', '19', '2013-08-30 09:46:14', '0');
INSERT INTO members VALUES ('138', '5', '19', '2013-08-30 09:46:14', '0');
INSERT INTO members VALUES ('139', '4', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('140', '12', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('141', '6', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('142', '13', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('143', '9', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('144', '17', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('145', '18', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('146', '19', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('147', '3', '19', '2013-08-30 09:46:15', '0');
INSERT INTO members VALUES ('148', '10', '20', '2013-08-30 09:48:23', '0');
INSERT INTO members VALUES ('149', '5', '20', '2013-08-30 09:48:23', '0');
INSERT INTO members VALUES ('150', '4', '20', '2013-08-30 09:48:23', '0');
INSERT INTO members VALUES ('151', '12', '20', '2013-08-30 09:48:23', '0');
INSERT INTO members VALUES ('152', '6', '20', '2013-08-30 09:48:23', '0');
INSERT INTO members VALUES ('153', '13', '20', '2013-08-30 09:48:24', '0');
INSERT INTO members VALUES ('154', '9', '20', '2013-08-30 09:48:24', '0');
INSERT INTO members VALUES ('155', '17', '20', '2013-08-30 09:48:24', '0');
INSERT INTO members VALUES ('156', '18', '20', '2013-08-30 09:48:24', '0');
INSERT INTO members VALUES ('157', '19', '20', '2013-08-30 09:48:24', '0');
INSERT INTO members VALUES ('158', '3', '20', '2013-08-30 09:48:24', '0');
INSERT INTO members VALUES ('159', '5', '4', '2013-09-12 15:17:02', '0');
INSERT INTO members VALUES ('160', '6', '4', '2013-09-12 15:17:24', '0');
INSERT INTO members VALUES ('161', '10', '21', '2013-09-16 10:30:04', '0');
INSERT INTO members VALUES ('162', '5', '21', '2013-09-16 10:30:04', '0');
INSERT INTO members VALUES ('163', '4', '21', '2013-09-16 10:30:04', '0');
INSERT INTO members VALUES ('164', '12', '21', '2013-09-16 10:30:04', '0');
INSERT INTO members VALUES ('165', '6', '21', '2013-09-16 10:30:04', '0');
INSERT INTO members VALUES ('166', '13', '21', '2013-09-16 10:30:05', '0');
INSERT INTO members VALUES ('167', '9', '21', '2013-09-16 10:30:05', '0');
INSERT INTO members VALUES ('168', '17', '21', '2013-09-16 10:30:05', '0');
INSERT INTO members VALUES ('169', '18', '21', '2013-09-16 10:30:05', '0');
INSERT INTO members VALUES ('170', '19', '21', '2013-09-16 10:30:05', '0');
INSERT INTO members VALUES ('171', '3', '21', '2013-09-16 10:30:05', '0');
INSERT INTO members VALUES ('172', '25', '3', '2013-09-26 14:05:16', '0');
INSERT INTO members VALUES ('173', '25', '4', '2013-09-26 14:05:49', '0');
INSERT INTO members VALUES ('174', '25', '9', '2013-09-26 14:59:58', '0');
INSERT INTO members VALUES ('175', '25', '14', '2013-09-26 14:59:58', '0');
INSERT INTO members VALUES ('176', '25', '19', '2013-09-26 14:59:58', '0');
INSERT INTO members VALUES ('177', '25', '20', '2013-09-26 14:59:58', '0');
INSERT INTO members VALUES ('178', '25', '13', '2013-09-26 14:59:58', '0');
INSERT INTO members VALUES ('179', '25', '21', '2013-09-26 14:59:58', '0');

-- ----------------------------
-- Table structure for `member_roles`
-- ----------------------------
DROP TABLE IF EXISTS `member_roles`;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_roles
-- ----------------------------
INSERT INTO member_roles VALUES ('2', '1', '4', null);
INSERT INTO member_roles VALUES ('13', '5', '3', null);
INSERT INTO member_roles VALUES ('14', '5', '4', null);
INSERT INTO member_roles VALUES ('15', '5', '5', null);
INSERT INTO member_roles VALUES ('16', '6', '3', null);
INSERT INTO member_roles VALUES ('17', '6', '4', null);
INSERT INTO member_roles VALUES ('18', '6', '5', null);
INSERT INTO member_roles VALUES ('22', '8', '4', null);
INSERT INTO member_roles VALUES ('25', '11', '4', null);
INSERT INTO member_roles VALUES ('26', '12', '4', null);
INSERT INTO member_roles VALUES ('29', '15', '4', null);
INSERT INTO member_roles VALUES ('31', '17', '4', null);
INSERT INTO member_roles VALUES ('32', '18', '4', null);
INSERT INTO member_roles VALUES ('33', '14', '4', null);
INSERT INTO member_roles VALUES ('34', '13', '4', null);
INSERT INTO member_roles VALUES ('35', '19', '3', null);
INSERT INTO member_roles VALUES ('37', '21', '3', null);
INSERT INTO member_roles VALUES ('38', '22', '4', null);
INSERT INTO member_roles VALUES ('40', '24', '4', null);
INSERT INTO member_roles VALUES ('41', '25', '4', null);
INSERT INTO member_roles VALUES ('42', '26', '4', null);
INSERT INTO member_roles VALUES ('44', '22', '5', null);
INSERT INTO member_roles VALUES ('45', '27', '5', null);
INSERT INTO member_roles VALUES ('49', '31', '4', null);
INSERT INTO member_roles VALUES ('50', '29', '5', null);
INSERT INTO member_roles VALUES ('56', '37', '7', null);
INSERT INTO member_roles VALUES ('112', '47', '7', null);
INSERT INTO member_roles VALUES ('113', '48', '7', '112');
INSERT INTO member_roles VALUES ('121', '56', '5', null);
INSERT INTO member_roles VALUES ('126', '61', '4', null);
INSERT INTO member_roles VALUES ('128', '56', '4', null);
INSERT INTO member_roles VALUES ('129', '62', '4', null);
INSERT INTO member_roles VALUES ('130', '62', '5', null);
INSERT INTO member_roles VALUES ('131', '50', '8', null);
INSERT INTO member_roles VALUES ('132', '51', '8', null);
INSERT INTO member_roles VALUES ('133', '52', '8', null);
INSERT INTO member_roles VALUES ('134', '53', '8', null);
INSERT INTO member_roles VALUES ('135', '55', '8', null);
INSERT INTO member_roles VALUES ('136', '54', '8', null);
INSERT INTO member_roles VALUES ('137', '49', '8', null);
INSERT INTO member_roles VALUES ('138', '63', '3', null);
INSERT INTO member_roles VALUES ('139', '13', '7', null);
INSERT INTO member_roles VALUES ('140', '60', '4', null);
INSERT INTO member_roles VALUES ('142', '14', '7', null);
INSERT INTO member_roles VALUES ('143', '64', '3', null);
INSERT INTO member_roles VALUES ('145', '32', '5', null);
INSERT INTO member_roles VALUES ('147', '35', '5', null);
INSERT INTO member_roles VALUES ('148', '34', '5', null);
INSERT INTO member_roles VALUES ('149', '37', '5', null);
INSERT INTO member_roles VALUES ('150', '65', '5', null);
INSERT INTO member_roles VALUES ('151', '65', '4', null);
INSERT INTO member_roles VALUES ('152', '32', '4', null);
INSERT INTO member_roles VALUES ('153', '34', '4', null);
INSERT INTO member_roles VALUES ('154', '35', '4', null);
INSERT INTO member_roles VALUES ('156', '66', '7', null);
INSERT INTO member_roles VALUES ('157', '66', '4', null);
INSERT INTO member_roles VALUES ('158', '61', '5', null);
INSERT INTO member_roles VALUES ('159', '66', '5', null);
INSERT INTO member_roles VALUES ('160', '49', '3', null);
INSERT INTO member_roles VALUES ('161', '1', '7', null);
INSERT INTO member_roles VALUES ('162', '2', '8', null);
INSERT INTO member_roles VALUES ('165', '67', '4', null);
INSERT INTO member_roles VALUES ('166', '4', '8', null);
INSERT INTO member_roles VALUES ('168', '38', '4', null);
INSERT INTO member_roles VALUES ('169', '4', '5', null);
INSERT INTO member_roles VALUES ('170', '20', '7', null);
INSERT INTO member_roles VALUES ('171', '19', '5', null);
INSERT INTO member_roles VALUES ('172', '21', '5', null);
INSERT INTO member_roles VALUES ('173', '68', '4', null);
INSERT INTO member_roles VALUES ('174', '69', '4', null);
INSERT INTO member_roles VALUES ('175', '70', '7', null);
INSERT INTO member_roles VALUES ('176', '70', '4', null);
INSERT INTO member_roles VALUES ('177', '71', '4', null);
INSERT INTO member_roles VALUES ('178', '72', '4', null);
INSERT INTO member_roles VALUES ('179', '73', '5', null);
INSERT INTO member_roles VALUES ('180', '74', '5', null);
INSERT INTO member_roles VALUES ('181', '75', '4', null);
INSERT INTO member_roles VALUES ('182', '76', '5', null);
INSERT INTO member_roles VALUES ('183', '77', '3', null);
INSERT INTO member_roles VALUES ('184', '78', '3', null);
INSERT INTO member_roles VALUES ('185', '79', '5', null);
INSERT INTO member_roles VALUES ('186', '80', '4', null);
INSERT INTO member_roles VALUES ('187', '67', '7', null);
INSERT INTO member_roles VALUES ('188', '81', '8', '137');
INSERT INTO member_roles VALUES ('189', '81', '3', '160');
INSERT INTO member_roles VALUES ('190', '82', '8', '131');
INSERT INTO member_roles VALUES ('191', '83', '8', '132');
INSERT INTO member_roles VALUES ('192', '84', '8', '133');
INSERT INTO member_roles VALUES ('193', '85', '8', '134');
INSERT INTO member_roles VALUES ('194', '86', '8', '136');
INSERT INTO member_roles VALUES ('195', '87', '8', '135');
INSERT INTO member_roles VALUES ('196', '88', '5', '121');
INSERT INTO member_roles VALUES ('197', '88', '4', '128');
INSERT INTO member_roles VALUES ('198', '89', '4', '126');
INSERT INTO member_roles VALUES ('199', '89', '5', '158');
INSERT INTO member_roles VALUES ('200', '90', '4', '129');
INSERT INTO member_roles VALUES ('201', '90', '5', '130');
INSERT INTO member_roles VALUES ('202', '91', '7', '156');
INSERT INTO member_roles VALUES ('203', '91', '4', '157');
INSERT INTO member_roles VALUES ('204', '91', '5', '159');
INSERT INTO member_roles VALUES ('205', '92', '8', '137');
INSERT INTO member_roles VALUES ('206', '92', '3', '160');
INSERT INTO member_roles VALUES ('207', '93', '8', '131');
INSERT INTO member_roles VALUES ('208', '94', '8', '132');
INSERT INTO member_roles VALUES ('209', '95', '8', '133');
INSERT INTO member_roles VALUES ('210', '96', '8', '134');
INSERT INTO member_roles VALUES ('211', '97', '8', '136');
INSERT INTO member_roles VALUES ('212', '98', '8', '135');
INSERT INTO member_roles VALUES ('213', '99', '5', '121');
INSERT INTO member_roles VALUES ('214', '99', '4', '128');
INSERT INTO member_roles VALUES ('215', '100', '4', '126');
INSERT INTO member_roles VALUES ('216', '100', '5', '158');
INSERT INTO member_roles VALUES ('217', '101', '4', '129');
INSERT INTO member_roles VALUES ('218', '101', '5', '130');
INSERT INTO member_roles VALUES ('219', '102', '7', '156');
INSERT INTO member_roles VALUES ('220', '102', '4', '157');
INSERT INTO member_roles VALUES ('221', '102', '5', '159');
INSERT INTO member_roles VALUES ('239', '114', '8', null);
INSERT INTO member_roles VALUES ('274', '137', '8', '205');
INSERT INTO member_roles VALUES ('275', '137', '3', '206');
INSERT INTO member_roles VALUES ('276', '138', '8', '207');
INSERT INTO member_roles VALUES ('277', '139', '8', '208');
INSERT INTO member_roles VALUES ('278', '140', '8', '209');
INSERT INTO member_roles VALUES ('279', '141', '8', '210');
INSERT INTO member_roles VALUES ('280', '142', '8', '211');
INSERT INTO member_roles VALUES ('281', '143', '8', '212');
INSERT INTO member_roles VALUES ('282', '144', '5', '213');
INSERT INTO member_roles VALUES ('283', '144', '4', '214');
INSERT INTO member_roles VALUES ('284', '145', '4', '215');
INSERT INTO member_roles VALUES ('285', '145', '5', '216');
INSERT INTO member_roles VALUES ('286', '146', '4', '217');
INSERT INTO member_roles VALUES ('287', '146', '5', '218');
INSERT INTO member_roles VALUES ('288', '147', '7', '219');
INSERT INTO member_roles VALUES ('289', '147', '4', '220');
INSERT INTO member_roles VALUES ('290', '147', '5', '221');
INSERT INTO member_roles VALUES ('291', '148', '8', '205');
INSERT INTO member_roles VALUES ('292', '148', '3', '206');
INSERT INTO member_roles VALUES ('293', '149', '8', '207');
INSERT INTO member_roles VALUES ('294', '150', '8', '208');
INSERT INTO member_roles VALUES ('295', '151', '8', '209');
INSERT INTO member_roles VALUES ('296', '152', '8', '210');
INSERT INTO member_roles VALUES ('297', '153', '8', '211');
INSERT INTO member_roles VALUES ('298', '154', '8', '212');
INSERT INTO member_roles VALUES ('299', '155', '5', '213');
INSERT INTO member_roles VALUES ('300', '155', '4', '214');
INSERT INTO member_roles VALUES ('301', '156', '4', '215');
INSERT INTO member_roles VALUES ('302', '156', '5', '216');
INSERT INTO member_roles VALUES ('303', '157', '4', '217');
INSERT INTO member_roles VALUES ('304', '157', '5', '218');
INSERT INTO member_roles VALUES ('305', '158', '7', '219');
INSERT INTO member_roles VALUES ('306', '158', '4', '220');
INSERT INTO member_roles VALUES ('307', '158', '5', '221');
INSERT INTO member_roles VALUES ('308', '159', '8', null);
INSERT INTO member_roles VALUES ('309', '160', '8', null);
INSERT INTO member_roles VALUES ('310', '161', '8', '137');
INSERT INTO member_roles VALUES ('311', '161', '3', '160');
INSERT INTO member_roles VALUES ('312', '162', '8', '131');
INSERT INTO member_roles VALUES ('313', '163', '8', '132');
INSERT INTO member_roles VALUES ('314', '164', '8', '133');
INSERT INTO member_roles VALUES ('315', '165', '8', '134');
INSERT INTO member_roles VALUES ('316', '166', '8', '136');
INSERT INTO member_roles VALUES ('317', '167', '8', '135');
INSERT INTO member_roles VALUES ('318', '168', '5', '121');
INSERT INTO member_roles VALUES ('319', '168', '4', '128');
INSERT INTO member_roles VALUES ('320', '169', '4', '126');
INSERT INTO member_roles VALUES ('321', '169', '5', '158');
INSERT INTO member_roles VALUES ('322', '170', '4', '129');
INSERT INTO member_roles VALUES ('323', '170', '5', '130');
INSERT INTO member_roles VALUES ('324', '171', '7', '156');
INSERT INTO member_roles VALUES ('325', '171', '4', '157');
INSERT INTO member_roles VALUES ('326', '171', '5', '159');
INSERT INTO member_roles VALUES ('327', '172', '5', null);
INSERT INTO member_roles VALUES ('328', '172', '8', null);
INSERT INTO member_roles VALUES ('329', '173', '5', null);
INSERT INTO member_roles VALUES ('330', '173', '8', null);
INSERT INTO member_roles VALUES ('331', '174', '5', null);
INSERT INTO member_roles VALUES ('332', '175', '5', '331');
INSERT INTO member_roles VALUES ('333', '176', '5', '332');
INSERT INTO member_roles VALUES ('334', '177', '5', '332');
INSERT INTO member_roles VALUES ('335', '178', '5', '331');
INSERT INTO member_roles VALUES ('336', '179', '5', '331');
INSERT INTO member_roles VALUES ('337', '174', '8', null);
INSERT INTO member_roles VALUES ('338', '175', '8', '337');
INSERT INTO member_roles VALUES ('339', '176', '8', '338');
INSERT INTO member_roles VALUES ('340', '177', '8', '338');
INSERT INTO member_roles VALUES ('341', '178', '8', '337');
INSERT INTO member_roles VALUES ('342', '179', '8', '337');

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO news VALUES ('1', '1', 'Teleframe WEB Entrance Address', 'Teleframe WEB Entrance Address', 'Teleframe WEB Entrance Address\r\n\r\nIntranet: http://10.168.1.250:8888 \r\nWAN:  http://teleframe.xicp.net\r\n      http://teleframe.xicp.net:8888 \r\n', '3', '2013-05-10 10:57:33', '0');
INSERT INTO news VALUES ('2', '2', 'Medianate user interface - new 1.11.7.1 version  ', 'http://10.168.1.160:8080/Flexv1.11.7.1/Medianate.html', 'http://10.168.1.160:8080/Flexv1.11.7.1/Medianate.html\r\n\r\nChinese menus are now in Chinese only, with no English.', '10', '2013-06-03 16:41:46', '1');
INSERT INTO news VALUES ('3', '2', 'Medianate user interface - new 1.11.9 version', 'New version with updated Chinese titles.', 'http://10.168.1.160:8080/Flexv1.11.9/Medianate.html\r\n', '10', '2013-06-08 15:45:44', '0');
INSERT INTO news VALUES ('4', '2', 'Medianate user interface - new 1.11.9.1 version', 'New version with last updated Chinese titles. ', 'http://10.168.1.160:8080/Flexv1.11.9.1/Medianate.html', '10', '2013-07-03 13:26:08', '0');
INSERT INTO news VALUES ('5', '2', 'Medianate client JAR files - revision r4582', 'Client JAR files to be used by web applications made in Java. ', 'This corresponds to the Medianate API r4582 that was installed on the +22/05/2013+. ', '10', '2013-07-04 13:59:18', '1');
INSERT INTO news VALUES ('6', '9', 'SVN Url Changed', 'SVN Url Changed.', 'h2. history: \r\nhttps://10.168.1.250/svn/TeleframeWeb/TeleframeMonitor \r\n\r\nh2. new:\r\nCloudretrieval: https://10..168.1.250/svn/TeleframeWeb/cloudretrieval/\r\nITS: https://10.168..1.250/svn/TeleframeWeb/monitorWeb/', '3', '2013-09-05 08:43:52', '0');
INSERT INTO news VALUES ('7', '2', 'This is a test', 'This is just a test.', 'Testing that the News service is working.', '10', '2013-09-26 14:22:55', '0');
INSERT INTO news VALUES ('8', '2', 'Medianate DEV and PROD environments', 'Two Medianate environements are now set up on the 10.168.1.160 machine. PROD for using current last release and DEV for testing new release.', 'PROD and DEV use 2 separate Tomcat servers and 2 different data bases.\r\n\r\nEvery time a new release of Medianate is available, it will be first deployed on DEV to validated. After validation, it will replaced the existing that is on PROD.\r\n\r\n*PROD environment:*\r\nsoap api: http://10.168.1.160:8080/api  \r\nuser interface: http://10.168.1.160:8080/Flexv1.11.9.1/Medianate.html\r\n\r\n*DEV environment:*\r\nsoap api: http://10.168.1.160:8083/api \r\nuser interface: http://10.168.1.160:8083/Flexv1.13.1/Medianate.html\r\n=> To be validated by the development team of the Cloud Retrieval System web application, so that we can install and use it on PROD.  ', '10', '2013-09-26 14:40:01', '0');
INSERT INTO news VALUES ('9', '2', 'New Medianate API (r4662)  and User Interface (v1.13.1) ', 'API rev 4662: http://10.168.1.160:8083/api\r\nUser Interface version 1.13.1: http://10.168.1.160:8083/Flexv1.13.1/Medianate.html', 'Available on DEV environment. To be validated as soon as possible to be installed on PROD.\r\nAPI rev 4662: http://10.168.1.160:8083/api\r\nUser Interface version 1.13.1: http://10.168.1.160:8083/Flexv1.13.1/Medianate.html\r\n\r\nPrevious client jars are still compatible with this version of API. No need tu update them.', '10', '2013-09-26 14:52:13', '0');

-- ----------------------------
-- Table structure for `open_id_authentication_associations`
-- ----------------------------
DROP TABLE IF EXISTS `open_id_authentication_associations`;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of open_id_authentication_associations
-- ----------------------------

-- ----------------------------
-- Table structure for `open_id_authentication_nonces`
-- ----------------------------
DROP TABLE IF EXISTS `open_id_authentication_nonces`;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of open_id_authentication_nonces
-- ----------------------------

-- ----------------------------
-- Table structure for `projects`
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO projects VALUES ('1', 'Redmine management', 'This project is for the follow of any configuration and installation information we need to know at Teleframe for the management of Redmine.\r\n ', '', '1', null, '2013-04-22 15:42:36', '2013-04-22 15:42:36', 'redmine-management', '1', '5', '6', '0');
INSERT INTO projects VALUES ('2', 'Cloud retrieval (Medianate)', 'This is the project for large scale offline video analysis based on Medianate', '', '1', null, '2013-04-26 15:58:27', '2013-04-26 15:58:27', 'cloud-retrieval-medianate', '1', '3', '4', '0');
INSERT INTO projects VALUES ('3', '智能交通 - Intelligent Traffic', '智能交通领域的电子警察系统，卡口监控系统，交通参数采集系统。\r\nElectrical policeman system, bayonet monitoring system. Traffic parameters sampling system. All these systems belong to intelligent traffic field. ', '', '1', null, '2013-04-26 17:59:31', '2013-08-19 12:33:31', 'telefram-epolice', '1', '29', '30', '1');
INSERT INTO projects VALUES ('4', '消防通道 - Fire Exit', '信帧消防通道智能检测系统\r\n室内烟火检测,消防通道堵塞检测,室外消防通道车辆占用\r\nIntelligent fire exit detection system. \r\nSmoke and fire detection in the house, fire exit blocking detection, vehicle improper placement in the fire exit outdoor.', '', '1', null, '2013-04-26 18:09:09', '2013-05-08 13:00:34', 'tf_fire_exit', '1', '31', '32', '1');
INSERT INTO projects VALUES ('5', 'Chinese - English translation', 'This project is mainly lead by Helen for any translation purpose.', '', '1', null, '2013-04-26 18:22:07', '2013-04-26 18:22:07', 'chinese-english-translation', '1', '1', '2', '0');
INSERT INTO projects VALUES ('6', '产品经理、平台经理周报 - Weekly reports of \'product\' & \'platform\' managers', '用于各产品经理、平台经理汇报周工作总结，下周工作安排', '', '1', null, '2013-04-27 09:56:25', '2013-05-08 12:29:06', 'zhoubao', '1', '9', '10', '0');
INSERT INTO projects VALUES ('7', '光电雷达智能分析系统 - Optoelectricity Radar Analysis System', '使用光电雷达对目标和火灾进行检测报警\r\nUsing optoelectricity radar to make detection and alarm for targets and fire\r\n', '', '1', null, '2013-04-27 10:20:35', '2013-05-08 12:43:24', 'guangdianleida', '1', '25', '26', '0');
INSERT INTO projects VALUES ('8', '公司网站与宣传彩页 - Company web site and brochures', '制作现有公司产品：智能卡口产品、消防通道检测产品、云检索产品、入侵检测嵌入式产品的宣传资料；\r\n对公司网站进行更新。', '', '1', null, '2013-04-27 11:01:06', '2013-05-08 12:48:07', 'webandpage', '1', '27', '28', '0');
INSERT INTO projects VALUES ('9', '信帧智能监控WEB系统 - Intelligent Monitoring Web Systems', 'There are the following system *existed* now:\r\n\r\n-Intelligent Transportation Electronic Police System\r\n\r\n-Cloud Based System\r\n  -Transportation Analysis System\r\n  -Vehicle Surveillance System ', '', '1', null, '2013-04-27 14:04:05', '2013-08-30 12:00:42', 'WEB', '1', '11', '22', '1');
INSERT INTO projects VALUES ('11', '信帧智能监控软件系统', '使用MFC开发公司各产品软件平台', '', '1', null, '2013-05-14 10:28:28', '2013-05-14 10:42:09', 'software_platform', '1', '23', '24', '0');
INSERT INTO projects VALUES ('12', 'Teleframe Official Website', '-> Update Teleframe website infomations\r\n\r\nFor more infomation please ask Xin.Huo(霍新)', '', '1', null, '2013-06-24 14:54:54', '2013-06-24 14:54:54', 'teleframe-official-website', '1', '7', '8', '0');
INSERT INTO projects VALUES ('13', 'Intelligent Transportation Electronic Police System', '', '', '1', '9', '2013-08-19 11:00:26', '2013-08-19 11:17:19', 'intelligent-transportation-electronic-police-system', '1', '18', '19', '1');
INSERT INTO projects VALUES ('14', 'Cloud Based Systems', 'There are two subprojects existed under this Cloud Based Systems,\r\nThey are:\r\n(A.1)Transportation Analysis System\r\n(A.2) Vehicle Surveillance System ', '', '1', '9', '2013-08-19 11:01:31', '2013-08-30 11:58:11', 'cloud-retrieval-system', '1', '12', '17', '1');
INSERT INTO projects VALUES ('19', 'Transportation Analysis System[交通分析系统]', 'The old project name is cloudretrieval.\r\n交通分析系统', '', '1', '14', '2013-08-30 09:46:14', '2013-09-16 10:42:51', 'transportation-analysis--system', '1', '13', '14', '1');
INSERT INTO projects VALUES ('20', 'Vehicle Surveillance System[车辆侦查系统]', 'The project is same with cloudretrieval.\r\n车辆侦查系统', '', '1', '14', '2013-08-30 09:48:23', '2013-09-16 10:43:25', 'vehicle-surveillance--system', '1', '15', '16', '1');
INSERT INTO projects VALUES ('21', 'Intelligent Transportation Gate System[智能交通卡口系统]', 'SVN: https://10.168.1.250/svn/kk/\r\nDatabase: mysql://10.168.1.250:3306/kk\r\n\r\nData: 2013.9.16', '', '1', '9', '2013-09-16 10:30:04', '2013-09-16 10:30:04', 'intelligent-transportation-gate-system', '1', '20', '21', '1');

-- ----------------------------
-- Table structure for `projects_trackers`
-- ----------------------------
DROP TABLE IF EXISTS `projects_trackers`;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects_trackers
-- ----------------------------
INSERT INTO projects_trackers VALUES ('1', '1');
INSERT INTO projects_trackers VALUES ('1', '2');
INSERT INTO projects_trackers VALUES ('1', '3');
INSERT INTO projects_trackers VALUES ('2', '1');
INSERT INTO projects_trackers VALUES ('2', '2');
INSERT INTO projects_trackers VALUES ('2', '3');
INSERT INTO projects_trackers VALUES ('3', '1');
INSERT INTO projects_trackers VALUES ('3', '2');
INSERT INTO projects_trackers VALUES ('3', '3');
INSERT INTO projects_trackers VALUES ('4', '1');
INSERT INTO projects_trackers VALUES ('4', '2');
INSERT INTO projects_trackers VALUES ('4', '3');
INSERT INTO projects_trackers VALUES ('5', '1');
INSERT INTO projects_trackers VALUES ('5', '2');
INSERT INTO projects_trackers VALUES ('5', '3');
INSERT INTO projects_trackers VALUES ('6', '1');
INSERT INTO projects_trackers VALUES ('6', '2');
INSERT INTO projects_trackers VALUES ('6', '3');
INSERT INTO projects_trackers VALUES ('7', '1');
INSERT INTO projects_trackers VALUES ('7', '2');
INSERT INTO projects_trackers VALUES ('7', '3');
INSERT INTO projects_trackers VALUES ('8', '1');
INSERT INTO projects_trackers VALUES ('8', '2');
INSERT INTO projects_trackers VALUES ('8', '3');
INSERT INTO projects_trackers VALUES ('9', '1');
INSERT INTO projects_trackers VALUES ('9', '2');
INSERT INTO projects_trackers VALUES ('9', '3');
INSERT INTO projects_trackers VALUES ('11', '3');
INSERT INTO projects_trackers VALUES ('12', '1');
INSERT INTO projects_trackers VALUES ('12', '2');
INSERT INTO projects_trackers VALUES ('12', '3');
INSERT INTO projects_trackers VALUES ('13', '1');
INSERT INTO projects_trackers VALUES ('13', '2');
INSERT INTO projects_trackers VALUES ('13', '3');
INSERT INTO projects_trackers VALUES ('14', '1');
INSERT INTO projects_trackers VALUES ('14', '2');
INSERT INTO projects_trackers VALUES ('14', '3');
INSERT INTO projects_trackers VALUES ('19', '1');
INSERT INTO projects_trackers VALUES ('19', '2');
INSERT INTO projects_trackers VALUES ('19', '3');
INSERT INTO projects_trackers VALUES ('20', '1');
INSERT INTO projects_trackers VALUES ('20', '2');
INSERT INTO projects_trackers VALUES ('20', '3');
INSERT INTO projects_trackers VALUES ('21', '1');
INSERT INTO projects_trackers VALUES ('21', '2');
INSERT INTO projects_trackers VALUES ('21', '3');

-- ----------------------------
-- Table structure for `queries`
-- ----------------------------
DROP TABLE IF EXISTS `queries`;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of queries
-- ----------------------------
INSERT INTO queries VALUES ('1', '9', '(Cloud Retrieval System) issues', '--- \nstatus_id: \n  :values: \n  - \"\"\n  :operator: o\nsubject: \n  :values: \n  - Cloud Retrieval System\n  :operator: \"~\"\n', '10', '1', '--- \n- :tracker\n- :status\n- :priority\n- :subject\n- :assigned_to\n- :updated_on\n- :done_ratio\n', '--- []\n\n', '', 'IssueQuery');

-- ----------------------------
-- Table structure for `repositories`
-- ----------------------------
DROP TABLE IF EXISTS `repositories`;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` text,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repositories
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO roles VALUES ('1', 'Non member', '2', '1', '1', '--- \n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default');
INSERT INTO roles VALUES ('2', 'Anonymous', '3', '1', '2', '--- \n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default');
INSERT INTO roles VALUES ('3', 'Manager', '7', '1', '0', '--- \n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :move_issues\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :manage_news\n- :comment_news\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :manage_wiki\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_repository\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :manage_boards\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_calendar\n- :view_gantt\n', 'all');
INSERT INTO roles VALUES ('4', 'Developer', '4', '1', '0', '--- \n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :add_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :save_queries\n- :view_issue_watchers\n- :comment_news\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :log_time\n- :view_time_entries\n- :edit_own_time_entries\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n', 'default');
INSERT INTO roles VALUES ('5', 'Reporter', '5', '1', '0', '--- \n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default');
INSERT INTO roles VALUES ('7', 'Project Manager ', '1', '1', '0', '--- \n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_boards\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :view_calendar\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :move_issues\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :manage_news\n- :comment_news\n- :manage_repository\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :manage_wiki\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n', 'all');
INSERT INTO roles VALUES ('8', 'Tracker', '6', '1', '0', '--- \n- :view_calendar\n- :add_documents\n- :edit_documents\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :set_issues_private\n- :add_issue_notes\n- :edit_own_issue_notes\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :comment_news\n- :browse_repository\n- :view_changesets\n- :view_time_entries\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n', 'default');

-- ----------------------------
-- Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO schema_migrations VALUES ('1');
INSERT INTO schema_migrations VALUES ('10');
INSERT INTO schema_migrations VALUES ('100');
INSERT INTO schema_migrations VALUES ('101');
INSERT INTO schema_migrations VALUES ('102');
INSERT INTO schema_migrations VALUES ('103');
INSERT INTO schema_migrations VALUES ('104');
INSERT INTO schema_migrations VALUES ('105');
INSERT INTO schema_migrations VALUES ('106');
INSERT INTO schema_migrations VALUES ('107');
INSERT INTO schema_migrations VALUES ('108');
INSERT INTO schema_migrations VALUES ('11');
INSERT INTO schema_migrations VALUES ('12');
INSERT INTO schema_migrations VALUES ('13');
INSERT INTO schema_migrations VALUES ('14');
INSERT INTO schema_migrations VALUES ('15');
INSERT INTO schema_migrations VALUES ('16');
INSERT INTO schema_migrations VALUES ('17');
INSERT INTO schema_migrations VALUES ('18');
INSERT INTO schema_migrations VALUES ('19');
INSERT INTO schema_migrations VALUES ('2');
INSERT INTO schema_migrations VALUES ('20');
INSERT INTO schema_migrations VALUES ('20090214190337');
INSERT INTO schema_migrations VALUES ('20090312172426');
INSERT INTO schema_migrations VALUES ('20090312194159');
INSERT INTO schema_migrations VALUES ('20090318181151');
INSERT INTO schema_migrations VALUES ('20090323224724');
INSERT INTO schema_migrations VALUES ('20090401221305');
INSERT INTO schema_migrations VALUES ('20090401231134');
INSERT INTO schema_migrations VALUES ('20090403001910');
INSERT INTO schema_migrations VALUES ('20090406161854');
INSERT INTO schema_migrations VALUES ('20090425161243');
INSERT INTO schema_migrations VALUES ('20090503121501');
INSERT INTO schema_migrations VALUES ('20090503121505');
INSERT INTO schema_migrations VALUES ('20090503121510');
INSERT INTO schema_migrations VALUES ('20090614091200');
INSERT INTO schema_migrations VALUES ('20090704172350');
INSERT INTO schema_migrations VALUES ('20090704172355');
INSERT INTO schema_migrations VALUES ('20090704172358');
INSERT INTO schema_migrations VALUES ('20091010093521');
INSERT INTO schema_migrations VALUES ('20091017212227');
INSERT INTO schema_migrations VALUES ('20091017212457');
INSERT INTO schema_migrations VALUES ('20091017212644');
INSERT INTO schema_migrations VALUES ('20091017212938');
INSERT INTO schema_migrations VALUES ('20091017213027');
INSERT INTO schema_migrations VALUES ('20091017213113');
INSERT INTO schema_migrations VALUES ('20091017213151');
INSERT INTO schema_migrations VALUES ('20091017213228');
INSERT INTO schema_migrations VALUES ('20091017213257');
INSERT INTO schema_migrations VALUES ('20091017213332');
INSERT INTO schema_migrations VALUES ('20091017213444');
INSERT INTO schema_migrations VALUES ('20091017213536');
INSERT INTO schema_migrations VALUES ('20091017213642');
INSERT INTO schema_migrations VALUES ('20091017213716');
INSERT INTO schema_migrations VALUES ('20091017213757');
INSERT INTO schema_migrations VALUES ('20091017213835');
INSERT INTO schema_migrations VALUES ('20091017213910');
INSERT INTO schema_migrations VALUES ('20091017214015');
INSERT INTO schema_migrations VALUES ('20091017214107');
INSERT INTO schema_migrations VALUES ('20091017214136');
INSERT INTO schema_migrations VALUES ('20091017214236');
INSERT INTO schema_migrations VALUES ('20091017214308');
INSERT INTO schema_migrations VALUES ('20091017214336');
INSERT INTO schema_migrations VALUES ('20091017214406');
INSERT INTO schema_migrations VALUES ('20091017214440');
INSERT INTO schema_migrations VALUES ('20091017214519');
INSERT INTO schema_migrations VALUES ('20091017214611');
INSERT INTO schema_migrations VALUES ('20091017214644');
INSERT INTO schema_migrations VALUES ('20091017214720');
INSERT INTO schema_migrations VALUES ('20091017214750');
INSERT INTO schema_migrations VALUES ('20091025163651');
INSERT INTO schema_migrations VALUES ('20091108092559');
INSERT INTO schema_migrations VALUES ('20091114105931');
INSERT INTO schema_migrations VALUES ('20091123212029');
INSERT INTO schema_migrations VALUES ('20091205124427');
INSERT INTO schema_migrations VALUES ('20091220183509');
INSERT INTO schema_migrations VALUES ('20091220183727');
INSERT INTO schema_migrations VALUES ('20091220184736');
INSERT INTO schema_migrations VALUES ('20091225164732');
INSERT INTO schema_migrations VALUES ('20091227112908');
INSERT INTO schema_migrations VALUES ('20100129193402');
INSERT INTO schema_migrations VALUES ('20100129193813');
INSERT INTO schema_migrations VALUES ('20100221100219');
INSERT INTO schema_migrations VALUES ('20100313132032');
INSERT INTO schema_migrations VALUES ('20100313171051');
INSERT INTO schema_migrations VALUES ('20100705164950');
INSERT INTO schema_migrations VALUES ('20100819172912');
INSERT INTO schema_migrations VALUES ('20101104182107');
INSERT INTO schema_migrations VALUES ('20101107130441');
INSERT INTO schema_migrations VALUES ('20101114115114');
INSERT INTO schema_migrations VALUES ('20101114115359');
INSERT INTO schema_migrations VALUES ('20110220160626');
INSERT INTO schema_migrations VALUES ('20110223180944');
INSERT INTO schema_migrations VALUES ('20110223180953');
INSERT INTO schema_migrations VALUES ('20110224000000');
INSERT INTO schema_migrations VALUES ('20110226120112');
INSERT INTO schema_migrations VALUES ('20110226120132');
INSERT INTO schema_migrations VALUES ('20110227125750');
INSERT INTO schema_migrations VALUES ('20110228000000');
INSERT INTO schema_migrations VALUES ('20110228000100');
INSERT INTO schema_migrations VALUES ('20110401192910');
INSERT INTO schema_migrations VALUES ('20110408103312');
INSERT INTO schema_migrations VALUES ('20110412065600');
INSERT INTO schema_migrations VALUES ('20110511000000');
INSERT INTO schema_migrations VALUES ('20110902000000');
INSERT INTO schema_migrations VALUES ('20111201201315');
INSERT INTO schema_migrations VALUES ('20120115143024');
INSERT INTO schema_migrations VALUES ('20120115143100');
INSERT INTO schema_migrations VALUES ('20120115143126');
INSERT INTO schema_migrations VALUES ('20120127174243');
INSERT INTO schema_migrations VALUES ('20120205111326');
INSERT INTO schema_migrations VALUES ('20120223110929');
INSERT INTO schema_migrations VALUES ('20120301153455');
INSERT INTO schema_migrations VALUES ('20120422150750');
INSERT INTO schema_migrations VALUES ('20120705074331');
INSERT INTO schema_migrations VALUES ('20120707064544');
INSERT INTO schema_migrations VALUES ('20120714122000');
INSERT INTO schema_migrations VALUES ('20120714122100');
INSERT INTO schema_migrations VALUES ('20120714122200');
INSERT INTO schema_migrations VALUES ('20120731164049');
INSERT INTO schema_migrations VALUES ('20120930112914');
INSERT INTO schema_migrations VALUES ('20121026002032');
INSERT INTO schema_migrations VALUES ('20121026003537');
INSERT INTO schema_migrations VALUES ('20121209123234');
INSERT INTO schema_migrations VALUES ('20121209123358');
INSERT INTO schema_migrations VALUES ('20121213084931');
INSERT INTO schema_migrations VALUES ('20130110122628');
INSERT INTO schema_migrations VALUES ('20130201184705');
INSERT INTO schema_migrations VALUES ('20130202090625');
INSERT INTO schema_migrations VALUES ('20130207175206');
INSERT INTO schema_migrations VALUES ('20130207181455');
INSERT INTO schema_migrations VALUES ('20130215073721');
INSERT INTO schema_migrations VALUES ('20130215111127');
INSERT INTO schema_migrations VALUES ('20130215111141');
INSERT INTO schema_migrations VALUES ('20130217094251');
INSERT INTO schema_migrations VALUES ('21');
INSERT INTO schema_migrations VALUES ('22');
INSERT INTO schema_migrations VALUES ('23');
INSERT INTO schema_migrations VALUES ('24');
INSERT INTO schema_migrations VALUES ('25');
INSERT INTO schema_migrations VALUES ('26');
INSERT INTO schema_migrations VALUES ('27');
INSERT INTO schema_migrations VALUES ('28');
INSERT INTO schema_migrations VALUES ('29');
INSERT INTO schema_migrations VALUES ('3');
INSERT INTO schema_migrations VALUES ('30');
INSERT INTO schema_migrations VALUES ('31');
INSERT INTO schema_migrations VALUES ('32');
INSERT INTO schema_migrations VALUES ('33');
INSERT INTO schema_migrations VALUES ('34');
INSERT INTO schema_migrations VALUES ('35');
INSERT INTO schema_migrations VALUES ('36');
INSERT INTO schema_migrations VALUES ('37');
INSERT INTO schema_migrations VALUES ('38');
INSERT INTO schema_migrations VALUES ('39');
INSERT INTO schema_migrations VALUES ('4');
INSERT INTO schema_migrations VALUES ('40');
INSERT INTO schema_migrations VALUES ('41');
INSERT INTO schema_migrations VALUES ('42');
INSERT INTO schema_migrations VALUES ('43');
INSERT INTO schema_migrations VALUES ('44');
INSERT INTO schema_migrations VALUES ('45');
INSERT INTO schema_migrations VALUES ('46');
INSERT INTO schema_migrations VALUES ('47');
INSERT INTO schema_migrations VALUES ('48');
INSERT INTO schema_migrations VALUES ('49');
INSERT INTO schema_migrations VALUES ('5');
INSERT INTO schema_migrations VALUES ('50');
INSERT INTO schema_migrations VALUES ('51');
INSERT INTO schema_migrations VALUES ('52');
INSERT INTO schema_migrations VALUES ('53');
INSERT INTO schema_migrations VALUES ('54');
INSERT INTO schema_migrations VALUES ('55');
INSERT INTO schema_migrations VALUES ('56');
INSERT INTO schema_migrations VALUES ('57');
INSERT INTO schema_migrations VALUES ('58');
INSERT INTO schema_migrations VALUES ('59');
INSERT INTO schema_migrations VALUES ('6');
INSERT INTO schema_migrations VALUES ('60');
INSERT INTO schema_migrations VALUES ('61');
INSERT INTO schema_migrations VALUES ('62');
INSERT INTO schema_migrations VALUES ('63');
INSERT INTO schema_migrations VALUES ('64');
INSERT INTO schema_migrations VALUES ('65');
INSERT INTO schema_migrations VALUES ('66');
INSERT INTO schema_migrations VALUES ('67');
INSERT INTO schema_migrations VALUES ('68');
INSERT INTO schema_migrations VALUES ('69');
INSERT INTO schema_migrations VALUES ('7');
INSERT INTO schema_migrations VALUES ('70');
INSERT INTO schema_migrations VALUES ('71');
INSERT INTO schema_migrations VALUES ('72');
INSERT INTO schema_migrations VALUES ('73');
INSERT INTO schema_migrations VALUES ('74');
INSERT INTO schema_migrations VALUES ('75');
INSERT INTO schema_migrations VALUES ('76');
INSERT INTO schema_migrations VALUES ('77');
INSERT INTO schema_migrations VALUES ('78');
INSERT INTO schema_migrations VALUES ('79');
INSERT INTO schema_migrations VALUES ('8');
INSERT INTO schema_migrations VALUES ('80');
INSERT INTO schema_migrations VALUES ('81');
INSERT INTO schema_migrations VALUES ('82');
INSERT INTO schema_migrations VALUES ('83');
INSERT INTO schema_migrations VALUES ('84');
INSERT INTO schema_migrations VALUES ('85');
INSERT INTO schema_migrations VALUES ('86');
INSERT INTO schema_migrations VALUES ('87');
INSERT INTO schema_migrations VALUES ('88');
INSERT INTO schema_migrations VALUES ('89');
INSERT INTO schema_migrations VALUES ('9');
INSERT INTO schema_migrations VALUES ('90');
INSERT INTO schema_migrations VALUES ('91');
INSERT INTO schema_migrations VALUES ('92');
INSERT INTO schema_migrations VALUES ('93');
INSERT INTO schema_migrations VALUES ('94');
INSERT INTO schema_migrations VALUES ('95');
INSERT INTO schema_migrations VALUES ('96');
INSERT INTO schema_migrations VALUES ('97');
INSERT INTO schema_migrations VALUES ('98');
INSERT INTO schema_migrations VALUES ('99');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO settings VALUES ('1', 'diff_max_lines_displayed', '1500', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('2', 'cache_formatted_text', '0', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('3', 'activity_days_default', '30', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('4', 'host_name', 'teleframe.xicp.net:3000', '2013-04-27 15:21:13');
INSERT INTO settings VALUES ('5', 'per_page_options', '25,50,100', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('6', 'attachment_max_size', '100000', '2013-04-26 18:27:12');
INSERT INTO settings VALUES ('7', 'app_title', 'Teleframe Projects Management', '2013-04-26 16:32:49');
INSERT INTO settings VALUES ('8', 'file_max_size_displayed', '1024', '2013-08-02 10:03:44');
INSERT INTO settings VALUES ('9', 'protocol', 'http', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('10', 'repositories_encodings', '', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('11', 'wiki_compression', '', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('12', 'feeds_limit', '15', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('13', 'text_formatting', 'textile', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('14', 'welcome_text', 'This the project management server of Teleframe', '2013-04-26 16:32:35');
INSERT INTO settings VALUES ('15', 'bcc_recipients', '0', '2013-04-26 17:02:33');
INSERT INTO settings VALUES ('16', 'mail_from', 'redmine-noreply@teleframe.cn', '2013-04-26 17:43:44');
INSERT INTO settings VALUES ('17', 'default_notification_option', 'only_my_events', '2013-04-26 17:02:33');
INSERT INTO settings VALUES ('18', 'emails_header', 'Hello,', '2013-04-26 18:23:03');
INSERT INTO settings VALUES ('19', 'plain_text_mail', '0', '2013-04-26 17:03:02');
INSERT INTO settings VALUES ('20', 'notified_events', '--- \n- issue_added\n- issue_updated\n- issue_note_added\n- issue_status_updated\n- issue_priority_updated\n- news_added\n- news_comment_added\n- document_added\n- file_added\n- message_posted\n- wiki_content_added\n- wiki_content_updated\n', '2013-07-09 11:00:02');
INSERT INTO settings VALUES ('21', 'emails_footer', 'You have received this notification because you have either subscribed to it, or are involved in it.\r\nTo change your notification preferences, please click here: http://teleframe.xicp.net:3000/my/account', '2013-04-28 10:24:03');
INSERT INTO settings VALUES ('22', 'password_min_length', '4', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('23', 'self_registration', '2', '2013-05-02 14:31:46');
INSERT INTO settings VALUES ('24', 'session_timeout', '0', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('25', 'openid', '0', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('26', 'lost_password', '1', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('27', 'jsonp_enabled', '0', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('28', 'login_required', '1', '2013-05-02 14:31:46');
INSERT INTO settings VALUES ('29', 'autologin', '1', '2013-04-27 13:45:14');
INSERT INTO settings VALUES ('30', 'session_lifetime', '0', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('31', 'rest_api_enabled', '0', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('32', 'unsubscribe', '1', '2013-04-26 17:14:40');
INSERT INTO settings VALUES ('33', 'ui_theme', 'classic', '2013-04-26 17:15:00');
INSERT INTO settings VALUES ('34', 'thumbnails_size', '100', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('35', 'date_format', '', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('36', 'thumbnails_enabled', '0', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('37', 'default_language', 'en', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('38', 'gravatar_default', '', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('39', 'gravatar_enabled', '0', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('40', 'start_of_week', '', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('41', 'user_format', 'firstname_lastname', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('42', 'time_format', '', '2013-04-26 17:14:55');
INSERT INTO settings VALUES ('43', 'default_projects_public', '1', '2013-05-09 15:40:29');
INSERT INTO settings VALUES ('44', 'sequential_project_identifiers', '0', '2013-05-09 15:40:29');
INSERT INTO settings VALUES ('45', 'default_projects_modules', '--- \n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n', '2013-05-09 15:40:29');
INSERT INTO settings VALUES ('46', 'default_projects_tracker_ids', '--- \n- \"3\"\n', '2013-05-09 15:40:29');
INSERT INTO settings VALUES ('47', 'new_project_user_role_id', '7', '2013-08-02 10:05:26');
INSERT INTO settings VALUES ('48', 'sys_api_enabled', '0', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('49', 'commit_cross_project_ref', '0', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('50', 'commit_ref_keywords', 'refs,references,IssueID', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('51', 'enabled_scm', '--- \n- Subversion\n- Mercurial\n- Cvs\n- Bazaar\n- Git\n', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('52', 'repository_log_display_limit', '100', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('53', 'autofetch_changesets', '1', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('54', 'commit_logtime_enabled', '0', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('55', 'commit_fix_done_ratio', '100', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('56', 'commit_fix_status_id', '0', '2013-08-02 10:06:59');
INSERT INTO settings VALUES ('57', 'commit_fix_keywords', 'fixes,closes', '2013-08-02 10:06:59');

-- ----------------------------
-- Table structure for `time_entries`
-- ----------------------------
DROP TABLE IF EXISTS `time_entries`;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time_entries
-- ----------------------------
INSERT INTO time_entries VALUES ('1', '19', '3', '63', '34', '', '9', '2013-06-27', '2013', '6', '26', '2013-06-27 10:37:53', '2013-06-27 10:37:53');
INSERT INTO time_entries VALUES ('2', '19', '3', '62', '34', '', '9', '2013-06-27', '2013', '6', '26', '2013-06-27 10:41:26', '2013-06-27 10:41:26');

-- ----------------------------
-- Table structure for `tokens`
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO tokens VALUES ('1', '1', 'feeds', '1d5082c4c32dfd8d110cec5ccdbe494090acd5af', '2013-04-22 15:31:32');
INSERT INTO tokens VALUES ('2', '3', 'feeds', '4915a6d13e6d8a0fea8edae5edb5bd689e92d4f3', '2013-04-22 16:12:15');
INSERT INTO tokens VALUES ('3', '4', 'feeds', '139973083514c64f63e6ab4b0796bd4a709382d5', '2013-04-22 17:44:15');
INSERT INTO tokens VALUES ('4', '5', 'feeds', '1f6906c5b61545704bc3e89434da926ab66fea28', '2013-04-23 10:15:01');
INSERT INTO tokens VALUES ('5', '8', 'feeds', '79610662b05b3cd93990aa609bcfc01c9494dba2', '2013-04-23 13:42:00');
INSERT INTO tokens VALUES ('6', '9', 'feeds', '29fe59f8071c8757e8cc3cd03146375a6a0ec477', '2013-04-26 14:53:28');
INSERT INTO tokens VALUES ('7', '6', 'feeds', 'af4cda7ce075fad8b4b8bc2376d6f428f1b5f4d4', '2013-04-26 15:35:22');
INSERT INTO tokens VALUES ('8', '10', 'feeds', '095421bd740704c9a9fc55a58d42be0481292cbd', '2013-04-26 15:45:37');
INSERT INTO tokens VALUES ('9', '12', 'feeds', 'd2a1592ad886f7f0a890b76037d0cf656b85683f', '2013-04-26 16:14:52');
INSERT INTO tokens VALUES ('10', '13', 'feeds', '1ce0e20a5e8b75e86616b2d26968d2764bd4c565', '2013-04-26 17:49:40');
INSERT INTO tokens VALUES ('11', '16', 'feeds', 'f5d1e207841422e11421e93fadae3032e403dcef', '2013-04-27 10:56:10');
INSERT INTO tokens VALUES ('13', '18', 'register', 'e76cb313e1d0023c3c097a037130a6d380fc5e44', '2013-04-27 16:10:58');
INSERT INTO tokens VALUES ('14', '18', 'feeds', '16f7a9a22f2e541d59b90431eb34e537106611f5', '2013-04-27 16:11:56');
INSERT INTO tokens VALUES ('15', '19', 'register', '6b6341780baa175f2e81e2d0b509ece914393279', '2013-04-27 16:12:35');
INSERT INTO tokens VALUES ('16', '19', 'feeds', 'aa9300549d813d47cb711fd192b7765616e77f59', '2013-04-27 16:13:14');
INSERT INTO tokens VALUES ('18', '20', 'feeds', '2552a761ed0c58f260d91a49490ce42f06b7e8f4', '2013-04-27 16:26:06');
INSERT INTO tokens VALUES ('29', '9', 'autologin', 'fb76ee398da19291504465f1e75fa90cf3b79470', '2013-05-08 17:24:06');
INSERT INTO tokens VALUES ('35', '21', 'autologin', 'd7f81e43a0e7e82e484b675ad52b5ee3e1ac0ab1', '2013-05-13 14:25:57');
INSERT INTO tokens VALUES ('36', '21', 'feeds', 'b0756d5fd1abc538b160c902251fe65dd82f7442', '2013-05-13 14:25:57');
INSERT INTO tokens VALUES ('47', '3', 'autologin', '680989cba9350fbb0a3560654f06c45f5dc1d21a', '2013-05-28 09:55:59');
INSERT INTO tokens VALUES ('49', '22', 'feeds', 'c6a8e1a5bfb8ffaa6d510475e789a98024243365', '2013-05-28 09:59:48');
INSERT INTO tokens VALUES ('50', '22', 'autologin', '97e7a22678223b06926988c2118463f5d4947156', '2013-05-28 10:00:25');
INSERT INTO tokens VALUES ('55', '13', 'autologin', '4a87999ca19484929f2ce5b83b31680cc74de391', '2013-05-29 09:18:11');
INSERT INTO tokens VALUES ('56', '8', 'autologin', 'a51cb159026c8081dd9c19d2fb7b79606d306585', '2013-05-29 10:27:15');
INSERT INTO tokens VALUES ('72', '23', 'feeds', '24fc02ea98cff81dabb2a46d4f4fe1eb08a86c37', '2013-07-02 16:40:40');
INSERT INTO tokens VALUES ('74', '23', 'autologin', '3157ef9de7b6cb40ad0e5d9d8886a40646fc8d17', '2013-07-03 11:05:27');
INSERT INTO tokens VALUES ('101', '6', 'autologin', 'ac0573053811a4ed881795d669b2a68e034a3fb3', '2013-08-31 09:59:29');
INSERT INTO tokens VALUES ('105', '25', 'feeds', '1013622a4e06d35859c11a3a8e83a22cd3f3c612', '2013-09-26 13:58:03');
INSERT INTO tokens VALUES ('106', '19', 'autologin', '0aedb7efa03b94f799770f586c12599ebbf8dfdb', '2013-10-09 10:32:01');

-- ----------------------------
-- Table structure for `trackers`
-- ----------------------------
DROP TABLE IF EXISTS `trackers`;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trackers
-- ----------------------------
INSERT INTO trackers VALUES ('1', 'Bug', '1', '1', '0', '0');
INSERT INTO trackers VALUES ('2', 'Feature', '1', '2', '1', '0');
INSERT INTO trackers VALUES ('3', 'Support', '0', '3', '0', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(60) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'admin', '076c7018326cde0389fafd3892c6062b1d68db9b', 'Redmine', 'Admin', 'admin@example.net', '1', '3', '2013-04-23 10:13:27', '', null, '2013-04-22 15:09:50', '2013-04-23 10:20:50', 'User', null, 'all', '8a0f13ca35e37f41b550abd9e88789dc');
INSERT INTO users VALUES ('2', '', '', '', 'Anonymous', '', '0', '0', null, '', null, '2013-04-22 15:30:13', '2013-04-22 15:30:13', 'AnonymousUser', null, 'only_my_events', null);
INSERT INTO users VALUES ('3', 'karl.li', 'db4b7584201681ba212589ffbd390f0cd016927f', 'Karl', '李建', 'karl.li@teleframe.cn', '1', '1', '2014-01-06 10:47:39', 'en', null, '2013-04-22 16:10:59', '2013-09-23 15:32:17', 'User', null, 'only_my_events', 'fd24ca874643756ebef95de16f691b13');
INSERT INTO users VALUES ('4', 'jianbo.du', 'bc67d799d6b2edc67640c8a8b250b8ce220e9cf7', 'jianbo', '杜剑波', 'jianbo.du@teleframe.cn', '1', '3', '2013-05-13 09:41:09', 'zh', null, '2013-04-22 17:40:46', '2013-08-19 12:28:10', 'User', null, 'only_my_events', '46f19a1658fce7a31b879793a9e01aa5');
INSERT INTO users VALUES ('5', 'helen', '91492f8004a86df500442d2a9fb204f4c3ac2463', 'helen', '王任', 'ren.wang@teleframe.cn', '1', '1', '2014-01-06 11:09:02', 'zh', null, '2013-04-23 10:13:10', '2013-05-09 09:31:33', 'User', null, 'only_my_events', 'eddbc1ae34ffefe346338c983c558ba8');
INSERT INTO users VALUES ('6', 'liuzhongxuan', '4442949d7781477dd63d05853b8ab2981aec5f0e', 'liuzhongxuan', '刘忠轩', 'zhongxuan.liu@teleframe.cn', '1', '1', '2013-08-31 09:59:28', 'zh', null, '2013-04-23 12:38:57', '2013-05-13 09:42:00', 'User', null, 'only_my_events', '671b5256ffcf4bd17f071042675558aa');
INSERT INTO users VALUES ('8', 'wenjun.xin', 'b4911101b4fd979daec94328dd948495f757b54b', 'wenjun.xin', '辛文俊', 'wenjun.xin@teleframe.cn', '0', '1', '2013-05-29 10:27:15', 'zh', null, '2013-04-23 13:38:49', '2013-04-27 14:53:32', 'User', null, 'only_my_events', 'c8f0ecdf0ca0f945a2e083273bf3ed88');
INSERT INTO users VALUES ('9', 'hangzhou.xue', 'e6b0ac590cb3d48fd66af88ead72366581aaf443', 'xue', 'hangzhou', 'hangzhou.xue@teleframe.cn', '1', '1', '2013-05-08 17:50:55', 'zh', null, '2013-04-26 13:41:13', '2013-07-02 14:16:37', 'User', null, 'only_my_events', '5f1b1ef0305c84c1776c2888e51db4f0');
INSERT INTO users VALUES ('10', 'frederic', '109326866050f67e7ea156af23c6a462503f1010', 'Frederic', 'Bouilhaguet', 'frederic@teleframe.cn', '1', '1', '2014-01-13 16:10:13', 'en', null, '2013-04-26 15:43:38', '2013-05-02 23:09:52', 'User', null, 'only_my_events', 'af04c64454bfe5f636ba6185f8d930d3');
INSERT INTO users VALUES ('11', '', '', '', 'ProjectManagerGroup', '', '0', '1', null, '', null, '2013-04-26 15:55:03', '2013-04-27 14:40:48', 'Group', null, '', null);
INSERT INTO users VALUES ('12', 'kefei.dai', '7cb24a0bbaea82854454c415a08632413c426186', 'Kefei Dai', '代克非', 'kefei.dai@teleframe.cn', '0', '1', '2013-09-18 11:52:22', 'zh', null, '2013-04-26 16:12:22', '2013-05-02 10:05:51', 'User', null, 'only_my_events', 'a8021324682ce7082e41d365dde95880');
INSERT INTO users VALUES ('13', 'haifeng.wang', '29cc2ab872794068b12cb44ce753aa097229bc31', 'wanghaifeng', '王海峰', 'haifeng.wang@teleframe.cn', '0', '1', '2013-05-29 09:18:11', 'zh', null, '2013-04-26 17:49:16', '2013-04-27 15:01:48', 'User', null, 'only_my_events', '950c15d30d13f824c090c31ab7f7e0c2');
INSERT INTO users VALUES ('16', 'qian.lv', '2f3008f530adfe83f62f10e8d997831b49264161', 'qian.lv', '吕倩', 'qian.lv@teleframe.cn', '0', '1', '2013-05-14 15:38:56', 'zh', null, '2013-04-27 10:25:41', '2013-04-27 10:25:41', 'User', null, 'only_my_events', '41d776305ba75e37cb0d7d6b8bca9477');
INSERT INTO users VALUES ('17', 'yan.shao', 'cb52711fae566bdef67c4fd20368b988d5fec9fe', 'yan.shao', '邵岩', 'yan.shao@teleframe.cn', '0', '1', null, 'zh', null, '2013-04-27 11:03:59', '2013-04-27 11:03:59', 'User', null, 'only_my_events', '20564fefeda2c78b051a1f34908da1cf');
INSERT INTO users VALUES ('18', 'qinwei', '79ba4384812d697b60706597f86bea1d7e2e238a', 'qinwei', '秦炜', 'wei.qin@teleframe.cn', '0', '1', '2013-09-26 15:21:18', 'zh', null, '2013-04-27 16:10:58', '2013-04-27 16:11:38', 'User', null, 'only_my_events', '80324de3d71de7c09437ac6beeac0cad');
INSERT INTO users VALUES ('19', 'yinglai.li', 'fef4c9e2ea0de8931c1b314d6dffe2275cc5e416', 'yinglai.li', '李英来', 'yinglai.li@teleframe.cn', '0', '1', '2013-10-12 15:43:18', 'zh', null, '2013-04-27 16:12:35', '2013-05-07 16:40:01', 'User', null, 'only_my_events', '0d228cb6d014d8b4037f774ef508ea3e');
INSERT INTO users VALUES ('20', 'Salome', 'c929e3f8838ec8307116af9a9cc0ff9e4b94b14f', '岩', '邵', '523341047@qq.com', '0', '1', '2013-04-27 16:26:05', 'zh', null, '2013-04-27 16:15:08', '2013-04-27 16:25:52', 'User', null, 'only_my_events', '512bd86e9a7195dfec4d0f8e9e1873f5');
INSERT INTO users VALUES ('21', 'tanyuanwudi', 'b8c22e2b287893f6aa41bb1d2ea67c8207e7779a', 'zhangjizhao', '张', 'jizhao.zhang@teleframe.cn', '0', '1', '2013-05-13 14:25:57', 'zh', null, '2013-05-07 18:24:02', '2013-05-07 18:42:27', 'User', null, 'only_my_events', '6fc7edf7f0c026bc868e047a792e5872');
INSERT INTO users VALUES ('22', 'litian.gong', '73f6831b0fb159ab890b611d02901de68279d852', '立田', '宫', 'litian.gong@teleframe.cn', '0', '3', '2013-05-28 10:00:25', 'zh', null, '2013-05-28 09:45:01', '2013-08-19 12:28:35', 'User', null, 'only_my_events', '446ea7ca29d61aadad8ed3adf54bed51');
INSERT INTO users VALUES ('23', 'wei.guo', '9f0e4690292cad3d12914e4cc77a734b4b4c7929', 'wei', 'guo', 'wei.guo@teleframe.cn', '0', '1', '2013-07-03 11:05:27', 'zh', null, '2013-07-02 16:36:40', '2013-07-02 16:36:40', 'User', null, 'only_my_events', 'b57c17b98a18171fd3c1c0cea5366bff');
INSERT INTO users VALUES ('24', 'tianjian.lei', '30e10afba4206a63e0cb60a021f49edbac16e0e2', 'tianjian', 'lei', 'tianjian.lei@teleframe.cn', '0', '1', null, 'zh', null, '2013-07-02 16:37:08', '2013-07-02 16:37:08', 'User', null, 'only_my_events', 'bad55b52c73e3898e5c588059eb76ab2');
INSERT INTO users VALUES ('25', 'wangxinli', 'f0c6744855f4ae8334f9b5bc7c0e677cd33ab5ce', '新丽', '王', 'xinli.wang@teleframe.cn', '0', '1', '2013-10-11 15:02:46', 'zh', null, '2013-09-26 13:57:04', '2013-09-26 13:57:45', 'User', null, 'only_my_events', 'e34f8e5f83b51d49acab20c3c33b44ed');

-- ----------------------------
-- Table structure for `user_preferences`
-- ----------------------------
DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_preferences
-- ----------------------------
INSERT INTO user_preferences VALUES ('1', '1', '--- \n:no_self_notified: false\n', '0', null);
INSERT INTO user_preferences VALUES ('2', '3', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 5\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('3', '4', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', 'Beijing');
INSERT INTO user_preferences VALUES ('4', '5', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('5', '6', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('7', '8', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('8', '9', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('9', '10', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 4\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('10', '12', '--- \n:no_self_notified: true\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n:my_page_layout: \n  top: \n  - calendar\n  left: \n  - issueswatched\n  right: \n  - issuesreportedbyme\n', '0', '');
INSERT INTO user_preferences VALUES ('11', '13', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('13', '16', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('14', '17', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('15', '18', '--- \n:no_self_notified: false\n', '0', null);
INSERT INTO user_preferences VALUES ('16', '19', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('17', '20', '--- {}\n\n', '0', null);
INSERT INTO user_preferences VALUES ('18', '21', '--- \n:no_self_notified: false\n', '0', null);
INSERT INTO user_preferences VALUES ('19', '22', '--- \n:no_self_notified: false\n:gantt_zoom: 2\n:gantt_months: 6\n', '0', null);
INSERT INTO user_preferences VALUES ('20', '23', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:gantt_zoom: 2\n:gantt_months: 6\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('21', '24', '--- \n:no_self_notified: false\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \"1\"\n', '0', '');
INSERT INTO user_preferences VALUES ('22', '25', '--- \n:no_self_notified: false\n:gantt_zoom: 4\n:gantt_months: 6\n', '0', null);

-- ----------------------------
-- Table structure for `versions`
-- ----------------------------
DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of versions
-- ----------------------------

-- ----------------------------
-- Table structure for `watchers`
-- ----------------------------
DROP TABLE IF EXISTS `watchers`;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watchers
-- ----------------------------
INSERT INTO watchers VALUES ('1', 'Issue', '2', '3');
INSERT INTO watchers VALUES ('2', 'Issue', '2', '4');
INSERT INTO watchers VALUES ('3', 'Issue', '2', '5');
INSERT INTO watchers VALUES ('4', 'Issue', '2', '6');
INSERT INTO watchers VALUES ('6', 'Issue', '2', '10');
INSERT INTO watchers VALUES ('16', 'Issue', '9', '10');
INSERT INTO watchers VALUES ('17', 'Issue', '9', '5');
INSERT INTO watchers VALUES ('18', 'Issue', '10', '10');
INSERT INTO watchers VALUES ('19', 'Issue', '10', '5');
INSERT INTO watchers VALUES ('20', 'Issue', '10', '3');
INSERT INTO watchers VALUES ('21', 'Issue', '10', '6');
INSERT INTO watchers VALUES ('22', 'Issue', '11', '10');
INSERT INTO watchers VALUES ('23', 'Issue', '11', '5');
INSERT INTO watchers VALUES ('24', 'Issue', '11', '6');
INSERT INTO watchers VALUES ('35', 'Issue', '17', '3');
INSERT INTO watchers VALUES ('36', 'Issue', '20', '10');
INSERT INTO watchers VALUES ('37', 'Issue', '20', '5');
INSERT INTO watchers VALUES ('40', 'Issue', '22', '18');
INSERT INTO watchers VALUES ('41', 'Issue', '22', '19');
INSERT INTO watchers VALUES ('78', 'Issue', '27', '10');
INSERT INTO watchers VALUES ('79', 'Issue', '27', '5');
INSERT INTO watchers VALUES ('80', 'Issue', '27', '4');
INSERT INTO watchers VALUES ('81', 'Issue', '27', '12');
INSERT INTO watchers VALUES ('82', 'Issue', '27', '6');
INSERT INTO watchers VALUES ('83', 'Issue', '27', '18');
INSERT INTO watchers VALUES ('84', 'Issue', '27', '13');
INSERT INTO watchers VALUES ('85', 'Issue', '27', '9');
INSERT INTO watchers VALUES ('86', 'Issue', '27', '19');
INSERT INTO watchers VALUES ('88', 'Issue', '27', '3');
INSERT INTO watchers VALUES ('89', 'Issue', '28', '10');
INSERT INTO watchers VALUES ('90', 'Issue', '28', '5');
INSERT INTO watchers VALUES ('91', 'Issue', '28', '12');
INSERT INTO watchers VALUES ('92', 'Issue', '28', '6');
INSERT INTO watchers VALUES ('93', 'Issue', '28', '18');
INSERT INTO watchers VALUES ('94', 'Issue', '28', '13');
INSERT INTO watchers VALUES ('95', 'Issue', '28', '19');
INSERT INTO watchers VALUES ('96', 'Issue', '31', '6');
INSERT INTO watchers VALUES ('97', 'Issue', '32', '4');
INSERT INTO watchers VALUES ('98', 'Issue', '32', '12');
INSERT INTO watchers VALUES ('99', 'Issue', '32', '8');
INSERT INTO watchers VALUES ('100', 'Issue', '32', '9');
INSERT INTO watchers VALUES ('101', 'Issue', '32', '3');
INSERT INTO watchers VALUES ('102', 'Issue', '33', '10');
INSERT INTO watchers VALUES ('103', 'Issue', '33', '5');
INSERT INTO watchers VALUES ('104', 'Issue', '33', '6');
INSERT INTO watchers VALUES ('105', 'Issue', '33', '3');
INSERT INTO watchers VALUES ('106', 'Issue', '34', '10');
INSERT INTO watchers VALUES ('107', 'Issue', '34', '5');
INSERT INTO watchers VALUES ('108', 'Issue', '34', '4');
INSERT INTO watchers VALUES ('109', 'Issue', '34', '6');
INSERT INTO watchers VALUES ('110', 'Issue', '37', '18');
INSERT INTO watchers VALUES ('111', 'Issue', '37', '19');
INSERT INTO watchers VALUES ('112', 'Issue', '37', '3');
INSERT INTO watchers VALUES ('113', 'Issue', '36', '10');
INSERT INTO watchers VALUES ('115', 'Issue', '32', '10');
INSERT INTO watchers VALUES ('116', 'News', '1', '3');
INSERT INTO watchers VALUES ('121', 'Issue', '40', '10');
INSERT INTO watchers VALUES ('122', 'Issue', '40', '5');
INSERT INTO watchers VALUES ('123', 'Issue', '40', '3');
INSERT INTO watchers VALUES ('124', 'Issue', '40', '6');
INSERT INTO watchers VALUES ('125', 'Issue', '41', '10');
INSERT INTO watchers VALUES ('126', 'Issue', '41', '5');
INSERT INTO watchers VALUES ('127', 'Issue', '42', '10');
INSERT INTO watchers VALUES ('128', 'Issue', '42', '5');
INSERT INTO watchers VALUES ('129', 'Issue', '42', '3');
INSERT INTO watchers VALUES ('130', 'Issue', '42', '6');
INSERT INTO watchers VALUES ('131', 'Issue', '43', '13');
INSERT INTO watchers VALUES ('132', 'Issue', '43', '9');
INSERT INTO watchers VALUES ('133', 'Issue', '44', '13');
INSERT INTO watchers VALUES ('134', 'Issue', '44', '9');
INSERT INTO watchers VALUES ('135', 'News', '2', '10');
INSERT INTO watchers VALUES ('136', 'Issue', '48', '10');
INSERT INTO watchers VALUES ('137', 'Issue', '48', '5');
INSERT INTO watchers VALUES ('138', 'Issue', '48', '6');
INSERT INTO watchers VALUES ('139', 'Issue', '48', '3');
INSERT INTO watchers VALUES ('140', 'Issue', '48', '19');
INSERT INTO watchers VALUES ('141', 'WikiPage', '2', '10');
INSERT INTO watchers VALUES ('142', 'News', '3', '10');
INSERT INTO watchers VALUES ('143', 'Issue', '49', '10');
INSERT INTO watchers VALUES ('144', 'Issue', '49', '5');
INSERT INTO watchers VALUES ('145', 'Issue', '49', '6');
INSERT INTO watchers VALUES ('146', 'Issue', '51', '10');
INSERT INTO watchers VALUES ('147', 'Issue', '52', '10');
INSERT INTO watchers VALUES ('148', 'Issue', '52', '5');
INSERT INTO watchers VALUES ('149', 'Issue', '52', '6');
INSERT INTO watchers VALUES ('150', 'Issue', '52', '19');
INSERT INTO watchers VALUES ('155', 'Issue', '54', '10');
INSERT INTO watchers VALUES ('156', 'Issue', '54', '5');
INSERT INTO watchers VALUES ('157', 'Issue', '54', '6');
INSERT INTO watchers VALUES ('158', 'Issue', '55', '10');
INSERT INTO watchers VALUES ('159', 'Issue', '55', '5');
INSERT INTO watchers VALUES ('160', 'Issue', '55', '6');
INSERT INTO watchers VALUES ('161', 'Issue', '56', '10');
INSERT INTO watchers VALUES ('162', 'Issue', '56', '5');
INSERT INTO watchers VALUES ('163', 'Issue', '56', '3');
INSERT INTO watchers VALUES ('164', 'Issue', '56', '6');
INSERT INTO watchers VALUES ('165', 'Issue', '56', '19');
INSERT INTO watchers VALUES ('166', 'Issue', '58', '10');
INSERT INTO watchers VALUES ('168', 'Issue', '60', '10');
INSERT INTO watchers VALUES ('169', 'Issue', '60', '5');
INSERT INTO watchers VALUES ('170', 'Issue', '62', '10');
INSERT INTO watchers VALUES ('171', 'Issue', '62', '5');
INSERT INTO watchers VALUES ('172', 'Issue', '62', '3');
INSERT INTO watchers VALUES ('173', 'Issue', '62', '19');
INSERT INTO watchers VALUES ('174', 'Issue', '63', '10');
INSERT INTO watchers VALUES ('175', 'Issue', '63', '5');
INSERT INTO watchers VALUES ('176', 'Issue', '63', '3');
INSERT INTO watchers VALUES ('177', 'Issue', '64', '10');
INSERT INTO watchers VALUES ('178', 'Issue', '64', '5');
INSERT INTO watchers VALUES ('179', 'Issue', '64', '3');
INSERT INTO watchers VALUES ('180', 'Issue', '65', '10');
INSERT INTO watchers VALUES ('181', 'Issue', '65', '5');
INSERT INTO watchers VALUES ('182', 'Issue', '65', '3');
INSERT INTO watchers VALUES ('183', 'Issue', '65', '18');
INSERT INTO watchers VALUES ('184', 'Issue', '66', '10');
INSERT INTO watchers VALUES ('185', 'Issue', '66', '5');
INSERT INTO watchers VALUES ('186', 'Issue', '66', '3');
INSERT INTO watchers VALUES ('187', 'Issue', '66', '19');
INSERT INTO watchers VALUES ('188', 'Issue', '67', '10');
INSERT INTO watchers VALUES ('189', 'Issue', '67', '5');
INSERT INTO watchers VALUES ('190', 'Issue', '67', '3');
INSERT INTO watchers VALUES ('191', 'Issue', '67', '19');
INSERT INTO watchers VALUES ('192', 'Issue', '68', '10');
INSERT INTO watchers VALUES ('193', 'Issue', '68', '5');
INSERT INTO watchers VALUES ('194', 'Issue', '68', '3');
INSERT INTO watchers VALUES ('195', 'Issue', '68', '19');
INSERT INTO watchers VALUES ('196', 'Issue', '69', '10');
INSERT INTO watchers VALUES ('197', 'Issue', '69', '5');
INSERT INTO watchers VALUES ('198', 'Issue', '69', '3');
INSERT INTO watchers VALUES ('199', 'Issue', '69', '18');
INSERT INTO watchers VALUES ('200', 'Issue', '71', '6');
INSERT INTO watchers VALUES ('202', 'Issue', '73', '10');
INSERT INTO watchers VALUES ('203', 'Issue', '73', '3');
INSERT INTO watchers VALUES ('204', 'Issue', '73', '6');
INSERT INTO watchers VALUES ('205', 'Issue', '74', '10');
INSERT INTO watchers VALUES ('206', 'Issue', '74', '5');
INSERT INTO watchers VALUES ('207', 'Issue', '76', '10');
INSERT INTO watchers VALUES ('208', 'Issue', '76', '5');
INSERT INTO watchers VALUES ('209', 'Issue', '19', '10');
INSERT INTO watchers VALUES ('210', 'Issue', '19', '5');
INSERT INTO watchers VALUES ('211', 'Issue', '19', '3');
INSERT INTO watchers VALUES ('212', 'Issue', '51', '6');
INSERT INTO watchers VALUES ('213', 'News', '4', '10');
INSERT INTO watchers VALUES ('214', 'News', '5', '10');
INSERT INTO watchers VALUES ('215', 'Issue', '78', '10');
INSERT INTO watchers VALUES ('216', 'Issue', '78', '5');
INSERT INTO watchers VALUES ('217', 'Issue', '78', '3');
INSERT INTO watchers VALUES ('218', 'Issue', '78', '18');
INSERT INTO watchers VALUES ('219', 'Issue', '78', '19');
INSERT INTO watchers VALUES ('220', 'Issue', '79', '10');
INSERT INTO watchers VALUES ('221', 'Issue', '79', '5');
INSERT INTO watchers VALUES ('222', 'Issue', '79', '3');
INSERT INTO watchers VALUES ('223', 'Issue', '79', '18');
INSERT INTO watchers VALUES ('224', 'Issue', '79', '19');
INSERT INTO watchers VALUES ('225', 'Issue', '79', '9');
INSERT INTO watchers VALUES ('226', 'Issue', '80', '10');
INSERT INTO watchers VALUES ('227', 'Issue', '80', '5');
INSERT INTO watchers VALUES ('228', 'Issue', '80', '3');
INSERT INTO watchers VALUES ('229', 'Issue', '81', '10');
INSERT INTO watchers VALUES ('230', 'Issue', '81', '5');
INSERT INTO watchers VALUES ('231', 'Issue', '81', '3');
INSERT INTO watchers VALUES ('232', 'Issue', '81', '18');
INSERT INTO watchers VALUES ('233', 'Issue', '81', '19');
INSERT INTO watchers VALUES ('234', 'Issue', '82', '10');
INSERT INTO watchers VALUES ('235', 'Issue', '82', '5');
INSERT INTO watchers VALUES ('236', 'Issue', '82', '3');
INSERT INTO watchers VALUES ('237', 'Issue', '82', '18');
INSERT INTO watchers VALUES ('238', 'Issue', '82', '19');
INSERT INTO watchers VALUES ('239', 'Issue', '83', '10');
INSERT INTO watchers VALUES ('240', 'Issue', '83', '5');
INSERT INTO watchers VALUES ('241', 'Issue', '83', '3');
INSERT INTO watchers VALUES ('242', 'Issue', '83', '18');
INSERT INTO watchers VALUES ('243', 'Issue', '83', '19');
INSERT INTO watchers VALUES ('244', 'Issue', '84', '10');
INSERT INTO watchers VALUES ('245', 'Issue', '84', '5');
INSERT INTO watchers VALUES ('246', 'Issue', '84', '3');
INSERT INTO watchers VALUES ('247', 'Issue', '84', '18');
INSERT INTO watchers VALUES ('248', 'Issue', '84', '19');
INSERT INTO watchers VALUES ('249', 'Issue', '85', '10');
INSERT INTO watchers VALUES ('250', 'Issue', '85', '5');
INSERT INTO watchers VALUES ('251', 'Issue', '85', '3');
INSERT INTO watchers VALUES ('252', 'Issue', '85', '18');
INSERT INTO watchers VALUES ('253', 'Issue', '85', '19');
INSERT INTO watchers VALUES ('254', 'Issue', '86', '10');
INSERT INTO watchers VALUES ('255', 'Issue', '86', '3');
INSERT INTO watchers VALUES ('256', 'Issue', '87', '10');
INSERT INTO watchers VALUES ('257', 'Issue', '87', '5');
INSERT INTO watchers VALUES ('258', 'Issue', '87', '3');
INSERT INTO watchers VALUES ('259', 'Issue', '87', '18');
INSERT INTO watchers VALUES ('260', 'Issue', '87', '19');
INSERT INTO watchers VALUES ('261', 'Issue', '88', '10');
INSERT INTO watchers VALUES ('262', 'Issue', '88', '5');
INSERT INTO watchers VALUES ('263', 'Issue', '88', '3');
INSERT INTO watchers VALUES ('264', 'Issue', '88', '18');
INSERT INTO watchers VALUES ('265', 'Issue', '88', '19');
INSERT INTO watchers VALUES ('266', 'Issue', '89', '10');
INSERT INTO watchers VALUES ('267', 'Issue', '89', '5');
INSERT INTO watchers VALUES ('268', 'Issue', '89', '3');
INSERT INTO watchers VALUES ('269', 'Issue', '89', '18');
INSERT INTO watchers VALUES ('270', 'Issue', '89', '19');
INSERT INTO watchers VALUES ('271', 'Issue', '90', '10');
INSERT INTO watchers VALUES ('272', 'Issue', '90', '5');
INSERT INTO watchers VALUES ('273', 'Issue', '90', '3');
INSERT INTO watchers VALUES ('274', 'Issue', '90', '18');
INSERT INTO watchers VALUES ('275', 'Issue', '90', '19');
INSERT INTO watchers VALUES ('276', 'Issue', '91', '10');
INSERT INTO watchers VALUES ('277', 'Issue', '91', '5');
INSERT INTO watchers VALUES ('278', 'Issue', '91', '3');
INSERT INTO watchers VALUES ('279', 'Issue', '91', '18');
INSERT INTO watchers VALUES ('280', 'Issue', '91', '19');
INSERT INTO watchers VALUES ('281', 'Issue', '92', '10');
INSERT INTO watchers VALUES ('282', 'Issue', '92', '5');
INSERT INTO watchers VALUES ('283', 'Issue', '92', '3');
INSERT INTO watchers VALUES ('284', 'Issue', '92', '18');
INSERT INTO watchers VALUES ('285', 'Issue', '92', '19');
INSERT INTO watchers VALUES ('286', 'Issue', '94', '10');
INSERT INTO watchers VALUES ('287', 'Issue', '94', '5');
INSERT INTO watchers VALUES ('288', 'Issue', '94', '3');
INSERT INTO watchers VALUES ('289', 'Issue', '94', '18');
INSERT INTO watchers VALUES ('290', 'Issue', '94', '19');
INSERT INTO watchers VALUES ('291', 'Issue', '98', '10');
INSERT INTO watchers VALUES ('292', 'Issue', '98', '5');
INSERT INTO watchers VALUES ('293', 'Issue', '98', '6');
INSERT INTO watchers VALUES ('301', 'Issue', '103', '10');
INSERT INTO watchers VALUES ('302', 'Issue', '103', '5');
INSERT INTO watchers VALUES ('303', 'Issue', '103', '3');
INSERT INTO watchers VALUES ('304', 'Issue', '103', '6');
INSERT INTO watchers VALUES ('305', 'Issue', '103', '19');
INSERT INTO watchers VALUES ('306', 'Issue', '104', '10');
INSERT INTO watchers VALUES ('307', 'Issue', '104', '5');
INSERT INTO watchers VALUES ('308', 'Issue', '104', '3');
INSERT INTO watchers VALUES ('309', 'Issue', '104', '6');
INSERT INTO watchers VALUES ('310', 'Issue', '104', '18');
INSERT INTO watchers VALUES ('311', 'Issue', '104', '19');
INSERT INTO watchers VALUES ('312', 'Issue', '103', '18');
INSERT INTO watchers VALUES ('313', 'Issue', '105', '10');
INSERT INTO watchers VALUES ('314', 'Issue', '105', '5');
INSERT INTO watchers VALUES ('315', 'Issue', '105', '3');
INSERT INTO watchers VALUES ('316', 'Issue', '105', '6');
INSERT INTO watchers VALUES ('317', 'Issue', '105', '18');
INSERT INTO watchers VALUES ('318', 'Issue', '105', '19');
INSERT INTO watchers VALUES ('319', 'Issue', '106', '10');
INSERT INTO watchers VALUES ('320', 'Issue', '106', '5');
INSERT INTO watchers VALUES ('321', 'Issue', '106', '3');
INSERT INTO watchers VALUES ('322', 'Issue', '106', '6');
INSERT INTO watchers VALUES ('323', 'Issue', '106', '18');
INSERT INTO watchers VALUES ('324', 'Issue', '106', '19');
INSERT INTO watchers VALUES ('325', 'Issue', '107', '10');
INSERT INTO watchers VALUES ('326', 'Issue', '107', '5');
INSERT INTO watchers VALUES ('327', 'Issue', '107', '3');
INSERT INTO watchers VALUES ('328', 'Issue', '107', '6');
INSERT INTO watchers VALUES ('329', 'Issue', '107', '18');
INSERT INTO watchers VALUES ('330', 'Issue', '107', '19');
INSERT INTO watchers VALUES ('331', 'Issue', '108', '10');
INSERT INTO watchers VALUES ('332', 'Issue', '108', '5');
INSERT INTO watchers VALUES ('333', 'Issue', '108', '3');
INSERT INTO watchers VALUES ('334', 'Issue', '108', '6');
INSERT INTO watchers VALUES ('335', 'Issue', '108', '18');
INSERT INTO watchers VALUES ('336', 'Issue', '108', '19');
INSERT INTO watchers VALUES ('337', 'Issue', '109', '10');
INSERT INTO watchers VALUES ('338', 'Issue', '109', '5');
INSERT INTO watchers VALUES ('339', 'Issue', '109', '3');
INSERT INTO watchers VALUES ('340', 'Issue', '109', '6');
INSERT INTO watchers VALUES ('341', 'Issue', '109', '18');
INSERT INTO watchers VALUES ('342', 'Issue', '109', '19');
INSERT INTO watchers VALUES ('343', 'Issue', '112', '10');
INSERT INTO watchers VALUES ('344', 'Issue', '112', '5');
INSERT INTO watchers VALUES ('345', 'Issue', '112', '3');
INSERT INTO watchers VALUES ('346', 'Issue', '112', '6');
INSERT INTO watchers VALUES ('347', 'Issue', '112', '18');
INSERT INTO watchers VALUES ('348', 'Issue', '43', '10');
INSERT INTO watchers VALUES ('349', 'Issue', '43', '5');
INSERT INTO watchers VALUES ('350', 'Issue', '113', '10');
INSERT INTO watchers VALUES ('351', 'Issue', '113', '5');
INSERT INTO watchers VALUES ('352', 'Issue', '113', '3');
INSERT INTO watchers VALUES ('353', 'Issue', '113', '6');
INSERT INTO watchers VALUES ('354', 'Issue', '113', '18');
INSERT INTO watchers VALUES ('355', 'Issue', '113', '19');
INSERT INTO watchers VALUES ('356', 'Issue', '114', '10');
INSERT INTO watchers VALUES ('357', 'Issue', '114', '5');
INSERT INTO watchers VALUES ('358', 'Issue', '114', '3');
INSERT INTO watchers VALUES ('359', 'Issue', '114', '6');
INSERT INTO watchers VALUES ('365', 'Issue', '116', '10');
INSERT INTO watchers VALUES ('366', 'Issue', '116', '5');
INSERT INTO watchers VALUES ('367', 'Issue', '116', '3');
INSERT INTO watchers VALUES ('368', 'Issue', '116', '6');
INSERT INTO watchers VALUES ('369', 'Issue', '116', '18');
INSERT INTO watchers VALUES ('370', 'Issue', '118', '10');
INSERT INTO watchers VALUES ('371', 'Issue', '118', '5');
INSERT INTO watchers VALUES ('372', 'Issue', '118', '3');
INSERT INTO watchers VALUES ('373', 'Issue', '118', '6');
INSERT INTO watchers VALUES ('374', 'Issue', '117', '10');
INSERT INTO watchers VALUES ('375', 'Issue', '117', '5');
INSERT INTO watchers VALUES ('376', 'Issue', '117', '3');
INSERT INTO watchers VALUES ('377', 'Issue', '117', '6');
INSERT INTO watchers VALUES ('378', 'Issue', '119', '10');
INSERT INTO watchers VALUES ('379', 'Issue', '119', '5');
INSERT INTO watchers VALUES ('380', 'Issue', '119', '3');
INSERT INTO watchers VALUES ('381', 'Issue', '119', '6');
INSERT INTO watchers VALUES ('382', 'Issue', '120', '10');
INSERT INTO watchers VALUES ('383', 'Issue', '120', '5');
INSERT INTO watchers VALUES ('384', 'Issue', '120', '6');
INSERT INTO watchers VALUES ('385', 'Issue', '120', '19');
INSERT INTO watchers VALUES ('386', 'Issue', '121', '10');
INSERT INTO watchers VALUES ('387', 'Issue', '121', '5');
INSERT INTO watchers VALUES ('388', 'Issue', '121', '3');
INSERT INTO watchers VALUES ('389', 'Issue', '121', '6');
INSERT INTO watchers VALUES ('390', 'Issue', '121', '17');
INSERT INTO watchers VALUES ('391', 'Issue', '122', '10');
INSERT INTO watchers VALUES ('392', 'Issue', '122', '5');
INSERT INTO watchers VALUES ('393', 'Issue', '122', '3');
INSERT INTO watchers VALUES ('394', 'Issue', '122', '6');
INSERT INTO watchers VALUES ('395', 'Issue', '122', '18');
INSERT INTO watchers VALUES ('396', 'Issue', '123', '10');
INSERT INTO watchers VALUES ('397', 'Issue', '123', '5');
INSERT INTO watchers VALUES ('398', 'Issue', '123', '6');
INSERT INTO watchers VALUES ('399', 'Issue', '123', '18');
INSERT INTO watchers VALUES ('400', 'Issue', '123', '19');
INSERT INTO watchers VALUES ('401', 'Issue', '124', '10');
INSERT INTO watchers VALUES ('402', 'Issue', '124', '5');
INSERT INTO watchers VALUES ('403', 'Issue', '124', '3');
INSERT INTO watchers VALUES ('404', 'Issue', '124', '6');
INSERT INTO watchers VALUES ('405', 'Issue', '124', '18');
INSERT INTO watchers VALUES ('406', 'News', '6', '3');
INSERT INTO watchers VALUES ('407', 'Issue', '125', '10');
INSERT INTO watchers VALUES ('408', 'Issue', '125', '5');
INSERT INTO watchers VALUES ('409', 'Issue', '125', '3');
INSERT INTO watchers VALUES ('410', 'Issue', '125', '6');
INSERT INTO watchers VALUES ('411', 'Issue', '125', '13');
INSERT INTO watchers VALUES ('412', 'Issue', '125', '19');
INSERT INTO watchers VALUES ('413', 'Issue', '126', '10');
INSERT INTO watchers VALUES ('414', 'Issue', '126', '5');
INSERT INTO watchers VALUES ('415', 'Issue', '126', '3');
INSERT INTO watchers VALUES ('416', 'Issue', '126', '13');
INSERT INTO watchers VALUES ('417', 'Issue', '127', '10');
INSERT INTO watchers VALUES ('418', 'Issue', '127', '5');
INSERT INTO watchers VALUES ('419', 'Issue', '127', '3');
INSERT INTO watchers VALUES ('420', 'Issue', '127', '6');
INSERT INTO watchers VALUES ('421', 'Issue', '127', '19');
INSERT INTO watchers VALUES ('422', 'News', '7', '10');
INSERT INTO watchers VALUES ('423', 'News', '8', '10');
INSERT INTO watchers VALUES ('424', 'News', '9', '10');
INSERT INTO watchers VALUES ('426', 'Issue', '128', '10');
INSERT INTO watchers VALUES ('427', 'Issue', '128', '5');
INSERT INTO watchers VALUES ('428', 'Issue', '128', '3');
INSERT INTO watchers VALUES ('429', 'Issue', '128', '6');
INSERT INTO watchers VALUES ('430', 'Issue', '129', '10');
INSERT INTO watchers VALUES ('431', 'Issue', '129', '5');
INSERT INTO watchers VALUES ('432', 'Issue', '129', '3');
INSERT INTO watchers VALUES ('433', 'Issue', '129', '6');

-- ----------------------------
-- Table structure for `wikis`
-- ----------------------------
DROP TABLE IF EXISTS `wikis`;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wikis
-- ----------------------------
INSERT INTO wikis VALUES ('1', '1', 'Wiki', '1');
INSERT INTO wikis VALUES ('2', '2', 'Wiki', '1');
INSERT INTO wikis VALUES ('3', '3', 'Wiki', '1');
INSERT INTO wikis VALUES ('4', '4', 'Wiki', '1');
INSERT INTO wikis VALUES ('5', '5', 'Wiki', '1');
INSERT INTO wikis VALUES ('6', '6', 'Wiki', '1');
INSERT INTO wikis VALUES ('7', '7', 'Wiki', '1');
INSERT INTO wikis VALUES ('8', '8', 'Wiki', '1');
INSERT INTO wikis VALUES ('9', '9', 'Wiki', '1');
INSERT INTO wikis VALUES ('11', '11', 'Wiki', '1');
INSERT INTO wikis VALUES ('12', '12', 'Wiki', '1');
INSERT INTO wikis VALUES ('13', '13', 'Wiki', '1');
INSERT INTO wikis VALUES ('14', '14', 'Wiki', '1');
INSERT INTO wikis VALUES ('19', '19', 'Wiki', '1');
INSERT INTO wikis VALUES ('20', '20', 'Wiki', '1');
INSERT INTO wikis VALUES ('21', '21', 'Wiki', '1');

-- ----------------------------
-- Table structure for `wiki_contents`
-- ----------------------------
DROP TABLE IF EXISTS `wiki_contents`;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wiki_contents
-- ----------------------------
INSERT INTO wiki_contents VALUES ('1', '1', '3', 'h1. CentOS-6.4-redmine-2.3 installation(Step-by-step)\r\n\r\n\r\nh3. The version of the software we used.\r\n\r\n* Redmine 2.3.0\r\n* ruby 1.8.7\r\n* gem 1.3.7\r\n* Rails 3.2.13 \r\n* mysql 2.1.67\r\n\r\nh2. == Installation \r\n\r\n\r\nh3. Install gem and passenger dependencies \r\n\r\n<pre>\r\nyum -y install curl-devel openssl-devel httpd-devel apr-devel apr-util-devel mysql-devel\r\n</pre>\r\n\r\nh3. Install Ruby\r\n\r\n<pre>\r\nyum install -y ruby ruby-devel\r\n</pre>\r\n\r\nh3. Get Gems\r\n\r\n<pre>\r\nyum install -y rubygems\r\n</pre>\r\n\r\nh3. Install MySQL DB Server\r\n\r\n<pre>\r\nyum install -y mysql-server\r\nchkconfig mysqld on\r\nservice mysqld start\r\n</pre>\r\n\r\nh3. Install Passenger (requires gcc)\r\n\r\n<pre>\r\ngem install passenger\r\npassenger-install-apache2-module\r\n</pre>\r\n\r\n\r\n<pre>\r\ncd  /var/www/\r\nyum install lrz*\r\n</pre>\r\n\r\nh3. Download Redmine\r\n\r\n  http://rubyforge.org/frs/?group_id=1850\r\n<pre>\r\nwget http://rubyforge.org/frs/download.php/76867/redmine-2.3.0.tar.gz  # GET LATEST VERSION ON RUBYFORGE\r\ntar zxvf redmine-2.3.0.tar.gz\r\nmv redmine-2.3.0 /var/www/redmine\r\n</pre>\r\n\r\nh3. Install Imagemagic\r\n\r\n<pre>\r\nyum install -y ImageMagick-devel\r\n</pre>\r\n\r\nh3. Install Bundler\r\n\r\n<pre>\r\ngem install bundler\r\ncd redmine \r\nyum install libxml2* \r\nyum install -y libxslt*\r\nbundle install\r\n</pre>\r\n\r\nh3. Install Rdoc\r\n\r\n<pre>\r\ngem install rdoc-data\r\n</pre>\r\n\r\nh3. Create a MySQL database to use with Redmine\r\n\r\n<pre>\r\nmysql -u root –p\r\nmysql> create database redmine character set utf8;\r\nmysql> create user \'redmine\'@\'localhost\' identified by \'my_password\';\r\nmysql> grant all privileges on redmine.* to \'redmine\'@\'localhost\' identified by \'my_password\';\r\nmysql> quit\r\n</pre>\r\nNow the database and a user to be used with it is created. Also the user has the rights to work on the database that was created.\r\n&nbsp;      \r\n\r\nh3. Configure database.yml\r\n\r\n<pre>\r\ncd /var/www/redmine/config\r\ncp database.yml.example database.yml\r\nvi database.yml\r\n</pre>\r\nChange it to look like:\r\n\r\n<pre><code class=\"ruby\">\r\nproduction:\r\n    adapter: mysql\r\n    database: redmine\r\n    host: localhost\r\n    username: redmine\r\n    password: my_password\r\n    encoding: utf8\r\n</code></pre>\r\nIf you\'re running Redmine with MySQL and ruby1.8, replace the adapter name\r\n   with `mysql`\r\n&nbsp;\r\n\r\nh3. Migrate and load default data\r\n\r\n<pre>\r\ncd redmine\r\nrake generate_secret_token\r\nRAILS_ENV=production rake db:migrate\r\nRAILS_ENV=production rake redmine:load_default_data\r\n</pre>\r\n\r\nh3. Fix rights for the apache user\r\n\r\n<pre>\r\ncd /var/www\r\nchmod -R 755 redmine\r\n</pre>\r\n\r\nh3. Test the installation by running the WEBrick web server\r\n\r\n<pre>\r\ncd /var/www/redmine\r\nruby script/rails server -e production\r\n</pre>\r\n\r\nOnce WEBrick has started, point your browser to http://localhost:3000/ \r\nyou should now see the application welcome page.\r\n\r\nUse the default administrator account to log in:\r\nLogin:admin\r\nPassword:admin\r\n\r\nh3. Redmine is now installed and usable.\r\n\r\nEnjoy!\r\nGood Luck!\r\n\r\nh2. More information\r\n\r\nh3. Apache Settings\r\n\r\nConfigure Apache to host the documents\r\nmore information can be found here: \"HowTo configure Apache to run Redmine\":http://www.redmine.org/projects/redmine/wiki/HowTo_configure_Apache_to_run_Redmine\r\n\r\nh3. Start mysql remote connection\r\n\r\n<pre>\r\n mysql -u root -p\r\n mysql>GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY \"my_password\" WITH GRANT OPTION;\r\n mysql>GRANT ALL PRIVILEGES ON *.* TO root@\"%\" IDENTIFIED BY  \"my_password\" WITH GRANT OPTION;\r\n</pre>\r\n\r\nThe first command : Distribute authority for the user \'root\' to access localhost. \"my_password\" is the password.\r\nThe second command : Distribute authority for the user \'root\' to access from any where.\r\n\r\nh2. ==References \r\n\r\n* http://www.redmine.org/projects/redmine/wiki/How_to_Install_Redmine_on_CentOS_(Detailed)\r\n* http://www.redmine.org/wiki/redmine/RedmineInstall\r\n* http://www.redmine.org/wiki/redmine/EmailConfiguration\r\n* http://www.redmine.org/wiki/redmine/RedmineSettings\r\n* http://www.redmine.org/wiki/redmine/RedmineRepositories\r\n* http://www.redmine.org/wiki/redmine/RedmineReceivingEmails\r\n* http://www.redmine.org/wiki/redmine/RedmineReminderEmails\r\n* http://www.redmine.org/wiki/redmine/RedmineLDAP \r\n* http://www.redmine.org/projects/redmine/wiki/RedmineInstall  \r\n* http://blog.csdn.net/winlinvip/article/details/8514333  \r\n* http://www.chinadmd.com/file/swetc6uszizostxrrw3u3ear_1.html', '', '2013-04-28 10:39:16', '28');
INSERT INTO wiki_contents VALUES ('2', '2', '10', 'h2. 1/ How to get all the tasks created by one specific \'watch folder\' ? \r\n\r\n1) Using the *_search_* method from the Task web service (TaskEndpointService) :\r\nhttp://10.168.1.160:8080/api/soap_ns7_TaskEndpointService.html#search\r\n\r\n2) Specify in the input criteria the watch folder Id :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskSearchCriteria\r\n*_watchedFolderId_* : The \"watchedFolder\" from which the task has been created \r\n\r\n3) Precise the tasks state if necessary :\r\nhttp://10.168.1.160:8080/api/data_ns0.html#taskMacroState\r\n(EDITION PROCESSING FAILED COMPLETED) 	\r\n\r\n4) Example in Java of how to use *_search_* method with *_taskSearchCriteria_* input parameter (set by setWatchedFolderId, setMinCreationDate and setMaxCreationDate) :\r\n\"ShowLastTaskByWatchedFolderTest.java\":http://teleframe.xicp.net:3000/attachments/download/133/ShowLastTaskByWatchedFolderTest.java\r\n\r\n\r\nh2. 2/ How to upload a file to the storage user account ?\r\n\r\nBy using http://10.168.1.160:8080/api/upload\r\n\r\nh2. Task create/start/getDetail example in Java (SOAP) ?\r\n\r\nCheck medianate-api-client-SOAP_r4582 Eclipse (v 3.6) project : medianate-api-client.zip.\r\n\r\nh2. 3/ How to search video(s) and time stamp(s) corresponding to specific input object occurrences (e.g. plate value) ?\r\n\r\n1) Set the search *_criteria_* : http://127.0.0.1:8080/api/data_ns0.html#taskSearchCriteria\r\n- _stepReportContains_ : Analysis step report must contain the specified content.\r\n- _minSourceTakenDateTime_/maxSourceTakenDateTime : Source minimum/maximum takenDateTime  \r\n\r\n2) Call http://127.0.0.1:8080/api/soap_ns7_TaskEndpointService.html#search with the input criteria.\r\n\r\nh2. 4/ How to embed a video player in web pages ?  \r\n\r\n1) with JW Player : http://www.longtailvideo.com/support/jw-player/\r\n\r\n2) with OSMF Strobe player : http://www.osmf.org/strobe_mediaplayback.html\r\n\r\n3）关于在IE下播放视频，windows media player 对 avi 格式支持比较好\r\n\r\nh2. 4/ How to set takenDateTime, takenPosition and takenCameraId in Medianate ?\r\n\r\nSet the \"metadata\":http://10.168.1.160:8080/api/data_ns0.html#sourceMetadata of \"simpleSource\":http://10.168.1.160:8080/api/data_ns0.html#simpleSource.\r\n\r\n\r\n\r\n  ', '', '2013-07-02 16:53:08', '13');
INSERT INTO wiki_contents VALUES ('3', '3', '3', 'h1. Intelligent Monitoring Web Systems Wiki\r\n\r\nh1. Web Applications\r\n\r\nh2. 1)  The _Cloud Retrieval System_ web application \r\n\r\nThis web application is a client of Medianate. It uses Medianate web services API for requesting the processing of input video files and it gets the analysis results to store them in its own data base.\r\n\r\n1.1)[[Backup data base]]\r\n  \r\nh2. 2) ITS\r\n\r\n2.1) [[Large-amount-of-data-displayed-in-IE]]\r\n\r\nh1. Informations About Java Project\r\n\r\nh2. 3). Convert Java Project To another Type Project\r\n\r\n\"Convert Java Project To another Type Project\":http://10.168.1.251:3000/projects/WEB/wiki/Convert_Java_Project_To_another_Type_Project', '', '2013-07-15 14:06:42', '14');
INSERT INTO wiki_contents VALUES ('5', '5', '3', 'h1. Large-amount-of-data-displayed-in-IE\r\n\r\n\r\nh2. 问题: \r\n在IE中js处理大数据的报表信息，会弹出阻止对话框:\"停止运行此脚本吗？   此页面上的脚本造成Web浏览器运行速度减慢，如果继续运行，你的计算机可能停止相应\"。\r\n!http://10.168.1.251:3000/attachments/download/132/QQ%E6%88%AA%E5%9B%BE20130628160414.jpg!\r\n点击是，会显示报表的部分内容；点击否，会连续弹出几次，直至js运行完成，完全显示信息。\r\n\r\nh2. 解决方法: \r\n1、打开注册表HKEY_CURRENT_USER\\Software\\Microsoft\\InternetExplorer\\Styles，如果 Styles 键不存在，创建调用 Styles 的一个新的项。          \r\n2、创建新的MaxScriptStatements（DWORD值），设置其值为0xFFFFFFFF\r\n修改完成后，IE不会弹出阻止对话框\r\n\r\n\r\n', '', '2013-06-28 17:06:17', '6');
INSERT INTO wiki_contents VALUES ('7', '7', '3', 'h1. Backup of the data base\r\n\r\ncommand：\r\n<pre>\r\nmysqldump --opt -h 10.168.1.250 -P 3306 -u root --password=teleframe20130301 --lock-all-tables=true  --result-file=\"D:/DBBackUp/2013710105854.sql\"  --default-character-set=utf8 CloudRetrieval\r\n</pre>\r\n\r\nh2. Some QAs\r\n\r\nh3. Windows System\r\nIf we use  java code backup data base with process.exec(\"command\"), sometimes it runs failed, because the authority.\r\n\r\nI got aother good method.\r\n1) mdir a new folder, e.g: d:\\webapps\r\n2) set the tomcat configuration, find %TOMCAT_HOME%/conf/server.xml and modify the \"appBase\" as shown below:\r\n<pre>\r\n<Host name=\"localhost\"  appBase=\"d:\\webapps\"\r\n            unpackWARs=\"true\" autoDeploy=\"true\"\r\n            xmlValidation=\"false\" xmlNamespaceAware=\"false\">\r\n</pre>\r\n3) run tomcat service\r\n<pre>\r\npushd %TOMCAT_HOME%/bin\r\njava -jar bootstrap.jar\r\n</pre>\r\n\r\nh3. Linux\r\nNeed test.', '', '2013-07-10 13:50:44', '3');
INSERT INTO wiki_contents VALUES ('8', '8', '3', 'h1. Convert Java Project To another Type Project\r\n\r\nh3. Description: \r\nThere\'s a java project,not a standard web project. If you want to convert the project', '', '2013-07-15 18:51:08', '2');

-- ----------------------------
-- Table structure for `wiki_content_versions`
-- ----------------------------
DROP TABLE IF EXISTS `wiki_content_versions`;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wiki_content_versions
-- ----------------------------
INSERT INTO wiki_content_versions VALUES ('1', '1', '1', '3', 0x43656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A3D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A3D3D20496E7374616C6C6174696F6E200D0A496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A496E7374616C6C20527562790D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A4765742047656D730D0A79756D20696E7374616C6C202D79207275627967656D730D0A496E7374616C6C204D7953514C204442205365727665720D0A79756D20696E7374616C6C202D79206D7973716C2D736572766572200D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A446F776E6C6F6164205265646D696E650D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A496E7374616C6C20496D6167656D616769630D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A496E7374616C6C2042756E646C65720D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A496E7374616C6C2052646F630D0A67656D20696E7374616C6C2072646F632D646174610D0A4372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A436F6E6669677572652064617461626173652E796D6C0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A4368616E676520697420746F206C6F6F6B206C696B653A2820496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C60290D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A4D69677261746520616E64206C6F61642064656661756C7420646174610D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A4669782072696768747320666F72207468652061706163686520757365720D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A3D3D5265666572656E636573200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A200D0A, '', 'CentOS-6.4-redmine-2.3 installation', '2013-04-22 20:48:47', '1');
INSERT INTO wiki_content_versions VALUES ('2', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A3D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A3D3D20496E7374616C6C6174696F6E200D0A496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A496E7374616C6C20527562790D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A4765742047656D730D0A79756D20696E7374616C6C202D79207275627967656D730D0A496E7374616C6C204D7953514C204442205365727665720D0A79756D20696E7374616C6C202D79206D7973716C2D736572766572200D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A446F776E6C6F6164205265646D696E650D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A496E7374616C6C20496D6167656D616769630D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A496E7374616C6C2042756E646C65720D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A496E7374616C6C2052646F630D0A67656D20696E7374616C6C2072646F632D646174610D0A4372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A436F6E6669677572652064617461626173652E796D6C0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A4368616E676520697420746F206C6F6F6B206C696B653A2820496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C60290D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A4D69677261746520616E64206C6F61642064656661756C7420646174610D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A4669782072696768747320666F72207468652061706163686520757365720D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A3D3D5265666572656E636573200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A200D0A, '', '', '2013-04-22 20:50:39', '2');
INSERT INTO wiki_content_versions VALUES ('3', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A3D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A3D3D20496E7374616C6C6174696F6E200D0A496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A496E7374616C6C20527562790D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A4765742047656D730D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A496E7374616C6C204D7953514C204442205365727665720D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A446F776E6C6F6164205265646D696E650D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A496E7374616C6C20496D6167656D616769630D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A496E7374616C6C2042756E646C65720D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A496E7374616C6C2052646F630D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A4372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A436F6E6669677572652064617461626173652E796D6C0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A4368616E676520697420746F206C6F6F6B206C696B653A2820496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C60290D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A4D69677261746520616E64206C6F61642064656661756C7420646174610D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A4669782072696768747320666F72207468652061706163686520757365720D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A3D3D5265666572656E636573200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:02:23', '3');
INSERT INTO wiki_content_versions VALUES ('4', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A3D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A3D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A2D696E74206D61696E28290D0A7B0D0A20207072696E7466282222293B0D0A7D2D0D0A0D0A496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A496E7374616C6C20527562790D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A4765742047656D730D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A496E7374616C6C204D7953514C204442205365727665720D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A446F776E6C6F6164205265646D696E650D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A496E7374616C6C20496D6167656D616769630D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A496E7374616C6C2042756E646C65720D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A496E7374616C6C2052646F630D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A4372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A436F6E6669677572652064617461626173652E796D6C0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A4368616E676520697420746F206C6F6F6B206C696B653A2820496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C60290D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A4D69677261746520616E64206C6F61642064656661756C7420646174610D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A4669782072696768747320666F72207468652061706163686520757365720D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A3D3D5265666572656E636573200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:05:01', '4');
INSERT INTO wiki_content_versions VALUES ('5', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A2820496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C60290D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:28:52', '5');
INSERT INTO wiki_content_versions VALUES ('6', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A2820496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C60290D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:29:24', '6');
INSERT INTO wiki_content_versions VALUES ('7', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:30:45', '7');
INSERT INTO wiki_content_versions VALUES ('8', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A0D0A3C61206E616D653D224D6967726174652D616E642D6C6F61642D64656661756C742D64617461223E3C2F613E0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:33:36', '8');
INSERT INTO wiki_content_versions VALUES ('9', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37353539372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:39:21', '9');
INSERT INTO wiki_content_versions VALUES ('10', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A5265646D696E652076657273696F6E203A20322E332E3020312E38200D0A7275627920312E382E372C20312E392E322C20312E392E332C20322E302E30312C206A727562792D312E362E372C206A727562792D312E372E32205261696C7320332E322E3133200D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:48:38', '10');
INSERT INTO wiki_content_versions VALUES ('11', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68322E203D3D20526571756972656D656E747320206F662076657273696F6E20322E3320286F6666696369616C29200D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:58:51', '11');
INSERT INTO wiki_content_versions VALUES ('12', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E0D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 09:59:10', '12');
INSERT INTO wiki_content_versions VALUES ('13', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A4170616368652053657474696E67730D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:01:27', '13');
INSERT INTO wiki_content_versions VALUES ('14', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A5B5B687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835305D5D0D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A4170616368652053657474696E67730D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:02:29', '14');
INSERT INTO wiki_content_versions VALUES ('15', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A4170616368652053657474696E67730D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:03:18', '15');
INSERT INTO wiki_content_versions VALUES ('16', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A205B5B486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E655D5D0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:04:34', '16');
INSERT INTO wiki_content_versions VALUES ('17', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A205B5B486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E655D5D0D0A3C6120687265663D22687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E65223E61706163682073657474696E67733C2F613E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:05:13', '17');
INSERT INTO wiki_content_versions VALUES ('18', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E655B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A3C6120687265663D22687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E65223E61706163682073657474696E67733C2F613E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:06:48', '18');
INSERT INTO wiki_content_versions VALUES ('19', '1', '1', '3', 0x0D0A68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C200D0A20, '', '', '2013-04-23 10:07:07', '19');
INSERT INTO wiki_content_versions VALUES ('20', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370A0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686F776E202D52206170616368653A617061636865207265646D696E650D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210A0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-23 10:16:40', '20');
INSERT INTO wiki_content_versions VALUES ('21', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-23 10:24:13', '21');
INSERT INTO wiki_content_versions VALUES ('22', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F2069746C6F67676572406C6F63616C686F7374204944454E54494649454420425920E280987777772E69746C6F676765722E636F6DE280992057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F2069746C6F6767657240E2809D25E2809D204944454E54494649454420425920E280987777772E69746C6F676765722E636F6DE280992057495448204752414E54204F5054494F4E3B0D0A0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-26 15:03:29', '22');
INSERT INTO wiki_content_versions VALUES ('23', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A68322E205374617274206D7973716C2072656D6F746520636F6E6E656374696F6E0D0A3C7072653E0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F74406C6F63616C686F7374204944454E54494649454420425920226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F7440222522204944454E5449464945442042592020226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A3C2F7072653E0D0A0D0A54686520666972737420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F20616363657373206C6F63616C686F73742E20226D795F70617373776F726422206973207468652070617373776F72642E0D0A546865207365636F6E6420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F206163636573732066726F6D20616E792077686572652E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-26 15:16:11', '23');
INSERT INTO wiki_content_versions VALUES ('24', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A68322E205374617274206D7973716C2072656D6F746520636F6E6E656374696F6E0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F74406C6F63616C686F7374204944454E54494649454420425920226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F7440222522204944454E5449464945442042592020226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A3C2F636F64653E3C2F7072653E0D0A0D0A54686520666972737420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F20616363657373206C6F63616C686F73742E20226D795F70617373776F726422206973207468652070617373776F72642E0D0A546865207365636F6E6420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F206163636573732066726F6D20616E792077686572652E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-26 15:16:46', '24');
INSERT INTO wiki_content_versions VALUES ('25', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A68322E205374617274206D7973716C2072656D6F746520636F6E6E656374696F6E0D0A0D0A3C7072653E0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F74406C6F63616C686F7374204944454E54494649454420425920226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F7440222522204944454E5449464945442042592020226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A3C2F7072653E0D0A0D0A54686520666972737420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F20616363657373206C6F63616C686F73742E20226D795F70617373776F726422206973207468652070617373776F72642E0D0A546865207365636F6E6420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F206163636573732066726F6D20616E792077686572652E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-26 15:17:12', '25');
INSERT INTO wiki_content_versions VALUES ('26', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E4D6F726520696E666F726D6174696F6E0D0A0D0A68332E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A68332E205374617274206D7973716C2072656D6F746520636F6E6E656374696F6E0D0A0D0A3C7072653E0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F74406C6F63616C686F7374204944454E54494649454420425920226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F7440222522204944454E5449464945442042592020226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A3C2F7072653E0D0A0D0A54686520666972737420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F20616363657373206C6F63616C686F73742E20226D795F70617373776F726422206973207468652070617373776F72642E0D0A546865207365636F6E6420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F206163636573732066726F6D20616E792077686572652E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-26 15:20:16', '26');
INSERT INTO wiki_content_versions VALUES ('27', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204D6F726520696E666F726D6174696F6E0D0A0D0A68332E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A20486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E650D0A5B687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E655D0D0A0D0A68332E205374617274206D7973716C2072656D6F746520636F6E6E656374696F6E0D0A0D0A3C7072653E0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F74406C6F63616C686F7374204944454E54494649454420425920226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F7440222522204944454E5449464945442042592020226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A3C2F7072653E0D0A0D0A54686520666972737420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F20616363657373206C6F63616C686F73742E20226D795F70617373776F726422206973207468652070617373776F72642E0D0A546865207365636F6E6420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F206163636573732066726F6D20616E792077686572652E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-26 15:20:31', '27');
INSERT INTO wiki_content_versions VALUES ('28', '1', '1', '3', 0x68312E2043656E744F532D362E342D7265646D696E652D322E3320696E7374616C6C6174696F6E28537465702D62792D73746570290D0A0D0A0D0A68332E205468652076657273696F6E206F662074686520736F66747761726520776520757365642E0D0A0D0A2A205265646D696E6520322E332E300D0A2A207275627920312E382E370D0A2A2067656D20312E332E370D0A2A205261696C7320332E322E3133200D0A2A206D7973716C20322E312E36370D0A0D0A68322E203D3D20496E7374616C6C6174696F6E200D0A0D0A0D0A68332E20496E7374616C6C2067656D20616E642070617373656E67657220646570656E64656E63696573200D0A0D0A3C7072653E0D0A79756D202D7920696E7374616C6C206375726C2D646576656C206F70656E73736C2D646576656C2068747470642D646576656C206170722D646576656C206170722D7574696C2D646576656C206D7973716C2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20527562790D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627920727562792D646576656C0D0A3C2F7072653E0D0A0D0A68332E204765742047656D730D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79207275627967656D730D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C204D7953514C204442205365727665720D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D79206D7973716C2D7365727665720D0A63686B636F6E666967206D7973716C64206F6E0D0A73657276696365206D7973716C642073746172740D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2050617373656E6765722028726571756972657320676363290D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2070617373656E6765720D0A70617373656E6765722D696E7374616C6C2D617061636865322D6D6F64756C650D0A3C2F7072653E0D0A0D0A0D0A3C7072653E0D0A636420202F7661722F7777772F0D0A79756D20696E7374616C6C206C727A2A0D0A3C2F7072653E0D0A0D0A68332E20446F776E6C6F6164205265646D696E650D0A0D0A2020687474703A2F2F72756279666F7267652E6F72672F6672732F3F67726F75705F69643D313835300D0A3C7072653E0D0A7767657420687474703A2F2F72756279666F7267652E6F72672F6672732F646F776E6C6F61642E7068702F37363836372F7265646D696E652D322E332E302E7461722E677A20202320474554204C41544553542056455253494F4E204F4E2052554259464F5247450D0A746172207A787666207265646D696E652D322E332E302E7461722E677A0D0A6D76207265646D696E652D322E332E30202F7661722F7777772F7265646D696E650D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C20496D6167656D616769630D0A0D0A3C7072653E0D0A79756D20696E7374616C6C202D7920496D6167654D616769636B2D646576656C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2042756E646C65720D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2062756E646C65720D0A6364207265646D696E65200D0A79756D20696E7374616C6C206C6962786D6C322A200D0A79756D20696E7374616C6C202D79206C696278736C742A0D0A62756E646C6520696E7374616C6C0D0A3C2F7072653E0D0A0D0A68332E20496E7374616C6C2052646F630D0A0D0A3C7072653E0D0A67656D20696E7374616C6C2072646F632D646174610D0A3C2F7072653E0D0A0D0A68332E204372656174652061204D7953514C20646174616261736520746F207573652077697468205265646D696E650D0A0D0A3C7072653E0D0A6D7973716C202D7520726F6F7420E28093700D0A6D7973716C3E20637265617465206461746162617365207265646D696E65206368617261637465722073657420757466383B0D0A6D7973716C3E20637265617465207573657220277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E206772616E7420616C6C2070726976696C65676573206F6E207265646D696E652E2A20746F20277265646D696E652740276C6F63616C686F737427206964656E74696669656420627920276D795F70617373776F7264273B0D0A6D7973716C3E20717569740D0A3C2F7072653E0D0A4E6F772074686520646174616261736520616E642061207573657220746F2062652075736564207769746820697420697320637265617465642E20416C736F20746865207573657220686173207468652072696768747320746F20776F726B206F6E2074686520646174616261736520746861742077617320637265617465642E0D0A266E6273703B2020202020200D0A0D0A68332E20436F6E6669677572652064617461626173652E796D6C0D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E652F636F6E6669670D0A63702064617461626173652E796D6C2E6578616D706C652064617461626173652E796D6C0D0A76692064617461626173652E796D6C0D0A3C2F7072653E0D0A4368616E676520697420746F206C6F6F6B206C696B653A0D0A0D0A3C7072653E3C636F646520636C6173733D2272756279223E0D0A70726F64756374696F6E3A0D0A20202020616461707465723A206D7973716C0D0A2020202064617461626173653A207265646D696E650D0A20202020686F73743A206C6F63616C686F73740D0A20202020757365726E616D653A207265646D696E650D0A2020202070617373776F72643A206D795F70617373776F72640D0A20202020656E636F64696E673A20757466380D0A3C2F636F64653E3C2F7072653E0D0A496620796F752772652072756E6E696E67205265646D696E652077697468204D7953514C20616E642072756279312E382C207265706C616365207468652061646170746572206E616D650D0A2020207769746820606D7973716C600D0A266E6273703B0D0A0D0A68332E204D69677261746520616E64206C6F61642064656661756C7420646174610D0A0D0A3C7072653E0D0A6364207265646D696E650D0A72616B652067656E65726174655F7365637265745F746F6B656E0D0A5241494C535F454E563D70726F64756374696F6E2072616B652064623A6D6967726174650D0A5241494C535F454E563D70726F64756374696F6E2072616B65207265646D696E653A6C6F61645F64656661756C745F646174610D0A3C2F7072653E0D0A0D0A68332E204669782072696768747320666F72207468652061706163686520757365720D0A0D0A3C7072653E0D0A6364202F7661722F7777770D0A63686D6F64202D5220373535207265646D696E650D0A3C2F7072653E0D0A0D0A68332E20546573742074686520696E7374616C6C6174696F6E2062792072756E6E696E6720746865205745427269636B20776562207365727665720D0A0D0A3C7072653E0D0A6364202F7661722F7777772F7265646D696E650D0A72756279207363726970742F7261696C7320736572766572202D652070726F64756374696F6E0D0A3C2F7072653E0D0A0D0A4F6E6365205745427269636B2068617320737461727465642C20706F696E7420796F75722062726F7773657220746F20687474703A2F2F6C6F63616C686F73743A333030302F200D0A796F752073686F756C64206E6F772073656520746865206170706C69636174696F6E2077656C636F6D6520706167652E0D0A0D0A557365207468652064656661756C742061646D696E6973747261746F72206163636F756E7420746F206C6F6720696E3A0D0A4C6F67696E3A61646D696E0D0A50617373776F72643A61646D696E0D0A0D0A68332E205265646D696E65206973206E6F7720696E7374616C6C656420616E6420757361626C652E0D0A0D0A456E6A6F79210D0A476F6F64204C75636B210D0A0D0A68322E204D6F726520696E666F726D6174696F6E0D0A0D0A68332E204170616368652053657474696E67730D0A0D0A436F6E6669677572652041706163686520746F20686F73742074686520646F63756D656E74730D0A6D6F726520696E666F726D6174696F6E2063616E20626520666F756E6420686572653A2022486F77546F20636F6E6669677572652041706163686520746F2072756E205265646D696E65223A687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F77546F5F636F6E6669677572655F4170616368655F746F5F72756E5F5265646D696E650D0A0D0A68332E205374617274206D7973716C2072656D6F746520636F6E6E656374696F6E0D0A0D0A3C7072653E0D0A206D7973716C202D7520726F6F74202D700D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F74406C6F63616C686F7374204944454E54494649454420425920226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A206D7973716C3E4752414E5420414C4C2050524956494C45474553204F4E202A2E2A20544F20726F6F7440222522204944454E5449464945442042592020226D795F70617373776F7264222057495448204752414E54204F5054494F4E3B0D0A3C2F7072653E0D0A0D0A54686520666972737420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F20616363657373206C6F63616C686F73742E20226D795F70617373776F726422206973207468652070617373776F72642E0D0A546865207365636F6E6420636F6D6D616E64203A204469737472696275746520617574686F7269747920666F722074686520757365722027726F6F742720746F206163636573732066726F6D20616E792077686572652E0D0A0D0A68322E203D3D5265666572656E636573200D0A0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F486F775F746F5F496E7374616C6C5F5265646D696E655F6F6E5F43656E744F535F2844657461696C6564290D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65496E7374616C6C0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F456D61696C436F6E66696775726174696F6E0D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6553657474696E67730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E655265706F7369746F726965730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E65526563656976696E67456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E6552656D696E646572456D61696C730D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F77696B692F7265646D696E652F5265646D696E654C444150200D0A2A20687474703A2F2F7777772E7265646D696E652E6F72672F70726F6A656374732F7265646D696E652F77696B692F5265646D696E65496E7374616C6C20200D0A2A20687474703A2F2F626C6F672E6373646E2E6E65742F77696E6C696E7669702F61727469636C652F64657461696C732F3835313433333320200D0A2A20687474703A2F2F7777772E6368696E61646D642E636F6D2F66696C652F73776574633675737A697A6F7374787272773375336561725F312E68746D6C, '', '', '2013-04-28 10:39:16', '28');
INSERT INTO wiki_content_versions VALUES ('29', '2', '2', '10', 0x68312E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A, '', '', '2013-06-04 16:25:27', '1');
INSERT INTO wiki_content_versions VALUES ('30', '2', '2', '10', 0x68322E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A, '', '', '2013-06-04 16:38:02', '2');
INSERT INTO wiki_content_versions VALUES ('31', '2', '2', '10', 0x68322E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F6164, '', '', '2013-06-04 16:40:46', '3');
INSERT INTO wiki_content_versions VALUES ('32', '2', '2', '10', 0x68322E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F6164, '', '', '2013-06-04 16:49:19', '4');
INSERT INTO wiki_content_versions VALUES ('33', '2', '2', '10', 0x68322E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E, '', '', '2013-06-04 17:43:45', '5');
INSERT INTO wiki_content_versions VALUES ('34', '2', '2', '10', 0x68322E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E, '', '', '2013-06-04 17:45:13', '6');
INSERT INTO wiki_content_versions VALUES ('35', '2', '2', '10', 0x68322E20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A312920466978696E67207468652073656172636820696E707574202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A0D0A2020, '', '', '2013-06-05 15:27:37', '7');
INSERT INTO wiki_content_versions VALUES ('36', '2', '2', '10', 0x68322E20312F20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20322F20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20332F20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A3129205365742074686520736561726368202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A0D0A2020, '', '', '2013-06-05 19:07:46', '8');
INSERT INTO wiki_content_versions VALUES ('37', '2', '2', '10', 0x68322E20312F20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20322F20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20332F20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A3129205365742074686520736561726368202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A68322E20342F20486F7720746F20656D626564206120766964656F20706C6179657220696E20776562207061676573203F20200D0A0D0A31292077697468204A5720506C61796572203A20687474703A2F2F7777772E6C6F6E677461696C766964656F2E636F6D2F737570706F72742F6A772D706C617965722F0D0A0D0A32292077697468204F534D46205374726F626520706C61796572203A20687474703A2F2F7777772E6F736D662E6F72672F7374726F62655F6D65646961706C61796261636B2E68746D6C0D0A0D0A0D0A2020, '', '', '2013-06-08 14:03:57', '9');
INSERT INTO wiki_content_versions VALUES ('38', '2', '2', '19', 0x68322E20312F20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A68322E20322F20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20332F20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A3129205365742074686520736561726368202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A68322E20342F20486F7720746F20656D626564206120766964656F20706C6179657220696E20776562207061676573203F20200D0A0D0A31292077697468204A5720506C61796572203A20687474703A2F2F7777772E6C6F6E677461696C766964656F2E636F6D2F737570706F72742F6A772D706C617965722F0D0A0D0A32292077697468204F534D46205374726F626520706C61796572203A20687474703A2F2F7777772E6F736D662E6F72672F7374726F62655F6D65646961706C61796261636B2E68746D6C0D0A0D0A33EFBC89E585B3E4BA8EE59CA84945E4B88BE692ADE694BEE8A786E9A291EFBC8C77696E646F7773206D6564696120706C6179657220E5AFB92061766920E6A0BCE5BC8FE694AFE68C81E6AF94E8BE83E5A5BD0D0A2020, '', '', '2013-06-21 09:33:25', '10');
INSERT INTO wiki_content_versions VALUES ('39', '3', '3', '3', 0x486572652061202264656D6F223A687474703A2F2F31302E3136382E312E3235303A383838382F66696C6555706C6F616420492077726F7465206F662053574655706C6F61642E, '', '', '2013-06-26 10:38:23', '1');
INSERT INTO wiki_content_versions VALUES ('40', '3', '3', '3', 0x496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A, '', '', '2013-06-26 10:39:29', '2');
INSERT INTO wiki_content_versions VALUES ('42', '5', '5', '3', 0x68312E204C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49450D0A0D0A0D0A, '', '', '2013-06-28 16:36:28', '1');
INSERT INTO wiki_content_versions VALUES ('43', '5', '5', '18', 0x68312E204C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49450D0A0D0A0D0AE997AEE9A2983A20E59CA84945E4B8AD6A73E5A484E79086E5A4A7E695B0E68DAEE79A84E68AA5E8A1A8E4BFA1E681AFEFBC8CE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1863AE5819CE6ADA2E8BF90E8A18CE6ADA4E8849AE69CACE59097EFBC9F202020E6ADA4E9A1B5E99DA2E4B88AE79A84E8849AE69CACE980A0E68890576562E6B58FE8A788E599A8E8BF90E8A18CE9809FE5BAA6E5878FE685A2EFBC8CE5A682E69E9CE7BBA7E7BBADE8BF90E8A18CEFBC8CE4BDA0E79A84E8AEA1E7AE97E69CBAE58FAFE883BDE5819CE6ADA2E79BB8E5BA94E380820D0A0D0AE782B9E587BBE698AFEFBC8CE4BC9AE698BEE7A4BAE68AA5E8A1A8E79A84E983A8E58886E58685E5AEB9EFBC9BE782B9E587BBE590A6EFBC8CE4BC9AE8BF9EE7BBADE5BCB9E587BAE587A0E6ACA1EFBC8CE79BB4E887B36A73E8BF90E8A18CE5AE8CE68890EFBC8CE5AE8CE585A8E698BEE7A4BAE4BFA1E681AFE380820D0A0D0AE8A7A3E586B3E696B9E6B3953A2031E38081E68993E5BC80E6B3A8E5868CE8A1A8484B45595F43555252454E545F555345525C536F6674776172655C4D6963726F736F66745C496E7465726E65744578706C6F7265725C5374796C6573EFBC8CE5A682E69E9C205374796C657320E994AEE4B88DE5AD98E59CA8EFBC8CE5889BE5BBBAE8B083E794A8205374796C657320E79A84E4B880E4B8AAE696B0E79A84E9A1B9E38082202020202020202020200D0A2020202020202020202032E38081E5889BE5BBBAE696B0E79A844D617853637269707453746174656D656E7473EFBC8844574F5244E580BCEFBC89EFBC8CE8AEBEE7BDAEE585B6E580BCE4B8BA307846464646464646460D0A0D0AE4BFAEE694B9E5AE8CE68890E5908EEFBC8C4945E4B88DE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1860D0A0D0A0D0A, '', '', '2013-06-28 16:50:00', '2');
INSERT INTO wiki_content_versions VALUES ('44', '5', '5', '3', 0x68312E204C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49450D0A0D0A0D0AE997AEE9A2983A20E59CA84945E4B8AD6A73E5A484E79086E5A4A7E695B0E68DAEE79A84E68AA5E8A1A8E4BFA1E681AFEFBC8CE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1863A22E5819CE6ADA2E8BF90E8A18CE6ADA4E8849AE69CACE59097EFBC9F202020E6ADA4E9A1B5E99DA2E4B88AE79A84E8849AE69CACE980A0E68890576562E6B58FE8A788E599A8E8BF90E8A18CE9809FE5BAA6E5878FE685A2EFBC8CE5A682E69E9CE7BBA7E7BBADE8BF90E8A18CEFBC8CE4BDA0E79A84E8AEA1E7AE97E69CBAE58FAFE883BDE5819CE6ADA2E79BB8E5BA9422E380820D0A0D0AE782B9E587BBE698AFEFBC8CE4BC9AE698BEE7A4BAE68AA5E8A1A8E79A84E983A8E58886E58685E5AEB9EFBC9BE782B9E587BBE590A6EFBC8CE4BC9AE8BF9EE7BBADE5BCB9E587BAE587A0E6ACA1EFBC8CE79BB4E887B36A73E8BF90E8A18CE5AE8CE68890EFBC8CE5AE8CE585A8E698BEE7A4BAE4BFA1E681AFE380820D0A0D0AE8A7A3E586B3E696B9E6B3953A2031E38081E68993E5BC80E6B3A8E5868CE8A1A8484B45595F43555252454E545F555345525C536F6674776172655C4D6963726F736F66745C496E7465726E65744578706C6F7265725C5374796C6573EFBC8CE5A682E69E9C205374796C657320E994AEE4B88DE5AD98E59CA8EFBC8CE5889BE5BBBAE8B083E794A8205374796C657320E79A84E4B880E4B8AAE696B0E79A84E9A1B9E38082202020202020202020200D0A2020202020202020202032E38081E5889BE5BBBAE696B0E79A844D617853637269707453746174656D656E7473EFBC8844574F5244E580BCEFBC89EFBC8CE8AEBEE7BDAEE585B6E580BCE4B8BA307846464646464646460D0A0D0AE4BFAEE694B9E5AE8CE68890E5908EEFBC8C4945E4B88DE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1860D0A0D0A0D0A0D0A, '', '', '2013-06-28 16:53:40', '3');
INSERT INTO wiki_content_versions VALUES ('45', '5', '5', '3', 0x68312E204C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49450D0A0D0A0D0AE997AEE9A2983A20E59CA84945E4B8AD6A73E5A484E79086E5A4A7E695B0E68DAEE79A84E68AA5E8A1A8E4BFA1E681AFEFBC8CE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1863A22E5819CE6ADA2E8BF90E8A18CE6ADA4E8849AE69CACE59097EFBC9F202020E6ADA4E9A1B5E99DA2E4B88AE79A84E8849AE69CACE980A0E68890576562E6B58FE8A788E599A8E8BF90E8A18CE9809FE5BAA6E5878FE685A2EFBC8CE5A682E69E9CE7BBA7E7BBADE8BF90E8A18CEFBC8CE4BDA0E79A84E8AEA1E7AE97E69CBAE58FAFE883BDE5819CE6ADA2E79BB8E5BA9422E380820D0A0D0AE782B9E587BBE698AFEFBC8CE4BC9AE698BEE7A4BAE68AA5E8A1A8E79A84E983A8E58886E58685E5AEB9EFBC9BE782B9E587BBE590A6EFBC8CE4BC9AE8BF9EE7BBADE5BCB9E587BAE587A0E6ACA1EFBC8CE79BB4E887B36A73E8BF90E8A18CE5AE8CE68890EFBC8CE5AE8CE585A8E698BEE7A4BAE4BFA1E681AFE380820D0A0D0AE8A7A3E586B3E696B9E6B3953A200D0A0D0A31E38081E68993E5BC80E6B3A8E5868CE8A1A8484B45595F43555252454E545F555345525C536F6674776172655C4D6963726F736F66745C496E7465726E65744578706C6F7265725C5374796C6573EFBC8CE5A682E69E9C205374796C657320E994AEE4B88DE5AD98E59CA8EFBC8CE5889BE5BBBAE8B083E794A8205374796C657320E79A84E4B880E4B8AAE696B0E79A84E9A1B9E38082202020202020202020200D0A0D0A32E38081E5889BE5BBBAE696B0E79A844D617853637269707453746174656D656E7473EFBC8844574F5244E580BCEFBC89EFBC8CE8AEBEE7BDAEE585B6E580BCE4B8BA307846464646464646460D0A0D0AE4BFAEE694B9E5AE8CE68890E5908EEFBC8C4945E4B88DE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1860D0A0D0A0D0A0D0A, '', '', '2013-06-28 16:54:04', '4');
INSERT INTO wiki_content_versions VALUES ('46', '5', '5', '18', 0x68312E204C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49450D0A0D0A0D0AE997AEE9A2983A20E59CA84945E4B8AD6A73E5A484E79086E5A4A7E695B0E68DAEE79A84E68AA5E8A1A8E4BFA1E681AFEFBC8CE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1863A22E5819CE6ADA2E8BF90E8A18CE6ADA4E8849AE69CACE59097EFBC9F202020E6ADA4E9A1B5E99DA2E4B88AE79A84E8849AE69CACE980A0E68890576562E6B58FE8A788E599A8E8BF90E8A18CE9809FE5BAA6E5878FE685A2EFBC8CE5A682E69E9CE7BBA7E7BBADE8BF90E8A18CEFBC8CE4BDA0E79A84E8AEA1E7AE97E69CBAE58FAFE883BDE5819CE6ADA2E79BB8E5BA9422E380820D0A21687474703A2F2F31302E3136382E312E3235313A333030302F6174746163686D656E74732F646F776E6C6F61642F3133312F515125453625383825414125453525394225424532303133303632383136303431342E6A7067210D0AE782B9E587BBE698AFEFBC8CE4BC9AE698BEE7A4BAE68AA5E8A1A8E79A84E983A8E58886E58685E5AEB9EFBC9BE782B9E587BBE590A6EFBC8CE4BC9AE8BF9EE7BBADE5BCB9E587BAE587A0E6ACA1EFBC8CE79BB4E887B36A73E8BF90E8A18CE5AE8CE68890EFBC8CE5AE8CE585A8E698BEE7A4BAE4BFA1E681AFE380820D0A0D0AE8A7A3E586B3E696B9E6B3953A200D0A0D0A31E38081E68993E5BC80E6B3A8E5868CE8A1A8484B45595F43555252454E545F555345525C536F6674776172655C4D6963726F736F66745C496E7465726E65744578706C6F7265725C5374796C6573EFBC8CE5A682E69E9C205374796C657320E994AEE4B88DE5AD98E59CA8EFBC8CE5889BE5BBBAE8B083E794A8205374796C657320E79A84E4B880E4B8AAE696B0E79A84E9A1B9E38082202020202020202020200D0A0D0A32E38081E5889BE5BBBAE696B0E79A844D617853637269707453746174656D656E7473EFBC8844574F5244E580BCEFBC89EFBC8CE8AEBEE7BDAEE585B6E580BCE4B8BA307846464646464646460D0A0D0AE4BFAEE694B9E5AE8CE68890E5908EEFBC8C4945E4B88DE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1860D0A0D0A0D0A0D0A, '', '', '2013-06-28 16:58:35', '5');
INSERT INTO wiki_content_versions VALUES ('47', '5', '5', '3', 0x68312E204C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49450D0A0D0A0D0A68322E20E997AEE9A2983A200D0AE59CA84945E4B8AD6A73E5A484E79086E5A4A7E695B0E68DAEE79A84E68AA5E8A1A8E4BFA1E681AFEFBC8CE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1863A22E5819CE6ADA2E8BF90E8A18CE6ADA4E8849AE69CACE59097EFBC9F202020E6ADA4E9A1B5E99DA2E4B88AE79A84E8849AE69CACE980A0E68890576562E6B58FE8A788E599A8E8BF90E8A18CE9809FE5BAA6E5878FE685A2EFBC8CE5A682E69E9CE7BBA7E7BBADE8BF90E8A18CEFBC8CE4BDA0E79A84E8AEA1E7AE97E69CBAE58FAFE883BDE5819CE6ADA2E79BB8E5BA9422E380820D0A21687474703A2F2F31302E3136382E312E3235313A333030302F6174746163686D656E74732F646F776E6C6F61642F3133322F515125453625383825414125453525394225424532303133303632383136303431342E6A7067210D0AE782B9E587BBE698AFEFBC8CE4BC9AE698BEE7A4BAE68AA5E8A1A8E79A84E983A8E58886E58685E5AEB9EFBC9BE782B9E587BBE590A6EFBC8CE4BC9AE8BF9EE7BBADE5BCB9E587BAE587A0E6ACA1EFBC8CE79BB4E887B36A73E8BF90E8A18CE5AE8CE68890EFBC8CE5AE8CE585A8E698BEE7A4BAE4BFA1E681AFE380820D0A0D0A68322E20E8A7A3E586B3E696B9E6B3953A200D0A31E38081E68993E5BC80E6B3A8E5868CE8A1A8484B45595F43555252454E545F555345525C536F6674776172655C4D6963726F736F66745C496E7465726E65744578706C6F7265725C5374796C6573EFBC8CE5A682E69E9C205374796C657320E994AEE4B88DE5AD98E59CA8EFBC8CE5889BE5BBBAE8B083E794A8205374796C657320E79A84E4B880E4B8AAE696B0E79A84E9A1B9E38082202020202020202020200D0A32E38081E5889BE5BBBAE696B0E79A844D617853637269707453746174656D656E7473EFBC8844574F5244E580BCEFBC89EFBC8CE8AEBEE7BDAEE585B6E580BCE4B8BA307846464646464646460D0AE4BFAEE694B9E5AE8CE68890E5908EEFBC8C4945E4B88DE4BC9AE5BCB9E587BAE998BBE6ADA2E5AFB9E8AF9DE6A1860D0A0D0A0D0A, '', '', '2013-06-28 17:06:17', '6');
INSERT INTO wiki_content_versions VALUES ('48', '2', '2', '10', 0x68322E20312F20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A3429204578616D706C6520696E204A617661206F6620686F7720746F20757365202A5F7365617263685F2A206D6574686F642077697468202A5F7461736B53656172636843726974657269615F2A20696E70757420706172616D6574657220287365742062792073657457617463686564466F6C64657249642C207365744D696E4372656174696F6E4461746520616E64207365744D61784372656174696F6E4461746529203A0D0A687474703A2F2F74656C656672616D652E786963702E6E65743A333030302F6174746163686D656E74732F646F776E6C6F61642F3133332F53686F774C6173745461736B427957617463686564466F6C646572546573742E6A6176610D0A5B5B53686F774C6173745461736B427957617463686564466F6C646572546573742E6A6176615D5D3A687474703A2F2F74656C656672616D652E786963702E6E65743A333030302F6174746163686D656E74732F646F776E6C6F61642F3133332F53686F774C6173745461736B427957617463686564466F6C646572546573742E6A6176610D0A0D0A68322E20322F20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20332F20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A3129205365742074686520736561726368202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A68322E20342F20486F7720746F20656D626564206120766964656F20706C6179657220696E20776562207061676573203F20200D0A0D0A31292077697468204A5720506C61796572203A20687474703A2F2F7777772E6C6F6E677461696C766964656F2E636F6D2F737570706F72742F6A772D706C617965722F0D0A0D0A32292077697468204F534D46205374726F626520706C61796572203A20687474703A2F2F7777772E6F736D662E6F72672F7374726F62655F6D65646961706C61796261636B2E68746D6C0D0A0D0A33EFBC89E585B3E4BA8EE59CA84945E4B88BE692ADE694BEE8A786E9A291EFBC8C77696E646F7773206D6564696120706C6179657220E5AFB92061766920E6A0BCE5BC8FE694AFE68C81E6AF94E8BE83E5A5BD0D0A2020, '', '', '2013-07-02 11:34:07', '11');
INSERT INTO wiki_content_versions VALUES ('49', '2', '2', '10', 0x68322E20312F20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A3429204578616D706C6520696E204A617661206F6620686F7720746F20757365202A5F7365617263685F2A206D6574686F642077697468202A5F7461736B53656172636843726974657269615F2A20696E70757420706172616D6574657220287365742062792073657457617463686564466F6C64657249642C207365744D696E4372656174696F6E4461746520616E64207365744D61784372656174696F6E4461746529203A0D0A2253686F774C6173745461736B427957617463686564466F6C646572546573742E6A617661223A687474703A2F2F74656C656672616D652E786963702E6E65743A333030302F6174746163686D656E74732F646F776E6C6F61642F3133332F53686F774C6173745461736B427957617463686564466F6C646572546573742E6A6176610D0A0D0A0D0A68322E20322F20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20332F20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A3129205365742074686520736561726368202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A68322E20342F20486F7720746F20656D626564206120766964656F20706C6179657220696E20776562207061676573203F20200D0A0D0A31292077697468204A5720506C61796572203A20687474703A2F2F7777772E6C6F6E677461696C766964656F2E636F6D2F737570706F72742F6A772D706C617965722F0D0A0D0A32292077697468204F534D46205374726F626520706C61796572203A20687474703A2F2F7777772E6F736D662E6F72672F7374726F62655F6D65646961706C61796261636B2E68746D6C0D0A0D0A33EFBC89E585B3E4BA8EE59CA84945E4B88BE692ADE694BEE8A786E9A291EFBC8C77696E646F7773206D6564696120706C6179657220E5AFB92061766920E6A0BCE5BC8FE694AFE68C81E6AF94E8BE83E5A5BD0D0A2020, '', '', '2013-07-02 11:45:39', '12');
INSERT INTO wiki_content_versions VALUES ('50', '2', '2', '10', 0x68322E20312F20486F7720746F2067657420616C6C20746865207461736B732063726561746564206279206F6E652073706563696669632027776174636820666F6C64657227203F200D0A0D0A3129205573696E6720746865202A5F7365617263685F2A206D6574686F642066726F6D20746865205461736B20776562207365727669636520285461736B456E64706F696E745365727669636529203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C237365617263680D0A0D0A3229205370656369667920696E2074686520696E7075742063726974657269612074686520776174636820666F6C646572204964203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2A5F77617463686564466F6C64657249645F2A203A20546865202277617463686564466F6C646572222066726F6D20776869636820746865207461736B20686173206265656E2063726561746564200D0A0D0A3329205072656369736520746865207461736B73207374617465206966206E6563657373617279203A0D0A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C237461736B4D6163726F53746174650D0A2845444954494F4E2050524F43455353494E47204641494C454420434F4D504C455445442920090D0A0D0A3429204578616D706C6520696E204A617661206F6620686F7720746F20757365202A5F7365617263685F2A206D6574686F642077697468202A5F7461736B53656172636843726974657269615F2A20696E70757420706172616D6574657220287365742062792073657457617463686564466F6C64657249642C207365744D696E4372656174696F6E4461746520616E64207365744D61784372656174696F6E4461746529203A0D0A2253686F774C6173745461736B427957617463686564466F6C646572546573742E6A617661223A687474703A2F2F74656C656672616D652E786963702E6E65743A333030302F6174746163686D656E74732F646F776E6C6F61642F3133332F53686F774C6173745461736B427957617463686564466F6C646572546573742E6A6176610D0A0D0A0D0A68322E20322F20486F7720746F2075706C6F616420612066696C6520746F207468652073746F726167652075736572206163636F756E74203F0D0A0D0A4279207573696E6720687474703A2F2F31302E3136382E312E3136303A383038302F6170692F75706C6F61640D0A0D0A68322E205461736B206372656174652F73746172742F67657444657461696C206578616D706C6520696E204A6176612028534F415029203F0D0A0D0A436865636B206D656469616E6174652D6170692D636C69656E742D534F41505F72343538322045636C6970736520287620332E36292070726F6A656374203A206D656469616E6174652D6170692D636C69656E742E7A69702E0D0A0D0A68322E20332F20486F7720746F2073656172636820766964656F28732920616E642074696D65207374616D7028732920636F72726573706F6E64696E6720746F20737065636966696320696E707574206F626A656374206F6363757272656E6365732028652E672E20706C6174652076616C756529203F0D0A0D0A3129205365742074686520736561726368202A5F63726974657269615F2A203A20687474703A2F2F3132372E302E302E313A383038302F6170692F646174615F6E73302E68746D6C237461736B53656172636843726974657269610D0A2D205F737465705265706F7274436F6E7461696E735F203A20416E616C797369732073746570207265706F7274206D75737420636F6E7461696E207468652073706563696669656420636F6E74656E742E0D0A2D205F6D696E536F7572636554616B656E4461746554696D655F2F6D6178536F7572636554616B656E4461746554696D65203A20536F75726365206D696E696D756D2F6D6178696D756D2074616B656E4461746554696D6520200D0A0D0A32292043616C6C20687474703A2F2F3132372E302E302E313A383038302F6170692F736F61705F6E73375F5461736B456E64706F696E74536572766963652E68746D6C2373656172636820776974682074686520696E7075742063726974657269612E0D0A0D0A68322E20342F20486F7720746F20656D626564206120766964656F20706C6179657220696E20776562207061676573203F20200D0A0D0A31292077697468204A5720506C61796572203A20687474703A2F2F7777772E6C6F6E677461696C766964656F2E636F6D2F737570706F72742F6A772D706C617965722F0D0A0D0A32292077697468204F534D46205374726F626520706C61796572203A20687474703A2F2F7777772E6F736D662E6F72672F7374726F62655F6D65646961706C61796261636B2E68746D6C0D0A0D0A33EFBC89E585B3E4BA8EE59CA84945E4B88BE692ADE694BEE8A786E9A291EFBC8C77696E646F7773206D6564696120706C6179657220E5AFB92061766920E6A0BCE5BC8FE694AFE68C81E6AF94E8BE83E5A5BD0D0A0D0A68322E20342F20486F7720746F207365742074616B656E4461746554696D652C2074616B656E506F736974696F6E20616E642074616B656E43616D657261496420696E204D656469616E617465203F0D0A0D0A5365742074686520226D65746164617461223A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C23736F757263654D65746164617461206F66202273696D706C65536F75726365223A687474703A2F2F31302E3136382E312E3136303A383038302F6170692F646174615F6E73302E68746D6C2373696D706C65536F757263652E0D0A0D0A0D0A0D0A2020, '', '', '2013-07-02 16:53:08', '13');
INSERT INTO wiki_content_versions VALUES ('51', '3', '3', '10', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A5B5B4261636B7570206F66206461746120626173655D5D0D0A2020, '', '', '2013-07-10 10:42:52', '3');
INSERT INTO wiki_content_versions VALUES ('52', '3', '3', '10', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A5B5B4261636B7570206F66206461746120626173655D5D0D0A2020, '', '', '2013-07-10 10:43:11', '4');
INSERT INTO wiki_content_versions VALUES ('53', '3', '3', '10', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A5B5B312E31294261636B7570206F66206461746120626173655D5D0D0A2020, '', '', '2013-07-10 10:44:13', '5');
INSERT INTO wiki_content_versions VALUES ('54', '3', '3', '10', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A5B5B312E3129204261636B7570206F6620746865206461746120626173655D5D0D0A2020, '', '', '2013-07-10 10:44:42', '6');
INSERT INTO wiki_content_versions VALUES ('57', '7', '7', '3', 0x68312E4261636B7570206F6620746865206461746120626173650D0A0D0A636F6D6D616E64EFBC9A0D0A3C7072653E0D0A6D7973716C64756D70202D2D6F7074202D682031302E3136382E312E323530202D502033333036202D7520726F6F74202D2D70617373776F72643D74656C656672616D653230313330333031202D2D6C6F636B2D616C6C2D7461626C65733D7472756520202D2D726573756C742D66696C653D22443A2F44424261636B55702F323031333731303130353835342E73716C2220202D2D64656661756C742D6368617261637465722D7365743D7574663820436C6F756452657472696576616C0D0A3C2F7072653E0D0A0D0A68322E20536F6D65205141730D0A0D0A68332E2057696E646F772053797374656D0D0A49662077652075736520206A61766120636F6465206261636B75702064617461206261736520776974682070726F636573732E657865632822636F6D6D616E6422292C20736F6D6574696D65732069742072756E73206661696C65642C20626563617573652074686520617574686F726974792E0D0A0D0A4920676F7420616F7468657220676F6F64206D6574686F642E0D0A3129206D6469722061206E657720666F6C6465722C20652E673A20643A5C776562617070730D0A3229207365742074686520746F6D63617420636F6E66696775726174696F6E2C2066696E642025544F4D4341545F484F4D45252F636F6E662F7365727665722E786D6C20616E64206D6F6469667920746865202261707042617365222061732073686F776E2062656C6F773A0D0A3C7072653E0D0A3C486F7374206E616D653D226C6F63616C686F7374222020617070426173653D22643A5C77656261707073220D0A202020202020202020202020756E7061636B574152733D227472756522206175746F4465706C6F793D2274727565220D0A202020202020202020202020786D6C56616C69646174696F6E3D2266616C73652220786D6C4E616D65737061636541776172653D2266616C7365223E0D0A3C2F7072653E0D0A33292072756E20746F6D63617420736572766963650D0A3C7072653E0D0A70757368642025544F4D4341545F484F4D45252F62696E0D0A6A617661202D6A617220626F6F7473747261702E6A61720D0A3C2F7072653E0D0A0D0A68332E204C696E75780D0A4E65656420746573742E, '', '', '2013-07-10 12:25:46', '1');
INSERT INTO wiki_content_versions VALUES ('58', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A5B5B312E31294261636B7570206461746120626173655D5D0D0A2020, '', '', '2013-07-10 12:26:22', '7');
INSERT INTO wiki_content_versions VALUES ('59', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B4261636B7570206461746120626173655D0D0A2020, '', '', '2013-07-10 12:26:54', '8');
INSERT INTO wiki_content_versions VALUES ('60', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B5B4261636B7570206461746120626173655D5D0D0A2020, '', '', '2013-07-10 12:27:36', '9');
INSERT INTO wiki_content_versions VALUES ('61', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B5B4261636B7570206461746120626173655D5D0D0A20200D0A68322E2032294954530D0A312E3229205B5B4C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49455D5D, '', '', '2013-07-10 12:29:37', '10');
INSERT INTO wiki_content_versions VALUES ('62', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E20312920546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B5B4261636B7570206461746120626173655D5D0D0A20200D0A68322E2032294954530D0A0D0A322E3129205B5B4C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49455D5D, '', '', '2013-07-10 12:30:20', '11');
INSERT INTO wiki_content_versions VALUES ('63', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E2031292020546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B5B4261636B7570206461746120626173655D5D0D0A20200D0A68322E203229204954530D0A0D0A322E3129205B5B4C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49455D5D, '', '', '2013-07-10 13:47:56', '12');
INSERT INTO wiki_content_versions VALUES ('64', '7', '7', '3', 0x68312E4261636B7570206F6620746865206461746120626173650D0A0D0A636F6D6D616E64EFBC9A0D0A3C7072653E0D0A6D7973716C64756D70202D2D6F7074202D682031302E3136382E312E323530202D502033333036202D7520726F6F74202D2D70617373776F72643D74656C656672616D653230313330333031202D2D6C6F636B2D616C6C2D7461626C65733D7472756520202D2D726573756C742D66696C653D22443A2F44424261636B55702F323031333731303130353835342E73716C2220202D2D64656661756C742D6368617261637465722D7365743D7574663820436C6F756452657472696576616C0D0A3C2F7072653E0D0A0D0A68322E20536F6D65205141730D0A0D0A68332E2057696E646F77732053797374656D0D0A49662077652075736520206A61766120636F6465206261636B75702064617461206261736520776974682070726F636573732E657865632822636F6D6D616E6422292C20736F6D6574696D65732069742072756E73206661696C65642C20626563617573652074686520617574686F726974792E0D0A0D0A4920676F7420616F7468657220676F6F64206D6574686F642E0D0A3129206D6469722061206E657720666F6C6465722C20652E673A20643A5C776562617070730D0A3229207365742074686520746F6D63617420636F6E66696775726174696F6E2C2066696E642025544F4D4341545F484F4D45252F636F6E662F7365727665722E786D6C20616E64206D6F6469667920746865202261707042617365222061732073686F776E2062656C6F773A0D0A3C7072653E0D0A3C486F7374206E616D653D226C6F63616C686F7374222020617070426173653D22643A5C77656261707073220D0A202020202020202020202020756E7061636B574152733D227472756522206175746F4465706C6F793D2274727565220D0A202020202020202020202020786D6C56616C69646174696F6E3D2266616C73652220786D6C4E616D65737061636541776172653D2266616C7365223E0D0A3C2F7072653E0D0A33292072756E20746F6D63617420736572766963650D0A3C7072653E0D0A70757368642025544F4D4341545F484F4D45252F62696E0D0A6A617661202D6A617220626F6F7473747261702E6A61720D0A3C2F7072653E0D0A0D0A68332E204C696E75780D0A4E65656420746573742E, '', '', '2013-07-10 13:50:05', '2');
INSERT INTO wiki_content_versions VALUES ('65', '7', '7', '3', 0x68312E204261636B7570206F6620746865206461746120626173650D0A0D0A636F6D6D616E64EFBC9A0D0A3C7072653E0D0A6D7973716C64756D70202D2D6F7074202D682031302E3136382E312E323530202D502033333036202D7520726F6F74202D2D70617373776F72643D74656C656672616D653230313330333031202D2D6C6F636B2D616C6C2D7461626C65733D7472756520202D2D726573756C742D66696C653D22443A2F44424261636B55702F323031333731303130353835342E73716C2220202D2D64656661756C742D6368617261637465722D7365743D7574663820436C6F756452657472696576616C0D0A3C2F7072653E0D0A0D0A68322E20536F6D65205141730D0A0D0A68332E2057696E646F77732053797374656D0D0A49662077652075736520206A61766120636F6465206261636B75702064617461206261736520776974682070726F636573732E657865632822636F6D6D616E6422292C20736F6D6574696D65732069742072756E73206661696C65642C20626563617573652074686520617574686F726974792E0D0A0D0A4920676F7420616F7468657220676F6F64206D6574686F642E0D0A3129206D6469722061206E657720666F6C6465722C20652E673A20643A5C776562617070730D0A3229207365742074686520746F6D63617420636F6E66696775726174696F6E2C2066696E642025544F4D4341545F484F4D45252F636F6E662F7365727665722E786D6C20616E64206D6F6469667920746865202261707042617365222061732073686F776E2062656C6F773A0D0A3C7072653E0D0A3C486F7374206E616D653D226C6F63616C686F7374222020617070426173653D22643A5C77656261707073220D0A202020202020202020202020756E7061636B574152733D227472756522206175746F4465706C6F793D2274727565220D0A202020202020202020202020786D6C56616C69646174696F6E3D2266616C73652220786D6C4E616D65737061636541776172653D2266616C7365223E0D0A3C2F7072653E0D0A33292072756E20746F6D63617420736572766963650D0A3C7072653E0D0A70757368642025544F4D4341545F484F4D45252F62696E0D0A6A617661202D6A617220626F6F7473747261702E6A61720D0A3C2F7072653E0D0A0D0A68332E204C696E75780D0A4E65656420746573742E, '', '', '2013-07-10 13:50:44', '3');
INSERT INTO wiki_content_versions VALUES ('66', '8', '8', '3', 0x68312E20436F6E76657274204A6176612050726F6A65637420546F20616E6F7468657220547970652050726F6A6563740D0A0D0A0D0A, '', '', '2013-07-15 14:02:46', '1');
INSERT INTO wiki_content_versions VALUES ('67', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68322E2031292020546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B5B4261636B7570206461746120626173655D5D0D0A20200D0A68322E203229204954530D0A0D0A322E3129205B5B4C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49455D5D0D0A0D0A332E436F6E76657274204A6176612050726F6A65637420546F20616E6F7468657220547970652050726F6A6563743A22687474703A2F2F31302E3136382E312E3235313A333030302F70726F6A656374732F5745422F77696B692F436F6E766572745F4A6176615F50726F6A6563745F546F5F616E6F746865725F547970655F50726F6A65637422, '', '', '2013-07-15 14:04:27', '13');
INSERT INTO wiki_content_versions VALUES ('68', '3', '3', '3', 0x68312E20496E74656C6C6967656E74204D6F6E69746F72696E67205765622053797374656D732057696B690D0A0D0A68312E20576562204170706C69636174696F6E730D0A0D0A68322E2031292020546865205F436C6F75642052657472696576616C2053797374656D5F20776562206170706C69636174696F6E200D0A0D0A5468697320776562206170706C69636174696F6E206973206120636C69656E74206F66204D656469616E6174652E2049742075736573204D656469616E617465207765622073657276696365732041504920666F722072657175657374696E67207468652070726F63657373696E67206F6620696E70757420766964656F2066696C657320616E6420697420676574732074686520616E616C7973697320726573756C747320746F2073746F7265207468656D20696E20697473206F776E206461746120626173652E0D0A0D0A312E31295B5B4261636B7570206461746120626173655D5D0D0A20200D0A68322E203229204954530D0A0D0A322E3129205B5B4C617267652D616D6F756E742D6F662D646174612D646973706C617965642D696E2D49455D5D0D0A0D0A68312E20496E666F726D6174696F6E732041626F7574204A6176612050726F6A6563740D0A0D0A68322E2033292E20436F6E76657274204A6176612050726F6A65637420546F20616E6F7468657220547970652050726F6A6563740D0A0D0A22436F6E76657274204A6176612050726F6A65637420546F20616E6F7468657220547970652050726F6A656374223A687474703A2F2F31302E3136382E312E3235313A333030302F70726F6A656374732F5745422F77696B692F436F6E766572745F4A6176615F50726F6A6563745F546F5F616E6F746865725F547970655F50726F6A656374, '', '', '2013-07-15 14:06:42', '14');
INSERT INTO wiki_content_versions VALUES ('69', '8', '8', '3', 0x68312E20436F6E76657274204A6176612050726F6A65637420546F20616E6F7468657220547970652050726F6A6563740D0A0D0A68332E204465736372697074696F6E3A200D0A546865726527732061206A6176612070726F6A6563742C6E6F742061207374616E64617264207765622070726F6A6563742E20496620796F752077616E7420746F20636F6E76657274207468652070726F6A656374, '', '', '2013-07-15 18:51:08', '2');

-- ----------------------------
-- Table structure for `wiki_pages`
-- ----------------------------
DROP TABLE IF EXISTS `wiki_pages`;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wiki_pages
-- ----------------------------
INSERT INTO wiki_pages VALUES ('1', '1', 'CentOS-64-redmine-23_installation', '2013-04-22 20:48:47', '1', null);
INSERT INTO wiki_pages VALUES ('2', '2', 'Wiki', '2013-06-04 16:25:27', '0', null);
INSERT INTO wiki_pages VALUES ('3', '9', 'Wiki', '2013-06-26 10:38:22', '1', null);
INSERT INTO wiki_pages VALUES ('5', '9', 'Large-amount-of-data-displayed-in-IE', '2013-06-28 16:36:28', '0', null);
INSERT INTO wiki_pages VALUES ('7', '9', 'Backup_data_base', '2013-07-10 12:25:46', '0', null);
INSERT INTO wiki_pages VALUES ('8', '9', 'Convert_Java_Project_To_another_Type_Project', '2013-07-15 14:02:46', '0', null);

-- ----------------------------
-- Table structure for `wiki_redirects`
-- ----------------------------
DROP TABLE IF EXISTS `wiki_redirects`;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wiki_redirects
-- ----------------------------
INSERT INTO wiki_redirects VALUES ('1', '1', 'Wiki', 'CentOS-64-redmine-23_installation', '2013-04-23 09:39:51');
INSERT INTO wiki_redirects VALUES ('2', '1', 'Wiki1', 'CentOS-64-redmine-23_installation', '2013-04-23 09:40:22');

-- ----------------------------
-- Table structure for `workflows`
-- ----------------------------
DROP TABLE IF EXISTS `workflows`;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflows
-- ----------------------------
INSERT INTO workflows VALUES ('1', '1', '1', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('2', '1', '1', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('3', '1', '1', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('4', '1', '1', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('5', '1', '1', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('6', '1', '2', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('7', '1', '2', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('8', '1', '2', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('9', '1', '2', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('10', '1', '2', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('11', '1', '3', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('12', '1', '3', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('13', '1', '3', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('14', '1', '3', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('15', '1', '3', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('16', '1', '4', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('17', '1', '4', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('18', '1', '4', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('19', '1', '4', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('20', '1', '4', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('21', '1', '5', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('22', '1', '5', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('23', '1', '5', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('24', '1', '5', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('25', '1', '5', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('26', '1', '6', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('27', '1', '6', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('28', '1', '6', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('29', '1', '6', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('30', '1', '6', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('31', '2', '1', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('32', '2', '1', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('33', '2', '1', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('34', '2', '1', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('35', '2', '1', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('36', '2', '2', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('37', '2', '2', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('38', '2', '2', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('39', '2', '2', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('40', '2', '2', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('41', '2', '3', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('42', '2', '3', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('43', '2', '3', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('44', '2', '3', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('45', '2', '3', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('46', '2', '4', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('47', '2', '4', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('48', '2', '4', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('49', '2', '4', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('50', '2', '4', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('51', '2', '5', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('52', '2', '5', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('53', '2', '5', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('54', '2', '5', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('55', '2', '5', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('56', '2', '6', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('57', '2', '6', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('58', '2', '6', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('59', '2', '6', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('60', '2', '6', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('61', '3', '1', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('62', '3', '1', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('63', '3', '1', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('64', '3', '1', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('65', '3', '1', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('66', '3', '2', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('67', '3', '2', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('68', '3', '2', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('69', '3', '2', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('70', '3', '2', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('71', '3', '3', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('72', '3', '3', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('73', '3', '3', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('74', '3', '3', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('75', '3', '3', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('76', '3', '4', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('77', '3', '4', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('78', '3', '4', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('79', '3', '4', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('80', '3', '4', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('81', '3', '5', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('82', '3', '5', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('83', '3', '5', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('84', '3', '5', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('85', '3', '5', '6', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('86', '3', '6', '1', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('87', '3', '6', '2', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('88', '3', '6', '3', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('89', '3', '6', '4', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('90', '3', '6', '5', '3', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('91', '1', '1', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('92', '1', '1', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('93', '1', '1', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('94', '1', '1', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('95', '1', '2', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('96', '1', '2', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('97', '1', '2', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('98', '1', '3', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('99', '1', '3', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('100', '1', '3', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('101', '1', '4', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('102', '1', '4', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('103', '1', '4', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('104', '2', '1', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('105', '2', '1', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('106', '2', '1', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('107', '2', '1', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('108', '2', '2', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('109', '2', '2', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('110', '2', '2', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('111', '2', '3', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('112', '2', '3', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('113', '2', '3', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('114', '2', '4', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('115', '2', '4', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('116', '2', '4', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('117', '3', '1', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('118', '3', '1', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('119', '3', '1', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('120', '3', '1', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('121', '3', '2', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('122', '3', '2', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('123', '3', '2', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('124', '3', '3', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('125', '3', '3', '4', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('126', '3', '3', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('127', '3', '4', '2', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('128', '3', '4', '3', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('129', '3', '4', '5', '4', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('130', '1', '1', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('131', '1', '2', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('132', '1', '3', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('133', '1', '4', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('134', '1', '3', '4', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('135', '2', '1', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('136', '2', '2', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('137', '2', '3', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('138', '2', '4', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('139', '2', '3', '4', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('140', '3', '1', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('141', '3', '2', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('142', '3', '3', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('143', '3', '4', '5', '5', '0', '0', 'WorkflowTransition', null, null);
INSERT INTO workflows VALUES ('144', '3', '3', '4', '5', '0', '0', 'WorkflowTransition', null, null);

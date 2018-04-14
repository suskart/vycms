-- CLTPHP SQL Backup
-- Time:2018-04-14 12:56:49
-- http://www.vycms.com 

--
-- 表的结构 `vy_ad`
-- 
DROP TABLE IF EXISTS `vy_ad`;
CREATE TABLE `vy_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) NOT NULL COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  `content` varchar(225) DEFAULT '' COMMENT '广告内容',
  PRIMARY KEY (`ad_id`),
  KEY `plug_ad_adtypeid` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- 
-- 导出`vy_ad`表中的数据 `vy_ad`
--
INSERT INTO `vy_ad` VALUES (15,'CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站',1,'/uploads/20170911/d6efb1bcdf1c588a0da7eddf170d33c7.png','http://demo.cltphp.com',1480909037,1,1,'虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。');
INSERT INTO `vy_ad` VALUES (17,'即使是后台我们也极力追求尽善尽美',1,'/uploads/20170911/6d5d9f04d79aaf813d3d8ef9e5475218.png','http://demo.cltphp.com',1481788850,2,1,'CLTPHP采用了优美的layui框架，一面极简，一面丰盈。加上angular Js，让数据交互变得更为简洁直白。用最基础的代码，实现最强大的效果，让你欲罢不能！');
INSERT INTO `vy_ad` VALUES (18,'ThinkPHP5极大的提高了CLTPHP的可拓展性',1,'/uploads/20170911/f83ecfd46c3473192708c0042378a18d.png','http://demo.cltphp.com',1481788869,3,1,'CLTPHP采用的ThinkPHP5为基础框架，从而使得CLTPHP的拓展性变的极为强大。从模型构造到栏目建立，再到前台展示，一气呵成，网站后台一条龙式操作，让小白用户能快速掌握CLTPHP管理系统的核心操作，让小白开发者能更好的理解CLTPHP的核心构建价值。');
--
-- 表的结构 `vy_ad_type`
-- 
DROP TABLE IF EXISTS `vy_ad_type`;
CREATE TABLE `vy_ad_type` (
  `type_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `sort` int(11) NOT NULL COMMENT '广告位排序',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='广告分类';

-- 
-- 导出`vy_ad_type`表中的数据 `vy_ad_type`
--
INSERT INTO `vy_ad_type` VALUES (1,'【首页】顶部轮播',1);
INSERT INTO `vy_ad_type` VALUES (5,'【内页】横幅',2);
--
-- 表的结构 `vy_admin`
-- 
DROP TABLE IF EXISTS `vy_admin`;
CREATE TABLE `vy_admin` (
  `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `password` varchar(70) NOT NULL COMMENT '管理员密码',
  `group_id` mediumint(8) DEFAULT NULL COMMENT '分组ID',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `mdemail` varchar(50) DEFAULT '0' COMMENT '传递修改密码参数加密',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '审核状态',
  `avatar` varchar(120) DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`admin_id`),
  KEY `admin_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- 
-- 导出`vy_admin`表中的数据 `vy_admin`
--
INSERT INTO `vy_admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e',1,'455623609@qq.com','','13160659592','127.0.0.1',1482132862,'0',1,'/uploads/20180119/50fa71996b7a82f2d3e609e6564fdf43.jpg');
--
-- 表的结构 `vy_auth_group`
-- 
DROP TABLE IF EXISTS `vy_auth_group`;
CREATE TABLE `vy_auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '全新ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `rules` longtext COMMENT '规则',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员分组';

-- 
-- 导出`vy_auth_group`表中的数据 `vy_auth_group`
--
INSERT INTO `vy_auth_group` VALUES (1,'超级管理员',1,'0,1,2,277,270,15,16,119,120,121,145,17,149,116,117,118,151,181,18,108,114,112,109,110,111,3,5,128,127,126,4,230,232,129,189,190,193,192,240,239,241,243,244,245,242,246,7,9,14,234,13,235,236,237,238,27,29,161,163,164,162,38,167,182,169,166,28,48,247,248,31,32,249,250,251,45,170,171,175,174,173,46,176,183,179,178,265,196,197,202,198,252,253,254,255,256,203,205,204,257,272,267,269,206,207,212,208,213,258,259,260,261,262,209,215,214,263,273,',1465114224);
INSERT INTO `vy_auth_group` VALUES (2,'管理员',1,'0,278,1,2,270,18,108,114,112,109,110,111,15,16,120,28,48,31,32,45,170,171,175,174,173,46,176,183,179,178,7,9,14,13,27,29,161,163,164,162,38,167,182,169,166,',1465114224);
INSERT INTO `vy_auth_group` VALUES (3,'商品管理员',1,'27,29,161,163,164,162,38,167,182,169,166,',1465114224);
--
-- 表的结构 `vy_auth_rule`
-- 
DROP TABLE IF EXISTS `vy_auth_rule`;
CREATE TABLE `vy_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '' COMMENT '权限点',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型（拓展字段）',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL COMMENT '菜单状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 COMMENT='权限节点';

-- 
-- 导出`vy_auth_rule`表中的数据 `vy_auth_rule`
--
INSERT INTO `vy_auth_rule` VALUES (1,'System','系统设置',1,1,0,'icon-cogs','',278,0,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (2,'System/system','系统设置',1,1,0,'fa fa-modx2','',1,1,1446535789,1,1);
INSERT INTO `vy_auth_rule` VALUES (3,'Database','数据库管理',1,1,0,'icon-database','',278,2,1446535805,1,1);
INSERT INTO `vy_auth_rule` VALUES (4,'Database/restore','还原数据库',1,1,0,'','',3,10,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (5,'Database/database','数据库备份',1,1,0,'','',3,1,1446535834,1,1);
INSERT INTO `vy_auth_rule` VALUES (7,'Category','栏目管理',1,1,0,'icon-list','',279,4,1446535875,1,1);
INSERT INTO `vy_auth_rule` VALUES (9,'Category/index','栏目列表',1,1,0,'','',7,0,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (13,'Category/edit','操作-修改',1,1,0,'','',9,3,1446535750,1,0);
INSERT INTO `vy_auth_rule` VALUES (14,'Category/add','操作-添加',1,1,0,'','',9,0,1446535750,1,0);
INSERT INTO `vy_auth_rule` VALUES (15,'Auth/','管理员管理',1,1,0,'icon-lifebuoy','',278,1,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (16,'Auth/adminList','管理员列表',1,1,0,'','',15,0,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (17,'Auth/adminGroup','管理组列表',1,1,0,'','',15,1,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (18,'Auth/adminRule','后台菜单',1,1,0,'','',1,20,1446535750,1,1);
INSERT INTO `vy_auth_rule` VALUES (23,'Help/soft','软件下载',1,1,0,'','',22,50,1446711421,0,1);
INSERT INTO `vy_auth_rule` VALUES (27,'Users','会员管理',1,1,0,'icon-user','',280,5,1447231507,1,1);
INSERT INTO `vy_auth_rule` VALUES (28,'Function','网站功能',1,1,0,'icon-cog','',278,6,1447231590,1,1);
INSERT INTO `vy_auth_rule` VALUES (29,'Users/index','会员列表',1,1,0,'','',27,10,1447232085,1,1);
INSERT INTO `vy_auth_rule` VALUES (31,'Link/index','友情链接',1,1,0,'','',28,2,1447232183,0,1);
INSERT INTO `vy_auth_rule` VALUES (32,'Link/add','操作-添加',1,1,0,'','',31,1,1447639935,0,0);
INSERT INTO `vy_auth_rule` VALUES (36,'We/we_menu','自定义菜单',1,1,0,'','',35,50,1447842477,0,1);
INSERT INTO `vy_auth_rule` VALUES (38,'Users/userGroup','会员组',1,1,0,'','',27,50,1448413248,1,1);
INSERT INTO `vy_auth_rule` VALUES (39,'We/we_menu','自定义菜单',1,1,0,'','',36,50,1448501584,0,1);
INSERT INTO `vy_auth_rule` VALUES (45,'Ad/index','广告管理',1,1,0,'','',28,3,1450314297,1,1);
INSERT INTO `vy_auth_rule` VALUES (46,'Ad/type','广告位管理',1,1,0,'','',28,4,1450314324,1,1);
INSERT INTO `vy_auth_rule` VALUES (48,'Message/index','留言管理',1,1,0,'','',28,1,1451267354,0,1);
INSERT INTO `vy_auth_rule` VALUES (105,'System/runsys','操作-保存',1,1,0,'','',6,50,1461036331,1,0);
INSERT INTO `vy_auth_rule` VALUES (106,'System/runwesys','操作-保存',1,1,0,'','',10,50,1461037680,0,0);
INSERT INTO `vy_auth_rule` VALUES (107,'System/runemail','操作-保存',1,1,0,'','',19,50,1461039346,1,0);
INSERT INTO `vy_auth_rule` VALUES (108,'Auth/ruleAdd','操作-添加',1,1,0,'','',18,0,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (109,'Auth/ruleState','操作-状态',1,1,0,'','',18,5,1461550949,1,0);
INSERT INTO `vy_auth_rule` VALUES (110,'Auth/ruleTz','操作-验证',1,1,0,'','',18,6,1461551129,1,0);
INSERT INTO `vy_auth_rule` VALUES (111,'Auth/ruleorder','操作-排序',1,1,0,'','',18,7,1461551263,1,0);
INSERT INTO `vy_auth_rule` VALUES (112,'Auth/ruleDel','操作-删除',1,1,0,'','',18,4,1461551536,1,0);
INSERT INTO `vy_auth_rule` VALUES (114,'Auth/ruleEdit','操作-修改',1,1,0,'','',18,2,1461551913,1,0);
INSERT INTO `vy_auth_rule` VALUES (116,'Auth/groupEdit','操作-修改',1,1,0,'','',17,3,1461552326,1,0);
INSERT INTO `vy_auth_rule` VALUES (117,'Auth/groupDel','操作-删除',1,1,0,'','',17,30,1461552349,1,0);
INSERT INTO `vy_auth_rule` VALUES (118,'Auth/groupAccess','操作-权限',1,1,0,'','',17,40,1461552404,1,0);
INSERT INTO `vy_auth_rule` VALUES (119,'Auth/adminAdd','操作-添加',1,1,0,'','',16,0,1461553162,1,0);
INSERT INTO `vy_auth_rule` VALUES (120,'Auth/adminEdit','操作-修改',1,1,0,'','',16,2,1461554130,1,0);
INSERT INTO `vy_auth_rule` VALUES (121,'Auth/adminDel','操作-删除',1,1,0,'','',16,4,1461554152,1,0);
INSERT INTO `vy_auth_rule` VALUES (122,'System/source_runadd','操作-添加',1,1,0,'','',43,10,1461036331,1,0);
INSERT INTO `vy_auth_rule` VALUES (123,'System/source_order','操作-排序',1,1,0,'','',43,50,1461037680,1,0);
INSERT INTO `vy_auth_rule` VALUES (124,'System/source_runedit','操作-改存',1,1,0,'','',43,30,1461039346,1,0);
INSERT INTO `vy_auth_rule` VALUES (125,'System/source_del','操作-删除',1,1,0,'','',43,40,146103934,1,0);
INSERT INTO `vy_auth_rule` VALUES (126,'Database/export','操作-备份',1,1,0,'','',5,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (127,'Database/optimize','操作-优化',1,1,0,'','',5,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (128,'Database/repair','操作-修复',1,1,0,'','',5,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (129,'Database/delSqlFiles','操作-删除',1,1,0,'','',4,3,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (130,'System/bxgs_state','操作-状态',1,1,0,'','',67,5,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (131,'System/bxgs_edit','操作-修改',1,1,0,'','',67,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (132,'System/bxgs_runedit','操作-改存',1,1,0,'','',67,2,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (134,'System/myinfo_runedit','个人资料修改',1,1,0,'','',68,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (236,'Category/del','操作-删除',1,1,0,'','',9,5,1497424900,0,0);
INSERT INTO `vy_auth_rule` VALUES (230,'Database/restoreData','操作-还原',1,1,0,'','',4,1,1497423595,0,0);
INSERT INTO `vy_auth_rule` VALUES (145,'Auth/adminState','操作-状态',1,1,0,'','',16,5,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (149,'Auth/groupAdd','操作-添加',1,1,0,'','',17,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (151,'Auth/groupRunaccess','操作-权存',1,1,0,'','',17,50,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (153,'System/bxgs_runadd','操作-添存',1,1,0,'','',66,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (234,'Category/insert','操作-添存',1,1,0,'','',9,2,1497424143,0,0);
INSERT INTO `vy_auth_rule` VALUES (240,'Module/del','操作-删除',1,1,0,'','',190,4,1497425850,0,0);
INSERT INTO `vy_auth_rule` VALUES (239,'Module/moduleState','操作-状态',1,1,0,'','',190,5,1497425764,0,0);
INSERT INTO `vy_auth_rule` VALUES (238,'page/edit','单页编辑',1,1,0,'','',7,2,1497425142,0,0);
INSERT INTO `vy_auth_rule` VALUES (237,'Category/cOrder','操作-排序',1,1,0,'','',9,6,1497424979,0,0);
INSERT INTO `vy_auth_rule` VALUES (161,'Users/usersState','操作-状态',1,1,0,'','',29,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (162,'Users/delall','操作-全部删除',1,1,0,'','',29,4,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (163,'Users/edit','操作-编辑',1,1,0,'','',29,2,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (164,'Users/usersDel','操作-删除',1,1,0,'','',29,3,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (247,'Message/del','操作-删除',1,1,0,'','',48,1,1497427449,0,0);
INSERT INTO `vy_auth_rule` VALUES (166,'Users/groupOrder','操作-排序',1,1,0,'','',38,50,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (167,'Users/groupAdd','操作-添加',1,1,0,'','',38,10,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (169,'Users/groupDel','操作-删除',1,1,0,'','',38,30,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (170,'Ad/add','操作-添加',1,1,0,'','',45,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (171,'Ad/edit','操作-修改',1,1,0,'','',45,2,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (173,'Ad/del','操作-删除',1,1,0,'','',45,5,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (174,'Ad/adOrder','操作-排序',1,1,0,'','',45,4,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (175,'Ad/editState','操作-状态',1,1,0,'','',45,3,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (176,'Ad/addType','操作-添加',1,1,0,'','',46,1,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (252,'Template/edit','操作-编辑',1,1,0,'','',197,3,1497428906,0,0);
INSERT INTO `vy_auth_rule` VALUES (178,'Ad/delType','操作-删除',1,1,0,'','',46,4,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (179,'Ad/typeOrder','操作-排序',1,1,0,'','',46,3,1461550835,1,0);
INSERT INTO `vy_auth_rule` VALUES (180,'System/source_edit','操作-修改',1,1,0,'','',43,20,1461832933,1,0);
INSERT INTO `vy_auth_rule` VALUES (181,'Auth/groupState','操作-状态',1,1,0,'','',17,50,1461834340,1,0);
INSERT INTO `vy_auth_rule` VALUES (182,'Users/groupEdit','操作-修改',1,1,0,'','',38,15,1461834780,1,0);
INSERT INTO `vy_auth_rule` VALUES (183,'Ad/editType','操作-修改',1,1,0,'','',46,2,1461834988,1,0);
INSERT INTO `vy_auth_rule` VALUES (188,'Plug/donation','捐赠列表',1,1,0,'','',187,50,1466563673,0,1);
INSERT INTO `vy_auth_rule` VALUES (189,'Module','模型管理',1,1,0,'icon-ungroup','',278,3,1466825363,0,0);
INSERT INTO `vy_auth_rule` VALUES (190,'Module/index','模型列表',1,1,0,'','',189,1,1466826681,0,1);
INSERT INTO `vy_auth_rule` VALUES (192,'Module/edit','操作-修改',1,1,0,'','',190,2,1467007920,0,0);
INSERT INTO `vy_auth_rule` VALUES (193,'Module/add','操作-添加',1,1,0,'','',190,1,1467007955,0,0);
INSERT INTO `vy_auth_rule` VALUES (196,'Template','模版管理',1,1,0,'icon-embed2','',278,7,1481857304,0,1);
INSERT INTO `vy_auth_rule` VALUES (197,'Template/index','模版管理',1,1,0,'','',196,1,1481857540,0,1);
INSERT INTO `vy_auth_rule` VALUES (198,'Template/insert','操作-添存',1,1,0,'','',197,2,1481857587,0,0);
INSERT INTO `vy_auth_rule` VALUES (202,'Template/add','操作-添加',1,1,0,'','',197,1,1481859447,0,0);
INSERT INTO `vy_auth_rule` VALUES (203,'Debris/index','碎片管理',1,1,0,'','',196,2,1484797759,0,1);
INSERT INTO `vy_auth_rule` VALUES (204,'Debris/edit','操作-编辑',1,1,0,'','',203,2,1484797849,0,0);
INSERT INTO `vy_auth_rule` VALUES (205,'Debris/add','操作-添加',1,1,0,'','',203,1,1484797878,0,0);
INSERT INTO `vy_auth_rule` VALUES (206,'Wechat','微信管理',1,1,0,'icon-bubbles2','',282,8,1487063570,0,1);
INSERT INTO `vy_auth_rule` VALUES (207,'Wechat/config','公众号管理',1,1,0,'','',206,1,1487063705,0,1);
INSERT INTO `vy_auth_rule` VALUES (208,'Wechat/menu','菜单管理',1,1,0,'','',206,2,1487063765,0,1);
INSERT INTO `vy_auth_rule` VALUES (209,'Wechat/materialmessage','消息素材',1,1,0,'','',206,3,1487063834,0,1);
INSERT INTO `vy_auth_rule` VALUES (212,'Wechat/weixin','操作-设置',1,1,0,'','',207,1,1487064541,0,0);
INSERT INTO `vy_auth_rule` VALUES (213,'Wechat/addMenu','操作-添加',1,1,0,'','',208,1,1487149151,0,0);
INSERT INTO `vy_auth_rule` VALUES (214,'Wechat/editText','操作-编辑',1,1,0,'','',209,2,1487233984,0,0);
INSERT INTO `vy_auth_rule` VALUES (215,'Wechat/addText','操作-添加',1,1,0,'','',209,1,1487234062,0,0);
INSERT INTO `vy_auth_rule` VALUES (232,'Database/downFile','操作-下载',1,1,0,'','',4,2,1497423744,0,0);
INSERT INTO `vy_auth_rule` VALUES (235,'Category/catUpdate','操作-该存',1,1,0,'','',9,4,1497424301,0,0);
INSERT INTO `vy_auth_rule` VALUES (241,'Module/field','模型字段',1,1,0,'','',190,6,1497425972,0,0);
INSERT INTO `vy_auth_rule` VALUES (242,'Module/fieldStatus','操作-状态',1,1,0,'','',241,4,1497426044,0,0);
INSERT INTO `vy_auth_rule` VALUES (243,'Module/fieldAdd','操作-添加',1,1,0,'','',241,1,1497426089,0,0);
INSERT INTO `vy_auth_rule` VALUES (244,'Module/fieldEdit','操作-修改',1,1,0,'','',241,2,1497426134,0,0);
INSERT INTO `vy_auth_rule` VALUES (245,'Module/listOrder','操作-排序',1,1,0,'','',241,3,1497426179,0,0);
INSERT INTO `vy_auth_rule` VALUES (246,'Module/fieldDel','操作-删除',1,1,0,'','',241,5,1497426241,0,0);
INSERT INTO `vy_auth_rule` VALUES (248,'Message/delall','操作-删除全部',1,1,0,'','',48,2,1497427534,0,0);
INSERT INTO `vy_auth_rule` VALUES (249,'Link/edit','操作-编辑',1,1,0,'','',31,2,1497427694,0,0);
INSERT INTO `vy_auth_rule` VALUES (250,'Link/linkState','操作-状态',1,1,0,'','',31,3,1497427734,0,0);
INSERT INTO `vy_auth_rule` VALUES (251,'Link/del','操作-删除',1,1,0,'','',31,4,1497427780,0,0);
INSERT INTO `vy_auth_rule` VALUES (253,'Template/update','操作-改存',1,1,0,'','',197,4,1497428951,0,0);
INSERT INTO `vy_auth_rule` VALUES (254,'Template/delete','操作-删除',1,1,0,'','',197,5,1497429018,0,0);
INSERT INTO `vy_auth_rule` VALUES (255,'Template/images','媒体文件管理',1,1,0,'','',197,6,1497429157,0,0);
INSERT INTO `vy_auth_rule` VALUES (256,'Template/imgDel','操作-文件删除',1,1,0,'','',255,1,1497429217,0,0);
INSERT INTO `vy_auth_rule` VALUES (257,'Debris/del','操作-删除',1,1,0,'','',203,3,1497429416,0,0);
INSERT INTO `vy_auth_rule` VALUES (258,'Wechat/editMenu','操作-编辑',1,1,0,'','',208,2,1497429671,0,0);
INSERT INTO `vy_auth_rule` VALUES (259,'Wechat/menuOrder','操作-排序',1,1,0,'','',208,3,1497429707,0,0);
INSERT INTO `vy_auth_rule` VALUES (260,'Wechat/menuState','操作-状态',1,1,0,'','',208,4,1497429764,0,0);
INSERT INTO `vy_auth_rule` VALUES (261,'Wechat/delMenu','操作-删除',1,1,0,'','',208,5,1497429822,0,0);
INSERT INTO `vy_auth_rule` VALUES (262,'Wechat/createMenu','操作-生成菜单',1,1,0,'','',208,6,1497429886,0,0);
INSERT INTO `vy_auth_rule` VALUES (263,'Wechat/delText','操作-删除',1,1,0,'','',209,3,1497430020,0,0);
INSERT INTO `vy_auth_rule` VALUES (265,'Donation/index','捐赠管理',1,1,0,'','',28,5,1498101716,0,1);
INSERT INTO `vy_auth_rule` VALUES (273,'Wechat/replay','回复设置',1,1,0,'','',206,4,1508215988,0,1);
INSERT INTO `vy_auth_rule` VALUES (267,'Plugin/index','插件管理',1,1,1,'icon-power-cord','',278,8,1501466560,0,1);
INSERT INTO `vy_auth_rule` VALUES (269,'Plugin/login','登录插件',1,1,1,'','',267,1,1501466732,0,1);
INSERT INTO `vy_auth_rule` VALUES (270,'System/email','邮箱配置',1,1,0,'','',1,2,1502331829,0,1);
INSERT INTO `vy_auth_rule` VALUES (272,'Debris/type','碎片分类',1,1,1,'','',196,3,1504082720,0,1);
INSERT INTO `vy_auth_rule` VALUES (278,'System','系统设置',1,1,1,'','',0,1,1523591860,0,1);
INSERT INTO `vy_auth_rule` VALUES (279,'','文章管理',1,1,1,0,'',0,2,1504082720,0,1);
INSERT INTO `vy_auth_rule` VALUES (280,'','会员管理',1,1,1,0,'',0,3,1504082720,0,1);
INSERT INTO `vy_auth_rule` VALUES (281,'','商城管理',1,1,1,0,'',0,4,1504082720,0,1);
INSERT INTO `vy_auth_rule` VALUES (282,'','微信管理',1,1,1,0,'',0,5,1504082720,0,1);
--
-- 表的结构 `vy_config`
-- 
DROP TABLE IF EXISTS `vy_config`;
CREATE TABLE `vy_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_config`表中的数据 `vy_config`
--
INSERT INTO `vy_config` VALUES (16,'is_mark','0','water','0');
INSERT INTO `vy_config` VALUES (17,'mark_txt','','water','0');
INSERT INTO `vy_config` VALUES (18,'mark_img','/public/upload/public/2017/01-20/10cd966bd5f3549833c09a5c9700a9b8.jpg','water','0');
INSERT INTO `vy_config` VALUES (19,'mark_width','','water','0');
INSERT INTO `vy_config` VALUES (20,'mark_height','','water','0');
INSERT INTO `vy_config` VALUES (21,'mark_degree','54','water','0');
INSERT INTO `vy_config` VALUES (22,'mark_quality','56','water','0');
INSERT INTO `vy_config` VALUES (23,'sel','9','water','0');
INSERT INTO `vy_config` VALUES (24,'sms_url','https://yunpan.cn/OcRgiKWxZFmjSJ','sms','0');
INSERT INTO `vy_config` VALUES (25,'sms_user','','sms','0');
INSERT INTO `vy_config` VALUES (26,'sms_pwd','访问密码 080e','sms','0');
INSERT INTO `vy_config` VALUES (27,'regis_sms_enable','1','sms','0');
INSERT INTO `vy_config` VALUES (28,'sms_time_out','1200','sms','0');
INSERT INTO `vy_config` VALUES (38,'__hash__','8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453','sms','0');
INSERT INTO `vy_config` VALUES (39,'__hash__','8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453','sms','0');
INSERT INTO `vy_config` VALUES (56,'sms_appkey','123456789','sms','0');
INSERT INTO `vy_config` VALUES (57,'sms_secretKey','123456789','sms','0');
INSERT INTO `vy_config` VALUES (58,'sms_product','CLTPHP','sms','0');
INSERT INTO `vy_config` VALUES (59,'sms_templateCode','SMS_101234567890','sms','0');
INSERT INTO `vy_config` VALUES (60,'smtp_server','smtp.qq.com','smtp','0');
INSERT INTO `vy_config` VALUES (61,'smtp_port','465','smtp','0');
INSERT INTO `vy_config` VALUES (62,'smtp_user','455623609@qq.com','smtp','0');
INSERT INTO `vy_config` VALUES (63,'smtp_pwd','exhwogsnqlnzcabj','smtp','0');
INSERT INTO `vy_config` VALUES (64,'regis_smtp_enable','1','smtp','0');
INSERT INTO `vy_config` VALUES (65,'test_eamil','455623609@qq.com','smtp','0');
INSERT INTO `vy_config` VALUES (70,'forget_pwd_sms_enable','1','sms','0');
INSERT INTO `vy_config` VALUES (71,'bind_mobile_sms_enable','1','sms','0');
INSERT INTO `vy_config` VALUES (72,'order_add_sms_enable','1','sms','0');
INSERT INTO `vy_config` VALUES (73,'order_pay_sms_enable','1','sms','0');
INSERT INTO `vy_config` VALUES (74,'order_shipping_sms_enable','1','sms','0');
INSERT INTO `vy_config` VALUES (88,'email_id','CLTPHP','smtp','0');
INSERT INTO `vy_config` VALUES (89,'test_eamil_info',' 您好！这是一封来自CLTPHP的测试邮件！','smtp','0');
--
-- 表的结构 `vy_link`
-- 
DROP TABLE IF EXISTS `vy_link`;
CREATE TABLE `vy_link` (
  `link_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '链接名称',
  `url` varchar(200) NOT NULL COMMENT '链接URL',
  `type_id` tinyint(4) DEFAULT NULL COMMENT '所属栏目ID',
  `qq` varchar(20) NOT NULL COMMENT '联系QQ',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0禁用1启用',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_link`表中的数据 `vy_link`
--
INSERT INTO `vy_link` VALUES (10,'CLTPHP','http://www.cltphp.com/',0,'1109305987',1,1495183645,1);
INSERT INTO `vy_link` VALUES (8,'CLTPHP内容管理系统','http://www.cltphp.com/',0,'1109305987',2,1484791374,1);
INSERT INTO `vy_link` VALUES (11,'CLTPHP动态','http://www.cltphp.com/news-49.html',0,'',3,1499765975,1);
INSERT INTO `vy_link` VALUES (12,'关于我们','http://cltphp.com/about-8.html',0,'',4,1499766009,1);
INSERT INTO `vy_link` VALUES (13,'CLTPHP相关知识','http://cltphp.com/news-51.html',0,'',5,1499766031,1);
INSERT INTO `vy_link` VALUES (15,'有你有我影视','http://www.ynywo.com/',0,'',6,1501030917,1);
--
-- 表的结构 `vy_message`
-- 
DROP TABLE IF EXISTS `vy_message`;
CREATE TABLE `vy_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '' COMMENT '留言标题',
  `tel` varchar(15) NOT NULL DEFAULT '' COMMENT '留言电话',
  `addtime` varchar(15) NOT NULL COMMENT '留言时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=审核 0=不审核',
  `ip` varchar(50) DEFAULT '' COMMENT '留言者IP',
  `content` longtext NOT NULL COMMENT '留言内容',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL COMMENT '留言邮箱',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_message`表中的数据 `vy_message`
--
INSERT INTO `vy_message` VALUES (28,'关于广告 ','','1502875841',0,'113.16.147.215','我尝试修改Ad  但是要修改的好多  站长大大能出一个不被广告插件屏蔽的版本么 或者文章  ','鸡蛋','406811064@qq.com');
INSERT INTO `vy_message` VALUES (26,'111','','1502855521',0,'119.126.28.3','1111','小程序','ok131325@163.com');
INSERT INTO `vy_message` VALUES (24,'111','','1502854875',0,'119.126.30.139','qwwww','1111','114114114@163.com');
INSERT INTO `vy_message` VALUES (36,'我想问一个问题','','1505361719',0,'114.249.79.136','我想问一下，我们的的产品是完全开源免费的么？会不会分什么商业版或者个人版啊？','裴先生','1058219352@qq.com');
--
-- 表的结构 `vy_role`
-- 
DROP TABLE IF EXISTS `vy_role`;
CREATE TABLE `vy_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_role`表中的数据 `vy_role`
--
INSERT INTO `vy_role` VALUES (1,'超级管理员',1,'超级管理',0,0);
INSERT INTO `vy_role` VALUES (2,'普通管理员',1,'普通管理员',0,0);
INSERT INTO `vy_role` VALUES (3,'注册用户',1,'注册用户',0,0);
INSERT INTO `vy_role` VALUES (4,'游客',1,'游客',0,0);
--
-- 表的结构 `vy_role_user`
-- 
DROP TABLE IF EXISTS `vy_role_user`;
CREATE TABLE `vy_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT '0',
  `user_id` char(32) DEFAULT '0',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- 表的结构 `vy_system`
-- 
DROP TABLE IF EXISTS `vy_system`;
CREATE TABLE `vy_system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(36) NOT NULL DEFAULT '' COMMENT '网址',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `key` varchar(200) NOT NULL COMMENT '关键字',
  `des` varchar(200) NOT NULL COMMENT '描述',
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_system`表中的数据 `vy_system`
--
INSERT INTO `vy_system` VALUES (1,'VYCMS','http://www.vycms.com/','VYCMS','VYCMS内容管理系统','VYCMS内容管理系统，微信公众平台开发、APP移动应用设计、HTML5网站开发，API定制开发。大型企业网站，手机网站定制开发。','陕ICP备888888号-3','2017-2020','广东省珠海市','1388888888','1157286895@qq.com','/uploads/20180414/865e9b7528b96bfc3fe56d25ad4d6e3f.jpg');
--
-- 表的结构 `vy_user_level`
-- 
DROP TABLE IF EXISTS `vy_user_level`;
CREATE TABLE `vy_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `bomlimit` int(5) DEFAULT '0' COMMENT '积分下限',
  `toplimit` int(5) DEFAULT '0' COMMENT '积分上限',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_user_level`表中的数据 `vy_user_level`
--
INSERT INTO `vy_user_level` VALUES (1,'注册会员',1,0,500);
INSERT INTO `vy_user_level` VALUES (2,'铜牌会员',2,501,1000);
INSERT INTO `vy_user_level` VALUES (3,'白银会员',3,1001,2000);
INSERT INTO `vy_user_level` VALUES (4,'黄金会员',4,2001,3500);
INSERT INTO `vy_user_level` VALUES (5,'钻石会员',5,3501,5500);
INSERT INTO `vy_user_level` VALUES (6,'超级VIP',6,5500,99999);
--
-- 表的结构 `vy_users`
-- 
DROP TABLE IF EXISTS `vy_users`;
CREATE TABLE `vy_users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 男 0 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `username` varchar(50) DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `sign` varchar(255) DEFAULT '' COMMENT '签名',
  `status` varchar(20) DEFAULT 'hide' COMMENT '登录状态',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2601 DEFAULT CHARSET=utf8;

-- 
-- 导出`vy_users`表中的数据 `vy_users`
--
INSERT INTO `vy_users` VALUES (2418,'','','0',0,0,1473066180,0,'','','',0,'weixin','oyP7DwGQiH5VQ5EBYFKBuIuu_JXU','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL6ppuCaiaQ9dHrk01rXvbb2N9LShG5N7Dic4ByO6LxUicRxVV8WiaLwuj4sBFT9CibuK8rg0yMvtgC5MdicibwHn5JNy4P/0',0,0,0,0,'波',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2419,'','','0',0,0,1473066272,0,'','','',0,'weixin','oyP7DwJI1RwTVZd8T-opkOd-39Yo','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdKiaFj3FrFrusNARuzNWicEW9mqpAvu3Ow8ick3YbCtu2yRjPdeDoyAN6086X6KZRlFYbjVhAtrGeQd6gHQBkmziaf/0',0,0,0,0,'胡图+',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2420,'','','0',0,0,1473066316,0,'','','',0,'weixin','oyP7DwBKBVbGG-Td1EmvQGqRrr5E','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4k5lyxlPQgX5hQkBMUwgu10d9D6HzlxP9RY4hcxknOp0icDZxYSicfIEicsBgMERzjqd6G6FUKyMBCk/0',0,0,0,0,'明少',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2421,'','','0',0,0,1473068358,0,'','','',0,'weixin','oyP7DwKzw3yyJo5VHP71GRHZuxho','0','http://wx.qlogo.cn/mmopen/086TMlyKVO6oXKRP2ibJSpNaL8uuJBpibXRwK9Xm10YVZZVw1RoRGQT9kp95NtC88qZaibyFl1fys7Mhbx3WD2f8lIoJpW0CibiaQ/0',0,0,0,0,'_谢',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2422,'','','0',0,0,1473068481,0,'','','',0,'weixin','oyP7DwIpahc2NPchA6mXoSEgAFak','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdDnzae2picOPfMUDDsK08P3fweYLJag0zRT3neMvBUia2u2H2amC9nNZsicGkKg2dX3qe1IO2CDWFiaw/0',0,0,0,0,'阮伟东（上海圣科）',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2423,'','','0',0,0,1473069054,0,'','','',0,'weixin','oyP7DwGwvufglSPnhe3j6VogxImo','0','',0,0,0,0,'后背凉',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2424,'','','0',0,0,1473070165,0,'','','',0,'weixin','oyP7DwA5iINWXJ56UZTydmKdW_s4','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0c9ebOdpAx2GveLmnyaZpY0fRsz0t4VUjoOuCvBTqCGuhbsaMA30aePEP6KZldu5LD1awGPLKPeJ/0',0,0,0,0,'maobin',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2425,'','','0',0,0,1473071809,0,'','','',0,'weixin','oyP7DwPJzLvkfyO6rp9dqfmGrsps','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP1w1xLcdFTY9kuA0iaIiapZhLJvm1HQ0rIuovMN0ibLVArliaVnlnGuSXRsMA3hibU3RoYDLyL8HOQUblibFibb9myqaDI/0',0,0,0,0,'杰',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2426,'','','0',0,0,1473082904,0,'','','',0,'weixin','oyP7DwBddSK_qZse_bdqN8pysT64','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaELicoc0fXvgNG9bjIiaUjfJ1KzKePicgmuARgsKvw8qMctIcic0x0FSMicicud406Joz3on4l3d0ic0cicnRw/0',0,0,0,0,'fshark',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2427,'','','0',0,0,1473084562,0,'','','',0,'weixin','oyP7DwF-hqWwz8eiUvlKOy2fRrB4','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6sA22h4ibnXxagUfib4Y9zqibp7QBbVf7oJzxHzkciblCAibFdfFskqe66zdQh6icVibCHM3aQlAPjzvL8S11DTwkfibA6/0',0,0,0,0,'简优商务',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2428,'','','0',0,0,1473085571,0,'','','',0,'weixin','oyP7DwL4A9pFFIXTWLUHxqMTUnnc','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM75HGOqCeuRORibMaVeYg0R5xTFFJAuv99uO2X0Q1tTibQTHCwNIElnPeuID3ntG0wWx8ibEiaxpTO9OQ/0',0,0,0,0,'微信用户',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2429,'','','0',0,0,1473086235,0,'','','',0,'weixin','oyP7DwLKoiVtrTRGWfNkAlOZ_TxY','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5eYa3QkvyxkttTv0CTQgbzGcqazwjxvwsOhxcBFX5VsQyvyWLfAfQRzicCEWY2Vqz6cfA4OFBTbXQ/0',0,0,0,0,'兔八哥',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2430,'','','0',0,0,1473086791,0,'','','',0,'weixin','oyP7DwOJp-jjX32Sp7LJq820Fia4','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3ibscs0wPrYlmwUa3ic6ljJibfc57r2XgnhsNDMTjGlO9A0Q7OWayhXhm2IBMBdKKTsBATcExuUoJS/0',0,0,0,0,'奋斗',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2431,'','','0',0,0,1473090503,0,'','','',0,'weixin','oyP7DwKnrmvYhWOIjJ5vj4lWurjI','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELiaybRub1L3odqFOpOZdqUiaKyot70MJFib37bJBfOvz945CRZ2aRnjzTw2WpCjur7JZVO9beAEpXW/0',0,0,0,0,'大浩浩',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2432,'','','0',0,0,1473091471,0,'','','',0,'weixin','oyP7DwDkQWihqfjA4BzDLrVFSSUg','0','',0,0,0,0,'巴斯滕',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2433,'','','0',0,0,1473093272,0,'','','',0,'weixin','oyP7DwI9nIci5ENWX0Atm8LzP6Xw','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0T34cpiaY0SRNegTb5M3uEMqib4KcBjficBPvjX82K3EkdMnibH1HicDrQYn9Y0N5gSywkDFPUpm17zutkglH1J1LJs/0',0,0,0,0,'越努力 越幸运',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2434,'','','0',0,0,1473110304,0,'','','',0,'weixin','oyP7DwAuqnc3C32cq6lIy6JgXvzc','0','http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5yAROYbJ2MnJ1CWMyUYia7kJGHdfgvdywnGKKWcIAkmcpibKA0LRwZwvGvX6XlicibdxWoq4b155F2V5/0',0,0,0,0,'A麻辣小龙虾～鸡头王撸串',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2435,'','','0',0,0,1473119022,0,'','','',0,'weixin','oyP7DwOVELVtc_CQ7wPnxxjsvZcM','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eGp2NspOAumDbmt9Dtp3cXCl8tYfLfeDEZNAG683bEzbuFaA0iaOdgnXz5vLnbS60icQvLk4rt008k/0',0,0,0,0,'let it go',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2436,'','','0',0,0,1473122323,0,'','','',0,'weixin','oyP7DwERPNltTz4sbtIXhtefklus','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKkQkM07m6wFV7IVY7KhtKGOW4GLhzO9mvu9fJUOKYQ199MDibGt7HgCoYuyO7r31ulmo196Pp3K8/0',0,0,0,0,'AA雨鸟 灌溉设备13913853639',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2437,'','','0',0,0,1473122647,0,'','','',0,'weixin','oyP7DwBeLq2cG2Q5sqCgb2TAOb9U','0','http://wx.qlogo.cn/mmopen/LF5ufsDqRDZBich9sEj05SKGCibKticAcp07ZvILJxumVxIYhzfSzK4M4Nficpicm2MakiaYYIVjxsibs0FBZHoprdKUj9oL4kDJaog/0',0,0,0,0,'晋朋',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2438,'','','0',0,0,1473124029,0,'','','',0,'weixin','oyP7DwE7e5K1w6vQYpSRJBuMDyFo','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKdlrKVLMXy2yo1JkBcCEibEUBFDu6e5cJCzKFdA7IsxcjVWK0FZUABD7wLUW2dvW3DCAgWU21Sb8A/0',0,0,0,0,'果子',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2439,'','','0',0,0,1473128141,0,'','','',0,'weixin','oyP7DwOyAU9nIVGhgPk0FyPOtjZc','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZZOEnU8jwB4dibO9raBp1Qiayobkyyz8zbiatnoCwjWFnpsoeySicvKibH2uMMwGqObsO0jIag8Kg5WO/0',0,0,0,0,'DullaHank',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2440,'','','0',0,0,1473129147,0,'','','',0,'weixin','oyP7DwIhh59FaiEKu57bXmjRONXc','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKZWX35WOgjChwuc3ibm4jP8ycuPs2VT8DkX71pPRj9qpBXwiatCoPomLm1rdZ3GLGkzxlhrLEgqFjg/0',0,0,0,0,'芝麻',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2441,'','','0',0,0,1473129601,0,'','','',0,'weixin','oyP7DwLoL8oCgSOLk8yE1OlCT49s','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEI5MuLAVibeRWcGoPbpeEgZhTwiaoIibkib3dCedgpRkAVPmZvguOat14iaYA94NMXoiaiaNVj7OyyibJA9g/0',0,0,0,0,'伟志丶ZHAO',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2442,'','','0',0,0,1473131125,0,'','','',0,'weixin','oyP7DwJ3fyB9D4Zc1mdgfNzCAQuY','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL6svbjy58HtGlpZ40jxbtV9KSTqOqEwIuzFibxicLcwnDtnKDQWkpibB9JybQzXM0TXcg0VzoVia42QAJZQjPyQkS4A/0',0,0,0,0,'木木',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2443,'','','0',0,0,1473131923,0,'','','',0,'weixin','oyP7DwEs0o4laMBPngGeNwFK7fZk','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90CmXibcBzzpTXTfv41ibXwHqk1rCkEWQ3WJeQAZsqGsu0R6nalbI7d2EZjy42aF9TaZKsokzxm2koO/0',0,0,0,0,'拂晓',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2444,'','','0',0,0,1473133530,0,'','','',0,'weixin','oyP7DwP6XQtSjhw0wJmafFd0WjEA','0','http://wx.qlogo.cn/mmopen/086TMlyKVO4V3fdSWdOn195PEoavweficF7pbHYGuRKTialoxicoB0mEJ7ic1tdcNgkiaILsZMibVZ7uATrXRhjNZiaaGghTMKPoH8S/0',0,0,0,0,'杜杰',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2445,'','','0',0,0,1473134381,0,'','','',0,'weixin','oyP7DwA_aTM-WM5ikz2aY4J5Cow8','0','http://wx.qlogo.cn/mmopen/iaic26T1Lo3pGAOAQckkQNzE5dqnvT5Kn9ickBJ75V8kiaG2dcJFPqS4iavOAzYQyjy91lsWP2lOz01ZI2CkHrCj82d2PPUNABLSN/0',0,0,0,0,'桂林自由行开心旅',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2446,'','','0',0,0,1473138871,0,'','','',0,'weixin','oyP7DwIALN50O9JEeydo3s3dEPEw','0','',0,0,0,0,'911',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2447,'','','0',0,0,1473140292,0,'','','',0,'weixin','oyP7DwKO36pOx5ViwOA9G0idMkzw','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDHDZlVZYgxDGHsurstMciaIn7gKuNQu6SGTyNiaDyGqq73pnww4qtO503qtoeav3qHic8obtKjYmlp/0',0,0,0,0,'六条',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2448,'','','0',0,0,1473140558,0,'','','',0,'weixin','oyP7DwBZnK1uIx2mVbWFYbXr-G44','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJtoqRMwOaD9JnvAuMlNniad4b0fl2DXAbicDdOqdBI0TncrjHBia6huPssTybOUV3ZKeyzlibMPWd2w/0',0,0,0,0,'鲁曦',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2449,'','','0',0,0,1473141166,0,'','','',0,'weixin','oyP7DwPOFdBkEdTY9cxhjTtAAZ6k','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBocDGZCfmcUvafaW0Z2lNqTKgwuraVGD2etnzSYtzNs8lAibC7fm1nynjwyU98Ib7mlBExFcIkwuQ/0',0,0,0,0,'TKING',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2450,'','','0',0,0,1473141633,0,'','','',0,'weixin','oyP7DwPse1R_enWOl3FC9a-3c-6M','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QkibnBN2wBf7f1teJc28GMUSib3M91iaPnawAKkBSQicDfKg1kpmxgnNYvnYkV2o3HCicakoRztKPia2o/0',0,0,0,0,'力涛',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2451,'','','0',0,0,1473142835,0,'','','',0,'weixin','oyP7DwDhOj83qQCGco8NrGFi34_c','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLB62AUkahThYsBmy2huFgbx3N8PLvJVbGb9sjMwRuo3nEH2sCmx75acDZYpJc4OEibRrcTicNTArt53NeEDrKC7ia6iccEeJZsSRPM/0',0,0,0,0,'吉祥如意喜训如山',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2452,'','','0',0,0,1473144209,0,'','','',0,'weixin','oyP7DwCdOcLNMKdV5agzPct5QInU','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMcJVgt5VibFnFjFjUEevEeaOibqG1QPeyYbP1OTNf3AvbBr1Ov0evQVY1vQicOqNRJ9D8EajicHlNzia/0',0,0,0,0,'Klaus',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2453,'','','0',0,0,1473144952,0,'','','',0,'weixin','oyP7DwNwQulRkf7zJtBAYi8qkJAw','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP3UbT7YAPiakgkorqVh6Vico9nWicxnQtabXUAobnaNCiaQniaicDWIyPRZibfIn9I88xgNo2MGqWxhuFxxd3mNyElFP0t/0',0,0,0,0,'张涵宇',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2454,'','','0',0,0,1473146482,0,'','','',0,'weixin','oyP7DwKugbXzKOPJE-eX8AJ09NhE','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaELBrTRCgEvO3bGHD9Ksnj0bgiclDlibYMz7sbCmoZkdd6nOryFkFeDziblqlNKjCVX5FyyibJBoctYT6Q/0',0,0,0,0,'淡水',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2455,'','','0',0,0,1473147422,0,'','','',0,'weixin','oyP7DwMxUQiJ3I8lMzfRyjC_rm28','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RibdWBkmp2fMBz58qIibDARcoho8YfyD5JDRQcmYXFytIagpwatT3OXt00KN6XE9rsZz7juicUytdV/0',0,0,0,0,'等潇湘[太阳]',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2456,'','','0',0,0,1473147666,0,'','','',0,'qq','25B6226FC55A42A2B28FCA1C3DCD226C','0','0',0,0,0,0,'QQ用户',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2457,'','','0',0,0,1473148235,0,'','','',0,'weixin','oyP7DwA0JrTAZEE0Wuc7Fk_OmApY','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia47m1k3vL0h30AQQPGxnOs7p8e6h38dyJF1Bia9ibhHbCxBaaokTIuuyfrhTBuwDqmbiaC9qfXdcnz4/0',0,0,0,0,'老凯啊！',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2458,'','','0',0,0,1473148831,0,'','','',0,'weixin','oyP7DwGJkXjOkx_lpKlJCu3hywJ0','0','http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY525JRiayIRzJcD2sn9uNzdvCHJiabcVbvEflNCj9zvTFVia3EMr8sFYZNhe90fv0vpgxp4XrSmUbM6D/0',0,0,0,0,'特种兵',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2459,'','','0',0,0,1473149514,0,'','','',0,'weixin','oyP7DwJmPCcCoQaxVY1DYZtZMfyc','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QicGznwLBWxa0iatLEoErC41nv84pFsr2JWf5UTcGZfzb6gVuzWZGDxdLCDhFMNfDiaC67BkNMHqCs/0',0,0,0,0,'安东州精品商城andongzhou.com',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2460,'','','0',0,0,1473150236,0,'','','',0,'weixin','oyP7DwLuCWq1roDfaT2AwW6k50OA','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP3YQNEP3k0AyibaLesXfbXqWKlLWt0k465RWDDKxM87Q9ZtaticbxFjWum6TMV2jiacPPquDAd4KFVwg/0',0,0,0,0,'冣賢',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2461,'','','0',0,0,1473150485,0,'','','',0,'qq','D2457C2769A0F1143119B22884FD251B','0','0',0,0,0,0,'QQ用户',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2462,'','','0',0,0,1473150819,0,'','','',0,'weixin','oyP7DwAj4eQIUYClkNAfP5E4lAWc','0','http://wx.qlogo.cn/mmopen/BzWCcPP22nOy45LczFRHcZO2bPKNkB1kX2MczVwy6KFhGwvU4Y2ysdRRjZibMKQNiciacfqiaUPibg7gDY4ic5mOGYr3OAY4r8bF1b/0',0,0,0,0,'草莓',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2463,'','','0',0,0,1473151175,0,'','','',0,'weixin','oyP7DwD-5ozV9bIB_IA1_cWfb2Zk','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAMcnwSWKiaXstXYcFnkvaQvmEJm8PXvHQDPyD7SVPR4c0TDSC3PLbQRySSOPzVZZiaGKfj2V030x0Q/0',0,0,0,0,'赵小八',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2464,'','','0',0,0,1473151475,0,'','','',0,'weixin','oyP7DwJ21Zahe-flCqaDVREYzBRk','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCg7tzl4j1tDXdxvSBXdvebSP4SQtHtYs1MYOxl7GAJAKsGMbmfricRFicVf9b17axicvvmGBZovmSicg/0',0,0,0,0,'pei',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2465,'','','0',0,0,1473153618,0,'','','',0,'weixin','oyP7DwOmWw6hv1ewYYvxFDrqDRqQ','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibeos4uwWxfpJ804o6Zribb3WfRkYcia0qBK1m8AuicZnbd4l2YV3ox5yh7cKoGjaUXZGl0CsV6uYHWqcDnicywic5wCia/0',0,0,0,0,'大白',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2466,'','','0',0,0,1473153671,0,'','','',0,'weixin','oyP7DwEEyRaZeBCiADwLFqcF72VA','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4ial2aKkDE9V7p5aibRUruCtNEDnKCibAJVZQXAyOgicANtK0rbzN3ibFyfSmn1fZvs5rguAlFZcQXR5w/0',0,0,0,0,'梅花一点默',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2467,'','','0',0,0,1473157170,0,'','','',0,'weixin','oyP7DwLTfKKio_rHT8BGlpviQack','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP3Uf81O59cia4rxIdmWxnL73zIlU6mC3116qLCugxc2c6edw5EgYO3gFwRpl66FribqtyF6WZvV6J5g/0',0,0,0,0,'天蓝',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2468,'','','0',0,0,1473158893,0,'','','',0,'weixin','oyP7DwF-xoz2p7rB10MpkT2JJFQA','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0Ckyz8US4WiaCcmmsR8Jw9MgPSAgHF9l07BwIxwElHkFuic2XdicKjnjlF6scdSIDMvhqbicN8rJCyB/0',0,0,0,0,'测试',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2469,'','','0',0,0,1473158986,0,'','','',0,'weixin','oyP7DwGBF4KkmblFw54cM_u0JWE4','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP0RvV7Afp8wrdYNC2kGXMribxpic4cibO0qvKNG3bgMANWMK2xdZkiata0HHqiawm0TtU6s47pf3bkNmLNQLicoPiaMDjF/0',0,0,0,0,'Stroustrup_Lee',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2470,'','','0',0,0,1473160648,0,'','','',0,'weixin','oyP7DwKtiZc7G6R6znh_mtVROh0c','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP3qaDNsCRUQvBrFaicSSNMk2UR11dpkibDGInmpZ7FWsXVK0nF0dnz4jIibKyY6tW3zIZKZPICiaqiaD5fh3Zds45tMT/0',0,0,0,0,'AAA十倍不是梦',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2471,'','','0',0,0,1473162381,0,'','','',0,'weixin','oyP7DwDNINN0zV6n-uzWG4nCUzUc','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibepibq4vHMUYJQg9ZawSGU90icna5ibtHL7AWBbj4OWMNfe6PZsrrFn09Uocqsa5dAttE9OEjxVqYQDg/0',0,0,0,0,'淡忘',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2472,'','','0',0,0,1473164314,0,'','','',0,'weixin','oyP7DwNObImdP-3-vNkoQAVd4NuE','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0yK7WOBsYgAvicWIRYzcjHkMajibsqVHaSV0H9VQJLCXGE2QA6bLa5um1kpmUf9V68o7RYZ7fEy5v/0',0,0,0,0,'林贵良',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2473,'','','0',0,0,1473169295,0,'','','',0,'weixin','oyP7DwPQ4QrRzXvxwz2YNrnHAVio','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEIy00PHyESZGQZibo2M44KEvjon3gfB5UUcFiaFjqhQ2Rj1dFJXuzQicEA2mJ6yrggJEmiaOwTjzpFZeA/0',0,0,0,0,'百里奚',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2474,'','','0',0,0,1473169788,0,'','','',0,'weixin','oyP7DwIU_odcheau81rNUklohqJE','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayYia9HCv45D2n9J1mNWDxibNQCxUX44n4n7xHLJEK9tro4Epql4RvKNHRqyvrqdzlQVW3VsomNYZ7/0',0,0,0,0,'瑞班克',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2475,'','','0',0,0,1473174122,0,'','','',0,'weixin','oyP7DwNETn9cHy1Uc7N1g08xEVHo','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibcoic0xFZSEtaBjU6mK0Hth5PnmviaDrHWQz68BrYdlqibKRoRRCrpBGxX9rafic6yaD0YlZbcgc3Wd0g/0',0,0,0,0,'海纳百川',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2476,'','','0',0,0,1473174695,0,'','','',0,'weixin','oyP7DwALPtHTEUGWpCL0fKFjeOqQ','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCCdDpJF0HLA4pSCnn5iccQTRklRInibFcsiaWYkFOCx1UYHodiccTqBx23VcZO3yJZT6c52Q4tyf2oBjzMD0SDWYibiakWZ6Jmeqyso/0',0,0,0,0,'大神',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2477,'','','0',0,0,1473176002,0,'','','',0,'weixin','oyP7DwG6XoX-bPJAAUYTFW6qbD7s','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5kLBFeEqOa4s9TzUEFxVIjCvMGCvgR9dEKXxhbg3HgybTZR4dW33PWXHG1cibsCtTASr1qzOibuboA/0',0,0,0,0,'胖胖灰太狼',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2478,'','','0',0,0,1473176508,0,'','','',0,'weixin','oyP7DwIY5Zn0T6WeG4vj3bWQcTww','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdiaYc8hFicrMvMqD7RzWSNFSneVlnmqFWrklrlljqYOQYKkwobIugHMPVcd3jc9yT5acvruWZoAibAw/0',0,0,0,0,'谢凌剑 Linkin',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2479,'','','0',0,0,1473208844,0,'','','',0,'weixin','oyP7DwJHEmCE14xg3HdZ3N5kXfms','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0W2zKKxLGBI0HYR7OPtSUtGRD4hUv8ic9CTT7hvvIWKoDmFnRa9FvXibKesA0P3ZAmwFUWuYj0wgk8/0',0,0,0,0,'吾皇万岁',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2480,'','','0',0,0,1473209662,0,'','','',0,'weixin','oyP7DwCLFOVwTPwgP4yJJPvyKKic','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VB0GdFR3kznJibE5JhiaeW7ThFIK0CpDfIibeY28HKaxKDvvuXib8GXM3UicbfjGF0KzibiaL2JT5XKbm7/0',0,0,0,0,'D.C',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2481,'','','0',0,0,1473210650,0,'','','',0,'weixin','oyP7DwDz0-rn7urarikWcNUCA2c4','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOYs2AgZaibbq7ictKOkrqAfkJQ7vpCPovXDic64tmI5v6O0fmvwYCJWWK6sTrSSTNCAaVAoKKHezzt/0',0,0,0,0,'墙',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2482,'','','0',0,0,1473210981,0,'','','',0,'weixin','oyP7DwDK5IHjyfx7H__XQLd9PDdY','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIgp7SQsFMZGMn6uTYL1iatfy9mBthmibjaObpldPyibpLIic0q2hP3WxyNI9icic8AlSM1iaMia6ASLx8wN/0',0,0,0,0,'韩振军',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2483,'','','0',0,0,1473211330,0,'','','',0,'weixin','oyP7DwGZPdIGGY3_uaQjg77ZH4es','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdE2ZflYB2Fial5UT0WhHa2bJpRWZfP2u9de6y8MF6MHDxdIIE3RYiaf3Nu4Sxeg2soEcRr51SUcaK4/0',0,0,0,0,'喜马拉雅',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2484,'','','0',0,0,1473211386,0,'','','',0,'weixin','oyP7DwJWbQudaY4Ok8imPz5Wl7_4','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCfaxkRjnBXzsxf0A3Rn9b445DNEibJE84EO7s0VQJhPNmjibZ0HJ2Fp2kvuyiahVsbrNGIlc0SKhnCg/0',0,0,0,0,'醉·清风',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2485,'','','0',0,0,1473212190,0,'','','',0,'weixin','oyP7DwNTywBLCm_6bo7_48fsUHqk','0','',0,0,0,0,'JasonTang',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2486,'','','0',0,0,1473213358,0,'','','',0,'weixin','oyP7DwI2eYVV6DUU5rnU1y5VM-4Q','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP1Z3W2Kb0YMuQDAfT8qSjohoDtt5Q76iclfhLlZibQPlMAgria36jEMibmakDSuribUHFDzKTpPHNoFIxdGw2KM4bicJr/0',0,0,0,0,'寒星晓月',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2487,'','','0',0,0,1473213584,0,'','','',0,'weixin','oyP7DwER8GVECy1l9WbwRD6m_Jms','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9gz8xFZfXj7q8BBh9jMvJvAqf0YSlmdm5lII3heXjEx39iaPMEC42OtpKNQibicYNZncHAzibklFmvK/0',0,0,0,0,'瓢儿白',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2488,'','','0',0,0,1473214689,0,'','','',0,'weixin','oyP7DwLjJxcrtVJbVxHlJ-fEidpM','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5YgeHY5MlXbEjhxcDppic1lGSBKET2T1jlCf9Asbx2tncF2K3gpOLpibIjvkfKEicBg70nEzdN2icxy75I9nIHmO5a/0',0,0,0,0,'fishstudio',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2489,'','','0',0,0,1473217776,0,'','','',0,'weixin','oyP7DwBxss0aEGnUNlZhARzBlIxM','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLC7BVu3pChC0bJJBH9MGKDPhdHDeJBEPDsg7Gju8wC007ES0QHvGxWiakwGNFic3uLU35FHsWsLHGoA/0',0,0,0,0,'Carsen赖志华',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2490,'','','0',0,0,1473218609,0,'','','',0,'weixin','oyP7DwJfK_uzhS4p3S1dbbcUefi8','0','http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UPoaHsqcYpRh74ZrW47rBoyHziccyZRxEWA5FhZ9bgOBIa9pY8Rfkfxe9eXibXBEL2NnNdCibDsKBo8/0',0,0,0,0,'Mr.郑恒锋',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2491,'','','0',0,0,1473219320,0,'','','',0,'weixin','oyP7DwIYjWeqgcb7Dr421RXzevJ8','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1gMuFN5wtfDiazbOZTe0vbY5Bk44N9xGaZHlRCPKVXp2wF0VtKMVEibicJfAZpD9w4NKRO6e83zP4O/0',0,0,0,0,'冯仲伟『物联网＋平台开发实力派』',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2492,'','','0',0,0,1473219583,0,'','','',0,'weixin','oyP7DwKXaaBfiSfKp_yakRLdMRkU','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOY9GNSVy4yAouKCjeYkJ02tN9PNSs7w0dWxemaI4k1cKM3cK1Pm0yIYLjH6OdIDx8UIyMUibB7fP/0',0,0,0,0,'冉',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2493,'','','0',0,0,1473219915,0,'','','',0,'weixin','oyP7DwKfGvA7k3w5b9PlQhOqFi2A','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEBNciaQic69V7CjDMM9TPZbTibw1910jGNfCywKdWy44gslTQjHTukI2c6MrLfFPJMUGENsecVe6N92/0',0,0,0,0,'宋恒冲|物联网互联网电商平台建设',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2494,'','','0',0,0,1473220016,0,'','','',0,'weixin','oyP7DwONtyNgqOBhzxdW8OEbba3g','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBPaNVJVKyKich83acZAckZA4DWqjHEGlKjoBqkZNl1KicUyy3FT8Sk1Fzno6tZXibKic4wp7zWaCUFSA/0',0,0,0,0,'Joy',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2495,'','','0',0,0,1473230572,0,'','','',0,'weixin','oyP7DwFSUAQPzoKQhQ96D7vaartA','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP1WrzV1w7894Lb0oicR9Dahhibyup2YunoV8m84tHj9JCy3LMWD7JFWhXZB1xPibGa4NftFtrHLaJsUibMco3WWfZrd/0',0,0,0,0,'李淋',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2496,'','','0',0,0,1473231161,0,'','','',0,'weixin','oyP7DwIe6uZM5L9sCO28B6bBcvjI','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0fqbr0ySqXFxHQ7RJ3q8wGfp5Ef1Vg8hJwssTyR1tu2R5lCFknVe0rjwxpIC5G03jJTDQy2Pv7x1/0',0,0,0,0,'业',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2497,'','','0',0,0,1473231546,0,'','','',0,'weixin','oyP7DwPgxKb388u3SspRnCHEi000','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0SSkOmE2OTGM5gH8H4RgoK7efsnEbpf7cicAIq2947Krq0NFn2XAVpchPxV3cKicmhjcMh6OqMgQTh/0',0,0,0,0,'肖柯',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2498,'','','0',0,0,1473231786,0,'','','',0,'weixin','oyP7DwHCEncpD6ZhlQu-I41lrh-U','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMt0vwPzr2z2A9HyPDBsx8eMnRTWKWnl4ztYzXX69bpBJYibUmcFe10RcZNHnPGyz5UKWlJEbH6O5/0',0,0,0,0,'肖志斌',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2499,'','','0',0,0,1473232498,0,'','','',0,'weixin','oyP7DwM29zE6vVteHlj1i7qjDhRs','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL4JRgAp5blkfSORWoAkoQTAJJ6s9IqjicA7aiaf1jBQgUlvOvPYSNWAMNNa2adWqsddHLRAQbIXDN3Bib9Gypb30H6/0',0,0,0,0,'David_ssc',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2500,'','','0',0,0,1473236492,0,'','','',0,'weixin','oyP7DwLZ6wj4eD3tyyvm3aoQhdgQ','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCNqs6siby7EY1UY7OL7CQprVkM5pFyeBuYg3luRlvyVSPo9yb3HrksfFdeBQc9fUhqxic5OQ2kNdLA/0',0,0,0,0,'JHC',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2501,'','','0',0,0,1473236647,0,'','','',0,'weixin','oyP7DwLA_tgReV-E_w7s1vo4Bdak','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECXW8gYMs54DMKxjO8C0NSvb8Via5YqegBDJBJdVqdce8bSLh84IaFXZ67qtVmVx1mU9AvRkib4rVe/0',0,0,0,0,'叫我林山',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2502,'','','0',0,0,1473236909,0,'','','',0,'weixin','oyP7DwPCV3Z9AvwpfhPsmZdfks4k','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBULQOf805sUHmcdukVSsJjw89TId9JrzS1fXZc70uBbAr7nibDVwMGeossr5UbIoA9M2vvCh0wp5Q/0',0,0,0,0,'来自地狱的勇士',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2503,'','','0',0,0,1473239300,0,'','','',0,'weixin','oyP7DwCwxvPAJvXgS2PnXuGFKU4Q','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAmTib4DMZib7sQ9h2pSJ80Wp5ibK3DgQicavte3JhXqWGibB5xWLzSLYwG6j7fJjywVwz4keaPb8mClF/0',0,0,0,0,'哆唻咪',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2504,'','','0',0,0,1473239329,0,'','','',0,'weixin','oyP7DwPuFHsBC3nTwLZ4J4PzoPxY','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5tDQw57uAQTpicP1VXibReAmTRbJG5gF2EmKBibJvPrHlXgKUtURpeTKo7TUgicONzglXt8HqZRDjX7wuQlJszw8Wz/0',0,0,0,0,'夏至未至',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2505,'','','0',0,0,1473239506,0,'','','',0,'weixin','oyP7DwOKRMFZ86LmF6Tfz5GEBt9Y','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayQpdFvMS4Rra6icIDol8yJyAI5DiaOEe7fjuIuslb7b6GK6cMjRFQ7sEibcBAjAB3HXotzURfqVJiah/0',0,0,0,0,'A#  言•者 ¹²³ 〰',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2506,'','','0',0,0,1473239546,0,'','','',0,'qq','B78557EE910CF56122E938414457D579','0','0',0,0,0,0,'QQ用户',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2507,'','','0',0,0,1473239827,0,'','','',0,'weixin','oyP7DwNXk3bv2VhY-xqo8m5ENjsY','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibLbssBVkFJwaIOjsuNAicCXJLRwX086O2oCKnVm0KYNZDnt1VqeSw5dIcnr8ADfZgFCdEAbdsxVC/0',0,0,0,0,'A  +  V龚',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2508,'','','0',0,0,1473241051,0,'','','',0,'weixin','oyP7DwB7z8kg0G6JEht6hrtvHjg4','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEI3hjB76DFplI2UAX0OJ1IiaibxkUm0ERibAUgMONwKWkKicRc3RdyqibanwEH3Cnw1wpudDwa7yHyJp8g/0',0,0,0,0,'Temp',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2509,'','','0',0,0,1473242079,0,'','','',0,'weixin','oyP7DwMJW_idDWrWMAwfHv4CP_q8','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibfdhbPQwmTImASj1HvLfOLSW0mlw2RmSt5ybYPmsQSh4ZMu5I4ib90aqDticAspjc1wY5XxjDo3EQgkmkciaK62vO7/0',0,0,0,0,'',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2510,'','','0',0,0,1473242443,0,'','','',0,'weixin','oyP7DwDJTomxOGwEFVWXPkB0wXUU','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4w1kCvsF481t3aZKudIw5ic0xZ7O3SkF9DC8FXDScA12pkDxJKj0SPkx2sgZx23e33o8hgxdRH8zDvVvSfOpToYqYnvnHmUhx4/0',0,0,0,0,'诺诺',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2511,'','','0',0,0,1473243050,0,'','','',0,'weixin','oyP7DwIwmUsQkv6kltGH97_nxU2k','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL4uYoCYE5dQgicetHH8nLt1ltNC6EXLSf7gb3fSKflrG5PLCcZDruicYOqncZsb3kd7vPgeR7pqqiaFA/0',0,0,0,0,'小巫师',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2512,'','','0',0,0,1473243635,0,'','','',0,'weixin','oyP7DwOJZIYDAFkvGuyUicDlauzM','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90MHQhThXqfhOPzaDfu8G7KS0aBO6tg8icLGKicYRORJk72icTtuVOPe6NT5C6tgjXhiaRGqiaNebKicycp/0',0,0,0,0,'张惜兮',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2513,'','','0',0,0,1473243766,0,'','','',0,'weixin','oyP7DwEth1tanLDpslNX4BIt5sI4','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4mEquav8RmeP0pt1ke6BoSaSdyKVyIpTbm8GP80m05NfFArLvXAHTfwrrCPjFLshxiaLJdE1c7rsg/0',0,0,0,0,'哲哲',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2514,'','','0',0,0,1473244558,0,'','','',0,'weixin','oyP7DwHVctuF6XGZpnBA9alBM0is','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM43PoopDw9WXicv2yhT8t1AoZTLhM8v53Q1nbmYmukxjDvJ2GP2vqdZfFBlic0j5ziaWLK1275wu2HdA/0',0,0,0,0,'Toby',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2515,'','','0',0,0,1473248373,0,'','','',0,'weixin','oyP7DwFdv6Ewm0m3yrLRiEix4nSY','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3npsiaRsMM8vRasyRWGbY8OORZnFHWiapXlLclTbaEqVRibKEDydOemIb0z6ic8Ew0JlMKteTw9l2tH4/0',0,0,0,0,'PAGE Life',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2516,'','','0',0,0,1473249693,0,'','','',0,'weixin','oyP7DwDM40sdfLP002_ttWdpRi70','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECiaicnv66NtXACSLm1qFEvdEFWXicHQxZOBwKFxiaDK1MAzIDyribNuztm4wjRwtDiagLG4Y7WDl4jfWC/0',0,0,0,0,'beborn',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2517,'','','0',0,0,1473253532,0,'','','',0,'weixin','oyP7DwLPFtuKss3Ajgycbie07chs','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pwTZtay1k4ckIibgcTaHLJwA2qc7eqibic8JJ1Z1MC8S9yoliciclbAXpPCSuMVRJ1J0JibdLKE1zQJlg/0',0,0,0,0,'喵帕斯',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2518,'','','0',0,0,1473254974,0,'','','',0,'weixin','oyP7DwKPLa8R2d0CrD3ESxTCf1qk','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIiaHfgiaMp3IqF6diaFQnbIJyeicrgzcVx3jSb1RcAXXrXxjGFKJtY4bumGyN89fK5CcEicxzoeXDChD/0',0,0,0,0,'▇▇▇▇▇刮开有奖',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2519,'','','0',0,0,1473257378,0,'','','',0,'weixin','oyP7DwAiwJQhlijoeLHem3M_aZTo','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP2icdkfLQ0H2HTNfgVxp74VRv7VfvpeSDylLicgpyKTF9iaiahcicambzHQpxH7FEjJEDHUF44rHnXnJvg/0',0,0,0,0,'优配菜888',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2520,'','','0',0,0,1473258970,0,'','','',0,'weixin','oyP7DwMjHrnLat9XJ3wQeiqrVyxE','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDavibkhUbLzLORjlH7RicR17rRtcx59yFs0ECdkSxjF0znwicI6GtvE4nMTHOQsW4GrFFicUOibnfTBO/0',0,0,0,0,'_Change',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2521,'','','0',0,0,1473261975,0,'','','',0,'weixin','oyP7DwIhikGlZcjrBWPeFm2DjEAY','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELCpdjlnsZ4yibLC6FEmKVYQenoub2oTTOb5hicwQ9hRLFOJASPMM9IvlDRibZUY3lsveNVI0osZq6s/0',0,0,0,0,'信仰',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2522,'','','0',0,0,1473268303,0,'','','',0,'weixin','oyP7DwD_M02eqFicgo509jqNhndk','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOXxxjQYbNfPdicGOmNVMAx4cOI5sHJH57uTMibhN61GialWiaNt2KK4DBAYVBwKBtMxtibiaUgg6CLVth/0',0,0,0,0,'Hhj',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2523,'','','0',0,0,1473277846,0,'','','',0,'weixin','oyP7DwOIqpTuAU1wILnwx6zMJino','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1ShCFbMHxSgT7HPoYYJ9Bu3Cd4rRbFLGhP9osW48dLQF1MUFnAgibTwKM9A8HVF65Afibzkgvib4Fd/0',0,0,0,0,'承一',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2524,'','','0',0,0,1473295082,0,'','','',0,'weixin','oyP7DwDMUcJLmyLrr8IACswLRLe0','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibeYomv8uj8bibNc2D7qgJfh3rD753IFBiczfyS95QhTCibOFV9aaguzPmgic1WojGuv1nvyWqXbEVvPPQ/0',0,0,0,0,'下一秒べ变坏',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2525,'','','0',0,0,1473295304,0,'','','',0,'weixin','oyP7DwBFitqUu2a6rr7Mb7QQTlbc','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFZkmrxLtNpbWZpnMesnnOuLuBdpF3LhpQO6JAcLxiaibQIx4fN30owVqyfLE9CNibt8e3Eulk9LTI0/0',0,0,0,0,'梦在迪拜',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2526,'','','0',0,0,1473297519,0,'','','',0,'weixin','oyP7DwByU_MpCpKccVqMMHQwRcBA','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90OiaCTCUqia0cyBUhQIPCs5QhXC4SSxuFsexR27ThoQNc5icic1ZiahoJo1wzKGaqr9cA6GIRLs9TW7Q8/0',0,0,0,0,'安安',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2527,'','','0',0,0,1473297563,0,'','','',0,'weixin','oyP7DwD62boGCLWVv1ziqkvxupgE','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cxfhVhIyL8pf4XG7XlgicnuFtl5pA0b2vupEdwroDF1PzDfEiackAfzYV0CKMic1htUgmxC5iaKJEzV/0',0,0,0,0,'范才林-互联',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2528,'','','0',0,0,1473297614,0,'','','',0,'weixin','oyP7DwKfhogLpjqnbhCzEHNjquiY','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKibMFa0q2UEDKbwCicXUDia5vfDYnQBxhDibjyuqDicu4QlEAeicKX3RxxbUkLnRJQCBhNGWc3VdmMEZPw/0',0,0,0,0,'北吉星网络',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2529,'','','0',0,0,1473298963,0,'','','',0,'weixin','oyP7DwDjMS28mmJ3tZUaEGwRBAlU','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDRGzFD1mMJUQRBAd16x9X8N3JvQIrv2yRMeicVIrquN5lLnNfeciaiaEA8yGiabQJgeNOe5mxlRjKzIA/0',0,0,0,0,'姚金星',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2530,'','','0',0,0,1473299781,0,'','','',0,'weixin','oyP7DwA9yi6PqKk9Peoxk5-6TXq4','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKxBZwROHicQV73mYk2CfJ3CdMDjUNFCmWWAIkiaHIeBJ4dKBo055d9ibT5icxkuFdW4f1e9iae7URveKQ/0',0,0,0,0,'沙拉哥',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2531,'','','0',0,0,1473301546,0,'','','',0,'weixin','oyP7DwC3Y8jdbR7FG9j3AB6MD_mo','0','http://wx.qlogo.cn/mmopen/WpRX2NRt6oarfiambFwvkN29XVbWhUEwl9YjCnGuBLL6iaMEHyo8Z9eDiaFEUqiahXBFYia6atw90ibCrRq1q340blic5xLlJ5hjZgL/0',0,0,0,0,'阿阳哥',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2532,'','','0',0,0,1473303021,0,'','','',0,'weixin','oyP7DwCb43hap-Wquw0fV580Xr9M','0','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBibpuib3O0vRHaHZvPIP6cic9ibWcjSutSYzDB0jaGXcsDREydrKm5wib2QMLYlaejOuN0ico0PfdfbibuQ/0',0,0,0,0,'WangJIa',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2533,'','','0',0,0,1473303052,0,'','','',0,'weixin','oyP7DwNhsNF0MH5cQGMI2e35BFJo','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMlOKXRKicGF9LGeiaHe3wuz8Cbu2tZJqFRR1QBxuoWpjZN6NMyb0T9eoXAVp3JR2E7OWXsWwlx3ZU/0',0,0,0,0,'来，打死我吧',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2534,'','','0',0,0,1473303965,0,'','','',0,'weixin','oyP7DwL-OushYBCDeexzL1vg27ms','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP2TQDic4Z3bZUh9FSvc1QiaRlEWicjDewgGtS41WbbRSxUJ3RibUWicKvciag7WSEt5gmNticIlricXUgOrjw/0',0,0,0,0,'AbcKevin',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2535,'','','0',0,0,1473305375,0,'','','',0,'weixin','oyP7DwOgsSvDxEQsrUX3CQGM3uOg','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibnKUuKNRfcwqJzTxPcO39dd6wqia7t9Hy7EDZZQHx1Yqe420cibpbJ0EDOXKZNAEWQhc1NJz4xYVl/0',0,0,0,0,'mwenhua',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2536,'','','0',0,0,1473305690,0,'','','',0,'weixin','oyP7DwNmJPRMWxkWbn1iiuvxJIsk','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdKZIzzO43nY1uF3o1iaDaNk2icuwyh6hD9LZT4wDbKbFZI138kGmclaZGxzLiaptm7hBauBP0En9Kicg/0',0,0,0,0,'祢个怂样子',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2537,'','','0',0,0,1473305859,0,'','','',0,'weixin','oyP7DwE0zAV3djpBJ-rWj_ZEUQqU','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibdRdZbn4OIatu8ic910qYVyf7oWqtFrFsiazliaeq9ibyYr8doibp1oOLsJy1IJln8uyhcuSRKwRSmwMDQ/0',0,0,0,0,'〆乂、尊 ♡上',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2538,'','','0',0,0,1473306504,0,'','','',0,'weixin','oyP7DwNPzzhZtQw4pl3b-tIRkkPE','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibeD2efaCxq3icfLjWSrR6YiaKKgLiafneuw30uh8lGJYtmSaxAR6O1Yiayod8V6w927rH7wKDniby9T3ww/0',0,0,0,0,'风继续吹',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2539,'','','0',0,0,1473306596,0,'','','',0,'weixin','oyP7DwH0xTN77PEX8T-TKTbMqqb4','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3jrYpXQDtX9IeQiaE5X0r7Tl5EhHibLic97jep979tEt4O856IwqY1h3gw5RBPq7GkRFP38toTfdhqlnsHZvR7K6y/0',0,0,0,0,'Jigsaw',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2540,'','','0',0,0,1473306872,0,'','','',0,'weixin','oyP7DwJu-62hASvMo-JMwq0bsB3Y','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2xObVia7eKSbe8dZWR5WLDKBnrQBDdBzuPrlyl3dcsLztd5WKFwl1EKGYwmd5Yia3icRTyQHZJeWqWEe94B7Q0Stk/0',0,0,0,0,'乐乐呵呵',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2541,'','','0',0,0,1473307716,0,'','','',0,'weixin','oyP7DwIsimu38W5bSS0EwaI3TVFs','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPwPW7sicoAINSE4JSFzz728q79kzzVGKntuJYsBiah9NEQLgjkbEAJSt24xM5O1BicAeKu6XwOpfaZ/0',0,0,0,0,'李本伟',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2542,'','','0',0,0,1473312195,0,'','','',0,'weixin','oyP7DwPnG8QSNOf3XD8Wda4mrXOI','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibfkX1EqDick8oKUVrBHbGjiaXicHMJQpniarHWDcqPJACrwVUo1TBWib4H3kEq98NqHsuMzQf5XxU34Msg/0',0,0,0,0,'。。。123',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2543,'','','0',0,0,1473312532,0,'','','',0,'weixin','oyP7DwBfTiu0-e_pEWpXKoiehLKI','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOtQzBfpPX3eNQDkUx4LhRFxc4b6uvQ9zycSYyEaXf0icjvRibGjPbIWlqG52iaMNZECm0NoHm9zMYr/0',0,0,0,0,'自由',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2544,'','','0',0,0,1473312660,0,'','','',0,'weixin','oyP7DwBZpftEkRR8-yYjM7Z702xk','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4LmkIFibfS6fMrtavTOXNGn4HaGlxv8r127MPBHhLKLrINqGGxOSkChviaLS27JrcXxe10zuqicvPQ/0',0,0,0,0,'A道哥',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2545,'','','0',0,0,1473313466,0,'','','',0,'qq','A8E61C688F0D7AC73B563AE37474661B','0','0',0,0,0,0,'QQ用户',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2546,'','','0',0,0,1473314103,0,'','','',0,'weixin','oyP7DwLBa991tKw3zgNS3Ccfjfdg','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraN2gU7oQEKCvzduNjKWXqybgwQcb6JZpp5nlFymB24nsm3sSmQngbiaic24L1KicpFw9IEZ7Wc7KMKk/0',0,0,0,0,'安强',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2547,'','','0',0,0,1473314575,0,'','','',0,'weixin','oyP7DwAgKgcuSib89QYPG6wiBs_w','0','http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UBdkOgecLjMDyoiarnjr4eRpN4Hg74IVdTiazEDmQId3noMkMLxPdOfTTMyl8ef9ExVn8iccldQVl8X/0',0,0,0,0,'半条毛毛虫',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2548,'','','0',0,0,1473315141,0,'','','',0,'weixin','oyP7DwH4nvfv0CMGEjTbYzOQm8Kk','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8yNqo8HQL6c5YVCCXNCqxHPMSQiafiaEZhjsb7fiacojckvLuaHRr3OslyNSkY2we6R1tGGroq6OobJ/0',0,0,0,0,'A消臭除醛',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2549,'','','0',0,0,1473315665,0,'','','',0,'weixin','oyP7DwDDwfhWxBdxTylL1bOVEIsI','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4sS8NWwUccBx2y7X0KV2QQdhUtCKwS8jy6EsWKrJAgws53IfYHWslrcP370jwEiaAiaCHZoYBz6CoC/0',0,0,0,0,'A远方的朋友',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2550,'','','0',0,0,1473317413,0,'','','',0,'weixin','oyP7DwGiabwNojMbz-idayajMZ4o','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP1bopXxUwWSgE8tBucyXaaRyXo2N7lbTF3wC3ghSIhLqoaIdJX3hPseYG9rIUhzHARPo5MY38licWw/0',0,0,0,0,'clement',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2551,'','','0',0,0,1473317556,0,'','','',0,'weixin','oyP7DwKMLmK4PfABdpc569tqtVAk','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaELoj7XCfHfKMXgSUHRSTiby5qeyMnvWTd3aqITajWibCPzHpMxK8j6bdKqibZ2G46Q3sgL5x4pWGVCtw/0',0,0,0,0,'zoyzo',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2552,'','','0',0,0,1473317648,0,'','','',0,'weixin','oyP7DwBF8-txxdheBFpNsk2-dlpk','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4AicHNQhqapVK4LYrscYqQ26UibTw8wH9rLjDccfAibfP4vMHDEUu0MibFUT5oxEYAEIwq0FADow5xX/0',0,0,0,0,'Kevin',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2553,'','','0',0,0,1473319262,0,'','','',0,'weixin','oyP7DwAidiGwSPXfLv2aB3PvWQ5c','0','http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHDwIt6v1G0UDdZNmkAp45ZLU5bd3P8hDe4Z1uOuY9icHZQE8mk33ajCHxqRt7q6ju7T3yFWKgkDQ/0',0,0,0,0,'郭宝平',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2554,'','','0',0,0,1473319279,0,'','','',0,'weixin','oyP7DwM7n393ec2071b4mvOmzWvI','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKhJ7RBQgWUVJjosZyWYcBDe6GIANlvgy7gLkV5PZyvztruibREkUFMpia4ol8DWD1icvqibWmUe9yuow/0',0,0,0,0,'A ',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2555,'','','0',0,0,1473319547,0,'','','',0,'weixin','oyP7DwEgkJacg1rLqvI5l9skH_1E','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0ONZ5DHJoT6vPmkxpDsJa5PaZjNus28yG6UMghZl0VOia7Eo7p7HR3ia65YA1dsI9zKBA7nicMfQiauKjgX8ObeoMv/0',0,0,0,0,'木Duang-',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2556,'','','0',0,0,1473319948,0,'','','',0,'weixin','oyP7DwPLGxCGi1vXAXQ9zhvqQeTg','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1BbHdNpOzEq1CEd7ABg0eliatR8WyRPfhxFnAvFX0baYBRCueTGS1M6EznUyKM8DL74cDiahhEuMf/0',0,0,0,0,'阿斌',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2557,'','','0',0,0,1473320597,0,'','','',0,'weixin','oyP7DwDxeke9Scd9bzEsVVcHhP04','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3UQQCibibIY2keY2F2EqkpKkT4o3iaZBicFQvAicicWbw8icDR8empaGbFj1KC3o6MOlowKhCwib91yzibc6ML03jhWPIrO/0',0,0,0,0,'x_wchong',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2558,'','','0',0,0,1473321710,0,'','','',0,'weixin','oyP7DwMcDK9kt4Q68sXmuHU7j-mU','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEItWpoVYAiaZADdia6icNTdG6J6ARd52Vy2jWlpoXjaiaicggFuL1AhQUQb6mSFv6dQKuMNG5HeiaY6cp5Q/0',0,0,0,0,'大A',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2559,'','','0',0,0,1473324033,0,'','','',0,'weixin','oyP7DwJFGW3zk4pdlAwbhAqu_TMg','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL5d9T65ZIxQfRLsxRLAWMHwHuNqB8wVeTXyfSO78MIoVMb2JPLA77Dtpd7VD9icZ6WnST8gL0cr4puibIRt2NibINe/0',0,0,0,0,'彭伍阳',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2560,'','','0',0,0,1473324261,0,'','','',0,'weixin','oyP7DwMP7gmHEKMQFvDsz8ct9KIQ','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicpSiaSiaA6CF11ibjL0BaFU4n9c99S2h8ibAqicFjL0gbUHp19ga3JqOmsWpQo8IuUzXSy8OxR6aYfRd/0',0,0,0,0,'ekinger',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2561,'','','0',0,0,1473325462,0,'','','',0,'weixin','oyP7DwNcHmyPJrbQ7WmW5Itxx94Y','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibcCap4KxQDSCf82RGHwtyOODznLclCfibOicvnaw7UeQqsdo5WX99ockc3Y4nGho3NqSiaoSwW25Gwrw/0',0,0,0,0,'翔',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2572,'','','0',0,0,1473345922,0,'','','',0,'weixin','oyP7DwG7c4aY4gEcj_eCoY3Jyl6c','0','http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaickfvQTvBz5TmxSztawewTCXWlJQOibfGGUD2sQThcW9yvhUVZplicKsAguBzuyrZLPpBBzUpgP3vB/0',0,0,0,0,'皈依三宝',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2573,'','','0',0,0,1473348658,0,'','','',0,'weixin','oyP7DwIuIbGlBY31Reswekj3cIiM','0','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6eWHev6FswtYrU5ic4Srd60Jy9FvQwEx9wLXibAkO9WzFKV2t6eIylaln09DpOnBk4mCC90K4seQVcq6nfhbKjht7oQe3euVWeU/0',0,0,0,0,'地瓜叶',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2574,'','','0',0,0,1473350807,0,'','','',0,'weixin','oyP7DwDf4pv5ZwlS_0ALambS4pFs','0','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKtRMicnIyenXNa79yZricKlmQpE02paDZpE3iclG9BFJJRsXW6iaiaCm6IViaRlJ9B6UjPtsOtS9qIUmfQ/0',0,0,0,0,'吴世威',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2575,'','','0',0,0,1473365960,0,'','','',0,'weixin','oyP7DwFS3P8yItGkbL1rT08d3MnA','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p00Uxzdrib0snx4JWxowJib1ff3RyZGtdS5MWkLUxiaTM9xUeRx8jCicc4Vh972VlLfcicwhGrJbSbTGG0Zgg3gmpLen/0',0,0,0,0,'A粤（鸿粤网络，新丰同城）',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2577,'','','0',0,0,1473382925,0,'','','',0,'weixin','oyP7DwJp2I6Z10mT-les7FV1zR20','0','http://wx.qlogo.cn/mmopen/3ydx8qAabL53jKAK14HxVXbuOCnzCQt0j0tiaxgASjQQX5pm8bywpBCuR2wUD5JXJN5eDIjiabZom0nRUpjiboXX8Y01btuHVOC/0',0,0,0,0,'袁学飞',1,0,'','','hide');
INSERT INTO `vy_users` VALUES (2582,'','','0',0,0,1473389160,0,'','','',0,'weixin','oyP7DwM7CpW-r45Hx9kS1ofhJNsg','0','http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90I256wyDlInwrj1icqEaIZLKibRGClh6Drdvax0fzyI2VBrrtqrYLsYFxyftCGyqmARt2Um8KE6f9ib/0',0,0,0,0,'囧',1,0,'','我的世界是和你们不一样的','hide');
INSERT INTO `vy_users` VALUES (2583,'123@qq.com','e10adc3949ba59abbe56e057f20f883e','0',0,0,1473390291,0,'','','',0,'weixin','oyP7DwGkhVvAHOR7niEOOG1bDkrI','0','http://wx.qlogo.cn/mmopen/FrdAUicrPIibelAltw240OgZiankOhlKSx7YxHCJbS6FkOwqT7FLC2CWicw6nMfj6kicFzq69vxRubIl1Nvrg54N6LQ/0',0,0,0,0,'施好好',1,0,'','没有谁能理解我的天赋','hide');
INSERT INTO `vy_users` VALUES (2595,'1109305987@qq.com','e10adc3949ba59abbe56e057f20f883e','0',1,0,1504510472,0,'','','18792402229',0,'qq','9D94D6E2D801436FCF97C01A979BB059','0','/uploads/20170913/a384288d9d10a151fc5682068b2cc34f.jpg',3,37,410,0,'chichu',1,0,'0','不要因为走得太远，就忘了当初为什么出发。','hide');
INSERT INTO `vy_users` VALUES (2596,'','','0',1,0,1505263131,0,'','','',0,'qq','04CB1AA37323B0BEDD8600A9D3672C8D','0','0',0,0,0,0,'0',1,0,'3efd2fe06217efcfbddb3fc3eceabd80','','hide');
INSERT INTO `vy_users` VALUES (2597,'654222249@qq.com','7a93d4f261747ac28ccb1bbe666cacdb','0',0,0,1505265852,0,'','','',0,'','0','0','/uploads/20170913/504607a749e40709e884c3afcbf2b87a.png',0,0,0,1,'tynetm',1,0,'5cdcb47d9d0883826d1806563968bc29','','hide');
INSERT INTO `vy_users` VALUES (2598,'1090964176@qq.com','e10adc3949ba59abbe56e057f20f883e','0',0,0,1505289591,0,'','','',0,'','0','0','0',0,0,0,1,'sgml',1,0,'7ab068241fc74337ad536a8546bafcb8','','hide');
INSERT INTO `vy_users` VALUES (2599,'','','0',1,0,1505296130,0,'','','',0,'qq','2422B9B86EF1CAFA51D5255F455BDC23','0','http://qzapp.qlogo.cn/qzapp/101386319/2422B9B86EF1CAFA51D5255F455BDC23/100',0,0,0,0,'0',1,0,'226cbb140377ffa5a54a5dfc5d27be9a','','hide');
INSERT INTO `vy_users` VALUES (2600,'1060494425@qq.com','25d55ad283aa400af464c76d713c07ad','0',0,0,1512540142,0,'','','',0,'','0','0','0',0,0,0,1,'ziyou',1,0,'584e370195aaeaa701fb4708bed2e28c','','hide');
--
-- 表的结构 `vy_wx_fans`
-- 
DROP TABLE IF EXISTS `vy_wx_fans`;
CREATE TABLE `vy_wx_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间',
  PRIMARY KEY (`fans_id`),
  KEY `IDX_sys_weixin_fans_openid` (`openid`),
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表';
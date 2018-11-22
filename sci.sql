/*
Navicat MySQL Data Transfer

Source Server         : MySQL37
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sci

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-25 13:37:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for groupmember
-- ----------------------------
DROP TABLE IF EXISTS `groupmember`;
CREATE TABLE `groupmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sciid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupmember
-- ----------------------------
INSERT INTO `groupmember` VALUES ('1', '20180607065645', 't001', '1');
INSERT INTO `groupmember` VALUES ('2', '20180607065645', 't003', '2');
INSERT INTO `groupmember` VALUES ('3', '20180607065645', 't004', '3');
INSERT INTO `groupmember` VALUES ('20', '20180611121808', 't002', '1');
INSERT INTO `groupmember` VALUES ('24', '20180613071953', '12412', '1');
INSERT INTO `groupmember` VALUES ('25', '20180613071953', '12412', '2');
INSERT INTO `groupmember` VALUES ('26', '20180613071953', '214124', '3');
INSERT INTO `groupmember` VALUES ('27', '20180613072035', '1231231', '1');
INSERT INTO `groupmember` VALUES ('28', '20180613072035', '213123', '2');
INSERT INTO `groupmember` VALUES ('29', '20180613072035', '213123', '3');
INSERT INTO `groupmember` VALUES ('30', '20180621024757', 't001', '1');
INSERT INTO `groupmember` VALUES ('31', '20180621024757', 't002', '2');
INSERT INTO `groupmember` VALUES ('32', '20180621024757', 't003', '3');
INSERT INTO `groupmember` VALUES ('33', '20180625094131', 't002', '1');
INSERT INTO `groupmember` VALUES ('34', '20180625094131', 't003', '2');
INSERT INTO `groupmember` VALUES ('35', '20180625094131', 't004', '3');
INSERT INTO `groupmember` VALUES ('36', '20180611121808', 't004', '2');
INSERT INTO `groupmember` VALUES ('37', '20180611121808', 't003', '3');
INSERT INTO `groupmember` VALUES ('38', '20180625094633', 't002', '1');
INSERT INTO `groupmember` VALUES ('39', '20180625094633', 't003', '2');
INSERT INTO `groupmember` VALUES ('40', '20180625094743', 't002', '1');
INSERT INTO `groupmember` VALUES ('41', '20180625094743', 't005', '2');
INSERT INTO `groupmember` VALUES ('45', '20180625095110', 't001', '1');
INSERT INTO `groupmember` VALUES ('46', '20180625095137', 't001', '1');
INSERT INTO `groupmember` VALUES ('47', '20180625095137', 't004', '2');
INSERT INTO `groupmember` VALUES ('48', '20180625095137', 't002', '3');
INSERT INTO `groupmember` VALUES ('49', '20180625095934', 't001', '1');
INSERT INTO `groupmember` VALUES ('50', '20180625095934', 't002', '2');
INSERT INTO `groupmember` VALUES ('51', '20180625100238', 't001', '1');
INSERT INTO `groupmember` VALUES ('52', '20180625100331', 't002', '1');
INSERT INTO `groupmember` VALUES ('53', '20180625100331', 't003', '2');
INSERT INTO `groupmember` VALUES ('54', '20180625100331', 't004', '3');
INSERT INTO `groupmember` VALUES ('57', '20180625013313', 't001', '1');
INSERT INTO `groupmember` VALUES ('58', '20180625013313', 't002', '2');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sciid` varchar(20) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('2', '20180528105740', '通过', '2018-06-13');
INSERT INTO `history` VALUES ('3', '20180625095110', '不通过', '2018-06-25');
INSERT INTO `history` VALUES ('4', '20180625095036', '不通过', '2018-06-25');
INSERT INTO `history` VALUES ('5', '20180607065645', '通过', '2018-06-25');
INSERT INTO `history` VALUES ('6', '20180611121808', '通过', '2018-06-25');
INSERT INTO `history` VALUES ('7', '20180625094633', '通过', '2018-06-25');
INSERT INTO `history` VALUES ('8', '20180625094131', '不通过', '2018-06-25');
INSERT INTO `history` VALUES ('9', '20180625094743', '不通过', '2018-06-25');
INSERT INTO `history` VALUES ('10', '20180621024757', '通过', '2018-06-25');
INSERT INTO `history` VALUES ('11', '20180625095137', '不通过', '2018-06-25');
INSERT INTO `history` VALUES ('12', '20180625013313', '不通过', '2018-06-25');

-- ----------------------------
-- Table structure for scilist
-- ----------------------------
DROP TABLE IF EXISTS `scilist`;
CREATE TABLE `scilist` (
  `sciid` varchar(20) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `begindate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `typeid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sciid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scilist
-- ----------------------------
INSERT INTO `scilist` VALUES ('20180607065645', '组员测试', 't001', '2018-05-09', '2018-06-07', '组员测试，添加', '通过', '3');
INSERT INTO `scilist` VALUES ('20180611121808', '测试小组成员', 't002', '2018-05-13', '2018-06-11', '测试测试', '通过', '4');
INSERT INTO `scilist` VALUES ('20180621024757', '测试组员', 't001', '2018-01-13', '2018-10-07', '测试组员，小组成员无到有', '通过', '3');
INSERT INTO `scilist` VALUES ('20180625013313', 'test', 't001', '2018-02-02', '2018-05-12', 'dasdasd', '不通过', '3');
INSERT INTO `scilist` VALUES ('20180625094131', '啦啦啦', 't002', '2018-05-27', '2018-06-25', '啊是大神多啊是打绕弯儿翁人', '不通过', '2');
INSERT INTO `scilist` VALUES ('20180625094633', '多测试', 't002', '2018-01-02', '2018-07-07', '造啊造啊造数据', '通过', '4');
INSERT INTO `scilist` VALUES ('20180625094743', '多申报', 't002', '2018-08-01', '2018-09-23', 'lalala', '不通过', '3');
INSERT INTO `scilist` VALUES ('20180625095110', '历史历史', 't001', '2017-12-07', '2018-04-08', '历史历史', '保存', '1');
INSERT INTO `scilist` VALUES ('20180625095137', '多来几个', 't001', '2017-12-02', '2018-06-09', '再来一次', '不通过', '1');
INSERT INTO `scilist` VALUES ('20180625095934', '1234', 't001', '2018-03-16', '2018-09-15', '再来一次', '待审核', '1');
INSERT INTO `scilist` VALUES ('20180625100238', '2234', 't001', '2018-01-06', '2018-10-06', '2234', '待审核', '3');
INSERT INTO `scilist` VALUES ('20180625100331', '3234', 't002', '2018-04-30', '2018-05-27', '123', '保存', '3');

-- ----------------------------
-- Table structure for scitype
-- ----------------------------
DROP TABLE IF EXISTS `scitype`;
CREATE TABLE `scitype` (
  `typeid` varchar(20) NOT NULL,
  `typename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scitype
-- ----------------------------
INSERT INTO `scitype` VALUES ('1', '分院科研项目');
INSERT INTO `scitype` VALUES ('2', '学院科研项目');
INSERT INTO `scitype` VALUES ('3', '省级科研项目');
INSERT INTO `scitype` VALUES ('4', '国家级科研项目');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `usertype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', '管理员', 'admin');
INSERT INTO `user` VALUES ('t001', 't001', 't001', 'teacher');
INSERT INTO `user` VALUES ('t002', 't002', 't002', 'teacher');
INSERT INTO `user` VALUES ('t003', 't003', 't003', 'teacher');
INSERT INTO `user` VALUES ('t004', 't004', 't004', 'teacher');
INSERT INTO `user` VALUES ('t005', 't005', 't005', 'teacher');
INSERT INTO `user` VALUES ('t006', 't006', 't006', 'teacher');
SET FOREIGN_KEY_CHECKS=1;

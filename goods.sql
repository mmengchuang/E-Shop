/*
Navicat MySQL Data Transfer

Source Server         : my1
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2017-01-20 15:19:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart` (`u_id`),
  CONSTRAINT `fk_cart` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for cartinfo
-- ----------------------------
DROP TABLE IF EXISTS `cartinfo`;
CREATE TABLE `cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  `g_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car` (`c_id`),
  CONSTRAINT `fk_car` FOREIGN KEY (`c_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartinfo
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `comm_time` datetime DEFAULT NULL,
  `com_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '90', '用着感觉很好', '2017-01-18 23:40:34', '很好');
INSERT INTO `comments` VALUES ('2', '1', '90', '很好', '2017-01-19 09:16:12', '好评');
INSERT INTO `comments` VALUES ('3', '1', '90', '产品很好使，欢迎欢迎浏览。', '2017-01-19 11:08:02', '最好');
INSERT INTO `comments` VALUES ('4', '1', '90', '产品很好使，欢迎欢迎浏览。', '2017-01-19 11:08:23', '最好');
INSERT INTO `comments` VALUES ('5', '1', '90', '俄武器', '2017-01-19 11:11:55', '俄武器');
INSERT INTO `comments` VALUES ('6', '1', '90', '俄武器', '2017-01-19 11:12:02', '俄武器');
INSERT INTO `comments` VALUES ('9', '1', '90', '他天天天天', '2017-01-19 11:29:05', '灌灌灌灌灌');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(100) DEFAULT NULL,
  `g_price` float(20,0) DEFAULT NULL,
  `g_num` int(11) DEFAULT NULL,
  `g_detail` text,
  `g_mpic` varchar(100) DEFAULT NULL,
  `g_time` datetime DEFAULT NULL,
  `g_looknum` int(11) DEFAULT NULL,
  `g_product` varchar(200) DEFAULT NULL,
  `g_state` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('83', '小芭比', '2332', '121231', ' 型号;4GB/：NVIDIA GeForce GT 530 显存容量：DVD刻录机显卡类型：独立显卡 显存容量：DVD刻录机显卡类型;1TB/，SATA2光驱类型：1GB显卡描述;1GB独显）5650-6215元屏幕尺寸', 'imgs/A1484644802022hp1.jpg', '2017-01-17 17:19:45', '10', '湖南', '1');
INSERT INTO `good` VALUES ('86', '苹果', '5999', '12132', ' 型号;4GB/：NVIDIA GeForce GT 530 显存容量：DVD刻录机显卡类型：独立显卡 显存容量：DVD刻录机显卡类型;1TB/，SATA2光驱类型：1GB显卡描述;1GB独显）5650-6215元屏幕尺寸', 'imgs/A1484663085492apple1.jpg', '2017-01-17 22:24:28', '10', '天津', '0');
INSERT INTO `good` VALUES ('87', '惠普', '121', '211', ' 型号;4GB/：NVIDIA GeForce GT 530 显存容量：DVD刻录机显卡类型：独立显卡 显存容量：DVD刻录机显卡类型;1TB/，SATA2光驱类型：1GB显卡描述;1GB独显）5650-6215元屏幕尺寸', 'imgs/A1484663296627hp1.jpg', '2017-01-17 22:28:04', '0', '231', '1');
INSERT INTO `good` VALUES ('88', '小米', '121', '12', ' 型号;4GB/：NVIDIA GeForce GT 530 显存容量：DVD刻录机显卡类型：独立显卡 显存容量：DVD刻录机显卡类型;1TB/，SATA2光驱类型：1GB显卡描述;1GB独显）5650-6215元屏幕尺寸：', 'imgs/A1484663354481lenovo1.jpg', '2017-01-17 22:28:45', '0', '12', '1');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_con` varchar(500) NOT NULL,
  `g_id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `xian` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_label` (`g_id`),
  CONSTRAINT `fk_label` FOREIGN KEY (`g_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('54', '{\"color\":\"红色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '83', '红色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('57', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"i5-7200U\",\"xian\":\"核芯显卡\",\"size\":\"22英寸\"}', '86', '白色', '苹果', 'i5-7200U', '核芯显卡', '22英寸');
INSERT INTO `label` VALUES ('58', '{\"color\":\"红色\",\"pin\":\"惠普\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '87', '红色', '惠普', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('59', '{\"color\":\"白色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"19英寸\"}', '88', '白色', '小米', '酷睿', '集成显卡', '19英寸');

-- ----------------------------
-- Table structure for labelinfo
-- ----------------------------
DROP TABLE IF EXISTS `labelinfo`;
CREATE TABLE `labelinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `upid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of labelinfo
-- ----------------------------
INSERT INTO `labelinfo` VALUES ('1', '颜色', '0');
INSERT INTO `labelinfo` VALUES ('2', '品牌', '0');
INSERT INTO `labelinfo` VALUES ('3', '笔记本cpu', '0');
INSERT INTO `labelinfo` VALUES ('4', '显卡类型', '0');
INSERT INTO `labelinfo` VALUES ('5', '尺寸', '0');
INSERT INTO `labelinfo` VALUES ('6', '灰色', '1');
INSERT INTO `labelinfo` VALUES ('7', '红色', '1');
INSERT INTO `labelinfo` VALUES ('8', '白色', '1');
INSERT INTO `labelinfo` VALUES ('9', '黑色', '1');
INSERT INTO `labelinfo` VALUES ('10', '小米', '2');
INSERT INTO `labelinfo` VALUES ('11', '华硕', '2');
INSERT INTO `labelinfo` VALUES ('12', '戴尔', '2');
INSERT INTO `labelinfo` VALUES ('13', '苹果', '2');
INSERT INTO `labelinfo` VALUES ('14', '三星', '2');
INSERT INTO `labelinfo` VALUES ('15', '酷睿 i5', '3');
INSERT INTO `labelinfo` VALUES ('16', '酷睿 i7', '3');
INSERT INTO `labelinfo` VALUES ('17', 'i5-7200U', '3');
INSERT INTO `labelinfo` VALUES ('18', '独立显卡', '4');
INSERT INTO `labelinfo` VALUES ('19', '集成显卡', '4');
INSERT INTO `labelinfo` VALUES ('20', '核芯显卡', '4');
INSERT INTO `labelinfo` VALUES ('21', '15英寸', '5');
INSERT INTO `labelinfo` VALUES ('22', '17英寸', '5');
INSERT INTO `labelinfo` VALUES ('23', '19英寸', '5');
INSERT INTO `labelinfo` VALUES ('24', '22英寸', '5');
INSERT INTO `labelinfo` VALUES ('25', '23英寸', '5');
INSERT INTO `labelinfo` VALUES ('26', '24英寸', '5');
INSERT INTO `labelinfo` VALUES ('27', '27英寸', '5');
INSERT INTO `labelinfo` VALUES ('28', '惠普', '2');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  `g_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orde` (`o_id`),
  CONSTRAINT `fk_orde` FOREIGN KEY (`o_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('1', '1', '90', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `o_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order` (`u_id`),
  CONSTRAINT `fk_order` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '2017-01-18 22:01:10');

-- ----------------------------
-- Table structure for pic
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_url` varchar(200) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pic_fk` (`g_id`),
  CONSTRAINT `pic_fk` FOREIGN KEY (`g_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic
-- ----------------------------
INSERT INTO `pic` VALUES ('33', 'imgs/A1484644802022hp1.jpg', '83');
INSERT INTO `pic` VALUES ('39', 'imgs/A1484663085492apple1.jpg', '86');
INSERT INTO `pic` VALUES ('40', 'imgs/A1484663085492apple2.jpg', '86');
INSERT INTO `pic` VALUES ('41', 'imgs/A1484663296627hp1.jpg', '87');
INSERT INTO `pic` VALUES ('42', 'imgs/A1484663296629hp2.jpg', '87');
INSERT INTO `pic` VALUES ('43', 'imgs/A1484663296630hp3.jpg', '87');
INSERT INTO `pic` VALUES ('44', 'imgs/A1484663354481lenovo1.jpg', '88');
INSERT INTO `pic` VALUES ('45', 'imgs/A1484663354482lenovo2.jpg', '88');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL,
  `g_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `u_pwd` varchar(50) DEFAULT NULL,
  `u_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_name` (`u_name`),
  UNIQUE KEY `u_name_2` (`u_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小樱', '666', '87b9818a33d6c53827110bc54a365983');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `u_nick` varchar(200) DEFAULT NULL,
  `u_address` varchar(500) DEFAULT NULL,
  `u_head` varchar(100) DEFAULT NULL,
  `u_truename` varchar(100) DEFAULT NULL,
  `u_phone` varchar(16) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_state` int(5) DEFAULT NULL,
  `u_regtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_userinfo` (`u_id`),
  CONSTRAINT `f_userinfo` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '1', '小甜心', '河南省邓州市', '11', '大海', '666888', '1221@21312.com', '111', '2017-01-19 18:54:02');

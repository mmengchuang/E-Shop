/*
Navicat MySQL Data Transfer

Source Server         : my1
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2017-01-16 22:32:36
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('46', '121', '12321', '1', '1', null, '2017-01-15 19:08:49', '0', '12', '0');
INSERT INTO `good` VALUES ('47', '小妹妹', '121', '12', '额', null, '2017-01-15 20:11:42', '0', '而非', '0');
INSERT INTO `good` VALUES ('54', '21', '21', '111', '1', null, '2017-01-16 14:12:12', '0', '1', '0');
INSERT INTO `good` VALUES ('55', '121', '121', '111', '1', null, '2017-01-16 14:13:19', '0', '1', '0');
INSERT INTO `good` VALUES ('56', '111', '121', '111', '121', null, '2017-01-16 14:14:46', '0', '1', '0');
INSERT INTO `good` VALUES ('58', '324', '32', '132', '234', null, '2017-01-16 17:36:15', '0', '324', '0');
INSERT INTO `good` VALUES ('59', '11', '1', '111', '1', null, '2017-01-16 18:52:31', '0', '1', '0');
INSERT INTO `good` VALUES ('60', '321', '123', '13', '132', null, '2017-01-16 19:00:14', '0', '123', '0');
INSERT INTO `good` VALUES ('61', '342', '324', '342', '32', null, '2017-01-16 19:03:19', '0', '322', '0');
INSERT INTO `good` VALUES ('62', '234', '43', '43', '43', null, '2017-01-16 19:07:11', '0', '43', '0');
INSERT INTO `good` VALUES ('63', '我去', '123', '231', '213', 'img/A1484567140305smileface.png', '2017-01-16 19:45:24', '0', '321', '0');
INSERT INTO `good` VALUES ('64', '卧虎藏咯吧', '23', '21', '213', null, '2017-01-16 20:14:33', '0', '12', '0');
INSERT INTO `good` VALUES ('65', '卧虎藏咯吧', '23', '21', '213', null, '2017-01-16 20:14:59', '0', '12', '0');
INSERT INTO `good` VALUES ('66', '123', '123', '23', '232', null, '2017-01-16 20:17:25', '0', '231', '0');
INSERT INTO `good` VALUES ('67', '432', '43', '32', '32', 'img/A1484569476776birty.jpg', '2017-01-16 20:19:20', '0', '322', '0');
INSERT INTO `good` VALUES ('68', '4', '55', '23', '234', null, '2017-01-16 20:25:02', '0', '231', '0');
INSERT INTO `good` VALUES ('69', '4', '55', '23', '234', null, '2017-01-16 20:25:43', '0', '231', '0');
INSERT INTO `good` VALUES ('70', '4', '55', '23', '234', null, '2017-01-16 20:26:23', '0', '231', '0');
INSERT INTO `good` VALUES ('71', '4', '55', '23', '234', null, '2017-01-16 20:27:45', '0', '231', '0');
INSERT INTO `good` VALUES ('72', '4', '55', '23', '234', null, '2017-01-16 20:27:47', '0', '231', '0');
INSERT INTO `good` VALUES ('73', '4', '55', '23', '234', null, '2017-01-16 20:28:40', '0', '231', '0');
INSERT INTO `good` VALUES ('74', '4', '55', '23', '234', null, '2017-01-16 20:28:58', '0', '231', '0');
INSERT INTO `good` VALUES ('75', '4', '55', '23', '234', null, '2017-01-16 20:29:00', '0', '231', '0');
INSERT INTO `good` VALUES ('76', '4', '55', '23', '234', null, '2017-01-16 20:29:19', '0', '231', '0');
INSERT INTO `good` VALUES ('77', '4', '55', '23', '234', 'img/A1484569782392birty.jpg', '2017-01-16 20:29:21', '0', '231', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('24', '{\"color\":\"灰色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '46', '灰色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('25', '{\"color\":\"灰色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '47', '灰色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('26', '{\"color\":\"红色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '54', '红色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('27', '{\"color\":\"灰色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '55', '灰色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('28', '{\"color\":\"灰色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '56', '灰色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('29', '{\"color\":\"红色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '58', '红色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('30', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '59', '白色', '苹果', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('31', '{\"color\":\"白色\",\"pin\":\"华硕\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '60', '白色', '华硕', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('32', '{\"color\":\"红色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '61', '红色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('33', '{\"color\":\"红色\",\"pin\":\"三星\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '62', '红色', '三星', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('34', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '63', '白色', '苹果', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('35', '{\"color\":\"红色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '64', '红色', '戴尔', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('36', '{\"color\":\"红色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '65', '红色', '戴尔', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('37', '{\"color\":\"白色\",\"pin\":\"华硕\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '66', '白色', '华硕', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('38', '{\"color\":\"白色\",\"pin\":\"华硕\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '67', '白色', '华硕', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('39', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '68', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('40', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '69', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('41', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '70', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('42', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '71', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('43', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '72', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('44', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '73', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('45', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '74', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('46', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '75', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('47', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '76', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('48', '{\"color\":\"白色\",\"pin\":\"戴尔\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '77', '白色', '戴尔', '酷睿', '独立显卡', '15英寸');

-- ----------------------------
-- Table structure for labelinfo
-- ----------------------------
DROP TABLE IF EXISTS `labelinfo`;
CREATE TABLE `labelinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `upid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic
-- ----------------------------
INSERT INTO `pic` VALUES ('1', '1484567140305smileface.png', '63');
INSERT INTO `pic` VALUES ('2', '1484567140309sun.png', '63');
INSERT INTO `pic` VALUES ('3', '1484569167432birty.jpg', '67');
INSERT INTO `pic` VALUES ('4', '1484569167435bln2.jpg', '67');
INSERT INTO `pic` VALUES ('5', '1484569167436hjh.jpg', '67');
INSERT INTO `pic` VALUES ('6', 'img/A1484569476776birty.jpg', '67');
INSERT INTO `pic` VALUES ('7', 'img/A1484569476780bln2.jpg', '67');
INSERT INTO `pic` VALUES ('8', 'img/A1484569476780hjh.jpg', '67');
INSERT INTO `pic` VALUES ('9', 'img/A1484569775324birty.jpg', '77');
INSERT INTO `pic` VALUES ('10', 'img/A1484569775325bln2.jpg', '77');
INSERT INTO `pic` VALUES ('11', 'img/A1484569775325hjh.jpg', '77');
INSERT INTO `pic` VALUES ('12', 'img/A1484569782392birty.jpg', '77');
INSERT INTO `pic` VALUES ('13', 'img/A1484569782393bln2.jpg', '77');
INSERT INTO `pic` VALUES ('14', 'img/A1484569782393hjh.jpg', '77');

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
INSERT INTO `user` VALUES ('1', '1', '1', '87b9818a33d6c53827110bc54a365983');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------

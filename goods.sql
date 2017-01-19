/*
Navicat MySQL Data Transfer

Source Server         : my1
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2017-01-18 20:47:19
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('83', '小芭比', '2332', '121231', '戴尔决定正式成立Dell电脑公司。1987年10月，戴尔依靠他过人的胆量和敏锐的感觉，在股市暴跌的情况下大量吃进高盛的股票，第二年他便获利了1800万美元。这一年，他只有23岁，他开始向成功迈出了坚实的第一步', 'imgs/A1484644802022hp1.jpg', '2017-01-17 17:19:45', '10', '湖南', '1');
INSERT INTO `good` VALUES ('86', '苹果', '5999', '12132', '戴尔决定正式成立Dell电脑公司。1987年10月，戴尔依靠他过人的胆量和敏锐的感觉，', 'imgs/A1484663085492apple1.jpg', '2017-01-17 22:24:28', '10', '天津', '1');
INSERT INTO `good` VALUES ('87', '惠普', '121', '211', '戴尔决定正式成立Dell电脑公司。1987年10月，戴尔依靠他过人的胆量和敏锐的感觉，在股市暴跌的情况下大量吃进高盛的股票，第二年他便获利了1800万', 'imgs/A1484663296627hp1.jpg', '2017-01-17 22:28:04', '0', '231', '1');
INSERT INTO `good` VALUES ('88', '小米', '121', '12', '戴尔决定正式成立Dell电脑公司。', 'imgs/A1484663354481lenovo1.jpg', '2017-01-17 22:28:45', '0', '12', '1');
INSERT INTO `good` VALUES ('89', '戴尔', '213', '123', '戴尔决定正式成立Dell电脑公司。1987年10月，戴尔依靠他过人的胆量和敏锐的感觉，在股市暴跌的情况下大', 'imgs/A1484663402173lenovo1.jpg', '2017-01-17 22:29:45', '0', '123', '1');
INSERT INTO `good` VALUES ('90', '324', '231', '213', '戴尔决定正式成立Dell电脑公司。1987年10月，戴尔依靠他过人的胆量和敏锐的感觉，在股市暴跌的情况下大量吃进高盛的股票，第二年他便获', 'imgs/A1484663645943hp1.jpg', '2017-01-17 22:33:16', '0', '213', '1');
INSERT INTO `good` VALUES ('91', 'hhun', '213213', '123982', '132', 'imgs/A1484730258842apple1.jpg', '2017-01-18 17:04:04', '0', '132', '1');
INSERT INTO `good` VALUES ('92', '苹果之王', '3999', '500', 't挺好的', 'imgs/A1484735464365apple1.jpg', '2017-01-18 18:30:44', '0', '河南省', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('54', '{\"color\":\"红色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"15英寸\"}', '83', '红色', '小米', '酷睿', '独立显卡', '15英寸');
INSERT INTO `label` VALUES ('57', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"i5-7200U\",\"xian\":\"核芯显卡\",\"size\":\"22英寸\"}', '86', '白色', '苹果', 'i5-7200U', '核芯显卡', '22英寸');
INSERT INTO `label` VALUES ('58', '{\"color\":\"红色\",\"pin\":\"惠普\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '87', '红色', '惠普', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('59', '{\"color\":\"白色\",\"pin\":\"小米\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"19英寸\"}', '88', '白色', '小米', '酷睿', '集成显卡', '19英寸');
INSERT INTO `label` VALUES ('60', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '89', '白色', '苹果', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('61', '{\"color\":\"红色\",\"pin\":\"华硕\",\"cpu\":\"酷睿\",\"xian\":\"集成显卡\",\"size\":\"17英寸\"}', '90', '红色', '华硕', '酷睿', '集成显卡', '17英寸');
INSERT INTO `label` VALUES ('62', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"酷睿\",\"xian\":\"核芯显卡\",\"size\":\"19英寸\"}', '91', '白色', '苹果', '酷睿', '核芯显卡', '19英寸');
INSERT INTO `label` VALUES ('63', '{\"color\":\"白色\",\"pin\":\"苹果\",\"cpu\":\"酷睿\",\"xian\":\"独立显卡\",\"size\":\"17英寸\"}', '92', '白色', '苹果', '酷睿', '独立显卡', '17英寸');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
INSERT INTO `pic` VALUES ('46', 'imgs/A1484663402173lenovo1.jpg', '89');
INSERT INTO `pic` VALUES ('47', 'imgs/A1484663402173lenovo2.jpg', '89');
INSERT INTO `pic` VALUES ('48', 'imgs/A1484663645943hp1.jpg', '90');
INSERT INTO `pic` VALUES ('49', 'imgs/A1484663645944hp2.jpg', '90');
INSERT INTO `pic` VALUES ('50', 'imgs/A1484730258842apple1.jpg', '91');
INSERT INTO `pic` VALUES ('51', 'imgs/A1484730258844hp1.jpg', '91');
INSERT INTO `pic` VALUES ('52', 'imgs/A1484735464365apple1.jpg', '92');
INSERT INTO `pic` VALUES ('53', 'imgs/A1484735464365big1.jpg', '92');
INSERT INTO `pic` VALUES ('54', 'imgs/A1484735464365hpbig1.jpg', '92');
INSERT INTO `pic` VALUES ('55', 'imgs/A1484735464366big2.jpg', '92');

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

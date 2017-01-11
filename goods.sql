/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-01-11 09:46:18
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
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart` (`u_id`),
  CONSTRAINT `fk_cart` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_con` varchar(50) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_label` (`g_id`),
  CONSTRAINT `fk_label` FOREIGN KEY (`g_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `o_time` datetime DEFAULT NULL,
  `o_status` varchar(5) DEFAULT '0' COMMENT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order` (`u_id`),
  CONSTRAINT `fk_order` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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

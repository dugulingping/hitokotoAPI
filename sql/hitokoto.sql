/*
 Navicat Premium Data Transfer

 Source Server         : alicloud
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : hitokoto

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 05/07/2020 13:43:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auther
-- ----------------------------
DROP TABLE IF EXISTS `auther`;
CREATE TABLE `auther`  (
  `auther_id` int(10) UNSIGNED NOT NULL COMMENT 'id',
  `auther_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者name',
  `auther_count` smallint(5) UNSIGNED NULL DEFAULT NULL COMMENT '此作者的hitikoto数目',
  `auther_related_quote_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '关联作品id',
  `auther_related_quote_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联作品名字',
  PRIMARY KEY (`auther_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作者表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hitokoto
-- ----------------------------
DROP TABLE IF EXISTS `hitokoto`;
CREATE TABLE `hitokoto`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一言',
  `type_id` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '类别id',
  `author_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '作者id',
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者name',
  `adder_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '添加用户id',
  `adder_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加用户名字',
  `quote_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '出处id',
  `quote_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出处名字',
  `reviewer_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '审核id',
  `is_public` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否加入公共库',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `length` mediumint(6) UNSIGNED NULL DEFAULT NULL COMMENT '长度',
  `tag_json` json NULL COMMENT 'tag',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'hitokoto主库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quote
-- ----------------------------
DROP TABLE IF EXISTS `quote`;
CREATE TABLE `quote`  (
  `quote_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `quote_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `quote_count` smallint(5) UNSIGNED NULL DEFAULT NULL COMMENT '此作品的hitikoto数目',
  `quote_related_id_json` json NULL COMMENT '关联作品id',
  PRIMARY KEY (`quote_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '引用作品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `tag_quote_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT 'tag关联作品名',
  `tag_author_id` int(20) UNSIGNED NULL DEFAULT NULL COMMENT 'tag关联作者名',
  `tag_hitokoto_json` json NULL COMMENT '关联hitokoto的id的Json',
  `tag_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表\r\n' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

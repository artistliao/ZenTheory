/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3308
 Source Schema         : trade

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 07/04/2022 15:04:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ap2110.xzce
-- ----------------------------
DROP TABLE IF EXISTS `ap2110.xzce`;
CREATE TABLE `ap2110.xzce`  (
  `f1` int(11) NULL DEFAULT NULL,
  `f2` bigint(20) NULL DEFAULT NULL,
  `f3` bigint(20) NULL DEFAULT NULL,
  `f4` int(11) NULL DEFAULT NULL,
  `f5` int(11) NULL DEFAULT NULL,
  `f6` int(11) NULL DEFAULT NULL,
  `f7` int(11) NULL DEFAULT NULL,
  `f8` int(11) NULL DEFAULT NULL,
  `f9` double NULL DEFAULT NULL,
  `f10` double NULL DEFAULT NULL,
  `f11` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for draw_info
-- ----------------------------
DROP TABLE IF EXISTS `draw_info`;
CREATE TABLE `draw_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `sec_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证券类型',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名称',
  `peroid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩写简称',
  `kline_start_ts` int(11) NOT NULL DEFAULT 0 COMMENT '画图K线开始时间',
  `ext_info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '扩展信息',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '上市日期',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'draw_info表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for p2109.xdce
-- ----------------------------
DROP TABLE IF EXISTS `p2109.xdce`;
CREATE TABLE `p2109.xdce`  (
  `f1` int(11) NULL DEFAULT NULL,
  `f2` bigint(20) NULL DEFAULT NULL,
  `f3` bigint(20) NULL DEFAULT NULL,
  `f4` int(11) NULL DEFAULT NULL,
  `f5` int(11) NULL DEFAULT NULL,
  `f6` int(11) NULL DEFAULT NULL,
  `f7` int(11) NULL DEFAULT NULL,
  `f8` int(11) NULL DEFAULT NULL,
  `f9` double NULL DEFAULT NULL,
  `f10` double NULL DEFAULT NULL,
  `f11` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rb2110.xsge
-- ----------------------------
DROP TABLE IF EXISTS `rb2110.xsge`;
CREATE TABLE `rb2110.xsge`  (
  `f1` int(11) NULL DEFAULT NULL,
  `f2` bigint(20) NULL DEFAULT NULL,
  `f3` bigint(20) NULL DEFAULT NULL,
  `f4` int(11) NULL DEFAULT NULL,
  `f5` int(11) NULL DEFAULT NULL,
  `f6` int(11) NULL DEFAULT NULL,
  `f7` int(11) NULL DEFAULT NULL,
  `f8` int(11) NULL DEFAULT NULL,
  `f9` double NULL DEFAULT NULL,
  `f10` double NULL DEFAULT NULL,
  `f11` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rb2201.xsge_stroke
-- ----------------------------
DROP TABLE IF EXISTS `rb2201.xsge_stroke`;
CREATE TABLE `rb2201.xsge_stroke`  (
  `f1` int(11) NULL DEFAULT NULL,
  `f2` int(11) NULL DEFAULT NULL,
  `f3` int(11) NULL DEFAULT NULL,
  `f4` bigint(20) NULL DEFAULT NULL,
  `f5` bigint(20) NULL DEFAULT NULL,
  `f6` int(11) NULL DEFAULT NULL,
  `f7` int(11) NULL DEFAULT NULL,
  `f8` int(11) NULL DEFAULT NULL,
  `f9` double NULL DEFAULT NULL,
  `f10` double NULL DEFAULT NULL,
  `f11` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sheet1
-- ----------------------------
DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE `sheet1`  (
  `f1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f4` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f5` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f6` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f7` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f8` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f9` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f10` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f11` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `f12` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

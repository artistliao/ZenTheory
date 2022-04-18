/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3308
 Source Schema         : gp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 07/04/2022 15:04:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 1min_prices_01
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_01`;
CREATE TABLE `1min_prices_01`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(14, 2) NOT NULL COMMENT 'volume',
  `money` float(14, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817761 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1min行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_02
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_02`;
CREATE TABLE `1min_prices_02`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(14, 2) NOT NULL COMMENT 'volume',
  `money` float(14, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1743601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1min行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_03
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_03`;
CREATE TABLE `1min_prices_03`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 873121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_04
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_04`;
CREATE TABLE `1min_prices_04`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 892801 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_05
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_05`;
CREATE TABLE `1min_prices_05`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1756321 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_06
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_06`;
CREATE TABLE `1min_prices_06`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1569841 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_07
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_07`;
CREATE TABLE `1min_prices_07`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 922081 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_09
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_09`;
CREATE TABLE `1min_prices_09`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 896401 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_10
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_10`;
CREATE TABLE `1min_prices_10`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 900721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_11
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_11`;
CREATE TABLE `1min_prices_11`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1589521 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_12
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_12`;
CREATE TABLE `1min_prices_12`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 924721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_13
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_13`;
CREATE TABLE `1min_prices_13`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 912481 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_15
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_15`;
CREATE TABLE `1min_prices_15`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 879121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_16
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_16`;
CREATE TABLE `1min_prices_16`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 926161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_17
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_17`;
CREATE TABLE `1min_prices_17`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 822001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_18
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_18`;
CREATE TABLE `1min_prices_18`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1736161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_19
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_19`;
CREATE TABLE `1min_prices_19`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2696641 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_20
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_20`;
CREATE TABLE `1min_prices_20`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 917281 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_21
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_21`;
CREATE TABLE `1min_prices_21`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 917041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_22
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_22`;
CREATE TABLE `1min_prices_22`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1657681 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_23
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_23`;
CREATE TABLE `1min_prices_23`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1769041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_24
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_24`;
CREATE TABLE `1min_prices_24`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1515361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_25
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_25`;
CREATE TABLE `1min_prices_25`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 917041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_26
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_26`;
CREATE TABLE `1min_prices_26`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1845601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_27
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_27`;
CREATE TABLE `1min_prices_27`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 584881 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_28
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_28`;
CREATE TABLE `1min_prices_28`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 924721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_29
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_29`;
CREATE TABLE `1min_prices_29`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 801601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_30
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_30`;
CREATE TABLE `1min_prices_30`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(14, 2) NOT NULL COMMENT 'volume',
  `money` float(14, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1858561 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1min行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_31
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_31`;
CREATE TABLE `1min_prices_31`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351841 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_33
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_33`;
CREATE TABLE `1min_prices_33`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 806881 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_35
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_35`;
CREATE TABLE `1min_prices_35`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 922321 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_36
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_36`;
CREATE TABLE `1min_prices_36`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1777681 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_37
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_37`;
CREATE TABLE `1min_prices_37`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 849361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_38
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_38`;
CREATE TABLE `1min_prices_38`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 930721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_39
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_39`;
CREATE TABLE `1min_prices_39`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 923041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_40
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_40`;
CREATE TABLE `1min_prices_40`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 900721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_41
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_41`;
CREATE TABLE `1min_prices_41`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 873121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_42
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_42`;
CREATE TABLE `1min_prices_42`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 933121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_43
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_43`;
CREATE TABLE `1min_prices_43`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 862081 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_44
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_44`;
CREATE TABLE `1min_prices_44`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 921601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_45
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_45`;
CREATE TABLE `1min_prices_45`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 831601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_47
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_47`;
CREATE TABLE `1min_prices_47`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 906721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_48
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_48`;
CREATE TABLE `1min_prices_48`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 900721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_49
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_49`;
CREATE TABLE `1min_prices_49`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 835201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_50
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_50`;
CREATE TABLE `1min_prices_50`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 933601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_55
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_55`;
CREATE TABLE `1min_prices_55`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 844801 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_57
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_57`;
CREATE TABLE `1min_prices_57`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 855361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_58
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_58`;
CREATE TABLE `1min_prices_58`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1837921 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_60
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_60`;
CREATE TABLE `1min_prices_60`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 932401 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_61
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_61`;
CREATE TABLE `1min_prices_61`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 904321 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_62
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_62`;
CREATE TABLE `1min_prices_62`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 913441 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_63
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_63`;
CREATE TABLE `1min_prices_63`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 906001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_72
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_72`;
CREATE TABLE `1min_prices_72`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 859201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_84
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_84`;
CREATE TABLE `1min_prices_84`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 937921 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_85
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_85`;
CREATE TABLE `1min_prices_85`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 863521 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_88
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_88`;
CREATE TABLE `1min_prices_88`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 921601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_89
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_89`;
CREATE TABLE `1min_prices_89`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 891841 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_98
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_98`;
CREATE TABLE `1min_prices_98`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(16, 2) NOT NULL COMMENT 'volume',
  `money` float(16, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 834481 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_30
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_30`;
CREATE TABLE `5min_prices_30`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义',
  `gp_id` smallint(6) NOT NULL COMMENT 'gp id',
  `ts` int(11) NOT NULL COMMENT '开始时间戳',
  `open` float(8, 2) NOT NULL COMMENT 'open',
  `high` float(8, 2) NOT NULL COMMENT 'high',
  `low` float(8, 2) NOT NULL COMMENT 'low',
  `close` float(8, 2) NOT NULL COMMENT 'close',
  `volume` float(14, 2) NOT NULL COMMENT 'volume',
  `money` float(14, 2) NOT NULL COMMENT 'money',
  `factor` float(12, 6) NOT NULL COMMENT 'factor',
  `divergence` tinyint(4) NULL DEFAULT NULL COMMENT 'divergence',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gp_id`(`gp_id`) USING BTREE,
  INDEX `idx_ts`(`ts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184704 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gp_trade_days
-- ----------------------------
DROP TABLE IF EXISTS `gp_trade_days`;
CREATE TABLE `gp_trade_days`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'gp id,',
  `day` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_day`(`day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4133 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'gp_trade_days表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for securities
-- ----------------------------
DROP TABLE IF EXISTS `securities`;
CREATE TABLE `securities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'gp id,',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `display_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名称',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩写简称',
  `start_date` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上市日期',
  `end_date` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退市日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4321 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'securities表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

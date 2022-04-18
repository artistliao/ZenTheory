/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3308
 Source Schema         : futures

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 07/04/2022 15:04:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 15min_prices_ap
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_ap`;
CREATE TABLE `15min_prices_ap`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 16173 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_bu
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_bu`;
CREATE TABLE `15min_prices_bu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 38918 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_c2
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_c2`;
CREATE TABLE `15min_prices_c2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 5169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_c8
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_c8`;
CREATE TABLE `15min_prices_c8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 17096 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_cf
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_cf`;
CREATE TABLE `15min_prices_cf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 23642 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_cs
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_cs`;
CREATE TABLE `15min_prices_cs`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 22299 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_eg
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_eg`;
CREATE TABLE `15min_prices_eg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3641 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_fg
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_fg`;
CREATE TABLE `15min_prices_fg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3802 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_fu
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_fu`;
CREATE TABLE `15min_prices_fu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 27748 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_hc
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_hc`;
CREATE TABLE `15min_prices_hc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4231 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_jd
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_jd`;
CREATE TABLE `15min_prices_jd`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 18789 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_l2
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_l2`;
CREATE TABLE `15min_prices_l2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3802 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_m2
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_m2`;
CREATE TABLE `15min_prices_m2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3817 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_m8
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_m8`;
CREATE TABLE `15min_prices_m8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20006 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_ma
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_ma`;
CREATE TABLE `15min_prices_ma`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_p2
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_p2`;
CREATE TABLE `15min_prices_p2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 8970 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_p8
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_p8`;
CREATE TABLE `15min_prices_p8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20006 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_pp
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_pp`;
CREATE TABLE `15min_prices_pp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 26105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_rb
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_rb`;
CREATE TABLE `15min_prices_rb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 23654 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_rm
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_rm`;
CREATE TABLE `15min_prices_rm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24156 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_sa
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_sa`;
CREATE TABLE `15min_prices_sa`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 12522 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_sm
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_sm`;
CREATE TABLE `15min_prices_sm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2506 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_sr
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_sr`;
CREATE TABLE `15min_prices_sr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 23657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15min_prices_ta
-- ----------------------------
DROP TABLE IF EXISTS `15min_prices_ta`;
CREATE TABLE `15min_prices_ta`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_a2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_a2`;
CREATE TABLE `1min_prices_a2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 44041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_a8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_a8`;
CREATE TABLE `1min_prices_a8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1100806 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_a9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_a9`;
CREATE TABLE `1min_prices_a9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1100806 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ag
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ag`;
CREATE TABLE `1min_prices_ag`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1020623 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_al
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_al`;
CREATE TABLE `1min_prices_al`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2593291 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ap
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ap`;
CREATE TABLE `1min_prices_ap`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 231332 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_au
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_au`;
CREATE TABLE `1min_prices_au`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2514420 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_b2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_b2`;
CREATE TABLE `1min_prices_b2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 44041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_b8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_b8`;
CREATE TABLE `1min_prices_b8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1100806 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_b9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_b9`;
CREATE TABLE `1min_prices_b9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1100806 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_bb
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_bb`;
CREATE TABLE `1min_prices_bb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 400951 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_bc
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_bc`;
CREATE TABLE `1min_prices_bc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 97980 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_bu
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_bu`;
CREATE TABLE `1min_prices_bu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 754975 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_c2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_c2`;
CREATE TABLE `1min_prices_c2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 54155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_c8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_c8`;
CREATE TABLE `1min_prices_c8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 962806 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_c9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_c9`;
CREATE TABLE `1min_prices_c9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 937411 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_cf
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_cf`;
CREATE TABLE `1min_prices_cf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2311145 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_cj
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_cj`;
CREATE TABLE `1min_prices_cj`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 134131 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_cs
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_cs`;
CREATE TABLE `1min_prices_cs`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 472910 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_cu
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_cu`;
CREATE TABLE `1min_prices_cu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2593291 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_cy
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_cy`;
CREATE TABLE `1min_prices_cy`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 353311 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_eb
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_eb`;
CREATE TABLE `1min_prices_eb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 161221 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_eg
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_eg`;
CREATE TABLE `1min_prices_eg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 273979 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_er
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_er`;
CREATE TABLE `1min_prices_er`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 223651 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_fb
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_fb`;
CREATE TABLE `1min_prices_fb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 400951 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_fg
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_fg`;
CREATE TABLE `1min_prices_fg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 745804 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_fu
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_fu`;
CREATE TABLE `1min_prices_fu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2048978 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_gn
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_gn`;
CREATE TABLE `1min_prices_gn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 570151 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_hc
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_hc`;
CREATE TABLE `1min_prices_hc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 697461 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_i2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_i2`;
CREATE TABLE `1min_prices_i2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 44041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_i8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_i8`;
CREATE TABLE `1min_prices_i8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 621781 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ic
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ic`;
CREATE TABLE `1min_prices_ic`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 353791 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_if
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_if`;
CREATE TABLE `1min_prices_if`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 64531 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ih
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ih`;
CREATE TABLE `1min_prices_ih`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 353791 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_j2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_j2`;
CREATE TABLE `1min_prices_j2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 44041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_j8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_j8`;
CREATE TABLE `1min_prices_j8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 793268 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_jd
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_jd`;
CREATE TABLE `1min_prices_jd`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 494360 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_jm
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_jm`;
CREATE TABLE `1min_prices_jm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 696196 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_jr
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_jr`;
CREATE TABLE `1min_prices_jr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 404101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_l2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_l2`;
CREATE TABLE `1min_prices_l2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 101059 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_l8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_l8`;
CREATE TABLE `1min_prices_l8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 797686 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_l9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_l9`;
CREATE TABLE `1min_prices_l9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 797461 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_lh
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_lh`;
CREATE TABLE `1min_prices_lh`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 39826 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_lr
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_lr`;
CREATE TABLE `1min_prices_lr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 368776 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_lu
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_lu`;
CREATE TABLE `1min_prices_lu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 108196 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_m2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_m2`;
CREATE TABLE `1min_prices_m2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 102893 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_m8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_m8`;
CREATE TABLE `1min_prices_m8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1126201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_m9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_m9`;
CREATE TABLE `1min_prices_m9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1100806 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ma
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ma`;
CREATE TABLE `1min_prices_ma`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 725634 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_me
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_me`;
CREATE TABLE `1min_prices_me`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 208051 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ni
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ni`;
CREATE TABLE `1min_prices_ni`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 699931 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_nr
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_nr`;
CREATE TABLE `1min_prices_nr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 172141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_oi
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_oi`;
CREATE TABLE `1min_prices_oi`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 710161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_p2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_p2`;
CREATE TABLE `1min_prices_p2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 111174 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_p8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_p8`;
CREATE TABLE `1min_prices_p8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1008338 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_p9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_p9`;
CREATE TABLE `1min_prices_p9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 982718 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_pb
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_pb`;
CREATE TABLE `1min_prices_pb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 986552 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_pf
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_pf`;
CREATE TABLE `1min_prices_pf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 83596 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_pg
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_pg`;
CREATE TABLE `1min_prices_pg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 124756 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_pk
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_pk`;
CREATE TABLE `1min_prices_pk`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 32626 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_pm
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_pm`;
CREATE TABLE `1min_prices_pm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 503101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_pp
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_pp`;
CREATE TABLE `1min_prices_pp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 574929 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_rb
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_rb`;
CREATE TABLE `1min_prices_rb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1858260 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ri
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ri`;
CREATE TABLE `1min_prices_ri`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 475201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_rm
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_rm`;
CREATE TABLE `1min_prices_rm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 786159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ro
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ro`;
CREATE TABLE `1min_prices_ro`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 649576 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_rr
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_rr`;
CREATE TABLE `1min_prices_rr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 126721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_rs
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_rs`;
CREATE TABLE `1min_prices_rs`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 450901 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ru
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ru`;
CREATE TABLE `1min_prices_ru`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2160301 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sa
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sa`;
CREATE TABLE `1min_prices_sa`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 229584 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sc
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sc`;
CREATE TABLE `1min_prices_sc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 361211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sf
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sf`;
CREATE TABLE `1min_prices_sf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 393106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sm
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sm`;
CREATE TABLE `1min_prices_sm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 430684 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sn
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sn`;
CREATE TABLE `1min_prices_sn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 699931 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sp
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sp`;
CREATE TABLE `1min_prices_sp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 230881 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_sr
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_sr`;
CREATE TABLE `1min_prices_sr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2201120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ss
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ss`;
CREATE TABLE `1min_prices_ss`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 208189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_t8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_t8`;
CREATE TABLE `1min_prices_t8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 396901 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ta
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ta`;
CREATE TABLE `1min_prices_ta`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2104854 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_tc
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_tc`;
CREATE TABLE `1min_prices_tc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 167926 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_tf
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_tf`;
CREATE TABLE `1min_prices_tf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 496801 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ts
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ts`;
CREATE TABLE `1min_prices_ts`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 171181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ur
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ur`;
CREATE TABLE `1min_prices_ur`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 118606 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_v2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_v2`;
CREATE TABLE `1min_prices_v2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 44041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_v8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_v8`;
CREATE TABLE `1min_prices_v8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 698011 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_wh
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_wh`;
CREATE TABLE `1min_prices_wh`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 475201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_wr
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_wr`;
CREATE TABLE `1min_prices_wr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1314226 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_ws
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_ws`;
CREATE TABLE `1min_prices_ws`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 915301 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_wt
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_wt`;
CREATE TABLE `1min_prices_wt`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 862651 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_y2
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_y2`;
CREATE TABLE `1min_prices_y2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 44041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_y8
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_y8`;
CREATE TABLE `1min_prices_y8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1045681 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_y9
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_y9`;
CREATE TABLE `1min_prices_y9`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1045456 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_zc
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_zc`;
CREATE TABLE `1min_prices_zc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 558286 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 1min_prices_zn
-- ----------------------------
DROP TABLE IF EXISTS `1min_prices_zn`;
CREATE TABLE `1min_prices_zn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2352316 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_a2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_a2`;
CREATE TABLE `30min_prices_a2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_al
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_al`;
CREATE TABLE `30min_prices_al`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ap
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ap`;
CREATE TABLE `30min_prices_ap`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 8537 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_b2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_b2`;
CREATE TABLE `30min_prices_b2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2641 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_bc
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_bc`;
CREATE TABLE `30min_prices_bc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2516 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_bu
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_bu`;
CREATE TABLE `30min_prices_bu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20209 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_c2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_c2`;
CREATE TABLE `30min_prices_c2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2698 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_c8
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_c8`;
CREATE TABLE `30min_prices_c8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 8841 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_cf
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_cf`;
CREATE TABLE `30min_prices_cf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14610 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_cj
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_cj`;
CREATE TABLE `30min_prices_cj`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1609 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_cs
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_cs`;
CREATE TABLE `30min_prices_cs`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 11565 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_cu
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_cu`;
CREATE TABLE `30min_prices_cu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_cy
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_cy`;
CREATE TABLE `30min_prices_cy`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_eb
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_eb`;
CREATE TABLE `30min_prices_eb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2545 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_eg
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_eg`;
CREATE TABLE `30min_prices_eg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_fg
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_fg`;
CREATE TABLE `30min_prices_fg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4373 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_fu
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_fu`;
CREATE TABLE `30min_prices_fu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_hc
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_hc`;
CREATE TABLE `30min_prices_hc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4397 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_i2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_i2`;
CREATE TABLE `30min_prices_i2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_j2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_j2`;
CREATE TABLE `30min_prices_j2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_jd
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_jd`;
CREATE TABLE `30min_prices_jd`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 9932 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_jm
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_jm`;
CREATE TABLE `30min_prices_jm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_l2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_l2`;
CREATE TABLE `30min_prices_l2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4373 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_lh
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_lh`;
CREATE TABLE `30min_prices_lh`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_lu
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_lu`;
CREATE TABLE `30min_prices_lu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2305 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_m2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_m2`;
CREATE TABLE `30min_prices_m2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4409 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_m8
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_m8`;
CREATE TABLE `30min_prices_m8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 10296 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ma
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ma`;
CREATE TABLE `30min_prices_ma`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14871 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ni
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ni`;
CREATE TABLE `30min_prices_ni`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_nr
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_nr`;
CREATE TABLE `30min_prices_nr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_oi
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_oi`;
CREATE TABLE `30min_prices_oi`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_p2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_p2`;
CREATE TABLE `30min_prices_p2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4682 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_p8
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_p8`;
CREATE TABLE `30min_prices_p8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 10296 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_pb
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_pb`;
CREATE TABLE `30min_prices_pb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_pf
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_pf`;
CREATE TABLE `30min_prices_pf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2237 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_pg
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_pg`;
CREATE TABLE `30min_prices_pg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2545 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_pk
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_pk`;
CREATE TABLE `30min_prices_pk`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 873 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_pp
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_pp`;
CREATE TABLE `30min_prices_pp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13551 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_rb
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_rb`;
CREATE TABLE `30min_prices_rb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14437 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_rm
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_rm`;
CREATE TABLE `30min_prices_rm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14879 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ru
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ru`;
CREATE TABLE `30min_prices_ru`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_sa
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_sa`;
CREATE TABLE `30min_prices_sa`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 8827 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_sf
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_sf`;
CREATE TABLE `30min_prices_sf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1609 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_sm
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_sm`;
CREATE TABLE `30min_prices_sm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2945 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_sn
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_sn`;
CREATE TABLE `30min_prices_sn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_sp
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_sp`;
CREATE TABLE `30min_prices_sp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_sr
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_sr`;
CREATE TABLE `30min_prices_sr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14618 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ss
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ss`;
CREATE TABLE `30min_prices_ss`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ta
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ta`;
CREATE TABLE `30min_prices_ta`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14871 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_ur
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_ur`;
CREATE TABLE `30min_prices_ur`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1609 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_v2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_v2`;
CREATE TABLE `30min_prices_v2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_y2
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_y2`;
CREATE TABLE `30min_prices_y2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_zc
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_zc`;
CREATE TABLE `30min_prices_zc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 2449 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 30min_prices_zn
-- ----------------------------
DROP TABLE IF EXISTS `30min_prices_zn`;
CREATE TABLE `30min_prices_zn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 3484 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_a2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_a2`;
CREATE TABLE `5min_prices_a2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_al
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_al`;
CREATE TABLE `5min_prices_al`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ap
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ap`;
CREATE TABLE `5min_prices_ap`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 26107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_b2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_b2`;
CREATE TABLE `5min_prices_b2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 15175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_bc
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_bc`;
CREATE TABLE `5min_prices_bc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14609 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_bu
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_bu`;
CREATE TABLE `5min_prices_bu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 77122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_c2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_c2`;
CREATE TABLE `5min_prices_c2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 15505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_c8
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_c8`;
CREATE TABLE `5min_prices_c8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_cf
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_cf`;
CREATE TABLE `5min_prices_cf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 48013 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_cj
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_cj`;
CREATE TABLE `5min_prices_cj`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 9046 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_cs
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_cs`;
CREATE TABLE `5min_prices_cs`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 39829 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_cu
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_cu`;
CREATE TABLE `5min_prices_cu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_cy
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_cy`;
CREATE TABLE `5min_prices_cy`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_eb
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_eb`;
CREATE TABLE `5min_prices_eb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14623 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_eg
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_eg`;
CREATE TABLE `5min_prices_eg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24025 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_fg
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_fg`;
CREATE TABLE `5min_prices_fg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 25129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_fu
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_fu`;
CREATE TABLE `5min_prices_fu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 52729 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_hc
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_hc`;
CREATE TABLE `5min_prices_hc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 25267 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_i2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_i2`;
CREATE TABLE `5min_prices_i2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_j2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_j2`;
CREATE TABLE `5min_prices_j2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_jd
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_jd`;
CREATE TABLE `5min_prices_jd`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 33956 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_jm
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_jm`;
CREATE TABLE `5min_prices_jm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_l2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_l2`;
CREATE TABLE `5min_prices_l2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 25129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_lh
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_lh`;
CREATE TABLE `5min_prices_lh`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 5626 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_lu
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_lu`;
CREATE TABLE `5min_prices_lu`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13243 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_m2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_m2`;
CREATE TABLE `5min_prices_m2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 25336 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_m8
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_m8`;
CREATE TABLE `5min_prices_m8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ma
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ma`;
CREATE TABLE `5min_prices_ma`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 49510 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ni
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ni`;
CREATE TABLE `5min_prices_ni`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_nr
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_nr`;
CREATE TABLE `5min_prices_nr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_oi
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_oi`;
CREATE TABLE `5min_prices_oi`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_p2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_p2`;
CREATE TABLE `5min_prices_p2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 26910 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_p8
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_p8`;
CREATE TABLE `5min_prices_p8`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 24175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_pb
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_pb`;
CREATE TABLE `5min_prices_pb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_pf
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_pf`;
CREATE TABLE `5min_prices_pf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 12853 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_pg
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_pg`;
CREATE TABLE `5min_prices_pg`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14623 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_pk
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_pk`;
CREATE TABLE `5min_prices_pk`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4906 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_pp
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_pp`;
CREATE TABLE `5min_prices_pp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 51248 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_rb
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_rb`;
CREATE TABLE `5min_prices_rb`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 202918 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_rm
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_rm`;
CREATE TABLE `5min_prices_rm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 49555 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ru
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ru`;
CREATE TABLE `5min_prices_ru`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_sa
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_sa`;
CREATE TABLE `5min_prices_sa`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 49510 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_sf
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_sf`;
CREATE TABLE `5min_prices_sf`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 9046 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_sm
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_sm`;
CREATE TABLE `5min_prices_sm`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 16561 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_sn
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_sn`;
CREATE TABLE `5min_prices_sn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_sp
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_sp`;
CREATE TABLE `5min_prices_sp`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_sr
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_sr`;
CREATE TABLE `5min_prices_sr`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 48059 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ss
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ss`;
CREATE TABLE `5min_prices_ss`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ta
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ta`;
CREATE TABLE `5min_prices_ta`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 49510 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_ur
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_ur`;
CREATE TABLE `5min_prices_ur`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 9046 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_v2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_v2`;
CREATE TABLE `5min_prices_v2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_y2
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_y2`;
CREATE TABLE `5min_prices_y2`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 13726 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_zc
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_zc`;
CREATE TABLE `5min_prices_zc`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 14071 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 5min_prices_zn
-- ----------------------------
DROP TABLE IF EXISTS `5min_prices_zn`;
CREATE TABLE `5min_prices_zn`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 20234 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行情表' ROW_FORMAT = Dynamic;

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
  `trade_times` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交易时间段集合',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6526 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'securities表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trade_time_section
-- ----------------------------
DROP TABLE IF EXISTS `trade_time_section`;
CREATE TABLE `trade_time_section`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `end_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_time`(`start_time`, `end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'trade_time_section表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zlhy
-- ----------------------------
DROP TABLE IF EXISTS `zlhy`;
CREATE TABLE `zlhy`  (
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : VOTESYS

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 11/11/2019 15:38:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for batch
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `id` varchar(255) NOT NULL,
  `belong` int(11) DEFAULT NULL,
  `desp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for batchToQuestion
-- ----------------------------
DROP TABLE IF EXISTS `batchToQuestion`;
CREATE TABLE `batchToQuestion` (
  `id` varchar(255) NOT NULL,
  `batchid` varchar(255) DEFAULT NULL,
  `qustid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `iconfilename` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `companytype` varchar(255) DEFAULT NULL,
  `companydesp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for questionToResult
-- ----------------------------
DROP TABLE IF EXISTS `questionToResult`;
CREATE TABLE `questionToResult` (
  `id` varchar(255) NOT NULL,
  `qustid` varchar(255) DEFAULT NULL,
  `resultid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for singleQuestion
-- ----------------------------
DROP TABLE IF EXISTS `singleQuestion`;
CREATE TABLE `singleQuestion` (
  `id` varchar(255) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `texta` varchar(255) DEFAULT NULL,
  `textb` varchar(255) DEFAULT NULL,
  `textc` varchar(255) DEFAULT NULL,
  `textd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for singleQuestionResult
-- ----------------------------
DROP TABLE IF EXISTS `singleQuestionResult`;
CREATE TABLE `singleQuestionResult` (
  `id` varchar(255) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for subjectiveQuestion
-- ----------------------------
DROP TABLE IF EXISTS `subjectiveQuestion`;
CREATE TABLE `subjectiveQuestion` (
  `id` varchar(255) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for subjectiveQuestionResult
-- ----------------------------
DROP TABLE IF EXISTS `subjectiveQuestionResult`;
CREATE TABLE `subjectiveQuestionResult` (
  `id` varchar(255) NOT NULL,
  `userid` int(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `iconfilename` varchar(255) DEFAULT NULL,
  `like` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;

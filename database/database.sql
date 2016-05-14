/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-05-14 11:06:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for checkitem
-- ----------------------------
DROP TABLE IF EXISTS `checkitem`;
CREATE TABLE `checkitem` (
  `checkId` int(11) NOT NULL AUTO_INCREMENT,
  `checkName` varchar(255) NOT NULL,
  `taskId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`checkId`),
  KEY `task_userId` (`userId`),
  KEY `task_taskId` (`taskId`),
  CONSTRAINT `task_taskId` FOREIGN KEY (`taskId`) REFERENCES `task` (`taskId`),
  CONSTRAINT `task_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkitem
-- ----------------------------
INSERT INTO `checkitem` VALUES ('2', '检查页面', '1', '5');
INSERT INTO `checkitem` VALUES ('3', '检查代码', '1', '5');
INSERT INTO `checkitem` VALUES ('4', '检查功能', '1', '5');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) NOT NULL,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `type` int(255) NOT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '实习', '2016-04-01', '2016-05-01', '完成两个月实习工作', '0');
INSERT INTO `project` VALUES ('2', '毕业设计', '2016-05-01', '2016-06-15', '完成本科毕业设计', '1');
INSERT INTO `project` VALUES ('3', '毕业论文', '2016-05-10', '2016-06-29', '完成本科毕业论文', '1');

-- ----------------------------
-- Table structure for project_user
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_userId` (`userId`),
  KEY `project_user_projectId` (`projectId`),
  CONSTRAINT `project_user_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`),
  CONSTRAINT `project_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_user
-- ----------------------------
INSERT INTO `project_user` VALUES ('1', '5', '1');
INSERT INTO `project_user` VALUES ('2', '1', '1');
INSERT INTO `project_user` VALUES ('3', '2', '1');
INSERT INTO `project_user` VALUES ('4', '3', '1');
INSERT INTO `project_user` VALUES ('5', '5', '2');
INSERT INTO `project_user` VALUES ('6', '5', '3');
INSERT INTO `project_user` VALUES ('7', '2', '2');
INSERT INTO `project_user` VALUES ('8', '3', '3');

-- ----------------------------
-- Table structure for remark
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark` (
  `remarkId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  `remarkName` varchar(255) NOT NULL,
  PRIMARY KEY (`remarkId`),
  KEY `remark_taskId` (`taskId`),
  KEY `remark_userId` (`userId`),
  CONSTRAINT `remark_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `remark_taskId` FOREIGN KEY (`taskId`) REFERENCES `task` (`taskId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remark
-- ----------------------------
INSERT INTO `remark` VALUES ('1', '5', '1', '备注1');
INSERT INTO `remark` VALUES ('2', '5', '1', '备注2');
INSERT INTO `remark` VALUES ('3', '5', '2', '备注3');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(255) NOT NULL,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `taskStatus` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `exigenceStatus` int(11) NOT NULL,
  PRIMARY KEY (`taskId`),
  KEY `task_projectId` (`projectId`),
  CONSTRAINT `task_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '任务1', '2016-05-02', '2016-06-22', '任务1', '0', '1', '0');
INSERT INTO `task` VALUES ('2', '任务2', '2016-05-16', '2016-06-28', '任务2', '0', '1', '1');
INSERT INTO `task` VALUES ('3', '任务3', '2016-05-03', '2016-05-24', '任务3', '0', '1', '2');
INSERT INTO `task` VALUES ('4', '任务4', '2016-05-02', '2016-06-15', '任务4', '0', '2', '1');
INSERT INTO `task` VALUES ('6', '任务5', '2016-05-10', '2016-06-22', '任务5', '0', '2', '0');
INSERT INTO `task` VALUES ('8', '任务6', '2016-05-17', '2016-06-30', '任务6', '2', '2', '2');
INSERT INTO `task` VALUES ('9', '任务7', '2016-05-24', '2016-06-23', '任务7', '1', '1', '0');
INSERT INTO `task` VALUES ('10', '任务8', '2016-05-09', '2016-06-22', '任务8', '1', '1', '1');
INSERT INTO `task` VALUES ('11', '任务9', '2016-05-17', '2016-06-16', '任务9', '1', '1', '2');
INSERT INTO `task` VALUES ('12', '任务10', '2016-05-03', '2016-07-13', '任务10', '2', '2', '1');
INSERT INTO `task` VALUES ('13', '任务11', '2016-05-10', '2016-05-01', '任务11', '1', '3', '2');
INSERT INTO `task` VALUES ('16', '任务', '2016-05-10', '2016-06-16', '任务12', '2', '3', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小明', '11', '11');
INSERT INTO `user` VALUES ('2', '小红', '22', '22');
INSERT INTO `user` VALUES ('3', '小王', '33', '33');
INSERT INTO `user` VALUES ('4', '小羊', '44', '44');
INSERT INTO `user` VALUES ('5', 'test', '00', '00');

-- ----------------------------
-- Table structure for user_task
-- ----------------------------
DROP TABLE IF EXISTS `user_task`;
CREATE TABLE `user_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_task_userId` (`userId`),
  KEY `user_task_taskId` (`taskId`),
  CONSTRAINT `user_task_taskId` FOREIGN KEY (`taskId`) REFERENCES `task` (`taskId`),
  CONSTRAINT `user_task_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_task
-- ----------------------------
INSERT INTO `user_task` VALUES ('1', '5', '1');
INSERT INTO `user_task` VALUES ('2', '5', '2');
INSERT INTO `user_task` VALUES ('3', '5', '3');
INSERT INTO `user_task` VALUES ('6', '5', '6');
INSERT INTO `user_task` VALUES ('7', '5', '8');
INSERT INTO `user_task` VALUES ('8', '5', '9');
INSERT INTO `user_task` VALUES ('9', '1', '8');

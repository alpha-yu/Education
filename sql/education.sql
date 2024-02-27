/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 127.0.0.1:3306
 Source Schema         : education

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 27/02/2024 16:16:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `edu_advertisement`;
CREATE TABLE `edu_advertisement`  (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `useFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为使用，1为隐藏',
  `create_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_advertisement
-- ----------------------------
INSERT INTO `edu_advertisement` VALUES (1, '广告1', '/dev-api/profile/avatar/2024/02/25/ad_1_20240225233649A003.png', '0', 'admin', '2024-02-25 20:17:30', 'admin', '2024-02-25 23:36:49');
INSERT INTO `edu_advertisement` VALUES (2, '广告2', '/dev-api/profile/avatar/2024/02/25/ad_2_20240225233654A004.png', '1', 'admin', '2024-02-25 20:19:19', 'admin', '2024-02-25 23:36:54');
INSERT INTO `edu_advertisement` VALUES (3, '广告3', '/dev-api/profile/avatar/2024/02/25/ad_3_20240225233704A005.png', '0', 'admin', '2024-02-25 23:37:04', NULL, NULL);
INSERT INTO `edu_advertisement` VALUES (4, '广告4', '/dev-api/profile/avatar/2024/02/25/ad_4_20240225233714A006.png', '0', 'admin', '2024-02-25 23:37:14', NULL, NULL);

-- ----------------------------
-- Table structure for edu_goods
-- ----------------------------
DROP TABLE IF EXISTS `edu_goods`;
CREATE TABLE `edu_goods`  (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_id` bigint(20) NULL DEFAULT NULL,
  `goods_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(50, 10) NULL DEFAULT NULL,
  `buyer_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `soldFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为待售，1为售出',
  `create_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_goods
-- ----------------------------
INSERT INTO `edu_goods` VALUES (1, '橘子', 2, '/dev-api/profile/avatar/2024/02/25/橘子_20240225204014A003.jpg', '橘子', 3.5000000000, NULL, '0', 'admin', '2024-02-25 20:40:14', NULL, NULL);
INSERT INTO `edu_goods` VALUES (2, '胡萝卜', 1, '/dev-api/profile/avatar/2024/02/25/胡萝卜_20240225204110A004.jpg', '胡萝卜', 2.0000000000, '购买人A', '1', 'admin', '2024-02-25 20:41:10', 'admin', '2024-02-26 21:32:06');
INSERT INTO `edu_goods` VALUES (3, '猕猴桃', 2, '/dev-api/profile/avatar/2024/02/25/猕猴桃_20240225204126A005.jpg', '猕猴桃', 8.0000000000, NULL, '0', 'admin', '2024-02-25 20:41:26', NULL, NULL);

-- ----------------------------
-- Table structure for edu_post
-- ----------------------------
DROP TABLE IF EXISTS `edu_post`;
CREATE TABLE `edu_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_id` bigint(20) NULL DEFAULT NULL,
  `post_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为正常，1为完成',
  `create_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_post
-- ----------------------------
INSERT INTO `edu_post` VALUES (1, 1, '岗位A共1位，岗位B共3位，岗位C共2位', '0', 'admin', '2024-02-25 23:16:07', NULL, NULL);
INSERT INTO `edu_post` VALUES (2, 2, '岗位A共4位，岗位B共1位，岗位C共2位', '1', 'admin', '2024-02-25 23:16:26', 'admin', '2024-02-25 23:18:51');

-- ----------------------------
-- Table structure for edu_resource
-- ----------------------------
DROP TABLE IF EXISTS `edu_resource`;
CREATE TABLE `edu_resource`  (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_object` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_ver` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `norFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为正常，1为失效',
  `create_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_resource
-- ----------------------------
INSERT INTO `edu_resource` VALUES (1, '高三地理选修1', '/dev-api/profile/avatar/2024/02/25/12-地理-1_20240225204533A006.jpg', '高三地理选修1', 'http://www.dzkbw.com/books/rjb/dili/xgxx1/', '2', '12', '7', '人教版', '0', 'admin', '2024-02-25 20:45:33', 'admin', '2024-02-25 20:45:47');
INSERT INTO `edu_resource` VALUES (2, '四年级科学下册', '/dev-api/profile/avatar/2024/02/25/4-科学-苏_20240225204815A007.jpg', '四年级科学下册', 'http://www.dzkbw.com/books/sjb/kexue/4x/', '2', '4', '10', '苏教版', '0', 'admin', '2024-02-25 20:48:15', NULL, NULL);
INSERT INTO `edu_resource` VALUES (3, '七年级下册语文统编版第一单元电子课件', NULL, '七年级下册语文统编版电子课件', 'https://www.21cnjy.com/muluzjvip/127894?tips=1&bd_vid=9410450806069417430', '3', '7', '1', '21世纪教育', '0', 'admin', '2024-02-25 20:50:13', NULL, NULL);
INSERT INTO `edu_resource` VALUES (4, '人教七下英语Unit 3课文朗读', '/dev-api/profile/avatar/2024/02/25/7-英语_20240225205213A008.jpg', '人教七下英语Unit 3课文朗读', 'https://mp.weixin.qq.com/s?__biz=MzAxMTUwMjk5NQ==&mid=2651137059&idx=3&sn=a337d3336423ff475f630240547e361a&chksm=80b190dfb7c619c9551398b367ad569cf4221b5e25edccc155e8f7c707baacd881175837b608&scene=27', '1', '7', '3', '人教版', '0', 'admin', '2024-02-25 20:52:13', NULL, NULL);

-- ----------------------------
-- Table structure for edu_school
-- ----------------------------
DROP TABLE IF EXISTS `edu_school`;
CREATE TABLE `edu_school`  (
  `school_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_cif` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school_pc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为正常，1为停用',
  `create_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`school_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_school
-- ----------------------------
INSERT INTO `edu_school` VALUES (1, '西北大学1', '/dev-api/profile/avatar/2024/02/25/西北大学_20240225203448A001.jpg', '简介', '000000', '西北大学', '000000', '0', 'admin', '2024-02-25 20:34:48', 'admin', '2024-02-25 22:49:49');
INSERT INTO `edu_school` VALUES (2, '西北大学2', '/dev-api/profile/avatar/2024/02/25/西北大学2_20240225203616A002.jpg', '简介', '000000', '西北大学', '000000', '0', 'admin', '2024-02-25 20:36:16', 'admin', '2024-02-25 22:49:52');

-- ----------------------------
-- Table structure for edu_wish
-- ----------------------------
DROP TABLE IF EXISTS `edu_wish`;
CREATE TABLE `edu_wish`  (
  `wish_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wish_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wish_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wish_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wisher_school_id` bigint(20) NULL DEFAULT NULL,
  `wisher_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `claimant_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `claimFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为未认领，1为已认领',
  `create_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`wish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_wish
-- ----------------------------
INSERT INTO `edu_wish` VALUES (1, '《草房子》图书一本', '《草房子》图书一本', '/dev-api/profile/avatar/2024/02/25/草房子_20240225233207A001.jpeg', 1, '同学A', NULL, '0', 'admin', '2024-02-25 23:32:07', NULL, NULL);
INSERT INTO `edu_wish` VALUES (2, '得力水彩笔一套', '得力水彩笔一套', '/dev-api/profile/avatar/2024/02/25/得力水彩笔_20240225233235A002.jpeg', 2, '同学B', '认领人A', '1', 'admin', '2024-02-25 23:32:35', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-11-20 17:22:39', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-11-20 17:22:39', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-11-20 17:22:39', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-11-20 17:22:39', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-11-20 17:22:39', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-11-20 17:22:39', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '电子音频', '1', 'edu_resource_type', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:16:21', 'admin', '2024-02-20 13:34:23', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '电子教材', '2', 'edu_resource_type', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:16:44', 'admin', '2024-02-20 13:34:20', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, '电子课件', '3', 'edu_resource_type', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:17:13', 'admin', '2024-02-20 13:34:17', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 1, '一年级', '1', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:19:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 2, '二年级', '2', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:19:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 3, '三年级', '3', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 4, '四年级', '4', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:11', 'admin', '2024-02-20 13:20:24', NULL);
INSERT INTO `sys_dict_data` VALUES (37, 5, '五年级', '5', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 6, '六年级', '6', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 7, '初一', '7', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 8, '初二', '8', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 9, '初三', '9', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:20:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 10, '高一', '10', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:21:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 11, '高二', '11', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:21:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (44, 12, '高三', '12', 'edu_resource_grade', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:21:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 1, '语文', '1', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:22:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 2, '数学', '2', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:22:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (47, 3, '英语', '3', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:22:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 4, '物理', '4', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:22:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 5, '历史', '5', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:22:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 6, '化学', '6', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:23:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 7, '地理', '7', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:23:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (52, 8, '政治', '8', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:23:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (53, 9, '生物', '9', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:23:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (54, 10, '科学', '10', 'edu_resource_object', NULL, 'info', 'N', '0', 'admin', '2024-02-20 13:23:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (55, 0, '未分类', '0', 'edu_resource_grade', NULL, 'warning', 'N', '0', 'admin', '2024-02-20 13:34:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 0, '未分类', '0', 'edu_resource_type', NULL, 'warning', 'N', '0', 'admin', '2024-02-20 13:34:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 0, '未分类', '0', 'edu_resource_object', NULL, 'warning', 'N', '0', 'admin', '2024-02-20 13:34:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 1, '正常', '0', 'edu_resource_statu', NULL, 'primary', 'N', '0', 'admin', '2024-02-22 12:34:10', 'admin', '2024-02-22 12:36:24', NULL);
INSERT INTO `sys_dict_data` VALUES (59, 2, '失效', '1', 'edu_resource_statu', NULL, 'danger', 'N', '0', 'admin', '2024-02-22 12:34:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (60, 1, '未认领', '0', 'edu_wish_statu', NULL, 'primary', 'N', '0', 'admin', '2024-02-22 12:37:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 2, '已认领', '1', 'edu_wish_statu', NULL, 'success', 'N', '0', 'admin', '2024-02-22 12:37:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (62, 1, '待售', '0', 'edu_goods_statu', NULL, 'primary', 'N', '0', 'admin', '2024-02-23 17:58:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (63, 2, '售出', '1', 'edu_goods_statu', NULL, 'success', 'N', '0', 'admin', '2024-02-23 17:58:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (64, 1, '需求', '0', 'edu_post_statu', NULL, 'info', 'N', '0', 'admin', '2024-02-24 23:32:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (65, 2, '完成', '1', 'edu_post_statu', NULL, 'success', 'N', '0', 'admin', '2024-02-24 23:32:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (66, 1, '使用', '0', 'edu_advertisement_statu', NULL, 'primary', 'N', '0', 'admin', '2024-02-24 23:34:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (67, 2, '隐藏', '1', 'edu_advertisement_statu', NULL, 'danger', 'N', '0', 'admin', '2024-02-24 23:34:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '共享资源类型', 'edu_resource_type', '0', 'admin', '2024-02-20 13:15:30', '', NULL, '共享资源类型列表');
INSERT INTO `sys_dict_type` VALUES (12, '共享资源适用年级', 'edu_resource_grade', '0', 'admin', '2024-02-20 13:19:23', '', NULL, '共享资源适用年级列表');
INSERT INTO `sys_dict_type` VALUES (13, '共享资源适用学科', 'edu_resource_object', '0', 'admin', '2024-02-20 13:21:54', '', NULL, '共享资源适用学科列表');
INSERT INTO `sys_dict_type` VALUES (14, '共享资源状态', 'edu_resource_statu', '0', 'admin', '2024-02-22 12:33:49', '', NULL, '共享资源状态列表');
INSERT INTO `sys_dict_type` VALUES (15, '心愿认领状态', 'edu_wish_statu', '0', 'admin', '2024-02-22 12:37:11', '', NULL, '心愿认领状态列表');
INSERT INTO `sys_dict_type` VALUES (16, '商品出售状态', 'edu_goods_statu', '0', 'admin', '2024-02-23 17:57:51', '', NULL, '商品出售状态列表');
INSERT INTO `sys_dict_type` VALUES (17, '岗位招募状态', 'edu_post_statu', '0', 'admin', '2024-02-23 17:57:51', '', NULL, '岗位招募状态列表');
INSERT INTO `sys_dict_type` VALUES (18, '广告使用状态', 'edu_advertisement_statu', '0', 'admin', '2024-02-23 17:57:51', '', NULL, '广告使用状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-11-20 17:22:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-20 19:24:43');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-20 19:27:58');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-20 21:43:10');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2023-11-20 22:07:35');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-20 22:07:37');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-20 22:44:37');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-20 22:44:37');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-13 13:45:37');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-13 14:15:02');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-18 08:25:55');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-18 11:11:59');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-18 12:07:36');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-18 14:01:15');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-01-19 08:20:56');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 08:21:03');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 09:53:54');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 11:14:35');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 12:08:03');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 14:22:30');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 15:41:29');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 15:56:32');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '192.168.8.119', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-01-19 17:02:04');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '192.168.8.119', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 17:02:07');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 17:05:53');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '192.168.8.119', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-19 17:15:04');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-20 08:28:38');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.8.119', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-20 09:08:51');
INSERT INTO `sys_logininfor` VALUES (127, 'abc', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2024-01-22 11:55:18');
INSERT INTO `sys_logininfor` VALUES (128, 'abc', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2024-01-22 11:55:27');
INSERT INTO `sys_logininfor` VALUES (129, 'abc', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-22 11:55:27');
INSERT INTO `sys_logininfor` VALUES (130, 'abc', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-01-22 11:55:35');
INSERT INTO `sys_logininfor` VALUES (131, 'abc', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 11:55:39');
INSERT INTO `sys_logininfor` VALUES (132, 'abc', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-01-22 11:55:46');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 11:55:49');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 14:23:55');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 15:10:15');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 15:44:29');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-01-22 15:45:37');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 15:45:39');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 16:21:19');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-01-22 16:24:15');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-01-22 16:24:17');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-20 12:29:43');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-20 15:28:15');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-20 16:45:34');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-20 16:45:36');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-20 16:45:38');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-20 21:33:11');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-20 21:33:13');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-21 10:59:54');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-21 14:49:26');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-21 16:26:46');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-22 12:25:44');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-22 15:03:11');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-22 20:41:03');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-22 21:39:35');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2024-02-23 17:53:38');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-23 17:53:41');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '192.168.3.6', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-23 20:01:34');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-25 13:40:24');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-25 14:33:26');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '10.17.121.110', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-25 14:52:26');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '10.17.121.110', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-25 20:07:25');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-25 20:15:10');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-25 20:15:12');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-25 20:15:14');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-25 20:15:18');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2024-02-25 22:45:08');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-25 22:45:11');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 20:45:00');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 20:52:52');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 21:26:25');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 22:46:00');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-02-26 23:07:05');
INSERT INTO `sys_logininfor` VALUES (174, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 23:07:36');
INSERT INTO `sys_logininfor` VALUES (175, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-02-26 23:17:07');
INSERT INTO `sys_logininfor` VALUES (176, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 23:17:10');
INSERT INTO `sys_logininfor` VALUES (177, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-02-26 23:17:14');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 23:17:18');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-02-26 23:17:56');
INSERT INTO `sys_logininfor` VALUES (180, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 23:18:02');
INSERT INTO `sys_logininfor` VALUES (181, 'test', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2024-02-26 23:35:56');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-02-26 23:36:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4027 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '资源管理', 0, 1, 'edu', NULL, '', 1, 0, 'M', '0', '0', '', 'list', 'admin', '2023-11-20 17:22:39', '', NULL, '资源管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-11-20 17:22:39', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-11-20 17:22:39', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (4, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '1', '', 'tool', 'admin', '2023-11-20 17:22:39', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (101, '学校概况', 1, 1, 'school', 'edu/school/index', NULL, 1, 0, 'C', '0', '0', 'edu:school:list', 'education', 'admin', '2023-11-20 17:22:39', '', NULL, '学校概况菜单');
INSERT INTO `sys_menu` VALUES (102, '岗位需求', 1, 2, 'post', 'edu/post/index', NULL, 1, 0, 'C', '0', '0', 'edu:post:list', 'post', 'admin', '2023-11-20 17:22:39', '', NULL, '岗位需求菜单');
INSERT INTO `sys_menu` VALUES (103, '商品管理', 1, 3, 'goods', 'edu/goods/index', NULL, 1, 0, 'C', '0', '0', 'edu:goods:list', 'shopping', 'admin', '2023-11-20 17:22:39', '', NULL, '商品管理菜单');
INSERT INTO `sys_menu` VALUES (104, '教学资源', 1, 4, 'resource', 'edu/resource/index', NULL, 1, 0, 'C', '0', '0', 'edu:resource:list', 'documentation', 'admin', '2023-11-20 17:22:39', '', NULL, '资源信息菜单');
INSERT INTO `sys_menu` VALUES (105, '心愿管理', 1, 5, 'wish', 'edu/wish/index', NULL, 1, 0, 'C', '0', '0', 'edu:wish:list', 'star', 'admin', '2023-11-20 17:22:39', '', NULL, '心愿管理菜单');
INSERT INTO `sys_menu` VALUES (106, '广告管理', 1, 6, 'advertisement', 'edu/advertisement/index', NULL, 1, 0, 'C', '0', '0', 'edu:advertisement:list', 'excel', 'admin', '2023-11-20 17:22:39', '', NULL, '广告管理菜单');
INSERT INTO `sys_menu` VALUES (201, '用户管理', 2, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-20 17:22:39', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (202, '角色管理', 2, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-20 17:22:39', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (203, '菜单管理', 2, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-11-20 17:22:39', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (204, '字典管理', 2, 4, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-11-20 17:22:39', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (205, '参数设置', 2, 5, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2023-11-20 17:22:39', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (206, '通知公告', 2, 6, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-11-20 17:22:39', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (207, '日志管理', 2, 7, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-11-20 17:22:39', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (208, '操作日志', 207, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-11-20 17:22:39', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (209, '登录日志', 207, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-11-20 17:22:39', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (301, '在线用户', 3, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-20 17:22:39', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (302, '定时任务', 3, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-11-20 17:22:39', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (303, '数据监控', 3, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-11-20 17:22:39', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (304, '服务监控', 3, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-11-20 17:22:39', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (305, '缓存监控', 3, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-11-20 17:22:39', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (306, '缓存列表', 3, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-11-20 17:22:39', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (401, '表单构建', 4, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-20 17:22:39', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (402, '代码生成', 4, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-20 17:22:39', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (403, '系统接口', 4, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-11-20 17:22:39', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (1011, '学校查询', 101, 1, '#', '', '', 1, 0, 'F', '0', '0', 'edu:school:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '学校新增', 101, 2, '#', '', '', 1, 0, 'F', '0', '0', 'edu:school:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '学校修改', 101, 3, '#', '', '', 1, 0, 'F', '0', '0', 'edu:school:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '学校删除', 101, 4, '#', '', '', 1, 0, 'F', '0', '0', 'edu:school:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '学校导出', 101, 5, '#', '', '', 1, 0, 'F', '0', '0', 'edu:school:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 102, 1, '#', '', '', 1, 0, 'F', '0', '0', 'edu:post:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 102, 2, '#', '', '', 1, 0, 'F', '0', '0', 'edu:post:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 102, 3, '#', '', '', 1, 0, 'F', '0', '0', 'edu:post:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 102, 4, '#', '', '', 1, 0, 'F', '0', '0', 'edu:post:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 102, 5, '#', '', '', 1, 0, 'F', '0', '0', 'edu:post:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '商品查询', 103, 1, '#', '', '', 1, 0, 'F', '0', '0', 'edu:goods:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '商品新增', 103, 2, '#', '', '', 1, 0, 'F', '0', '0', 'edu:goods:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '商品修改', 103, 3, '#', '', '', 1, 0, 'F', '0', '0', 'edu:goods:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '商品删除', 103, 4, '#', '', '', 1, 0, 'F', '0', '0', 'edu:goods:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '商品导出', 103, 5, '#', '', '', 1, 0, 'F', '0', '0', 'edu:goods:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '资源查询', 104, 1, '#', '', '', 1, 0, 'F', '0', '0', 'edu:resource:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '资源新增', 104, 2, '#', '', '', 1, 0, 'F', '0', '0', 'edu:resource:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '资源修改', 104, 3, '#', '', '', 1, 0, 'F', '0', '0', 'edu:resource:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '资源删除', 104, 4, '#', '', '', 1, 0, 'F', '0', '0', 'edu:resource:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '资源导出', 104, 5, '#', '', '', 1, 0, 'F', '0', '0', 'edu:resource:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '心愿查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'edu:wish:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '心愿新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'edu:wish:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '心愿修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'edu:wish:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '心愿删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'edu:wish:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '心愿导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'edu:wish:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '广告查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'edu:advertisment:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '广告新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'edu:advertisment:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '广告修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'edu:advertisment:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '广告删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'edu:advertisment:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '广告导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'edu:advertisment:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '用户查询', 201, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '用户新增', 201, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '用户修改', 201, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '用户删除', 201, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '用户导出', 201, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '用户导入', 201, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '重置密码', 201, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '角色查询', 202, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '角色新增', 202, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '角色修改', 202, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '角色删除', 202, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '角色导出', 202, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '菜单查询', 203, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '菜单新增', 203, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '菜单修改', 203, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '菜单删除', 203, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '字典查询', 204, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '字典新增', 204, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '字典修改', 204, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '字典删除', 204, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '字典导出', 204, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '参数查询', 205, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '参数新增', 205, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '参数修改', 205, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '参数删除', 205, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '参数导出', 205, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '公告查询', 206, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '公告新增', 206, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '公告修改', 206, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '公告删除', 206, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '操作查询', 208, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '操作删除', 208, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '日志导出', 208, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '登录查询', 209, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '登录删除', 209, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '日志导出', 209, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '账户解锁', 209, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3011, '在线查询', 301, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3012, '批量强退', 301, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3013, '单条强退', 301, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3021, '任务查询', 302, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3022, '任务新增', 302, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3033, '任务修改', 302, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3034, '任务删除', 302, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3035, '状态修改', 302, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3036, '任务导出', 302, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4021, '生成查询', 402, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4022, '生成修改', 402, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4023, '生成删除', 402, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4024, '导入代码', 402, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4025, '预览代码', 402, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4026, '生成代码', 402, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-20 17:22:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, '0', '0', 'admin', '2023-11-20 17:22:39', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '测试员', 'test', 2, '2', 1, '0', '0', 'admin', '2023-11-20 17:22:39', 'admin', '2024-02-26 23:17:53', '测试员');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '00', '', '15888888888', '1', '/profile/avatar/2024/02/26/blob_20240226224613A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-02-26 23:36:05', 'admin', '2023-11-20 17:22:39', '', '2024-02-26 23:36:05', '管理员');
INSERT INTO `sys_user` VALUES (2, 'test', '测试员', '00', '', '15666666666', '1', '/profile/avatar/2024/02/26/blob_20240226230818A003.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-02-26 23:18:03', 'admin', '2023-11-20 17:22:39', 'admin', '2024-02-26 23:18:02', '测试员');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;

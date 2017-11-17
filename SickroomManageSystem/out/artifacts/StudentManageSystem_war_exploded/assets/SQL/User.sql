/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : orcl
Source Server Version : 110200
Source Host           : 127.0.0.1:1521
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2017-10-31 19:43:11
*/


-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE "SCOTT"."User";
CREATE TABLE "SCOTT"."User" (
"username" NVARCHAR2(255) NOT NULL ,
"password" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO "SCOTT"."User" VALUES ('admin', '123456');

-- ----------------------------
-- Indexes structure for table User
-- ----------------------------

-- ----------------------------
-- Checks structure for table User
-- ----------------------------
ALTER TABLE "SCOTT"."User" ADD CHECK ("username" IS NOT NULL);
ALTER TABLE "SCOTT"."User" ADD CHECK ("password" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE "SCOTT"."User" ADD PRIMARY KEY ("username");

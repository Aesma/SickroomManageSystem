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

Date: 2017-10-31 19:42:57
*/


-- ----------------------------
-- Table structure for SECTION
-- ----------------------------
DROP TABLE "SCOTT"."SECTION";
CREATE TABLE "SCOTT"."SECTION" (
"name" NVARCHAR2(20) NOT NULL ,
"dir" NVARCHAR2(20) NULL ,
"address" NVARCHAR2(40) NULL ,
"tel" NUMBER(20) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SECTION
-- ----------------------------
INSERT INTO "SCOTT"."SECTION" VALUES ('外科', 'dir1', 'add1', '5124');
INSERT INTO "SCOTT"."SECTION" VALUES ('内科', 'dir2', 'add2', '234');

-- ----------------------------
-- Indexes structure for table SECTION
-- ----------------------------

-- ----------------------------
-- Checks structure for table SECTION
-- ----------------------------
ALTER TABLE "SCOTT"."SECTION" ADD CHECK ("name" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SECTION
-- ----------------------------
ALTER TABLE "SCOTT"."SECTION" ADD PRIMARY KEY ("name");

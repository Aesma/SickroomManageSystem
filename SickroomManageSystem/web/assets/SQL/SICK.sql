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

Date: 2017-10-31 19:43:04
*/


-- ----------------------------
-- Table structure for SICK
-- ----------------------------
DROP TABLE "SCOTT"."SICK";
CREATE TABLE "SCOTT"."SICK" (
"name" NVARCHAR2(20) NOT NULL ,
"id" NUMBER NOT NULL ,
"age" NUMBER NULL ,
"sex" NVARCHAR2(2) NULL ,
"dia" NVARCHAR2(40) NULL ,
"doctor" NVARCHAR2(20) NULL ,
"section" NVARCHAR2(20) NULL ,
"room" NVARCHAR2(40) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SICK
-- ----------------------------
INSERT INTO "SCOTT"."SICK" VALUES ('per3', '3', '12', '男', '外科病', 'dir1', '外科', '11111');
INSERT INTO "SCOTT"."SICK" VALUES ('per1', '1', '22', '男', '外科病', 'dir1', '外科', '11112');
INSERT INTO "SCOTT"."SICK" VALUES ('per2', '2', '32', '女', '外科病', 'dir1', '外科', '11113');
INSERT INTO "SCOTT"."SICK" VALUES ('per4', '4', '23', '女', '内科病', 'dir2', '内科', '11201');
INSERT INTO "SCOTT"."SICK" VALUES ('per5', '5', '43', '男', '内科病', 'dir2', '内科', '11203');

-- ----------------------------
-- Indexes structure for table SICK
-- ----------------------------

-- ----------------------------
-- Checks structure for table SICK
-- ----------------------------
ALTER TABLE "SCOTT"."SICK" ADD CHECK ("name" IS NOT NULL);
ALTER TABLE "SCOTT"."SICK" ADD CHECK ("id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SICK
-- ----------------------------
ALTER TABLE "SCOTT"."SICK" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."SICK"
-- ----------------------------
ALTER TABLE "SCOTT"."SICK" ADD FOREIGN KEY ("section") REFERENCES "SCOTT"."SECTION" ("name") ON DELETE CASCADE;
ALTER TABLE "SCOTT"."SICK" ADD FOREIGN KEY ("room") REFERENCES "SCOTT"."ROOM" ("id") ON DELETE CASCADE;
ALTER TABLE "SCOTT"."SICK" ADD FOREIGN KEY ("doctor") REFERENCES "SCOTT"."NURSE" ("name") ON DELETE CASCADE;

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

Date: 2017-10-31 19:41:58
*/


-- ----------------------------
-- Table structure for NURSE
-- ----------------------------
DROP TABLE "SCOTT"."NURSE";
CREATE TABLE "SCOTT"."NURSE" (
"name" NVARCHAR2(20) NOT NULL ,
"title" NVARCHAR2(20) NULL ,
"section" NVARCHAR2(20) NULL ,
"age" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of NURSE
-- ----------------------------
INSERT INTO "SCOTT"."NURSE" VALUES ('nur1', '护士', '外科', '22');
INSERT INTO "SCOTT"."NURSE" VALUES ('nur2', '护师', '外科', '25');
INSERT INTO "SCOTT"."NURSE" VALUES ('nur3', '护士', '内科', '23');
INSERT INTO "SCOTT"."NURSE" VALUES ('nur4', '护士', '内科', '21');
INSERT INTO "SCOTT"."NURSE" VALUES ('nur5', '护师', '外科', '20');
INSERT INTO "SCOTT"."NURSE" VALUES ('dir1', '主任护师', '外科', '55');
INSERT INTO "SCOTT"."NURSE" VALUES ('dir2', '主任护师', '内科', '42');
INSERT INTO "SCOTT"."NURSE" VALUES ('doc7', '护师', '外科', '28');

-- ----------------------------
-- Indexes structure for table NURSE
-- ----------------------------

-- ----------------------------
-- Checks structure for table NURSE
-- ----------------------------
ALTER TABLE "SCOTT"."NURSE" ADD CHECK ("name" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table NURSE
-- ----------------------------
ALTER TABLE "SCOTT"."NURSE" ADD PRIMARY KEY ("name");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."NURSE"
-- ----------------------------
ALTER TABLE "SCOTT"."NURSE" ADD FOREIGN KEY ("section") REFERENCES "SCOTT"."SECTION" ("name") ON DELETE CASCADE;

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

Date: 2017-10-31 19:42:31
*/


-- ----------------------------
-- Table structure for ROOM
-- ----------------------------
DROP TABLE "SCOTT"."ROOM";
CREATE TABLE "SCOTT"."ROOM" (
"id" NVARCHAR2(40) NOT NULL ,
"number" NUMBER NULL ,
"section" NVARCHAR2(20) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ROOM
-- ----------------------------
INSERT INTO "SCOTT"."ROOM" VALUES ('11116', '6', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11401', '1', '内科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11302', '2', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11113', '6', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11112', '6', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11111', '6', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11301', '2', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11115', '6', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11201', '3', '内科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11202', '3', '内科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11114', '6', '外科');
INSERT INTO "SCOTT"."ROOM" VALUES ('11203', '3', '内科');

-- ----------------------------
-- Indexes structure for table ROOM
-- ----------------------------

-- ----------------------------
-- Triggers structure for table ROOM
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."ADDBEDTRI" BEFORE INSERT ON "SCOTT"."ROOM" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
DECLARE
	beds NUMBER;
	roomnumber NVARCHAR2(20);
	temp NUMBER;
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	SELECT COUNT(*) INTO temp 
	FROM ROOM 
	WHERE SUBSTR(:NEW."id",0,3)=SUBSTR(ROOM."id",0,3);
	IF temp!=0 THEN
		roomnumber:=SUBSTR(:NEW."id",0,3);
		SELECT "number" INTO beds
		FROM ROOM
		WHERE ROWNUM=1 AND roomnumber = SUBSTR(ROOM."id",0,3);
		beds:=beds+1;
		UPDATE ROOM SET "number"=beds WHERE roomnumber = SUBSTR(ROOM."id",0,3);
		:NEW."number":=beds;
		COMMIT;
	END IF;
    IF temp=0 THEN
        :NEW."number":=1;
    END IF;
END AddBedTri;
-- ----------------------------
-- Checks structure for table ROOM
-- ----------------------------
ALTER TABLE "SCOTT"."ROOM" ADD CHECK ("id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ROOM
-- ----------------------------
ALTER TABLE "SCOTT"."ROOM" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "SCOTT"."ROOM"
-- ----------------------------
ALTER TABLE "SCOTT"."ROOM" ADD FOREIGN KEY ("section") REFERENCES "SCOTT"."SECTION" ("name") ON DELETE CASCADE;

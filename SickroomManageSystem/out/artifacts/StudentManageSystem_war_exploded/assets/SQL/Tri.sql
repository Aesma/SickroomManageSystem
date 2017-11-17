create or replace TRIGGER AddBedTri
BEFORE INSERT
ON SCOTT.ROOM
FOR EACH ROW
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
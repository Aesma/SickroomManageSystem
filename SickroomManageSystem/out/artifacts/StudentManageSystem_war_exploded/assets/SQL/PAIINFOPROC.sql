CREATE OR REPLACE 
PROCEDURE PaitentInformation(sickname in SICK."name"%type, sickinfo OUT NVARCHAR2)
AS
	secname NVARCHAR2(20);
	roomid NVARCHAR2(20);
	telphone NUMBER;
	address NVARCHAR2(40);
	dir NVARCHAR2(20);
	CURSOR MYCUR2 IS
	SELECT "section","room","tel","address","dir"
	FROM MYVIEW
	WHERE sickname = MYVIEW."name";
BEGIN
	OPEN MYCUR2;
	FETCH MYCUR2 INTO secname,roomid,telphone,address,dir;
	LOOP
		SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(sickname,'-'),secname),'-'),roomid),'-'),telphone),'-'),address),'-'),dir),sickinfo) INTO sickinfo FROM dual;
		FETCH MYCUR2 INTO secname,roomid,telphone,address,dir;
		EXIT WHEN MYCUR2%NOTFOUND;
	END LOOP;
	CLOSE MYCUR2;
END;
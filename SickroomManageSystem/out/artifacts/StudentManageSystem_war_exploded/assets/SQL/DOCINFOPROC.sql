create or replace PROCEDURE DoctorInformation(doctor IN NURSE."name"%type, informaction OUT NVARCHAR2)
AS
	docname NVARCHAR2(20);
  section NVARCHAR2(20);
	doctitle NVARCHAR2(20);
	sickname NVARCHAR2(20);
  CURSOR MYCUR IS
	SELECT NURSE."name",NURSE."section",NURSE."title",SICK."name"
	FROM NURSE,SICK
	WHERE NURSE."name"=doctor AND SICK."doctor"=doctor;
BEGIN
  OPEN MYCUR;
	FETCH MYCUR INTO docname,section,doctitle,sickname;
	LOOP
		SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(docname,'-'), section),'-'), doctitle),'-'),sickname),'|'),informaction) INTO informaction FROM dual;
		FETCH MYCUR INTO docname,section,doctitle,sickname;
    EXIT WHEN MYCUR%NOTFOUND;
	END LOOP;
  CLOSE MYCUR;
END;
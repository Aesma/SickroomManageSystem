create or replace function getbednumber(inputroom nvarchar2)
return number  --这里只定义返回类型,而不能有精度
is
	num number;
	total number;
begin
	select count(*) into num from scott.SICK
	where SICK."room"=inputroom;
	SELECT ROOM."number" into total from SCOTT.ROOM
	where ROOM."id"=inputroom;
	return total-num;
end;
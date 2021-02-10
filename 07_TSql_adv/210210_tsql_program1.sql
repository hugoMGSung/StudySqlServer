declare @var1 int;  -- 변수선언
set @var1 = 100; -- 변수 값 대입

if @var1 = 100
begin
	print '@var1 100임';
end
else
begin
	print '@var1 100이 아님';
end
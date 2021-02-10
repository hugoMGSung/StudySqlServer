declare @i int, @hap bigint = 0; 
set @i = 1;

while (@i <= 100)
begin
	if (@i % 10 = 0)  -- 10의배수
	begin
		print concat('10의 배수, ', @i);
		set @i += 1;
		continue;
	end

	set @hap += @i;
	if (@hap > 1000) break;
	set @i += 1;
end

print @hap;
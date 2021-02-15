-- exec usp_users '김경호';
-- exec usp_users2 1980, 180;

declare @pout int;
exec usp_users4 '새로운 텍스트', @pout output;

print concat('현재 입력된 값은 ==> ', @pout);
select @pout as '현재값';



use sqlDB;
go

create or alter procedure plusNew
	@p1 int,  -- 입력 파라미터
	@p2 int,  -- 입력 파라미터
	@pout int output -- 출력(리턴) 파라미터
as
	select @pout = @p1 + @p2;
go

declare @newResult int;
set @newResult = 0;
exec plusNew 3, 4, @newResult output;
print concat('PlusNew(3, 4) = ', @newResult);


/*
C#에서는 아래와 같음
static void Main(string[] args)
{
    int newResult;
    plusNew(3, 4, out newResult);
    Console.WriteLine($"plusNew(3, 4) = {newResult}");
}

private static void plusNew(int p1, int p2, out int pout)
{
    pout = p1 + p2;
}
*/

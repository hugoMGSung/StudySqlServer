use sqlDB;
go

select RANK() over(partition by addr order by height desc) as 'Å°Å«¼øÀ§',
	   userName, addr, height 
  from userTBL;

-- PIVOT
/*
create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTBL values ('±è¹ü¼ö', '°Ü¿ï', 10),
							('À±Á¾½Å', '¿©¸§', 15),
							('±è¹ü¼ö', '°¡À»', 25),
							('±è¹ü¼ö', 'º½', 3),
							('±è¹ü¼ö', 'º½', 37),
							('À±Á¾½Å', '°Ü¿ï', 40),
							('±è¹ü¼ö', '¿©¸§', 14),
							('±è¹ü¼ö', '°Ü¿ï', 22),
							('À±Á¾½Å', '¿©¸§', 64);
go
*/

insert into pivotTBL values ('¼º½Ã°æ', '¿©¸§', 30);
select * from pivotTBL;

select * from pivotTBL
  pivot (sum(amount) 
         for season
		 in ([º½], [¿©¸§], [°¡À»], [°Ü¿ï])) as resultPivot;

-- json
select userID, userName, addr, height
  from userTBL
 where height >= 180
   for json auto;
-- testTBL insert
use sqlDB;
go

-- DML 중 SELECT
select * from testTBL1;

-- DML 중 INSERT
insert into testTBL1 values (1, '홍길동', 25);
insert into testTBL1 (id, userName) values (2, '성명건');
insert into testTBL1 values (3, '홍길순'); -- 에러
insert into testTBL1 (age, id) values (30, 4);
insert into testTBL1 (userName, age) values ('설현', 23); -- 에러

insert into testTBL1 values ('성시경', 44);

exec sp_help 'testTBL1';

-- 
select IDENT_CURRENT('testTBL1');

select @@IDENTITY;


select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl;

-- sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);

insert into sales_order_items
select * from BikeStores.sales.order_items;


select * from sales_order_items;

-- update
select * from testTBL1;

update testTBL1
   set userName = '성수경',
       age = 30
 where id = 6;

delete from testTBL1
 where id = 15; 


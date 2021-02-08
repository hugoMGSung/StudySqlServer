use sqlDB;
go

-- 이름이 김경호인 사람 조회
select * from userTBL
 where userName = '김경호';

 -- 1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
select userID, userName, height
  from userTBL
 where birthYear >= 1970
   and height >= 182;

-- 1970년 이후 출생이거나 키가 182이상이거나 인 사람들 모두
select userID, userName, height
  from userTBL
 where birthYear >= 1970
    or height >= 182;


-- 키가 180~183사이인 사람만 조회
select userID, userName, height
  from userTBL
 where height >= 180
   and height <= 183;
-- between ~ and
select userID, userName, height
  from userTBL
 where height between 180 and 183;

-- 지역이 경남, 전남, 경북
select userID, userName, addr
  from userTBL
 where addr = '경남'
    or addr = '전남'
	or addr = '경북';

select userID, userName, addr
  from userTBL
 where addr in ('경남', '전남', ' 경북');

-- like
select userID, userName, addr
  from userTBL
 where userName like '김%';

select userID, userName, addr
  from userTBL
 where userName like '_종신';

-- SUBQUERY
select userName, height 
  from userTBL
 where height > 177;

select userName, height 
  from userTBL
 where height > 
       ( select height from userTBL where userName = '김경호' );

select userName, height 
  from userTBL
 where height in
       ( select height from userTBL where addr = '경남' ); -- 170, 173


-- order by 정렬
select userName, mDate
  from userTBL
 order by mDate asc; -- asc(오름차순) desc(내림차순)

select *
  from userTBL
 order by userID desc;

-- distinct
select distinct addr
  from userTBL;

select top(5) *
  from userTBL
 order by mDate desc;

-- offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
  from userTBL
 order by birthYear
offset 4 rows;

-- 복사
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTBL;

-- GROUP BY
select * from buyTbl;

select userID, amount
  from buyTbl
 order by userID;

select userID, sum(prodName) as '합계'
  from buyTbl
 group by userID;

-- min, max
select min(height) as '작은키'
  from userTBL;

select max(height) as '큰키'
  from userTBL;

-- 
select userID, userName, min(height) as '작은키', max(height) as '큰키'
  from userTBL
 group by userID, userName;

select userID, userName, height
  from userTBL
 where height = (select min(height) from userTBL)
    or height = (select max(height) from userTBL)

-- 총 데이터 개수
select count(*) as '회원수' from userTBL; -- 10
select count(*) as '구매내역수' from buyTBL; -- 12
-- 1-1
select email, mobile, names, addr from membertbl
 order by names desc;

-- 1-2
select names, author, releaseDate, price from bookstbl;

-- 2-1
select top(10) 
	concat(right(names, 2), ', ', left(names, 1)) as '변경이름', 
	levels, 
	left(addr, 2) as '도시', 
	lower(email) as '이메일'
  from memberTBL;

 -- 2-2
select Idx
     , concat('제목 : ', Names) as Names
	 , concat('저자 > ', Author) as Author
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as '출판일'
	 , ISBN
	 , format(Price, '#,#원') as '가격'
  from bookstbl
 order by Idx desc;
 
 -- 3-1 문제
select b.idx as '번호'
     , b.division as '장르번호'
	 , d.Names as '장르'
	 , b.names as '책제목'
	 , b.author as '저자'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 where b.Division = 'B002';

-- 3-1 문제 다르게 푸는 방법1
select b.idx 번호
     , b.division '장르 번호'
	 , d.Names 장르
	 , b.names 책제목
	 , b.author 저자
  from bookstbl b
     , divtbl d
 where b.Division = d.Division
   and b.Division = 'B002';

-- 3-1 문제 다르게 푸는 방법2
select b.idx as '번호'
     , b.division as '장르번호'
	 --, d.Names as '장르'
	 , (select Names from divtbl where Division = b.Division) as 장르
	 , b.names as '책제목'
	 , b.author as '저자'
  from bookstbl as b
 where b.Division = 'B002';

-- 3-2 문제
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
  from membertbl as m
  left outer join rentaltbl as r
    on m.Idx = r.memberIdx
 where r.rentalDate is null;

-- 3-2 다르게 풀기
select m.Names
     , m.Levels
	 , m.Addr
	 , null as rentalDate
  from membertbl as m
 where m.Idx not in (select memberIdx from rentaltbl as r);

-- 4-1
select * from divTbl;
insert into divTbl values ('I002', '자기개발서');

-- 4-2
update membertbl 
   set Addr = '부산시 해운대구',
       mobile = '010-6683-7732'
 where Idx = 26;

-- 5
select d.names, sum(b.price) as '총합계금액'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 group by rollup(d.names);

-- 5번 다르게 풀기
select (select names from divtbl where Division = a.Division) as names
		, a.sum_price as '총합계금액'
	from  
			(select Division, sum(price) as sum_price
				from bookstbl
				group by Division) as a
union all
select null, sum(price)
 from booksTbl



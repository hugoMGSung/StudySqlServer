-- 1-1
select email, mobile, names, addr from membertbl
 order by names desc;

-- 1-2
select names, author, releaseDate, price from bookstbl;

-- 2-1
select top(10) 
	concat(right(names, 2), ', ', left(names, 1)) as '�����̸�', 
	levels, 
	left(addr, 2) as '����', 
	lower(email) as '�̸���'
  from memberTBL;

 -- 2-2
select Idx
     , concat('���� : ', Names) as Names
	 , concat('���� > ', Author) as Author
	 , format(ReleaseDate, 'yyyy�� MM�� dd��') as '������'
	 , ISBN
	 , format(Price, '#,#��') as '����'
  from bookstbl
 order by Idx desc;
 
 -- 3-1 ����
select b.idx as '��ȣ'
     , b.division as '�帣��ȣ'
	 , d.Names as '�帣'
	 , b.names as 'å����'
	 , b.author as '����'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 where b.Division = 'B002';

-- 3-1 ���� �ٸ��� Ǫ�� ���1
select b.idx ��ȣ
     , b.division '�帣 ��ȣ'
	 , d.Names �帣
	 , b.names å����
	 , b.author ����
  from bookstbl b
     , divtbl d
 where b.Division = d.Division
   and b.Division = 'B002';

-- 3-1 ���� �ٸ��� Ǫ�� ���2
select b.idx as '��ȣ'
     , b.division as '�帣��ȣ'
	 --, d.Names as '�帣'
	 , (select Names from divtbl where Division = b.Division) as �帣
	 , b.names as 'å����'
	 , b.author as '����'
  from bookstbl as b
 where b.Division = 'B002';

-- 3-2 ����
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
  from membertbl as m
  left outer join rentaltbl as r
    on m.Idx = r.memberIdx
 where r.rentalDate is null;

-- 3-2 �ٸ��� Ǯ��
select m.Names
     , m.Levels
	 , m.Addr
	 , null as rentalDate
  from membertbl as m
 where m.Idx not in (select memberIdx from rentaltbl as r);

-- 4-1
select * from divTbl;
insert into divTbl values ('I002', '�ڱⰳ�߼�');

-- 4-2
update membertbl 
   set Addr = '�λ�� �ؿ�뱸',
       mobile = '010-6683-7732'
 where Idx = 26;

-- 5
select d.names, sum(b.price) as '���հ�ݾ�'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 group by rollup(d.names);

-- 5�� �ٸ��� Ǯ��
select (select names from divtbl where Division = a.Division) as names
		, a.sum_price as '���հ�ݾ�'
	from  
			(select Division, sum(price) as sum_price
				from bookstbl
				group by Division) as a
union all
select null, sum(price)
 from booksTbl



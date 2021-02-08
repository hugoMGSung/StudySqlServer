use sqlDB;
go

-- �̸��� ���ȣ�� ��� ��ȸ
select * from userTBL
 where userName = '���ȣ';

 -- 1970�� ���� ����̰� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ
select userID, userName, height
  from userTBL
 where birthYear >= 1970
   and height >= 182;

-- 1970�� ���� ����̰ų� Ű�� 182�̻��̰ų� �� ����� ���
select userID, userName, height
  from userTBL
 where birthYear >= 1970
    or height >= 182;


-- Ű�� 180~183������ ����� ��ȸ
select userID, userName, height
  from userTBL
 where height >= 180
   and height <= 183;
-- between ~ and
select userID, userName, height
  from userTBL
 where height between 180 and 183;

-- ������ �泲, ����, ���
select userID, userName, addr
  from userTBL
 where addr = '�泲'
    or addr = '����'
	or addr = '���';

select userID, userName, addr
  from userTBL
 where addr in ('�泲', '����', ' ���');

-- like
select userID, userName, addr
  from userTBL
 where userName like '��%';

select userID, userName, addr
  from userTBL
 where userName like '_����';

-- SUBQUERY
select userName, height 
  from userTBL
 where height > 177;

select userName, height 
  from userTBL
 where height > 
       ( select height from userTBL where userName = '���ȣ' );

select userName, height 
  from userTBL
 where height in
       ( select height from userTBL where addr = '�泲' ); -- 170, 173


-- order by ����
select userName, mDate
  from userTBL
 order by mDate asc; -- asc(��������) desc(��������)

select *
  from userTBL
 order by userID desc;

-- distinct
select distinct addr
  from userTBL;

select top(5) *
  from userTBL
 order by mDate desc;

-- offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
  from userTBL
 order by birthYear
offset 4 rows;

-- ����
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTBL;

-- GROUP BY
select * from buyTbl;

select userID, amount
  from buyTbl
 order by userID;

select userID, sum(prodName) as '�հ�'
  from buyTbl
 group by userID;

-- min, max
select min(height) as '����Ű'
  from userTBL;

select max(height) as 'ūŰ'
  from userTBL;

-- 
select userID, userName, min(height) as '����Ű', max(height) as 'ūŰ'
  from userTBL
 group by userID, userName;

select userID, userName, height
  from userTBL
 where height = (select min(height) from userTBL)
    or height = (select max(height) from userTBL)

-- �� ������ ����
select count(*) as 'ȸ����' from userTBL; -- 10
select count(*) as '���ų�����' from buyTBL; -- 12
-- outer join ����
select r.rentalIdx
     --, r.memberIdx
	 , m.memberName
     --, r.bookIdx
	 --, b.cateIdx
	 , c.cateName
	 , b.bookName
	 , b.author
	 -- ����ó��
     , format(r.rentalDt, 'yyyy-MM-dd') as rentalDt
     , format(r.returnDt, 'yyyy-MM-dd') as returnDt
     , dbo.ufn_getState(r.rentalState) as '�뿩����'

  from rentalTBL as r
 right outer join memberTBL as m
    on r.memberIdx = m.memberIdx
  left outer join booksTBL as b
    on r.bookIdx = b.bookIdx
  left outer join cateTbl as c
    on c.cateIdx = b.cateIdx
 where r.rentalIdx is null;

-- ������ �Է�
insert into booksTBL
(
	cateIdx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
) 
values 
(
	'N0002',
	'�������� ���� ����',
	'��ȳ�',
	'������',
	'2019-10-02',
	'9791135445705',
	12500
);

-- å���̺� �� å ������, ����, ������� ����
begin tran; 

select * 
  from booksTBL;

update booksTBL
   set descriptions = '�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����.'
     , regDate = '2021-02-18'
 where bookIdx = 12;

rollback;
commit;

-- ī�װ� �Է�
begin tran;

insert into cateTBL /*(cateIdx, cateName)*/ values ('I0001', '��ȭ/����'),
												   ('I0002', '����/ó��'),
												   ('I0003', '�ð�����');

select * from cateTBL;

rollback;
commit;

delete from cateTBL where cateIdx = 'I0003';

delete from cateTBL where cateIdx in ('I0001', 'I0002');


create or alter view uv_nonerentalMember 
as
  select r.rentalIdx
     --, r.memberIdx
	 , m.memberName
     --, r.bookIdx
	 --, b.cateIdx
	 , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as rentalDt
     , format(r.returnDt, 'yyyy-MM-dd') as returnDt
     , dbo.ufn_getState(r.rentalState) as '대여상태'
  from rentalTBL as r
 right outer join memberTBL as m
    on r.memberIdx = m.memberIdx
  left outer join booksTBL as b
    on r.bookIdx = b.bookIdx
  left outer join cateTbl as c
    on c.cateIdx = b.cateIdx
 where r.rentalIdx is null;
go
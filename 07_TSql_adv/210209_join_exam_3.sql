
/*select * from stdTBL;
select * from clubTBL;
select * from clubRegTBL;
*/
-- Standard SQL
select s.id, s.stdName, c.clubName, c.buildingNum 
  from stdTbl as s
 inner join clubRegTBL as r
    on s.id = r.std_id
 inner join clubTbl as c
    on r.club_id = c.id;

-- inner join(내부 조인) 약식(SQL Server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum 
  from stdTbl as s, clubRegTBL as r, clubTbl as c
 where s.id = r.std_id
   and r.club_id = c.id;

-- outer join (외부 조인)
select s.id, s.stdName, c.clubName, c.buildingNum 
  from stdTbl as s
 left outer join clubRegTBL as r
    on s.id = r.std_id
 left outer join clubTbl as c
    on r.club_id = c.id;

-- userTBL / buyTBL
select u.userName, u.addr, b.prodName, b.price
  from userTBL as u
  right outer join buyTBL as b
    on u.userID = b.userID;

select * from buyTbl

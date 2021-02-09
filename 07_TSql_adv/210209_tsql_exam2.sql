-- Union
select clubName as bName, buildingNum as bLocation from clubtbl
union
select stdName, region from stdtbl;

-- union all
select stdName, region from stdtbl
intersect -- union all
select stdName, region from stdtbl;
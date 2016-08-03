select * from FOO;

select * from BAR;

select * from BAR UNION all select * from FOO;

select * from BAR B left join FOO F ON B.BAR_NAME = F.FOO_NAME;

select * from BAR B right join FOO F ON B.BAR_NAME = F.FOO_NAME;

-- BELOW QUERY WON'T WORK IN MYSQL AS FULL OUTER JOIN IS NOT SUPPORTED
select * from BAR B full outer join FOO F on B.BAR_NAME = F.FOO_NAME;

-- SAME ABOVE QUERY CAN BE WRITTEN as
select * from BAR B left join FOO F ON B.BAR_NAME = F.FOO_NAME
union
select * from BAR B right join FOO F ON B.BAR_NAME = F.FOO_NAME;
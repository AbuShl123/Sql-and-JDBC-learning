/*
 union
 - removes duplicates
 - sorts values
 */

select * from DEVELOPERS
union -- (if rows are matching then removes them)
select * from TESTERS;

select NAMES from DEVELOPERS
union
select NAMES from TESTERS;

select NAMES from DEVELOPERS
union
select NAMES from TESTERS
order by 1 desc;

/*
 union all
 - doesn't remove duplicates
 - doesn't sort values
 */

select * from DEVELOPERS
union all
select * from TESTERS;

select NAMES from DEVELOPERS
union all
select NAMES from TESTERS;

select NAMES from DEVELOPERS
union all
select NAMES from TESTERS
order by 1 desc;

/*
 minus
 - gives unique results from  first table
 */

select * from DEVELOPERS
minus
select * from TESTERS;

select NAMES from DEVELOPERS
minus
select NAMES from TESTERS;

select NAMES from TESTERS
minus
select NAMES from DEVELOPERS;

select NAMES from TESTERS
minus
select NAMES from DEVELOPERS
order by 1 desc;


/*
 intersect
 */

select * from DEVELOPERS
intersect
select * from TESTERS;

select NAMES from DEVELOPERS
intersect
select NAMES from TESTERS;


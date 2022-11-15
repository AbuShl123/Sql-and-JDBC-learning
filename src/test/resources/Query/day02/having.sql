select * from JOBS;

select JOB_ID, avg(SALARY)
from EMPLOYEES
group by JOB_ID
HAVING avg(SALARY)<6000
order by 2 desc;

select DEPARTMENT_ID, count(*)
from EMPLOYEES
group by DEPARTMENT_ID
having count(*)>5;

select FIRST_NAME, count(*) as FIRST_NAME_COUNT
from EMPLOYEES
group by FIRST_NAME
having count(*)>1
order by 2 desc;

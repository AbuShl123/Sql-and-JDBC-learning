select JOB_ID, avg(salary), min(salary), max(SALARY), sum(SALARY)
from EMPLOYEES
group by JOB_ID;

select JOB_ID, max(SALARY)
from EMPLOYEES group by JOB_ID;

select MANAGER_ID, round(avg(SALARY))
from EMPLOYEES group by MANAGER_ID;

select DEPARTMENT_ID, sum(SALARY), count(*), max(SALARY), min(SALARY), round(avg(SALARY))
from EMPLOYEES
group by DEPARTMENT_ID
order by max(SALARY);

select DEPARTMENT_ID, sum(SALARY), count(*), max(SALARY), min(SALARY), round(avg(SALARY))
from EMPLOYEES
group by DEPARTMENT_ID
order by min(SALARY) desc;

select DEPARTMENT_ID, sum(SALARY), count(*), max(SALARY), min(SALARY), round(avg(SALARY))
from EMPLOYEES
group by DEPARTMENT_ID
order by max(SALARY), min(SALARY) desc;

select *
from DEPARTMENTS;

select LOCATION_ID, CITY
from LOCATIONS;

select LOCATION_ID, count(*), CITY
from DEPARTMENTS join LOCATIONS using (LOCATION_ID)
group by LOCATION_ID, CITY
order by 2 desc;
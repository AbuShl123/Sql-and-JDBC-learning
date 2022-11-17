select *
from Employees;

select MANAGER_ID, count(*)
from EMPLOYEES
where MANAGER_ID IS NOT NULL
group by MANAGER_ID;



select COUNTRY_ID, count(*)
from LOCATIONS
group by COUNTRY_ID;

select *
from EMPLOYEES;

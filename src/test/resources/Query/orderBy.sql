select * from EMPLOYEES;

select *
from EMPLOYEES order by SALARY; -- orders by salary in ascending order

select * from EMPLOYEES
order by SALARY desc; -- orders by salary in descending order

select * from EMPLOYEES
order by FIRST_NAME; -- orders by first char of first_name from a-z

select * from EMPLOYEES
order by 2 desc; -- orders by first char of first_name from z-a

select * from EMPLOYEES
where EMPLOYEE_ID<120
ORDER BY SALARY desc;

select *
from EMPLOYEES
order by FIRST_NAME, LAST_NAME desc;
/*
 it will first order results based on firstname after getting result
 if we have same names it will order them based on lastname descending order
 */
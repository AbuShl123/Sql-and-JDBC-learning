select * from employees;

/*
 * which keyword we're using in java to filter?
 * if statements
 */

 -- to filter results while running query we're gonna use 'where' keyword

select *
from EMPLOYEES
where FIRST_NAME='David' or FIRST_NAME='Peter' and JOB_ID='SA_REP'; -- wow!


select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where FIRST_NAME='David';

select FIRST_NAME, LAST_NAME, SALARY, JOB_ID
from EMPLOYEES
where FIRST_NAME='David' or FIRST_NAME='Peter' and JOB_ID='SA_REP';

select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES where FIRST_NAME='David' and LAST_NAME='Austin';

select *
from EMPLOYEES where SALARY<7000;

select FIRST_NAME, EMAIL
from EMPLOYEES where SALARY<6000;

select FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, JOB_ID, DEPARTMENT_ID
from EMPLOYEES where SALARY>6000 and DEPARTMENT_ID = 60;

select *
from DEPARTMENTS where DEPARTMENT_ID=60;

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOB_ID
from EMPLOYEES where SALARY>=3000 and SALARY<=7000;
-- the query above and below are showing the same result
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOB_ID
from EMPLOYEES
where SALARY between 3000 and 7000;

select *
from EMPLOYEES
where EMPLOYEE_ID between 100 and 120; -- the range is inclusive

select *
from EMPLOYEES where JOB_ID='IT_PROG' or JOB_ID='MK_MAN';

select *
from EMPLOYEES where EMPLOYEE_ID=121 or EMPLOYEE_ID=143 or EMPLOYEE_ID=156 or EMPLOYEE_ID=134;

select *
from EMPLOYEES where EMPLOYEE_ID in (121, 134, 143, 156);

select *
from COUNTRIES where COUNTRY_ID in ('US', 'IT');

select *
from COUNTRIES where COUNTRY_ID not in ('US', 'IT');

select *
from EMPLOYEES where DEPARTMENT_ID IS NULL;

select *
from EMPLOYEES where MANAGER_ID IS NULL;

select *
from EMPLOYEES where DEPARTMENT_ID IS not NULL;

select *
from EMPLOYEES where MANAGER_ID IS not NULL;

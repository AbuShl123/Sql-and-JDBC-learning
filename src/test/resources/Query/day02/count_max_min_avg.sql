select count(*)
from COUNTRIES;

select count(DEPARTMENT_ID)
from EMPLOYEES
where DEPARTMENT_ID IS NULL;

select *
from EMPLOYEES
where DEPARTMENT_ID is null;

select count(distinct FIRST_NAME)
from EMPLOYEES;

select count(*)
from EMPLOYEES
where JOB_ID in ('IT_RPOG', 'SA_REP');

select count(*)
from EMPLOYEES
where SALARY>6000;

select avg(SALARY)
from EMPLOYEES;

select round(avg(SALARY), 0)
from EMPLOYEES;

select sum(SALARY)
from EMPLOYEES;

select round(avg(SALARY), 2)
from EMPLOYEES where JOB_ID = 'IT_PROG';

select count(distinct JOB_ID)
from EMPLOYEES;
select *
from employees;

select FIRST_NAME as GIVEN_NAME
from EMPLOYEES;

select FIRST_NAME as "GIVEN NAME"
from EMPLOYEES;

select FIRST_NAME, SALARY*12 as "ANNUAL SALARY"
from EMPLOYEES;

select FIRST_NAME||EMPLOYEES.LAST_NAME as FULL_NAME
from EMPLOYEES;

select EMPLOYEES.EMAIL||'@mail.com' as FULL_EMAIL
from EMPLOYEES;

select concat(EMAIL, '@mail.com') as "FULL EMAIL"
from EMPLOYEES;


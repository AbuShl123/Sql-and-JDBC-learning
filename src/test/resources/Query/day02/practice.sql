select *
from JOBS
where JOB_TITLE like '%Manager';

select *
from COUNTRIES
where REGION_ID=1 and COUNTRY_NAME!='Belgium';

select *
from EMPLOYEES
where FIRST_NAME like 'D%';

select *
from EMPLOYEES
where FIRST_NAME like 'D____'
ORDER BY LAST_NAME desc;


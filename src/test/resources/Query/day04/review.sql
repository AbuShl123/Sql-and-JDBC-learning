select *
from EMPLOYEES;

select distinct SALARY
from EMPLOYEES
ORDER BY SALARY desc;

select *
from (
    select distinct SALARY
    from EMPLOYEES
    ORDER BY SALARY desc
    )
where ROWNUM < 4;



select *
from EMPLOYEES
where SALARY = (
    select min(SALARY) from (
        select distinct SALARY
        from EMPLOYEES
        ORDER BY SALARY desc
        )
    where ROWNUM < 4
);


select *
from (
     select distinct SALARY
     from EMPLOYEES
     order by SALARY
         )
where rownum <= 3;


select *
from EMPLOYEES
where SALARY = (
    select max(SALARY)
    from (
             select distinct SALARY
             from EMPLOYEES
             order by SALARY
         )
    where rownum < 4
);

select *
from DEPARTMENTS;
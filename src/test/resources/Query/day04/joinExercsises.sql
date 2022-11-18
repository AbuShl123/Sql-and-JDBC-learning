--1. Display all first_name and department_name
--2.Display all first_name and department_name including the  department without employee
--3.Display all first_name and department_name including the  employee without department
--4.Display all first_name and department_name
--including the  department without employee  and  employees  without departments
--5.Display All cities and related country names
--6.Display All cities and related country names  including with countries without city
--7.Display all department name and  street address
--8.Display first_name,last_name and department_name,city for all employees
--9.Display first_name,last_name and department_name,city,country_
-- name for all employees

--1. Display all first_name and department_name
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E inner join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--2.Display all first_name and department_name including the  department without employee
select DEPARTMENT_NAME, FIRST_NAME
from EMPLOYEES E right outer join DEPARTMENTS D
 on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--3.Display all first_name and department_name including the  employee without department
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E left outer join DEPARTMENTS D
 on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--4.Display all first_name and department_name
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E full outer join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--5.Display All cities and related country names
select CITY, COUNTRY_NAME
from LOCATIONS L inner join COUNTRIES C
on L.COUNTRY_ID=C.COUNTRY_ID;

--6.Display All cities and related country names including with countries without city
select COUNTRY_NAME, CITY
from COUNTRIES C left outer join LOCATIONS L
on C.COUNTRY_ID = L.COUNTRY_ID;

--7.Display all department name and street address
select DEPARTMENT_NAME, STREET_ADDRESS
from DEPARTMENTS D left outer join LOCATIONS L
on D.LOCATION_ID = L.LOCATION_ID;

--8.Display first_name,last_name and department_name,city for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY
from EMPLOYEES E left join (select DEPARTMENT_ID, DEPARTMENT_NAME, CITY
                             from DEPARTMENTS D full join LOCATIONS L
                             on D.LOCATION_ID = L.LOCATION_ID) D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- another human and normal solution
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY from EMPLOYEES E
    left join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID
    inner join LOCATIONS L
on D.LOCATION_ID=L.LOCATION_ID;


--9.Display first_name,last_name and department_name,city,country
select * from LOCATIONS;

select * from DEPARTMENTS;

select LOCATION_ID, CITY, COUNTRY_NAME
from LOCATIONS L left join COUNTRIES C
on L.COUNTRY_ID = C.COUNTRY_ID;

select DEPARTMENT_ID, DEPARTMENT_NAME, CITY, COUNTRY_NAME
from DEPARTMENTS D left join (select LOCATION_ID, CITY, COUNTRY_NAME
                              from LOCATIONS L left join COUNTRIES C
                             on L.COUNTRY_ID = C.COUNTRY_ID) L
on D.LOCATION_ID=L.LOCATION_ID;

--9.Display first_name,last_name and department_name,city,country
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY, COUNTRY_NAME
from EMPLOYEES E left join (select DEPARTMENT_ID, DEPARTMENT_NAME, CITY, COUNTRY_NAME
                            from DEPARTMENTS D left join (select LOCATION_ID, CITY, COUNTRY_NAME
                                                          from LOCATIONS L left join COUNTRIES C
                                                         on L.COUNTRY_ID = C.COUNTRY_ID) L
                            on D.LOCATION_ID=L.LOCATION_ID) L
on E.DEPARTMENT_ID=L.DEPARTMENT_ID;


-- now normal and human solution:
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY, COUNTRY_NAME from EMPLOYEES E
    left join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID
    left join LOCATIONS L
on D.LOCATION_ID = L.LOCATION_ID
    left join COUNTRIES C
on L.COUNTRY_ID = C.COUNTRY_ID;


-- this is a fking brain time!

-- show first_name, last_name, job_title, salary, start_date for all employees
select * from JOB_HISTORY;

select FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY
from EMPLOYEES E left join JOBS J
on E.JOB_ID = J.JOB_ID;

select E.EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOB_TITLE, START_DATE
from (select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY
      from EMPLOYEES E left join JOBS J
     on E.JOB_ID = J.JOB_ID) E left join JOB_HISTORY H
on E.EMPLOYEE_ID=H.EMPLOYEE_ID
order by E.EMPLOYEE_ID;

-- show employees id, first_name, last_name, job_title, salary, department_name, city, country, region_name

-- 1) merging countries and region name
select COUNTRY_ID, COUNTRY_NAME, REGION_NAME
from COUNTRIES C join REGIONS R
on C.REGION_ID=R.REGION_ID;


-- 2) merging city with country and region name
select LOCATION_ID, CITY, COUNTRY_NAME, REGION_NAME
from LOCATIONS L left join (select COUNTRY_ID, COUNTRY_NAME, REGION_NAME
                          from COUNTRIES C join REGIONS R
                          on C.REGION_ID=R.REGION_ID) RC
on L.COUNTRY_ID=RC.COUNTRY_ID;


-- 3) merging employee info with job_title
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY
from EMPLOYEES E left join JOBS J
on E.JOB_ID=J.JOB_ID;

-- 3) merging employee info with job_title and department name
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_NAME
from DEPARTMENTS D right join (select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_ID
                             from EMPLOYEES E left join JOBS J
                            on E.JOB_ID=J.JOB_ID) EJ
on D.DEPARTMENT_ID=EJ.DEPARTMENT_ID;

-- 4) finally, we solve the main problem: merging 2)table on line 104 and 3)table on line 117
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
from (select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_NAME, LOCATION_ID
      from DEPARTMENTS D right join (select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_ID
                                     from EMPLOYEES E left join JOBS J
                                    on E.JOB_ID=J.JOB_ID) EJ
      on D.DEPARTMENT_ID=EJ.DEPARTMENT_ID) employee_info left join (select LOCATION_ID, CITY, COUNTRY_NAME, REGION_NAME
                                                                    from LOCATIONS L left join (select COUNTRY_ID, COUNTRY_NAME, REGION_NAME
                                                                                                from COUNTRIES C join REGIONS R
                                                                                                on C.REGION_ID=R.REGION_ID) RC
                                                                    on L.COUNTRY_ID=RC.COUNTRY_ID) employee_address
on employee_info.LOCATION_ID=employee_address.LOCATION_ID;

-- well, now we try to do in normal non-crazy way
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, SALARY, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
FROM EMPLOYEES E
    left join JOBS J
on E.JOB_ID = J.JOB_ID
    left join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID
    left join LOCATIONS L
on D.LOCATION_ID = L.LOCATION_ID
    left join COUNTRIES C
on L.COUNTRY_ID = C.COUNTRY_ID
    left join REGIONS R
on C.REGION_ID = R.REGION_ID;


select * from EMPLOYEES
where EMPLOYEE_ID=178; -- this is a very secret employee

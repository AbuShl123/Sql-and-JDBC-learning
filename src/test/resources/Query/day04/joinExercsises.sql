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

--6.Display All cities and related country names  including with countries without city
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


-- this is a fking brain time!

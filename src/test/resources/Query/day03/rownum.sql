select * from employees;

select * from EMPLOYEES
where ROWNUM<11;

-- display all info from employees who is getting5 highest salary
-- BAD PRACTICE
-- it is getting sata before order them based salary and
-- cut the from list line 6 then it tries to order them between first 5 rows
-- that is why we are getting wrong list

select * from EMPLOYEES
where ROWNUM<6
order by salary desc;

-- CORRECT ANSWER
select * from (select * from EMPLOYEES order by salary desc)
where ROWNUM<7;

-- display all info who is getting 5th highest salary
-- display 5th highest salary
select min(SALARY) from (select distinct salary from EMPLOYEES order by SALARY desc)
where ROWNUM<6;

--display who is getting 5th highest salary
select * from EMPLOYEES
where SALARY = (select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc)where rownum<6);

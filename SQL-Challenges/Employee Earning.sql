/*
-------------------------------------------------
-- Earning of Employees

We define an employee's total earnings to be their monthly SALARY * MONTHS worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

Sample Input:
Given Below as a script

Sample Output:
69952 1

*/

-- Create Table Script

CREATE TABLE employee 
(
employee_id NUMBER,
NAME VARCHAR2(100),
MONTHS NUMBER,
salary NUMBER
);


-- Input Insert Script
insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('12228', 'Rosa', '15', '1968');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('33645', 'Angela', '1', '3443');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('456992', 'Frank', '17', '1608');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('59725', 'Lisa', '11', '2330');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('74197', 'Kimberly', '16', '4372');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('78454', 'Bonnie', '8', '1771');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('83565', 'Michale', '6', '2017');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('98607', 'Todd', '5', '3396');

insert into employee (EMPLOYEE_ID, NAME, MONTHS, SALARY)
values ('99989', 'Joe', '9', '3573');


-- Solution:
 
SELECT (MAX(src.Earning) || ' ' || COUNT(src.employee_id)) AS res
  FROM (SELECT e.employee_id,
               e.name,
               e.months,
               e.salary,
               (e.months * e.salary) AS Earning
          FROM employee e) src
 WHERE src.earning =
       (SELECT MAX(emp.months * emp.salary) FROM employee emp);

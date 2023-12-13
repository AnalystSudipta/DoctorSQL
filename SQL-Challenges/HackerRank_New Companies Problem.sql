/*
--------------------
-- New Companies
--------------------

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this
hierarchy:

Founder -> Lead Manager -> Senior Manager -> Manager -> Employee

Given the table schemas below, write a query to print the company_code, founder name, total number of
lead managers, total number of senior managers, total number of managers, and total number of
employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the
company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and
C_2.


Input Format:
The following tables contain company data:

Company: The company_code is the code of the company and founder is the founder of the
company.

Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is
the code of the working company.

Senior_Manager: The senior_manager_code is the code of the senior manager, the
lead_manager_code is the code of its lead manager, and the company_code is the code of the
working company.

Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its
senior manager, the lead_manager_code is the code of its lead manager, and the company_code is
the code of the working company.

Employee: The employee_code is the code of the employee, the manager_code is the code of its
manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the
code of its lead manager, and the company_code is the code of the working company.

Sample Input:
 Given below as script

Sample Output:

C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2


Explanation:

In company C1, the only lead manager is LM1. There are two senior managers, SM1 and SM2, under
LM1. There is one manager, M1, under senior manager SM1. There are two employees, E1 and E2, under
manager M1.
In company C2, the only lead manager is LM2. There is one senior manager, SM3, under LM2. There are
two managers, M2 and M3, under senior manager SM3. There is one employee, E3, under manager M2,
and another employee, E4, under manager, M3. 

*/

-- Create Table Scripts

CREATE TABLE company 
(
company_code VARCHAR2(10),
founder VARCHAR2(100)
);

 
CREATE TABLE lead_manager
(
lead_manager_code VARCHAR2(10),
company_code VARCHAR2(10)
);


CREATE TABLE senior_manager
(
senior_manager_code VARCHAR2(10),
lead_manager_code VARCHAR2(10),
company_code VARCHAR2(10)
);

CREATE TABLE manager
(
manager_code VARCHAR2(10),
senior_manager_code VARCHAR2(10),
lead_manager_code VARCHAR2(10),
company_code VARCHAR2(10)
);

CREATE TABLE employee
(
employee_code VARCHAR2(10),
manager_code VARCHAR2(10),
senior_manager_code VARCHAR2(10),
lead_manager_code VARCHAR2(10),
company_code VARCHAR2(10)
);


SELECT * FROM employee;

-- Company sample input

insert into company (COMPANY_CODE, FOUNDER)
values ('C1', 'MONIKA');

insert into company (COMPANY_CODE, FOUNDER)
values ('C2', 'SAMANTHA');


-- Lead Manager sample input
insert into lead_manager (LEAD_MANAGER_CODE, COMPANY_CODE)
values ('LM1', 'C1');

insert into lead_manager (LEAD_MANAGER_CODE, COMPANY_CODE)
values ('LM2', 'C2');

-- Senior Manager sample input

insert into senior_manager (SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('SM1', 'LM1', 'C1');

insert into senior_manager (SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('SM2', 'LM1', 'C1');

insert into senior_manager (SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('SM3', 'LM2', 'C2');



-- Manager sample input 

insert into employee (EMPLOYEE_CODE, MANAGER_CODE, SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('E1', 'M1', 'SM1', 'LM1', 'C1');

insert into employee (EMPLOYEE_CODE, MANAGER_CODE, SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('E2', 'M1', 'SM1', 'LM1', 'C1');

insert into employee (EMPLOYEE_CODE, MANAGER_CODE, SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('E3', 'M2', 'SM3', 'LM2', 'C2');

insert into employee (EMPLOYEE_CODE, MANAGER_CODE, SENIOR_MANAGER_CODE, LEAD_MANAGER_CODE, COMPANY_CODE)
values ('E4', 'M3', 'SM3', 'LM2', 'C2');



-------------
-- Solution
-------------

SELECT E.COMPANY_CODE,
       C.FOUNDER,
       COUNT(DISTINCT(E.LEAD_MANAGER_CODE)) AS L_MAN_COUNT,
       COUNT(DISTINCT(S.SENIOR_MANAGER_CODE)) AS S_MAN_COUNT,
       COUNT(DISTINCT(E.MANAGER_CODE)) AS MAN_COUNT,
       COUNT(DISTINCT(E.EMPLOYEE_CODE)) AS EMP_COUNT
  FROM EMPLOYEE E
 INNER JOIN COMPANY C
    ON E.COMPANY_CODE = C.COMPANY_CODE
  LEFT JOIN SENIOR_MANAGER S
    ON E.COMPANY_CODE = S.COMPANY_CODE
 GROUP BY E.COMPANY_CODE, C.FOUNDER, E.LEAD_MANAGER_CODE
 ORDER BY E.COMPANY_CODE, C.FOUNDER  ; 

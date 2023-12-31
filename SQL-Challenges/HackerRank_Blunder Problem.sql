
/*

-----------------
-- The-blunder
-----------------
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

Sample Input:
 Given below as script

Sample Output:
 2061 
 
Constraints:
1000 < Salary < 10^5


*/

-- Table Creation

CREATE TABLE Employees
(
ID NUMBER,
NAME VARCHAR2(100),
SALARY NUMBER
);


-- Sample Input Insert Script

insert into Employees (ID, NAME, SALARY)
values ('1', 'Kristeen', '1420');

insert into Employees (ID, NAME, SALARY)
values ('2', 'Ashley', '2006');

insert into Employees (ID, NAME, SALARY)
values ('3', 'Julia', '2210');

insert into Employees (ID, NAME, SALARY)
values ('4', 'Maria', '3000');



--- Solution

WITH SalCalc AS
 (SELECT em.Salary, REPLACE(em.Salary, 0, '') Wrong_Sal FROM Employees em),
AvgCalc AS
 (SELECT AVG(Salary) AS Actual_Avg, AVG(Wrong_Sal) AS MisCalculated_Avg
    FROM SalCalc sal)
SELECT CEIL(av.Actual_Avg - av.MisCalculated_Avg) AS Error_Calc
  FROM AvgCalc av;




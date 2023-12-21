-- Using the right orientation

SELECT E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       E.JOB_ID,
       COUNT(E.EMPLOYEE_ID) AS TOTAL_EMPLOYEE,
       MAX(E.SALARY) AS MAX_SALARY
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
 GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.JOB_ID
HAVING E.DEPARTMENT_ID = 50
 ORDER BY E.DEPARTMENT_ID
-- ORDER BY 1
 FETCH NEXT 10 ROWS ONLY;
       
 
 
/*

|-------|----------|-----------------------------------------------------------------------------------------|
| Order | Clause   |                                Description                                              |
|-------|----------|-----------------------------------------------------------------------------------------|  
| 1st   | FROM     | Select right set of tables and joins to get data (Mandatory)                            |
| 2nd   | WHERE    | Filters the rows.                                                                       |
| 3rd   | GROUP BY | Aggregates the data according to common information.                                    |
| 4th   | HAVING   | Have logical predicate to filter data. (Must place on the Group BY columns)             |
| 5th   | SELECT   | Select the attributes(columns) that we need, return the Final data. (Mandatory)         |
| 6th   | ORDER BY | Sort the data                                                                           |
| 7th   | FETCH    | Limit the number of returned data.                                                      |
|------------------------------------------------------------------------------------------------------------| 



--------------------
  | Explain Plan |
--------------------

Cardinality is the estimated number of rows the step with return.
Cost is the estimated amount of work the plan will do.

A higher cardinality => We're going to fetch more rows => we're going to do more work => Query will take more time
So, Cost will be Higher.


*/

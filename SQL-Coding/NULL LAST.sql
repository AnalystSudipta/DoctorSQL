-- NULLS LAST
SELECT E.COMMISSION, E.EMPLOYEE_NAME
FROM   EMPLOYEES E
WHERE  DEPARTMENT_ID = 30
ORDER BY E.COMMISSION DESC NULLS LAST;
	
-- EACH COLUMN IN THE ORDER BY CLAUSE CAN HAVE DIFFERENT NULL HANDLING.

SELECT E.SALARY, E.COMMISSION, E.EMPLOYEE_NAME
FROM   EMPLOYEES E
WHERE  DEPARTMENT_ID = 30
ORDER BY E.SALARY ASC NULLS FIRST, E.COMMISSION DESC NULLS LAST;
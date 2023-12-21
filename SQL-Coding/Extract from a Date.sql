/*

---------------------------------------------------------
-- Author: Sudipta Biswas
-- Description: Extract Date, Time, Year from a Date
---------------------------------------------------------


*/


SELECT
EXTRACT(DAY FROM SYSDATE ),
EXTRACT(MONTH FROM SYSDATE ),
EXTRACT(YEAR FROM SYSTIMESTAMP ),
EXTRACT(HOUR FROM SYSTIMESTAMP ),
EXTRACT(MINUTE FROM SYSTIMESTAMP ),
EXTRACT(SECOND FROM SYSTIMESTAMP ),
TO_CHAR(CURRENT_TIMESTAMP, 'DD'),
TO_CHAR(CURRENT_TIMESTAMP, 'Day'),
TO_CHAR(CURRENT_TIMESTAMP, 'DAY'),
TO_CHAR(CURRENT_TIMESTAMP, 'DY'),
TO_CHAR(CURRENT_TIMESTAMP, 'Dy'),
TO_CHAR(CURRENT_TIMESTAMP, 'Mon'),
TO_CHAR(CURRENT_TIMESTAMP, 'MON'),
TO_CHAR(CURRENT_TIMESTAMP, 'MONTH'),
TO_CHAR(CURRENT_TIMESTAMP, 'YEAR'),
TO_CHAR(CURRENT_TIMESTAMP, 'YYYY'),
TO_CHAR(CURRENT_TIMESTAMP, 'YY')

FROM DUAL;
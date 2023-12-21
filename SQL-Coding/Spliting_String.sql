
/*

---------------------------------------------------------------------------------------------------
-- Author: Sudipta Biswas
-- Description: To split a string into multiple columns, Delimiter could be any regular expression
---------------------------------------------------------------------------------------------------


*/

-- With Comma
SELECT "Full_Part",
       REGEXP_SUBSTR("Full_Part", '[^,]+', 1, 1) AS "1st_part",
       REGEXP_SUBSTR("Full_Part", '[^,]+', 1, 2) AS "2nd_part",
			 REGEXP_SUBSTR("Full_Part", '[^,]+', 1, 3) AS "2nd_part"
  FROM (SELECT '0123456,7789987,8887799' AS "Full_Part" FROM DUAL);
	
	
-- With Space	
	SELECT "Full_Part",
       REGEXP_SUBSTR("Full_Part", '[^ ]+', 1, 1) AS "1st_part",
       REGEXP_SUBSTR("Full_Part", '[^ ]+', 1, 2) AS "2nd_part",
			 REGEXP_SUBSTR("Full_Part", '[^ ]+', 1, 3) AS "2nd_part"
  FROM (SELECT '0123456 7789987 8887799' AS "Full_Part" FROM DUAL);


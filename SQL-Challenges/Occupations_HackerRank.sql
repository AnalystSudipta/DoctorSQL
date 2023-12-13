-----------------------
-- ORACLE DB
-----------------------

/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed
underneath its corresponding Occupation. The output column headers should be Doctor, Professor,
Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.


-- Sample Output

Jenny       Ashley      Meera     Jane
Samantha    Christeen   Priya     Julia
NULL        Ketty       NULL      Maria


-- Explanations

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this
case, the Professor and Actor columns) are filled with NULL values.


*/


-- Create Table Script

CREATE TABLE OCCUPATIONS
   (	
  "NAME" VARCHAR2(100), 
	"OCCUPATION" VARCHAR2(100)
   );

-- Sample Input

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Samantha', 'Doctor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Julia', 'Actor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Maria', 'Actor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Meera', 'Singer');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Ashely', 'Professor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Ketty', 'Professor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Christeen', 'Singer');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Jane', 'Actor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Jenny', 'Doctor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Priya', 'Singer');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Aamina', 'Doctor');

insert into OCCUPATIONS (NAME, OCCUPATION)
values ('Eve', 'Actor');

-----------------
-- Solution
-----------------

SELECT Doctor, Professor, Singer, Actor
  FROM (SELECT o.name,
               o.occupation,
               row_number() OVER(PARTITION BY o.occupation ORDER BY o.name) sl
          FROM occupations o)
PIVOT(MAX(NAME)
   FOR occupation IN ('Doctor' AS Doctor,
                     'Professor' AS Professor,
                     'Singer' AS Singer,
                     'Actor' AS Actor))
 ORDER BY sl;


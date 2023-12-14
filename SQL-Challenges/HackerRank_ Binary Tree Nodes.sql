--------------------
-- ORACLE DB
--------------------
/*
---------------------
-- Binary Tree Nodes
---------------------

You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

Sample Output:

1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf


*/

-- Create Table script

CREATE TABLE BST
(
  N VARCHAR2(5),
  P VARCHAR2(5)
);


-- Insert sample input data

insert into BST (N, P)
values ('1', '2');

insert into BST (N, P)
values ('3', '2');

insert into BST (N, P)
values ('6', '8');

insert into BST (N, P)
values ('9', '8');

insert into BST (N, P)
values ('2', '5');

insert into BST (N, P)
values ('8', '5');

insert into BST (N, P)
values ('5', null);


-- Solution

SELECT B.N,
       CASE
         WHEN B.P IS NULL THEN
          'Root'
         WHEN B.N IN (SELECT T.P FROM BST T) THEN
          'Inner'
         ELSE
          'Leaf'
       END
  FROM BST B
 ORDER BY B.N;

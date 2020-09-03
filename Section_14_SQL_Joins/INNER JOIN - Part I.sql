/* inner joins extract only records in which the values in the realted
column match. Null values, or values appearing in just one of the two
tables and not appearing in the other, are not displayed.

- Only non-null matching values are in play
- If such matching values did not exists, simply, the result set will be empty.
There will be no link between the two tables.

There are two main ways of writting a code for INNER JOINS
with equivalent syntax

- First way:
SELECT
	table_1.column_name(s), table_2.column_name(s)
FROM
	table_1
(INNER )JOIN
	table_2 ON table_1.column_name = table_2.column_name;
    
- Second way
SELECT
	t1.column_name(s), t2.column_name(s)
FROM
	table_1 t1
(INNER )JOIN
	table_2 t2 ON t1.column_name = t2.column_name;
*/

/* Display the dept_no, emp_no and dept_name columns
from dept_manager_dup and departments_dup, together
*/

USE employees;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

/* Let's see why 20 rows and no more
*/
SELECT 
    dept_no, emp_no
FROM
    dept_manager_dup
ORDER BY dept_no;

/* Finally, look at the different null values in the
following table.
*/

SELECT
	dept_no, dept_name
FROM
	departments_dup
ORDER BY dept_no;
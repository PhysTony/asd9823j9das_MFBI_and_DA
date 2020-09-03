/*
Find the lowest department number encountered the 'dept_emp' table.
Then, find the highest department number.
*/

use employees;

select 
	min(dept_no) as Lowest_department
FROM
	dept_emp;
    
select 
	max(dept_no) as Highest_department
FROM
	dept_emp;
/*
Retrieve a list with all employees that have been hired in the year 2000.
*/

use employees;

select
	*
from
	employees
where
	year(hire_date) = 2000
;
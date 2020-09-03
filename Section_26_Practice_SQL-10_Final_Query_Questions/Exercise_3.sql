/*
Obtain a table containing the following three fields for all individuals whose employee number is no greater than 10040:
- employee number
- the smallest department number among the departments where an employee has worked in (use a subquery to retrieve this
value from the 'dept_emp' table)
- assign '110022' as 'manager' to all individuals whose employee number is less than or equal to 10020, and '110039' to
those whose number is between 10021 and 10040 inclusive (use a CASE statement to create the third field).
If you've worked correctly, you should obtain an output containing 40 rows. 
Here’s the top part of the output.
*/

use employees;

# First write the subquery

select
	min(dept_no) as Smallest_department
from
	dept_emp
;


select
	emp_no,
    (select
		min(dept_no)
	from
		dept_emp) as Smallest_department,
	case
		when emp_no <= 10020
			then '11022'
		when emp_no between 10021 and 10040
			then '11039'
		else 'Employee number out of range'
	end as manager
from
	dept_emp
where
	emp_no <= 10040
group by
	emp_no
;

# One more solution and shorter (more elegant)
select
	e.emp_no,
    (select
		min(d.dept_no)
	from
		dept_emp d
	where
		e.emp_no = d.emp_no) as dept_no,
	case
		when e.emp_no <= 10020
			then '11022'
		else '11039'
	end as manager
from
	employees e
where
	e.emp_no <= 10040
;
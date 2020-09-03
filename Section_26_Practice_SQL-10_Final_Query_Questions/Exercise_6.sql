/*
Create a procedure that asks you to insert an employee number to obtain an output containing the same number,
as well as the number and name of the last department the employee has worked for.
Finally, call the procedure for employee number 10010.
If you've worked correctly, you should see that employee number 10010 has worked for department number 6 - "Quality Management".
*/

USE employees;

DROP PROCEDURE IF EXISTS exercise_6;

DELIMITER $$
create procedure exercise_6(in p_emp_no INTEGER)
begin
select
	e.emp_no, d.dept_no, d.dept_name
from
	employees e
		join
	dept_emp de on e.emp_no = de.emp_no
		join
	departments d on de.dept_no = d.dept_no
where
	e.emp_no = p_emp_no
		and
	de.from_date = (select
			max(de.from_date)
		from
			dept_emp de
		where
			de.emp_no = p_emp_no
    );
end $$
DELIMITER ;

call employees.exercise_6(10010);
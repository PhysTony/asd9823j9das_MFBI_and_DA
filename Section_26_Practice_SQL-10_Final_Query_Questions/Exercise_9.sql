/*
Define a function that retrieves the largest contract salary value of an employee. Apply it to employee number 11356. 
Also, what is the lowest salary value per contract of the same employee? You may want to create a new function that}
will deliver this number to you.  Apply it to employee number 11356 again.
Feel free to apply the function to other employee numbers as well.
*/

use employees;

drop function if exists exercise_9_max;
drop function if exists exercise_9_min;

DELIMITER $$
use employees $$
create function exercise_9_max(p_emp_no INTEGER) returns INT
deterministic 
BEGIN

declare v_max_salary INT;

select
	max(s.salary)
into v_max_salary from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
return v_max_salary;
END $$

DELIMITER ;

DELIMITER $$
use employees $$
create function exercise_9_min(p_emp_no INTEGER) returns INT
deterministic 
BEGIN

declare v_min_salary INT;

select
	min(s.salary)
into v_min_salary from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
return v_min_salary;
END $$

DELIMITER ;

-- Run the function
select exercise_9_max(11356);
# 83067

select exercise_9_min(11356);
# 53112
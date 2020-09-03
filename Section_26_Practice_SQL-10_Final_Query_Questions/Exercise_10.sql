/*
Based on the previous example, you can now try to create a function that accepts also a second parameter which would be a character sequence. 
Evaluate if its value is 'min' or 'max' and based on that retrieve either the lowest or the highest salary (using the same logic and code 
from Exercise 9). If this value is a string value different from ‘min’ or ‘max’, then the output of the function should return 
the difference between the highest and the lowest salary.
*/
use employees;

drop function if exists f_salary;

DELIMITER $$
use employees $$
create function f_salary(p_emp_no INTEGER, p_ref varchar(50)) returns int
deterministic 
BEGIN

declare v_salary INT;

select
	case
		when p_ref = 'max'
			then max(s.salary)
		when p_ref = 'min'
			then min(s.salary)
		else max(s.salary) - min(s.salary)
        end as Salary_Info
into v_salary from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
return v_salary;
END $$

DELIMITER ;

-- Run the function
select f_salary(11356,'max');
# 83067

-- Run the function
select f_salary(11356,'min');
# 53112

-- Run the function
select f_salary(11356,'another_string');
# 29955

# The first and second row are the same as the Exercise_9 shown
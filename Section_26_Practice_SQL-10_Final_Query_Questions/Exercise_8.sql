/*
Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).
Extra challenge: You may try to declare a new variable called 'today' which stores today's data, and then use it in your trigger!
After creating the trigger, execute the following code to see if it's working properly.
*/

use employees;


DELIMITER $$

create trigger exercise_8
before insert on employees
for each row
begin
	declare today date;
    set today = DATE_FORMAT(SYSDATE(), '%y-%m-%d');
        
	if new.hire_date > today THEN
		set new.hire_date = today;
    end if;
end $$

DELIMITER ;

insert employees values 
('700000',
'1980-01-31',
'Antonio', 
'Millikan',
'M',
'2025-01-01');

select
    *
from
    employees
where 
	emp_no = 700000;
/*
Find the average salary of the male and female employees in each department
*/

USE employees;

select 
	d.dept_no,
    if(gender = 'M', 'Male', 'Female') as gender,
    avg(s.salary) as Average_Salary
FROM
	salaries s
		join
	employees e on s.emp_no = e.emp_no
		join
	dept_emp d on e.emp_no = d.emp_no
group by d.dept_no, e.gender
order by d.dept_no;
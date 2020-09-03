/*
Retrieve a list with all employees from the ‘titles’ table who are engineers. 
Repeat the exercise, this time retrieving a list with all employees from the ‘titles’ table who are senior engineers.
*/

use employees;

select
	*
from
	titles
where
	title = "Engineer"
order by
	emp_no
;

# But this solution is incorrect because "Senior Engeneer" and "Assistant Engeneer" are also engeneers as we can see below.
select 
	* 
from 
	titles 
group by title;

select
	*
from
	titles
where
	title like ("%engineer%")
order by
	emp_no
;

# There are no title, besides "Senior Engeneer", containing that secuence of words, so, we'll use wehere.
select
	*
from
	titles
where
	title = "Senior Engineer"
order by
	emp_no
;
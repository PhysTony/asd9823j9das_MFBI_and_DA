/*
How many contracts have been registered in the ‘salaries’ table with duration of more than one year and of value higher than or equal to $100,000? 
Note: Apply this exercise for non-leap years only.
int: You may wish to compare the difference between the start and end date of the salaries contracts to the number of seconds there are in a non-leap year.
*/

use employees;

select
	count(from_date)
from
	salaries
where
	Year(to_date) - year(from_date) > 1
		and
	salary >= 100000
;

# Another solution where we consider the non-leap yera condition explicity

SELECT
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000
        AND ((to_date - from_date) >= (60 * 60 * 24 * 7 * 52));
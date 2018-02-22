--largest employer by state for 2015

WITH employees_count_per_state as (
SELECT ein,
	name,
	noemployeesw3cnt as number_of_employees,
	state,
	
	RANK() OVER (PARTITION by state ORDER BY noemployeesw3cnt DESC) as rank
	
FROM `bigquery-public-data.irs_990.irs_990_2015`
JOIN `bigquery-public-data.irs_990.irs_990_ein`
USING(ein)

GROUP BY 1,2,3,4
)

SELECT *

from employees_count_per_state

WHERE rank = 1

ORDER BY number_of_employees DESC
--rank function snippet for BigQuery

SELECT firstname, 
	department, 
	startdate,
	RANK() OVER ( PARTITION BY department ORDER BY startdate as rank
	
FROM Employees;
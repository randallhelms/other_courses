--example of a user-defined function in BigQuery

CREATE TEMPORARY FUNCTION multiplyInputs(x FLOAT64, y FLOAT64)
RETURNS FLOAT64
LANGUAGE js AS """
	return x*y;
""";

--divide by two

CREATE TEMPORARY FUNCTION divideByTwo(x FLOAT64)
RETURNS FLOAT64
LANGUAGE js AS """
	return x/2;
""";

--generate data

WITH numbers as (

SELECT 1 as x, 	5 as y
	UNION ALL
	SELECT 2 as x, 10 as y
	UNION ALL
	SELECT 3 as x, 15 as y)
	
SELECT x,
	y
	multiplyInputs(x,y) as product
	divideByTwo(x) as half_x,
	divideByTwo(y) as half_y
	
FROM numbers
	
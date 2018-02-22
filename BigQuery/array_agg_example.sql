WITH fruits AS (
	SELECT "apple" AS fruit
	UNION ALL
	SELECT "pear" AS fruit
	UNION ALL
	SELECT "banana" AS fruit
	
	)
	
SELECT ARRAY_AGG(fruit) AS fruit_basket

FROM fruits
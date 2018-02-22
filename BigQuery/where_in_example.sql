WITH groceries AS (
	SELECT ["apple",'pear','banana'] AS list
	UNION ALL
	SELECT ['carrot','apple'] as list
	UNION ALL
	SELECT ['water','wine'] as list
	
	)
	
SELECT 
	
	ARRAY(
		SELECT items FROM UNNEST(list) as items
		
		WHERE 'apple' IN UNNEST(list)
		
		) AS contains_apple	

FROM groceries
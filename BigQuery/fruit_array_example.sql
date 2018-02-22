WITh fruits AS (
	SELECT ['mango','apple','banana','cherry'] AS fruit_array
	
	)
	
SELECT ARRAY_LENGTH(fruit_array) AS array_size
	
FROM fruits

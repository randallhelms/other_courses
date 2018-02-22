SELECT items,
	customer_name
	
FROM UNNEST(['apple','pear','peach']) AS items

CROSS JOIN

(SELECT 'Jacob' AS customer_name)
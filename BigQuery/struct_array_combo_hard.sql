WITH orders as (
	SELECT
	[
	STRUCT(35 AS age, 'Jacob' as name, ['apple','pear','peach'] as items),
	STRUCT(35 AS age, 'Miranda' as name, ['mango','water','beer'] as items)
	] as customers
	)
	
SELECT customers

from orders as o

--CROSS JOIN and UNNEST flattens arrays so we can access elements

CROSS JOIN UNNEST(o.customers) as customers

--filter on items Array with UNNEST and using IN

WHERE 'mango' in UNNEST(customers.items)
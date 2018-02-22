**Introducing JOINs and UNIONS**

Enriching your dataset

	JOINs give you fields from different tables
	UNIONs add more records to your table
	
Example: NOAA Weather Data

	Two types of tables: 
		Daily temperature readings
		Recording station locations
	Daily temperatures per year back to 1929
	Lookup table for each location
	
Question: what's the unique identifier for a weather station?

	Is usaf unique over time?
	Example: COUNT vs COUNT(DISTINCT )
	Using combination of usaf and wban gives distinct station ID over time
	COUNT(CONCAT(usaf,wban)) is the method
	
JOIN and UNION data for enriched insights

	UNION allows you to stack data from tables with same schema
	UNION DISTINCT allows you to remove duplicates when you stack results
	If you don't want to type 100 unions, then you can use a table wildcard
		Example: bigquery-public-data.noaa_gsod.gsod*
		gsod* allows you to query all tables with that prefix
		1 line!
	You can also use _TABLE_SUFFIX_ to grab subset of tables
		Example: WHERE _TABLE_SUFFIX_ > '1950'
		Gives you only tables after 1950
	Use _TABLE_SUFFIX_ in SELECT statements with CONCAT()
	
Avoid UNION pitfalls like brittle schemas

	Duplicate records among tables (use UNION DISTINCT vs UNION ALL)
	Changing schemas and field names over time
	Start with the most inclusive table first (most fields)
	Make sure names and count of columns match
	
**SQL JOIN syntax**

Use JOIN to enrich temperature data with station details

Conceptually it joins data from separate tables into one

Horizontal (UNION is vertical)

Need to specify which conditions you are using to match

Elements of a join:

	SELECT fields from table a
	SELECT fields from table b
	JOIN type
	JOIN condition
	
**SQL JOIN Types**

Types of join:

	INNER JOIN - default, everything matching in both tables
	LEFT JOIN - Everything on left, right can be null
	RIGHT JOIN - Everything on right, left can be null
	OUTER JOIN - Everything on both, left or right can be null
	
**Avoiding Pitfalls when Merging Datasets**

Pitfall: Joining on non-unique fields

	Doing a many-to-many JOIN could result in more rows than either initial table
	Primary reason for exceeding resource cap in BigQuery
	Know your dataset and relationships between tables before joining
	Example: joining on the tax period between two IRS tables, not on unique identifier, when each tax period matches five separate record in the left table!
	
Pitfall: Understand your data model and relationships
	
	Understand your data relationship before joining 1:1, N:1, 1:N, N:N
	Use CONCAT() to create composite key fields if no unique fields exist or join on more than one field
	Ensure your key fields are distinct (deduplicate)
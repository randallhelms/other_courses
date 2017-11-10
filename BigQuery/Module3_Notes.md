Comparing Common Data Exploration Techniques

- Can explore data sets in different ways
	1. SQL + web UI
	2. Data preparation tools (GUI)
	3. Visualization tools (Data Studio, Looker, Tableau)
- Steps for exploring data through SQL
	1. Ask good questions
	2. Know your data
	3. Write good SQL

Standard SQL Query Basics

- In BigQuery can just use #standardSQL in first line
- Use ` around table names in standard SQL
	- i.e. `project.dataset.table`
- BigQuery will throw errors if you don't at least specify your dataset

Exploring your data with SQL

- Use FORMAT("%' d", totrevenue) to format large numbers
- Function = performs an action
- Parameters = Inputs you provide
- Use AS to create column aliases
- Stylistic formatting in SQL transforms columns into strings
- Aliases don't exist in WHERE clause; need to use HAVING
- Most common error with SQL is commas (trailing and missing)
- Avoid using * to return all columns, can get a data preview via BigQuery UI

Explore Schemas in BigQuery

- Can use Preview to see a cached version of sample of data
- Schema shows you data types for each column

Standard SQL Filters, Aggregates and Duplicates

- Use ROUND(AVG(column),2) to round to 2 digits when calculating values
- Can use COUNT and GROUP BY to locate duplicate records
- Need to use GROUP BY if using mix of aggregated and non-aggregated columns
- Filter aggregations with HAVING clause (bit slow though)
- Can filter to single condition in WHERE
- Way to filter to just year: 
	WHERE EXTRACT(YEAR FROM PARSE_DATE('%Y%m', CAST(tax_pd as STRING)) = 2014

Standard SQL - Data Types, Date Functions and NULLs

- BigQuery data types
	Numeric:
		Integer
		Float
	String
	Dates
	Other
		Boolean
		Array
		Struct
- Use CAST to convert between data types
	- CAST("12345" as INT64), for example
- NULLs are absence of data, and are valid
- Cannot be equated to, so must use IS NULL or IS NOT NULL
- YYYY-MM-DD is expected format for dates
- PARSE_DATETIME() is a very useful function
- Can parse string values with string functions like CONCAT, ENDS_WITH, LOWER, REGEXP_CONTAINS

Standard SQL - Filters with LIKE

- Use a wildcard operator:
	- WHERE name LIKE '%help%'
	- WHERE name LIKE 'help'
	
Tricks from the lab

- Ctrl + / together applies a block comment to a chunk of the query
- BigQuery uses # for comments, not --
**Advanced Functions - Statistical and Approximations**

Use the right function for the right job

	String manipulation: FORMAT()
	Aggregation: SUM(), COUNT(), AVG(), MAX()
	Data type conversion: CAST()
	Date: PARSE_DATETIME()
	Statistical
	Analytic
	User-defined
	
Run statistical functions over values

	STDDEV() - standard deviation
	CORR() - correlation coefficient (needs two values)
	
Approximate Aggregation Functions:

	APPROX_COUNT_DISTINCT() 
		good enough to get the job done
		useful if you have a very very large dataset and you want a quick answer
	Example: approximate users per year of all Github logins
		3.8s elapsed, 8.37 GB processed
		Can use it for very quick rough answers
	
**Achieving Advanced Insights with BigQuery**

Analytic Window Functions for advanced analysis:

	Standard Aggregations:
		SUM, AVG, MIN, MAX, COUNT, etc
	Navigation functions:
		LEAD() - returns value of a row n rows ahead of the current row
		LAG() - returns value of a row n rows behind the current row
		NTH_VALUE() - Returns value of the nth value in a window
	Ranking and numbering :
		CUME_DIST() - Returns the cumulative distribution of a value in a group
		DENSE_RANK() - Returns the integer rank of a value in a group
		ROW_NUMBER() - Returns the current row number of the query result
		RANK() - Returns the integer rank of a value in a group of values
		PERCENT_RANK() - Returns the rank of the current row, relative to the other rows in the partition
		
Example: RANK() to aggregate over groups of rows

	Get oldest ranking employee by each department
		PARTITION by department
		ORDER BY startdate
		RANK()
	
Shortcut with JOIN: USING() when it's same column name

Use WITH to break queries into multiple steps

**BigQuery User-Defined Functions**

Components of a User-Defined Function (UDF)

	CREATE TEMPORARY FUNCTION
		creates a new function
		can contain zero or more named_parameters
	RETURNS[data_type] S
		Specifies the data type returned
		Example: RETURNS STRING
	Language [language] 
		Specifies the language for the function
		Example: LANGUAGE js
		Can use SQL or JavaScript
	AS[external_code]
		Specifies the code that the function runs

Great way to create temporary functions on an as-needed basis

Pitfall: UDFs hurt performance

	Use native SQL functions whenever possible
	Concurrent rate limits: 
		Non-UDF queries: 50
		UDF queries: 6
		
**Achieving Advanced Insights with BigQuery**

Using WITH clauses and Subqueries

	WITH is simply a named subquery (or Common Table Expression)
	Acts as a temporary table
	Breaks up complex queries
	Chain together multiple subqueries in a single WITH
	You can reference other subqueries in future subqueries
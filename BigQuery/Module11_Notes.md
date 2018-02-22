**Traditional Relational Database Architecture**

Traditional schema

	Each data field needs to be stored in a structured way
	Consider a form - each field gets pivoted
	Adding additional fields to a schema is tough, gets wider and wider
	Best design is to be flexible
	Potential solution is to break up tables into multiple tables and match them via keys
	Idea is to have one fact in one place
	Want to separate data between facts and dimensions as much as possible
	'Normalization' is about breaking apart massive centralized data tables into separate but related tables
	This is the core of relational database theory
	
Normalization vs Denormalization: Performance Tradeoffs

	Benefit is that you can keep growing vertically
	Horizontal growth is harder to keep track of
	Drawback: want to do an aggregated query? 
		Need to do lots of JOINs
		Performance hits happen with JOINs
	Speed vs Design is the tradeoff
	One way to fix this is to trade some redundancy for performance by removing lookup tables
	
Relational databases at scale

	Limits to growing vertically
	When you have billions of rows this leads to many challenges in performance
	Traditional tables struggle at huge scale
	Pre-sorted indexes introduced to help common queries
	Trading read performance at the expense of write performance
	
**Denormalized, Column-based Storage**

BigQuery architecture introduces three key innovations

	1. Column-based data storage
	2. Break apart tables into pieces
	3. Store nested fields within a tables
	
Column-based storage is built for speed

	Storing related values (faster to loop through at execution time)
	Columns can be individually compressed
	Access values from a few columns without reading every one
	
**Table Sharding**

BigQuery automatically breaks data apart into shards

	Google file system will chop data into like 100 mb chunks
	Stored in Google Colossus as shards
	BigQuery automatically pieces it all back together for queries
	Shards of data are read and processed in parallel
	Gateway -> Query Master -> Worker
	Dremel is the query engine that parcels out the jobs automatically to the worker processors
	Each worker reaches out to the data shards and pulls it out to process it
	Passes it back and forth as needed
	
BigQuery automatically balances and scales workers

	Up to 2000 workers used to process concurrent queries (on-demand tier)
	'Fairness model' for allocation of resources

BigQuery workers communicate by shuffling data in-memory

	1. Workers consume data values and perform operations in parallel
	2. Workers produce output to the in-memory shuffle service
	3. Workers consume new data and continue processing
	
	Workers (one or more) scale to meet the demand of the processing task
	
	Workers -> In-memory values (local RAM) -> Distributed disk (local disk) -> Workers
	
BigQuery shuffling enables massive scale

	Shuffle allows BigQuery to process massively parallel petabyte-scale data jobs
	Everything after query execution is automatically scaled and managed
	All queries large and small use shuffle
	
**Introducing nested and repeated fields**

BigQuery introduces repeated fields

	Less performant -> High performing
	Normalized -> Denormalized -> Repeated
	Example:
		cities_lived (repeated)
			city
			years_lived
	Tabbed fields in schemas

BigQuery can use nested schemas for highly scalable queries

Nested schemas bring performance benefits

**Working with arrays and structs in BigQuery**

Arrays are supported natively in BigQuery

	Arrays are ordered lists of zero or more data values that must have the same data type
	Create an array with brackets []

BigQuery implicity flattens arrays

	SELECT ['apple','pear','plum'] AS ITEM,
	'Jacob' as customer
	
	Returns 1 row, with item as flattened array, customer as normal field
	
Explicitly flatten arrays with UNNEST()

	UNNEST = a query that flattens an array and returns a row for each element in the array
	
Aggregate into an array with ARRAY_AGG()
	
	Subquery to create a table of fruits to aggregate later into array
	Aggregate values into an array with ARRAY_AGG()

Filter arrays using WHERE IN

	Start with three arrays of shopping lists
	Use WHERE IN to filter an array
	
STRUCTs are flexible containers

	STRUCT are a container of ordered fiels each with a type (required) and field name (optional)
	Can store multiple data types in one struct
		For example, string and integer
		Even arrays can be included
		Result would come out per row like customers.age / customers.name
	
STRUCTs can contain array values

Arrays can contain STRUCTs as values

	You can nest these within each other, as needed
	
Nested (repeated) records are arrays of structs

	Nested records in BigQuery are arrays of structs
	Instead of joining with a sql_on expression, the join relationship is built into the table
	UNNESTin an ARRAY of STRUCTs is similar to joining a table
	
	Note empty third array returned

	
	
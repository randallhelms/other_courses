Walkthrough of a BigQuery Job

- Characteristics of each job:
	- Given unique ID by web UI
	- Can run concurrently
	- Perform tasks
	- History stored for six months
- The four types of BigQuery jobs:
	1. Query (paid)
	2. Load data into table (free, but storage is paid)
	3. Extract to GCS (free)
	4. Copy existing table (free)

BigQuery Pricing

- 3 main categories of BigQuery costs
	- Storage
		- Amount of data in table
			- $0.02 per GB
			- 10 GB free
		- Ingest rate for streaming
			 - $0.05 per GB
		- Discount for old data
			- $0.01 per GB after 90 days
	- Processing
		- On demand or flat-rate plans
		- On-demand based on amount of data processed
			- 1 TB/month free
			- $5 per TB
		- Have to opt-in to run high-compute queries
	- Free
		- Loading
		- Exporting
		- Queries on metadata
		- Cached queries
		- Queries with errors

Price Calculator

https://cloud.google.com/products/calculator/
- Includes the free amounts

Reserved Slots

- Slots are amount of total query throughput
	- Can guarantee resources
	- Minimizes variability of query performance
	- More you use BigQuery, more slots you get automatically

Query Validator, Quotas and Common Pitfalls

- One of the most useful tools:
	- Validates syntax
	- Tells how much data will be processed (can be used to calculate pricing)
- Quotas are used to protect BigQuery customers
	- 50 concurrent queries
	- 6 hour timeout
	- 1000 updates to table per days
	- 1000 tables referenced by a single query
	- Max result size: 128 MB compressed
- Pricing pitfalls
	- LIMIT 10 will still need to process all rows
	- Select * with long string columns means more bytes processed

Optimize Queries for Cost

- Filter early, filter often
- Use cached results when possible (permanent tables, instead of views)
- Limit the use of User-Defined Functions
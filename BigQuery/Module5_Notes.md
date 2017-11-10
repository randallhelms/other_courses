5 Principles of Dataset Integrity

High quality datasets conform to strict integrity rules:
	1. Validity: Data conforms to business rules
		- Challenges: Out of range, empty fields, data mismatch
	2. Accuracy: Data conforms to an objective true value
		- Challenges: Lookup datasets, do not exist
	3. Completeness: Create, save and store datasets
		- Challenges: Missing data
	4. Consistency: Derive insights from data
		- Challenges: Duplicate records, concurrency issues
	5. Uniformity: Explore and present data
		- Challenges: Same units of measurement
- Valid data follows constraints on uniqueness
- Valid data corresponds to range constraints
- Accurate data matches to a known source of truth
- Uniformity in data means measuring the same way

Understanding Dataset Shape and Skew

- Types of dataset shapes:
	1. Small
	2. Even Height and Width
	3. Long and narrow
	4. Short and wide
- Long and narrow is probably the best for 'tidy' analysis, per Hadley Wickham
- Types of dataset skew (distribution of values):
	1. Even distribution
	2. Heavy skew
	3. Skewed right
	4. Skewed left

Clean and transform data with SQL

- Set up field data type constraints:
	- Specify NULLABLE or REQUIRED
	- Check for NULL values
- Use CASE WHEN and IF() to filter for allowable range values
- Require primary keys, relational constraints in upstream systems before hitting BigQuery
- Check values with test cases and calculated fields
- Lookup values against objective reference dataset, using IN() or JOIN
- Check for completeness:
	- Use NULLIF(), IFNULL(), COALESCE()
	- Join to other datasets using UNION and JOIN
- Ensure data consistency:
	- Store one fact in one place and use IDs for lookup
	- Use string functions to clean data:
		- PARSE_DATE()
		- SUBSTR()
		- REPLACE()
- Empty values are not NULL in BigQuery; NULL has to be specified

Clean and Transform using Cloud Dataprep UI

- Cloud data pipeline building tool, part of the Cloud Platform suite
- Can create and view data preparation steps
- Chain together multiple wranglers into repeatable recipe
- Common tasks like record deduplication and derived fields
- Chaining together rules into a recipe:
	- Repeatable set of transformation steps built by chaining data wranglers together
	- Jobs run against recipes
	- Can include end-to-end steps from ingestion, transformation, aggregation, save to BigQuery
- Can monitor jobs and save results as new table in BigQuery
	- Track completed and ongoing jobs
	- See data quality metrics for transformed datasets
	- View histograms with summary stats for each field
- Can load data samples to test out your data and understand it better
	- Functionally like the BigQuery cached preview
	- Also displays data quality, showing missing values, bad data, etc
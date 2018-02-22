**Creating Permanent Tables**

Creating a new permanent table

	Write SQL Query
	Click Show Options
	Specify the Destination Table (can be existing)
	Choose Write Preference (if table already exists)
	Run Query
	
If Destination Table exists:

	Write if empty
	Append Records
	Overwrite table

**Temporary Tables and Query Results**

Store Query results after running

	Use 'Save as Table'
	All query results are stored in tables (regardless if you 'Save as Table')
	If you don't save as a Permanent table, a Temporary one is created for 24 hours
	Re-running the same query will likely hit the cached temporary table
	
**Performance Preview: Query Cache**

Running the same queries will pull from cache

	Cache = Faster results
	Cache is not used when:
		Underlying table(s) updated
		Deterministic queries used (like CURRENT_TIMESTAMP())
		Cache disabled in 'Show Options'
		
**Creating Logical Views**

If permanent tables don't change, then you can store it as a permanent table

For data that changes regularly (daily / weekly, etc), you can set up a way to automatically re-run the query with new data

Views don't allow a preview

Views don't store any data, it's more a store of logic; you can see this by clicking on 'Details', for example it stores the underlying query

You can map users to groups within Views, for example with the SESSION_USER() command within the WHERE clause
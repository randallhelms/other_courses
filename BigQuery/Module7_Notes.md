**Ingesting New Data into BigQuery**

Ingest data from many formats:

	Cloud Storage
	Google Drive
	Cloud Dataflow
	Cloud Dataprep
	Cloud BigTable
	CSV, JSON, Avro
	
Data ingested is stored in permanent tables and it is scalable and fully-managed

You can query external data sources directly from BigQuery:

	Bypass managed storage
	Writing queries directly to data in Cloud Storage, Google Drive, Cloud BigTable
	Example: Google Sheets spreadsheet has data, can use this as direct data source to join with
	
Limitations of querying from external sources:

	Strong performance disadvantages
	Data consistency not guaranteed
	No Table Wildcards
	
**Loading Data into BigQuery**

Streaming records into BigQuery via the API

	Streaming record inserts: Streaming data allows you to query data without waiting for a full batch load
	
Ingesting a CSV file from Cloud Storage:

	1. Upload CSV data to Google Cloud Storage bucket
	2. Get link to where it is stored exactly - gs://bucket-name/file.csv is the format
	3. Click 'Create new table' to make native BigQuery table
	4. Select file format, and add location to Google Cloud Storage
	5. Create a new Destination Table name; specify a Native Table or External Table. Native is faster
	6. Can automatically detect the schema, or you can do it manually, specify header rows to skip
	7. Specify if write, append, overwrite
	8. Set to create it - ingesting is free
	9. Once it is done, you will get a checkmark
	10. Check if Schema was automatically detected; if wrong, re-run with manual schema
	
External table with CSV:

	1. Specify an external table, with endpoint at CSV storage point
	2. Add name and schema
	3. Technically it's more of a pointer than a real table
	4. Since no job, it's very quick to create, no preview
	5. BigQuery stores a configuration
	6. Can't cache data that is not stored natively
	
Google Drive spreadsheet connection:

	1. Need to have the Drive link (instead of bucket link)
	2. Specify Google Sheet as file type
	3. Same issue with storing the configuration
	4. Can query directly
	5. Need to authorize the Drive API to send data through
	
Uploading files locally:

	1. Create new table, then use file upload feature
	2. Same steps as Google Cloud Storage method
	3. Then it's stored in native BigQuery storage
	
**


	
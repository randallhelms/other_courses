Data Analyst Tasks, Challenges and Google Cloud Platform Tools

- Tasks and challenges:
	1. Ingest: Volume, variety, velocity
	2. Transform: Slow to explore and process, unclear logic
	3. Store: Costs, hard to scale, latency issues
	4. Analyze: Slow queries, siloed data
	5. Visualize: Dataset size, tool latency
- Google's Tools:
	1. Ingestion: BigQuery Storage (import)
	2. Transform: BigQuery Analysis (SQL), Cloud Dataprep (preparation)
	3. Store: Cloud storage (buckets), BigQuery storage (tables)
	4. Analyze: BigQuery analysis (SQL)
	5. Visualize: Google Data Studio (and third-party tools)

Demo: 10 Billion Records with BigQuery

- Useful tool is the query validator; helps to check your syntax as well as how much data you will use
- 'Show Options' - allows you to use Standard SQL or the BigQuery dialect
- Get results in results panel, and then you can download as csv and JSON, or save as table or Google Sheet
- In Data Studio you can pass data from Google BigQuery, and use it to visualize your results
- Examples: high revenue from desktop vs mobile

Fundamental BigQuery Features

- Don't manage infrastructure
- Focus on finding insights
- 9 key tenets:
	- Fully managed petabyte-scale data warehouse
	- Reliable and backed by Google Datacenters
	- Economical: Pay only for processing and storage you use
	- Security: Role ACLs, data encryption in transport and at rest
	- Auditable: every transaction logged and queryable
	- Scalable: fast queries from highly parallel processing
	- Flexible: connect data from multiple datasets
	- Easy to use: standard SQL, no indexes or keys, open standards
	- Public datasets: explore and practice
- 3 ways to interface with BigQuery:
	1. Web UI
	2. Command Line Interface (CLI), using Cloud Shell or Google Cloud SDK
	3. REST API: connect via Python or R over HTTP
	
Data Architecture

- BigQuery is two services in one:
	1. Managed Storage: Full-managed and scalable data storage using same technology as Google product data storage (ads, Gmail, YouTube, etc)
	2. Analysis: Fast massively parallel SQL engine based on Google's internal technology
- Came out of process of development of data technologies (MapReduce, Dremel, Colossus, TensorFlow, etc)
- Google opens technologies up to the community: Cloud Storage, DataProc, DataFlow, ML, PubSub, etc

Compare GCP tools for Analysts, Data Scientists and Data Engineers

- Analysts derive insights from queries and visualization, usually with SQL
	- GCP tools are BigQuery, Data Studio
- Data scientists analyze data and build models using statistics and machine learning (SQL, R, Python)
	- Cloud Datalab, BigQuery, SQL
- Data engineers design, build and maintain data processing systems (Java, Python, Ruby, etc)
	- Cloud DataFlow, Cloud Storage, App Engine, Cloud PubSub
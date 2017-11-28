**Introduction to APIs**

Link: https://zapier.com/learn/apis/chapter-1-introduction-to-apis/

By Brian Cooksey

**Chapter 1: Introduction**

An API is an Aplication Programming Interface

API is tool that makes a website's data digestible for a computer; i.e. a computer can view and edit data, just like person can by loading pages and submitting forms

Purpose is to automate tedious and labor-intensive tasks (like copying contact info for thousands of customers)

APIs are used to integrate (or connect) multiple systems, from a server on one side to a client on the other side. 

Example #1: a smartphone app that syncs with a website - when a user refreshes the app connects to the website via API to collect the newest data.

Example #2: A restaurant listings website uses the Google Maps API to pull in maps to display

**Chapter 2: Protocols**

Protocol: An accepted set of rules that govern how two computers communicate; tend to be quite rigid, need high levels of specificity to work

Web protocols cover many areas, each tailored to different jobs, i.e. bluetooth for device connection or POP or IMAP for email. Hyper-Text Transfer Protocol (HTTP) is the main web protocol. HTTP is typical underlying protocol for APIs.

HTTP requests and the Request-Response Cycle: client sends server request, server sends message confirming or denying request

Valid requests include:

	1. Uniform Resource Locator (URL)
	2. Method
	3. List of Headers
	4. Body
	
URL: a unique address for something on the web; can be whole web page, or image, or video or something else. On an API, URLs can be assigned to individual chunks of data (customers, products, tweets, etc) in order to give client variety of tools to interact with.

API request methods:

	GET - Ask server to retrieve a resource
	POST - Ask server to create a resource
	PUT - Ask server to edit/update a resource
	DELETE - Ask server to delete a resource
	
	Example: In a pizza parlor, you would POST request with your order details, then send a PUT request to change it. You then send GET requests to check on status; if you decide you don't want the pizza, send a DELETE request to cancel the order.
	
Headers: These provide meta-information about a request; list of items like time and size of request. Example would be website using User-Agent to detect a mobile browser

Body: Contains data the client wants to send the server, can contain anything (has fewer rules than other parts of the HTTP request)

HTTP responses: similar strucure to requests, except status code replaces method and URL. Status codes are three-digit numbers with a unique meaning, i.e. 200 (success), 404 (not found), and 503 (sitedown).

How do APIs build on HTTP? APIs can be built on it to provide clients with business potentials - being able to use them means knowing how to make the correct HTTP request.

**Chapter 3: Data Formats**

Representing data: APIs use a variety of text formats to request data objects
	
	JSON (JavaScript Object Notation): Extremely common format, uses key-value pairs, can use square brackets to indicate a list, also can create new keys to nest data (like with customer in example)
		
		Example pizza order in JSON: 
		
			{
				"crust": "original",
				"toppings": ["cheese", "pepperoni", "garlic"],
				"status": "cooking",
				"customer": {
				"name": "Brian",
				"phone": "573-111-1111"
					}
			}
	
	XML (Extensible Markup Language): Simple building blocks make up powerful data format, with main block called a node; always starts with root node, then below that are child nodes
	
		Example pizza order in XML:
		
			<order>
				<crust>original</crust>
				<toppings>
					<topping>cheese</topping>
					<topping>pepperoni</topping>
					<topping>garlic</topping>
				</toppings>
				<status>cooking</status>
			</order>
			
How data formats are used in HTTP

	Headers are crucial for saying what format the data is in ('Content-Type')
	Client sends Content-Type header in request, it tells server that data in body of request is formatted a particular way. 
	If the client wants to send the server JSON data, it sets Content-Type to "application/JSON"
	When receiving request, server checks that it understands the format, and it sets Content-Type in response to client
	If client can only speak one data format and server sends other, then error is thrown
	Second HTTP header used, Accept, which tells server which data formats it can accepted
	If server can't provide, it sends an error
	
**Chapter 4: Authentication, Part 1**

APIs use variety of authentication schemes to authenticate a client (to confirm that they can get access)

	Basic Authentication (BasicAuth): 
	
		Just uses username and a password
		Client takes that and sends it in an HTTP header called Authorization
		Server checks this against stored users, and returns data or throws 401 status code to denying
		Problem is that it is not as secure (like giving hotel guest key to whole building)
		No way to offer different permissions with BasicAuth
	
	API Key Authentication (KeyAuth):
	
		Requires unique key to access API; usually distinct from login passowrd
		Server knows to allow authenticated client access to data, but can limit access to admin functions
		Multiple standards, unlike BasicAuth
		Many approaches:
			Put key in Authorization header
			Add it on to the URL (http://example.com?api_key=my_secret_key)
			Put it in request body by data
			
**Chapter 5: Authentication, Part 2**

Open Authorization (OAuth):

	Way to avoid some of the frustrations of KeyAuth by automating key authorization
	Standard way for client to get a key from the server; user only needs to enter credentials
	OAuth 2 is current standard (OAuth 1 also exists)
	
OAuth 2:

	3 parties involved: user, client, server
	
	Step 1: User tells client to connect to server
	Step 2: Client directs user to server with callback URL that server sends back once the user authenticates
	Step 3: User logs in to server and grants client access (using normal authentication)
	Step 4: Server sends user back to client, along with unique authorization code
	Step 5: Client exchanges code & secret key for access token from server
	Step 6: Client pulls data from server, using the access token
	Step 7 (Optional): Client refreshes token; sometimes tokens expire (for security reasons), so client will need to get a new token
	
How OAuth 1 is different:

	Access tokens don't expire
	Extra step between Step 1 and 2: request token is created, and is later exchanged for access token
	Requests need to be digitally signed, idea is to protect data from being tampered with
	Most API requests happen over HTTPS, so signatures not really necessary
	
Authorization:

	Scope is the OAuth 2 term for setting terms of permissions, i.e. how servers limit what kind of data can be requested
	Client-based restrictions
	
**Chapter 6: API Design**

Different approaches to designing APIs: some go for single URL for all data, some have a separate URL for each piece of data, in a hierarchical organization.

Start with an architectural style:

	SOAP: XML-based design with standard structures for requests and responses
	REST (Representational State Transfer): More open and customizable approaches. More common than SOAP
	
Picking resources:

	Step through all steps of a typical interaction (in pizzeria example: menu, pizza, customer, order as resources)
	Assign endpoint URLs to resource, typically a resource has two URL patterns:
		1. Plural of resource name, like /orders
		2. Plural of resource name plus unique identifier, like /orders/<order id>
	Decide which actions to allow: listing, creating, retrieving, updating, cancelling
	Decide what data to exchange between client and server
	
Linking resources together:

	One method is for hierarchy to grow, i.e. /customers/5/order and /customers/5/orders/3
	Other is to send a customer_id field in the JSON
	
Searching data: 

	With data volumes, endpoints that list all records are impractical
	REST has method to search for data, with query string
	Example: http://example.com/orders?key=value
	Query parameters are set by API, and need to be respected to get the data
	Query string can limit amount of data, i.e. into batches of 100 records
		Client needs to decide if it wants more results, i.e. GET /orders?page=2&size=200
		
**Chapter 7: Real-Time Communication**

Integrations

	Sharing allows the linking of systems to form an integration; when doing something in one system the other automatically updates
	Client-driven: person interacts with client and wants server's data to update
	Server-driven: person interacts with server and makes client aware of change
	Client makes requests and server responses; changes easy to send from client to server, harder the other direction
	
Client-Driven Integration

	Pizza example:
		Customer presses order button in mobile app, app sends request to restaurant API
		Client knows exactly when data changes, so can call the API straight away (no delay)
		
Server-Driven Integration

	Variety of techniques used to get around limitations of client-only requests
	Polling: 
		client repeatedly asks the server for any updates
		frequency of requests affects how up-to-date the client is
		problem is that it's a pretty inefficient system, not very scalable
		each request costs money
	Long Polling:
		Client sends request to server, but server only responds when there is an update to send
		Saves resources (and costs)
		Challenge is how many requests the server can hold, or what happens when the server loses its connection
	Webhooks:
		Client makes requests and listens for them
		Allows server to easily push out updates
		Client becomes a kind of server tool
		Webhooks requires client to provide a Callback URL where it can receive events
		Whenever something changes on server, that server sends request to Callback URL
	Subscription Webhooks:
		Client subscribes to specific events from the server
		Allows data customization, don't need to take (or push) everything
		Efficient, real-time and easy to use
		Increasingly common for APIs to support them
		
**Chapter 8: Implementation** 
		
From Plan to Product

	You need two programs to implement an API: server program, client program
	API publisher is responsible for the server program; plans, writes software that follows design, put program on server
	Publishing documentation for API: usually webpages or pdfs, explaining authentication schemas, endpoints, data formatting, examples, code snippets
	
HTTP Clients

	Generic program that lets you built http requests to test with
		Specify URL, headers, body, and program sends it to server in proper formatting
	Don't need to know how to program to use one; can read API docs and get started
	Cons: can't save work, can't do much with data you get back (maybe save to file)
	
Writing Code

	See if API publisher provides a client library in your language (Python, JavaScript, Ruby, etc), either to download or bundled in an SDK (Software Development Kit)
	Using library saves time, as much of the code is already written
	Where to run code depends on needs - either on local machine, but more often on a web server (for example on AWS cloud servers)
	Decide what to do with data - save into a file? save to a database?
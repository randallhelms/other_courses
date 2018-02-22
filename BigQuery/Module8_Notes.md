**Overview of Data Visualization Principles**

Use visualization to clearly and concisely present insights

	Visualization helps spot hidden trends
	Interaction with visual is often faster than SQL
	Deliver powerful insights via reports
	Get scalable performance as dataset grows
	
Visualization theory: Perception

	Stimulus -> Eye -> Brain
	Sensation (Physical Process) -> Perception (Cognitive Process)
	
Visualization Theory: Count the fives

	Too much noise makes it hard to pick out a message in a visual
	Adding a visual aid (like bolding the fives) makes it easier for the brain to process a visual
	Continually adding visual elements (like color) makes it easier and easier to understand

Visualization Theory: Preattentive attributes

	Form
		Orientation
		Shape
		Line length
		Line width
		Size
		Curvature
		Added marks
		Enclosure
	Color
		Hue
		Intensity
	Spacial Position
		2-D position
	Motion
	
**Comparing good and bad visualizations**

Example: pie chart vs time series for percentages of Game of Thrones characters by gender

	What other ways could you improve these charts?

Example: bar chart vs donut chart, books by page count

	Bar chart gives a clear comparison
	Donut chart is just confusing in its combination of everything
	
The 80/20 rule

	What you spend time on: 80% getting data and cleaning it, 20% visualizing it
	What the audience cares about: 1% behind-the-scenes, 99% the output (visualization)
	How you deliver the message is as important or more important than the underlying work
	Put a lot of thought into how you put across the message
	
**Dimensions, Measures and Reports**

Dimensions

	Description: A field that can be considered an independent variable; usually qualitative or categorical
	Examples:
		Name
		Location
		ID
		Job Title
	
Measures

	Description: A field that is a dependent variable; it's value is a function of one or more dimensions; quantitative data
	Examples:
		Revenue
		Salary
		Expenses
		Errors
		
What's a measure?

	Phone Number - No
	Employee ID - No
	Age - Yes
	Date of Birth - No
	Tenure at Work - Yes
	Job Title - No
	
Reports transform data into information

	Tell a clear story with your data
	Share and collaborate on reports with others
	
**Introducing Google Data Studio**

Steps:

	1. Home: Where you see your reports
	2. Click on 'Start a new report'
	3. Pick your data source(s)
		a. Possibilities:
			Google Sheets
			BigQuery
			SQL
			File Upload
			DoubleClick
			AdWords
			Google Analytics
			Google Attribution
	4. Add data source to report
	5. Click chart type and then draw it on to the blank canvas
		a. Control the chart type from the right-hand side
	6. Rename and share your report
	7. 'View' toggle allows you to see what the final result will look like to viewer
	8. Users cannot edit reports unless you give them permission
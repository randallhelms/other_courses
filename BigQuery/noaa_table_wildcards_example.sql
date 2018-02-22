Select stn, 
	wban, 
	temp, 
	year,
	_TABLE_SUFFIX_ AS table_name_year
	
FROM `bigquery-public-data.noaa_gsod.gsod*`
	
WHERE _TABLE_SUFFIX_ > '1999'
OR _TABLE_SUFFIX_ <> year

LIMIT 10
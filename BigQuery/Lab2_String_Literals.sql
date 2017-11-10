--standardSQL
--Error 4: Missing Quotes from String Literals

--All non-profits located in New York
SELECT 
  EIN,
  name,
  city,
  state,
  zip,
  subsection
FROM 
  `bigquery-public-data.irs_990.irs_990_ein`

--always properly quote your strings
  
WHERE state = 'NY';
--Error 5: Non-Aggregate fields not found in GROUP BY

--U.S. States with the most non-profits

SELECT 
  COUNT(EIN) as charity_count,
  state
FROM 
  `bigquery-public-data.irs_990.irs_990_ein`

--any non-aggregate field must be in the GROUP BY clause

GROUP BY state
ORDER BY charity_count DESC;
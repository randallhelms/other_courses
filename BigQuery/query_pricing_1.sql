--1.59 GB to process
-$0.008 cost for this query

SELECT * FROM `data-to-insights.irs_990.irs_990_reporting` 
WHERE UPPER(name) LIKE '%KNIGHT%'
ORDER BY ein
LIMIT 10;
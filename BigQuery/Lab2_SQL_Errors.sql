--standardSQL
--find duplicate ein records in IRS 990 forms

SELECT
  ein,
  name,
  COUNT(ein) AS number_records
FROM
  `bigquery-public-data.irs_990.irs_990_ein`
GROUP BY
  ein,
  name
HAVING
  number_records > 1
ORDER BY
  name ASC;
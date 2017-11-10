SELECT
  ein,
  name,
  COUNT(ein) AS ein_count
FROM
  `bigquery-public-data.irs_990.irs_990_ein`
GROUP BY
  EIN,
  name
HAVING
  ein_count > 1
ORDER BY
  ein_count DESC;
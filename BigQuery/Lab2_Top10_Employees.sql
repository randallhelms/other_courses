# Top 10 Employers with the most employees
SELECT
  EIN,
  noemplyeesw3cnt AS employee_count
FROM
  `bigquery-public-data.irs_990.irs_990_2015`
ORDER BY
  noemplyeesw3cnt DESC
LIMIT 10;
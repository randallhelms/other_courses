--standardSQL
--Error 3: Misspelled column names, commas, and case

--Top 10 Non-Profit Schools by Number of Employees
SELECT 
  EIN, 
  totrevenue AS total_revenue, 
  totfuncexpns AS total_expenses,
  noemplyeesw3cnt AS employee_count,
  noindiv100kcnt AS emp_salary_over_100k
FROM 
`bigquery-public-data.irs_990.irs_990_2015`

-- Filter on "Yes" response to operates a school
-- Case-sensitive - 'Y' works but not 'y'

WHERE 
  operateschools170cd = 'Y'

ORDER BY 
  noemplyeesw3cnt DESC
  
LIMIT 10;
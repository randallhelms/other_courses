--Error 6: Type mismatch on a Comparison Operator (<,>,=,!=)

--Non-Profits with employees who ceased operations in 2015
SELECT
  # Key stats
  EIN,
  noemplyeesw3cnt AS count_employees,
  noindiv100kcnt AS count_emp_over_100k_salary,
  ceaseoperationscd AS ceased_operation,

  # Revenue = Contributions + Programs + Other
  totcntrbgfts AS total_contributions,
  totprgmrevnue AS total_program_revenue,
  totrevenue AS total_revenue,
  
  # Expenses
  totfuncexpns AS total_functional_expenses

FROM `bigquery-public-data.irs_990.irs_990_2015`

--Need to ensure that strings have quotes, and integers don't
WHERE
  ceaseoperationscd != 'Y' # Ceased operations
  AND noemplyeesw3cnt >= 0 # Had employees
  
ORDER BY
  noemplyeesw3cnt DESC;
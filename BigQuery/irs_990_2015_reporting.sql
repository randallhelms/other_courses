#standardSQL

  #CTEs
  WITH 
  
  # 2015 filings joined with organization details
  irs_990_2015_ein AS (
  SELECT
    *
  FROM
    `bigquery-public-data.irs_990.irs_990_2015`
  JOIN
    `bigquery-public-data.irs_990.irs_990_ein` USING (ein)),
    
  # duplicate EINs in organization details
  multiples AS (
  SELECT
    ein AS ein,
    COUNT(ein) AS ein_count
  FROM
    irs_990_2015_ein
  GROUP BY
    ein
  HAVING
    ein_count > 1 )
    
# return results to store in a permanent table
SELECT
  irs_990.ein AS ein,
  irs_990.name AS name,
  irs_990.noemplyeesw3cnt AS num_employees,
  irs_990.grsrcptspublicuse AS gross_receipts,
  irs_990.totcntrbgfts AS total_contributions,
  irs_990.lessdirfndrsng AS fundraising_expenses,
  irs_990.totfuncexpns AS total_functional_expenses,
  irs_990.totliabend AS total_liabilities,
  irs_990.totnetliabastend AS total_liabilities_and_net_asset_balances,
  irs_990.totrevenue AS total_revenue,
  irs_990.pubsupplesub509 AS public_support,
  irs_990.officexpns AS office_expenses,
  irs_990.legalfees AS legal_fees,
  irs_990.accntingfees AS accounting_fees,
  irs_990.feesforsrvcmgmt AS management_services_fees,
  irs_990.elf AS efiled_indicator
FROM
  irs_990_2015_ein AS irs_990
LEFT JOIN
  multiples
ON
  irs_990.ein=multiples.ein
WHERE
  # filter out duplicate records
  multiples.ein IS NULL;
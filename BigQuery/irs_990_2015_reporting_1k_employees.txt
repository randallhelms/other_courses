#standardSQL
# 2015 filings with > 1000 employees
SELECT
  *
FROM
  `qwiklabs-gcp-e7dda8f302f22595.irs_990.irs_990_2015_reporting_view` # change name
WHERE
  num_employees > 1000;
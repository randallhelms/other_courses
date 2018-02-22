#standardSQL
# most employees
# test cache by re-running the same query twice
# disable cache in Show Options
SELECT
  name,
  num_employees
FROM
  `qwiklabs-gcp-e7dda8f302f22595.irs_990.irs_990_2015_reporting_view` # change name
ORDER BY
  num_employees DESC;
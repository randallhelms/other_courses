--standardSQL
--calculate storage costs for a dataset (assume $0.02 / GB / month)
--total_size_gb = 4.0696
--storage_cost_per_month=0.08
SELECT 
  ROUND((SUM(size_bytes)/1024/1024/1024),4) AS total_size_gb,
  ROUND((.02*SUM(size_bytes)/1024/1024/1024),2) AS storage_cost_per_month
FROM `data-to-insights.irs_990.__TABLES__` ;
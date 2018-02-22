#standardSQL
#approximate users per year of all Github User Logins since 2011

WITH github_year_sketches AS (
SELECT
	CONCAT('20',_TABLE_SUFFIX) year,
	--approximate number of logins
	APPROX_COUNT_DISTINCT(actor.login) as approx_cnt,
	--another method of estimating logins
	HLL_COUNT.INIT(actor.login) AS sketch #HyperLogLog Estimation
	
FROM `githubarchive.year.20*`

GROUP BY year

ORDER BY year)

SELECT HLL_COUNT.MERGE(sketch) as approx_unique_users

FROM `github_year_sketches`
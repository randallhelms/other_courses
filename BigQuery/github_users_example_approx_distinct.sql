#standardSQL
#approximate users per year of all Github User Logins

SELECT
	CONCAT('20',_TABLE_SUFFIX) year,
	APPROX_COUNT_DISTINCT(actor.login) as approx_cnt
	
FROM `githubarchive.year.20*`

GROUP BY year

ORDER BY year
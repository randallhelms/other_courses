SELECT count(ein) as total_ein,
	count(distinct ein) as distinct_ein,
	count(ein) - count(distinct ein) as difference

FROM `bigquery-public-data.irs_990.irs_990_ein`;
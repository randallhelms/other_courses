WITH TitlesAndScores as (
	SELECT
		ARRAY_AGG(STRUCT(title,score)) AS titles,
		EXTRACT(DATE FROM time_ts) as date
		
	FROM `bigquery-public-data.hacker_news.stories`
	
	WHERE score IS NOT NULL
	AND title IS NOT NULL
	
	GROUP BY date)
	
SELECT date,
	ARRAY(SELECT AS STRUCT title, score
			
			FROM UNNEST(titles) 
			
			ORDER BY score DESC
			
			LIMIT 2)
	
	AS top_articles
	
FROM TitlesAndScores
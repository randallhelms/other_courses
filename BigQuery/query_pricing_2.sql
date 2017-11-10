--56.1 GB to run
--$0.28 cost

SELECT
  language,
  wikimedia_project,
  title,
  SUM(views) AS views
FROM
  `bigquery-samples.wikipedia_benchmark.Wiki1B`
WHERE
  title LIKE '%Google%'
GROUP BY
  wikimedia_project,
  title,
  language
ORDER BY views DESC
LIMIT 10;
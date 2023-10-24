SELECT *
FROM fact_gamelog;

SELECT *
FROM dim_dates;

SELECT 
	d.day,
	COUNT(f.key) as games_played,
	SUM(f.gf) as goals_scored,
	SUM(f.gf) / CAST(COUNT(f.key) as FLOAT) as average_goals_per_game
FROM fact_gamelog f
JOIN dim_dates d
	ON f.date = d.id
WHERE f.season_year = 2023
GROUP BY d.day
HAVING SUM(f.gf) / CAST(COUNT(f.key) as FLOAT) > 3.6
ORDER BY 4 DESC;
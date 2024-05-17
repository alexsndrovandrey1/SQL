SELECT dates::DATE
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates
FULL JOIN 
	(
		SELECT person_id, visit_date
		FROM person_visits 
		WHERE person_id = 1 OR person_id = 2 AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
	) AS tab
ON dates = tab.visit_date
WHERE tab.person_id IS NULL
ORDER BY dates
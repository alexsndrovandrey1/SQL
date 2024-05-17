SELECT tab.name
FROM
	(
		SELECT pizzeria.name,
		SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END) AS m,
		SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) AS f
		FROM person_visits pv
		JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
		JOIN person ON pv.person_id = person.id
		GROUP BY pizzeria.name
	) tab
WHERE m<>f
ORDER BY 1
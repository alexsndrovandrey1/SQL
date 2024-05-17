SELECT action_date, name
FROM
	(
		SELECT order_date AS action_date, person_id
		FROM person_order
		INTERSECT
		SELECT visit_date AS action_date, person_id
		FROM person_visits
	) AS d, person AS per
WHERE d.person_id = per.id
ORDER BY action_date, per.name DESC

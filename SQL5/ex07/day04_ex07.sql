INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES(
	(SELECT MAX(id)
	 FROM person_visits
	) + 1,
	(SELECT id
	 FROM person
	 WHERE name='Dmitriy'),
	(SELECT pizzeria.id
	 FROM menu
	 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	 WHERE menu.price < 800 AND pizzeria.name <> 'Papa Johns' 
	 LIMIT 1),
	'2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

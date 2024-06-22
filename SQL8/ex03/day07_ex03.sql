WITH orders AS
	(SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
	FROM person_order po
	JOIN menu ON po.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name
	ORDER BY 2 DESC, 1),
	visits AS
	(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
	FROM person_visits pv
	JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name
	ORDER BY 2 DESC, 1)
SELECT orders.name, orders.count + visits.count AS total_count
FROM orders
JOIN visits ON orders.name = visits.name
ORDER BY 2 DESC, 1;

SET enable_seqscan TO ON;
EXPLAIN ANALYZE
	SELECT menu.pizza_name, pizzeria.name
	FROM menu
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	ORDER BY 1, 2 DESC;
	
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
	SELECT menu.pizza_name, pizzeria.name
	FROM menu
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	ORDER BY 1, 2 DESC;

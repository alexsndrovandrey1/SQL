WITH cte_6 AS 
	(
		SELECT menu.pizza_name, menu.price, pizzeria.name, pizzeria.id
		FROM menu
		JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	)
SELECT tab1.pizza_name, tab1.name AS pizzeria_name_1, tab2.name AS pizzeria_name_2, tab1.price
FROM cte_6 tab1
JOIN cte_6 AS tab2 ON tab2.pizza_name = tab1.pizza_name
WHERE tab2.id > tab1.id AND tab2.price = tab1.price
ORDER BY 1


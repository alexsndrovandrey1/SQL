SELECT name.pizza_name, pizzeria.name AS pizzeria_name, name.price
FROM (
	SELECT *
	FROM menu
	WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
) AS name
JOIN pizzeria 
ON name.pizzeria_id = pizzeria.id
WHERE name.pizza_name IS NOT NULL
ORDER BY 1,2
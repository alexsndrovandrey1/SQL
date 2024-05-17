SELECT person.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'cheese pizza')
GROUP BY person.name
HAVING COUNT(DISTINCT menu.pizza_name) = 2
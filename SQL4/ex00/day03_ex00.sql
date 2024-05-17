SELECT menu.pizza_name, menu.price, pizzeria.name, visit_date
FROM person_visits pv
JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN person ON pv.person_id = person.id
WHERE (menu.price BETWEEN 800 AND 1000) AND person.name = 'Kate'
ORDER BY 1, 2, 3
SELECT p.address, pizzeria.name, COUNT(*) AS count_of_orders
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY p.address, pizzeria.name
ORDER BY 1, 2
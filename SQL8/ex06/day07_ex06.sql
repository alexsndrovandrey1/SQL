SELECT pizzeria.name, COUNT(*) AS count_of_orders, ROUND(AVG(menu.price), 2) AS average_price, MAX(menu.price) AS max_price, MIN(menu.price) AS min_price
FROM person_order po
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 1

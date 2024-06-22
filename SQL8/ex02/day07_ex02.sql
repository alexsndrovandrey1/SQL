(SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
FROM person_order po
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC, 1
LIMIT 3)

UNION

(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC, 1
LIMIT 3)

ORDER BY 3, 2 DESC

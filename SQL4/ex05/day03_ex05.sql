SELECT pizzeria.name
FROM person_visits pv
FULL JOIN person_order po ON pv.visit_date = po.order_date
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN person ON pv.person_id = person.id
WHERE person.name = 'Andrey' AND po.order_date IS NULL
ORDER BY 1
SELECT pizzeria.name
FROM person_order po
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON po.person_id = person.id
WHERE person.gender = 'female'

EXCEPT

SELECT pizzeria.name
FROM person_order po
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON po.person_id = person.id
WHERE person.gender = 'male'

ORDER BY 1
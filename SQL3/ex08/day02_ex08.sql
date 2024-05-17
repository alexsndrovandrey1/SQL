SELECT person.name
FROM person_order po
JOIN person ON po.person_id = person.id
JOIN menu ON po.menu_id = menu.id
WHERE person.gender = 'male' AND person.address IN ('Moscow','Samara') AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY person.name DESC
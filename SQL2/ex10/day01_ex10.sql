SELECT
  person.name AS person_name,
  menu.pizza_name,
  pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person.id=person_order.person_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name
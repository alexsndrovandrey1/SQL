INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT 
	ROW_NUMBER() OVER() AS id, po.person_id, menu.pizzeria_id,
	CASE 
		WHEN COUNT(po.person_id) = 1 THEN 10.5
		WHEN COUNT(po.person_id) = 2 THEN 22
		ELSE 30
	END discount
FROM person_order po
JOIN menu ON po.menu_id = menu.id
GROUP BY po.person_id, menu.pizzeria_id
ORDER BY person_id;


-- Проверка скидки --
SELECT p.name, pizzeria.name AS pizzeria, discount
FROM person_discounts pd
JOIN person p ON pd.person_id = p.id
JOIN pizzeria ON pd.pizzeria_id = pizzeria.id;
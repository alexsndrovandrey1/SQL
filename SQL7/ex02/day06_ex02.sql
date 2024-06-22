SELECT p.name, menu.pizza_name, menu.price, 
	   ROUND(menu.price - ((menu.price * pd.discount) / 100)) AS discount_price, pizzeria.name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_discounts pd ON pd.pizzeria_id = pizzeria.id AND pd.person_id = p.id
ORDER BY 1,2;
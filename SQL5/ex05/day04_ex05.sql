CREATE VIEW v_price_with_discount AS
	SELECT person.name,  menu.pizza_name, menu.price, ROUND(menu.price - menu.price * 0.1) AS discount_price
	FROM person_order po
	JOIN person ON po.person_id = person.id
	JOIN menu ON po.menu_id = menu.id
	ORDER BY 1,2;
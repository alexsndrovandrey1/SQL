SELECT order_date, CONCAT(tp.name, ' (age:', tp.age, ')') AS person_information
FROM person_order
NATURAL JOIN
	(
		SELECT id as person_id, name, age
		FROM person
	) AS tp
ORDER BY order_date, name;
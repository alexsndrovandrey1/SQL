SELECT person_order.order_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order
JOIN person ON person.id = person_order.person_id
ORDER BY person_order.order_date, person_information;
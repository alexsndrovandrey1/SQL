CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR = 'Dmitriy', pprice INTEGER = 500, pdate DATE = '2022-01-08')
RETURNS TABLE (
		pizzeria_name VARCHAR
) AS $$
	BEGIN
		RETURN QUERY
				SELECT DISTINCT pizza.name 
				FROM person_visits pv
				JOIN person p ON pv.person_id = p.id
				JOIN pizzeria pizza ON pv.pizzeria_id = pizza.id
				JOIN menu m ON pizza.id = m.id
				WHERE p.name = pperson AND pv.visit_date = pdate AND m.price < pprice;
	END;
		 $$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
			
		
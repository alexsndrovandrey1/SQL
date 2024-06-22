DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR = 'female')
RETURNS TABLE
	(
		id BIGINT,
		name VARCHAR,
		age INTEGER,
		gender VARCHAR,
		address VARCHAR
	) AS $$ (SELECT * FROM person WHERE gender = pgender); $$
LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();


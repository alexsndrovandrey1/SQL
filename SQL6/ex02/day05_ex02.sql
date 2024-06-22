CREATE INDEX idx_person_name ON person(UPPER(name))

SET enable_seqscan TO ON;
EXPLAIN ANALYZE
	SELECT name, age, gender
	FROM person
	WHERE UPPER(name)= 'ANDREY'

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
	SELECT name, age, gender
	FROM person
	WHERE UPPER(name)= 'ANDREY'

CREATE TABLE person_audit
(
	created TIMESTAMP default CURRENT_TIMESTAMP NOT NULL,
	type_event char(1) default 'I' NOT NULL,
	row_id BIGINT NOT NULL,
	name VARCHAR,
	age INTEGER,
	gender VARCHAR,
	address VARCHAR,
	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $person_audit$
BEGIN
	INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
	VALUES('I', new.id, new.name, new.age, new.gender, new.address);
	RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
	AFTER
	INSERT ON person
	FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;
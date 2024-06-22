COMMENT ON TABLE person_discounts IS 'This table stores information about personal discounts for customers.';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for the discount entry.';
COMMENT ON COLUMN person_discounts.person_id IS 'Identifier of the person (customer) for whom the discount is applicable.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier of the pizzeria where the discount is applicable.';
COMMENT ON COLUMN person_discounts.discount IS 'The percentage of discount applicable for the person at the respective pizzeria.';
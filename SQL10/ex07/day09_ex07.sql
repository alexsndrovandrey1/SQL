CREATE OR REPLACE FUNCTION func_minimum(arr NUMERIC[])
RETURNS NUMERIC AS $$
DECLARE
    min_value NUMERIC;
BEGIN
    SELECT MIN(unnest_arr) INTO min_value
    FROM unnest(arr) AS unnest_arr;
    
    RETURN min_value;
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

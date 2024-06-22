CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER = 10) 
RETURNS TABLE(numric INTEGER) AS $$ 
    WITH RECURSIVE fibo(n1, n2) AS (
        VALUES (0, 1)
        UNION ALL
        SELECT n2,
            n1 + n2
        FROM fibo
        WHERE n2 < pstop)
    SELECT n1  FROM fibo;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

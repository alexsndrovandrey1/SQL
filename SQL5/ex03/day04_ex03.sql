SELECT DISTINCT v.generate_date AS missing
FROM person_visits pv
RIGHT JOIN v_generated_dates v ON v.generate_date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY 1
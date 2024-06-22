SELECT p.address,
	   ROUND(MAX(p.age) - (MIN(p.age)* 1.0 / MAX(p.age)),2) AS formula,
	   ROUND(AVG(p.age),2) AS average,
	   CASE
	   		WHEN ROUND(MAX(p.age) - (MIN(p.age) / MAX(p.age)),2) > ROUND(AVG(p.age),2) THEN 'true' ELSE 'false'
	   END comparison
FROM person p
GROUP BY p.address
ORDER BY 1;
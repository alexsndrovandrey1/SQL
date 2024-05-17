SELECT menu.id
FROM menu
LEFT JOIN person_order po ON menu.id = po.menu_id
WHERE po.menu_id IS NULL
ORDER BY 1
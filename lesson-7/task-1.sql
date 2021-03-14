USE shop;

SELECT
    id, name
FROM 
    users
WHERE
    EXISTS (SELECT 1 FROM orders WHERE id = users.id)
GROUP BY
    id
ORDER BY
    name;

SELECT users.first_name, users.last_name, COUNT(IF(address.main = 1, 1, NULL)) AS "main", COUNT(IF(address.main = 1, NULL, 1)) AS "other"
FROM users
LEFT OUTER JOIN orders on users.id=orders.customer_id
LEFT OUTER JOIN address on orders.delivery_address_id=address.id
GROUP BY users.id, users.first_name, users.last_name
HAVING COUNT(IF(address.main = 1, 1, NULL)) > 40 AND COUNT(IF(address.main = 1, NULL, 1))
ORDER BY main ASC;
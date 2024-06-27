SELECT users.first_name, users.last_name, COUNT(orders.rider_id) AS "deliveries"
FROM rider
LEFT OUTER JOIN users on rider.user_id=users.id
RIGHT OUTER JOIN orders on rider.id=orders.rider_id
GROUP BY first_name, last_name
ORDER BY deliveries DESC
LIMIT 3;
SELECT orders.id, SUM(order_item.quantity * food_item.price) AS "items total", 
    CASE
        WHEN SUM(order_item.quantity * food_item.price) < 10 THEN 3
        WHEN SUM(order_item.quantity * food_item.price) < 20 THEN 2
        WHEN SUM(order_item.quantity * food_item.price) < 30 THEN 1
        ELSE 0
    END AS "delivery",
     (SUM(order_item.quantity * food_item.price) +
       CASE
           WHEN SUM(order_item.quantity * food_item.price) < 10 THEN 3
           WHEN SUM(order_item.quantity * food_item.price) < 20 THEN 2
           WHEN SUM(order_item.quantity * food_item.price) < 30 THEN 1
           ELSE 0
       END) AS "total", orders.delivery_charge AS "stored delivery charge", orders.total_price AS "stored total" 
FROM orders
LEFT OUTER JOIN order_item on orders.id=order_item.order_id
LEFT OUTER JOIN food_item on order_item.food_item_id=food_item.id
GROUP BY orders.id, orders.delivery_charge, orders.total_price
HAVING 
    (SUM(order_item.quantity * food_item.price) +
    CASE
        WHEN SUM(order_item.quantity * food_item.price) < 10 THEN 3
        WHEN SUM(order_item.quantity * food_item.price) < 20 THEN 2
        WHEN SUM(order_item.quantity * food_item.price) < 30 THEN 1
        ELSE 0
    END) != orders.total_price;
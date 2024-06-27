SELECT 
    COALESCE(ROUND(AVG(quality), 1), 'No rating available') AS "average quality",
    COALESCE(ROUND(AVG(delivery), 1), 'No rating available') AS "average delivery",
    COALESCE(ROUND(AVG(satisfaction), 1), 'No rating available') AS "average satisfaction"
FROM ratings
LEFT OUTER JOIN orders on orders.id=ratings.order_id
WHERE restaurant_id = 1 AND order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 4 WEEK);

SELECT 
    COALESCE(ROUND(AVG(quality), 1), 'No rating available') AS "average quality",
    COALESCE(ROUND(AVG(delivery), 1), 'No rating available') AS "average delivery",
    COALESCE(ROUND(AVG(satisfaction), 1), 'No rating available') AS "average satisfaction"
FROM ratings
LEFT OUTER JOIN orders on orders.id=ratings.order_id
WHERE rider_id = 1 AND order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 10 DAY);
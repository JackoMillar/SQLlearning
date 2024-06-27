SELECT restaurant.name AS "restaurant", food_item.name
FROM restaurant
LEFT OUTER JOIN food_item ON restaurant.id=food_item.restaurant_id
WHERE NOT EXISTS (
SELECT 1
FROM order_item
WHERE order_item.food_item_id=food_item.id
);
SELECT restaurant.name AS "restaurant", food_item.name AS "item", food_item.price
FROM restaurant
LEFT OUTER JOIN food_item on restaurant.id=food_item.restaurant_id
WHERE NOT EXISTS (
SELECT 1
FROM food_item
WHERE restaurant.id=food_item.restaurant_id
AND food_item.price <= 10
);
--- Removing Duplicates

SELECT order_id, product_id, quantity, sales, COUNT(*) AS total_duplicates
FROM Superstore
GROUP BY order_id, product_id, quantity, sales
HAVING COUNT(*) > 1;

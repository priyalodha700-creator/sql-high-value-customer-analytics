
WITH high_value_customers AS (
    SELECT 
        customer_id, 
        SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
    HAVING SUM(order_amount) > 50000
)
SELECT 
    c.customer_name, 
    h.total_spent
FROM high_value_customers h
JOIN customers c ON c.customer_id = h.customer_id
ORDER BY h.total_spent DESC;

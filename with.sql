WITH ranked_customers AS (
    SELECT 
        c.region,
        c.customer_name,
        SUM(o.order_amount) AS total_spent,
        DENSE_RANK() OVER (
            PARTITION BY c.region 
            ORDER BY SUM(o.order_amount) DESC
        ) AS rnk
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY c.region, c.customer_id, c.customer_name
)
SELECT region, customer_name, total_spent
FROM ranked_customers
WHERE rnk <= 3
ORDER BY region, rnk;

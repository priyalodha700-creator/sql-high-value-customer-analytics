# 📊 High-Value Customer SQL Analytics

An optimized SQL solution designed to identify high-value enterprise/retail customers by aggregating lifetime order values using Common Table Expressions (CTEs) and performance-focused join logic.

---

## 🎯 Objective
Business teams often need to segment customers who cross a specific spend threshold (e.g., total spend > $50,000) for VIP loyalty programs, targeted marketing, or revenue forecasting. This query efficiently filters, aggregates, and retrieves top spender details.

---

## 💻 SQL Query

```sql
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

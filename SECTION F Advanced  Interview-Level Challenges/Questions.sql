##SECTION-F 26."For each customer, show their latest order date(include customers with no orders)."##
SELECT
    c.customer_id,
    c.full_name,
    MAX(o.order_date) AS latest_order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.full_name;
--------------------------------------------------------------------------------------------------------
##SECTION-F 27."For each category, find the top-selling product"##
SELECT
    category_name,
    product_name,
    total_quantity_sold
FROM (
    SELECT
        c.category_name,
        p.product_name,
        SUM(oi.quantity) AS total_quantity_sold,
        ROW_NUMBER() OVER (
            PARTITION BY c.category_name
            ORDER BY SUM(oi.quantity) DESC
        ) AS rn
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
    JOIN categories c
        ON p.category_id = c.category_id
    GROUP BY
        c.category_name,
        p.product_name
) ranked_products
WHERE rn = 1;
--------------------------------------------------------------------------------------------------------
##SECTION-F 28."Find customers who bought products from at least two different categories."##
SELECT
    c.customer_id,
    c.full_name,
    COUNT(DISTINCT p.category_id) AS category_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.full_name
HAVING
    COUNT(DISTINCT p.category_id) >= 2;
--------------------------------------------------------------------------------------------------------
##SECTION-F 26."Identify repeat customers with more than one order"##
SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.full_name
HAVING
    COUNT(o.order_id) > 1;
--------------------------------------------------------------------------------------------------------
##SECTION-F 30."Generate monthly revenue trend."##
SELECT
    DATE_FORMAT(o.order_date, '%M-%Y') AS order_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    DATE_FORMAT(o.order_date, '%M-%Y')
ORDER BY
    order_month;
--------------------------------------------------------------------------------------------------------



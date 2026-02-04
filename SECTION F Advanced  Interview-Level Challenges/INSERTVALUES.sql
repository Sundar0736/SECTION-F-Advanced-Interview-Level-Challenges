INSERT INTO customers (customer_id, full_name, city) VALUES
(1,'Asha Kumar','Bangalore'),
(2,'Ravi Menon','Chennai'),
(3,'Neha Singh','Hyderabad'),
(4,'Imran Ali','Bangalore'),
(5,'Priya Iyer','Chennai'),
(6,'Karthik Rao','Pune');

INSERT INTO categories (category_id, category_name) VALUES
(10,'Electronics'),
(20,'Fashion'),
(30,'Home'),
(40,'Books'),
(50,'Beauty');

INSERT INTO products (product_id, product_name, category_id) VALUES
(101,'Wireless Mouse',10),
(102,'USB-C Charger',10),
(103,'T-Shirt',20),
(104,'Jeans',20),
(105,'Water Bottle',30),
(106,'Cooking Pan',30),
(107,'Novel - Mystery',40),
(108,'Face Wash',50);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001,1,'2026-01-05','Delivered'),
(1002,2,'2026-01-06','Delivered'),
(1003,1,'2026-01-10','Shipped'),
(1004,3,'2026-01-11','Cancelled'),
(1005,4,'2026-01-12','Delivered'),
(1006,5,'2026-01-14','Delivered'),
(1007,6,'2026-01-15','Created'),
(1008,2,'2026-01-16','Delivered'),
(1009,3,'2026-01-17','Delivered'),
(1010,5,'2026-01-18','Delivered');

-- NOTE: 1007 intentionally has NO items (for data quality question)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1001,101,1,799.00),
(1001,102,1,999.00),

(1002,103,2,499.00),
(1002,105,1,299.00),

(1003,104,1,1499.00),

(1004,107,1,399.00),

(1005,106,1,1299.00),
(1005,108,2,249.00),

(1006,101,1,799.00),
(1006,103,1,499.00),

(1008,102,1,999.00),
(1008,105,2,299.00),

(1009,107,3,399.00),

(1010,106,1,1299.00),
(1010,104,1,1499.00);

-- Payments: include unpaid, partial, and multi-pay orders
INSERT INTO payments (payment_id, order_id, paid_amount, payment_date, payment_method) VALUES
(1,1001,1798.00,'2026-01-05','UPI'),        -- fully paid
(2,1002,1297.00,'2026-01-06','Card'),       -- fully paid
(3,1003,500.00,'2026-01-10','UPI'),         -- shipped, partial (order total 1499)
(4,1005,1000.00,'2026-01-12','Card'),       -- delivered, partial
(5,1005,797.00,'2026-01-13','UPI'),         -- delivered, second payment (now full 1797)
(6,1006,1298.00,'2026-01-14','Card'),       -- fully paid
(7,1008,500.00,'2026-01-16','UPI'),         -- delivered, partial
(8,1009,1197.00,'2026-01-17','Card');       -- fully paid
-- 1010 is delivered but unpaid (no payment rows)

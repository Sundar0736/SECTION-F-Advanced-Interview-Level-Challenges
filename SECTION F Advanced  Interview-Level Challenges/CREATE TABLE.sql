CREATE TABLE customers (
customer_id INT PRIMARY KEY,
full_name VARCHAR(100),
city VARCHAR(50)
);
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE categories (
category_id INT PRIMARY KEY,
category_name VARCHAR(50)
);
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category_id INT,
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE order_items (
order_id INT,
product_id INT,
quantity INT,
unit_price DECIMAL(10,2),
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE payments (
payment_id INT PRIMARY KEY,
order_id INT,
paid_amount DECIMAL(10,2),
payment_date DATE,
payment_method VARCHAR(20),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
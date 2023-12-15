CREATE SCHEMA IF NOT EXISTS source; 
DROP TABLE IF EXISTS source.customers; 
CREATE TABLE source.customers (
    customer_id INT,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    email   VARCHAR(100),
    gender  VARCHAR(50),
    city   VARCHAR(100),
    race VARCHAR(100), 
    current_customer_status VARCHAR(100), 
    created_date DATE,
    last_modified_date DATE

);
DROP TABLE IF EXISTS source.orders;
CREATE TABLE source.orders (
    customer_id INT,	
    customer_status VARCHAR(50),
    order_date DATE,	
    delivery_date DATE,	
    order_id INT,	
    product_id BIGINT,	
    quantity INT,	
    price MONEY,	
    cost_price_per_unit MONEY
);
DROP TABLE IF EXISTS source.products;
CREATE TABLE source.products (
    product_id  BIGINT,
    product_line VARCHAR(100),
    product_category VARCHAR(100),
    product_group   VARCHAR(100),
    product_name    VARCHAR(100),
    supplier_country VARCHAR(2),
    supplier_name VARCHAR(100),
    supplier_id INT
);
DROP TABLE IF EXISTS source.payments;
CREATE TABLE source.payments (
    order_id BIGINT, 
    payment_id BIGINT, 
    payment_method VARCHAR(100)
);
COPY source.customers(customer_id,first_name,last_name,email,gender,city,race,current_customer_status,last_modified_date,created_date)
FROM '/input_data/customers.csv' DELIMITER ',' CSV HEADER;
COPY source.orders(customer_id,customer_status,order_date,delivery_date,order_id,product_id,quantity,price,cost_price_per_unit)
FROM '/input_data/orders.csv' DELIMITER ',' CSV HEADER;
COPY source.products(product_id,product_line,product_category,product_group,product_name,supplier_country,supplier_name,supplier_id)
FROM '/input_data/product-supplier.csv' DELIMITER ',' CSV HEADER;
COPY source.payments(order_id,payment_id,payment_method)
FROM '/input_data/payments.csv' DELIMITER ',' CSV HEADER;
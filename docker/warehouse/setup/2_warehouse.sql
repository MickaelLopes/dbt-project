CREATE SCHEMA IF NOT EXISTS warehouse;
DROP TABLE IF EXISTS warehouse.dim_customers; 
CREATE TYPE gender_type AS ENUM ('Male', 'Female', 'Other');
CREATE TABLE warehouse.dim_customers ( 
    customer_id INT, 
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    email   VARCHAR(100),
    gender  gender_type,
    race VARCHAR(100)
);


DROP TABLE IF EXISTS warehouse.fct_customers_orders;
CREATE TABLE warehouse.fct_customers_orders (
    customer_id INT, 
    purchased_month DATE,
    number_of_purchases INT, 
    amount_of_purchases MONEY
);

DROP TABLE IF EXISTS  warehouse.dim_products; 
CREATE TABLE  warehouse.dim_products(
    product_id BIGINT, 
    product_line VARCHAR(100),
    product_category VARCHAR(100),
    product_group   VARCHAR(100),
    product_name    VARCHAR(100),
    supplier_country VARCHAR(2),
    supplier_name VARCHAR(100),
    supplier_id INT
);

DROP TABLE IF EXISTS warehouse.fct_products_orders; 
CREATE TABLE warehouse.fct_products_orders(
    product_id BIGINT, 
    purchased_month DATE,
    quantities_purchased INT, 
    purchased_price MONEY, 
    cost_price MONEY, 
    benefit MONEY
);



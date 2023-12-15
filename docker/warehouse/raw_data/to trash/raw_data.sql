CREATE SCHEMA IF NOT EXISTS raw; 
DROP TABLE IF EXISTS raw.customers; 
CREATE TABLE raw.customers (
    id VARCHAR(50), 
    name VARCHAR(100)
);

DROP TABLE IF EXISTS raw.items; 
CREATE TABLE raw.items (
    id VARCHAR(50), 
    order_id VARCHAR(50), 
    sku VARCHAR(10) 
);

DROP TABLE IF EXISTS raw.orders; 
CREATE TABLE raw.orders (
    id VARCHAR(50),
    customer VARCHAR(50),
    ordered_at VARCHAR(50),
    store_id VARCHAR(50),
    subtotal INT,
    tax_paid INT,
    order_total INT
);

DROP TABLE IF EXISTS raw.products; 
CREATE TABLE raw.products (
    sku VARCHAR(50), 
    name VARCHAR(100), 
    type VARCHAR(50), 
    price INT, 
    description VARCHAR(255)
);

DROP TABLE IF EXISTS raw.stores; 
CREATE TABLE raw.stores (
    id VARCHAR(50),
    name VARCHAR(50),
    opened_at VARCHAR(25),
    tax_rate NUMERIC(5,4)
);

DROP TABLE IF EXISTS raw.supplies; 
CREATE TABLE raw.supplies (
    id VARCHAR(50),
    name VARCHAR(100),
    cost INT,
    perishable VARCHAR(10),
    sku VARCHAR(50)
);


COPY raw.customers(id,name)
FROM '/input_data/raw_customers.csv' DELIMITER ',' CSV HEADER;
COPY raw.items(id,order_id,sku)
FROM '/input_data/raw_items.csv' DELIMITER ',' CSV HEADER;
COPY raw.orders(id,customer,ordered_at, store_id, subtotal, tax_paid, order_total)
FROM '/input_data/raw_orders.csv' DELIMITER ',' CSV HEADER;
COPY raw.products(sku,name,type,price,description)
FROM '/input_data/raw_products.csv' DELIMITER ',' CSV HEADER;
COPY raw.stores(id,name,opened_at,tax_rate)
FROM '/input_data/raw_stores.csv' DELIMITER ',' CSV HEADER;
COPY raw.supplies(id,name,cost,perishable,sku)
FROM '/input_data/raw_supplies.csv' DELIMITER ',' CSV HEADER;
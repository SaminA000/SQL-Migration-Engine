SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS reviews, order_items, orders, products, sellers, buyers, countries;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE buyers (
    buyer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    country_id INT,
    card_num VARCHAR(255),
    card_exp VARCHAR(255),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(255),
    seller_address VARCHAR(255),
    seller_city VARCHAR(255),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255),
    price DECIMAL(10,2),
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    buyer_id INT,
    order_date DATE,
    FOREIGN KEY (buyer_id) REFERENCES buyers(buyer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    buyer_id INT,
    rating INT,
    review_text TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (buyer_id) REFERENCES buyers(buyer_id)
);
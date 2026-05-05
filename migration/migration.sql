INSERT INTO countries (country_name)
SELECT DISTINCT country FROM denormalized_orders
UNION
SELECT DISTINCT seller_country FROM denormalized_orders;

INSERT INTO buyers (buyer_id, first_name, last_name, email, address, city, country_id, card_num, card_exp)
SELECT d.buyer_id, MAX(d.first_name), MAX(d.last_name), MAX(d.email), MAX(d.address), MAX(d.city), MAX(c.country_id), MAX(d.cc_number), MAX(d.cc_exp)
FROM denormalized_orders d
JOIN countries c ON d.country = c.country_name
GROUP BY d.buyer_id;

INSERT INTO sellers (seller_id, seller_name, seller_address, seller_city, country_id)
SELECT d.seller_id, MAX(d.seller_name), MAX(d.seller_name), MAX(d.seller_country), MAX(c.country_id)
FROM denormalized_orders d
JOIN countries c ON d.seller_country = c.country_name
GROUP BY d.seller_id;

INSERT INTO products (product_id, product_name, product_category, price, seller_id)
SELECT product_id, MAX(product_name), 'General', MAX(product_price), MAX(seller_id)
FROM denormalized_orders
GROUP BY product_id;

INSERT INTO orders (order_id, buyer_id, order_date)
SELECT order_id, MAX(buyer_id), MAX(order_date)
FROM denormalized_orders
GROUP BY order_id;

INSERT INTO order_items (order_id, product_id, quantity)
SELECT order_id, product_id, 1
FROM denormalized_orders;

INSERT INTO reviews (product_id, buyer_id, rating, review_text)
SELECT product_id, buyer_id, rating, 'No review text provided'
FROM denormalized_orders
WHERE rating IS NOT NULL;
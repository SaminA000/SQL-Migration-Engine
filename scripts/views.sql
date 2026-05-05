CREATE VIEW top_rated_products AS
SELECT p.product_name, AVG(r.rating) AS avg_rating
FROM products p
JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id
HAVING avg_rating >= 4;

CREATE VIEW top_five_buyer_cities AS
SELECT b.city, COUNT(o.order_id) AS order_count
FROM buyers b
JOIN orders o ON b.buyer_id = o.buyer_id
GROUP BY b.city
ORDER BY order_count DESC
LIMIT 5;

CREATE VIEW seller_sales_tiers AS
SELECT s.seller_name, SUM(p.price * oi.quantity) AS total_sales,
CASE 
    WHEN SUM(p.price * oi.quantity) > 10000 THEN 'Platinum'
    WHEN SUM(p.price * oi.quantity) BETWEEN 5000 AND 10000 THEN 'Gold'
    ELSE 'Silver'
END AS tier
FROM sellers s
JOIN products p ON s.seller_id = p.seller_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY s.seller_id;
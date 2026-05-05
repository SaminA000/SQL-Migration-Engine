DELIMITER //
CREATE PROCEDURE top_ten_for_country(IN c_name VARCHAR(255))
BEGIN
    SELECT b.first_name, b.last_name, SUM(p.price * oi.quantity) AS total_spent
    FROM buyers b
    JOIN countries c ON b.country_id = c.country_id
    JOIN orders o ON b.buyer_id = o.buyer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE c.country_name = c_name
    GROUP BY b.buyer_id
    ORDER BY total_spent DESC
    LIMIT 10;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buyer_for_date(IN f_name VARCHAR(255), IN l_name VARCHAR(255), IN o_date DATE)
BEGIN
    SELECT b.first_name, b.last_name, p.product_name, oi.quantity
    FROM buyers b
    JOIN orders o ON b.buyer_id = o.buyer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE b.first_name = f_name AND b.last_name = l_name AND o.order_date = o_date;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sales_for_month(IN m INT, IN y INT)
BEGIN
    SELECT SUM(p.price * oi.quantity) AS monthly_revenue
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE MONTH(o.order_date) = m AND YEAR(o.order_date) = y;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE top_products_for_seller(IN s_name VARCHAR(255))
BEGIN
    SELECT p.product_name, SUM(oi.quantity) AS total_sold
    FROM products p
    JOIN sellers s ON p.seller_id = s.seller_id
    JOIN order_items oi ON p.product_id = oi.product_id
    WHERE s.seller_name = s_name
    GROUP BY p.product_id
    ORDER BY total_sold DESC
    LIMIT 5;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE seller_running_totals(IN s_name VARCHAR(255))
BEGIN
    SELECT o.order_date, SUM(p.price * oi.quantity) OVER (ORDER BY o.order_date) AS running_total
    FROM sellers s
    JOIN products p ON s.seller_id = p.seller_id
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE s.seller_name = s_name;
END //
DELIMITER ;
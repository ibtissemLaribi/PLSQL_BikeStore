BEGIN
  avg_price_per_customer;
  
  FOR customer_rec IN (SELECT c.customer_id,
                              c.first_name,
                              c.last_name,
                              ROUND(AVG(t.order_price), 2) AS avg_price
                       FROM customers c
                       INNER JOIN orders o ON o.customer_id = c.customer_id
                       INNER JOIN (
                         SELECT order_id, SUM(list_price * (1 - discount) * quantity) AS order_price
                         FROM order_items
                         GROUP BY order_id
                       ) t ON o.order_id = t.order_id
                       GROUP BY c.customer_id, c.first_name, c.last_name)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Client: ' || customer_rec.first_name || ' ' || customer_rec.last_name || ', Prix moyen par commande: ' || customer_rec.avg_price);
  END LOOP;
END;


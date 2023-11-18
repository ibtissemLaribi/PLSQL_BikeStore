 --Affichez nombre de commande faite (order_date de orders) durant le mois de mars 2016.
DECLARE
    v_count NUMBER;
BEGIN
    tp_bikestore_product.count_orders_between_dates(DATE '2016-03-01', DATE '2016-03-31', v_count);
    DBMS_OUTPUT.PUT_LINE('Le nombre de commandes entre le 1er mars 2016 et le 31 mars 2016 est : ' || v_count);
END;

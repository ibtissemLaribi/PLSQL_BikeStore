
-- Affichez le nombre de produits, par année (model_year), dont le prix (list_price de products) est plus grand que la moyenne des prix des produits de la même année.
DECLARE
    v_cursor SYS_REFCURSOR;
    v_model_year NUMBER;
    v_count NUMBER;
BEGIN
    v_cursor := tp_bikestore_product.get_products_count_by_year;
    LOOP
        FETCH v_cursor INTO v_model_year, v_count;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Année : ' || v_model_year || ', Nombre de produits : ' || v_count);
    END LOOP;
    CLOSE v_cursor;
END;

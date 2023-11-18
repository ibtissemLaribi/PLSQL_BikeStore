DECLARE
    v_brand_name brands.brand_name%TYPE;
    v_product_count NUMBER;
BEGIN
    -- Appeler la procédure count_products_by_brand pour compter les produits par marque
    TP_BIKESTORE_Product.count_products_by_brand;
DBMS_OUTPUT.PUT_LINE('Le nombre de produit par Marque :');
    -- Affichage des résultats
    FOR brand_rec IN (
        SELECT b.brand_name, COUNT(p.product_name) AS nombre_produit
        FROM brands b
        INNER JOIN products p ON b.brand_id = p.brand_id
        GROUP BY b.brand_name
    ) LOOP
        v_brand_name := brand_rec.brand_name;
        v_product_count := brand_rec.nombre_produit;
        DBMS_OUTPUT.PUT_LINE(v_brand_name || ': ' || v_product_count || ' produits');
    END LOOP;
END;
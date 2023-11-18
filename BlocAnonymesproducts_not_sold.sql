DECLARE
    -- Déclaration des types de table
    TYPE product_ids_t IS TABLE OF products.product_id%TYPE;
    unsold_product_ids product_ids_t;

    -- Variables pour le traitement des exceptions
    v_exception_message VARCHAR2(200);
BEGIN
    -- Appeler la procédure products_not_sold pour récupérer les produits non vendus
    TP_BIKESTORE_Product.products_not_sold;

    -- Récupérer les product_id non vendus après l'exécution de la procédure
    SELECT product_id BULK COLLECT INTO unsold_product_ids FROM products;

    -- Afficher les product_id non vendus
    IF unsold_product_ids.COUNT > 0 THEN
        FOR i IN 1..unsold_product_ids.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Unsold Product ID: ' || unsold_product_ids(i));
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Aucun produit non vendu trouvé.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_exception_message := 'Aucune donnée trouvée pour les produits non vendus.';
        RAISE_APPLICATION_ERROR(-20005, v_exception_message);
    WHEN OTHERS THEN
        v_exception_message := 'Erreur inattendue lors du traitement des produits non vendus : ' || SQLERRM;
        RAISE_APPLICATION_ERROR(-20006, v_exception_message);
END;

DECLARE
    -- Variable pour stocker les noms de marque
    v_brand_names SYS.ODCIVARCHAR2LIST;

    -- Variable pour stocker les nombres de ventes
    v_counts SYS.ODCINUMBERLIST;

    -- Variables pour le traitement des exceptions
    v_exception_message VARCHAR2(200);
BEGIN
    -- Appeler la fonction GetSalesByBrand pour récupérer les noms de marque
    v_brand_names := TP_BIKESTORE_Product.GetSalesByBrand;


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_exception_message := 'Aucune donnée trouvée.';
        RAISE_APPLICATION_ERROR(-20007, v_exception_message);
    WHEN OTHERS THEN
        v_exception_message := 'Erreur inattendue lors de la récupération des données : ' || SQLERRM;
        RAISE_APPLICATION_ERROR(-20008, v_exception_message);
END;

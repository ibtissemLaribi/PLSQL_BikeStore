DECLARE
  v_result SYS_REFCURSOR;
  v_brand_name VARCHAR2(100);
  v_category_name VARCHAR2(100);
  v_model_year NUMBER;
  v_sales NUMBER;
BEGIN
  TP_bikestore_product.getSalByBrandAndModelYear(v_result);
  
  LOOP
    FETCH v_result INTO v_brand_name, v_category_name, v_model_year, v_sales;
    EXIT WHEN v_result%NOTFOUND;
    
    -- Affichage Resultat
    DBMS_OUTPUT.PUT_LINE('Brand: ' || v_brand_name ||
                         ', Category: ' || v_category_name ||
                         ', Model Year: ' || v_model_year ||
                         ', Total Sales with discount: ' || v_sales);
  END LOOP;
  CLOSE v_result;
END;
/

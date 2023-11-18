DECLARE
  v_cursor SYS_REFCURSOR;
  v_store_id Stores.store_id%TYPE;
  v_store_name Stores.store_name%TYPE;
  v_employee_count NUMBER;
BEGIN

  v_cursor := tp_bikestore_customer.GetEmployeeCountByStore;

  
  LOOP
    FETCH v_cursor INTO v_store_id, v_store_name, v_employee_count;
    EXIT WHEN v_cursor%NOTFOUND;


    DBMS_OUTPUT.PUT_LINE('Store ID: ' || v_store_id || ', Store Name: ' || v_store_name || ', Employee Count: ' || v_employee_count);
  END LOOP;

  
  CLOSE v_cursor;
END;

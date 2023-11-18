DECLARE
  customer_names_list customer_names_array_t := customer_names_array_t();
BEGIN
  -- Appeler la procédure pour récupérer les noms de clients sans commandes en 2016
  tp_bikestore_customer.cust_without_orders_2016(customer_names_list);

  -- Affichage des noms des clients qui n'ont pas passé de commande en 2016
  FOR i IN 1..customer_names_list.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(customer_names_list(i));
  END LOOP;
END;


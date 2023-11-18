DECLARE
    -- D�clarer les variables pour les informations du client � mettre � jour
    v_customer_id customers.customer_id%TYPE := 123; -- Remplacez par l'ID du client que vous souhaitez mettre � jour
    v_phone customers.phone%TYPE := 'New phone';
    v_email customers.email%TYPE := 'nouvel@email.com';
BEGIN
    -- Afficher les informations du client avant la mise � jour
    SELECT customer_id, phone, email
    INTO v_customer_id, v_phone, v_email
    FROM customers
    WHERE customer_id = v_customer_id;

    DBMS_OUTPUT.PUT_LINE('Informations du client avant la mise � jour:');
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Phone: ' || v_phone);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);

    -- Appeler la proc�dure pour mettre � jour les informations du client
    BEGIN
        TP_BIKESTORE_CUSTOMER.update_customer_phone_email(
            p_customer_id => v_customer_id,
            p_phone => v_phone,
            p_email => v_email
        );
        DBMS_OUTPUT.PUT_LINE('Mise � jour r�ussie.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erreur lors de la mise � jour du client: ' || SQLERRM);
    END;

    -- Afficher les informations du client apr�s la mise � jour
    SELECT customer_id, phone, email
    INTO v_customer_id, v_phone, v_email
    FROM customers
    WHERE customer_id = v_customer_id;

    DBMS_OUTPUT.PUT_LINE('Informations du client apr�s la mise � jour:');
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Phone: ' || v_phone);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
END;

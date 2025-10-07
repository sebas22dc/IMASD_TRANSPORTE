CREATE USER KEYCLOACK IDENTIFIED BY "$KEYCLOACK" DEFAULT TABLESPACE DATA TEMPORARY TABLESPACE TEMP PROFILE DEFAULT ACCOUNT UNLOCK;





DECLARE
  TYPE t_users IS TABLE OF VARCHAR2(128);
  v_users t_users := t_users(
    'KEYCLOACK'
  );
BEGIN
  FOR i IN 1 .. v_users.COUNT LOOP
    -- Sesión y creación de objetos en su propio esquema
    EXECUTE IMMEDIATE
      'GRANT CREATE SESSION,
              CREATE TABLE,
              CREATE SEQUENCE,
              CREATE VIEW,
              CREATE PROCEDURE,
              CREATE TRIGGER,
              CREATE SYNONYM
         TO ' || v_users(i);

    -- Cuota en DATA para poder crear objetos (ajusta tablespace si usas otro)
    EXECUTE IMMEDIATE
      'ALTER USER ' || v_users(i) || ' QUOTA UNLIMITED ON DATA';
  END LOOP;
END;
/
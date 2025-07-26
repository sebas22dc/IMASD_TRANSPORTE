-- se ingresa al putty QA:
-- paso 1: sqlplus / as sysdba
-- Paso 2: startup;
-- paso 3: exit;
-- paso 4: lsnrctl start

-- /oradata/app/oracle/diag/rdbms/transporte/TRANSPORTE/trace


-- CREATE USER usr_dba_dev IDENTIFIED BY "VG4Bf5r1";
-- grant all privilegies to usr_dba_dev; 
-- GRANT UNLIMITED TABLESPACE TO usr_dba_dev;

-----
-- create user usr_dba_dev with 'VG4Bf5r1';
-- grant all privilegies to usr_dba_dev 


-- archivo cron chmod +x /home/oracle/scripts/Encender_bd.sh    




----matar todas las sesiones de oracle QA

--> este es el bueno
  BEGIN FOR s IN ( SELECT sid, serial# FROM v$session WHERE username IS NOT NULL AND username NOT IN ('SYS', 'SYSTEM') AND sid != SYS_CONTEXT('USERENV', 'SID')) LOOP EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION ''' || s.sid || ',' || s.serial# || ''' IMMEDIATE';END LOOP;END;

BEGIN
  FOR s IN (
    SELECT sid, serial#
    FROM v$session
    WHERE username IS NOT NULL
      AND username NOT IN ('SYS', 'SYSTEM') -- opcional: excluye cuentas críticas
      AND sid != SYS_CONTEXT('USERENV', 'SID') -- no mates tu propia sesión
  ) LOOP
    EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION ''' || s.sid || ',' || s.serial# || ''' IMMEDIATE';
  END LOOP;
END;
/

-----validar sesiones activas
SELECT sid, serial#, username, status, machine, program FROM v$session WHERE status = 'ACTIVE' AND username IS NOT NULL;
  

  SELECT * FROM v$session WHERE status='ACTIVE';
  SELECT status, COUNT(*) AS total FROM v$session GROUP BY status;




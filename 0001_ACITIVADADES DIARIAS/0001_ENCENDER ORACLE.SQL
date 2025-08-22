-- se ingresa al putty QA:
-- paso 1: sqlplus / as sysdba
-- Paso 2: startup;
-- paso 3: exit;
-- paso 4: lsnrctl start


----LIMPIEZA DE BD  DEV O QA

--ALTER TABLESPACE TEMP SHRINK TEMPFILE '/oradata/TRANSPORTE/temp01.dbf' KEEP 5000M;  --> intenta reducir el tamaño del tablespace temporal,
--SELECT tablespace_name,  SUM(bytes_used)/1024/1024 AS used_MB,  SUM(bytes_free)/1024/1024 AS free_MB FROM v$temp_space_header GROUP BY tablespace_name;

--ALTER DATABASE DATAFILE '/oradata2/transporte/DATA01.dbf' AUTOEXTEND ON NEXT 100M MAXSIZE 20G;--> aumentar el tamaño de la base de datos

SELECT tablespace_name, file_name, bytes/1024/1024 AS MB, autoextensible FROM dba_data_files WHERE tablespace_name = 'DATA';

SELECT tablespace_name, file_name, bytes/1024/1024 AS MB, autoextensible FROM dba_data_files WHERE tablespace_name = 'DATA';

SELECT tablespace_name,  SUM(bytes_used)/1024/1024 AS used_MB,  SUM(bytes_free)/1024/1024 AS free_MB FROM dba_data_files WHERE tablespace_name = 'DATA';
-- /oradata/app/oracle/diag/rdbms/transporte/TRANSPORTE/trace

SELECT
    tablespace_name,
    ROUND(used_space*8/1024, 2) AS used_mb,
    ROUND(tablespace_size*8/1024, 2) AS total_mb,
    ROUND((tablespace_size - used_space)*8/1024, 2) AS free_mb,
    ROUND((used_space/tablespace_size)*100, 2) AS pct_used
FROM dba_tablespace_usage_metrics
WHERE tablespace_name = 'DATA';



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





 
--  UPDATE PREP_CATALOGOS.BANNERAPP
-- SET BACTIVO = 0, BBAJA = 1

 
-- INSERT INTO PREP_CATALOGOS.COMISIONESPROVEEDORES 
-- (UIDCOMISIONPROVEEDOR, SCLAVE, DCOMISIONFIJA, DCOMISIONPORCENTAJE, DIVAFIJO, DIVAVARIABLE)
-- VALUES (
--     '3b8d69c3-2086-1c22-e063-0400000a79f9','SYGM', 0, 0, 16, 16);
-- commit;


-- SELECT tablespace_name, file_name, bytes/1024/1024 AS MB, MAXBYTES/1024/1024 AS MAXMB, autoextensible FROM dba_data_files WHERE tablespace_name = 'DATA';

-- select * from PREP_CATALOGOS.BANNERAPP WHERE BACTIVO =0;

-- select * from PREP_APPUSUARIOQQUERY.BANNERAPP WHERE BACTIVO =1; --f665f14e-0e46-41bc-9c1e-02c4383e077b

-- select * from COMERCIOCOMANDOS.DATOSADICIONALESMOVIMIENTOSESTADODECUENTA;

-- SELECT tablespace_name, file_name, bytes/1024/1024 AS MB, autoextensible FROM dba_data_files WHERE tablespace_name = 'DATA';
-- SELECT file_name, bytes/1024/1024 AS MB FROM dba_data_files WHERE tablespace_name = 'DATA';
-- -- ALTER DATABASE DATAFILE '/oradata2/transporte/DATA01.dbf' AUTOEXTEND ON NEXT 100M MAXSIZE 17G;
-- -- commit;
-- SELECT 
--   file_name,
--   autoextensible,
--   increment_by * TO_NUMBER(value) / 1024 / 1024 AS next_extent_MB,
--   maxbytes / 1024 / 1024 AS maxsize_MB,
--   bytes / 1024 / 1024 AS current_MB
-- FROM 
--   dba_data_files, 
--   v$parameter
-- WHERE 
--   v$parameter.name = 'db_block_size'
--   AND file_name LIKE '%DATA01.dbf';

-- SELECT
--   df.tablespace_name,
--   ROUND(SUM(df.bytes) / 1024 / 1024, 2) AS total_MB,
--   ROUND(SUM(df.bytes - NVL(fs.bytes, 0)) / 1024 / 1024, 2) AS used_MB,
--   ROUND(SUM(NVL(fs.bytes, 0)) / 1024 / 1024, 2) AS free_MB
-- FROM
--   dba_data_files df
-- LEFT JOIN
--   (SELECT tablespace_name, file_id, SUM(bytes) AS bytes
--    FROM dba_free_space
--    GROUP BY tablespace_name, file_id) fs
-- ON df.tablespace_name = fs.tablespace_name AND df.file_id = fs.file_id
-- WHERE
--   df.tablespace_name = 'DATA'
-- GROUP BY
--   df.tablespace_name;




SELECT t.DTFECHAENVIO
, COALESCE(c.SMONEDA, NULL)
, COALESCE(t.SESTADOOPERACION, NULL)
, c.DTARIFAMONTO
, CASE
WHEN r.SCLAVERIDANGO IS NOT NULL AND t.SRUTA IS NOT NULL THEN 1
ELSE 0
END
, r.SCLAVERIDANGO
, t.SRUTA
, COALESCE(t.SRUTA, NULL)
, t.DTFECHAOPERACION
, t.DTFECHACAMBIOESTADO
, CASE
WHEN ((t.SESTADOOPERACION = 'LIQUIDADO') 
AND (t.SESTADOOPERACION IS NOT NULL)) THEN 1
ELSE 0
END
FROM PREP_OPENLOOP.TRANSACCIONES t
INNER JOIN PREP_OPENLOOP.CARGOS c ON t.UIDTRANSACCION = c.UIDTRANSACCION
LEFT JOIN PREP_OPENLOOP.RUTAS r ON t.SIDRUTA = r.SCLAVERUTA
WHERE t.SFUENTEFINANCIAMIENTO = '886acb8f-9615-43a8-96e7-dc4c30577a96'--'57ff88d0-7772-419b-863a-fe7cb9ae3f90'
AND t.DTFECHAENVIO >= TO_TIMESTAMP('2025-08-02 13:24:53.4207377', 'YYYY-MM-DD HH24:MI:SS.FF')
AND t.BACTIVO = 1 
AND t.BBAJA = 0 
AND c.BACTIVO = 1 
AND c.BBAJA = 0



;
SELECT username,
       account_status,
       expiry_date,
       lock_date,
       profile,
       created
FROM   dba_users
    where USERNAME like '%SINCR%'
ORDER BY expiry_date NULLS LAST;

-- ALTER USER SINCRONIZADOR ACCOUNT UNLOCK;
conn SINCRONIZADOR/SINCRONIZADOR$

SELECT username, account_status, created, profile FROM dba_users WHERE username = 'QA_DBA'







-- será que me pueda apoyar eliminando estos parámetros DIAS_DESVINCULACION, MAX_TARJETAS_USUARIO, 
-- MONTO_MAXIMO_DIARIO_RECARGAS, MONTO_MAXIMO_TRANSFERENCIA_DIA, MONTO_MAXIMO_TRANSFERENCIA_OPERACION, 
-- MONTO_MINIMO_MONEDERO_ORIGEN, MONTO_MINIMO_TRANSFERENCIA, _MAX_TARJETAS_USUARIOS,
--   BASETARIFAGRAL de la tabla prep_app.parametros, 
--   pero igual respaldarlos para volverlos a colocar en la tabla una vez que finalice la prueba?
--    E igual, simular una intermitencia en la BD



MERGE INTO PREP_APPMONEDEROQUERY.ESTADODECUENTA dest
USING (
    SELECT T1.UIDMONEDERO, T1.UIDTIPOTARIFA, T1.ITIPOTARJETA
        FROM PREP_APPMONEDEROCOMMAND.ESTADODECUENTA t1
		INNER JOIN PREP_APPMONEDEROQUERY.ESTADODECUENTA t2 ON t1.UIDMONEDERO = t2.UIDMONEDERO
	WHERE t1.UIDTIPOTARIFA <> t2.UIDTIPOTARIFA OR t1.ITIPOTARJETA <> t2.ITIPOTARJETA
) src
ON (dest.UIDMONEDERO = src.UIDMONEDERO)
WHEN MATCHED THEN
    UPDATE SET dest.UIDTIPOTARIFA = src.UIDTIPOTARIFA, dest.ITIPOTARJETA = src.ITIPOTARJETA 
    commit;







ALTER TABLE SEGURIDAD.USUARIOS ADD BUSUARIOAPI NUMBER(1,0) NULL;
COMMENT ON COLUMN SEGURIDAD.USUARIOS.BUSUARIOAPI IS 'Campo para indicar que es un usuario para uso exclusivo de apis, no podran acceder al portal u otro sitio.';






SELECT username, account_status, created, profile FROM dba_users WHERE username LIKE 'PREP_APPTICKETS'
conn PREP_APPTICKETS/PREP_APPTICKETS$

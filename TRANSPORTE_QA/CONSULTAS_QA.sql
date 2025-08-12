
 
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
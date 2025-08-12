
MERGE INTO monederoconsultas.estadodecuenta m
USING (
SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
FROM credencializacion.tarjetas
WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
UPDATE SET
m.inumtarjeta = o.inumerotarjeta,
m.uidtarjeta = o.uidtarjeta,
m.spanhash = o.spanhash,
m.uidestatustarjeta = o.uidestatustarjeta,
m.uidmotivotarjeta = o.uidmotivo
WHERE  m.uidtarjeta != o.uidtarjeta;
-- COMMIT;
--266 ACTUALIZADOS


--------------------------------------------------

MERGE INTO app.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.spanhash = o.spanhash
        WHERE m.spanhash != o.spanhash;  
--commit;
--0 ACUALIZADOS

--------------------------------------------------
 MERGE INTO appmonederoquery.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE m.uidtarjeta != o.uidtarjeta; 
--        COMMIT;
--266 ACUALIZADOS
--------------------------------------------------
MERGE INTO appmonederocommand.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE m.uidtarjeta != o.uidtarjeta; 
        -- commit;
--266 ACUALIZADOS
     
--------------------------------------------------   
MERGE INTO sincronizador.monedero m
USING (
    SELECT inumerotarjeta, spanhash, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.spanhash = o.spanhash
        WHERE m.spanhash != o.spanhash;
--4,374 filas fusionadas.
        
        -- COMMIT;

--------------------------------------------------
MERGE INTO comercio.monederostarjetas m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.spanhash = o.spanhash,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        where m.uidtarjeta != o.uidtarjeta ; 
        -- COMMIT;
--216 filas fusionadas.

--------------------------------------------------        
MERGE INTO apptickets.estadodecuenta m
USING (
    SELECT inumerotarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta
        WHERE m.inumtarjeta != o.inumerotarjeta;   
-- COMMIT;
--0 filas fusionadas.


--------------------------------------------------
MERGE INTO pagos.tarjetas m
USING (
    SELECT uidtarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidtarjeta = o.uidtarjeta)
WHEN MATCHED THEN
    UPDATE SET 
        m.uidmonedero = o.uidmonedero
        WHERE m.uidmonedero != o.uidmonedero; 
-- COMMIT;
--0 filas fusionadas.

--------------------------------------------------

MERGE INTO pagosconsultas.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.INUMTARJETA = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta
        WHERE m.uidtarjeta != o.uidtarjeta; 
        -- COMMIT;
        --387 filas fusionadas.

   

------------------------------------
--LOTE 2 

MERGE INTO monederoconsultas.estadodecuenta m
USING (
SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
FROM credencializacion.tarjetas
WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
UPDATE SET
m.inumtarjeta = o.inumerotarjeta,
m.uidtarjeta = o.uidtarjeta,
m.spanhash = o.spanhash,
m.uidestatustarjeta = o.uidestatustarjeta,
m.uidmotivotarjeta = o.uidmotivo
WHERE  m.uidtarjeta != o.uidtarjeta;

--0 filas fusionadas.

------------------------------------

MERGE INTO app.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.spanhash = o.spanhash
        WHERE m.spanhash != o.spanhash;  
--commit;
--0 filas fusionadas.

------------------------------------

 MERGE INTO appmonederoquery.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE m.uidtarjeta != o.uidtarjeta; 
--        COMMIT;
-- 0 filas fusionadas.

------------------------------------

MERGE INTO appmonederocommand.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE m.uidtarjeta != o.uidtarjeta; 
        
        -- commit;
        --0 filas fusionadas.

------------------------------------
        
MERGE INTO sincronizador.monedero m
USING (
    SELECT inumerotarjeta, spanhash, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.spanhash = o.spanhash
        WHERE m.spanhash != o.spanhash;
        
        -- COMMIT;
        --0 filas fusionadas.

------------------------------------

MERGE INTO comercio.monederostarjetas m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.spanhash = o.spanhash,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        where m.uidtarjeta != o.uidtarjeta ; 
        -- COMMIT;
        --0 filas fusionadas.
 ------------------------------------
       
MERGE INTO apptickets.estadodecuenta m
USING (
    SELECT inumerotarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta
        WHERE m.inumtarjeta != o.inumerotarjeta;   
-- COMMIT;
--0 filas fusionadas.
------------------------------------

MERGE INTO pagos.tarjetas m
USING (
    SELECT uidtarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidtarjeta = o.uidtarjeta)
WHEN MATCHED THEN
    UPDATE SET 
        m.uidmonedero = o.uidmonedero
        WHERE m.uidmonedero != o.uidmonedero; 
-- COMMIT;
--0 filas fusionadas.
------------------------------------


MERGE INTO pagosconsultas.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3'
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.INUMTARJETA = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta
        WHERE m.uidtarjeta != o.uidtarjeta; 
        -- COMMIT;
        --0 filas fusionadas.
------------------------------------
















     
--------------------------------------------------
-- RICARDO
INSERT INTO sincronizador.monedero e(
	    UIDMONEDERO, UIDMONEDEROORIGEN, INUMEROMONEDERO , INUMEROTARJETA, STOKENTARJETA , STIPOTARIFA , UIDTIPOTARIFA,DTFECHACREACION,DTFECHAMODIFICACION,DTFECHABAJA,BACTIVO,BBAJA ,UIDUSUARIOCREACION,UIDUSUARIOBAJA,ICONTADORRECARGA , ICONTADORTRANSACCIONES, SESTATUSMONEDERO, SPANHASH, ICONTADORRECARGAAPLICADA , DTFECHAULTMOD                       ,IIDUSUARIOBAJA                         ,IIDUSUARIOCREACION                     , IIDUSUARIOULTMOD                       , INUMSEQUENCIAL , SNUMEROTARJETA  , UIDUSUARIOMODIFICACION)
SELECT  UIDMONEDERO, UIDMONEDERO      , INUMEROMONEDERO , INUMEROTARJETA, NULL 		    , NULL        , UIDTIPOTARIFA,DTFECHACREACION,DTFECHAMODIFICACION,DTFECHABAJA,BACTIVO,BBAJA ,UIDUSUARIOCREACION,UIDUSUARIOBAJA,0                , 0                     , 'D'             , SPANHASH, 0                        , NULL ,'00000000-0000-0000-0000-000000000000' ,'00000000-0000-0000-0000-000000000000' , '00000000-0000-0000-0000-000000000000' , NULL           , NULL            , UIDUSUARIOMODIFICACION
FROM credencializacion.tarjetas t WHERE t.UIDMONEDERO IN
(
	select t.UIDMONEDERO from credencializacion.tarjetas t left join sincronizador.monedero e
	on t.uidmonedero = e.uidmonedero where e.uidmonedero is null and t.binicializada = 1
);



--------------------------------------------------
--DAVID
-- REPLICA DE TARJETAS DE CREDENCIALIZACION.TARJETAS QUE NO SE ENCUENTRAN EN PAGOS.TARJETAS
-- INSERT INTO PAGOS.TARJETAS (
--     UIDTARJETA, INUMEROMONEDERO, INUMEROTARJETA, SVIGENCIA, UIDESTATUSTARJETA, BVENDIDA, BASOCIADA, UIDTIPOTARIFA, BACTIVO, BBAJA, UIDMONEDERO, SFOLIO, UIDMOTIVO, UIDUSUARIOTARJETA
-- )
-- SELECT 
--     T.UIDTARJETA, T.INUMEROMONEDERO, T.INUMEROTARJETA, T.SVIGENCIA, T.UIDESTATUSTARJETA, T.BVENDIDA, T.BASOCIADA, T.UIDTIPOTARIFA, T.BACTIVO, T.BBAJA, T.UIDMONEDERO, T.UIDMOTIVO, T.UIDUSUARIOTARJETA
-- FROM CREDENCIALIZACION.TARJETAS T
-- LEFT JOIN PAGOS.TARJETAS T2
--     ON T.UIDMONEDERO = T2.UIDMONEDERO 
-- WHERE T2.UIDMONEDERO IS NULL AND T.BINICIALIZADA = 1 AND T.BVENDIDA = 1;

-----SUSTITO
MERGE INTO pagos.tarjetas m
USING (
    SELECT uidtarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE UIDTARJETA IN ('201767c0-d5e5-4acd-1b40-08dc5d72a8e8','9bd2afd2-d680-46a5-6f18-08dc5c3b0a2f')
) o
ON (m.uidtarjeta = o.uidtarjeta)
WHEN MATCHED THEN
    UPDATE SET 
        m.uidmonedero = o.uidmonedero
        WHERE m.uidmonedero != o.uidmonedero; 
-- COMMIT;


-----------------------------------------------




------
-- TABLAS BACKUP CREADAS
----CONSIDERAR BORRAR PARA MAÑANA A LAS 5
SELECT * FROM Credencializacion.Tarjetas_SOLUCION;
---------
SELECT * FROM Credencializacion.Tarjetas_BKUP;
SELECT * FROM Credencializacion.TARJETAS_BKUP2; -->RECIENTE
SELECT * FROM     Sincronizador.Monedero_BKUP;
SELECT * FROM     Sincronizador.Monedero_BKUP2;-->RECIENTE
SELECT * FROM     MonederoConsultas.EstadoDeCuenta_BKUP;
SELECT * FROM     MonederoConsultas.ESTADODECUENTA_BKUP2;-->RECIENTE
SELECT * FROM sincronizador.MONEDERO_BKUP_PRUEBA;














---------------------------------------

SELECT COUNT(*) AS discrepancias
FROM APP.PARAMETROS O
LEFT JOIN APPMONEDEROQUERY.PARAMETROS D ON D.UIDPARAMETRO = O.UIDPARAMETRO
WHERE D.UIDPARAMETRO IS NULL;


INSERT INTO APPMONEDEROQUERY.PARAMETROS (
SNOMBRE, SVALOR, DTFECHACREACION, DTFECHAMODIFICACION, BACTIVO, BBAJA, UIDUSUARIOCREACION, UIDPARAMETRO, UIDUSUARIOMODIFICACION, BENCRIPTADO, SDESCRIPCION
)
SELECT
O.SNOMBRE, O.SVALOR, O.DTFECHACREACION, O.DTFECHAMODIFICACION, O.BACTIVO, O.BBAJA, O.UIDUSUARIOCREACION, O.UIDPARAMETRO, O.UIDUSUARIOMODIFICACION, O.BENCRIPTADO, O.SDESCRIPCION
FROM APP.PARAMETROS O
LEFT JOIN APPMONEDEROQUERY.PARAMETROS D ON D.UIDPARAMETRO = O.UIDPARAMETRO
WHERE D.UIDPARAMETRO IS NULL;


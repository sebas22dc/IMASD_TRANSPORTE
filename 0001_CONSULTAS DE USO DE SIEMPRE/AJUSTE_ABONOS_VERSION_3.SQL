--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--SELECT degree FROM user_tables WHERE table_name = 'TEMP_REGISTROS_AJUSTAR';
-- PASO -1
--
-- CREATE SEQUENCE MONEDEROCOMANDOS.Seq_Foliador_Ajustes_Abonos
--   START WITH 10000
--   INCREMENT BY 1
--   NOCACHE
--   NOCYCLE;
--
------PASO 0 CREAMOS NUESTRA TABLA TEMPORAL
--CREATE GLOBAL TEMPORARY TABLE temp_registros_ajustar (
--uidmovimientoestadodecuenta VARCHAR2(50 BYTE),
--uidoperacion VARCHAR2(50 BYTE),
--uidtiposmonedero VARCHAR2(50 BYTE),
--uidtipomovimiento VARCHAR2(50 BYTE),
--uidtipotransaccion VARCHAR2(50 BYTE),
--dmonto NUMBER(12,2),
--sobservaciones VARCHAR2(500 BYTE),
--uidestatus VARCHAR2(50 BYTE),
--dtfechaoperacion TIMESTAMP(6),
--dtfechacreacion DATE,
--dtfechamodificacion DATE,
--dtfechabaja DATE,
--bactivo NUMBER(1,0),
--bbaja NUMBER(1,0),
--uidusuariocreacion VARCHAR2(50 BYTE),
--uidusuariomodificacion VARCHAR2(50 BYTE),
--uidusuariobaja VARCHAR2(50 BYTE),
--uidmonedero VARCHAR2(50 BYTE),
--ifoliomovimiento NUMBER(16,0),
--semisor VARCHAR2(100 BYTE),
--bfacturado NUMBER(1,0),
--brecargado NUMBER(1,0),
--bcancelado NUMBER(1,0),
--uidtipooperacion VARCHAR2(50 BYTE),
----- CAMPOS PARA AYUDA DURANTE EL PROCESO
--bInsertadoEstado  NUMBER(1,0) default 0,
--bInsertadoMovimientos NUMBER(1,0) default 0,
--bActualizadoSaldo NUMBER(1,0) default 0
--) ON COMMIT PRESERVE ROWS;
select
   t2.INUMEROTARJETA,
   t1.UIDMOVIMIENTOESTADODECUENTA,
   t1.UIDOPERACION,
   t1.UIDTIPOSMONEDERO,
   t1.UIDTIPOMOVIMIENTO,
   t1.UIDTIPOTRANSACCION,
   t1.DMONTO,
   t1.SOBSERVACIONES,
   t1.UIDESTATUS,
   TO_CHAR (t1.DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS') DTFECHAOPERACION,
   TO_CHAR (t1.DTFECHACREACION, 'dd/MM/yyyy HH24:MI:SS') DTFECHACREACION,
   t1.DTFECHAMODIFICACION,
   t1.DTFECHABAJA,
   t1.BACTIVO,
   t1.BBAJA,
   t1.UIDUSUARIOCREACION,
   t1.UIDUSUARIOMODIFICACION,
   t1.UIDUSUARIOBAJA,
   t1.UIDMONEDERO,
   t1.IFOLIOMOVIMIENTO,
   t1.SEMISOR,
   t1.BFACTURADO,
   t1.BRECARGADO,
   t1.BCANCELADO,
   t1.UIDTIPOOPERACION,
   t1.BINSERTADOESTADO,
   t1.BINSERTADOMOVIMIENTOS,
   t1.BACTUALIZADOSALDO
from
   temp_registros_ajustar t1
   join sincronizador.monedero t2 on t1.UIDMONEDERO = t2.UIDMONEDERO;

-- PASO 0.9 Limpiar la tabla temporal SIEMPRE POR SI ACASO
delete from temp_registros_ajustar;

commit;

-- Paso 1: AGREGAR A LA TALA TEMPORAL LOS DATOS QUE CORRESPONDAN 
INSERT INTO
   temp_registros_ajustar (
      uidmovimientoestadodecuenta,
      uidoperacion,
      uidtiposmonedero,
      uidtipomovimiento,
      uidtipotransaccion,
      dmonto,
      sobservaciones,
      uidestatus,
      dtfechaoperacion,
      dtfechacreacion,
      dtfechamodificacion,
      dtfechabaja,
      bactivo,
      bbaja,
      uidusuariocreacion,
      uidusuariomodificacion,
      uidusuariobaja,
      uidmonedero,
      ifoliomovimiento,
      semisor,
      bfacturado,
      brecargado,
      bcancelado,
      uidtipooperacion
   )
SELECT
   uidmovimientoestadodecuenta,
   uidoperacion,
   uidtiposmonedero,
   uidtipomovimiento,
   uidtipotransaccion,
   dmonto,
   sobservaciones,
   uidestatus,
   hora_aleatoria, -- misma hora aquí
   hora_aleatoria, -- misma hora aquí
   dtfechamodificacion,
   dtfechabaja,
   bactivo,
   bbaja,
   uidusuariocreacion,
   uidusuariomodificacion,
   uidusuariobaja,
   uidmonedero,
   MONEDEROCOMANDOS.Seq_Foliador_Ajustes_Abonos.NEXTVAL AS ifoliomovimiento,
   --0 AS ifoliomovimiento,
   semisor,
   bfacturado,
   brecargado,
   bcancelado,
   uidtipooperacion
FROM
   (
      SELECT
         LOWER(
            SUBSTR (RAWTOHEX (SYS_GUID ()), 1, 8) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 9, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 13, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 17, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 21)
         ) AS uidmovimientoestadodecuenta,
         LOWER(
            SUBSTR (RAWTOHEX (SYS_GUID ()), 1, 8) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 9, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 13, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 17, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 21)
         ) AS uidoperacion,
         'e7f21096-73e4-4fe9-aed6-ee29947304b0' uidtiposmonedero,
         'ef008eb7-ea41-46bb-814e-f94979913ceb' uidtipomovimiento,
         'e350f3d3-c742-4a13-9674-edeafc171893' uidtipotransaccion,
          
         CASE WHEN SM.ICONTADORRECARGA = SM.ICONTADORRECARGAAPLICADA THEN (E.DSALDO * -1) + SALDO
         ELSE ((E.DSALDO * -1) + (select SUM(DSALDOACTUAL) FROM SINCRONIZADOR.cambiosmonedero
         where 1=1
         AND ICONTADORRECARGA > SM.ICONTADORRECARGAAPLICADA 
         AND ICONTADORRECARGA <= SM.ICONTADORRECARGA 
         and STARJETA = SM.INUMEROTARJETA )) + SALDO END 
         AS dmonto,
         'Venta de Saldo' sobservaciones,
         '5773658c-a461-4429-91ac-2b58083cb881' uidestatus,
         trunc (
            TO_DATE ('01-03-2025', 'DD-MM-YYYY') + DBMS_RANDOM.VALUE (0, 26)
         ) + DBMS_RANDOM.VALUE (9 / 24, 20 / 24) AS hora_aleatoria,
         --  TO_DATE('10-06-2025', 'DD-MM-YYYY') + DBMS_RANDOM.VALUE(9/24, 20/24) AS hora_aleatoria, ---> aqui ponemos una hora aleatoria pero se puede controlar el dia 
         NULL dtfechamodificacion,
         NULL dtfechabaja,
         1 bactivo,
         0 bbaja,
         '00000000-0000-0000-0000-000000000000' uidusuariocreacion,
         NULL uidusuariomodificacion,
         NULL uidusuariobaja,
         E.UIDMONEDERO uidmonedero,
         --MONEDEROCOMANDOS.Seq_Foliador_Ajustes_Abonos.NEXTVAL AS ifoliomovimiento,
         --'0' ifoliomovimiento,
         'CADENA COMERCIAL OXXO' semisor,
         0 bfacturado,
         1 brecargado,
         0 bcancelado,
         '3808fb45-5062-e551-e063-0400020af699' uidtipooperacion
      FROM
         MONEDEROCONSULTAS.ESTADODECUENTA E
         INNER JOIN (
            SELECT
               inumerotarjeta,
               MAX(DSALDO) KEEP (
                  DENSE_RANK LAST
                  ORDER BY
                     DTFECHAOPERACION
               ) AS SALDO
            FROM
               SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
            WHERE
                1=1
              AND SINCIDENCIA NOT LIKE 'DEB. PEND.%'
              AND  SINCIDENCIA NOT LIKE 'SIM. DEB. PEND.%'
            GROUP BY
               inumerotarjeta
         ) XX ON XX.inumerotarjeta = E.INUMTARJETA
         JOIN SINCRONIZADOR.MONEDERO SM ON E.INUMTARJETA = SM.INUMEROTARJETA
      WHERE
         1 = 1
         --AND E.DSALDO < -12 --> condicion para agregar el saldo en monedero minimo para procesarla
         AND E.SESTATUS = 'ACTIVO'
         --    AND ((E.DSALDO * -1) + SALDO) > 0
         --  AND ((E.DSALDO * -1) + SALDO) <=500
         --AND SM.ICONTADORRECARGA = SM.ICONTADORRECARGAAPLICADA
         AND E.INUMMONEDERO IN (
 1000000000510719
         )
   ) t
where
   1 = 1
   and t.dmonto >= 1
  and t.dmonto <= 500;

commit;
---1163

----------------------A PARTIR DE AQUI SELECCIONAR TODO HASTA ANTES DEL COMMMIT FINAL
-------------------------------------------------------TODO ESTO ES PARTE DE UN TODO PARA EL PROCESO
---paso 2 Insertar la informacion de la tabla temporal
INSERT INTO
   MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA (
      uidmovimientoestadodecuenta,
      uidoperacion,
      uidtiposmonedero,
      uidtipomovimiento,
      uidtipotransaccion,
      dmonto,
      sobservaciones,
      uidestatus,
      dtfechaoperacion,
      dtfechacreacion,
      dtfechamodificacion,
      dtfechabaja,
      bactivo,
      bbaja,
      uidusuariocreacion,
      uidusuariomodificacion,
      uidusuariobaja,
      uidmonedero,
      ifoliomovimiento,
      semisor,
      bfacturado,
      brecargado,
      bcancelado,
      uidtipooperacion
   )
select
   uidmovimientoestadodecuenta,
   uidoperacion,
   uidtiposmonedero,
   uidtipomovimiento,
   uidtipotransaccion,
   dmonto,
   sobservaciones,
   uidestatus,
   dtfechaoperacion,
   dtfechacreacion,
   dtfechamodificacion,
   dtfechabaja,
   bactivo,
   bbaja,
   uidusuariocreacion,
   uidusuariomodificacion,
   uidusuariobaja,
   uidmonedero,
   ifoliomovimiento,
   semisor,
   bfacturado,
   brecargado,
   bcancelado,
   uidtipooperacion
from
   temp_registros_ajustar;

-- Guardamos un punto intermedio
-- Paso 3: validar que se inserto y actualizar el campo de binsertadoEstado
-- update temp_registros_ajustar T
-- set T.bInsertadoEstado = 1 
-- where(T.uidmovimientoestadodecuenta,T.uidoperacion)
--   IN (select uidmovimientoestadodecuenta,uidoperacion from MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where   BACTIVO=1 and BBAJA=0 );
-- Paso 3: insertar ahora los registros a movimientos
----
INSERT INTO
   monederoconsultas.movimientos (
      uidmovimientos,
      uidoperacion,
      uidtipooperacion,
      uidtipomovimiento,
      uidestatustransaccion,
      uidmonedero,
      inummonedero,
      dmonto,
      stipomovimiento,
      soperacion,
      smotivo,
      dtfechaoperacion,
      bcancelacion,
      uidmotivocancelacion,
      ifoliomovimiento,
      semisor,
      bfacturado,
      dsaldoactual,
      dsaldoanterior,
      sserie,
      sruta,
      sautobus
   )
   --select trunc(dtfechaoperacion),count(0)
select
   lower(
      SUBSTR (RAWTOHEX (SYS_GUID ()), 1, 8) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 9, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 13, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 17, 4) || '-' || SUBSTR (RAWTOHEX (SYS_GUID ()), 21)
   ) as uidmovimientos,
   UIDOPERACION,
   UIDTIPOOPERACION,
   UIDTIPOMOVIMIENTO,
   UIDESTATUS,
   UIDMONEDERO,
   INUMMONEDERO,
   DMONTO,
   STIPOMOVIMIENTO,
   --CASE WHEN SOPERACION = 'No encontrado' AND STIPOMOVIMIENTO = 'ABONO' THEN 'Traspaso' ELSE SOPERACION END SOPERACION
   'Venta de saldo' SOPERACION,
   SOBSERVACIONES,
   DTFECHAOPERACION,
   BCANCELACION,
   UIDMOTIVOCANCELACION,
   IFOLIOMOVIMIENTO,
   SEMISOR,
   BFACTURADO,
   DSALDOACTUAL,
   DSALDOANTERIOR,
   SSERIE,
   SRUTA,
   SAUTOBUS
FROM
   (
      select
         me.uidoperacion,
         -- CASE 
         --     WHEN EXISTS (SELECT 1 FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC tb1
         --     WHERE tb1.uidsincronizacion = me.uidoperacion) THEN '7c30521c-aad8-4c63-ab7f-71482569c29e'
         --     WHEN EXISTS (SELECT 1 FROM SINCRONIZADOR.detalletransaccionqrdinamico tb1 
         --     WHERE tb1.uidsincronizacion = me.uidoperacion) THEN 'be7800fb-790f-46a7-b305-422aedec0e0d'
         --     WHEN EXISTS (SELECT 1 FROM PAGOS.ordenesdetalle tb1 
         --     WHERE tb1.uidorden = me.uidoperacion) THEN '4eb81264-3844-4196-bffb-a9e82d0adfc8'
         --     WHEN EXISTS (SELECT 1 FROM COMERCIO.operaciones tb1 
         --     WHERE tb1.uidoperacion = me.uidoperacion) THEN '4eb81264-3844-4196-bffb-a9e82d0adfc8'
         --     ELSE '786fd3c1-6d72-4801-8da8-b28e055eca49'--'00000000-0000-0000-0000-000000000000'
         -- END 
         '786fd3c1-6d72-4801-8da8-b28e055eca49' AS uidtipooperacion,
         me.uidtipomovimiento,
         me.uidestatus,
         me.uidmonedero,
         (
            select
               inummonedero
            from
               monederocomandos.monedero
            where
               uidmonedero = me.uidmonedero
         ) as iNumMonedero,
         me.dmonto,
         (
            select
               snombre
            from
               catalogos.tipomovimientos
            where
               uidtipomovimiento = me.uidtipomovimiento
         ) as sTipoMovimiento,
         CASE
            WHEN EXISTS (
               SELECT
                  1
               FROM
                  SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC tb1
               WHERE
                  tb1.uidsincronizacion = me.uidoperacion
            ) THEN 'Tarjeta Inteligente'
            WHEN EXISTS (
               SELECT
                  1
               FROM
                  SINCRONIZADOR.detalletransaccionqrdinamico tb1
               WHERE
                  tb1.uidsincronizacion = me.uidoperacion
            ) THEN 'e-ticket'
            WHEN EXISTS (
               SELECT
                  1
               FROM
                  PAGOS.ordenesdetalle tb1
               WHERE
                  tb1.uidorden = me.uidoperacion
            ) THEN 'Recarga de saldo'
            WHEN EXISTS (
               SELECT
                  1
               FROM
                  COMERCIO.operaciones tb1
               WHERE
                  tb1.uidoperacion = me.uidoperacion
            ) THEN 'Venta de saldo'
            ELSE 'Traspaso' --'No encontrado'
         END AS sOperacion,
         me.sobservaciones,
         me.dtfechaOperacion,
         0 as bCancelacion,
         null as uidMotivoCancelacion,
         me.iFolioMovimiento,
         me.sEmisor,
         0 as bfacturado,
         (
            SELECT
               AA.DSALDO
            FROM
               MONEDEROCONSULTAS.ESTADODECUENTA AA
            where
               aa.uidmonedero = me.uidmonedero
         ) + me.dmonto dSaldoActual,
         (
            SELECT
               BB.DSALDO
            FROM
               MONEDEROCONSULTAS.ESTADODECUENTA BB
            where
               BB.uidmonedero = me.uidmonedero
         ) dSaldoAnterior,
         null as sSerie,
         null as sRuta,
         null as sautobus
      from
         temp_registros_ajustar me
         left join monederoconsultas.MOVIMIENTOS mo on mo.uidoperacion = me.uidoperacion
      where
         1 = 1
         --and me.bInsertadoEstado = 1
   );

---
---paso 4 validar que se inserto y actualizar el campode bInsertadoMovmientos
-- update temp_registros_ajustar T
-- set T.bInsertadoMovimientos = 1 
-- where T.uidoperacion
--   IN (select uidoperacion from monederoconsultas.movimientos)
--   and bInsertadoEstado=1;
---paso 5 actualizar los campos de saldos en las diferentes tablas usando la tabla temporal de pivote
---TABLA 1
MERGE INTO appmonederocommand.estadodecuenta e USING (
   SELECT
      uidmonedero,
      dmonto
   FROM
      temp_registros_ajustar
      --where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos ON (e.uidmonedero = datos.uidmonedero) WHEN MATCHED THEN
UPDATE
SET
   e.DSALDO = e.DSALDO + datos.dmonto;

-----TABLA 2
MERGE INTO monederoconsultas.estadodecuenta e USING (
   SELECT
      uidmonedero,
      dmonto
   FROM
      temp_registros_ajustar
      --where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos ON (e.uidmonedero = datos.uidmonedero) WHEN MATCHED THEN
UPDATE
SET
   e.DSALDO = e.DSALDO + datos.dmonto;

----TABLA 3 
MERGE INTO appmonederoquery.estadodecuenta e USING (
   SELECT
      uidmonedero,
      dmonto
   FROM
      temp_registros_ajustar
      --where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos ON (e.uidmonedero = datos.uidmonedero) WHEN MATCHED THEN
UPDATE
SET
   e.DSALDO = e.DSALDO + datos.dmonto;

--TABLA 4
MERGE INTO pagos.estadodecuenta e USING (
   SELECT
      uidmonedero,
      dmonto
   FROM
      temp_registros_ajustar
      --where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos ON (e.uidmonedero = datos.uidmonedero) WHEN MATCHED THEN
UPDATE
SET
   e.DSALDO = e.DSALDO + datos.dmonto;

----TAABLA 5 
MERGE INTO apptickets.estadodecuenta e USING (
   SELECT
      uidmonedero,
      dmonto
   FROM
      temp_registros_ajustar
      --   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos ON (e.uidmonedero = datos.uidmonedero) WHEN MATCHED THEN
UPDATE
SET
   e.DSALDO = e.DSALDO + datos.dmonto;

----TAABLA 6
MERGE INTO APP.ESTADODECUENTA e USING (
   SELECT
      uidmonedero,
      dmonto
   FROM
      temp_registros_ajustar
      --   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos ON (e.uidmonedero = datos.uidmonedero) WHEN MATCHED THEN
UPDATE
SET
   e.DSALDO = e.DSALDO + datos.dmonto;
-- Confirmar la transacción completa
COMMIT;




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

DECLARE
   v_error_msg VARCHAR2(4000);
BEGIN

--  select * from temp_registros_ajustar;
 -- PASO 0.9 Limpiar la tabla temporal SIEMPRE POR SI ACASO
  delete from temp_registros_ajustar;
  commit;
   -- Paso 1: AGREGAR A LA TALA TEMPORAL LOS DATOS QUE CORRESPONDAN 
   INSERT INTO temp_registros_ajustar 
(uidmovimientoestadodecuenta,uidoperacion,uidtiposmonedero,uidtipomovimiento,uidtipotransaccion,dmonto,sobservaciones,uidestatus,dtfechaoperacion,dtfechacreacion,dtfechamodificacion,dtfechabaja,bactivo,bbaja,uidusuariocreacion,uidusuariomodificacion,
uidusuariobaja,uidmonedero,ifoliomovimiento,semisor,bfacturado,brecargado,bcancelado,uidtipooperacion)
select 
lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) UIDMOVIMIENTOESTADODECUENTA,
  lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) UIDOPERACION,
  'e7f21096-73e4-4fe9-aed6-ee29947304b0' UIDTIPOSMONEDERO, --- PUEDE CAMBIAR A JOIN CATALOGO. --> esta bien que si afectamos al monedero se ponga tipo nfc?
  'ef008eb7-ea41-46bb-814e-f94979913ceb' UIDTIPOMOVIMIENTO,
  'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION,
  --E.DSALDO, XX. SALDO,
  (E.DSALDO * - 1)+SALDO DMONTO,
  'Venta de Saldo' SOBSERVACIONES,
  '5773658c-a461-4429-91ac-2b58083cb881' UIDESTATUS,
  TO_DATE('09-06-2025 08:03:49', 'DD-MM-YYYY HH24:MI:SS') DTFECHAOPERACION, --->
  TO_DATE('09-06-2025 08:03:49', 'DD-MM-YYYY HH24:MI:SS') DTFECHACREACION, --> preguntar unicamente que va a pasar con estos
  NULL DTFECHAMODIFICACION,
  NULL DTFECHABAJA,
  1 BACTIVO,
  0 BBAJA,
  '00000000-0000-0000-0000-000000000000' UIDUSUARIOCREACION,
  NULL UIDUSUARIOMODIFICACION,
  NULL UIDUSUARIOBAJA,
 E.UIDMONEDERO,
 MONEDEROCOMANDOS.Seq_Foliador_Ajustes_Abonos.NEXTVAL IFOLIOMOVIMIENTO,
 --0 IFOLIOMOVIMIENTO,
 'CADENA COMERCIAL OXXO' SEMISOR, --> posiblemente se cambie a CADENA COMERCIAL OXXO |||||Gestion Monedero
 0 BFACTURADO,
 1 BRECARGADO,
 0 BCANCELADO,
 '3808fb45-5062-e551-e063-0400020af699' UIDTIPOOPERACION
 FROM MONEDEROCONSULTAS.ESTADODECUENTA E
  INNER JOIN (
select inumerotarjeta,
  MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  WHERE  1=1
  AND  SINCIDENCIA not like 'DEB. PEND.%'-->CORRECCION A NIVEL DATOS PORQUE NO DEBE TOMAR LOS REPROCESOS QUE HAYAMOS HECHO
  GROUP BY inumerotarjeta
) XX ON XX.inumerotarjeta = E.INUMTARJETA
JOIN SINCRONIZADOR.MONEDERO SM on E.INUMTARJETA = SM.INUMEROTARJETA ---> directris de join para determinar que los ltcs son iguales
  WHERE 
 1=1
   AND E.DSALDO < -12 
   AND E.SESTATUS = 'ACTIVO'
   --AND ((E.DSALDO * - 1)+SALDO) > 0
  -- AND E.UIDMONEDERO = 'dc94aea1-d497-4ef9-b9fb-b16d8d9bc044'
 AND E.INUMMONEDERO in (
1000000000029486,
1000000000573034,
1000000000541650,
1000000000282742,
1000000000774788

 ) --> cuando sea por lote esto se debe de quitar MUCHO CUIDADO CON ESTE DURANTE PRUEBAS, SIEMPRE DEBE TENER UN DATO DEL NUMERO DE MONEDERO
 AND SM.ICONTADORRECARGA = SM.ICONTADORRECARGAAPLICADA --> solo considerarse si las tarjetas estan sincronizadas en los ltcs
;
  commit;


   ---paso 2 Insertar la informacion de la tabla temporal
INSERT INTO MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA 
(uidmovimientoestadodecuenta,uidoperacion,uidtiposmonedero,uidtipomovimiento,uidtipotransaccion,dmonto,sobservaciones,uidestatus,dtfechaoperacion,dtfechacreacion,dtfechamodificacion,dtfechabaja,bactivo,bbaja,uidusuariocreacion,uidusuariomodificacion,
uidusuariobaja,uidmonedero,ifoliomovimiento,semisor,bfacturado,brecargado,bcancelado,uidtipooperacion)
select uidmovimientoestadodecuenta,uidoperacion,uidtiposmonedero,uidtipomovimiento,uidtipotransaccion,dmonto,sobservaciones,uidestatus,dtfechaoperacion,dtfechacreacion,dtfechamodificacion,dtfechabaja,bactivo,bbaja,uidusuariocreacion,uidusuariomodificacion,
uidusuariobaja,uidmonedero,ifoliomovimiento,semisor,bfacturado,brecargado,bcancelado,uidtipooperacion from temp_registros_ajustar;

   -- Guardamos un punto intermedio
  commit;

   -- Paso 3: validar que se inserto y actualizar el campo de binsertadoEstado


update temp_registros_ajustar T
set T.bInsertadoEstado = 1 
where(T.uidmovimientoestadodecuenta,T.uidoperacion)
  IN (select uidmovimientoestadodecuenta,uidoperacion from MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where   BACTIVO=1 and BBAJA=0 );
  commit;

   -- Paso 3: insertar ahora los registros a movimientos

----

INSERT INTO monederoconsultas.movimientos (
    uidmovimientos,uidoperacion,uidtipooperacion,uidtipomovimiento,uidestatustransaccion,uidmonedero,inummonedero,dmonto,stipomovimiento,soperacion,smotivo,dtfechaoperacion,
    bcancelacion,uidmotivocancelacion,ifoliomovimiento,semisor,bfacturado,dsaldoactual,dsaldoanterior,sserie,sruta,sautobus
)
--select trunc(dtfechaoperacion),count(0)
select 
lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) as uidmovimientos,
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

FROM (
select me.uidoperacion, 
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
(select inummonedero from monederocomandos.monedero where uidmonedero = me.uidmonedero) as iNumMonedero,
 me.dmonto,
(select snombre from catalogos.tipomovimientos where uidtipomovimiento = me.uidtipomovimiento) as sTipoMovimiento,
    CASE 
        WHEN EXISTS (SELECT 1 FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC tb1 
        WHERE tb1.uidsincronizacion = me.uidoperacion) THEN 'Tarjeta Inteligente'
        WHEN EXISTS (SELECT 1 FROM SINCRONIZADOR.detalletransaccionqrdinamico tb1 
        WHERE tb1.uidsincronizacion = me.uidoperacion) THEN 'e-ticket'
        WHEN EXISTS (SELECT 1 FROM PAGOS.ordenesdetalle tb1 
        WHERE tb1.uidorden = me.uidoperacion) THEN 'Recarga de saldo'
        WHEN EXISTS (SELECT 1 FROM COMERCIO.operaciones tb1 
        WHERE tb1.uidoperacion = me.uidoperacion) THEN 'Venta de saldo'
        ELSE 'Traspaso'--'No encontrado'
    END AS sOperacion, 
me.sobservaciones, 
me.dtfechaOperacion,
 0 as bCancelacion,
  null as uidMotivoCancelacion,
   me.iFolioMovimiento,
me.sEmisor,
 0 as bfacturado
, (SELECT AA.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA AA where aa.uidmonedero = me.uidmonedero) + me.dmonto dSaldoActual
,(SELECT BB.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA BB where BB.uidmonedero = me.uidmonedero) dSaldoAnterior, 
null as sSerie,
null as sRuta,
null as sautobus
from temp_registros_ajustar me 
left join monederoconsultas.MOVIMIENTOS mo on mo. uidoperacion = me.uidoperacion
where
1=1
--and me.uidoperacion = '398838d0-50fe-3396-e063-0400000af013'--is null
and me.bInsertadoEstado = 1
--and me.uidmonedero = '680ceed8-6f13-4e77-9782-773dd3e99257'
--AND me.DTFECHAOPERACION > '25/04/25 23:59:59.000000000' and me.DTFECHAOPERACION < '30/04/25 23:59:59.000000000'
);
---
  commit;

   ---paso 4 validar que se inserto y actualizar el campode bInsertadoMovmientos

update temp_registros_ajustar T
set T.bInsertadoMovimientos = 1 
where T.uidoperacion
  IN (select uidoperacion from monederoconsultas.movimientos)
  and bInsertadoEstado=1;
  commit;

   ---paso 5 actualizar los campos de saldos en las diferentes tablas usando la tabla temporal de pivote

---TABLA 1

MERGE INTO appmonederocommand.estadodecuenta e
USING (
   SELECT 
   uidmonedero,
   dmonto
   FROM temp_registros_ajustar
   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos
ON (
   e.uidmonedero = datos.uidmonedero
)
WHEN MATCHED THEN
   UPDATE SET e.DSALDO = e.DSALDO + datos.dmonto;
     commit;

-----TABLA 2
MERGE INTO monederoconsultas.estadodecuenta e
USING (
   SELECT 
   uidmonedero,
   dmonto
   FROM temp_registros_ajustar
   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos
ON (
   e.uidmonedero = datos.uidmonedero
)
WHEN MATCHED THEN
   UPDATE SET e.DSALDO = e.DSALDO + datos.dmonto;
     commit;

----TABLA 3 
MERGE INTO appmonederoquery.estadodecuenta e
USING (
   SELECT 
   uidmonedero,
   dmonto
   FROM temp_registros_ajustar
   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos
ON (
   e.uidmonedero = datos.uidmonedero
)
WHEN MATCHED THEN
   UPDATE SET e.DSALDO = e.DSALDO + datos.dmonto;
     commit;

--TABLA 4
MERGE INTO pagos.estadodecuenta e
USING (
   SELECT 
   uidmonedero,
   dmonto
   FROM temp_registros_ajustar
   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos
ON (
   e.uidmonedero = datos.uidmonedero
)
WHEN MATCHED THEN
   UPDATE SET e.DSALDO = e.DSALDO + datos.dmonto;
COMMIT;

----TAABLA 5 
MERGE INTO apptickets.estadodecuenta e
USING (
   SELECT 
   uidmonedero,
   dmonto
   FROM temp_registros_ajustar
   where bInsertadoMovimientos= 1 and bInsertadoEstado = 1
) datos
ON (
   e.uidmonedero = datos.uidmonedero
)
WHEN MATCHED THEN
   UPDATE SET e.DSALDO = e.DSALDO + datos.dmonto;
   -- Confirmar la transacción completa
   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Transacción completada exitosamente.');

EXCEPTION
   WHEN OTHERS THEN
      -- Obtener mensaje de error
      v_error_msg := SQLERRM;

      -- Revertir todos los cambios
      ROLLBACK;

      -- Mostrar mensaje de error
      DBMS_OUTPUT.PUT_LINE('Error detectado: ' || v_error_msg);
END;
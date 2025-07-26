---REVISION DE TARJETAS CON MAS SALDO QUE EL MONEDERO
--------------------

select MOE.INUMMONEDERO,
XW.inumerotarjeta as num_tarjeta,
MOE.SESTATUS,
MOE.DSALDO AS SALDO_MONEDERO,
XW.SALDO as SALDO_TARJETA,
MOE.DTFECHAULTIMAOPERACION AS ULT_DEBITACION,
MOE.DTFECHAULTIMOABONO as ULT_ABONO
from PREP_monederoconsultas.estadodecuenta MOE
LEFT JOIN PREP_sincronizador.monedero XX on MOE.UIDMONEDERO = XX.UIDMONEDERO
INNER JOIN (
select inumerotarjeta,
MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
,MAX(IERROR) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS IERROR
,MAX(loadtranscounter) AS loadtranscounter2
FROM PREP_SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
GROUP BY inumerotarjeta
) XW ON XW.inumerotarjeta = XX.inumerotarjeta
--
where MOE.sEstatus = 'ACTIVO'
AND XW.SALDO > MOE.DSALDO
-- and (
-- MOE.DTFECHAULTIMAOPERACION >= sysdate - 60 or MOE.DTFECHAULTIMOABONO >= sysdate -60 --> validar que el ultimo abono o debitacion sea dentro de los ultimos 60 dias
-- )
;







---------------




---TABLAS A MODIFICAR

---monederoconsultas.movimientos  INSERTAR el registro de movimiento que se agrega
---MONEDEROCOMANDOS.movimientosestadosdecuenta INSERTAR el registro de movimiento que se agrega
---appmonederocommand.estadodecuenta SUMAR MONTO AGREGADO EN DSALDO
------monederoconsultas.estadodecuenta sumar monto agregado EN DSALDO
------appmonederoquery.estadodecuenta sumar monto agregado EN DSALDO
---pagos.estadodecuenta sumar monto agregado en DSALDO




---PASO 1


---------PRUEBAS DE LA PRIMER VERSION SOLUCION CONTRARIA ADEBITACIONES
-- INSERT INTO PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA 
-- (uidmovimientoestadodecuenta,uidoperacion,uidtiposmonedero,uidtipomovimiento,uidtipotransaccion,dmonto,sobservaciones,uidestatus,dtfechaoperacion,dtfechacreacion,dtfechamodificacion,dtfechabaja,bactivo,bbaja,uidusuariocreacion,uidusuariomodificacion,
-- uidusuariobaja,uidmonedero,ifoliomovimiento,semisor,bfacturado,brecargado,bcancelado,uidtipooperacion)
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
  ABS(E.DSALDO)+SALDO DMONTO,
  'Venta de Saldo' SOBSERVACIONES,
  '5773658c-a461-4429-91ac-2b58083cb881' UIDESTATUS,
  SYSDATE DTFECHAOPERACION,
  SYSDATE DTFECHACREACION, --> preguntar unicamente que va a pasar con estos
  NULL DTFECHAMODIFICACION,
  NULL DTFECHABAJA,
  1 BACTIVO,
  0 BBAJA,
  '00000000-0000-0000-0000-000000000000' UIDUSUARIOCREACION,
  NULL UIDUSUARIOMODIFICACION,
  NULL UIDUSUARIOBAJA,
 E.UIDMONEDERO,
 '0' IFOLIOMOVIMIENTO,
 'Gestion Monedero' SEMISOR,
 0 BFACTURADO,
 1 BRECARGADO,
 0 BCANCELADO,
 '3808fb45-5062-e551-e063-0400020af699' UIDTIPOOPERACION
 --,ABS(E.DSALDO)+SALDO
 FROM PREP_MONEDEROCONSULTAS.ESTADODECUENTA E
  INNER JOIN (
select inumerotarjeta,
  MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  FROM PREP_SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  GROUP BY inumerotarjeta
) XX ON XX.inumerotarjeta = E.INUMTARJETA
  WHERE 
 1=1
   AND E.DSALDO < -12 
   AND E.SESTATUS = 'ACTIVO'
  -- AND E.UIDMONEDERO = 'dc94aea1-d497-4ef9-b9fb-b16d8d9bc044'
 AND E.INUMMONEDERO = 1000000000981115 --> cuando sea por lote esto se debe de quitar
;
--COMMIT;

-- select * from PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where uidtipooperacion = '3808fb45-5062-e551-e063-0400020af699';
select * from PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where UIDOPERACION = '3995b58f-13dd-1bc8-e063-0400000a5732';
-- select * from PREP_monederoconsultas.movimientos where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');

select * from prep_sincronizador.monedero where uidmonedero in ('680ceed8-6f13-4e77-9782-773dd3e99257','dc94aea1-d497-4ef9-b9fb-b16d8d9bc044');
select * from PREP_SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC where inumerotarjeta = '5000000000980016' order by dtfechaoperacion desc;

select * from PREP_monederoconsultas.movimientos where UIDOPERACION = '3995b58f-13dd-1bc8-e063-0400000a5732';

commit;
----------------
select dsaldo from prep_appmonederocommand.estadodecuenta
where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
select dsaldo from prep_monederoconsultas.estadodecuenta
where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
select dsaldo from prep_appmonederoquery.estadodecuenta
where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
select dsaldo from prep_pagos.estadodecuenta
where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
---appmonederocommand.estadodecuenta SUMAR MONTO AGREGADO EN DSALDO
------monederoconsultas.estadodecuenta sumar monto agregado EN DSALDO
------appmonederoquery.estadodecuenta sumar monto agregado EN DSALDO
---pagos.estadodecuenta sumar monto agregado en DSALDO
commit;

--#reversiones

select * from PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where uidtipooperacion = '3808fb45-5062-e551-e063-0400020af699';
-- delete from PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where uidoperacion = '399b80df-df41-2ff3-e063-0400000af27f';
-- delete from PREP_monederoconsultas.movimientos where uidoperacion = '399b80df-df41-2ff3-e063-0400000af27f';

-- update prep_appmonederocommand.estadodecuenta set DSALDO = DSALDO-23
-- where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
-- ----------------------------------------
-- update prep_monederoconsultas.estadodecuenta set DSALDO = DSALDO-23
-- where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
-- ------------------------------------------------------
-- update prep_appmonederoquery.estadodecuenta set DSALDO = DSALDO-23
-- where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
-- --------------------------------------------------------------
-- update prep_pagos.estadodecuenta set DSALDO = DSALDO-23
-- where uidmonedero = (select uidmonedero from prep_credencializacion.tarjetas where  inumeromonedero = '1000000000981115');
-- --#reversiones end
select * from PREP_temp_registros_ajustar;

select * from PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where UIDMOVIMIENTOESTADODECUENTA = '3995b58f-13b5-1bc8-e063-0400000a5732';

--delete from PREP_MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where UIDMOVIMIENTOESTADODECUENTA = '3995b58f-13b5-1bc8-e063-0400000a5732';


SELECT sequence_owner, sequence_name, min_value, max_value, increment_by, last_number
FROM all_sequences;

------------------------------

---PASO 2 AGREGARLO  A MOVIMIENTOS


-- INSERT INTO PREP_monederoconsultas.movimientos (
--     uidmovimientos,uidoperacion,uidtipooperacion,uidtipomovimiento,uidestatustransaccion,uidmonedero,inummonedero,dmonto,stipomovimiento,soperacion,smotivo,dtfechaoperacion,
--     bcancelacion,uidmotivocancelacion,ifoliomovimiento,semisor,bfacturado,dsaldoactual,dsaldoanterior,sserie,sruta,sautobus
-- )

--select trunc(dtfechaoperacion),count(0)
select 
lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) as uidmovimientos,
UIDOPERACION,
CASE WHEN UIDTIPOOPERACION = '00000000-0000-0000-0000-000000000000' AND STIPOMOVIMIENTO = 'ABONO'
 THEN '4eb81264-3844-4196-bffb-a9e82d0adfc8' 
 ELSE UIDTIPOOPERACION 
 END UIDTIPOOPERACION,
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
    --     WHEN EXISTS (SELECT 1 FROM PREP_SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC tb1
    --     WHERE tb1.uidsincronizacion = me.uidoperacion) THEN '7c30521c-aad8-4c63-ab7f-71482569c29e'
    --     WHEN EXISTS (SELECT 1 FROM PREP_SINCRONIZADOR.detalletransaccionqrdinamico tb1 
    --     WHERE tb1.uidsincronizacion = me.uidoperacion) THEN 'be7800fb-790f-46a7-b305-422aedec0e0d'
    --     WHEN EXISTS (SELECT 1 FROM PREP_PAGOS.ordenesdetalle tb1 
    --     WHERE tb1.uidorden = me.uidoperacion) THEN '4eb81264-3844-4196-bffb-a9e82d0adfc8'
    --     WHEN EXISTS (SELECT 1 FROM PREP_COMERCIO.operaciones tb1 
    --     WHERE tb1.uidoperacion = me.uidoperacion) THEN '4eb81264-3844-4196-bffb-a9e82d0adfc8'
    --     ELSE '786fd3c1-6d72-4801-8da8-b28e055eca49'--'00000000-0000-0000-0000-000000000000'
    -- END 
    '786fd3c1-6d72-4801-8da8-b28e055eca49' AS uidtipooperacion,
    me.uidtipomovimiento,
    me.uidestatus,
    me.uidmonedero,
(select inummonedero from PREP_monederocomandos.monedero where uidmonedero = me.uidmonedero) as iNumMonedero,
 me.dmonto,
(select snombre from PREP_catalogos.tipomovimientos where uidtipomovimiento = me.uidtipomovimiento) as sTipoMovimiento,
    CASE 
        WHEN EXISTS (SELECT 1 FROM PREP_SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC tb1 
        WHERE tb1.uidsincronizacion = me.uidoperacion) THEN 'Tarjeta Inteligente'
        WHEN EXISTS (SELECT 1 FROM PREP_SINCRONIZADOR.detalletransaccionqrdinamico tb1 
        WHERE tb1.uidsincronizacion = me.uidoperacion) THEN 'e-ticket'
        WHEN EXISTS (SELECT 1 FROM PREP_PAGOS.ordenesdetalle tb1 
        WHERE tb1.uidorden = me.uidoperacion) THEN 'Recarga de saldo'
        WHEN EXISTS (SELECT 1 FROM PREP_COMERCIO.operaciones tb1 
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
, (SELECT AA.DSALDO FROM PREP_MONEDEROCONSULTAS.ESTADODECUENTA AA where aa.uidmonedero = me.uidmonedero) + me.dmonto dSaldoActual
,(SELECT BB.DSALDO FROM PREP_MONEDEROCONSULTAS.ESTADODECUENTA BB where BB.uidmonedero = me.uidmonedero) dSaldoAnterior, 
null as sSerie,
null as sRuta,
null as sautobus
from PREP_monederocomandos.movimientosestadosdecuenta me 
left join PREP_monederoconsultas.MOVIMIENTOS mo on mo. uidoperacion = me.uidoperacion
where
1=1
and me.uidoperacion = '398838d0-50fe-3396-e063-0400000af013'--is null
--and me.uidmonedero = '680ceed8-6f13-4e77-9782-773dd3e99257'
--AND me.DTFECHAOPERACION > '25/04/25 23:59:59.000000000' and me.DTFECHAOPERACION < '30/04/25 23:59:59.000000000'
);
--where inummonedero in ('1000000000296227');
--group by trunc(dtfechaoperacion)
 --WHERE UIDTIPOMOVIMIENTO = '00000000-0000-0000-0000-000000000000' AND 
--where DTFECHAOPERACION > '31/01/25 23:59:59.000000000' and DTFECHAOPERACION < '02/02/25 00:00:00.000000000';
--and STIPOMOVIMIENTO = 'Abono'
--AND INUMMONEDERO = '1000000000181108'
-- commit;

--------------------------------
-- PASO 3

---ajustar los valores


--------------------------------------

select * from prep_appmonederocommand.estadodecuenta where inummonedero = 1000000000981115;
select * from prep_monederoconsultas.estadodecuenta;
select * from prep_appmonederoquery.estadodecuenta;
select * from prep_pagos.estadodecuenta;
---appmonederocommand.estadodecuenta SUMAR MONTO AGREGADO EN DSALDO
------monederoconsultas.estadodecuenta sumar monto agregado EN DSALDO
------appmonederoquery.estadodecuenta sumar monto agregado EN DSALDO
---pagos.estadodecuenta sumar monto agregado en DSALDO






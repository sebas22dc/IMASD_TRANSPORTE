-- 18363
-- 5000000000561392
-- palomaalexandraperez@gmail.com
-- No se refleja recarga en cuenta del usuario,
-- pero sí aparece en las transacciones del comercio oxxo
-- Proceso Italo
-- Documento
------------MONEDEROCOMANDOS MOVIMIENTOSESTADOSDECUENTA
-----------------
INSERT INTO MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA (uidmovimientoestadodecuenta, uidoperacion, uidtiposmonedero, uidtipomovimiento, uidtipotransaccion, dmonto, sobservaciones, uidestatus, dtfechaoperacion, dtfechacreacion, dtfechamodificacion, dtfechabaja, bactivo, bbaja, uidusuariocreacion, uidusuariomodificacion, uidusuariobaja, uidmonedero, ifoliomovimiento, semisor, bfacturado, brecargado, bcancelado, uidtipooperacion)
SELECT  lower(SUBSTR(RAWTOHEX(SYS_GUID()),1,8) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),9,4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),13,4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),17,4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),21)) AS uidmovimientoestadodecuenta
       ,o.UIDOPERACION
       ,e.UIDTIPOMONEDERO uidtiposmonedero
       ,'ef008eb7-ea41-46bb-814e-f94979913ceb' UIDTIPOMOVIMIENTO
       ,'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION
       ,O.FMONTO DMONTO
       ,'Venta de saldo' SOBSERVACIONES
       ,'5773658c-a461-4429-91ac-2b58083cb881' UIDESTATUS
       ,O.DTFECHAOPERACION
       ,O.DTFECHACREACION
       ,NULL DTFECHAMODIFICACION
       ,NULL DTFECHABAJA
       ,O.BACTIVO
       ,O.BBAJA
       ,'00000000-0000-0000-0000-000000000000' UIDUSUARIOCREACION
       ,NULL UIDUSUARIOMODIFICACION
       ,NULL UIDUSUARIOBAJA
       ,e.UIDMONEDERO
       ,O.IFOLIOVENTA IFOLIOMOVIMIENTO
       ,CC.SCOMERCIO SEMISOR
       ,0 BFACTURADO
       ,1 BRECARGADO
       ,0 BCANCELADO
       ,'4eb81264-3844-4196-bffb-a9e82d0adfc8' UIDTIPOOPERACION
--trunc(O.dtfechaoperacion), count(0) 
FROM comercio.operaciones o
INNER JOIN COMERCIO.COMERCIOS CC
ON CC.UIDCOMERCIO = O.UIDCOMERCIO
LEFT JOIN comercio.operacionesdet d
ON d.uidoperacion = o.uidoperacion
LEFT JOIN monederoconsultas.estadodecuenta e
ON e.inummonedero = d.snumeromonedero
LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
ON M.uidoperacion = O.uidoperacion
WHERE M.uidoperacion IS NULL
AND o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
AND o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
--and o.dtfechaoperacion > TO_DATE('13-02-2025 23:59:59', 'DD-MM-YYYY HH24:MI:SS') 
AND o.dtfechaoperacion < TO_DATE('15-02-2025 19:40:00', 'DD-MM-YYYY HH24:MI:SS')
--AND snumeromonedero IS not NULL;
--COMMIT; 
AND snumeromonedero = '1000000000536265';
 COMMIT;
--group by trunc(o.dtfechaoperacion)
--order by trunc(o.dtfechaoperacion) desc;
--1560
------------monederoconsultas.movimientos
-- UIDMOVIMIENTOS, UIDOPERACION, UIDTIPOOPERACION, UIDTIPOMOVIMIENTO, UIDESTATUSTRANSACCION, UIDMONEDERO, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO, SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION, IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE, SRUTA, SAUTOBUS
-- 74eae561-3499-4ccc-8a34-fa8beee1a08a 233fc17b-8c69-45b1-9ee0-4faae7619e86 4eb81264-3844-4196-bffb-a9e82d0adfc8 ef008eb7-ea41-46bb-814e-f94979913ceb 5773658c-a461-4429-91ac-2b58083cb881 25976a96-2b6e-4ce4-8381-f592d4c833fa 1000000000536265 30 ABONO Venta de saldo Venta de saldo 23/07/25 06:26:08.774011000 0 9897831 CADENA COMERCIAL OXXO 0 27.5 -2.5
--------------------------------------------- 
INSERT INTO monederoconsultas.movimientos (UIDMOVIMIENTOS, UIDOPERACION, UIDTIPOOPERACION, UIDTIPOMOVIMIENTO, UIDESTATUSTRANSACCION, UIDMONEDERO, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO, SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION, IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE, SRUTA, SAUTOBUS)
SELECT  lower(SUBSTR(RAWTOHEX(SYS_GUID()),1,8) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),9,4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),13,4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),17,4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()),21)) AS UIDMOVIMIENTOS
       ,o.UIDOPERACION
       ,M.UIDTIPOOPERACION
       ,'ef008eb7-ea41-46bb-814e-f94979913ceb' UIDTIPOMOVIMIENTO
       ,M.UIDESTATUS AS UIDESTATUSTRANSACCION
       ,e.UIDMONEDERO
       ,e.INUMMONEDERO
       ,O.FMONTO DMONTO
       ,CTP.snombre AS STIPOMOVIMIENTO
       ,'Venta de saldo' as SOPERACION
       ,M.sobservaciones  as SMOTIVO
       ,O.DTFECHAOPERACION
       ,0 BCANCELACION
       ,NULL UIDMOTIVOCANCELACION
       ,M.ifoliomovimiento IFOLIOMOVIMIENTO
       ,M.semisor SEMISOR
       ,0 BFACTURADO
       ,(SELECT AA.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA AA where aa.uidmonedero = M.uidmonedero) + M.dmonto dSaldoActual
       ,(SELECT BB.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA BB where BB.uidmonedero = M.uidmonedero) 
       ,null as sSerie
       ,null as sRuta
       ,null as sautobus
--trunc(O.dtfechaoperacion), count(0) 
FROM comercio.operaciones o
INNER JOIN COMERCIO.COMERCIOS CC
ON CC.UIDCOMERCIO = O.UIDCOMERCIO
LEFT JOIN comercio.operacionesdet d
ON d.uidoperacion = o.uidoperacion
LEFT JOIN monederoconsultas.estadodecuenta e
ON e.inummonedero = d.snumeromonedero
LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
ON M.uidoperacion = O.uidoperacion
LEFT JOIN catalogos.tipomovimientos CTP
ON CTP.uidtipomovimiento = M.uidtipomovimiento
WHERE 
1=1
--AND M.uidoperacion IS NULL
AND o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
AND o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
and o.dtfechaoperacion > TO_DATE('18-07-2025 23:59:59', 'DD-MM-YYYY HH24:MI:SS')
AND M.ifoliomovimiento = 9777729
--AND o.dtfechaoperacion < TO_DATE('15-02-2025 19:40:00', 'DD-MM-YYYY HH24:MI:SS')
--AND snumeromonedero IS not NULL;
--COMMIT; 
AND snumeromonedero = '1000000000536265';
commit;







---------------ACTUALIZAR SALDOS
update appmonederocommand.estadodecuenta set DSALDO = DSALDO+50
where uidmonedero = (select uidmonedero from credencializacion.tarjetas where  inumeromonedero = '1000000000536265');
----------------------------------------
update monederoconsultas.estadodecuenta set DSALDO = DSALDO+50
where uidmonedero = (select uidmonedero from credencializacion.tarjetas where  inumeromonedero = '1000000000536265');
------------------------------------------------------
update appmonederoquery.estadodecuenta set DSALDO = DSALDO+50
where uidmonedero = (select uidmonedero from credencializacion.tarjetas where  inumeromonedero = '1000000000536265');
--------------------------------------------------------------
update pagos.estadodecuenta set DSALDO = DSALDO+50
where uidmonedero = (select uidmonedero from credencializacion.tarjetas where  inumeromonedero = '1000000000536265');
--------------------------------------------------------------
update apptickets.estadodecuenta set DSALDO = DSALDO+50
where uidmonedero = (select uidmonedero from credencializacion.tarjetas where  inumeromonedero = '1000000000536265');

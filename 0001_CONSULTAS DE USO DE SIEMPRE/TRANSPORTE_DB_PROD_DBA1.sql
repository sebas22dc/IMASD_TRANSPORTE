

select * from app.USUARIO where SCORREO = 'alexander.suarezm@correo.uady.mx';
select * from app.USUARIO where SCORREO = 'suarez.topo@gmail.com';

select * from app.USUARIO where STELEFONO = '9994921049';




select t2.INUMMONEDERO, t1.*
from app.USUARIO t1
         join monederoconsultas.ESTADODECUENTA t2 on t2.UIDMONEDERO = t1.UIDMONEDERO
where t1.SCORREO = 'emilymayatr@gmail.com';
commit;

--ROLLBACK
---UPDATES ESPECIALES PARA TICKETS DE AJUSTES DE MONEDERO


 --SEMISOR, SOBSERVACIONES, DTFECHAOPERACION,DTFECHACREACION
-- SELECT * FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA WHERE UIDTIPOOPERACION = '3808fb45-5062-e551-e063-0400020af699' and uidmonedero = (select uidmonedero from credencializacion.tarjetas where inumerotarjeta = 5000000000590045);

UPDATE MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA set SEMISOR='Ajuste monedero',SOBSERVACIONES='Ajuste monedero',DTFECHAOPERACION = sysdate - (6/24),DTFECHACREACION=sysdate- (6/24) where uidoperacion = '3c98c422-54a0-6bdc-e063-0b15000a46e9';
commit;
UPDATE monederoconsultas.movimientos set SOPERACION='Ajuste monedero',SMOTIVO='Ajuste monedero',DTFECHAOPERACION = sysdate- (6/24),SEMISOR = 'Ajuste Monedero' where uidoperacion = '3c98c422-54a0-6bdc-e063-0b15000a46e9';
commit;
 ---------------------------------------------------------------

--select * from comercio.monederostarjetas_PRUEBA;
--select count(1) from comercio.monederostarjetas where stelefono is null; ----FILAS  1,689,367
--select count(1) from comercio.monederostarjetas where stelefono is not null; ----FILAS  4031
-- --
-- --
-- select * from sincronizador.ajustedeb where inumerotarjeta = 5000000000289553;
--
-- --update appmonederoquery.movimientosoperaciones set DTFECHAOPERACION = '11/06/25 13:15:37.000000000' where UIDOPERACION = 'f3c680de-ae59-4925-b808-031561d15875';
-- --commit;
-- select * from monederoconsultas.movimientos where uidmovimientos = 'a7263667-d638-43cd-8608-20618309efc1';
-- select * from MONEDEROCOMANDOS.movimientosestadosdecuenta  where uidoperacion = 'f3c680de-ae59-4925-b808-031561d15875';
-- select * from monederoconsultas.movimientos where uidmovimientos = 'a7263667-d638-43cd-8608-20618309efc1';
-- select * from appmonederoquery.movimientosoperaciones where UIDOPERACION ='f3c680de-ae59-4925-b808-031561d15875';

----select * from sincronizador.ajustedeb where bprocesado = 0 order by inumerotarjeta;
----
----SELECT TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy') AS FECHA_PROCESAR,
----       COUNT(*)
----FROM SINCRONIZADOR.AJUSTEDEB t1
------WHERE bProcesado = 0
----GROUP BY TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy')
----order by TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy') desc;
--
--
--
--
--update sincronizador.ajustedeb set bProcesado = 0 where inumerotarjeta = 5000000000289553;

----update sincronizador.ajustedeb set bProcesado = 1 where bProcesado = 0;
----update sincronizador.ajustedeb set bProcesado = 1 where UIDDETALLESINCRONIZADOR = '5eb22f08-bcee-4e7a-92dc-c1b23aabe7ef';
----COMMIT;
--

--
----update SINCRONIZADOR.cambiosmonedero set ICONTADORRECARGA=20 where uidcambiosmonedero = 'f016e40f-e18f-46ad-8f69-44a79ebe49f5';
-- ----commit;
update SINCRONIZADOR.cambiosmonedero set  UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000',SCRIPTOGRAMARECARGA=''
where uidcambiosmonedero in (
'4467701e-5dea-41e1-ab6c-6d768524a2b6',
'324016b5-be7e-4e68-b27e-4092fb824eac',
'494cf96c-0178-4ec4-860d-1e8d86c636f4',
'1f7f716a-48d4-4b1f-b3b3-e7537190595b'
    );

-- commit;
update sincronizador.monedero set ICONTADORRECARGA=ICONTADORRECARGA+1 where uidmonedero=(select UIDMONEDERO from SINCRONIZADOR.MONEDERO where INUMEROTARJETA = (select starjeta from SINCRONIZADOR.CAMBIOSMONEDERO where UIDCAMBIOSMONEDERO = 'fa7a6bd8-eb62-4a5f-bada-b4b28d39a6ca' group by starjeta));
    --commit;
        update SINCRONIZADOR.cambiosmonedero set ICONTADORRECARGA=6, UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000',SCRIPTOGRAMARECARGA='' where UIDCAMBIOSMONEDERO in (
'fa7a6bd8-eb62-4a5f-bada-b4b28d39a6ca');
--
--
--
update SINCRONIZADOR.cambiosmonedero set UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000' where UIDCAMBIOSMONEDERO = 'cbd97b7d-3f1e-43c9-acec-5963ec5f66cf';
update SINCRONIZADOR.cambiosmonedero set UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000',SCRIPTOGRAMARECARGA='' where UIDCAMBIOSMONEDERO in (
'f0181a58-6f21-4a55-a883-8617c814141b')
;
    ----commit;









---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';COMMIT;

--SELECTS DE POSTERIOR

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='55ba166a-79ab-4918-a7f3-fee884ef5a17';



----update SINCRONIZADOR.cambiosmonedero set UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000',SCRIPTOGRAMARECARGA='' where UIDCAMBIOSMONEDERO = 'd42394d9-1aa2-4c11-97a1-e0a4fd1ee597';
----COMMIT;
--
----select * from SINCRONIZADOR.monedero where uidmonedero  ='e36276ba-7938-426b-b055-d4ac4049968f';
----update SINCRONIZADOR.monedero  set icontadorrecarga = 14 where uidmonedero  ='d96a46f2-e67d-48b0-874d-f033bd620086';
----UPDATE SINCRONIZADOR.AJUSTEDEB SET bProcesado = 1 where bProcesado = 0;
----update  sincronizador.cambiosmonedero set ICONTADORRECARGA= 52 where uidcambiosmonedero = 'bdffab20-4f37-483e-9db7-7c51773f91fb';
-----UPDATES
--
--
--
--
----update SINCRONIZADOR.AJUSTEDEB set NVAFECHAPROCESAR=TO_DATE('07-05-2025', 'DD-MM-YYYY') where UIDDETALLESINCRONIZADOR in (SELECT UIDDETALLESINCRONIZADOR
----FROM SINCRONIZADOR.AJUSTEDEB
----WHERE bProcesado = 0  and TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy') = '04/05/25'
----FETCH FIRST 4502 ROWS ONLY);commit;
--
--
----update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = 'f6788a13-71c2-4257-97bc-ad9330477834';
----commit;
--
---- update SINCRONIZADOR.AJUSTEDEB set bProcesado = 1 WHERE bProcesado = 0 and TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy') = '19/05/25';
----COMMIT;
--
--
--
--
--
----select * from sincronizador.monedero where uidmonedero ='443ee470-204f-4680-9761-baf40f240878';
--
----select * from sincronizador.cambiosmonedero where uidcambiosmonedero='037a1f61-0c51-4226-933a-aee0e4b902e2';
--
----update sincronizador.cambiosmonedero set ICONTADORRECARGA=1  where uidcambiosmonedero='037a1f61-0c51-4226-933a-aee0e4b902e2';commit;
--
--
--
--
--
--
--
--
--
--select MOE.INUMMONEDERO,
--XW.inumerotarjeta as num_tarjeta,
--MOE.SESTATUS,
--MOE.DSALDO AS SALDO_MONEDERO,
--XW.SALDO as SALDO_TARJETA,
--MOE.DTFECHAULTIMAOPERACION AS ULT_DEBITACION,
--MOE.DTFECHAULTIMOABONO as ULT_ABONO,
--case  when XW.SALDO>0 then 'SI' else 'NO' end as CON_SALDO_TARJETA,
----CASE WHEN EXISTS (
----    SELECT 1
----    FROM APPMONEDEROCOMMAND.TARJETAUSUARIO 
----    WHERE bactivo = 1 AND bbaja = 0 and XW.inumerotarjeta = SNUMEROTARJETA
----  ) THEN 'VINCULADO APP' ELSE 'SIN APP' END AS VINCULADO_APP,
--CASE WHEN APT.SNUMEROTARJETA is null THEN 'SIN APP' ELSE 'VINCULADO APP' END AS VINCULADO_APP,
--CASE 
--WHEN abs(MOE.DSALDO) >=0 and abs(MOE.DSALDO) <=100 THEN '0 - 100'
--WHEN abs(MOE.DSALDO) >=101 and abs(MOE.DSALDO) <=300 THEN '101 - 300'
--WHEN abs(MOE.DSALDO) >=301 and abs(MOE.DSALDO) <=500 THEN '301 - 500'
--ELSE '501 O MAS'
--END AS RANGO
--from monederoconsultas.estadodecuenta MOE
--LEFT JOIN sincronizador.monedero XX on MOE.UIDMONEDERO = XX.UIDMONEDERO
--INNER JOIN (
--select inumerotarjeta,
--MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
--,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
--,MAX(IERROR) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS IERROR
--,MAX(loadtranscounter) AS loadtranscounter2
--FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
--GROUP BY inumerotarjeta
--) XW ON XW.inumerotarjeta = XX.inumerotarjeta
--LEFT JOIN APPMONEDEROCOMMAND.TARJETAUSUARIO APT on APT.SNUMEROTARJETA = XW.inumerotarjeta and  APT.bactivo = 1 AND APT.bbaja = 0
--where MOE.sEstatus = 'ACTIVO' AND MOE.dSaldo < -12 and XW.inumerotarjeta !=0
--and (
--MOE.DTFECHAULTIMAOPERACION >= sysdate - 60 or MOE.DTFECHAULTIMOABONO >= sysdate -60 --> validar que el ultimo abono o debitacion sea dentro de los ultimos 60 dias
--);
--
--
--
--
--
--
--
--
--select count(1)
--from COMERCIOCONSULTAS.operaciones  o
--inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
--inner join catalogos.estatus e on e.uidestatus = co.uidestatus
--    left join comercio.operaciones op on op.uidoperacion=o.uidoperacion
--where o.DTFECHAOPERACION > to_date(TO_CHAR(SYSDATE - (1 + 6/24), 'DD-MM-YYYY')) 
--AND o.DTFECHAOPERACION <  TO_DATE(TO_CHAR(SYSDATE - (6/24), 'DD-MM-YYYY')) 
--order by o.DTFECHAOPERACION desc;
--
--
--
--
--
--
--
--
--
--
--
--
-- MERGE INTO SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC USING (
--     SELECT
--     UIDDETALLESINCRONIZADOR, NVAFECHAPROCESAR NVA_FECHAOPERACION
--     , INUMEROTARJETA, STIPOTARIFA, DMONTOCOBRADO ,NVODMONTOCOBRADO AS NVO_DMONTOCOBRADO, ICONTADORTRANSACCIONES, IFOLIO+1 AS NVO_CONTADORTRANSACCIONES
--     ,DTFECHACREACION,
--     CASE WHEN EXTRACT(MONTH from DTFECHACREACION) < EXTRACT(MONTH from SYSDATE)THEN
--     NVAFECHAPROCESAR ELSE DTFECHACREACION END NVA_DTFECHACREACION
--     ,LOADTRANSCOUNTER, LTC NVO_LOADTRANSCOUNTER,
--     IERROR,
--     0 NVO_IERROR, BPROCESADO, TRANSBORDO, SINCIDENCIA AS NVAINCIDENCIA
--     FROM SINCRONIZADOR.AJUSTEDEB DEB
--     INNER JOIN (SELECT INUMEROTARJETA TARJETA, MAX(ICONTADORTRANSACCIONES) IFOLIO, MAX(LOADTRANSCOUNTER) LTC FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC GROUP BY INUMEROTARJETA) T ON T.TARJETA = DEB.INUMEROTARJETA
--     WHERE BPROCESADO = 0
-- ) DEB ON (DEB.UIDDETALLESINCRONIZADOR = NFC.UIDDETALLESINCRONIZADOR)
-- WHEN MATCHED THEN UPDATE
-- SET DTFECHAOPERACION = NVA_FECHAOPERACION,
-- DMONTOCOBRADO = NVO_DMONTOCOBRADO,
-- ICONTADORTRANSACCIONES = NVO_CONTADORTRANSACCIONES,
-- DTFECHACREACION = NVA_DTFECHACREACION,
-- LOADTRANSCOUNTER = NVO_LOADTRANSCOUNTER,
-- IERROR = NVO_IERROR,
-- BPROCESADO = 0,
-- BDEBITADO = 0,
-- SINCIDENCIA = NVAINCIDENCIA,
-- ITRANSBORDO = TRANSBORDO,
-- TOKENTRANSACCION = CASE
--     WHEN NVL(TOKENTRANSACCION,'00000000000000000000000000000000') = '00000000000000000000000000000000'
--     THEN SUBSTR(RAWTOHEX(DBMS_RANDOM.VALUE(0, POWER(2, 64))),1, 32)
--     ELSE TOKENTRANSACCION END
-- WHERE (DEB.UIDDETALLESINCRONIZADOR = NFC.UIDDETALLESINCRONIZADOR);
-- COMMIT;

--
--
--
--
-------MONEDEROS diferencia en campo DSALDO (MONEDEROCONSULTAS vs APPMONEDEROCOMMAND)	204509
--SELECT 'MONEDEROS diferencia en campo DSALDO (MONEDEROCONSULTAS vs APPMONEDEROCOMMAND)' AS fuente,
--COUNT(0) AS discrepancias
--FROM MONEDEROCONSULTAS.ESTADODECUENTA t1
--INNER JOIN APPMONEDEROCOMMAND.ESTADODECUENTA t2 ON t1.UIDMONEDERO = t2.UIDMONEDERO
--WHERE t1.BACTIVO = 1 AND t1.BBAJA = 0 AND (t1.DSALDO <> t2.DSALDO);
-------MONEDEROS diferencia en campo DSALDO (MONEDEROCONSULTAS vs APPMONEDEROQUERY)	20096
--SELECT 'MONEDEROS diferencia en campo DSALDO (MONEDEROCONSULTAS vs APPMONEDEROQUERY)' AS fuente,
--COUNT(0) AS discrepancias
--FROM MONEDEROCONSULTAS.ESTADODECUENTA t1
--INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA t2 ON t1.UIDMONEDERO = t2.UIDMONEDERO
--WHERE t1.BACTIVO = 1 AND t1.BBAJA = 0 AND (t1.DSALDO <> t2.DSALDO);
--
-----------------------------------
--
--select * from catalogos.validadores  WHERE bactivo = 1;
--
--
--
--
--




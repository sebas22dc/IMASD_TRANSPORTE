-- noinspection LossyEncodingForFile

----
--5000000000336969
--5000000000945726
--5000000000115364
---

  :numBusqueda number := 5000000000897147;
select * from CREDENCIALIZACION.TARJETAS where INUMEROTARJETA in (5000000000000000,5000000000000001);
----criptograma 65E3D15BE087B4DD649D4B01
--select * from credencializacion.tarjetas where inumerotarjeta = :numBusqueda;
--select * from monederoConsultas.estadoDeCuenta where iNumMonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda);

select INUMTARJETA,DSALDO from MONEDEROCONSULTAS.ESTADODECUENTA where INUMTARJETA = '5000000000119305';
select * from SINCRONIZADOR.DENEGADOS where SPANHASH = (select SPANHASH from credencializacion.tarjetas where inumerotarjeta = :numBusqueda );
select TO_CHAR(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS')DTFECHAOPERACION,UIDSINCRONIZACION ,UIDDETALLESINCRONIZADOR,uidvalidador, INUMEROTARJETA, DMONTOCOBRADO, BPROCESADO, ICONTADORTRANSACCIONES, DTFECHACREACION, DTFECHAULTMOD,
DTFECHABAJA, ITRANSBORDO, DSALDO, DSALDOANTERIOR, SINCIDENCIA, IDVALIDADOR,
TOKENTRANSACCION, LOADTRANSCOUNTER, IERROR, BDEBITADO, BFIRMADO, CERTIFICADO,
DATEHSM, TRANSVALUE, PANHASH FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =:numBusqueda and bdebitado = 1 order by to_date(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS') desc;
select TO_CHAR(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS')DTFECHAOPERACION,UIDSINCRONIZACION,UIDDETALLESINCRONIZADOR,uidvalidador, INUMEROTARJETA, DMONTOCOBRADO, BPROCESADO, ICONTADORTRANSACCIONES, DTFECHACREACION, DTFECHAULTMOD,
DTFECHABAJA, ITRANSBORDO, DSALDO, DSALDOANTERIOR, SINCIDENCIA, IDVALIDADOR,
TOKENTRANSACCION, LOADTRANSCOUNTER, IERROR, BDEBITADO, BFIRMADO, CERTIFICADO,
DATEHSM, TRANSVALUE, PANHASH  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =:numBusqueda order by to_date(DTFECHAOPERACION, 'dd/MM/yyyy HH24:MI:SS') desc;
select INUMTARJETA,INUMMONEDERO, DSALDO, STIPOTARIFA,
STELEFONO, SESTATUS, BACTIVO, BBAJA, DTFECHAULTIMAOPERACION, DTFECHAULTIMOABONO, DTFECHACREACION, DTFECHABAJA, SNOMBRE,
SAPELLIDOPATERNO, SAPELLIDOMATERNO, SCORREO, SFECHAVIGENCIA, DTFECHANACIMIENTO, UIDTIPOMONEDERO, STIPOMONEDERO,
UIDMOTIVO, SPANHASH, UIDTARJETA, UIDESTATUSTARJETA, UIDMOTIVOTARJETA from monederoconsultas.estadodecuenta where inumtarjeta =:numBusqueda;
select uidmonedero,icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =:numBusqueda;
select UIDCAMBIOSMONEDERO, UIDLISTACUENTAS, STARJETA, SESTATUSMONEDERO, ICONTADORTRANSACIONES, 
DSALDOACTUAL, SCRIPTOGRAMARECARGA, ICONTADORRECARGA,TO_CHAR(DTFECHACREACION, 'dd/MM/yyyy HH24:MI:SS')  DTFECHACREACION,TO_CHAR(DTFECHAMODIFICACION, 'dd/MM/yyyy HH24:MI:SS') DTFECHAMODIFICACION, DTFECHABAJA, 
BACTIVO, BBAJA, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, UIDUSUARIOCREACION, ITIPOBLOQUEADO, IDOPERACION, 
SPANHASH, BAPLICADA, IFOLIOMOVIMIENTO, UIDGRUPORECARGA, BCABECERAGRUPO 
FROM SINCRONIZADOR.cambiosmonedero where starjeta=:numBusqueda order by icontadorrecarga DESC;
select * from monederoconsultas.movimientos where dmonto >0 and inummonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda) order by dtfechaoperacion asc;
select * from MONEDEROCOMANDOS.movimientosestadosdecuenta where uidmonedero  = (select uidmonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda) order by dtfechaoperacion asc;
select * from monederoconsultas.movimientos where inummonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda) order by dtfechaoperacion desc;
select ID, SPANHASH, SCRIPTOGRAMA, ICONTADORRECARGA, SESTATUS, TO_CHAR(dtFechaCreacion,'dd/MM/yy HH:mm:ss'), DTFECHAMODIFICACION, DTFECHABAJA, 
BACTIVO, BBAJA, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, UIDUSUARIOCREACION, IMONTORECARGA, 
INUMEROMONEDERO, INUMEROTARJETA, UIDCAMBIOSMONEDERO from sincronizador.recargas where inumerotarjeta = :numBusqueda order by dtFechaCreacion;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


select * from SINCRONIZADOR.RECARGAS_PENDIENTES where BAPLICADA = 0 and BDUPLICADA=0;


select * from sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC where LENGTH(TRIM(SINCIDENCIA)) > 0 and inumerotarjeta=:numBusqueda;

select * from sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC where UIDDETALLESINCRONIZADOR = '1d49fd94-938a-4e56-9d7b-84481d9fed9b';
select * from sincronizador.SINCRONIZACIONTRANSACCIONESNFC where UIDSINCRONIZACION = '06846ec7-ff7a-4f50-96a1-e9c7836551c3';
select * from sincronizador.SINCRONIZACIONTRANSACCIONESNFC where stag = 'ABZggAAGUtFc2bLRwy3MWqQINc7d1r1IfvKlXCLujuDHQfQBDi1cEl1cPKU5RnMF2wn9A939gdBAAAAADf2B4EAAAAAN_YABA1ODQzNEMwMDY1MkQxNUNE39hEAzQwMN_YFQYZAR0FLDff2BYEV8CZZ9';
select t2.snombre as estatus ,t1.* from comercio.operaciones t1
join comercio.estatusTransaccion t2 on t1.UIDESTATUSOPERACION = t2.UIDESTATUSTRANSACCION
where t1.iFolioVenta = 11026366;

select * from comercioConsultas.detalleoperaciones where 
UIDOPERACION = '4cc18ccb-0b31-4966-9f92-39e66312a083';

--10365443
--select * from comercio.operaciones;

--c37012e1-a994-4a2c-9c2d-af9638aeb1e1->40 -->87
--54ea4bbc-1993-49ab-9b9f-8d6a01178f02->5 --->88
--015f005b-3a97-4e8d-8efc-70a388c9a69d--5 --->89
--select count(*) from monederoconsultas.movimientos where sOperacion like 'REVERSA OXXO WAY';  

SELECT * FROM CREDENCIALIZACION.TARJETAS WHERE INUMEROMONEDERO = '1000000000919831';

SELECT 
    SaldoM,
    DebitacionesM,
    SaldoM + DebitacionesM AS saldoFinalM,
    SaldoT,
    DebitacionesT,
    (select STIPOTARIFA from monederoconsultas.estadodecuenta where inumtarjeta =:numBusqueda) as tarifa,
    SaldoT - DebitacionesT as SaldoFinalT
FROM (
    SELECT 
        NVL((
            SELECT SUM(dmonto)
            FROM monederoconsultas.movimientos
            WHERE dmonto > 0
              AND inummonedero = (
                  SELECT inumeromonedero
                  FROM credencializacion.tarjetas
                  WHERE inumerotarjeta = :numBusqueda
              )
        ), 0) AS SaldoM,
        
        NVL((
            SELECT SUM(dmonto)
            FROM monederoconsultas.movimientos
            WHERE dmonto < 0
              AND inummonedero = (
                  SELECT inumeromonedero
                  FROM credencializacion.tarjetas
                  WHERE inumerotarjeta = :numBusqueda
              )
        ), 0) AS DebitacionesM,
        
        NVL((
            SELECT SUM(dsaldoActual)
            FROM SINCRONIZADOR.cambiosmonedero
            WHERE starjeta = :numBusqueda
              AND bcabeceragrupo = 0
        ), 0) AS SaldoT,
        
                NVL((
                select sum(dmontoCobrado) from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =:numBusqueda
        ), 0) AS DebitacionesT
        
    FROM DUAL
);
select * from MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA 
where uidtipooperacion='3808fb45-5062-e551-e063-0400020af699' and uidmonedero = (select uidmonedero from credencializacion.tarjetas where inumeromonedero = '1000000000211559');

select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = '5000000000287520';

-- DEFINE numeroMoneda = '1000000000019170'
Select (select dsaldo from monederoconsultas.estadodecuenta  where inummonedero = :numeroMoneda) monQ
, (select dsaldo from appmonederoquery.estadodecuenta where inummonedero = :numeroMoneda) appMonc
, (select dsaldo from apptickets.estadodecuenta where inummonedero = :numeroMoneda) APP
,(select dsaldo from pagos.estadodecuenta where inummonedero = :numeroMoneda) pagos
,(select dsaldo from appmonederocommand.estadodecuenta where inummonedero = :numeroMoneda) APPCOMAN
,(select dsaldo from APP.ESTADODECUENTA  where inummonedero = :numeroMoneda) APP_ESTADODECUENTA
From dual;

---------------------PROBLEMAS CUANDO ES DE COMERCIOS EL TEMA
SELECT t2.SNOMBRE,t1.* FROM COMERCIO.OPERACIONES t1
            join COMERCIO.ESTATUSTRANSACCION T2 ON T1.UIDESTATUSOPERACION = T2.UIDESTATUSTRANSACCION
         where  IFOLIOVENTA = 11026366;
SELECT * FROM COMERCIO.OPERACIONES WHERE UIDOPERACION = 'adfdfd0c-58d5-48c3-b88e-a9be0a6520b6';

select * from credencializacion.tarjetas where inumeroMonedero= '1000000000847480';

DEFINE NUMTARJETA = '5000000000898504'
SELECT EB.DTFECHACREACION,EB.SOBSERVACION,SU.SUSERNAME,SU.SNOMBRES, SU.SAPELLIDOS, SU.SEMAIL FROM ESTATUSMONEDERO.BITACORAESTATUS EB
join seguridad.usuarios SU on SU.UIDUSUARIO = EB.UIDUSUARIOCREACION
where UIDMONEDERO = (select UIDMONEDERO from credencializacion.tarjetas where INUMEROTARJETA = '5000000000898504');

SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS
WHERE UIDMONEDERO = '6ad1b01d-c35f-4bb9-8c1c-12caaec73a66'

SELECT * FROM SEGURIDAD.USUARIOS WHERE UIDUSUARIO = 'a84aa924-c2cc-459d-8067-2e5ce7268615';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO where UIDESTATUS = 'e49098ec-93d6-4a62-a40c-61f73d53b383';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO where starjeta = '5000000000898504';

select * from MonederoConsultas.EstadoDeCuenta where INUMTARJETA= '5000000000898504' (select INUMEROMONEDERO from credencializacion.tarjetas where INUMEROTARJETA = '5000000000898504');

select *  from monederoconsultas.movimientos where dmonto >0 and inummonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = :numBusqueda)
and uidoperacion not in (select IDOPERACION   FROM SINCRONIZADOR.cambiosmonedero where starjeta=:numBusqueda);
 

select * from SINCRONIZADOR.RECARGAS_PENDIENTES where bAplicada = 0 and bDuplicada = 0;

select * from MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where uidtipooperacion = '3808fb45-5062-e551-e063-0400020af699' order by Dmonto;

---------------------AVERIGUAR QUE UIDOPERACION NO EXISTEN EN RECARGAS DE TARJETA FISICA



select * from SINCRONIZADOR.AJUSTEDEB where bprocesado = 0;

select sIncidencia from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC group by sIncidencia;
---detecta que ajuste deb solo tenga un registro por tarjeta
select inumerotarjeta ,count(1) from sincronizador.ajustedeb where bProcesado = 0 group by inumerotarjeta order by count(1) desc;
select * from sincronizador.ajustedeb where bprocesado = 0;

select t1.* from sincronizador.ajustedeb t1
left join SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t2 on t1.UIDDETALLESINCRONIZADOR = t2.UIDDETALLESINCRONIZADOR
where t1.bprocesado = 0 and t2.bprocesado = 1 and LENGTH(TRIM(t2.SINCIDENCIA)) > 0;

--2938 tarjetas x 5469 registros
---30 julio 422 tarjetas x 713 registros    
---31 julio 457 tarjetas x 777 registros
select INUMEROTARJETA
from SINCRONIZADOR.AJUSTEDEB t1
where t1.bprocesado = 0
group by INUMEROTARJETA;

select * from  CREDENCIALIZACION.TARJETAS_SOLUCION;
with MonederosAsignados as (select uidtarjeta,uidmonedero,inummonedero,inumtarjeta,uidestatustarjeta,uidestatus,bactivo,bbaja--uidmonedero,inummonedero 
from monederoconsultas.estadodecuenta 
where inummonedero between 1000000001422465 and 1000000001427464 
    and inummonedero not in (select inumeromonedero from credencializacion.tarjetas where uidsolicitud in ('66a1307f-9752-4ebc-b5b5-688607526d62')))
select t2.* from MonederosAsignados
join credencializacion.Tarjetas t2 on MonederosAsignados.UIDMONEDERO = t2.UIDMONEDERO;

select count(*) from openloop.conciliaciones;
/*
--select * from sincronizador.cambiosmonedero where uidcambiosmonedero  = 'c0abc2d3-6d14-4186-8324-f342039e419e';

select * from sincronizador.ajustedeb where bProcesado = 0;
select * from SINCRONIZADOR.RECARGAS_PENDIENTES where baplicada = 0 and bduplicada = 0;

SELECT TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy') AS FECHA_PROCESAR,
       COUNT(*)
FROM SINCRONIZADOR.AJUSTEDEB t1
--WHERE bProcesado = 0
GROUP BY TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy')
order by TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy') desc;

select * from SINCRONIZADOR.AJUSTEDEB

SELECT TO_CHAR(TRUNC(FECHAPROCESADO - (6/24) ), 'dd/MM/yyyy') AS FECHA_PROCESADO,
       COUNT(*)
FROM SINCRONIZADOR.AJUSTEDEB t1
WHERE bProcesado = 1
and (FECHAPROCESADO - (6/24)) >= '10/08/2025'
GROUP BY TO_CHAR(TRUNC(FECHAPROCESADO - (6/24)), 'dd/MM/yyyy')
order by TO_CHAR(TRUNC(FECHAPROCESADO - (6/24)), 'dd/MM/yyyy') desc;

select * from SINCRONIZADOR.AJUSTEDEB
------------------------------------
SELECT TO_CHAR(TRUNC(FECHAPROCESADO - (6/24) ), 'dd/MM/yyyy') AS FECHA_PROCESADO,
       INUMEROTARJETA
FROM SINCRONIZADOR.AJUSTEDEB t1
WHERE bProcesado = 1
and (FECHAPROCESADO - (6/24)) >= '10/08/2025'
GROUP BY INUMEROTARJETA,TO_CHAR(TRUNC(FECHAPROCESADO - (6/24) ), 'dd/MM/yyyy')
order by TO_CHAR(TRUNC(FECHAPROCESADO - (6/24)), 'dd/MM/yyyy') desc;



select * from SINCRONIZADOR.AJUSTEDEB where bprocesado = 0;
select inumerotarjeta from SINCRONIZADOR.AJUSTEDEB where bprocesado = 0 group by inumerotarjeta;

select sum(inumerotarjeta) from SINCRONIZADOR.AJUSTEDEB where bprocesado = 0 group by inumerotarjeta;

select * FROM SINCRONIZADOR.AJUSTEDEB
WHERE bProcesado = 0;
select inumerotarjeta, count(*) from SINCRONIZADOR.AJUSTEDEB where bProcesado = 0 group by INUMEROTARJETA;
select count(*) from SINCRONIZADOR.AJUSTEDEB where bProcesado = 0;
select * from SINCRONIZADOR.RECARGAS_PENDIENTES where baplicada = 0 and bduplicada = 0;

 SELECT ROWID AS rid,
          CEIL( ROW_NUMBER()OVER (ORDER BY NVAFECHAPROCESAR)) as Fila,CEIL(ROW_NUMBER() OVER (ORDER BY NVAFECHAPROCESAR) / 4502) AS bloque
    FROM SINCRONIZADOR.AJUSTEDEB
    WHERE bProcesado = 0;

SELECT inumerotarjeta FROM SINCRONIZADOR.AJUSTEDEB WHERE TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy') = '06/06/25';

SELECT *
FROM SINCRONIZADOR.AJUSTEDEB
WHERE bProcesado = 0;    



--- SABER NUMERO DE REGISTROS HECHOS POR DIA DE FECHA PROCESADO
SELECT UIDDETALLESINCRONIZADOR, DTFECHAOPERACION, INUMEROTARJETA, STIPOTARIFA, 
DMONTOCOBRADO, SALDOMON, DSALDO, ICONTADORTRANSACCIONES, DTFECHACREACION, 
LOADTRANSCOUNTER, IERROR, BPROCESADO,
TO_CHAR(FECHAPROCESADO, 'dd/MM/yyyy HH24:MI:SS') AS FECHAPROCESADO
, NVAFECHAPROCESAR, 
TRANSBORDO, NVODMONTOCOBRADO, SINCIDENCIA
FROM SINCRONIZADOR.AJUSTEDEB
WHERE  TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy HH24:MI:SS') > '02/07/25 17:41:00'
order by FECHAPROCESADO desc;
---------------------

--TO_DATE('2025-06-02', 'YYYY-MM-DD')

select t2.*
from SINCRONIZADOR.AJUSTEDEB t1
join SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t2 on t1.UIDDETALLESINCRONIZADOR = t2.UIDDETALLESINCRONIZADOR
where t1.bprocesado = 0 and t2.bdebitado = 1 and LENGTH(TRIM(t2.SINCIDENCIA)) > 0
group by t2.INUMEROTARJETA;

-------------CON ESTE ANALIZO SI YA QUEDO PROCESADO Y DEBITADO TODO DE AJUSTE DEB SEBASSSSSSSSSSSSSSS
with base as (
select count(1)
from SINCRONIZADOR.AJUSTEDEB t1
left join SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t2 on t1.UIDDETALLESINCRONIZADOR = t2.UIDDETALLESINCRONIZADOR
where t1.bprocesado = 0 and t2.bprocesado = 1 and LENGTH(TRIM(t2.SINCIDENCIA)) > 0
)
select * from (
select 
                    ROW_NUMBER() OVER (PARTITION BY t1.INUMEROTARJETA ORDER BY t1.DTFECHAOPERACION DESC) AS RN,
t1.INUMEROTARJETA,
T1.DSALDO as SaldoT,
t3.DSALDO as saldoM,
t3.STIPOTARIFA,
t4.icontadorrecarga, 
t4.icontadorrecargaaplicada
from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
join base on t1.INUMEROTARJETA = base.INUMEROTARJETA
join monederoconsultas.estadodecuenta t3 on t3.inumtarjeta = base.INUMEROTARJETA
join SINCRONIZADOR.monedero t4 on t3.inumtarjeta = t4.inumerotarjeta
)
WHERE RN = 1;

    



SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 GROUP BY INUMEROTARJETA,IERROR
ORDER BY COUNT(0) DESC;
--select * FROM monederoconsultas.movimientos where ifoliomovimiento in (247469,247468) ;

SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 
and inumerotarjeta not in (select inumerotarjeta from SINCRONIZADOR.AJUSTEDEB 
where TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy')='17/05/25' )
GROUP BY INUMEROTARJETA,IERROR 
having count(*)>=5
ORDER BY COUNT(0) DESC;

select TO_CHAR(TRUNC(FECHAPROCESADO) , 'dd/MM/yy') fechaIngresado,count(*)
from SINCRONIZADOR.AJUSTEDEB t1
where bprocesado = 0
group by TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy')
order by TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy') desc;

WITH RECURRENCIA_ERROR_2 AS
(
SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 
and inumerotarjeta not in (select inumerotarjeta from SINCRONIZADOR.AJUSTEDEB 
where TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy')='17/05/25' )
GROUP BY INUMEROTARJETA,IERROR 
having count(*)>=3
ORDER BY COUNT(0) DESC)
SELECT * FROM RECURRENCIA_ERROR_2 WHERE INUMEROTARJETA NOT IN  ( SELECT INUMEROTARJETA FROM SINCRONIZADOR.AJUSTEDEB  WHERE TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy')<'10/06/25');



























--------------------------------
--ESTA ES LA MUESTRA GLOBAL
WITH RECURRENCIA_ERROR_2 AS
(
SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE TO_CHAR(TRUNC(DTFECHAOPERACION), 'dd/MM/yy')   >'08/06/25'  AND IERROR = 2 
--AQUI EXCLUIMOS LAS TARJETAS QUE SE HAN PROCESADO EN UNA FECHA ESPECIFICA
and inumerotarjeta not in (select inumerotarjeta from SINCRONIZADOR.AJUSTEDEB 
where TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy')>'10/06/25' 
)
GROUP BY INUMEROTARJETA,IERROR 
having count(*)>3
ORDER BY COUNT(0) DESC
),
SALDOS_NFC_MON AS (
select * from    (
                    select T4.*,
          t1.DSALDO SALDO_NFC,
          t2.DSALDO SALDO_APP,
          t3.icontadorrecarga   LTC_TOTALES,
          T3.icontadorrecargaaplicada LTC_ACTUAL_APLICADO,
          ROW_NUMBER() OVER (PARTITION BY t1.INUMEROTARJETA ORDER BY t1.DTFECHAOPERACION DESC) AS RN --> contador para que solo me devuelva el ultimo registro de nfc
        
         FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
         JOIN MONEDEROCONSULTAS.ESTADODECUENTA t2 ON t1.INUMEROTARJETA = t2.INUMTARJETA
         JOIN SINCRONIZADOR.MONEDERO t3 ON t3.INUMEROTARJETA = t1.INUMEROTARJETA
         JOIN RECURRENCIA_ERROR_2 T4 ON T4.INUMEROTARJETA = t1.INUMEROTARJETA
                    )
                    WHERE RN = 1
),
RESULTADOS_NUMERICOS AS (
 select 
 sum(case when SALDO_NFC<=0 and SALDO_APP<=0  then 1 else 0 end) SIN_SALDO_NFC_SIN_SALDO_MON,
 sum(case when SALDO_NFC<=0 and SALDO_APP>=0 and (LTC_TOTALES = LTC_ACTUAL_APLICADO)  then 1 else 0 end) SIN_SALDO_NFC_con_saldo_mon_sin_recargas_pendientes,
 sum(case when SALDO_NFC<=0 and SALDO_APP>=0 and (LTC_TOTALES != LTC_ACTUAL_APLICADO)  then 1 else 0 end) SIN_SALDO_NFC_con_saldo_mon_con_recargas_pendientes,
 SUM(RN) TOTAL_GENERAL
 from SALDOS_NFC_MON
),
RESULTADOS_FINALES AS (

select  
        TRUNC((SIN_SALDO_NFC_SIN_SALDO_MON / TOTAL_GENERAL)*100,2)  SIN_SALDO_NFC_SIN_SALDO_MON ,
        TRUNC((SIN_SALDO_NFC_CON_SALDO_MON_SIN_RECARGAS_PENDIENTES / TOTAL_GENERAL)*100,2) SIN_SALDO_NFC_CON_SALDO_MON_SIN_RECARGAS_PENDIENTES,
        TRUNC((SIN_SALDO_NFC_CON_SALDO_MON_CON_RECARGAS_PENDIENTES / TOTAL_GENERAL)*100,2) SIN_SALDO_NFC_CON_SALDO_MON_CON_RECARGAS_PENDIENTES,
        TRUNC((((TOTAL_GENERAL - (SIN_SALDO_NFC_SIN_SALDO_MON + SIN_SALDO_NFC_con_saldo_mon_sin_recargas_pendientes + SIN_SALDO_NFC_con_saldo_mon_con_recargas_pendientes))/TOTAL_GENERAL)*100),2) OTROS,
        TOTAL_GENERAL
from RESULTADOS_NUMERICOS T1
)
--SELECT * FROM RESULTADOS_FINALES
select * from SALDOS_NFC_MON  T1
where t1.inumerotarjeta not in (select inumerotarjeta from RESULTADOS_FINALES where SALDO_NFC<=0 and SALDO_APP<=0 )
AND t1.inumerotarjeta not in (select inumerotarjeta from RESULTADOS_FINALES   where SALDO_NFC<=0 and SALDO_APP>=0 and (LTC_TOTALES = LTC_ACTUAL_APLICADO) ) 
AND t1.inumerotarjeta not in (select inumerotarjeta from RESULTADOS_FINALES   where SALDO_NFC<=0 and SALDO_APP>=0 and (LTC_TOTALES != LTC_ACTUAL_APLICADO)  ) 
;
------------------
--TOP DE VALIDADORES con el PUNTO 4
Define NumeroTops=10
WITH RECURRENCIA_ERROR_2 AS
(
SELECT UIDVALIDADOR,IRUTA,IERROR,COUNT(0) num_errores FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE TO_CHAR(TRUNC(DTFECHAOPERACION), 'dd/MM/yy')   >'08/06/25'  AND IERROR = 2 
--AQUI EXCLUIMOS LAS TARJETAS QUE SE HAN PROCESADO EN UNA FECHA ESPECIFICA
and inumerotarjeta not in (select inumerotarjeta from SINCRONIZADOR.AJUSTEDEB 
where TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy')>'10/06/25' 
)
GROUP BY UIDVALIDADOR,IRUTA,IERROR 
having count(*)>3
ORDER BY COUNT(0) DESC
),
ValidadoresNumerados as (
            select 
            t1.*
            , ROW_NUMBER() OVER (PARTITION BY t1.UIDVALIDADOR ORDER BY t1.num_errores DESC) AS RN
            
            from  RECURRENCIA_ERROR_2 t1 )
SELECT * FROM ValidadoresNumerados where RN <= &NumeroTops order by num_errores desc;
*/


---- TOP DE VALIDADORES CON EL PUNTO 5 



--
-------------PRUEBAS DE LA PRIMER VERSION SOLUCION CONTRARIA ADEBITACIONES
--select 
--lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) UIDMOVIMIENTOESTADODECUENTA,
--  lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
--  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) UIDOPERACION,
--  'e7f21096-73e4-4fe9-aed6-ee29947304b0' UIDTIPOSMONEDERO, --- PUEDE CAMBIAR A JOIN CATALOGO.
--  'ef008eb7-ea41-46bb-814e-f94979913ceb' UIDTIPOMOVIMIENTO,
--  'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION,
--  --E.DSALDO, XX. SALDO,
--  ABS(E.DSALDO)+SALDO DMONTO,
--  'Venta de Saldo' SOBSERVACIONES,
--  '5773658c-a461-4429-91ac-2b58083cb881' UIDESTATUS,
--  SYSDATE DTFECHAOPERACION,
--  SYSDATE DTFECHACREACION,
--  NULL DTFECHAMODIFICACION,
--  NULL DTFECHABAJA,
--  1 BACTIVO,
--  0 BBAJA,
--  '00000000-0000-0000-0000-000000000000' UIDUSUARIOCREACION,
--  NULL UIDUSUARIOMODIFICACION,
--  NULL UIDUSUARIOBAJA,
-- E.UIDMONEDERO,
-- '0' IFOLIOMOVIMIENTO,
-- 'Gestion Monedero' SEMISOR,
-- 0 BFACTURADO,
-- 1 BRECARGADO,
-- 0 BCANCELADO,
-- '3808fb45-5062-e551-e063-0400020af699' UIDTIPOOPERACION
-- --,ABS(E.DSALDO)+SALDO
-- FROM MONEDEROCONSULTAS.ESTADODECUENTA E
--  INNER JOIN (
--select inumerotarjeta,
--  MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
--  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
--  GROUP BY inumerotarjeta
--) XX ON XX.inumerotarjeta = E.INUMTARJETA
--  WHERE 
--  E.DSALDO < -12 --AND E.SESTATUS = 'ACTIVO'
--  --AND E.UIDMONEDERO = 'dc94aea1-d497-4ef9-b9fb-b16d8d9bc044'
-- AND INUMTARJETA = 5000000000402545
-- --5000000000345609
--;
-- 
-- ----------------
--select * from monederoconsultas.movimientos 
--where inummonedero = (select inumeromonedero from credencializacion.tarjetas where inumerotarjeta = 5000000000402545) order by dtfechaoperacion asc;
--
--
--
--------
--
--
--select * from TARIFAS."ConfiguracionesTarifa";
--
--
--where sclaveruta ='9008';
--
--
--select * from catalogos.autobuses;
--select * from catalogos.autobusrutachofer;
--select * from catalogos.rutas;
--select * from tarifas.tipotarifas;
--
--select
--CAA.UIDAUTOBUS,
--CAA.SPLACAS,
--CAA.SNUMECO,
--CARU.SCLAVERUTA, 
--CARU.SDESCRIPCION, 
--CARU.SCLAVERIDANGO,
--tat.STIPOTARIFA
--from catalogos.autobuses CAA
--left join catalogos.autobusrutachofer CAR on CAA.UIDAUTOBUS =CAR.UIDAUTOBUS
--left join catalogos.rutas CARU on CAR.UIDRUTA = CARU.UIDRUTA
--left join TARIFAS."ConfiguracionesTarifa" TCT on TCT."uIdRuta" = CARU.UIDRUTA
--left join tarifas.tipoTarifas tat on tat.UIDTIPOTARIFA = tct."uIdTipoTarifa"
--where 
----CARU.SCLAVERUTA = '9008'
--CAA.bactivo =1 
--and CAA.bbaja = 0
--and TCT."uIdTipoTarifa" is null
--;




------------
--select * from catalogos.tipotransacciones;
--select * from catalogos.tipooperaciones;
--select * from catalogos.tipomovimientos;
--select * from catalogos.tiposmonedero;
--select * from MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where semisor='Gestion Monedero';
-----


---9,343,780
-----9,341,037
--WITH BASE AS (
--  SELECT uidoperacion,
--  uidproducto,
--  ROW_NUMBER() OVER (ORDER BY DTFECHACREACION DESC) AS RN
--  FROM comercio.operaciones
--  order by RN asc)
--  select t1.uidoperacion,t1.uidproducto CCO_uidproducto,bs.uidproducto CO_uidproducto from comercioconsultas.operaciones t1
--  inner join BASE Bs on t1.uidoperacion = Bs.uidoperacion and t1.uidproducto is null and bs.RN <=1000000;
--
--
--
--select SNUMEROTARJETA from APPMONEDEROCOMMAND.TARJETAUSUARIO where bactivo = 1 and bbaja = 0
--group by SNUMEROTARJETA;
--
--with Asociadas as (
--select SNUMEROTARJETA from APPMONEDEROCOMMAND.TARJETAUSUARIO where bactivo = 1 and bbaja = 0
--group by SNUMEROTARJETA
----SELECT  am.SNUMEROTARJETA
----FROM APPMONEDEROCOMMAND.TARJETAUSUARIO AM
----INNER JOIN APPMONEDEROCOMMAND.USUARIO USU ON USU.UIDUSUARIO = AM.UIDUSUARIO
----INNER JOIN APP.USUARIO USU2 ON USU2.UIDUSUARIO = usu.UIDUSUARIO
----WHERE
----1=1
----AND USU2.BBAJA = 0
----AND AM.BACTIVO = 1
----group by am.SNUMEROTARJETA
--)
--select MOE.INUMMONEDERO,
--XW.inumerotarjeta as num_tarjeta,
--MOE.SESTATUS,
--MOE.DSALDO AS SALDO_MONEDERO,
--XW.SALDO as SALDO_TARJETA,
--MOE.DTFECHAULTIMAOPERACION AS ULT_DEBITACION,
--MOE.DTFECHAULTIMOABONO as ULT_ABONO,
--case  when XW.SALDO>0 then 'SI' else 'NO' end as CON_SALDO_TARJETA,
--CASE WHEN EXISTS (
--    SELECT 1
--    FROM APPMONEDEROCOMMAND.TARJETAUSUARIO 
--    WHERE bactivo = 1 AND bbaja = 0 and XW.inumerotarjeta = SNUMEROTARJETA
--  ) THEN 'VINCULADO APP' ELSE 'SIN APP' END AS VINCULADO_APP,
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
----LEFT JOIN Asociadas Aso on Aso.SNUMEROTARJETA = XW.inumerotarjeta
--where MOE.sEstatus = 'ACTIVO' AND MOE.dSaldo < -12 and NUM_TARJETA !=0
--and (
--MOE.DTFECHAULTIMAOPERACION >= sysdate - 60 or MOE.DTFECHAULTIMOABONO >= sysdate -60 --> validar que el ultimo abono o debitacion sea dentro de los ultimos 60 dias
--);
--select * from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC 
--where 
--1=1
----and bprocesado = 0 
----and LENGTH(trim(sIncidencia))=0
--and bdebitado = 0
--and UIDDETALLESINCRONIZADOR in (SELECT UIDDETALLESINCRONIZADOR
--FROM SINCRONIZADOR.AJUSTEDEB
--WHERE TO_DATE(FECHAPROCESADO , 'DD/MM/YY') = TO_DATE('10/07/25', 'DD/MM/YY'));
-- 
--
--  
--
--
--
--SELECT *
--FROM SINCRONIZADOR.AJUSTEDEB
--WHERE TO_DATE(FECHAPROCESADO , 'DD/MM/YY') = TO_DATE('10/07/25', 'DD/MM/YY')

--
--select count(*) from  comercio.MONEDEROSTARJETAS e
--WHERE EXISTS (
--    SELECT 1
--    FROM monederoconsultas.ESTADODECUENTA t
--    WHERE t.UIDMONEDERO= e.UIDMONEDERO
--);
--
--select count(1) from comercio.MONEDEROSTARJETAS where stelefono is null;
--select count(1) from comercio.MONEDEROSTARJETAS;
--
--
-- SELECT count(*)
--    FROM monederoconsultas.ESTADODECUENTA t
--    WHERE t.UIDMONEDERO= e.UIDMONEDERO;
--
--
--
--    SELECT COUNT(*)
--FROM comercio.MONEDEROSTARJETAS e
--WHERE e.STELEFONO IS NULL
--  AND EXISTS (
--      SELECT 1
--      FROM monederoconsultas.ESTADODECUENTA t
--      WHERE t.UIDMONEDERO = e.UIDMONEDERO
--        AND t.STELEFONO IS NOT NULL
--  );
--    
--     SELECT t.STELEFONO
--    FROM monederoconsultas.ESTADODECUENTA t
--    WHERE t.UIDMONEDERO = e.UIDMONEDERO
--      AND t.STELEFONO IS NOT NULL
--    FETCH FIRST 1 ROWS ONLY;
--    
--    
--    select count(*) from comercio.MONEDEROSTARJETAS e where e.STELEFONO IS NULL;
--    
--    
--    
--    select count(1) from notificaciones.historial;
--    select count(1) from notificaciones.metodos;    
--    select count(1) from monederocomandos.movimientosestadosdecuenta_DUP;
--    
--    
--select e.stelefono,(    SELECT t.STELEFONO
--    FROM monederoconsultas.ESTADODECUENTA t
--    WHERE t.UIDMONEDERO = e.UIDMONEDERO
--    AND t.STELEFONO IS NOT NULL
--    FETCH FIRST 1 ROWS ONLY) as nuevo_Num from  comercio.MONEDEROSTARJETAS e
--WHERE e.STELEFONO IS NULL
--AND EXISTS (
--    SELECT 1
--    FROM monederoconsultas.ESTADODECUENTA t
--    WHERE t.UIDMONEDERO = e.UIDMONEDERO
--    AND t.STELEFONO IS NOT NULL  
--);
--
--
--SELECT count(*) FROM NOTIFICACIONES.HISTORIAL
--WHERE uidhistorial in  (select uidhistorial from NOTIFICACIONES.HISTORIAL_BK);
--
--
--select count(0) from NOTIFICACIONES.HISTORIAL_BK;
--select count(0) from NOTIFICACIONES.HISTORIAL;
;
---------------------------------------

DEFINE numeroMoneda = '1000000000607570'
Select (select dsaldo from monederoconsultas.estadodecuenta  where inummonedero = &numeroMoneda) monQ
, (select dsaldo from appmonederoquery.estadodecuenta where inummonedero = &numeroMoneda) appMonc
, (select dsaldo from apptickets.estadodecuenta where inummonedero = &numeroMoneda) APP
,(select dsaldo from pagos.estadodecuenta where inummonedero = &numeroMoneda) pagos
From dual;






-----------------VERSION 2 ABI
-- CONSULTA PARA CANCELADAS DE CIFO

with canceladas as (
select coop.ifoliocomercio
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    where soperacion = 'Cancelada' --and coop.ifoliocomercio in('11615017300525')
    and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%'
)
select soperacion as "OPERACI�N", co.inumcomercio "CLIENTE", co.scomercio "COMERCIO" , o.sfolioventa "FOLIO", coop.ifoliocomercio "FOLIOCOMERCIO", trunc(o.dtfechaoperacion) "FECHA",
to_char(o.dtfechaoperacion, 'HH24:MI') "HORA", to_char(o.dtfechaoperacion,'DD/MM/YYYY HH24:MI:SS') FECHAHORA,
    lvd1.smensajesalidaapi "OPERACI�N GUARDADA SALIDA API",
    lvd1.dtfecha "OPERACI�N GUARDADA FECHA",
    lvd2.smensajesalidaapi "SALDO PROTEGIDO SALIDA API",
    lvd2.dtfecha "SALDO PROTEGIDO FECHA",
    lvd3.smensajesalidaapi "OPERACI�N DETALLE GUARDADA SALIDA API",
    lvd3.dtfecha "OPERACI�N DETALLE GUARDADA FECHA",
    lvd4.smensajesalidaapi "CONFIRMACI�N DE SALDO PROTEGIDO SALIDA API",
    lvd4.dtfecha "CONFIRMACI�N DE SALDO PROTEGIDO FECHA",
    lvd5.smensajesalidaapi "EXITOSA SALIDA API",
    lvd5.dtfecha "EXITOSA FECHA",
o.sestatustransaccion "ESTATUS", o.dmontoventa "MONTO DE VENTA", o.dmontocobrado "MONTO COBRADO"
,o.stipomovimiento "TIPO", NVL(smotivo,' ') "MOTIVO", o.icantidad "CANTIDAD", o.dsaldoanterior "SALDO ANTERIOR", o.dsaldoactual "SALDO ACTUAL",e.sestatus, co.snombregrupocomercial "GRUPO COMERCIAL"
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus='OPERACI�N GUARDADA'
    left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus='SALDO PROTEGIDO'
    left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus='OPERACI�N DETALLE GUARDADA'
    left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus='CONFIRMACI�N DE SALDO PROTEGIDO'
    left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus='EXITOSA'
where o.DTFECHAOPERACION >= TO_DATE('21-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('22-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%'
and coop.ifoliocomercio in(select ifoliocomercio from canceladas)
order by o.DTFECHAOPERACION desc;

-------------------------------------------------------------------------------------CONSULTAS INCIALES 



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
  (SYSDATE - 15) DTFECHAOPERACION, --->
  (SYSDATE - 15) DTFECHACREACION, --> preguntar unicamente que va a pasar con estos
  NULL DTFECHAMODIFICACION,
  NULL DTFECHABAJA,
  1 BACTIVO,
  0 BBAJA,
  '00000000-0000-0000-0000-000000000000' UIDUSUARIOCREACION,
  NULL UIDUSUARIOMODIFICACION,
  NULL UIDUSUARIOBAJA,
 E.UIDMONEDERO,
 0 IFOLIOMOVIMIENTO,
 'Gestion Monedero' SEMISOR,
 0 BFACTURADO,
 1 BRECARGADO,
 0 BCANCELADO,
 '3808fb45-5062-e551-e063-0400020af699' UIDTIPOOPERACION
 FROM MONEDEROCONSULTAS.ESTADODECUENTA E
  INNER JOIN (
select inumerotarjeta,
  MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  GROUP BY inumerotarjeta
) XX ON XX.inumerotarjeta = E.INUMTARJETA
JOIN SINCRONIZADOR.MONEDERO SM on E.INUMTARJETA = SM.INUMEROTARJETA ---> directris de join para determinar que los ltcs son iguales
  WHERE 
 1=1
   AND E.DSALDO < -12 
   AND E.SESTATUS = 'ACTIVO'
      AND ((E.DSALDO * - 1)+SALDO) > 0
  -- AND E.UIDMONEDERO = 'dc94aea1-d497-4ef9-b9fb-b16d8d9bc044'
 AND E.INUMMONEDERO in (
 1000000000246447,
1000000000343122,
1000000000031617,
1000000000899644,
1000000000293451
 ) --> cuando sea por lote esto se debe de quitar MUCHO CUIDADO CON ESTE DURANTE PRUEBAS, SIEMPRE DEBE TENER UN DATO DEL NUMERO DE MONEDERO
 AND SM.ICONTADORRECARGA = SM.ICONTADORRECARGAAPLICADA --> solo considerarse si las tarjetas estan sincronizadas en los ltcs
;
select * from temp_registros_ajustar;


DEFINE NUMTARJETA = '5000000000898504'
SELECT EB.DTFECHACREACION,EB.SOBSERVACION,SU.SUSERNAME,SU.SNOMBRES, SU.SAPELLIDOS, SU.SEMAIL FROM ESTATUSMONEDERO.BITACORAESTATUS EB
join seguridad.usuarios SU on SU.UIDUSUARIO = EB.UIDUSUARIOCREACION
where UIDMONEDERO = (select UIDMONEDERO from credencializacion.tarjetas where INUMEROTARJETA = &NUMTARJETA);







------------------------REVIONES

SELECT 
    --M.UIDOPERACION,
    O.SCONCEPTO AS OPERACION,
    TT.SNOMBRE  AS TIPOTRANSACCION,
    TM.STIPOMONEDERO AS TIPOMONEDERO, 
    TMOV.SNOMBRE AS TIPOMOVIMIENTO,
    to_char(M.DTFECHAOPERACION,'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
	M.SEMISOR AS COMERCIO,
    --O.IOPCION_PAGO,
    CASE WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
            WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
            WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
            WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
        END GRUPOCOMERCIAL,
    TO_CHAR(M.IFOLIOMOVIMIENTO) AS FOLIOINTERNO,
    TO_CHAR(MON.INUMMONEDERO) AS INUMMONEDERO,
    TF.STIPOTARIFA AS TIPOTARIFA,
    TO_CHAR(M.DMONTO) AS DMONTO,
    M.DMONTO-(M.DMONTO*CASE WHEN O.IOPCION_PAGO=3 THEN 1.8 ELSE 0 END/100) MONTOCOBRADO,
    CASE WHEN O.IOPCION_PAGO=3 THEN 1.8 ELSE 0 END COMISION_PORC
FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
    LEFT JOIN CREDENCIALIZACION.TARJETAS T ON T.UIDMONEDERO = M.UIDMONEDERO
    LEFT JOIN MONEDEROCOMANDOS.MONEDERO MON ON MON.UIDMONEDERO=M.UIDMONEDERO
    LEFT JOIN CATALOGOS.TIPOTARIFAS TF ON TF.UIDTIPOTARIFA=MON.UIDTIPOTARIFA
    LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT ON TT.UIDTIPOTRANSACCION=M.UIDTIPOTRANSACCION
    LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO=M.UIDTIPOSMONEDERO
    LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV ON TMOV.UIDTIPOMOVIMIENTO=M.UIDTIPOMOVIMIENTO
    LEFT JOIN COMERCIO.COMERCIOS C ON C.SCOMERCIO=M.SEMISOR
    LEFT JOIN PAGOS.ORDENES O ON O.UIDORDEN=M.UIDOPERACION
WHERE
    M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
    AND M.SEMISOR = 'APP'
    AND M.DMONTO>0
    AND M.UIDOPERACION NOT IN (SELECT b.UIDOPERACION FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a INNER JOIN ( 
        SELECT A.UIDOPERACION,uidmonedero, ifoliomovimiento, trunc(dtfechaoperacion) fecha FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a 
        WHERE SOBSERVACIONES != 'REVERSA OXXO WAY' AND semisor IN ('CADENA COMERCIAL OXXO')) b
        ON b.UIDMONEDERO = a.UIDMONEDERO AND b.IFOLIOMOVIMIENTO = a.IFOLIOMOVIMIENTO AND b.FECHA = trunc(A.dtfechacreacion)
        WHERE SOBSERVACIONES = 'REVERSA OXXO WAY'
        )
AND (M.UIDTIPOOPERACION<>'786fd3c1-6d72-4801-8da8-b28e055eca49' or M.UIDTIPOOPERACION is null)
and O.SCONCEPTO is not null
AND m.DTFECHAOPERACION >= '29/07/25 00:00:00'
and m.DTFECHAOPERACION <  '30/07/25 00:00:00';



---------------------------







select soperacion as "OPERACI�N", co.inumcomercio "CLIENTE", co.scomercio "COMERCIO" , o.sfolioventa "FOLIO", coop.ifoliocomercio "FOLIOCOMERCIO", trunc(o.dtfechaoperacion) "FECHA",
to_char(o.dtfechaoperacion, 'HH24:MI') "HORA", to_char(o.dtfechaoperacion,'DD/MM/YYYY HH24:MI:SS') FECHAHORA,
    lvd1.smensajesalidaapi "OPERACI�N GUARDADA SALIDA API",
    lvd1.dtfecha "OPERACI�N GUARDADA FECHA",
    lvd2.smensajesalidaapi "SALDO PROTEGIDO SALIDA API",
    lvd2.dtfecha "SALDO PROTEGIDO FECHA",
    lvd3.smensajesalidaapi "OPERACI�N DETALLE GUARDADA SALIDA API",
    lvd3.dtfecha "OPERACI�N DETALLE GUARDADA FECHA",
    lvd4.smensajesalidaapi "CONFIRMACI�N DE SALDO PROTEGIDO SALIDA API",
    lvd4.dtfecha "CONFIRMACI�N DE SALDO PROTEGIDO FECHA",
    lvd5.smensajesalidaapi "EXITOSA SALIDA API",
	lvd5.dtfecha "EXITOSA FECHA",
o.sestatustransaccion "ESTATUS", o.dmontoventa "MONTO DE VENTA", o.dmontocobrado "MONTO COBRADO"
,o.stipomovimiento "TIPO", NVL(smotivo,' ') "MOTIVO", o.icantidad "CANTIDAD", o.dsaldoanterior "SALDO ANTERIOR", o.dsaldoactual "SALDO ACTUAL",e.sestatus, co.snombregrupocomercial "GRUPO COMERCIAL"
--,opdet.authcode,opdet.systemtrace,opdet.cardholder,opdet.result,opdet.pan,opdet.serial,tp.sdescripcion
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    --left join comercio.operacionesdet opdet on coop.uidoperacion=opdet.uidoperacion
LEFT JOIN (
select co.scomercio,o.sfolioventa
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
where o.DTFECHAOPERACION >= TO_DATE('08-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('09-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%' and o.sestatustransaccion = 'CANCELADA'
)X ON x.scomercio = co.scomercio and x.sfolioventa = o.sfolioventa
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus='OPERACI�N GUARDADA'
	left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus='SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus='OPERACI�N DETALLE GUARDADA'
	left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus='CONFIRMACI�N DE SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus='EXITOSA'
where o.DTFECHAOPERACION >= TO_DATE('08-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('09-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%' and o.sestatustransaccion = 'CONFIRMADA'
and x.sfolioventa is null
order by o.DTFECHAOPERACION desc
;

----------------------------------------------------------------




select * from MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA where ifolioMovimiento = 10365443;
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
WHERE M.uidoperacion IS not NULL
AND o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
AND o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
and o.dtfechaoperacion < TO_DATE('03-08-2025 23:59:59', 'DD-MM-YYYY HH24:MI:SS') 
AND o.dtfechaoperacion > TO_DATE('01-08-2025 19:40:00', 'DD-MM-YYYY HH24:MI:SS')
--AND snumeromonedero IS not NULL;
--COMMIT; 
AND snumeromonedero = '1000000000276803';






------------------------------------------------------------------------------------------------------------------------
WITH registros_ordenados AS (
    SELECT 
        INUMEROTARJETA,
        TRUNC(DTFECHAOPERACION) AS FECHA,
        DTFECHACREACION,
        LOADTRANSCOUNTER,
        DSALDO,
        IERROR,
        ROW_NUMBER() OVER (
            PARTITION BY INUMEROTARJETA, TRUNC(DTFECHAOPERACION)
            ORDER BY DTFECHAOPERACION DESC
        ) AS RN
    FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC 
)
, ultimos_n_dias as (
SELECT 
    INUMEROTARJETA,
    FECHA,
    DTFECHACREACION,
    LOADTRANSCOUNTER,
    DSALDO,
    IERROR,ROW_NUMBER() OVER (
            PARTITION BY INUMEROTARJETA
            ORDER BY FECHA DESC
        ) AS RN2
FROM registros_ordenados
WHERE RN = 1 --and trunc(FECHA) > sysdate -7
--AND IERROR = 2
)
SELECT n.inumerotarjeta
, e.dsaldo saldoMON
,SALDO saldoNFC
,n2.ierror
,NVL(Reincidencias,0)Reincidencias
, max(n.FECHA) fechaoperacion
, loadtranscounter2 ltc_nfc
, LTC_listas
, fecharecarga
,fechalista
,montorecarga
, CASE WHEN XA.STARJETA IS NULL THEN 'Sin agrupador' else 'Con agrupacion' end Agrupado--, r.ID
FROM ultimos_n_dias n
inner join ultimos_n_dias n2 on n2.inumerotarjeta = n.inumerotarjeta and n2.RN2 = 1
inner join monederoconsultas.estadodecuenta e on e.inumtarjeta = n.inumerotarjeta
inner join (select STARJETA,
   MAX(dtfechacreacion) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS fecharecarga
  ,MAX(dtfechamodificacion) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS fechalista
  ,MAX(dsaldoactual) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS montorecarga
  ,MAX(icontadorrecarga) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS LTC_listas
    FROM SINCRONIZADOR.CAMBIOSMONEDERO WHERE UIDLISTACUENTAS <> '00000000-0000-0000-0000-000000000000'  GROUP BY STARJETA ) CM ON CM.STARJETA = n.inumerotarjeta
LEFT JOIN (SELECT inumerotarjeta, COUNT(0) Reincidencias FROM ultimos_n_dias WHERE IERROR = 2 and FECHA > SYSDATE -10 GROUP BY inumerotarjeta) X ON X.inumerotarjeta = n.inumerotarjeta
INNER JOIN (
select inumerotarjeta,
   MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
  ,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  ,MAX(loadtranscounter)  AS loadtranscounter2
  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  GROUP BY inumerotarjeta
) XX ON XX.inumerotarjeta = N2.inumerotarjeta
LEFT JOIN (SELECT STARJETA FROM SINCRONIZADOR.CAMBIOSMONEDERO WHERE BCABECERAGRUPO >0 GROUP BY STARJETA) XA ON XA.STARJETA = N2.inumerotarjeta
--LEFT JOIN sincronizador.recargas r ON r.spanhash = e.spanhash and  r.icontadorrecarga = LTC_listas
where 1=1
AND n2.ierror = 2 --and (abs(e.dsaldo)-abs(n2.dsaldo))>0
and loadtranscounter2 < LTC_listas
--and e.dsaldo <> SALDO
and e.dsaldo > 0
and e.sestatus = 'ACTIVO'
--and r.ID is not null
and  n.inumerotarjeta like '5%'
and NVL(Reincidencias,0) > 0
and DTFECHAOPERACION > sysdate -10
and fechalista < DTFECHAOPERACION
--and XA.STARJETA is null
GROUP BY n.inumerotarjeta, n2.loadtranscounter,e.dsaldo,n2.dsaldo,n2.ierror,NVL(Reincidencias,0), LTC_listas, fecharecarga,fechalista,montorecarga,
DTFECHAOPERACION,SALDO,loadtranscounter2,CASE WHEN XA.STARJETA IS NULL THEN 'Sin agrupador' else 'Con agrupacion' end
--,r.ID
order by DTFECHAOPERACION desc,reincidencias desc, fechalista asc
FETCH FIRST 10 ROWS ONLY



select * from openloop.transacciones



---------------------------------------------





select t2.inumeromonedero,t2.icontadorrecarga, t2.icontadorrecargaaplicada,t1.idoperacion ,
t1.* 
from sincronizador.cambiosmonedero t1
left join sincronizador.monedero t2  on t1.starjeta = t2.inumerotarjeta 
where idoperacion in 
(select idoperacion from sincronizador.cambiosmonedero
where trunc(DTFECHACREACION) = trunc(sysdate-1)
and starjeta in (select inumerotarjeta from sincronizador.monedero where inumeromonedero in (1000000000156031,1000000000726501,1000000000224846,1000000000196030,1000000000707161,1000000000707161))
group by idoperacion having count(1) >1)
and uidlistacuentas ='00000000-0000-0000-0000-000000000000';


--------------21/08/25

--
-- with base as (Select t3.ICONTADORRECARGA
--                    , t3.ICONTADORRECARGAAPLICADA
--                    , t2.STARJETA
--                    , t2.ICONTADORRECARGA as contadorLista
--                    , t2.DTFECHACREACION
--                    , t2.DTFECHAMODIFICACION
--                    , t2.UIDLISTACUENTAS
--               from SINCRONIZADOR.CAMBIOSMONEDERO t2
--                        inner join SINCRONIZADOR.MONEDERO t3 on t2.STARJETA = t3.INUMEROTARJETA
--               where t2.DTFECHACREACION >= TO_DATE('2025-08-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
--                 and t2.DTFECHACREACION <= TO_DATE('2025-08-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
--                 and t3.ICONTADORRECARGAAPLICADA < t3.ICONTADORRECARGA
--                 and t3.ICONTADORRECARGAAPLICADA < t2.ICONTADORRECARGA
--                 and t2.UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000')
-- select t1.* from base t1;
--
-- select UIDCAMBIOSMONEDERO, UIDLISTACUENTAS, STARJETA, SESTATUSMONEDERO, ICONTADORTRANSACIONES,
-- DSALDOACTUAL, SCRIPTOGRAMARECARGA, ICONTADORRECARGA,TO_CHAR(DTFECHACREACION, 'dd/MM/yyyy HH24:MI:SS')  DTFECHACREACION,TO_CHAR(DTFECHAMODIFICACION, 'dd/MM/yyyy HH24:MI:SS') DTFECHAMODIFICACION, DTFECHABAJA,
-- BACTIVO, BBAJA, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, UIDUSUARIOCREACION, ITIPOBLOQUEADO, IDOPERACION,
-- SPANHASH, BAPLICADA, IFOLIOMOVIMIENTO, UIDGRUPORECARGA, BCABECERAGRUPO
-- FROM SINCRONIZADOR.cambiosmonedero where starjeta=:numBusqueda order by icontadorrecarga DESC;
-- select * from SINCRONIZADOR.MONEDERO where INUMEROTARJETA = :numBusqueda;








-- REPLICAS DE QA

---REPLICAS DE CREDENCIALIZACION TARJETAS POR UIDTARJETA -->
-- ASIGNAR UIDMONEDERO SOBRE UsuariosTarjetas ->
-- y actualizar con scripts de replicas compartidas.
--#
with base as (
SELECT DISTINCT U.UIDMONEDEROAPP UIDMONEDERO, P.DTFECHAINICIOPERIODO , P.DTFECHAFINPERIODO
    --COUNT(0) AS discrepancias
        FROM CREDENCIALIZACION.USUARIOSTARJETAS u
        INNER JOIN CREDENCIALIZACION.PERIODOSTARJETAS p ON p.UIDMONEDERO = U.UIDMONEDEROAPP AND p.BACTIVO = 1
        INNER JOIN APPMONEDEROCOMMAND.ESTADODECUENTA e ON e.UIDMONEDERO = U.UIDMONEDEROAPP
    WHERE U.BACTIVO = 1 AND U.BBAJA = 0
      --AND U.UIDTIPOTARIFA <> '24665f64-1ef6-4404-b59a-3fd3cd74a9be'
        AND E.ITIPOTARJETA<>0
        AND p.BACTIVO = 1 AND p.BBAJA = 0
        AND (e.DTFECHAFINVIGENCIA is null OR e.DTFECHAFINVIGENCIA <> P.DTFECHAFINPERIODO)
        AND (e.DTFECHAINICIOVIGENCIA is null OR e.DTFECHAINICIOVIGENCIA <> P.DTFECHAFINPERIODO))
select t1.* from APPMONEDEROCOMMAND.ESTADODECUENTA  t1
         where t1.UIDMONEDERO in (select UIDMONEDERO from base);

select * from CREDENCIALIZACION.USUARIOSTARJETAS where BACTIVO = 1 and BBAJA=0 and BTARJETAASIGNADA=1;
select * from CREDENCIALIZACION.TARJETAS where INUMEROTARJETA = '5000000000765019';
select * from CREDENCIALIZACION.USUARIOSTARJETAS where UIDTARJETA = 'fd28335a-30bd-40ba-82f6-08dc5d15fe6d';

select * from APPMONEDEROCOMMAND.ESTADODECUENTA where UIDMONEDERO = 'adfe2420-2d70-42b3-b846-d208408a2182';

select t3.UIDTARJETA,t2.DTFECHAINICIOVIGENCIA,t2.DTFECHAFINVIGENCIA,t3.UIDMONEDERO
from CREDENCIALIZACION.TARJETAS t1
 join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
and t1.BACTIVO = 1 and t1.BBAJA =0
and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be';

select
t1.UIDTARJETA,t1.INUMEROTARJETA,t1.BACTIVO,t1.BBAJA,t1.SCCV
--,t3.UIDTARJETA,t3.INUMEROTARJETA,t3.BACTIVOTARJETA,t3.BBAJATARJETA,t3.SCCV
from CREDENCIALIZACION.TARJETAS t1
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t1.UIDTARJETA = t3.UIDTARJETA
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
and t1.BACTIVO = 1 and t1.BBAJA =0
  and t3.BACTIVOMONEDERO = 1 and t3.BBAJAMONEDERO = 0
and (t3.UIDTARJETA is null or t3.INUMEROTARJETA is null or t3.BACTIVOTARJETA is null or t3.BBAJATARJETA is null or t3.SCCV is null)
--diferencias
;

MERGE INTO APPMONEDEROCOMMAND.ESTADODECUENTA REPLICA
USING (
select t1.UIDTARJETA
     ,t1.INUMEROTARJETA,t3.INUMEROTARJETA,t1.UIDMONEDERO,t1.BACTIVO,t1.BBAJA,t1.SCCV
--,t3.UIDTARJETA,t3.INUMEROTARJETA,t3.BACTIVOTARJETA,t3.BBAJATARJETA,t3.
from CREDENCIALIZACION.TARJETAS t1
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t1.UIDMONEDERO = t3.UIDMONEDERO
where  (t3.INUMEROTARJETA is null or t3.BACTIVOTARJETA is null or t3.BBAJATARJETA is null or t1.SCCV is null)
    ) ORIGEN
ON (REPLICA.UIDMONEDERO = ORIGEN.UIDMONEDERO)
WHEN MATCHED THEN
    UPDATE SET REPLICA.BACTIVOTARJETA = ORIGEN.BACTIVO
                , REPLICA.BBAJATARJETA = ORIGEN.BBAJA
                ,REPLICA.SCCV = ORIGEN.SCCV;
commit;

select * from APPMONEDEROQUERY.ESTADODECUENTA where INUMEROTARJETA = '5000000001107587';
select * from CREDENCIALIZACION.TARJETAS where UIDTARJETA = '166038f2-aab7-4fbe-e574-08dd42ec9e63';

-- MERGE INTO APPMONEDEROCOMMAND.ESTADODECUENTA REPLICA
-- USING (
--     select t3.UIDTARJETA
--          ,t2.DTFECHAINICIOVIGENCIA
--          ,t2.DTFECHAFINVIGENCIA
--          ,t3.UIDMONEDERO
-- from CREDENCIALIZACION.TARJETAS t1
--  join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
--  join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
-- where
--     (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
-- and t1.BACTIVO = 1 and t1.BBAJA =0
-- and t2.BACTIVO =1 and t2.BBAJA=0
-- and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
-- and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
--     ) ORIGEN
-- ON (REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA)
-- WHEN MATCHED THEN
--     UPDATE SET REPLICA.DTFECHAINICIOVIGENCIA = ORIGEN.DTFECHAINICIOVIGENCIA
--                 , REPLICA.DTFECHAFINVIGENCIA = ORIGEN.DTFECHAFINVIGENCIA;



-- SELECT u.UIDTARJETA,u.UIDMONEDERO,ut.UIDMONEDEROAPP
-- FROM CREDENCIALIZACION.TARJETAS u
-- INNER JOIN CREDENCIALIZACION.USUARIOSTARJETAS ut
-- ON u.UIDTARJETA = ut.UIDTARJETA
-- WHERE ut.UIDMONEDEROAPP Is NULL;
--
--

select
    t2.DTFECHACREACION usuariostarejetas,
    t2.UIDUSUARIOTARJETA,
    t1.INUMEROTARJETA,
    t1.INUMEROMONEDERO,
    t1.UIDMONEDERO as uidCredTarjetasMonedero,
    t1.DTFECHAFABRICACION,
    t1.DTFECHACREACION,
    t3.UIDTARJETA
         ,t2.DTFECHAINICIOVIGENCIA
         ,t2.DTFECHAFINVIGENCIA
         ,t3.UIDMONEDERO
     ,t2.UIDMONEDEROAPP
         ,t3.DTFECHAINICIOVIGENCIA
        ,t3.DTFECHAFINVIGENCIA
,t3.BBAJATARJETA
,t3.BACTIVOTARJETA
,t3.SCCV
from CREDENCIALIZACION.TARJETAS t1
 join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
 and t1.BACTIVO = 1 and t1.BBAJA =0
 and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
--and t2.UIDMONEDEROAPP is null
;



select
--      count(1)
TARJETAS.INUMEROTARJETA,TARJETAS.UIDMONEDERO,USUARIOSTARJETAS.UIDMONEDEROAPP,
ESTADODECUENTA.UIDMONEDERO ,(select INUMEROTARJETA from CREDENCIALIZACION.TARJETAS where UIDMONEDERO = USUARIOSTARJETAS.UIDMONEDEROAPP) as tarjetaMala
from CREDENCIALIZACION.TARJETAS TARJETAS
    join CREDENCIALIZACION.USUARIOSTARJETAS USUARIOSTARJETAS on USUARIOSTARJETAS.UIDTARJETA = TARJETAS.UIDTARJETA
        join APPMONEDEROCOMMAND.ESTADODECUENTA ESTADODECUENTA on ESTADODECUENTA.UIDTARJETA = USUARIOSTARJETAS.UIDTARJETA
where (TARJETAS.UIDMONEDERO <> USUARIOSTARJETAS.UIDMONEDEROAPP or TARJETAS.UIDMONEDERO <> ESTADODECUENTA.UIDMONEDERO)
--and t1.BACTIVO = 1 and t1.BBAJA = 0
and TARJETAS.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be';


--------APPMONEDEROCOMMAND

MERGE INTO APPMONEDEROCOMMAND.ESTADODECUENTA REPLICA
USING (
    select t3.UIDTARJETA
         ,t2.DTFECHAINICIOVIGENCIA
         ,t2.DTFECHAFINVIGENCIA
         ,t3.UIDMONEDERO
from CREDENCIALIZACION.TARJETAS t1
 join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
 and t1.BACTIVO = 1 and t1.BBAJA =0
 and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
    ) ORIGEN
ON (REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA)
WHEN MATCHED THEN
    UPDATE SET REPLICA.DTFECHAINICIOVIGENCIA = ORIGEN.DTFECHAINICIOVIGENCIA
                , REPLICA.DTFECHAFINVIGENCIA = ORIGEN.DTFECHAFINVIGENCIA;

--------APPMONEDEROQUERY
MERGE INTO APPMONEDEROQUERY.ESTADODECUENTA REPLICA
USING (
    select t3.UIDTARJETA
         ,t2.DTFECHAINICIOVIGENCIA
         ,t2.DTFECHAFINVIGENCIA
         ,t3.UIDMONEDERO
from CREDENCIALIZACION.TARJETAS t1
 join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
 join APPMONEDEROQUERY.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
and t1.BACTIVO = 1 and t1.BBAJA =0
and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
    ) ORIGEN
ON (REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA)
WHEN MATCHED THEN
    UPDATE SET REPLICA.DTFECHAINICIOVIGENCIA = ORIGEN.DTFECHAINICIOVIGENCIA
                , REPLICA.DTFECHAFINVIGENCIA = ORIGEN.DTFECHAFINVIGENCIA;

commit;
--
-- select * from APPTICKETS.ESTADODECUENTA
--          where UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
--            and UIDTIPOMONEDERO='9be96cf8-4ee2-4762-9f77-7c817e851c03'
-- and BACTIVO = 1 and BBAJA = 0
-- and (DTFECHAINICIOVIGENCIA is null or DTFECHAFINVIGENCIA is null);
--
-- select * from CREDENCIALIZACION.USUARIOSTARJETAS where UIDMONEDEROAPP in (
--     select UIDMONEDERO from APPTICKETS.ESTADODECUENTA
--          where UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
--            and UIDTIPOMONEDERO='9be96cf8-4ee2-4762-9f77-7c817e851c03'
-- and BACTIVO = 1 and BBAJA = 0
-- and (DTFECHAINICIOVIGENCIA is null or DTFECHAFINVIGENCIA is null)
--     )
-- ;
select * from MONEDEROCOMANDOS.MONEDERO;

MERGE INTO APPTICKETS.ESTADODECUENTA REPLICA
USING (
    select t3.UIDMONEDERO
         ,t2.DTFECHAINICIOVIGENCIA
         ,t2.DTFECHAFINVIGENCIA
from MONEDEROCOMANDOS.MONEDERO t1
 join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDMONEDERO = t2.UIDMONEDEROAPP
 join APPTICKETS.ESTADODECUENTA t3 on t2.UIDMONEDEROAPP = t3.UIDMONEDERO
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
and t1.BACTIVO = 1 and t1.BBAJA =0
and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
and t3.UIDTIPOTARIFA <> '24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and t3.UIDTIPOMONEDERO = '9be96cf8-4ee2-4762-9f77-7c817e851c03'
and t3.BACTIVO = 1
and t3.BBAJA = 0
    ) ORIGEN
ON (REPLICA.UIDMONEDERO = ORIGEN.UIDMONEDERO)
WHEN MATCHED THEN
    UPDATE SET REPLICA.DTFECHAINICIOVIGENCIA = ORIGEN.DTFECHAINICIOVIGENCIA
                , REPLICA.DTFECHAFINVIGENCIA = ORIGEN.DTFECHAFINVIGENCIA;
commit;

--
-- DIFERENCIA DE FECHAS DE VIGENCIA EN MONEDEROS

MERGE INTO CREDENCIALIZACION.USUARIOSTARJETAS REPLICA
USING (
    SELECT ut.DTFECHAULTMOD,u.UIDTARJETA,u.INUMEROTARJETA,u.UIDMONEDERO,ut.UIDMONEDEROAPP
FROM CREDENCIALIZACION.TARJETAS u
INNER JOIN CREDENCIALIZACION.USUARIOSTARJETAS ut
ON u.UIDTARJETA = ut.UIDTARJETA
WHERE ut.UIDMONEDEROAPP Is NULL
order by ut.DTFECHAULTMOD desc
    ) ORIGEN
ON (REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA)
WHEN MATCHED THEN
    UPDATE SET REPLICA.UIDMONEDEROAPP = ORIGEN.UIDMONEDERO;

--#


------------




---------



select * from RIDANGOSYNC.RUTAS;

select * from
             RIDANGOSYNC.VIEW_RUTA_VERSION_R
join
;

select * from RIDANGOSYNC.FORMAS_RUTAS order by ISECUENCIA;
select * from RIDANGOSYNC.PARADEROS;


--SELECT COUNT(0), 'GTFS_CALENDARIO' FROM RIDANGOSYNC.GTFS_CALENDARIO gt WHERE gt.BACTIVO = 1 UNION

SELECT COUNT(0), 'FORMAS_RUTAS' FROM RIDANGOSYNC.FORMAS_RUTAS gt  WHERE gt.BACTIVO = 1 UNION
SELECT COUNT(0), 'GTFS_INFORMACION' FROM RIDANGOSYNC.GTFS_INFORMACION gt  WHERE gt.BACTIVO = 1 UNION
SELECT COUNT(0), 'PARADEROS' FROM RIDANGOSYNC.PARADEROS gt WHERE gt.BACTIVO = 1 UNION
SELECT COUNT(0), 'PARADERO_RUTAS' FROM RIDANGOSYNC.PARADERO_RUTAS gt UNION
SELECT COUNT(0), 'RUTAS' FROM RIDANGOSYNC.RUTAS gt WHERE gt.BACTIVO = 1 UNION

SELECT COUNT(0), 'RUTAS SIGNAL' FROM SIGNALRQUERY.RUTAS gt--UNION


    SELECT ut.DTFECHAULTMOD,u.UIDTARJETA,u.INUMEROTARJETA,u.UIDMONEDERO,ut.UIDMONEDEROAPP
FROM CREDENCIALIZACION.TARJETAS u
INNER JOIN CREDENCIALIZACION.USUARIOSTARJETAS ut
ON u.UIDTARJETA = ut.UIDTARJETA
WHERE ut.UIDMONEDEROAPP Is NULL
and ut.UIDTARJETA not in ('')
order by ut.DTFECHAULTMOD desc







    ;
    ---------------------




     select
   t1.inumerotarjeta,t1.BACTIVO,t2.BACTIVO comercioActivo,t1.BBAJA ,t2.BBAJA as comercioBaja,t1.DTFECHAMODIFICACION
  from credencializacion.tarjetas t1
  join COMERCIO.monederostarjetas t2 on t1.inumerotarjeta  =t2.inumtarjeta
  where t2.BACTIVO <>t1.BACTIVO or t2.BBAJA <> t1.BBAJA
  order by t1.dtfechamodificacion desc;


select t1.UIDESTATUS, t2.UIDESTATUS
from MONEDEROCONSULTAS.ESTADODECUENTA t1
         join COMERCIO.MONEDEROSTARJETAS t2 on t1.INUMMONEDERO = t2.INUMMONEDERO
where 1 = 1
--   AND t1.UIDESTATUS <> t2.UIDESTATUS
  AND T1.INUMMONEDERO = '1000000001100790'
;
SELECT * FROM CREDENCIALIZACION.TARJETAS WHERE INUMEROTARJETA  = '9899982186677783'





SELECT owner, trigger_name, table_name, status, triggering_event
FROM dba_triggers;

select * from CREDENCIALIZACION.TARJETAS where INUMEROMONEDERO = '1000000000249637'




-----------------------------------------------------------------------------------------------









-----------------APPMONEDEROCOMMAND

MERGE INTO APPMONEDEROCOMMAND.ESTADODECUENTA REPLICA
USING (
select t1.UIDTARJETA, t3.UIDTARJETA UIDTARJETA_replica
     ,t1.INUMEROTARJETA ,t3.INUMEROTARJETA INUMEROTARJETA_replica
     ,t1.UIDMONEDERO,t3.UIDMONEDERO UIDMONEDERO_replica
     ,t1.BACTIVO,t1.BBAJA
     ,t1.SCCV,T3.SCCV SCCV_replica
--,t3.UIDTARJETA,t3.INUMEROTARJETA,t3.BACTIVOTARJETA,t3.BBAJATARJETA,t3.
from CREDENCIALIZACION.TARJETAS t1
join MONEDEROCONSULTAS.ESTADODECUENTA t2 on t1.UIDMONEDERO = t2.UIDMONEDERO
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDMONEDERO = t3.UIDMONEDERO
where
    1=1
    AND T2.BACTIVO = 1 AND T2.BBAJA =0
    AND T1.BACTIVO = 1 AND T1.BBAJA=0
    AND (t3.BACTIVOTARJETA is null or t3.BBAJATARJETA is null)
--    AND T3.ITIPOTARJETA = 0
    ) ORIGEN
ON (REPLICA.UIDMONEDERO = ORIGEN.UIDMONEDERO)
WHEN MATCHED THEN
    UPDATE SET REPLICA.BACTIVOTARJETA = ORIGEN.BACTIVO
                , REPLICA.BBAJATARJETA = ORIGEN.BBAJA
                ,REPLICA.SCCV = ORIGEN.SCCV
                , REPLICA.INUMEROTARJETA = ORIGEN.INUMEROTARJETA
                ,REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA;
-- commit;
--
-- -----------------APPMONEDEROQUERY

MERGE INTO APPMONEDEROQUERY.ESTADODECUENTA REPLICA
USING (
select t1.UIDTARJETA, t3.UIDTARJETA UIDTARJETA_replica
     ,t1.INUMEROTARJETA ,t3.INUMEROTARJETA INUMEROTARJETA_replica
     ,t1.UIDMONEDERO,t3.UIDMONEDERO UIDMONEDERO_replica
     ,t1.BACTIVO,t1.BBAJA
     ,t1.SCCV
--,t3.UIDTARJETA,t3.INUMEROTARJETA,t3.BACTIVOTARJETA,t3.BBAJATARJETA,t3.
from CREDENCIALIZACION.TARJETAS t1
 join APPMONEDEROQUERY.ESTADODECUENTA t3 on t1.UIDMONEDERO = t3.UIDMONEDERO
where
    1=1
    AND T1.BACTIVO = 1 and t1.BBAJA = 0
    AND (t3.BACTIVOTARJETA is null or t3.BBAJATARJETA is null)
--    AND T3.ITIPOTARJETA = 0
    ) ORIGEN
ON (REPLICA.UIDMONEDERO = ORIGEN.UIDMONEDERO)
WHEN MATCHED THEN
    UPDATE SET REPLICA.BACTIVOTARJETA = ORIGEN.BACTIVO
                , REPLICA.BBAJATARJETA = ORIGEN.BBAJA
                , REPLICA.INUMEROTARJETA = ORIGEN.INUMEROTARJETA
                ,REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA;
-- commit;



with base as (select t1.UIDTARJETA
                   , t3.UIDTARJETA  UIDTARJETA_replica
                   , t1.INUMEROTARJETA
                   , t3.INUMEROTARJETA
                   , t1.UIDMONEDERO
                   , t3.UIDMONEDERO UIDMONEDERO_replica
                   , t1.BACTIVO
                   , t1.BBAJA
                   , t1.SCCV
                   , T3.SCCV        SCCV_replica
--,t3.UIDTARJETA,t3.INUMEROTARJETA,t3.BACTIVOTARJETA,t3.BBAJATARJETA,t3.
              from CREDENCIALIZACION.TARJETAS t1
                       join MONEDEROCONSULTAS.ESTADODECUENTA t2 on t1.UIDMONEDERO = t2.UIDMONEDERO
                       join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDMONEDERO = t3.UIDMONEDERO
              where 1 = 1
                AND T2.BACTIVO = 1
                AND T2.BBAJA = 0
                AND T1.BACTIVO = 1
                AND T1.BBAJA = 0
                AND (t3.BACTIVOTARJETA is null or t3.BBAJATARJETA is null))
select UIDMONEDERO,count(1) from base
group by UIDMONEDERO
having count(1) > 2;

---------------------



--------APPMONEDEROCOMMAND

MERGE INTO APPMONEDEROCOMMAND.ESTADODECUENTA REPLICA
USING (
    select t3.UIDTARJETA
         ,t2.DTFECHAINICIOVIGENCIA
         ,t2.DTFECHAFINVIGENCIA
         ,t3.UIDMONEDERO
from CREDENCIALIZACION.TARJETAS t1
 join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
 join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
where
    (t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
-- and t1.BACTIVO = 1 and t1.BBAJA =0
-- and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
    ) ORIGEN
ON (REPLICA.UIDTARJETA = ORIGEN.UIDTARJETA)
WHEN MATCHED THEN
    UPDATE SET REPLICA.DTFECHAINICIOVIGENCIA = ORIGEN.DTFECHAINICIOVIGENCIA
                , REPLICA.DTFECHAFINVIGENCIA = ORIGEN.DTFECHAFINVIGENCIA;


SELECT T1.DTFECHAINICIOVIGENCIA DTFECHAINICIOVIGENCIA_replica, t2.DTFECHAINICIOVIGENCIA
,T1.DTFECHAFINVIGENCIA DTFECHAFINVIGENCIA_replica, t2.DTFECHAFINVIGENCIA
FROM APPMONEDEROCOMMAND.ESTADODECUENTA  T1
         JOIN CREDENCIALIZACION.USUARIOSTARJETAS T2 on T1.UIDTARJETA = T2.UIDTARJETA
        JOIN CREDENCIALIZACION.TARJETAS T3 ON T3.UIDTARJETA = T2.UIDTARJETA
         WHERE 1 =1
                AND (T1.DTFECHAFINVIGENCIA IS NULL OR T1.DTFECHAINICIOVIGENCIA IS NULL)
                AND (T2.DTFECHAFINVIGENCIA IS NOT NULL AND T2.DTFECHAINICIOVIGENCIA IS NOT NULL)
                AND T1.ITIPOTARJETA <>0
                AND t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
                AND T1.BACTIVOTARJETA = 1 AND T1.BACTIVOMONEDERO=1
                --AND T2.BACTIVO = 1 AND T2.BBAJA=0
                AND T3.BACTIVO =1 AND T3.BBAJA=0;



SELECT * FROM CREDENCIALIZACION.USUARIOSTARJETAS WHERE UIDUSUARIOTARJETA IN (

    SELECT T2.UIDUSUARIOTARJETA
FROM APPMONEDEROCOMMAND.ESTADODECUENTA  T1
         JOIN CREDENCIALIZACION.USUARIOSTARJETAS T2 on T1.UIDTARJETA = T2.UIDTARJETA
        JOIN CREDENCIALIZACION.TARJETAS T3 ON T3.UIDTARJETA = T2.UIDTARJETA
         WHERE 1 =1
                AND (T1.DTFECHAFINVIGENCIA IS NULL OR T1.DTFECHAINICIOVIGENCIA IS NULL)
                AND (T2.DTFECHAFINVIGENCIA IS NOT NULL AND T2.DTFECHAINICIOVIGENCIA IS NOT NULL)
                AND T1.ITIPOTARJETA <>0
                AND t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
                AND T1.BACTIVOTARJETA = 1 AND T1.BACTIVOMONEDERO=1
                --AND T2.BACTIVO = 1 AND T2.BBAJA=0
                AND T3.BACTIVO =1 AND T3.BBAJA=0
    )
select * from APPMONEDEROCOMMAND.ESTADODECUENTA where INUMEROTARJETA = '5000000000550517';

select * from CREDENCIALIZACION.TARJETAS where INUMEROTARJETA = '5000000000081596';



SELECT * FROM APPMONEDEROQUERY.MOTIVOS

;

select
t2.DTFECHACREACION usuariostarejetas,
t2.UIDUSUARIOTARJETA,
t1.INUMEROTARJETA,
t1.INUMEROMONEDERO,
t1.UIDMONEDERO as uidCredTarjetasMonedero,
t1.DTFECHAFABRICACION,
t1.DTFECHACREACION,
t3.UIDTARJETA
,t2.DTFECHAINICIOVIGENCIA
,t2.DTFECHAFINVIGENCIA
,t3.UIDMONEDERO
,t2.UIDMONEDEROAPP
,t3.DTFECHAINICIOVIGENCIA
,t3.DTFECHAFINVIGENCIA
,t3.BBAJATARJETA
,t3.BACTIVOTARJETA
,t3.SCCV
from CREDENCIALIZACION.TARJETAS t1
join CREDENCIALIZACION.USUARIOSTARJETAS t2 on t1.UIDTARJETA = t2.UIDTARJETA
join APPMONEDEROCOMMAND.ESTADODECUENTA t3 on t2.UIDTARJETA = t3.UIDTARJETA
where
(t3.DTFECHAINICIOVIGENCIA is null or t3.DTFECHAFINVIGENCIA is null)
and t1.BACTIVO = 1 and t1.BBAJA =0
and t2.BACTIVO =1 and t2.BBAJA=0
and t1.UIDTIPOTARIFA <>'24665f64-1ef6-4404-b59a-3fd3cd74a9be'
and (t2.DTFECHAFINVIGENCIA is not null and t2.DTFECHAINICIOVIGENCIA is not null)
;

select SFOLIOEXTERNOTARJETA,DTFECHACREACION,DTFECHAULTMOD from CREDENCIALIZACION.USUARIOSTARJETAS order by DTFECHACREACION desc;








select * from catalogos.RUTAS;


SELECT "r"."UIDRUTA" "uIdRuta",
       "r"."SCLAVERUTA" "OrigenClave",
       "r0"."SCLAVERUTA" "DestinoClave"
FROM "RUTAS" "r"
LEFT JOIN (
    SELECT "t"."uIdRutaOrigen",
           "t"."uIdRutaDestino"
    FROM "Transbordos" "t"
    WHERE (("t"."bAplicaTransbordo" <> 0)
       AND (("t"."bActivo" <> 0) AND ("t"."bBaja" = 0)))
) "t0" ON "r"."UIDRUTA" = "t0"."uIdRutaOrigen"
LEFT JOIN "RUTAS" "r0" ON "t0"."uIdRutaDestino" = "r0"."UIDRUTA"
ORDER BY "r"."UIDRUTA";




SELECT "r"."UIDRUTA" "uIdRuta",
       "r"."SCLAVERUTA" "OrigenClave",
       "r0"."SCLAVERUTA" "DestinoClave"
FROM "RUTAS" "r"
    LEFT JOIN "Transbordos" "t0"  on "t0"."uIdRutaOrigen" = "r"."UIDRUTA"
LEFT JOIN "RUTAS" "r0" ON "t0"."uIdRutaDestino" = "r0"."UIDRUTA"
    WHERE (("t0"."bAplicaTransbordo" <> 0)
       AND (("t0"."bActivo" <> 0) AND ("t0"."bBaja" = 0)))
ORDER BY "r"."UIDRUTA";










SELECT "t"."UIDRUTA" "uIdRuta",
       "t"."SCLAVERUTA" "OrigenClave",
       "r0"."SCLAVERUTA" "DestinoClave"
FROM (
    SELECT "r"."UIDRUTA",
           "r"."SCLAVERUTA"
    FROM "RUTAS" "r"
    ORDER BY "r"."UIDRUTA"
    OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY
) "t"
LEFT JOIN (
    SELECT "t1"."uIdRutaOrigen",
           "t1"."uIdRutaDestino"
    FROM "Transbordos" "t1"
    WHERE (("t1"."bAplicaTransbordo" <> 0)
       AND (("t1"."bActivo" <> 0) AND ("t1"."bBaja" = 0)))
) "t0" ON "t"."UIDRUTA" = "t0"."uIdRutaOrigen"
LEFT JOIN "RUTAS" "r0" ON "t0"."uIdRutaDestino" = "r0"."UIDRUTA"
ORDER BY "t"."UIDRUTA";


select * from APPMONEDEROCOMMAND.ESTADODECUENTA where INUMEROTARJETA = '5000000001106463';
select * from APPMONEDEROQUERY.ESTADODECUENTA where INUMEROTARJETA = '5000000000613852';

update   APPMONEDEROQUERY.ESTADODECUENTA set BACTIVOTARJETA= 1 ,BBAJATARJETA=0 where INUMEROTARJETA = '5000000000613852';



select t1.UIDTARJETA, t3.UIDTARJETA UIDTARJETA_replica
     ,t1.INUMEROTARJETA ,t3.INUMEROTARJETA INUMEROTARJETA_replica
     ,t1.UIDMONEDERO,t3.UIDMONEDERO UIDMONEDERO_replica
     ,t1.BACTIVO,t1.BBAJA
     ,t1.SCCV
--,t3.UIDTARJETA,t3.INUMEROTARJETA,t3.BACTIVOTARJETA,t3.BBAJATARJETA,t3.
from CREDENCIALIZACION.TARJETAS t1
 join APPMONEDEROQUERY.ESTADODECUENTA t3 on t1.UIDMONEDERO = t3.UIDMONEDERO
where
    1=1
    AND T1.BACTIVO = 1 and t1.BBAJA = 0
    AND (t3.BACTIVOTARJETA is null or t3.BBAJATARJETA is null)
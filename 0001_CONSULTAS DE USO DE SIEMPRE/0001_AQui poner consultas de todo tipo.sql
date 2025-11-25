---2197df29-b5e5-42cb-b6f0-9e1c4f5a2e9e
select t2.SNOMBRE, t1.*
from COMERCIO.OPERACIONES t1
join COMERCIO.ESTATUSTRANSACCION t2 on t1.UIDESTATUSOPERACION = t2.UIDESTATUSTRANSACCION
where t1.IFOLIOVENTA = '11702861';

select * from PAGOS.ORDENES Po
         join select * from catalo
         where
                                1=1 and DMONTO = 50
                                and UIDMONEDERO = (select UIDMONEDERO from credencializacion.tarjetas where inumerotarjeta = '5000000000291286')
order by DTFECHA desc;

-- ver datos de los procesados

select * from SINCRONIZADOR.RECARGAS_PENDIENTES where BAPLICADA = 0 and BDUPLICADA = 0;--5000000000589378 ||| --5000000001193577

SELECT TO_CHAR(TRUNC(NVAFECHAPROCESAR  ), 'yyyy/MM/dd') AS NVAFECHAPROCESARDato,
       COUNT(*)
FROM SINCRONIZADOR.AJUSTEDEB t1
WHERE bProcesado = 1
--and (NVAFECHAPROCESAR - (6/24)) >= '18/08/2025'
GROUP BY TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'yyyy/MM/dd')
order by TO_CHAR(TRUNC(NVAFECHAPROCESAR ), 'yyyy/MM/dd') desc;
------------------------------------------------------------------
SELECT TO_CHAR(TRUNC(FECHAPROCESADO  ), 'yyyy/MM/dd') AS FechaProceso,
       COUNT(*)
FROM SINCRONIZADOR.AJUSTEDEB t1
WHERE bProcesado = 1
and (FECHAPROCESADO - (6/24)) >= '18/08/2025'
GROUP BY TO_CHAR(TRUNC(FECHAPROCESADO), 'yyyy/MM/dd')
order by TO_CHAR(TRUNC(FECHAPROCESADO ), 'yyyy/MM/dd') desc;
--------------------------------------------------------------
with baseTarjetas as (
SELECT INUMEROTARJETA AS sTarjeta,
       COUNT(*)
FROM SINCRONIZADOR.AJUSTEDEB t1
WHERE bProcesado = 1
and (FECHAPROCESADO - (6/24)) >= '18/08/2025'
group by INUMEROTARJETA)
select count(1) from baseTarjetas;
--------------------------------------------------------------------------------

with t1 as (SELECT INUMEROTARJETA        as tarjeta,
                   COUNT(*)              as DebitacionesAplicadas,
                   sum(NVODMONTOCOBRADO) as totalCobrado
            FROM SINCRONIZADOR.AJUSTEDEB t1
            WHERE bProcesado = 1
              and (FECHAPROCESADO - (6 / 24)) >= '18/08/2025'
            GROUP BY INUMEROTARJETA)

select t1.*
     , t2.STIPOTARIFA
     , t2.DSALDO as saldoMonedero
     , (select DSALDO
        from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
        where INUMEROTARJETA = t1.tarjeta
          AND SINCIDENCIA not like 'DEB. PEND.%'-->CORRECCION A NIVEL DATOS PORQUE NO DEBE TOMAR LOS REPROCESOS QUE HAYAMOS HECHO
          AND SINCIDENCIA not like 'SIM. DEB. PEND.%'-->CONDICION PARA EVITAR AGARRAR LOS QUE SEAN REPROCESOS)
        order by DTFECHAOPERACION desc
        fetch  first 1 rows only
)                as saldoTarjeta
from t1
         join MONEDEROCONSULTAS.ESTADODECUENTA t2 on t1.tarjeta = t2.INUMTARJETA
order by DebitacionesAplicadas desc;

with Base as (SELECT INUMEROTARJETA        as tarjeta,
                   COUNT(*)              as DebitacionesAplicadas,
                   sum(NVODMONTOCOBRADO) as totalCobrado
            FROM SINCRONIZADOR.AJUSTEDEB t1
            WHERE bProcesado = 1
              and (FECHAPROCESADO - (6 / 24)) >= '18/08/2025'
            GROUP BY INUMEROTARJETA)
, BaseMasLtc as (
    select t1.tarjeta,t2.ICONTADORRECARGA as totalRecargas from Base t1
             join SINCRONIZADOR.MONEDERO t2 on t1.tarjeta = t2.INUMEROTARJETA
)
, ToTalRecargasListas as (
    select t1.STARJETA,count(1) as cantidad_recargasListas from SINCRONIZADOR.CAMBIOSMONEDERO t1
                       join base t2 on t1.STARJETA = t2.tarjeta
                       where t1.BCABECERAGRUPO = 0
                       --and trunc(t1.DTFECHACREACION) > to_date('20/08/2025')
                       group by t1.STARJETA
)
, TotalCriptogramasRepetidos as (
        select t1.STARJETA,SCRIPTOGRAMARECARGA,ICONTADORRECARGA, count(1) from SINCRONIZADOR.CAMBIOSMONEDERO t1
                       join base t2 on t1.STARJETA = t2.tarjeta
                       where t1.BCABECERAGRUPO = 0
                      -- and trunc(t1.DTFECHACREACION) > to_date('20/08/2025')
                       group by t1.STARJETA,SCRIPTOGRAMARECARGA,ICONTADORRECARGA
),
    OperacionesTraspaso as (
        select t1.IDOPERACION from SINCRONIZADOR.CAMBIOSMONEDERO t1
                 join TotalCriptogramasRepetidos t2 on t1.STARJETA = t2.STARJETA and t1.SCRIPTOGRAMARECARGA = t2.SCRIPTOGRAMARECARGA
    )
select t1.tarjeta,t1.totalRecargas,t2.cantidad_recargasListas from BaseMasLtc t1
join ToTalRecargasListas t2 on t1.tarjeta = t2.STARJETA
join TotalCriptogramasRepetidos t3  on t2.STARJETA = t3.STARJETA
where t2.cantidad_recargasListas > t1.totalRecargas;

--------------------------------------------------------------






select INUMTARJETA,DSALDO from MONEDEROCONSULTAS.ESTADODECUENTA where INUMTARJETA = '5000000000901189'



select t2.SNOMBRE,t1.*
from COMERCIO.OPERACIONES t1
join COMERCIO.ESTATUSTRANSACCION t2 on t1.UIDESTATUSOPERACION =t2.UIDESTATUSTRANSACCION

where t1.IFOLIOVENTA = '11294776'






-- consulta para logins de usuarios recaudo

SELECT
    RT.UIDUSUARIO,
    TO_CHAR(MAX(RT.dtfechamodificacion), 'DD/MM/YYYY HH24:MI:SS') AS dtLastLogin
FROM Seguridad.RefreshToken RT
INNER JOIN Seguridad.Usuarios su
    ON su.uidusuario = RT.uidusuario
    where trunc(RT.dtfechamodificacion) = trunc(sysdate-6/24)
GROUP BY
    RT.UIDUSUARIO;


select US.UIDUSUARIO,US.SUSERNAME,US.SNOMBRES,US.SAPELLIDOS,US.SEMAIL from SEGURIDAD.USUARIOS US;

select US.SEMAIL from SEGURIDAD.USUARIOS US group by us.SEMAIL;
select * from Seguridad.RefreshToken









--------------------------------------------------------------------



;
select * from MONEDEROCONSULTAS.MOVIMIENTOS where UIDOPERACION in ('b2a6f400-7c19-4377-868c-407dfe740b10',
'8847c7c9-ecce-4721-8273-329ca541736d');

select * from SINCRONIZADOR.RECARGAS_PENDIENTES where BAPLICADA = 0 and BDUPLICADA = 0;






select count(1), SUM(CO.DMONTOVENTA) from COMERCIOCONSULTAS.OPERACIONES CO
where Co.DTFECHAOPERACION >= TO_DATE('04-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
AND Co.DTFECHAOPERACION < TO_DATE('05-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS');


select trunc(DTFECHAOPERACION),count(1), SUM(abs(CO.DMONTOVENTA)) from COMERCIOCONSULTAS.OPERACIONES CO
where Co.DTFECHAOPERACION >= TO_DATE('01-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
AND Co.DTFECHAOPERACION < TO_DATE('01-08-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and SESTATUSTRANSACCION <> 'CONFIRMADA'
group by trunc(DTFECHAOPERACION)
order by trunc(DTFECHAOPERACION) ;



select trunc(DTFECHAOPERACION),coco.SNOMBREGRUPOCOMERCIAL,count(1),sum(co.DMONTOVENTA)
from COMERCIOCONSULTAS.OPERACIONES CO
inner join comercio.COMERCIOS COCO on co.UIDCOMERCIO =COCO.UIDCOMERCIO
where Co.DTFECHAOPERACION >= TO_DATE('01-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
AND Co.DTFECHAOPERACION < TO_DATE('01-08-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and SESTATUSTRANSACCION <> 'CONFIRMADA'
group by trunc(DTFECHAOPERACION),coco.SNOMBREGRUPOCOMERCIAL
order by  trunc(DTFECHAOPERACION) asc;

--
-- with base_julio as (select o.soperacion as                        "OPERACION",
--                            co.inumcomercio                        "CLIENTE",
--                            co.scomercio                           "COMERCIO",
--                            o.sfolioventa                          "FOLIO",
--                            trunc(o.dtfechaoperacion)              "FECHA",
--                            to_char(o.dtfechaoperacion, 'HH24:MI') "HORA"
--                             ,
--                            o.sestatustransaccion                  "ESTATUS",
--                            o.dmontoventa                          "MONTO DE VENTA",
-- --o.dmontocobrado "MONTO COBRADO",
--                            o.dmontoventa - (o.dmontoventa *

--                                --when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then 0 --OXXO
--                                                                 when op.uidcomercio = '926527d5-bf3a-45eb-95ac-0b458aadaf35'
--                                                                     then 2.5 --AKI
--                                                                 when op.uidcomercio = '8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9'
--                                                                     then 2.9 --DUNOSUSA
--                                                                 when op.uidcomercio = '5c1656c3-fe1d-4a63-8bed-68528510434c'
--                                                                     then 3.132 --SIX
--                                                                 when op.uidcomercio = '3845c2dc-2d4a-4b08-b50e-fe3996bc029d'
--                                                                     then 2.5 --WILLYS
--                                                                 when co.snombregrupocomercial = 'COMISARIAS' then 6.38
--                                                                 else 0
--                                end / 100)                         "MONTO COBRADO",
--                            o.stipomovimiento                      "TIPO",
--                            NVL(o.smotivo, ' ')                    "MOTIVO",
--                            o.icantidad                            "CANTIDAD",
--                            o.dsaldoanterior                       "SALDO ANTERIOR",
--                            o.dsaldoactual                         "SALDO ACTUAL",
--                            e.sestatus,
--                            co.snombregrupocomercial               "GRUPO COMERCIAL",
--                            case
--                                when op.uidcomercio = '797f81f4-e741-4d3f-9768-81ff237a65b6' then ltrim(regexp_substr(
--                                        regexp_substr(op.sdatosadicionales, '[^|]+', 1, 7), '[^:]+', 1, 2))--OXXO
--                                when op.uidcomercio = '926527d5-bf3a-45eb-95ac-0b458aadaf35' then regexp_substr(
--                                        regexp_substr(op.sdatosadicionales, '[^|]+', 1, 1), '\S+', 1, 2) --AKI
--                                when op.uidcomercio = '8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then ltrim(regexp_substr(
--                                        regexp_substr(op.sdatosadicionales, '[^|]+', 1, 1), '[^:]+', 1, 2))--DUNOSUSA
--                                when op.uidcomercio = '5c1656c3-fe1d-4a63-8bed-68528510434c' then regexp_substr(
--                                        regexp_substr(op.sdatosadicionales, '[^|]+', 1, 2), '\S+', 1, 2) --SIX
--                                when op.uidcomercio = '3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then regexp_substr(
--                                        regexp_substr(op.sdatosadicionales, '[^|]+', 1, 1), '[^:]+', 1, 2)--WILLYS
--                                else ltrim(regexp_substr(op.sdatosadicionales, '[^|]+', 1, 2)) --CIFO
--                                end                                "SUCURSAL",
--                            case
--                                --when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then 0 --OXXO
--                                when op.uidcomercio = '926527d5-bf3a-45eb-95ac-0b458aadaf35' then 2.5 --AKI
--                                when op.uidcomercio = '8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then 2.9 --DUNOSUSA
--                                when op.uidcomercio = '5c1656c3-fe1d-4a63-8bed-68528510434c' then 3.132 --SIX
--                                when op.uidcomercio = '3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then 2.5 --WILLYS
--                                when co.snombregrupocomercial = 'COMISARIAS' then 6.38
--                                else 0
--                                end                                "COMISION"
--                     from COMERCIOCONSULTAS.operaciones o
--                              inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
--                              inner join catalogos.estatus e on e.uidestatus = co.uidestatus
--                              left join comercio.operaciones op on op.uidoperacion = o.uidoperacion
--                     where o.DTFECHAOPERACION > TO_DATE('14-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
--                       AND o.DTFECHAOPERACION < TO_DATE('15-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS'))
--  select o.FECHA,count(1) as trxs,sum("MONTO DE VENTA") from base_julio o
-- group by fecha
-- order by o.FECHA desc
-- ;

---------------------CON COMISIONES
--APP
-- NOMBRE DE ARCHIVO: COMERCIOS_APP_YYYYMMDD.csv
--RUTA SFTP: /sftp/comercios_admin/comercios_app_admin
with base_julio as (SELECT
                        --M.UIDOPERACION,
                        O.SCONCEPTO                 AS                                                 OPERACION,
                        TT.SNOMBRE                  AS                                                 TIPOTRANSACCION,
                        TM.STIPOMONEDERO            AS                                                 TIPOMONEDERO,
                        TMOV.SNOMBRE                AS                                                 TIPOMOVIMIENTO,
                        trunc(M.DTFECHAOPERACION)                           DTFECHAOPERACION,
--                         trunc(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS')                           DTFECHAOPERACION,
                        M.SEMISOR                   AS                                                 COMERCIO,
                        --O.IOPCION_PAGO,
                        CASE
                            WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
                            WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
                            WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
                            WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
                            END                                                                        GRUPOCOMERCIAL,
                        TO_CHAR(M.IFOLIOMOVIMIENTO) AS                                                 FOLIOINTERNO,
                        TO_CHAR(MON.INUMMONEDERO)   AS                                                 INUMMONEDERO,
                        TF.STIPOTARIFA              AS                                                 TIPOTARIFA,
                        TO_CHAR(M.DMONTO)           AS                                                 DMONTO,
                        M.DMONTO - (M.DMONTO * CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END / 100) MONTOCOBRADO,
                        CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END                               COMISION_PORC
                    FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
                             LEFT JOIN CREDENCIALIZACION.TARJETAS T ON T.UIDMONEDERO = M.UIDMONEDERO
                             LEFT JOIN MONEDEROCOMANDOS.MONEDERO MON ON MON.UIDMONEDERO = M.UIDMONEDERO
                             LEFT JOIN CATALOGOS.TIPOTARIFAS TF ON TF.UIDTIPOTARIFA = MON.UIDTIPOTARIFA
                             LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT ON TT.UIDTIPOTRANSACCION = M.UIDTIPOTRANSACCION
                             LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO = M.UIDTIPOSMONEDERO
                             LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV ON TMOV.UIDTIPOMOVIMIENTO = M.UIDTIPOMOVIMIENTO
                             LEFT JOIN COMERCIO.COMERCIOS C ON C.SCOMERCIO = M.SEMISOR
                             LEFT JOIN PAGOS.ORDENES O ON O.UIDORDEN = M.UIDOPERACION
                    WHERE M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
                      AND M.SEMISOR = 'APP'
                      AND M.DMONTO > 0
                      AND M.UIDOPERACION NOT IN (SELECT b.UIDOPERACION
                                                 FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                          INNER JOIN (SELECT A.UIDOPERACION,
                                                                             uidmonedero,
                                                                             ifoliomovimiento,
                                                                             trunc(dtfechaoperacion) fecha
                                                                      FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                                      WHERE SOBSERVACIONES != 'REVERSA OXXO WAY'
                                                                        AND semisor IN ('CADENA COMERCIAL OXXO')) b
                                                                     ON b.UIDMONEDERO = a.UIDMONEDERO AND
                                                                        b.IFOLIOMOVIMIENTO = a.IFOLIOMOVIMIENTO AND
                                                                        b.FECHA = trunc(A.dtfechacreacion)
                                                 WHERE SOBSERVACIONES = 'REVERSA OXXO WAY')
                      AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or M.UIDTIPOOPERACION is null)
                      and O.SCONCEPTO is not null
                      AND m.DTFECHAOPERACION >= '01/07/25 00:00:00'
                      and m.DTFECHAOPERACION < '01/08/25 00:00:00')
select DTFECHAOPERACION,count(1) trxs, sum(abs(DMONTO)) from base_julio
group by DTFECHAOPERACION
;




















SELECT DISTINCT
	o.UIDOPERACION,
    'e350f3d3-c742-4a13-9674-edeafc171893' AS UIDTIPOTRANSACCION,
    'CARGO M.F'  AS TIPOTRANSACCION,
    tm.stipomonedero AS TIPOMONEDERO,
    o.stipomovimiento AS TIPOMOVIMIENTO,
    to_char(o.DTFECHAOPERACION,'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
	CO.SCOMERCIO AS COMERCIO,
    O.UIDCOMERCIO AS UIDCOMERCIO,
    O.SFOLIOVENTA AS FOLIOINTERNO,
    m.uidmonedero AS UIDMONEDERO,
    TO_CHAR(do.SNUMEROMONEDERO) AS INUMMONEDERO,
    tt.stipotarifa AS TIPOTARIFA,
    TO_CHAR(-O.DMONTOVENTA) AS DMONTO
from COMERCIOCONSULTAS.operaciones o
    inner join comercioconsultas.detalleoperaciones do on do.uidoperacion=o.uidoperacion
    inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
    inner join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join monederocomandos.monedero m on m.inummonedero=do.snumeromonedero
    left join catalogos.tipotarifas tt on tt.uidtipotarifa=m.uidtipotarifa
    left join catalogos.tiposmonedero tm on tm.uidtipomonedero=m.uidtiposmonedero
WHERE
o.SESTATUSTRANSACCION='CONFIRMADA'
AND EXTRACT(YEAR FROM o.DTFECHAOPERACION) = 2025 AND EXTRACT(MONTH FROM o.DTFECHAOPERACION) = 9 AND EXTRACT(DAY FROM o.DTFECHAOPERACION) in (11)
--AND o.DTFECHAOPERACION >= sysdate-1
--AND o.DTFECHAOPERACION < sysdate







--------------------
with dwh_julio as (SELECT M.UIDOPERACION,
                          M.UIDTIPOTRANSACCION        AS                       UIDTIPOTRANSACCION,
                          TT.SNOMBRE                  AS                       TIPOTRANSACCION,
                          TM.STIPOMONEDERO            AS                       TIPOMONEDERO,
                          TMOV.SNOMBRE                AS                       TIPOMOVIMIENTO,
                          to_char(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
                          M.SEMISOR                   AS                       COMERCIO,
                          'APP'                       AS                       UIDCOMERCIO,
                          TO_CHAR(M.IFOLIOMOVIMIENTO) AS                       FOLIOINTERNO,
                          M.UIDMONEDERO               AS                       UIDMONEDERO,
                          TO_CHAR(MON.INUMMONEDERO)   AS                       INUMMONEDERO,
                          TF.STIPOTARIFA              AS                       TIPOTARIFA,
                          TO_CHAR(M.DMONTO)           AS                       DMONTO
                   FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
                            LEFT JOIN CREDENCIALIZACION.TARJETAS T ON T.UIDMONEDERO = M.UIDMONEDERO
                            LEFT JOIN MONEDEROCOMANDOS.MONEDERO MON ON MON.UIDMONEDERO = M.UIDMONEDERO
                            LEFT JOIN CATALOGOS.TIPOTARIFAS TF ON TF.UIDTIPOTARIFA = MON.UIDTIPOTARIFA
                            LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT ON TT.UIDTIPOTRANSACCION = M.UIDTIPOTRANSACCION
                            LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO = M.UIDTIPOSMONEDERO
                            LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV ON TMOV.UIDTIPOMOVIMIENTO = M.UIDTIPOMOVIMIENTO
                            LEFT JOIN COMERCIO.COMERCIOS C ON C.SCOMERCIO = M.SEMISOR
                            LEFT JOIN PAGOS.ORDENES O ON O.UIDORDEN = M.UIDOPERACION
                   WHERE M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
                     AND M.SEMISOR = 'APP'
                     AND M.DMONTO > 0
                     AND M.UIDOPERACION NOT IN (SELECT b.UIDOPERACION
                                                FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                         INNER JOIN (SELECT A.UIDOPERACION,
                                                                            uidmonedero,
                                                                            ifoliomovimiento,
                                                                            trunc(dtfechaoperacion) fecha
                                                                     FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                                     WHERE SOBSERVACIONES != 'REVERSA OXXO WAY'
                                                                       AND semisor IN ('CADENA COMERCIAL OXXO')) b
                                                                    ON b.UIDMONEDERO = a.UIDMONEDERO AND
                                                                       b.IFOLIOMOVIMIENTO = a.IFOLIOMOVIMIENTO AND
                                                                       b.FECHA = trunc(A.dtfechacreacion)
                                                WHERE SOBSERVACIONES = 'REVERSA OXXO WAY')
                     AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or M.UIDTIPOOPERACION is null)
                     and O.SCONCEPTO is not null
                     AND EXTRACT(YEAR FROM M.DTFECHAOPERACION) = 2025
                     AND EXTRACT(MONTH FROM M.DTFECHAOPERACION) = 9
                     AND EXTRACT(DAY FROM M.DTFECHAOPERACION) in (11))
select * from dwh_julio




;
with oci_julio_APP as (SELECT
                           --M.UIDOPERACION,
                           O.SCONCEPTO                 AS                                                 OPERACION,
                           TT.SNOMBRE                  AS                                                 TIPOTRANSACCION,
                           TM.STIPOMONEDERO            AS                                                 TIPOMONEDERO,
                           TMOV.SNOMBRE                AS                                                 TIPOMOVIMIENTO,
                           trunc(M.DTFECHAOPERACION)                                                      DTFECHAOPERACION,
--     to_char(M.DTFECHAOPERACION,'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
                           M.SEMISOR                   AS                                                 COMERCIO,
                           --O.IOPCION_PAGO,
                           CASE
                               WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
                               WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
                               WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
                               WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
                               END                                                                        GRUPOCOMERCIAL,
                           TO_CHAR(M.IFOLIOMOVIMIENTO) AS                                                 FOLIOINTERNO,
                           TO_CHAR(MON.INUMMONEDERO)   AS                                                 INUMMONEDERO,
                           TF.STIPOTARIFA              AS                                                 TIPOTARIFA,
                           TO_CHAR(M.DMONTO)           AS                                                 DMONTO,
                           M.DMONTO - (M.DMONTO * CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END / 100) MONTOCOBRADO,
                           CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END                               COMISION_PORC
                       FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
                                LEFT JOIN CREDENCIALIZACION.TARJETAS T ON T.UIDMONEDERO = M.UIDMONEDERO
                                LEFT JOIN MONEDEROCOMANDOS.MONEDERO MON ON MON.UIDMONEDERO = M.UIDMONEDERO
                                LEFT JOIN CATALOGOS.TIPOTARIFAS TF ON TF.UIDTIPOTARIFA = MON.UIDTIPOTARIFA
                                LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT ON TT.UIDTIPOTRANSACCION = M.UIDTIPOTRANSACCION
                                LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO = M.UIDTIPOSMONEDERO
                                LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV ON TMOV.UIDTIPOMOVIMIENTO = M.UIDTIPOMOVIMIENTO
                                LEFT JOIN COMERCIO.COMERCIOS C ON C.SCOMERCIO = M.SEMISOR
                                LEFT JOIN PAGOS.ORDENES O ON O.UIDORDEN = M.UIDOPERACION
                       WHERE M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
                         AND M.SEMISOR = 'APP'
                         AND M.DMONTO > 0
                         AND M.UIDOPERACION NOT IN (SELECT b.UIDOPERACION
                                                    FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                             INNER JOIN (SELECT A.UIDOPERACION,
                                                                                uidmonedero,
                                                                                ifoliomovimiento,
                                                                                trunc(dtfechaoperacion) fecha
                                                                         FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                                         WHERE SOBSERVACIONES != 'REVERSA OXXO WAY'
                                                                           AND semisor IN ('CADENA COMERCIAL OXXO')) b
                                                                        ON b.UIDMONEDERO = a.UIDMONEDERO AND
                                                                           b.IFOLIOMOVIMIENTO = a.IFOLIOMOVIMIENTO AND
                                                                           b.FECHA = trunc(A.dtfechacreacion)
                                                    WHERE SOBSERVACIONES = 'REVERSA OXXO WAY')
                         AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or
                              M.UIDTIPOOPERACION is null)
                         and O.SCONCEPTO is not null
                         AND m.DTFECHAOPERACION >= '28/07/25 00:00:00'
                         and m.DTFECHAOPERACION < '29/07/25 00:00:00')
select count(1),sum(DMONTO) from oci_julio_APP;


--------------------------------------------------------------------------------------------------------------------------------------------------------

WITH AUTOBUS AS (
SELECT AR.UIDAUTOBUS,AR.UIDCHOFER,h.UIDHORARIO,h.SHORARIO,h.SHORAINICIO, h.SHORAFINAL ,ROW_NUMBER() OVER (ORDER BY trunc(AR.DTFECHACREACION) DESC) idrow
    FROM SINCRONIZADOR.AUTOBUSRUTACHOFER AR
    left JOIN CATALOGOS.HORARIOS h ON h.UIDHORARIO = AR.UIDHORARIO
    WHERE AR.BACTIVO  = 1 and h.bactivo=1)

SELECT
'OPEN LOOP' STIPOMONEDERO
,'EMV' UIDTIPOSMONEDERO
,'EMV' STIPOTRANSACCION
      ,OL.SIDTRANSACCION UIDDETALLESINCRONIZADOR
      ,A.UIDAUTOBUS
      ,UPPER(NVL(AUT.SPLACAS,'xxx-xxx-0')) SPLACAS
      ,NVL(AUT.SNUMECO,'000') SNUMECO
      ,UPPER(NVL(T.STIPO,'NO ASIGNADO')) STIPOAUTOBUS
      ,M.SMARCA SMARCAAUTOBUS
      ,M2.SMODELO SMODELOAUTOBUS
      ,VS.UIDVALIDADOR
      ,VS.SVALIDADOR
      ,R.UIDRUTA
      ,R.SRUTA IRUTA
      ,R.SCLAVERUTA SRUTA
      ,A.UIDHORARIO
      ,A.SHORARIO
      ,OL.SLONGITUD
      ,OL.SLATITUD
      ,A.UIDCHOFER
      ,UPPER(NVL(CH.SNOMBRE,'NO ASIGNADO')) SNOMBRECHOFER
      ,NVL(UPPER(C2.UIDCONCESIONARIO),'00000000-0000-0000-0000-000000000000') UIDCONCESIONARIO
      ,UPPER(NVL(C2.SNOMBRE,'NO ASIGNADO')) SNOMBRECONCESIONARIO
      ,UPPER(NVL(C2.SRAZONSOCIAL,'NO ASIGNADO')) SRAZONSOCIALCONCESIONARIO
      ,UPPER(NVL(C2.SREPRESENTANTE,'NO ASIGNADO')) SREPRESENTANTECONCESIONARIO
      ,UPPER(NVL(C2.SCLAVE,'NO ASIGNADO'))SCLAVECONCESIONARIO
      ,0 SNUMEROMONEDERO
      ,0 SNOTARJETA
      ,OL.DTFECHAOPERACION
      ,C.SMONEDA SMONEDA
      ,'EMV-BANCARIA' STIPOTARIFA
      ,C.DTARIFAMONTO IMONTOCOBRADO
      ,0 NUMTRANSBORDO
from openloop.transacciones OL
    INNER JOIN SINCRONIZADOR.VSAM V ON V.SCSN = OL.IDVALIDADOR AND V.BACTIVO = 1
    INNER JOIN SINCRONIZADOR.VALIDADORVSAM VV ON VV.UIDVSAM = V.UIDVSAM AND VV.BACTIVO = 1
    INNER JOIN SINCRONIZADOR.VALIDADORES VS ON VS.UIDVALIDADOR=VV.UIDVALIDADOR AND VS.BACTIVO=1
    INNER JOIN SINCRONIZADOR.AUTOBUSVALIDADOR AV ON AV.UIDVALIDADOR=VS.UIDVALIDADOR AND AV.BACTIVO=1
    INNER JOIN SINCRONIZADOR.AUTOBUSES AUT ON AUT.UIDAUTOBUS=AV.UIDAUTOBUS AND AUT.BACTIVO=1
    INNER JOIN OPENLOOP.RUTAS R ON R.SCLAVERUTA = OL.SIDRUTA
    INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
    INNER JOIN AUTOBUS A ON A.UIDAUTOBUS = AUT.UIDAUTOBUS
    LEFT JOIN CATALOGOS.MARCASAUTOBUSES M ON M.UIDMARCAAUTOBUS = AUT.UIDMARCA
    LEFT JOIN CATALOGOS.MODELOSAUTOBUSES M2 ON M2.UIDMODELOAUTOBUS = AUT.UIDMODELO
    LEFT JOIN CATALOGOS.TIPOSAUTOBUSES T ON t.UIDTIPOAUTOBUS = AUT.STIPO
    LEFT JOIN CATALOGOS.CHOFERES CH ON CH.UIDCHOFER = A.UIDCHOFER
    LEFT JOIN SINCRONIZADOR.CONCESIONARIOS C2 ON C2.UIDCONCESIONARIO = AUT.UIDCONCESIONARIO
WHERE OL.SESTADOOPERACION IN ('PENDIENTE','LIQUIDADO')
AND OL.DTFECHAOPERACION>= TO_DATE('28-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
AND OL.DTFECHAOPERACION>= TO_DATE('01-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
AND OL.DTFECHAOPERACION<= TO_DATE('01-08-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
-- AND EXTRACT(YEAR FROM OL.DTFECHAOPERACION) = 2025 AND EXTRACT(MONTH FROM OL.DTFECHAOPERACION) = 8 AND EXTRACT(DAY FROM OL.DTFECHAOPERACION)  in (4,5)
    order by dtfechaoperacion desc);


    select trunc(Ol.DTFECHAOPERACION),count(1) from OPENLOOP.TRANSACCIONES OL
                                                   INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION

    where OL.SESTADOOPERACION in ('PENDIENTE','LIQUIDADO')
    AND OL.DTFECHAOPERACION>= TO_DATE('01-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
AND OL.DTFECHAOPERACION< TO_DATE('01-08-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    group by trunc(Ol.DTFECHAOPERACION)
    order by trunc(ol.DTFECHAOPERACION)
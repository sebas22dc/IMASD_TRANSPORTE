WITH BASE_NFC AS (select nfc.uidvalidador,
                         nfc.UIDDETALLESINCRONIZADOR,
                         nfc.dtfechaoperacion,
--                          nfc.LOADTRANSCOUNTER,
                         nfc.inumerotarjeta,
                         nfc.dmontocobrado,
                         nfc.iruta,
                         nfc.DTFECHACREACION,
                         nfc.IERROR,
                         nfc.STIPOTARIFA,
                         nfc.TOKENTRANSACCION,
                         nfc.DSALDO,
                         nfc.ITRANSBORDO,
                         nfc.BPROCESADO,
                         nfc.UIDSINCRONIZACION
                  from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                  where 1 = 1
-- 				     and nfc.dtfechaoperacion >= to_date('03/10/2025 00:00:00', 'dd/mm/yyyy hh24:mi:ss')
--                      and nfc.dtfechaoperacion < to_date('04/10/2025 00:00:00', 'dd/mm/yyyy hh24:mi:ss')
                    -- AND NFC.DTFECHAOPERACION >= trunc((sysdate - 6 / 24) - [DESDE_MAS])
                    -- AND NFC.DTFECHAOPERACION < trunc((sysdate - 6 / 24) - [HASTA])
                    -- AND NFC.DTFECHAOPERACION >= (sysdate - 6 / 24 -10/1440 ) --rango entre hace 10 minutos
                    -- AND NFC.DTFECHAOPERACION <= (sysdate - 6 / 24 -5/1440 ) -- rango entre hace 5 minutos
                    AND trunc(NFC.DTFECHAOPERACION) = trunc(sysdate - 6 / 24) -- DIA HOY
--                     AND NFC.DTFECHAOPERACION <= (sysdate - 6 / 24 - 10 / 1440) -- rango entre hace 5 minutos

                    AND (INUMEROTARJETA > 0 and INUMEROTARJETA is not null)),
     BASE_INICIO AS (SELECT 'Tarjeta Inteligente'                          TIPOTRANSACCION,
                            NFC.DTFECHAOPERACION,
                            --AGREGADOS POR AUDITORIA
--                             (select SM.ICONTADORRECARGA from SINCRONIZADOR.MONEDERO SM where SM.INUMEROTARJETA = nfc.INUMEROTARJETA) as LTC_TOTALES,
--                             (select SM.ICONTADORRECARGAAPLICADA from SINCRONIZADOR.MONEDERO SM where SM.INUMEROTARJETA = nfc.INUMEROTARJETA) as LTC_APLICADO,
--                             NFC.LOADTRANSCOUNTER,
                            --AGREGADOS POR AUDITORIA
                            to_char(nfc.DTFECHAOPERACION, 'yyyy/MM/dd') as DIA_OPERACION,
                            to_char(nfc.DTFECHAOPERACION, 'HH24:MI:SS') as HORA_OPERACION,
                            NFC.DTFECHACREACION,
                            nfc.UIDDETALLESINCRONIZADOR,
                            M.UIDMONEDERO,
                            nfc.DMONTOCOBRADO,
                            nfc.IERROR                                     ERROR_tarjeta,
                            COALESCE(M.STIPOTARIFA, NFC.STIPOTARIFA)       STIPOTARIFA,
                            COALESCE(TO_CHAR(M.INUMTARJETA), '0')          INUMEROTARJETA,
                            NFC.TOKENTRANSACCION,
--                             M.DSALDO                                    AS SALDO_MONEDERO,
--                             NVL(A.ABONOS, 0)                            AS TOTAL_ABONOS,
                            NFC.DMONTOCOBRADO                              DMONTO,
                            CASE (NFC.IERROR)
                                WHEN 0 THEN NFC.DSALDO + NFC.DMONTOCOBRADO
                                ELSE NFC.DSALDO END                        DSALDOANTERIOR,
                            NFC.ITRANSBORDO,
                            -- CASE
                            -- WHEN NFC.IERROR = 0 THEN 'Confirmada'
                            -- WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000'
                            -- THEN 'Confirmada'
                            -- WHEN NFC.IERROR = 5 and TOKENTRANSACCION = '00000000000000000000000000000000'
                            -- THEN 'Error en lectura'
                            -- WHEN NFC.IERROR = 1 THEN 'Tarjeta expirada'
                            -- WHEN NFC.IERROR = 2 AND (M.DSALDO - NFC.DMONTOCOBRADO) <= 0 THEN 'Sin saldo'
                            -- WHEN NFC.IERROR = 2 AND (m.DSALDO - NFC.DMONTOCOBRADO) > 0 THEN 'Rechazada'
                            -- WHEN NFC.IERROR = 3 THEN 'Deny list'
                            -- WHEN NFC.IERROR = 4 THEN 'Tarjeta no soportada'
                            -- WHEN NFC.IERROR = 6 THEN 'Falta configurar tarifa'
                            -- WHEN NFC.IERROR = 7 THEN 'Error en recarga'
                            -- WHEN NFC.IERROR = 100 THEN 'Tarjeta recargada'
                            -- ELSE 'Otro' END                            ESTADOTRANSACCION,
                            CASE
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 0
                                ELSE NFC.IERROR END                        IERROR,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 1
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 1
                                WHEN NFC.IERROR in (2, 3, 4, 6, 7)
                                    THEN ROW_NUMBER() OVER (PARTITION BY NFC.INUMEROTARJETA , TRUNC(NFC.DTFECHAOPERACION),nfc.UIDVALIDADOR , CASE WHEN NFC.IERROR = 0 THEN 1 ELSE 0 END ORDER BY NFC.DTFECHAOPERACION ASC)
                                ELSE 1 END                              AS LIMITE,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 1
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 1
                                ELSE 0 END                                 BEXITOSO,
--                             R.SCLAVERUTA,
--                             R.SRUTA,
                            v.SVALIDADOR,
                            v.SMODELO,
                            AU.SNUMECO,
                            NFC.BPROCESADO
                     FROM BASE_NFC NFC
                              INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA m
                                         ON M.INUMTARJETA = NFC.INUMEROTARJETA
--                               LEFT JOIN SINCRONIZADOR.RUTAS r ON R.SCLAVERUTA = NFC.IRUTA and M.Inumerotarjeta > 0
                              LEFT JOIN SINCRONIZADOR.VALIDADORES v on v.UIDVALIDADOR = NFC.UIDVALIDADOR
                              LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR AV
                                        ON AV.UIDVALIDADOR = v.UIDVALIDADOR AND AV.BACTIVO = 1
                              LEFT JOIN SINCRONIZADOR.AUTOBUSES AU ON AU.UIDAUTOBUS = AV.UIDAUTOBUS),
     baseMasSaldo as (SELECT NVL((select Sum(t1.Dmonto)
                                  from MONEDEROCOMANDOS.movimientosestadosdecuenta t1
                                  where 1 = 1
                                    and t1.uidmonedero = r.UIDMONEDERO
                                    and r.IERROR = 2
--                                     and LIMITE = 1
                                    and t1.dtfechaoperacion < r.DTFECHACREACION
                                  group by r.inumerotarjeta), 0) as MontoMovimiento,
                             r.*
                      FROM BASE_INICIO r)
        ,
     ayudasss as (select (CASE
                              WHEN NFC.ERROR_tarjeta = 0 THEN 'Confirmada'
                              WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION != '00000000000000000000000000000000'
                                  THEN 'Confirmada'
                              WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION = '00000000000000000000000000000000'
                                  THEN 'Error en lectura'
                              WHEN NFC.ERROR_tarjeta = 1 THEN 'Tarjeta expirada'
                              WHEN NFC.ERROR_tarjeta = 2 AND (NFC.MontoMovimiento - NFC.DMONTOCOBRADO) <= 0
                                  THEN 'Sin saldo'
                              WHEN NFC.ERROR_tarjeta = 2 AND (NFC.MontoMovimiento - NFC.DMONTOCOBRADO) > 0
                                  THEN 'Rechazada'
                              WHEN NFC.ERROR_tarjeta = 3 THEN 'Deny list'
                              WHEN NFC.ERROR_tarjeta = 4 THEN 'Tarjeta no soportada'
                              WHEN NFC.ERROR_tarjeta = 6 THEN 'Falta configurar tarifa'
                              WHEN NFC.ERROR_tarjeta = 7 THEN 'Error en recarga'
                              WHEN NFC.ERROR_tarjeta = 100 THEN 'Tarjeta recargada'
                              ELSE 'Otro' END) as ESTADOTRANSACCIONVersion2,
                         NFC.*
                  from baseMasSaldo NFC)
select
    *
--     1,t1.DIA_OPERACION, t1.ESTADOTRANSACCIONVersion2, count(1) cantidad
from ayudasss T1
 where IERROR = 7
-- group by t1.DIA_OPERACION, t1.ESTADOTRANSACCIONVersion2



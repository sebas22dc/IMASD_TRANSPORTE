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
--                     AND NFC.DTFECHAOPERACION >= trunc((sysdate - 6 / 24) - [DESDE_MAS])
--                     AND NFC.DTFECHAOPERACION < trunc((sysdate - 6 / 24) - [HASTA])
--                     AND NFC.DTFECHAOPERACION >= (sysdate - 6 / 24 -10/1440 ) --rango entre hace 10 minutos
--                     AND NFC.DTFECHAOPERACION <= (sysdate - 6 / 24 -5/1440 ) -- rango entre hace 5 minutos
                    AND trunc(NFC.DTFECHAOPERACION) = trunc(sysdate - 6 / 24) -- DIA HOY
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
     agrupacion as (select (CASE
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
select *
from agrupacion
where ERROR_tarjeta = 5 and TOKENTRANSACCION != '00000000000000000000000000000000'
-- group by DIA_OPERACION, ESTADOTRANSACCIONVersion2










select
    *    from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
where trunc(DTFECHAOPERACION)  = trunc(sysdate-6/24)
and INUMEROTARJETA in (
    5000000000034603,
5000000000090262,
5000000000195696,
5000000000203157,
5000000000221176,
5000000000246815,
5000000000259452,
5000000000283593,
5000000000373007,
5000000000418888,
5000000000494980,
5000000000498694,
5000000000512891,
5000000000555685,
5000000000670460,
5000000000687669,
5000000000741976,
5000000000901120,
5000000000941333,
5000000000967674,
5000000000972842,
5000000001085969,
5000000001100145,
5000000000027352,
5000000000045348,
5000000000104476,
5000000000214492,
5000000000242813,
5000000000287025,
5000000000402245,
5000000000488381,
5000000000538941,
5000000000626826,
5000000000647211,
5000000000653818,
5000000000761914,
5000000000764660,
5000000000881000,
5000000000928859,
5000000001109521,
5000000001113170,
5000000001190101,
5000000000039160,
5000000000057521,
5000000000167037,
5000000000197893,
5000000000253245,
5000000000299836,
5000000000423114,
5000000000456161,
5000000000470541,
5000000000485586,
5000000000594722,
5000000000601587,
5000000000671754,
5000000000715946,
5000000000906767,
5000000000925075,
5000000001120354,
5000000000017151,
5000000000053767,
5000000000085935,
5000000000127708,
5000000000135226,
5000000000154765,
5000000000317388,
5000000000386043,
5000000000418220,
5000000000497534,
5000000000532399,
5000000000622630,
5000000000635438,
5000000000636382,
5000000000775720,
5000000000938993,
5000000000965668,
5000000001119811,
5000000001193148
    )



select * from MONEDEROCONSULTAS.MOVIMIENTOS where INUMMONEDERO = (select INUMMONEDERO from MONEDEROCONSULTAS.ESTADODECUENTA where INUMTARJETA = '5000000000034603') order by DTFECHAOPERACION desc




select trunc(DTFECHAOPERACION) dia,SESTADOOPERACION ,count(1) trx  from OPENLOOP.TRANSACCIONES
where trunc(DTFECHAOPERACION) = trunc(SYSDATE-6/24)
group by  trunc(DTFECHAOPERACION),SESTADOOPERACION
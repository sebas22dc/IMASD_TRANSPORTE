WITH BASE_NFC AS (select nfc.uidvalidador,
                         nfc.UIDDETALLESINCRONIZADOR,
                         nfc.dtfechaoperacion,
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
                    and trunc(NFC.DTFECHAOPERACION) >= TRUNC(SYSDATE - 3)
                    AND trunc(nfc.DTFECHAOPERACION) < trunc(sysdate)),
     BASE_INICIO AS (SELECT 'Tarjeta Inteligente'                          TIPOTRANSACCION,
                            NFC.DTFECHAOPERACION,
                            to_char(nfc.DTFECHAOPERACION, 'yyyy/MM/dd') as DIA_OPERACION,
                            NFC.DTFECHACREACION,
                            nfc.UIDDETALLESINCRONIZADOR,
                            e.UIDMONEDERO,
                            nfc.DMONTOCOBRADO,
                            nfc.IERROR                                     ERROR_tarjeta,
                            COALESCE(M.STIPOTARIFA, NFC.STIPOTARIFA)       STIPOTARIFA,
                            COALESCE(TO_CHAR(M.INUMEROTARJETA), '0')       INUMEROTARJETA,
                            NFC.TOKENTRANSACCION,
                            E.DSALDO                                    AS SALDO_MONEDERO,
                            NVL(A.ABONOS, 0)                            AS TOTAL_ABONOS,
                            NFC.DMONTOCOBRADO                              DMONTO,
                            CASE (NFC.IERROR)
                                WHEN 0 THEN NFC.DSALDO + NFC.DMONTOCOBRADO
                                ELSE NFC.DSALDO END                        DSALDOANTERIOR,
                            NFC.ITRANSBORDO,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 'Confirmada'
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000'
                                    THEN 'Confirmada'
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION = '00000000000000000000000000000000'
                                    THEN 'Error en lectura'
                                WHEN NFC.IERROR = 1 THEN 'Tarjeta expirada'
                                WHEN NFC.IERROR = 2 AND (E.DSALDO - NFC.DMONTOCOBRADO) <= 0 THEN 'Sin saldo'
                                WHEN NFC.IERROR = 2 AND (E.DSALDO - NFC.DMONTOCOBRADO) > 0 THEN 'Rechazada'
                                WHEN NFC.IERROR = 3 THEN 'Deny list'
                                WHEN NFC.IERROR = 4 THEN 'Tarjeta no soportada'
                                WHEN NFC.IERROR = 6 THEN 'Falta configurar tarifa'
                                WHEN NFC.IERROR = 7 THEN 'Error en recarga'
                                WHEN NFC.IERROR = 100 THEN 'Tarjeta recargada'
                                ELSE 'Otro' END                            ESTADOTRANSACCION,
                            CASE
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 0
                                ELSE NFC.IERROR END                        IERROR,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 1
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 1
                                WHEN NFC.IERROR in (2, 3, 4, 6, 7)
                                    THEN ROW_NUMBER() OVER (PARTITION BY NFC.INUMEROTARJETA , TRUNC(NFC.DTFECHAOPERACION) , CASE WHEN NFC.IERROR = 0 THEN 1 ELSE 0 END ORDER BY NFC.DTFECHAOPERACION ASC)
                                ELSE 1 END                              AS LIMITE,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 1
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 1
                                ELSE 0 END                                 BEXITOSO,
                            R.SCLAVERUTA,
                            R.SRUTA,
                            v.SVALIDADOR,
                            v.SMODELO,
                            AU.SNUMECO,
                            NFC.BPROCESADO
                     FROM BASE_NFC NFC
                              INNER JOIN SINCRONIZADOR.MONEDERO m
                                         ON M.INUMEROTARJETA = NFC.INUMEROTARJETA and M.Inumerotarjeta > 0
                              LEFT JOIN SINCRONIZADOR.RUTAS r ON R.SCLAVERUTA = NFC.IRUTA and M.Inumerotarjeta > 0
                              LEFT JOIN SINCRONIZADOR.VALIDADORES v on v.UIDVALIDADOR = NFC.UIDVALIDADOR
                              LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR AV
                                        ON AV.UIDVALIDADOR = v.UIDVALIDADOR AND AV.BACTIVO = 1
                              LEFT JOIN SINCRONIZADOR.AUTOBUSES AU ON AU.UIDAUTOBUS = AV.UIDAUTOBUS
                              INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA E ON E.UIDMONEDERO = M.UIDMONEDERO
                              LEFT JOIN (SELECT SUBSTR(TO_CHAR(INUMEROTARJETA), 1, 16) INUMEROTARJETA,
                                                COUNT(*) AS                            ABONOS,
                                                SUM(DMONTO)                            MONTOABONO,
                                                M.UIDMONEDERO,
                                                MAX(M.DTFECHAOPERACION)                DTFECHAOPERACION
                                         FROM MONEDEROCONSULTAS.MOVIMIENTOS M
                                                  INNER JOIN CREDENCIALIZACION.TARJETAS T ON T.UIDMONEDERO = M.UIDMONEDERO
                                         WHERE 1 = 1
                                           AND STIPOMOVIMIENTO = 'ABONO'
                                         GROUP BY INUMEROTARJETA, M.UIDMONEDERO) A
                                        ON A.INUMEROTARJETA = NFC.INUMEROTARJETA
                              LEFT JOIN MONEDEROCOMANDOS.movimientosestadosdecuenta M
                                        ON M.UIDOPERACION = NFC.UIDSINCRONIZACION AND
                                           M.UIDTIPOSMONEDERO = 'e7f21096-73e4-4fe9-aed6-ee29947304b0' AND
                                           M.UIDTIPOMOVIMIENTO = '58956590-095e-4ff5-b1b3-20b2892db778' AND
                                           M.UIDTIPOTRANSACCION = 'e350f3d3-c742-4a13-9674-edeafc171893' AND
                                           M.SEMISOR IS NULL),
     baseMasSaldo as (SELECT NVL((select Sum(t1.Dmonto)
                                  from MONEDEROCOMANDOS.movimientosestadosdecuenta t1
                                  where 1 = 1
                                    and t1.uidmonedero = r.UIDMONEDERO
                                    and r.IERROR = 2
                                    and LIMITE = 1
                                    and t1.dtfechaoperacion < r.DTFECHACREACION
                                  group by r.inumerotarjeta), 0) as MontoMovimiento,
                             r.*
                      FROM BASE_INICIO r)
select (CASE
            WHEN NFC.ERROR_tarjeta = 0 THEN 'Confirmada'
            WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 'Confirmada'
            WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION = '00000000000000000000000000000000' THEN 'Error en lectura'
            WHEN NFC.ERROR_tarjeta = 1 THEN 'Tarjeta expirada'
            WHEN NFC.ERROR_tarjeta = 2 AND (NFC.MontoMovimiento - NFC.DMONTOCOBRADO) <= 0 THEN 'Sin saldo'
            WHEN NFC.ERROR_tarjeta = 2 AND (NFC.MontoMovimiento - NFC.DMONTOCOBRADO) > 0 THEN 'Rechazada'
            WHEN NFC.ERROR_tarjeta = 3 THEN 'Deny list'
            WHEN NFC.ERROR_tarjeta = 4 THEN 'Tarjeta no soportada'
            WHEN NFC.ERROR_tarjeta = 6 THEN 'Falta configurar tarifa'
            WHEN NFC.ERROR_tarjeta = 7 THEN 'Error en recarga'
            WHEN NFC.ERROR_tarjeta = 100 THEN 'Tarjeta recargada'
            ELSE 'Otro' END) as ESTADOTRANSACCIONVersion2,
       NFC.*
from baseMasSaldo NFC
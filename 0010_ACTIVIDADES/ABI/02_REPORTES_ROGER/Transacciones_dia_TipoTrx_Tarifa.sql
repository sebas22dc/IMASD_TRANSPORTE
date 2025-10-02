WITH AUTOBUS AS (SELECT AR.UIDAUTOBUS,
                        AR.UIDCHOFER,
                        h.UIDHORARIO,
                        h.SHORARIO,
                        h.SHORAINICIO,
                        h.SHORAFINAL,
                        ROW_NUMBER() OVER (ORDER BY trunc(AR.DTFECHACREACION) DESC) idrow
                 FROM SINCRONIZADOR.AUTOBUSRUTACHOFER AR
                          left JOIN CATALOGOS.HORARIOS h ON h.UIDHORARIO = AR.UIDHORARIO
                 WHERE AR.BACTIVO = 1
                   and h.bactivo = 1)
        ,
----------------------------------------- EMV TARJETAS BANCARIAS
     GENERAL AS (SELECT 'EMV'                      tipotransaccion
                      , trunc(OL.DTFECHAOPERACION) FECHAOPERACION
                      , r.SCLAVERIDANGO
                      , r.SRUTA
                      , 0                          TRANSBORDO
                      , NVL(AUT.SNUMECO, '000')    SNUMECO
                      , 'EMV-BANCARIA' AS          STARIFADESCRIPCION
                      , 0                          IERROR
                      , 'Confirmada'               ESTADOTRANSACCION
                      , sum(C.DTARIFAMONTO)        MONTOCOBRADO
                      , count(0)                   TRXS
                      , 0                          USUARIO
                 from openloop.transacciones OL
                          INNER JOIN SINCRONIZADOR.VSAM V ON V.SCSN = OL.IDVALIDADOR AND V.BACTIVO = 1
                          INNER JOIN SINCRONIZADOR.VALIDADORVSAM VV ON VV.UIDVSAM = V.UIDVSAM AND VV.BACTIVO = 1
                          INNER JOIN SINCRONIZADOR.VALIDADORES VS
                                     ON VS.UIDVALIDADOR = VV.UIDVALIDADOR AND VS.BACTIVO = 1
                          INNER JOIN SINCRONIZADOR.AUTOBUSVALIDADOR AV
                                     ON AV.UIDVALIDADOR = VS.UIDVALIDADOR AND AV.BACTIVO = 1
                          INNER JOIN SINCRONIZADOR.AUTOBUSES AUT ON AUT.UIDAUTOBUS = AV.UIDAUTOBUS AND AUT.BACTIVO = 1
                          INNER JOIN CATALOGOS.RUTAS R ON r.SCLAVERUTA = OL.SIDRUTA --and r.bactivo = 1 and r.bbaja = 1
                          INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
                          INNER JOIN AUTOBUS A ON A.UIDAUTOBUS = AUT.UIDAUTOBUS
                 WHERE OL.SESTADOOPERACION IN ('PENDIENTE', 'LIQUIDADO')
                   AND r.SCLAVERIDANGO IS NOT NULL
                   AND trunc(OL.DTFECHAOPERACION) >= trunc(sysdate - 10)
                   AND trunc(OL.DTFECHAOPERACION) < trunc(sysdate - 0)
                 group by trunc(OL.DTFECHAOPERACION), NVL(AUT.SNUMECO, '000'), r.SCLAVERIDANGO, r.SRUTA
                 union
-----------------------------------------TARJETA INTELIGENTE NFC
                 SELECT
--a.UIDVALIDADOR,
'Tarjeta Inteligente'               tipotransaccion,
trunc(DTFECHAOPERACION)             FECHAOPERACION,
r.SCLAVERIDANGO,
r.SRUTA,
d.itransbordo,
nvl(a2.SNUMECO, '000')              SNUMECO,
NVL(d.STIPOTARIFA, 'SIN TARIFA') AS STARIFADESCRIPCION,
d.IERROR,
CASE
    WHEN d.IERROR = 0 THEN 'Confirmada'
    WHEN d.IERROR = 5 and d.TOKENTRANSACCION != '00000000000000000000000000000000' THEN 'Confirmada'
    WHEN d.IERROR = 5 and d.TOKENTRANSACCION = '00000000000000000000000000000000' THEN 'Error en lectura'
    WHEN d.IERROR = 1 THEN 'Tarjeta expirada'
    WHEN d.IERROR = 2 THEN 'Sin Saldo/Rechazada'
    WHEN d.IERROR = 3 THEN 'Deny list'
    WHEN d.IERROR = 4 THEN 'Tarjeta no soportada'
    WHEN d.IERROR = 6 THEN 'Falta configurar tarifa'
    WHEN d.IERROR = 7 THEN 'Error en recarga'
    WHEN d.IERROR = 100 THEN 'Tarjeta recargada'
    ELSE 'Otro'
    END
                                    ESTADOTRANSACCION,
sum(d.DMONTOCOBRADO)             AS MONTOCOBRADO,
count(0)                            TRXS,
D.INUMEROTARJETA                    USUARIO
                 FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC d
                          LEFT JOIN CATALOGOS.RUTAS r ON r.SCLAVERUTA = d.IRUTA and r.bactivo = 1 and r.bbaja = 0
                          LEFT JOIN CATALOGOS.VALIDADORES v ON v.UIDVALIDADOR = CASE
                                                                                    WHEN d.UIDVALIDADOR = '1acb256e-775f-4720-855e-d372f7c18d3c'
                                                                                        THEN 'eff927ed-20fc-4ab3-8fe6-cca3228daba7'
                                                                                    ELSE d.UIDVALIDADOR END
                          LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR a
                                    ON a.UIDVALIDADOR = v.UIDVALIDADOR AND a.bactivo = 1 and a.bbaja = 0
                          LEFT JOIN CATALOGOS.AUTOBUSES a2 ON a2.UIDAUTOBUS = a.UIDAUTOBUS
                          LEFT JOIN MONEDEROCONSULTAS.ESTADODECUENTA ct ON ct.INUMTARJETA = d.INUMEROTARJETA
                 WHERE trunc(d.DTFECHAOPERACION) >= trunc(sysdate - 10)
                   AND trunc(d.DTFECHAOPERACION) < trunc(sysdate - 0)
                   AND (d.INUMEROTARJETA > 0 and d.INUMEROTARJETA is not null)
--and d.IERROR = 0
                 group by trunc(DTFECHAOPERACION),
                          r.SCLAVERIDANGO, r.SRUTA, d.itransbordo,
                          nvl(a2.SNUMECO, '000'),
                          NVL(d.STIPOTARIFA, 'SIN TARIFA'),
                          d.IERROR,
                          CASE
                              WHEN d.IERROR = 0 THEN 'Confirmada'
                              WHEN d.IERROR = 5 and d.TOKENTRANSACCION != '00000000000000000000000000000000'
                                  THEN 'Confirmada'
                              WHEN d.IERROR = 5 and d.TOKENTRANSACCION = '00000000000000000000000000000000'
                                  THEN 'Error en lectura'
                              WHEN d.IERROR = 1 THEN 'Tarjeta expirada'
                              WHEN d.IERROR = 2 THEN 'Sin Saldo/Rechazada'
                              WHEN d.IERROR = 3 THEN 'Deny list'
                              WHEN d.IERROR = 4 THEN 'Tarjeta no soportada'
                              WHEN d.IERROR = 6 THEN 'Falta configurar tarifa'
                              WHEN d.IERROR = 7 THEN 'Error en recarga'
                              WHEN d.IERROR = 100 THEN 'Tarjeta recargada'
                              ELSE 'Otro'
                              END
                         , D.INUMEROTARJETA
                 UNION all
-----------------------------------------QR APP
                 SELECT 'e-ticket'                           tipotransaccion,
                        trunc(DTFECHAOPERACION)              FECHAOPERACION,
                        r.SCLAVERIDANGO,
                        r.SRUTA,
                        d.inumerotransbordo,
                        nvl(a2.SNUMECO, '000')               SNUMECO,
                        NVL(ct.STIPOTARIFA, 'SIN TARIFA') AS STARIFADESCRIPCION,
                        d.IERROR,
                        CASE
                            WHEN d.IERROR = 0 THEN 'Confirmada'
                            WHEN d.IERROR = 5 and d.TOKENTRANSACCION != '00000000000000000000000000000000'
                                THEN 'Confirmada'
                            WHEN d.IERROR = 5 and d.TOKENTRANSACCION = '00000000000000000000000000000000'
                                THEN 'Error en lectura'
                            WHEN d.IERROR = 1 THEN 'Tarjeta expirada'
                            WHEN d.IERROR = 2 THEN 'Sin Saldo/Rechazada'
                            WHEN d.IERROR = 3 THEN 'Deny list'
                            WHEN d.IERROR = 4 THEN 'Tarjeta no soportada'
                            WHEN d.IERROR = 6 THEN 'Falta configurar tarifa'
                            WHEN d.IERROR = 7 THEN 'Error en recarga'
                            WHEN d.IERROR = 100 THEN 'Tarjeta recargada'
                            ELSE 'Otro'
                            END
                                                             ESTADOTRANSACCION,
                        sum(d.dmonto)                     AS MONTOCOBRADO,
                        count(0)                             TRXS
                         ,
                        d.INUMEROTARJETA                     USUARIO
--ct.INUMMONEDERO INUMEROMONEDERO
                 FROM SINCRONIZADOR.detalletransaccionqrdinamico d
                          LEFT JOIN CATALOGOS.RUTAS r ON r.SCLAVERUTA = d.IRUTA and r.bactivo = 1 and r.bbaja = 0
                          LEFT JOIN CATALOGOS.VALIDADORES v ON v.UIDVALIDADOR = CASE
                                                                                    WHEN d.UIDVALIDADOR = '1acb256e-775f-4720-855e-d372f7c18d3c'
                                                                                        THEN 'eff927ed-20fc-4ab3-8fe6-cca3228daba7'
                                                                                    ELSE d.UIDVALIDADOR END
                          LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR a
                                    ON a.UIDVALIDADOR = v.UIDVALIDADOR AND a.bactivo = 1 and a.bbaja = 0
                          LEFT JOIN CATALOGOS.AUTOBUSES a2 ON a2.UIDAUTOBUS = a.UIDAUTOBUS
                          LEFT JOIN MONEDEROCONSULTAS.ESTADODECUENTA ct ON ct.INUMMONEDERO = d.INUMEROTARJETA
                 WHERE trunc(d.DTFECHAOPERACION) >= trunc(sysdate - 10)
                   AND trunc(d.DTFECHAOPERACION) < trunc(sysdate - 0)
--and d.IERROR = 0
                 group by trunc(DTFECHAOPERACION),
                          r.SCLAVERIDANGO, r.SRUTA, d.inumerotransbordo,
                          nvl(a2.SNUMECO, '000'),
                          NVL(ct.STIPOTARIFA, 'SIN TARIFA'),
                          d.IERROR,
                          CASE
                              WHEN d.IERROR = 0 THEN 'Confirmada'
                              WHEN d.IERROR = 5 and d.TOKENTRANSACCION != '00000000000000000000000000000000'
                                  THEN 'Confirmada'
                              WHEN d.IERROR = 5 and d.TOKENTRANSACCION = '00000000000000000000000000000000'
                                  THEN 'Error en lectura'
                              WHEN d.IERROR = 1 THEN 'Tarjeta expirada'
                              WHEN d.IERROR = 2 THEN 'Sin Saldo/Rechazada'
                              WHEN d.IERROR = 3 THEN 'Deny list'
                              WHEN d.IERROR = 4 THEN 'Tarjeta no soportada'
                              WHEN d.IERROR = 6 THEN 'Falta configurar tarifa'
                              WHEN d.IERROR = 7 THEN 'Error en recarga'
                              WHEN d.IERROR = 100 THEN 'Tarjeta recargada'
                              ELSE 'Otro'
                              END
                         , D.INUMEROTARJETA
                 UNION ALL
-----------------------------------------TICKET IMPRESO
                 SELECT 'Ticket Impreso'            tipotransaccion,
                        trunc(DTFECHAHORAOPERACION) FECHAOPERACION,
                        r.SCLAVERIDANGO,
                        r.SRUTA,
                        0                           inumtransbordo,
                        nvl(a2.SNUMECO, '000')      SNUMECO,
                        'Tarifa General'     AS     STARIFADESCRIPCION,
                        0                           IERROR,
                        'Confirmada'                ESTADOTRANSACCION,
                        sum(d.DMONTOCOBRADO) AS     MONTOCOBRADO,
                        count(0)                    TRXS,
                        0                           USUARIO
                 FROM SINCRONIZADOR.transaccionticketqr d
                          LEFT JOIN CATALOGOS.RUTAS r ON r.SCLAVERUTA = d.IRUTA and r.bactivo = 1 and r.bbaja = 0
                          LEFT JOIN CATALOGOS.VALIDADORES v ON v.UIDVALIDADOR = CASE
                                                                                    WHEN d.IDVALIDADOR = '1acb256e-775f-4720-855e-d372f7c18d3c'
                                                                                        THEN 'eff927ed-20fc-4ab3-8fe6-cca3228daba7'
                                                                                    ELSE d.IDVALIDADOR END
                          LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR a
                                    ON a.UIDVALIDADOR = v.UIDVALIDADOR AND a.bactivo = 1 and a.bbaja = 0
                          LEFT JOIN CATALOGOS.AUTOBUSES a2 ON a2.UIDAUTOBUS = a.UIDAUTOBUS
--INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA ct ON ct.INUMMONEDERO = d.INUMEROTARJETA
                 WHERE trunc(d.DTFECHAHORAOPERACION) >= trunc(sysdate - 10)
                   AND trunc(d.DTFECHAHORAOPERACION) < trunc(sysdate - 0)
                 group by trunc(DTFECHAHORAOPERACION), r.SCLAVERIDANGO, r.SRUTA, nvl(a2.SNUMECO, '000')),
--      gps as (SELECT trunc(DTFECHAOPERACION) FECHAOPERACION,
--                     r.SCLAVERIDANGO,
--                     r.SRUTA,
--                     (a2.SNUMECO)            SNUMECO,
--                     COUNT(0) as             sindata
--              FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC d
--                       LEFT JOIN CATALOGOS.RUTAS r ON r.SCLAVERUTA = d.IRUTA and r.bactivo = 1 and r.bbaja = 0
--                       LEFT JOIN CATALOGOS.VALIDADORES v ON v.UIDVALIDADOR = CASE
--                                                                                 WHEN d.UIDVALIDADOR = '1acb256e-775f-4720-855e-d372f7c18d3c'
--                                                                                     THEN 'eff927ed-20fc-4ab3-8fe6-cca3228daba7'
--                                                                                 ELSE d.UIDVALIDADOR END
--                       LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR a
--                                 ON a.UIDVALIDADOR = v.UIDVALIDADOR AND a.bactivo = 1 and a.bbaja = 0
--                       LEFT JOIN CATALOGOS.AUTOBUSES a2 ON a2.UIDAUTOBUS = a.UIDAUTOBUS
--                       LEFT JOIN MONEDEROCONSULTAS.ESTADODECUENTA ct ON ct.INUMTARJETA = d.INUMEROTARJETA
--              WHERE trunc(d.DTFECHAOPERACION) >= trunc(sysdate -8)
--                AND trunc(d.DTFECHAOPERACION) < trunc(sysdate-0)
--                AND D.SLATITUD = '0'
--                AND d.SLONGITUD = '0'
--                AND d.IERROR = 0
--              GROUP BY trunc(DTFECHAOPERACION),
--                       r.SCLAVERIDANGO, r.SRUTA,
--                       (a2.SNUMECO)),
     Distribucion_Transacciones as (SELECT trunc(FECHAOPERACION) FECHAOPERACION
                                         , tipotransaccion
                                         , transbordo
                                         , starifadescripcion
                                         , sum(montocobrado)     Monto_Dinero
                                         , sum(trxs)             Monto_transacciones
                                    from general
                                    group by trunc(FECHAOPERACION)
                                           , tipotransaccion
                                           , transbordo
                                           , starifadescripcion),
     Total_Monto_trx_dia as (select trunc(FECHAOPERACION)    FECHAOPERACION
                                  , sum(Monto_Dinero)        Monto_total_Dinero
                                  , sum(Monto_transacciones) Monto_Total_transacciones
                             from Distribucion_Transacciones
                             group by trunc(FECHAOPERACION))
select dt.*
     , TrxD.Monto_total_Dinero
     , TrxD.Monto_Total_transacciones
from Distribucion_Transacciones DT
         join Total_Monto_trx_dia TrxD
              on DT.FECHAOPERACION = TrxD.FECHAOPERACION;

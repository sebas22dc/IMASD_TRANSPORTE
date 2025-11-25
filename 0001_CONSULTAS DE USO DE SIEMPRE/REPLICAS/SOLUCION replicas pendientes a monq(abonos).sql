INSERT INTO monederoconsultas.movimientos (UIDMOVIMIENTOS, UIDOPERACION, UIDTIPOOPERACION, UIDTIPOMOVIMIENTO,
                                           UIDESTATUSTRANSACCION, UIDMONEDERO, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO,
                                           SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION,
                                           IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE,
                                           SRUTA, SAUTOBUS)
SELECT lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 21)) AS                                                       UIDMOVIMIENTOS
     , M.UIDOPERACION
     , M.UIDTIPOOPERACION
     , 'ef008eb7-ea41-46bb-814e-f94979913ceb'                                                           UIDTIPOMOVIMIENTO
     , M.UIDESTATUS                            AS                                                       UIDESTATUSTRANSACCION
     , M.UIDMONEDERO
     , ME.INUMMONEDERO
     , M.DMONTO                                                                                         DMONTO
     , CTP.snombre                             AS                                                       STIPOMOVIMIENTO
     , 'Venta de saldo'                        as                                                       SOPERACION
     , M.sobservaciones                        as                                                       SMOTIVO
     , M.DTFECHAOPERACION
     , 0                                                                                                BCANCELACION
     , NULL                                                                                             UIDMOTIVOCANCELACION
     , M.ifoliomovimiento                                                                               IFOLIOMOVIMIENTO
     , M.semisor                                                                                        SEMISOR
     , 0                                                                                                BFACTURADO
     , (SELECT AA.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA AA where aa.uidmonedero = M.uidmonedero) dSaldoActual
     , (SELECT BB.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA BB where BB.uidmonedero = M.uidmonedero) -
       M.dmonto                                                                                         DSALDOANTERIOR
     , null                                    as                                                       sSerie
     , null                                    as                                                       sRuta
     , null                                    as                                                       sautobus
--trunc(O.dtfechaoperacion), count(0)
FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
         join MONEDEROCONSULTAS.ESTADODECUENTA ME on ME.UIDMONEDERO = M.UIDMONEDERO
         LEFT JOIN catalogos.tipomovimientos CTP
                   ON CTP.uidtipomovimiento = M.uidtipomovimiento
WHERE 1 = 1
--   AND MCM.uidoperacion IS NULL
  AND CTP.SNOMBRE = 'Abono'
-- AND o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
--AND M.ifoliomovimiento = 11586422
-- AND O.UIDOPERACION = '5b804d8e-4962-4289-8b89-f69c30f34d34'
  and M.dtfechaoperacion >= TO_DATE('14-10-2025 08:05:00', 'DD-MM-YYYY HH24:MI:SS')
  AND M.dtfechaoperacion < TO_DATE('14-10-2025 08:10:00', 'DD-MM-YYYY HH24:MI:SS')
  and M.UIDOPERACION not in (select MM.UIDOPERACION from MONEDEROCONSULTAS.MOVIMIENTOS MM)
--AND snumeromonedero IS not NULL;
--COMMIT;
-- AND e.INUMTARJETA = '5000000000018402';
-- commit;

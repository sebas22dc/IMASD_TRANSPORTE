with saldo_descontar as (select t2.UIDMONEDERO, sum(t1.DMONTO) MONTO_QUITAR, count(1) trxs
                         from SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO t1
                                  join monederoconsultas.ESTADODECUENTA t2 on t2.INUMMONEDERO = t1.INUMEROTARJETA
                         group by t2.UIDMONEDERO)
select T1.INUMMONEDERO,
       T2.MONTO_QUITAR,
       T2.trxs,
       t1.DSALDO                        SALDO_ANTES,
       (T1.DSALDO - T2.MONTO_QUITAR) AS SALDO_DESPUES
from MONEDEROCONSULTAS.ESTADODECUENTA t1
         join saldo_descontar t2 on t1.UIDMONEDERO = t2.UIDMONEDERO
;

merge into monederoconsultas.estadodecuenta REPLICA
using (select t2.UIDMONEDERO, sum(t1.DMONTO) DMONTO, count(1) trxs
       from SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO t1
                join monederoconsultas.ESTADODECUENTA t2 on t2.INUMMONEDERO = t1.INUMEROTARJETA
       group by t2.UIDMONEDERO) ORIGEN
ON (ORIGEN.UIDMONEDERO = REPLICA.UIDMONEDERO)
when matched then
    update
    set REPLICA.DSALDO = REPLICA.DSALDO - ORIGEN.DMONTO;
;
commit;

-- ROLLBACK


INSERT INTO MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA (uidmovimientoestadodecuenta, uidoperacion, uidtiposmonedero,
                                                         uidtipomovimiento, uidtipotransaccion, dmonto, sobservaciones,
                                                         uidestatus, dtfechaoperacion, dtfechacreacion,
                                                         dtfechamodificacion, dtfechabaja, bactivo, bbaja,
                                                         uidusuariocreacion, uidusuariomodificacion, uidusuariobaja,
                                                         uidmonedero, ifoliomovimiento, semisor, bfacturado, brecargado,
                                                         bcancelado, uidtipooperacion)
SELECT lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 21)) AS uidmovimientoestadodecuenta
     , qrDinamico.UIDSINCRONIZACION
     , monEstadoCuenta.UIDTIPOMONEDERO         AS uidtiposmonedero
     , '58956590-095e-4ff5-b1b3-20b2892db778'     UIDTIPOMOVIMIENTO
     , 'e350f3d3-c742-4a13-9674-edeafc171893'     UIDTIPOTRANSACCION
     , qrDinamico.DMONTO                       AS DMONTO
     , ''                                         SOBSERVACIONES
     , '5773658c-a461-4429-91ac-2b58083cb881'     UIDESTATUS
     , qrDinamico.DTFECHAOPERACION
     , qrDinamico.DTFECHACREACION
     , NULL                                       DTFECHAMODIFICACION
     , NULL                                       DTFECHABAJA
     , qrDinamico.BACTIVO
     , qrDinamico.BBAJA
     , '00000000-0000-0000-0000-000000000000'     UIDUSUARIOCREACION
     , NULL                                       UIDUSUARIOMODIFICACION
     , NULL                                       UIDUSUARIOBAJA
     , monEstadoCuenta.UIDMONEDERO             as UIDMONEDERO
     , qrDinamico.ICONSECUTIVO                 AS IFOLIOMOVIMIENTO
     , NULL                                       SEMISOR
     , 0                                          BFACTURADO
     , 0                                          BRECARGADO
     , 0                                          BCANCELADO
     , 'be7800fb-790f-46a7-b305-422aedec0e0d'     UIDTIPOOPERACION
--trunc(O.dtfechaoperacion), count(0)
FROM SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO qrDinamico
         LEFT JOIN monederoconsultas.estadodecuenta monEstadoCuenta
                   ON monEstadoCuenta.inummonedero = qrDinamico.INUMEROTARJETA
         LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA MonComandos
                   ON MonComandos.uidoperacion = qrDinamico.UIDSINCRONIZACION
WHERE 1 = 1
  AND MonComandos.uidoperacion IS NULL
  AND qrDinamico.UIDDETALLESINCRONIZADOR IN
      (SELECT T1.UIDDETALLESINCRONIZADOR
       FROM SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO T1);
COMMIT;
---------------------------------------------
INSERT INTO monederoconsultas.movimientos (UIDMOVIMIENTOS, UIDOPERACION, UIDTIPOOPERACION, UIDTIPOMOVIMIENTO,
                                           UIDESTATUSTRANSACCION, UIDMONEDERO, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO,
                                           SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION,
                                           IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE,
                                           SRUTA, SAUTOBUS)
SELECT lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 21)) AS                                                       UIDMOVIMIENTOS
     , qrDinamico.UIDSINCRONIZACION
     , M.UIDTIPOOPERACION
     , '58956590-095e-4ff5-b1b3-20b2892db778'  AS                                                       UIDTIPOMOVIMIENTO
     , M.UIDESTATUS                            AS                                                       UIDESTATUSTRANSACCION
     , e.UIDMONEDERO
     , e.INUMMONEDERO
     , qrDinamico.DMONTO                                                                                DMONTO
     , CTP.snombre                             AS                                                       STIPOMOVIMIENTO
     , 'e-ticket'                              as                                                       SOPERACION
     , ' '                                     as                                                       SMOTIVO
     , qrDinamico.DTFECHAOPERACION
     , 0                                                                                                BCANCELACION
     , NULL                                                                                             UIDMOTIVOCANCELACION
     , M.ifoliomovimiento                                                                               IFOLIOMOVIMIENTO
     , NULL                                                                                             SEMISOR
     , 0                                                                                                BFACTURADO
     , (SELECT AA.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA AA where aa.uidmonedero = M.uidmonedero) dSaldoActual
     , (SELECT BB.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA BB where BB.uidmonedero = M.uidmonedero) +
       M.dmonto                                                                                         DSALDOANTERIOR
     , null                                    as                                                       sSerie
     , null                                    as                                                       sRuta
     , null                                    as                                                       sautobus
--trunc(O.dtfechaoperacion), count(0)
FROM SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO qrDinamico
         LEFT JOIN monederoconsultas.estadodecuenta e
                   ON e.inummonedero = qrDinamico.INUMEROTARJETA
         LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
                   ON M.uidoperacion = qrDinamico.UIDSINCRONIZACION
         LEFT JOIN catalogos.tipomovimientos CTP
                   ON CTP.uidtipomovimiento = M.uidtipomovimiento
         LEFT JOIN MONEDEROCONSULTAS.MOVIMIENTOS MCM
                   on MCM.UIDOPERACION = M.UIDOPERACION
WHERE 1 = 1
  AND MCM.uidoperacion IS NULL
--   AND o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
--   AND o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
  AND M.UIDMONEDERO IS not NULL
  and qrDinamico.UIDSINCRONIZACION not in (select UIDOPERACION from MONEDEROCONSULTAS.MOVIMIENTOS)
  AND qrDinamico.UIDDETALLESINCRONIZADOR IN
      (SELECT T1.UIDDETALLESINCRONIZADOR
       FROM SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO T1);
--AND snumeromonedero IS not NULL;
--COMMIT; rollback
-- AND e.INUMTARJETA = '5000000000425453';
-- commit;




----------------------------APLICAR RUTAS Y AUTOBUSES A TARJETAS VIRTUALES MONEDEROS VIRTUALES
MERGE INTO monederoconsultas.MOVIMIENTOS REPLICA
USING (
select MCM.UIDMOVIMIENTOS, BUS_VALID_RUTA.AUTOBUS, BUS_VALID_RUTA.SDESCRIPCION
       from MONEDEROCONSULTAS.MOVIMIENTOS MCM
                join SINCRONIZADOR.MONEDERO SM on MCM.UIDMONEDERO = SM.UIDMONEDERO
                join sincronizador.DETALLETRANSACCIONQRDINAMICO QR_NFC
                     on MCM.IFOLIOMOVIMIENTO = QR_NFC.ICONSECUTIVO and SM.INUMEROMONEDERO = QR_NFC.INUMEROTARJETA
                join (select distinct SV.UIDVALIDADOR, SAB.SNUMECO AUTOBUS, SR.SCLAVERUTA, SR.SDESCRIPCION
                      from SINCRONIZADOR.VALIDADORES SV
                               join sincronizador.AUTOBUSVALIDADOR SAVV on SV.UIDVALIDADOR = SAVV.UIDVALIDADOR
                               join sincronizador.AUTOBUSES SAB on SAVV.UIDAUTOBUS = SAB.UIDAUTOBUS
                               join SINCRONIZADOR.AUTOBUSRUTACHOFER SARC on SAB.UIDAUTOBUS = SARC.UIDAUTOBUS
                               join sincronizador.RUTAS SR on SR.UIDRUTA = SARC.UIDRUTA
                      where SV.BACTIVO = 1
                        and sv.BBAJA = 0
                        and SAVV.BACTIVO = 1
                        and SAVV.BBAJA = 0
                        and SAB.BACTIVO = 1
                        and SAB.BBAJA = 0
                        AND SARC.BACTIVO = 1
                        and sarc.BBAJA = 0) BUS_VALID_RUTA
                     on QR_NFC.UIDVALIDADOR = BUS_VALID_RUTA.UIDVALIDADOR
                            and QR_NFC.IRUTA = BUS_VALID_RUTA.SCLAVERUTA
       where MCM.UIDOPERACION in (
           SELECT T1.UIDSINCRONIZACION
       FROM SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO T1
           )
       and BUS_VALID_RUTA.AUTOBUS not in ('CP 014')
       group by MCM.UIDMOVIMIENTOS, BUS_VALID_RUTA.AUTOBUS, BUS_VALID_RUTA.SDESCRIPCION
) ORIGEN
ON (REPLICA.UIDMOVIMIENTOS = ORIGEN.UIDMOVIMIENTOS)
when matched then
    update
    set REPLICA.SRUTA    =ORIGEN.SDESCRIPCION
      , replica.SAUTOBUS = ORIGEN.AUTOBUS;


--
-- select * from MONEDEROCONSULTAS.MOVIMIENTOS where UIDOPERACION in (select UIDSINCRONIZACION from SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO);
--
-- update MONEDEROCONSULTAS.MOVIMIENTOS set DMONTO = DMONTO*-1 where UIDOPERACION in (select UIDSINCRONIZACION from SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO_CORRECCION_IMPRESO_A_DINAMICO;
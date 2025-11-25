INSERT INTO monederoconsultas.movimientos (UIDMOVIMIENTOS, UIDOPERACION, UIDTIPOOPERACION, UIDTIPOMOVIMIENTO,
                                           UIDESTATUSTRANSACCION, UIDMONEDERO, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO,
                                           SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION,
                                           IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE,
                                           SRUTA, SAUTOBUS)
SELECT lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' || SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
             SUBSTR(RAWTOHEX(SYS_GUID()), 21)) AS UIDMOVIMIENTOS
     , MMTP.UIDOPERACION
     , MMTP.UIDTIPOOPERACION
     , CTP.UIDTIPOMOVIMIENTO                      UIDTIPOMOVIMIENTO
     , MMTP.UIDESTATUS                         AS UIDESTATUSTRANSACCION
     , MMTP.UIDMONEDERO
     , SM.INUMEROMONEDERO                         INUMEROMONEDERO
     , MMTP.DMONTO                                DMONTO
     , CTP.snombre                             AS STIPOMOVIMIENTO
     , CTO.SNOMBRE                             as SOPERACION
     , ''                                      as SMOTIVO
     , MMTP.DTFECHAOPERACION
     , 0                                          BCANCELACION
     , NULL                                       UIDMOTIVOCANCELACION
     , MMTP.IFOLIOMOVIMIENTO                      IFOLIOMOVIMIENTO
     , MMTP.semisor                               SEMISOR
     , 0                                          BFACTURADO
     , (SELECT AA.DSALDO FROM MONEDEROCONSULTAS.ESTADODECUENTA AA where aa.uidmonedero = MMTP.uidmonedero) +
       MMTP.DMONTO                                dSaldoActual   -->El actual menos el pasaje
     , (SELECT BB.DSALDO
        FROM MONEDEROCONSULTAS.ESTADODECUENTA BB
        where BB.uidmonedero = MMTP.uidmonedero)  DSALDOANTERIOR -->El actual
     , null                                    as sSerie
     , null                                    as sRuta
     , null                                    as sautobus
--trunc(O.dtfechaoperacion), count(0)
FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA MMTP
         join SINCRONIZADOR.MONEDERO SM on MMTP.UIDMONEDERO = SM.UIDMONEDERO
         join catalogos.TIPOOPERACIONES CTO on MMTP.UIDTIPOOPERACION = CTO.UIDTIPOOPERACION
         LEFT JOIN catalogos.tipomovimientos CTP ON CTP.uidtipomovimiento = MMTP.uidtipomovimiento
         left join monederoconsultas.MOVIMIENTOS MM on MMTP.UIDOPERACION = MM.UIDOPERACION
WHERE 1 = 1
  AND MM.uidoperacion IS NULL
  AND ctp.SNOMBRE = 'Cargo'
--  AND o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
-- AND o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
--AND M.ifoliomovimiento = 11586422
-- AND O.UIDOPERACION = '64ac5367-c030-4d60-8cf9-7debe2701124'
  and MMTP.dtfechaoperacion >= TO_DATE('16-11-2025 11:00:00', 'DD-MM-YYYY HH24:MI:SS')
  AND MMTP.dtfechaoperacion < TO_DATE('16-11-2025 11:11:00', 'DD-MM-YYYY HH24:MI:SS');
commit;


----------------------- sacar los uids operacion usados y ponerlos
-- en esta consulta para ejecutar el update de saldos

MERGE INTO monederoconsultas.estadodecuenta REPLICA
USING (
    select UIDMONEDERO,sum(DMONTO) DMONTO from MONEDEROCONSULTAS.MOVIMIENTOS
where UIDOPERACION in (
    )
group by UIDMONEDERO
       ) ORIGEN
ON (REPLICA.UIDMONEDERO = ORIGEN.UIDMONEDERO)
when matched then
    update
    set REPLICA.DSALDO = REPLICA.DSALDO + ORIGEN.DMONTO;
commit;
-- rollback

--
-- with autobuses as (select distinct SV.UIDVALIDADOR, SAB.SNUMECO AUTOBUS, SR.SCLAVERUTA, SR.SDESCRIPCION
--                    from SINCRONIZADOR.VALIDADORES SV
--                             join sincronizador.AUTOBUSVALIDADOR SAVV on SV.UIDVALIDADOR = SAVV.UIDVALIDADOR
--                             join sincronizador.AUTOBUSES SAB on SAVV.UIDAUTOBUS = SAB.UIDAUTOBUS
--                             join SINCRONIZADOR.AUTOBUSRUTACHOFER SARC on SAB.UIDAUTOBUS = SARC.UIDAUTOBUS
--                             join sincronizador.RUTAS SR on SR.UIDRUTA = SARC.UIDRUTA
--                    where SV.BACTIVO = 1
--                      and sv.BBAJA = 0
--                      and SAVV.BACTIVO = 1
--                      and SAVV.BBAJA = 0
--                      and SAB.BACTIVO = 1
--                      and SAB.BBAJA = 0
--                      AND SARC.BACTIVO = 1
--                      and sarc.BBAJA = 0)
-- select *
-- from autobuses A
-- where A.UIDVALIDADOR = '89d76a85-b477-4f4d-a1a4-b95515da6acb';

------------------------------------------------------------------- aplicar rutas y autobuses a tarjetas fisicas

MERGE INTO monederoconsultas.MOVIMIENTOS REPLICA
USING (select MCM.UIDMOVIMIENTOS, BUS_VALID_RUTA.AUTOBUS, BUS_VALID_RUTA.SDESCRIPCION
       from MONEDEROCONSULTAS.MOVIMIENTOS MCM
                join SINCRONIZADOR.MONEDERO SM on MCM.UIDMONEDERO = SM.UIDMONEDERO
                join sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC
                     on MCM.IFOLIOMOVIMIENTO = NFC.ICONTADORTRANSACCIONES and SM.INUMEROTARJETA = NFC.INUMEROTARJETA
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
                     on NFC.UIDVALIDADOR = BUS_VALID_RUTA.UIDVALIDADOR
                            and NFC.IRUTA = BUS_VALID_RUTA.SCLAVERUTA
       where MCM.UIDOPERACION in (


           )) ORIGEN
ON (REPLICA.UIDMOVIMIENTOS = ORIGEN.UIDMOVIMIENTOS)
when matched then
    update
    set REPLICA.SRUTA    =ORIGEN.SDESCRIPCION
      , replica.SAUTOBUS = ORIGEN.AUTOBUS;


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
                            --and NFC.IRUTA = BUS_VALID_RUTA.SCLAVERUTA
       where MCM.UIDOPERACION in (
           )
) ORIGEN
ON (REPLICA.UIDMOVIMIENTOS = ORIGEN.UIDMOVIMIENTOS)
when matched then
    update
    set REPLICA.SRUTA    =ORIGEN.SDESCRIPCION
      , replica.SAUTOBUS = ORIGEN.AUTOBUS;


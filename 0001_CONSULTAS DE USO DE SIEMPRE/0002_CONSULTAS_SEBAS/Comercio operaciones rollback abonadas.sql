select t2.SNOMBRE,
       t1.DTFECHAOPERACION FechaHoraRecarga,
       t1.DTFECHACREACION FechaHorarecibidoServer,
       t4.DTFECHA FechacRollback,
       t6.SCOMERCIO,
       t5.STARJETA,
       t1.UIDOPERACION idoperacionComercio,
       t9.UIDOPERACION idoperacionRecargasPendientes,
       t1.IFOLIOVENTA,
       t4.SESTATUS,
--        t8.DSALDO,
       t1.FMONTO,
       CCO.DMONTOVENTA,
       t5.UIDLISTACUENTAS,
       t7.ICONTADORRECARGA,
       t7.ICONTADORRECARGAAPLICADA,
       t5.DSALDOACTUAL saldomonedero,
       XX.SALDO        saldonfc
from COMERCIO.OPERACIONES t1
         left join COMERCIOCONSULTAS.OPERACIONES CCO on t1.UIDOPERACION = CCO.UIDOPERACION
         join comercio.ESTATUSTRANSACCION t2 on t1.UIDESTATUSOPERACION = t2.UIDESTATUSTRANSACCION
         join comercio.LOGVENTA t3 on t3.UIDOPERACION = t1.UIDOPERACION
         join comercio.LOGVENTADETALLE t4 on t4.UIDLOGVENTA = t3.UIDLOGVENTA and t4.SESTATUS = 'ROLLBACK APLICADO'
         join sincronizador.CAMBIOSMONEDERO t5 on t1.UIDOPERACION = t5.IDOPERACION
         join comercio.COMERCIOS t6 on t6.UIDCOMERCIO = t1.UIDCOMERCIO
         join sincronizador.MONEDERO t7 on t7.INUMEROTARJETA = t5.STARJETA
         join monederoconsultas.ESTADODECUENTA t8 on t8.UIDMONEDERO = t7.UIDMONEDERO
         left join SINCRONIZADOR.RECARGAS_PENDIENTES t9 on t9.UIDOPERACION = t1.UIDOPERACION
         INNER JOIN (select nfc.inumerotarjeta
                          , MAX(nfc.DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY nfc.DTFECHAOPERACION) AS DTFECHAOPERACION
                          , MAX(nfc.DSALDO) KEEP (DENSE_RANK LAST ORDER BY nfc.DTFECHAOPERACION)           AS SALDO
                          , MAX(nfc.IERROR) KEEP (DENSE_RANK LAST ORDER BY nfc.DTFECHAOPERACION)           AS IERROR
                          , MAX(nfc.loadtranscounter)                                                  AS loadtranscounter2
                     FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                     WHERE 1 = 1
                       AND nfc.SINCIDENCIA not like 'DEB. PEND.%'-->CORRECCION A NIVEL DATOS PORQUE NO DEBE TOMAR LOS REPROCESOS QUE HAYAMOS HECHO
                       AND nfc.SINCIDENCIA not like 'SIM. DEB. PEND.%'-->CONDICION PARA EVITAR AGARRAR LOS QUE SEAN REPROCESOS
                     GROUP BY nfc.inumerotarjeta) XX ON XX.inumerotarjeta = t7.inumerotarjeta
where 1 = 1
  and trunc(t1.DTFECHAOPERACION) >= trunc(to_date('01-11-2025'))
--   and trunc(t1.DTFECHAOPERACION) >= trunc(sysdate - 6 / 24)
  and t2.SNOMBRE != 'EXITOSA'
order by t1.DTFECHAOPERACION desc
;


select *
from COMERCIO.LOGVENTA
where UIDOPERACION = 'f59bac5c-888b-4d19-935c-e52409b94102'
select *
from COMERCIO.LOGVENTADETALLE
where UIDLOGVENTA = '282c0927-260e-4343-9c0b-2728641d0840'
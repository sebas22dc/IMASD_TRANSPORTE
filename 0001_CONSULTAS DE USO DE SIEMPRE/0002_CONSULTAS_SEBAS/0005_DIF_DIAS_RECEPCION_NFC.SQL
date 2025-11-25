with diasDiferencias as (select trunc(nfc.DTFECHACREACION - nfc.DTFECHAOPERACION, 0) as difRecepcion
                              , DTFECHAOPERACION
                              , DTFECHACREACION
                         from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC
                         where 1 = 1
                           AND TO_CHAR(nfc.DTFECHAOPERACION, 'MM') in (8, 9, 10)
                         order by difRecepcion desc)
   , DiasAgrupados as (select difRecepcion
                            , TO_CHAR(DTFECHAOPERACION, 'MON') as mesOperacion
                            , TO_CHAR(DTFECHACREACION, 'MON')  as mesRecepcion
                            , count(1)                         as trx
                       from diasDiferencias
                       where difRecepcion != 0
                       group by difRecepcion
                              , TO_CHAR(DTFECHAOPERACION, 'MON')
                              , TO_CHAR(DTFECHACREACION, 'MON'))
select mesOperacion, mesRecepcion, difRecepcion as dias_diferencia, trx as numTRX
from DiasAgrupados
order by difRecepcion desc;
-- select DTFECHAOPERACION,
--        DTFECHACREACION,
--        uiddetallesincronizador,
--        uidsincronizacion,
--        uidvalidador,
--        slatitud,
--        slongitud,
--        inumerotarjeta,
--        dmontocobrado,
--        iruta,
--        bprocesado,
--        ireintentos,
--        icontadortransacciones,
--        stipotarifa,
--        dtfechaultmod,
--        dtfechabaja,
--        bactivo,
--        bbaja,
--        iidusuariocreacion,
--        iidusuarioultmod,
--        iidusuariobaja,
--        itransbordo,
--        dsaldo,
--        dsaldoanterior,
--        sincidencia,
--        idvalidador,
--        tokentransaccion,
--        loadtranscounter,
--        ierror,
--        bdebitado,
--        bfirmado,
--        certificado,
--        datehsm,
--        transvalue,
--        panhash
-- from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
-- where 1 = 1
--   AND TO_CHAR(nfc.DTFECHAOPERACION
--           , 'MM') in (8, 9, 10)
--   AND trunc(nfc.DTFECHACREACION - nfc.DTFECHAOPERACION
--           , 0) in (select difRecepcion from DiasAgrupados);


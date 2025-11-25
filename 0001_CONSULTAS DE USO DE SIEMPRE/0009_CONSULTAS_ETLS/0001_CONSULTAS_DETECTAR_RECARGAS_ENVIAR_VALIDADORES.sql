---RECARGAS VALIDADORES ETL

with base_Tarjetas_con_recarga_pendiente as (SELECT FECHA
                                                  , nfc.UIDDETALLESINCRONIZADOR
                                                  , nfc.IERROR
                                                  , nfc.INUMEROTARJETA
                                                  , nfc.DTFECHAOPERACION
                                                  , ROW_NUMBER() OVER (PARTITION BY nfc.INUMEROTARJETA ORDER BY nfc.DTFECHAOPERACION DESC) AS RN
                                             FROM (SELECT INUMTARJETA, trunc(c.DTFECHACREACION) FECHA, COUNT(0)
                                                   FROM MONEDEROCONSULTAS.ESTADODECUENTA e
                                                            INNER JOIN SINCRONIZADOR.CAMBIOSMONEDERO c ON c.STARJETA = e.INUMTARJETA
                                                            INNER JOIN SINCRONIZADOR.MONEDERO m
                                                                       ON m.UIDMONEDERO = e.UIDMONEDERO
                                                   WHERE 1 = 1
                                                     --and trunc(c.DTFECHACREACION, 'MM') >= trunc((sysdate - 6 / 24), 'MM')
                                                     AND e.INUMTARJETA > 0
                                                     AND m.ICONTADORRECARGAAPLICADA > 0
                                                     and e.SESTATUS = 'ACTIVO'
                                                     and e.UIDESTATUSTARJETA = '1f752e96-0ecc-4765-b163-259865bfabf0'
                                                     and e.UIDESTATUS = '5e879806-6e1d-4d5b-9610-25f2a681b637'
                                                   GROUP BY INUMTARJETA, trunc(c.DTFECHACREACION)
                                                   HAVING MAX(c.ICONTADORRECARGA) - MAX(m.ICONTADORRECARGAAPLICADA) > 0) DUAL
                                                      INNER JOIN SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                                                                 ON nfc.INUMEROTARJETA = INUMTARJETA
                                             WHERE 1 = 1
--                                               and nfc.DTFECHAOPERACION >= trunc(sysdate - 6 / 24)
                                             ORDER BY FECHA)
select t1.INUMEROTARJETA,
       0                               SALDOMONEDERO,
       0                               SALDONFC,
       T1.IERROR,
       1                               REINCIDENCIAS,
       TRUNC(SYSDATE - 6 / 24)         FECHAOPERACION,
       t2.ICONTADORRECARGAAPLICADA     LTC_NFC,
       t3.ICONTADORRECARGA             LTC_LISTAS,
       t3.DTFECHACREACION              FECHARECARGA,
       t3.DTFECHAMODIFICACION - 6 / 24 FECHALISTA,
       t3.DSALDOACTUAL                 MONTORECARGA,
       'Sin agrupador'                 AGRUPADO,
       0                               BENVIADA
--        t1.DTFECHAOPERACION             iNtentoNFC

from base_Tarjetas_con_recarga_pendiente t1
         join SINCRONIZADOR.MONEDERO t2 on t1.INUMEROTARJETA = t2.INUMEROTARJETA
         join sincronizador.CAMBIOSMONEDERO t3
              on t3.STARJETA = t1.INUMEROTARJETA and t3.ICONTADORRECARGA = t2.ICONTADORRECARGAAPLICADA + 1
where 1 = 1
  and t1.RN = 1
  and t1.IERROR = 2
  and t1.DTFECHAOPERACION >= t3.DTFECHAMODIFICACION - 6 / 24 --> con esto se revisa que cuando se paso la tarjeta ya se haya enviado antes la recarga a validadores
  and t3.UIDLISTACUENTAS <> '00000000-0000-0000-0000-000000000000'
--MONITOREO
with base_Tarjetas_con_recarga_pendiente as (SELECT FECHA
                                                  , nfc.IERROR
                                                  , nfc.INUMEROTARJETA
                                                  , ROW_NUMBER() OVER (PARTITION BY nfc.INUMEROTARJETA ORDER BY nfc.DTFECHAOPERACION DESC) AS RN
                                             FROM (SELECT INUMTARJETA, trunc(c.DTFECHACREACION) FECHA, COUNT(0)
                                                   FROM MONEDEROCONSULTAS.ESTADODECUENTA e
                                                            INNER JOIN SINCRONIZADOR.CAMBIOSMONEDERO c ON c.STARJETA = e.INUMTARJETA
                                                            INNER JOIN SINCRONIZADOR.MONEDERO m
                                                                       ON m.UIDMONEDERO = e.UIDMONEDERO
                                                   WHERE trunc(c.DTFECHACREACION, 'MM') >= trunc((sysdate - 6 / 24), 'MM')
                                                     AND e.INUMTARJETA > 0
                                                     AND m.ICONTADORRECARGAAPLICADA > 0
                                                   GROUP BY INUMTARJETA, trunc(c.DTFECHACREACION)
                                                   HAVING MAX(c.ICONTADORRECARGA) - MAX(m.ICONTADORRECARGAAPLICADA) > 0) DUAL
                                                      INNER JOIN SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                                                                 ON nfc.INUMEROTARJETA = INUMTARJETA
                                             WHERE 1 = 1
                                               and nfc.DTFECHAOPERACION >= trunc(sysdate - 6 / 24)
                                             ORDER BY FECHA)
select count(1) tarjetas_Con_recarga_Pendiente
from base_Tarjetas_con_recarga_pendiente
where 1 = 1
  and RN = 1
  and IERROR = 2;


--LIDERES
with base_Tarjetas_con_recarga_pendiente as (SELECT FECHA
--      , COUNT(0) Tarjetas_recarga_pendiente
                                                  , nfc.IERROR
                                                  , nfc.INUMEROTARJETA
                                                  ---aca se pueden agregar mas datos para saber al respecto del validador
                                                  , nfc.UIDVALIDADOR
                                                  , ROW_NUMBER() OVER (PARTITION BY nfc.INUMEROTARJETA ORDER BY nfc.DTFECHAOPERACION DESC) AS RN --> Tomar su ultima debitacion
                                             FROM (SELECT INUMTARJETA, trunc(c.DTFECHACREACION) FECHA, COUNT(0)
                                                   FROM MONEDEROCONSULTAS.ESTADODECUENTA e
                                                            INNER JOIN SINCRONIZADOR.CAMBIOSMONEDERO c ON c.STARJETA = e.INUMTARJETA
                                                            INNER JOIN SINCRONIZADOR.MONEDERO m
                                                                       ON m.UIDMONEDERO = e.UIDMONEDERO
                                                   WHERE trunc(c.DTFECHACREACION, 'MM') >= trunc((sysdate - 6 / 24), 'MM') --evaluar dimesion de tarjetas general
                                                     AND e.INUMTARJETA > 0
                                                     AND m.ICONTADORRECARGAAPLICADA > 0
                                                   GROUP BY INUMTARJETA, trunc(c.DTFECHACREACION)
                                                   HAVING MAX(c.ICONTADORRECARGA) - MAX(m.ICONTADORRECARGAAPLICADA) > 0) DUAL --> se evalua que al menos tenga una recarga pendiente
                                                      INNER JOIN SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                                                                 ON nfc.INUMEROTARJETA = INUMTARJETA
                                             WHERE 1 = 1
                                               and nfc.DTFECHAOPERACION >= trunc(sysdate - 6 / 24) --> tomar las trxs de del dia actual para evaluar posteriormente si su ultimo trx es error 2
                                             --     and t.DTFECHAOPERACION BETWEEN ((SYSDATE-6/24) - (120/1440)) AND (SYSDATE -6/24)
--   AND nfc.IERROR = 2
-- GROUP BY FECHA
                                             ORDER BY FECHA)
select FECHA
     , INUMEROTARJETA
--      ,
--     count(1) tarjetas_Pendiente
from base_Tarjetas_con_recarga_pendiente
where 1 = 1
  and RN = 1
  and IERROR = 2
--> ahora solo se evalua la ultima transaccion para saber si esta marcando error 2, si marca error 2 es porque su recarga no llego al validador donde intento
-- group by FECHA
;


--- PROPIA

with base_Tarjetas_con_recarga_pendiente as (SELECT FECHA
                                                  , nfc.IERROR
                                                  , nfc.INUMEROTARJETA
                                                  , nfc.DTFECHAOPERACION
                                                  , ROW_NUMBER() OVER (PARTITION BY nfc.INUMEROTARJETA ORDER BY nfc.DTFECHAOPERACION DESC) AS RN
                                             FROM (SELECT INUMTARJETA, trunc(c.DTFECHACREACION) FECHA, COUNT(0)
                                                   FROM MONEDEROCONSULTAS.ESTADODECUENTA e
                                                            INNER JOIN SINCRONIZADOR.CAMBIOSMONEDERO c ON c.STARJETA = e.INUMTARJETA
                                                            INNER JOIN SINCRONIZADOR.MONEDERO m
                                                                       ON m.UIDMONEDERO = e.UIDMONEDERO
                                                   WHERE trunc(c.DTFECHACREACION, 'MM') >= trunc((sysdate - 6 / 24), 'MM')
                                                     AND e.INUMTARJETA > 0
                                                     AND m.ICONTADORRECARGAAPLICADA > 0
                                                     and e.SESTATUS = 'ACTIVO'
                                                   GROUP BY INUMTARJETA, trunc(c.DTFECHACREACION)
                                                   HAVING MAX(c.ICONTADORRECARGA) - MAX(m.ICONTADORRECARGAAPLICADA) > 0) DUAL
                                                      INNER JOIN SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                                                                 ON nfc.INUMEROTARJETA = INUMTARJETA
                                             WHERE 1 = 1
                                               and nfc.DTFECHAOPERACION >= trunc(sysdate - 6 / 24)
                                             ORDER BY FECHA)
select

-- --         count(1) tarjetas_Con_recarga_Pendiente
--         t1.DTFECHAOPERACION,
--         t3.DTFECHAMODIFICACION -6/24 FechaEnvio ,
--         t3.UIDLISTACUENTAS,t1.FECHA,
--         t1.IERROR,
t1.INUMEROTARJETA
--         t1.RN,
--         t2.ICONTADORRECARGAAPLICADA+1 ICONTADORRECARGAAPLICADA
from base_Tarjetas_con_recarga_pendiente t1
         join SINCRONIZADOR.MONEDERO t2 on t1.INUMEROTARJETA = t2.INUMEROTARJETA
         join sincronizador.CAMBIOSMONEDERO t3
              on t3.STARJETA = t1.INUMEROTARJETA and t3.ICONTADORRECARGA = t2.ICONTADORRECARGAAPLICADA + 1
where 1 = 1
  and t1.RN = 1
  and t1.IERROR = 2
  and t1.DTFECHAOPERACION >= t3.DTFECHAMODIFICACION - 6 / 24 --> con esto se revisa que cuando se paso la tarjeta ya se haya enviado antes la recarga a validadores
  and t3.UIDLISTACUENTAS <> '00000000-0000-0000-0000-000000000000';
--     ;
--
-- select count(1)
-- from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
-- where trunc(DTFECHAOPERACION) = trunc(sysdate - 6 / 24)
--   and IERROR = 2


------------------------------------------------------------------------------

---RECARGAS VALIDADORES ETL

with base_Tarjetas_con_recarga_pendiente as (SELECT FECHA
                                                  , nfc.IERROR
                                                  , nfc.INUMEROTARJETA
                                                  , nfc.DTFECHAOPERACION
                                                  , ROW_NUMBER() OVER (PARTITION BY nfc.INUMEROTARJETA ORDER BY nfc.DTFECHAOPERACION DESC) AS RN
                                             FROM (SELECT INUMTARJETA, trunc(c.DTFECHACREACION) FECHA, COUNT(0)
                                                   FROM MONEDEROCONSULTAS.ESTADODECUENTA e
                                                            INNER JOIN SINCRONIZADOR.CAMBIOSMONEDERO c ON c.STARJETA = e.INUMTARJETA
                                                            INNER JOIN SINCRONIZADOR.MONEDERO m
                                                                       ON m.UIDMONEDERO = e.UIDMONEDERO
                                                   WHERE trunc(c.DTFECHACREACION, 'MM') >= trunc((sysdate - 6 / 24), 'MM')
                                                     AND e.INUMTARJETA > 0
                                                     AND m.ICONTADORRECARGAAPLICADA > 0
                                                     and e.SESTATUS = 'ACTIVO'
                                                   GROUP BY INUMTARJETA, trunc(c.DTFECHACREACION)
                                                   HAVING MAX(c.ICONTADORRECARGA) - MAX(m.ICONTADORRECARGAAPLICADA) > 0) DUAL
                                                      INNER JOIN SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                                                                 ON nfc.INUMEROTARJETA = INUMTARJETA
                                             WHERE 1 = 1
                                               and nfc.DTFECHAOPERACION >= trunc(sysdate - 6 / 24)
                                             ORDER BY FECHA)
select t1.INUMEROTARJETA,
       0                               SALDOMONEDERO,
       0                               SALDONFC,
       T1.IERROR,
       1                               REINCIDENCIAS,
       t1.DTFECHAOPERACION             FECHAOPERACION,
       t2.ICONTADORRECARGAAPLICADA     LTC_NFC,
       t3.ICONTADORRECARGA             LTC_LISTAS,
       t1.DTFECHAOPERACION             iNtentoNFC,
       t3.DTFECHACREACION              FECHARECARGA,
       t3.DTFECHAMODIFICACION - 6 / 24 FECHALISTA,
       t3.DSALDOACTUAL                 MONTORECARGA,
       'Sin agrupador'                 AGRUPADO,
       0                               BENVIADA
from base_Tarjetas_con_recarga_pendiente t1
         join SINCRONIZADOR.MONEDERO t2 on t1.INUMEROTARJETA = t2.INUMEROTARJETA
         join sincronizador.CAMBIOSMONEDERO t3
              on t3.STARJETA = t1.INUMEROTARJETA and t3.ICONTADORRECARGA = t2.ICONTADORRECARGAAPLICADA + 1
where 1 = 1
  and t1.RN = 1
  and t1.IERROR = 2
  and t1.DTFECHAOPERACION >= t3.DTFECHAMODIFICACION - 6 / 24 --> con esto se revisa que cuando se paso la tarjeta ya se haya enviado antes la recarga a validadores
  and t3.UIDLISTACUENTAS <> '00000000-0000-0000-0000-000000000000'
;
--     ;
---------------------------------
select count(1)
from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
where trunc(DTFECHAOPERACION) = trunc(sysdate - 6 / 24)
  and IERROR = 2;



SELECT COUNT(1)
FROM SINCRONIZADOR.MONEDERO T1
         JOIN SINCRONIZADOR.CAMBIOSMONEDERO T3
              ON T3.STARJETA = T1.INUMEROTARJETA AND T3.ICONTADORRECARGA = T1.ICONTADORRECARGAAPLICADA + 1
WHERE UIDLISTACUENTAS = '00000000-0000-0000-0000-000000000000'







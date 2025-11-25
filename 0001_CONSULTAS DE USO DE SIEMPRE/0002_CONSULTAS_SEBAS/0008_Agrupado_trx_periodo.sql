WITH Fechas AS (SELECT TRUNC((sysdate - 6 / 24) - 1) d1,
                       TRUNC((sysdate - 6 / 24) - 0) d2
                FROM dual),
     EMV AS (SELECT 'EMV'                                                                         as TIPO,
                    trunc(t1.DTFECHACREACION)                                                     AS DTFECHACREACION,
                    t1.SNUMECO,
                    CASE WHEN T1.SESTADOOPERACION IN ('PENDIENTE', 'LIQUIDADO') THEN 0 ELSE 1 END AS IERROR
             FROM OPENLOOP.TRANSACCIONES t1
             where trunc(t1.DTFECHACREACION) >= (select d1 from fechas)
               and trunc(t1.DTFECHACREACION) < (select d2 from Fechas)),

     NFC as (select 'NFC' as TIPO, trunc(t1.DTFECHACREACION) AS DTFECHACREACION, t3.SNUMECO, t1.IERROR
             from sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
                      left join sincronizador.AUTOBUSVALIDADOR t2
                                on t2.UIDVALIDADOR = t1.UIDVALIDADOR and t2.BACTIVO = 1 and t2.BBAJA = 0
                      left join catalogos.AUTOBUSES t3
                                on t3.UIDAUTOBUS = t2.UIDAUTOBUS and t3.BACTIVO = 1 and t3.BBAJA = 0
             where trunc(t1.DTFECHACREACION) >= (select d1 from fechas)
               and trunc(t1.DTFECHACREACION) < (select d2 from Fechas)),

     QR as (select 'QR' as TIPO, trunc(t1.DTFECHACREACION) AS DTFECHACREACION, t3.SNUMECO, t1.IERROR
            from sincronizador.DETALLETRANSACCIONQRDINAMICO t1
                     left join sincronizador.AUTOBUSVALIDADOR t2
                               on t2.UIDVALIDADOR = t1.UIDVALIDADOR and t2.BACTIVO = 1 and t2.BBAJA = 0
                     left join catalogos.AUTOBUSES t3
                               on t3.UIDAUTOBUS = t2.UIDAUTOBUS and t3.BACTIVO = 1 and t3.BBAJA = 0
            where trunc(t1.DTFECHACREACION) >= (select d1 from fechas)
              and trunc(t1.DTFECHACREACION) < (select d2 from Fechas))
select T2.DTFECHACREACION,
       t1.SNUMECO,
       T2.TIPO,
       T2.IERROR,
       (COUNT(1) - 1) AS TRX
from CATALOGOS.AUTOBUSES t1
         LEFT JOIN (SELECT *
                    FROM EMV
                    UNION ALL
                    SELECT *
                    FROM NFC
                    UNION ALL
                    SELECT *
                    FROM QR) T2 ON T2.SNUMECO = T1.SNUMECO
where t1.BACTIVO = 1
  and t1.BBAJA = 0
  and t2.DTFECHACREACION is not null
group by t2.DTFECHACREACION, t1.SNUMECO, t2.TIPO, T2.IERROR

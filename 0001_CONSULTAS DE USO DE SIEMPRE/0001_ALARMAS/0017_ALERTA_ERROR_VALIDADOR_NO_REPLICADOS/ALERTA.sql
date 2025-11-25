
---------------------------------------------------
---transacciones que TENGAN validador pero el validador no existe en nuestro esquema de sincronizador


WITH Fechas AS (SELECT TRUNC((sysdate - 6 / 24) - 1) d1,
                       TRUNC((sysdate - 6 / 24) - 0) d2
                from dual),
     Revisiones as (SELECT d.UIDSINCRONIZACION, d.UIDVALIDADOR as UIDVALIDADOR, v.UIDVALIDADOR as UIDVALIDADORSINC
                    FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC d
                             LEFT JOIN SINCRONIZADOR.VALIDADORES v ON d.UIDVALIDADOR = v.UIDVALIDADOR
                             LEFT JOIN SINCRONIZADOR.AUTOBUSVALIDADOR AV ON V.UIDVALIDADOR = AV.UIDVALIDADOR
                             LEFT JOIN SINCRONIZADOR.AUTOBUSES A ON AV.UIDAUTOBUS = A.UIDAUTOBUS
                    WHERE v.UIDVALIDADOR IS NULL
                      and trunc(d.DTFECHACREACION) >= (select d1 from Fechas)
                      and trunc(d.DTFECHACREACION) < (select d2 from Fechas)
                    UNION
                    SELECT d.UIDSINCRONIZACION, d.UIDVALIDADOR, v.UIDVALIDADOR as UIDVALIDADORSINC
                    FROM SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO d
                             LEFT JOIN SINCRONIZADOR.VALIDADORES v ON d.UIDVALIDADOR = v.UIDVALIDADOR
                             LEFT JOIN SINCRONIZADOR.AUTOBUSVALIDADOR AV ON V.UIDVALIDADOR = AV.UIDVALIDADOR
                             LEFT JOIN SINCRONIZADOR.AUTOBUSES A ON AV.UIDAUTOBUS = A.UIDAUTOBUS
                    WHERE v.UIDVALIDADOR IS NULL
                      and trunc(d.DTFECHACREACION) >= (select d1 from Fechas)
                      and trunc(d.DTFECHACREACION) < (select d2 from Fechas)
                    UNION
                    SELECT d.UIDSINCRONIZACION, d.IDVALIDADOR as UIDVALIDADOR, v.UIDVALIDADOR as UIDVALIDADORSINC
                    FROM SINCRONIZADOR.TRANSACCIONEMV d
                             LEFT JOIN SINCRONIZADOR.VALIDADORES v ON d.IDVALIDADOR = v.UIDVALIDADOR
                             LEFT JOIN SINCRONIZADOR.AUTOBUSVALIDADOR AV ON V.UIDVALIDADOR = AV.UIDVALIDADOR
                             LEFT JOIN SINCRONIZADOR.AUTOBUSES A ON AV.UIDAUTOBUS = A.UIDAUTOBUS
                    WHERE v.UIDVALIDADOR IS NULL
                      and trunc(d.DTFECHACREACION) >= (select d1 from Fechas)
                      and trunc(d.DTFECHACREACION) < (select d2 from Fechas))
select count(1) AS Errores
-- t1.*
from Revisiones t1;

---NUMERO DE TRANSACCIONES EMV POR UNIDAD EN EL DIA
with TransaccionesEMV as (SELECT *
                          FROM OPENLOOP.TRANSACCIONES t1
                          where trunc(t1.DTFECHACREACION) = trunc(sysdate - 6 / 24))
select t1.SNUMECO, nvl(count(1) - 1, 0) "trx EMV"
from CATALOGOS.AUTOBUSES t1
         left join TransaccionesEMV t2 on t1.SNUMECO = t2.SNUMECO
where t1.BACTIVO = 1
  and t1.BBAJA = 0
group by t1.SNUMECO;





---ULTIMA TRANSACCION EMV POR UNIDAD
with TransaccionesEMV as (SELECT *
                          FROM OPENLOOP.TRANSACCIONES t1
                          where 1 = 1
--                             AND trunc(t1.DTFECHACREACION) = trunc(sysdate - 6 / 24)
)
select t1.SNUMECO, t2.dtUltimoTRX, t2.UltimoEstatus
from CATALOGOS.AUTOBUSES t1
         left JOIN (select TRXEMV.SNUMECO,
                           MAX(DTFECHACREACION) KEEP (DENSE_RANK LAST ORDER BY TRXEMV.DTFECHACREACION) AS dtUltimoTRX,
                           MAX(TRXEMV.SESTADOOPERACION)
                               KEEP (DENSE_RANK LAST ORDER BY TRXEMV.DTFECHACREACION)                  AS UltimoEstatus
                    FROM TransaccionesEMV TRXEMV
                    WHERE 1 = 1
                    GROUP BY TRXEMV.SNUMECO) t2 on t1.SNUMECO = t2.SNUMECO
where t1.BACTIVO = 1
  and t1.BBAJA = 0;



select *
from catalogos.AUTOBUSES


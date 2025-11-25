WITH params AS (SELECT
                    /*ACTUAL*/
                    TO_DATE('14/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d1,
                    TO_DATE('17/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d2,
                    /*SEMANA ANTERIOR*/
                    TO_DATE('07/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d3,
                    TO_DATE('10/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d4
                FROM dual),
/*actual*/
     ACTUAL AS (select *
                from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
                where 1 = 1
                  and t1.IERROR = 3
                  and DTFECHACREACION >= (select d1 from params)
                  and DTFECHACREACION <= (select d2 from params)
         /**/
     ),
     ANTERIOR AS (select *
                  from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
                  where 1 = 1
                    and t1.IERROR = 3
                    and DTFECHACREACION >= (select d3 from params)
                    and DTFECHACREACION <= (select d4 from params))
select trunc(DTFECHACREACION) as fecha, count(1) trx_error_3
from (select *
      from ACTUAL
      union all
      select *
      from ANTERIOR) dual
group by trunc(DTFECHACREACION)
;

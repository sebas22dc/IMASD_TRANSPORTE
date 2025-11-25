

-- VALIDADORES
SELECT COUNT(0) AS ALERTA
FROM catalogos.validadores c
WHERE c.bactivo = 1
  AND c.bbaja = 0
  AND GREATEST(c.dtfechacreacion, NVL(c.dtfechaultmod, c.dtfechacreacion)) <=
      SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(1, 'MINUTE')
  AND (
    NOT EXISTS (SELECT 1
                FROM openloop.validadores o
                WHERE o.uidvalidador = c.uidvalidador)
        OR EXISTS (SELECT 1
                   FROM openloop.validadores o
                   WHERE o.uidvalidador = c.uidvalidador
                     AND o.snumeroserie <> c.snumeroserie)
    )
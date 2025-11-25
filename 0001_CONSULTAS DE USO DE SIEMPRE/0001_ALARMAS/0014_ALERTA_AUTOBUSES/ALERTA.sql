
-- AUTOBUSES
SELECT COUNT(0) AS ALERTA
FROM catalogos.autobuses c
WHERE c.bactivo = 1
  AND c.bbaja = 0
  AND GREATEST(c.dtfechacreacion, NVL(c.dtfechaultmod, c.dtfechacreacion)) <=
      SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(1, 'MINUTE')
  AND (
    NOT EXISTS (SELECT 1
                FROM openloop.autobuses o
                WHERE o.uidautobus = c.uidautobus)
        OR EXISTS (SELECT 1
                   FROM openloop.autobuses o
                   WHERE o.uidautobus = c.uidautobus
                     AND o.snumeco <> c.snumeco)
    )
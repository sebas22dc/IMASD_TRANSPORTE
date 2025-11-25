

-- AUTOBUSVALIDADOR
SELECT COUNT(0) AS ALERTA
FROM catalogos.autobusvalidador c
WHERE c.bactivo = 1
  AND c.bbaja = 0
  AND GREATEST(c.dtfechacreacion, NVL(c.dtfechaultmod, c.dtfechacreacion)) <=
      SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(1, 'MINUTE')
  AND NOT EXISTS (SELECT 1
                  FROM openloop.autobusvalidador o
                  WHERE o.uidautobus = c.uidautobus
                    AND o.uidvalidador = c.uidvalidador)
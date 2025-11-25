-- VSAM
SELECT COUNT(0) AS ALERTA
FROM catalogos.vsam c
WHERE c.bactivo = 1
  AND c.bbaja = 0
  AND GREATEST(c.dtfechacreacion, NVL(c.dtfechaultmod, c.dtfechacreacion)) <=
      SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(1, 'MINUTE')
  AND (
    NOT EXISTS (SELECT 1
                FROM openloop.vsam o
                WHERE o.uidvsam = c.uidvsam)
        OR EXISTS (SELECT 1
                   FROM openloop.vsam o
                   WHERE o.uidvsam = c.uidvsam
                     AND o.SCSN <> c.SCSN)
    );

-- VALIDADORVSAM
SELECT COUNT(0) AS ALERTA
FROM catalogos.validadorvsam c
WHERE c.bactivo = 1
  AND c.bbaja = 0
  AND GREATEST(c.dtfechacreacion, NVL(c.dtfechaultmod, c.dtfechacreacion)) <=
      SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(1, 'MINUTE')
  AND (
    NOT EXISTS (SELECT 1
                FROM openloop.validadorvsam o
                WHERE o.uidvalidadorvsam = c.uidvalidadorvsam)
        OR EXISTS (SELECT 1
                   FROM openloop.validadorvsam o
                   WHERE o.uidvalidadorvsam = c.uidvalidadorvsam
                     AND (
                       o.uidvalidador <> c.uidvalidador
                           OR o.uidvsam <> c.uidvsam
                       ))
    )
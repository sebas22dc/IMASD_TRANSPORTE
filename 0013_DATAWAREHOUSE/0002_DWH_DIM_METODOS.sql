-------------------------DIM METODOS

select UIDOPERACION,
       OPERACION,
       COMERCIO,
       FECHA,
       MONTO,
       SESTATUS,
       GRUPOCOMERCIAL,
       FOLIO
from (SELECT DISTINCT O.UIDORDEN                  AS UIDOPERACION,
                      o.sconcepto                 as OPERACION,
                      e.STIPOMONEDERO                COMERCIO,
                      m.DTFECHAOPERACION             FECHA,
                      --CASE WHEN O.BACTIVO=1 THEN 'CONFIRMADA' ELSE 'OTRO' END ESTATUS,
                      m.DMONTO                       MONTO,
                      E.SESTATUS,
                      CASE
                          WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
                          WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
                          WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
                          WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
                          ELSE NULL
                          END                        GRUPOCOMERCIAL,
                      TO_CHAR(M.IFOLIOMOVIMIENTO) AS FOLIO
      FROM PAGOS.ORDENES o
               INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA e ON o.UIDMONEDERO = e.UIDMONEDERO
               INNER JOIN MONEDEROCOMANDOS.movimientosestadosdecuenta m ON o.UIDORDEN = m.UIDOPERACION
          AND m.SEMISOR = 'APP'
          AND m.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'--ABONO
          AND m.UIDTIPOTRANSACCION = 'e350f3d3-c742-4a13-9674-edeafc171893'--CARGO M.F
      WHERE EXTRACT(YEAR FROM M.DTFECHAOPERACION) = 2025
        AND EXTRACT(MONTH FROM M.DTFECHAOPERACION) = 10
        AND EXTRACT(DAY FROM M.DTFECHAOPERACION) in (7)


      union all


      SELECT distinct O.UIDORDEN                  AS UIDOPERACION,
                      o.sconcepto                 as OPERACION,
                      e.STIPOMONEDERO                COMERCIO,
                      m.DTFECHAOPERACION             FECHA,
                      --CASE WHEN O.BACTIVO=1 THEN 'CONFIRMADA' ELSE 'OTRO' END ESTATUS,
                      m.DMONTO                       MONTO,
                      E.SESTATUS,
                      CASE
                          WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
                          WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
                          WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
                          WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
                          ELSE NULL
                          END                        GRUPOCOMERCIAL,
                      TO_CHAR(M.IFOLIOMOVIMIENTO) AS FOLIO
      FROM PAGOS.ORDENES o
               INNER JOIN PAGOS.PAGOSCODI oCodi ON o.UIDORDEN = oCodi.UIDORDEN
               INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA e ON e.UIDMONEDERO = o.UIDMONEDERO
               LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA m
                         ON m.UIDMONEDERO = o.UIDMONEDERO AND m.UIDOPERACION = oCodi.UIDPAGOCODI AND m.SEMISOR = 'APP'
      WHERE 1 = 1
--   AND m.DTFECHAOPERACION >= ()
--   and m.DTFECHAOPERACION < ()
        AND EXTRACT(YEAR FROM M.DTFECHAOPERACION) = 2025
        AND EXTRACT(MONTH FROM M.DTFECHAOPERACION) = 10
        AND EXTRACT(DAY FROM M.DTFECHAOPERACION) in (7)
        AND oCodi.SESTATUSCODI = 'Exitoso'
        AND o.BPAGADO = 1
        AND o.IOPCION_PAGO = 4
        AND m.UIDOPERACION IS not NULL
--------------------------------
        AND M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
        AND M.SEMISOR = 'APP'
        AND M.DMONTO > 0) t
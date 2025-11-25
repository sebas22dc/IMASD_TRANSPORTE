
WITH params AS (SELECT TRUNC(SYSDATE - [DESDE_MAS]) d1,
                       TRUNC(SYSDATE - [HASTA]) d2
                FROM dual),
     Exclusion_Reverso_oxxo as (SELECT b.UIDOPERACION
                                FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                         INNER JOIN (SELECT A.UIDOPERACION,
                                                            uidmonedero,
                                                            ifoliomovimiento,
                                                            trunc(dtfechaoperacion) fecha
                                                     FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA a
                                                     WHERE SOBSERVACIONES != 'REVERSA OXXO WAY'
                                                       AND semisor IN ('CADENA COMERCIAL OXXO')) b
                                                    ON b.UIDMONEDERO = a.UIDMONEDERO AND
                                                       b.IFOLIOMOVIMIENTO = a.IFOLIOMOVIMIENTO AND
                                                       b.FECHA = trunc(A.dtfechacreacion)
                                WHERE SOBSERVACIONES = 'REVERSA OXXO WAY')
SELECT
    --M.UIDOPERACION,
    O.SCONCEPTO                 AS                                                 OPERACION,
    TT.SNOMBRE                  AS                                                 TIPOTRANSACCION,
    TM.STIPOMONEDERO            AS                                                 TIPOMONEDERO,
    TMOV.SNOMBRE                AS                                                 TIPOMOVIMIENTO,
    to_char(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS')                           DTFECHAOPERACION,
    M.SEMISOR                   AS                                                 COMERCIO,
    --O.IOPCION_PAGO,
    CASE
        WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
        WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
        WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
        WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
        END                                                                        GRUPOCOMERCIAL,
    TO_CHAR(M.IFOLIOMOVIMIENTO) AS                                                 FOLIOINTERNO,
    TO_CHAR(MON.INUMMONEDERO)   AS                                                 INUMMONEDERO,
    TF.STIPOTARIFA              AS                                                 TIPOTARIFA,
    TO_CHAR(M.DMONTO)           AS                                                 DMONTO,
    M.DMONTO - (M.DMONTO * CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END / 100) MONTOCOBRADO,
    CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END                               COMISION_PORC
FROM MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M
         LEFT JOIN CREDENCIALIZACION.TARJETAS T ON T.UIDMONEDERO = M.UIDMONEDERO
         LEFT JOIN MONEDEROCOMANDOS.MONEDERO MON ON MON.UIDMONEDERO = M.UIDMONEDERO
         LEFT JOIN CATALOGOS.TIPOTARIFAS TF ON TF.UIDTIPOTARIFA = MON.UIDTIPOTARIFA
         LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT ON TT.UIDTIPOTRANSACCION = M.UIDTIPOTRANSACCION
         LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO = M.UIDTIPOSMONEDERO
         LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV ON TMOV.UIDTIPOMOVIMIENTO = M.UIDTIPOMOVIMIENTO
         LEFT JOIN COMERCIO.COMERCIOS C ON C.SCOMERCIO = M.SEMISOR
         LEFT JOIN PAGOS.ORDENES O ON O.UIDORDEN = M.UIDOPERACION
WHERE M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
  AND M.SEMISOR = 'APP'
  AND M.DMONTO > 0
  AND M.UIDOPERACION NOT IN (select UIDOPERACION from Exclusion_Reverso_oxxo)
  AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or M.UIDTIPOOPERACION is null)
  and O.SCONCEPTO is not null
  AND m.DTFECHAOPERACION >= (select d1 from params)
  and m.DTFECHAOPERACION < (select d2 from params)

union all

SELECT o.SCONCEPTO,
       TT.UIDTIPOTRANSACCION,
       TM.STIPOMONEDERO,
       TMOV.SNOMBRE,
       to_char(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS')                           DTFECHAOPERACION,
       M.SEMISOR                   AS                                                 COMERCIO,
       CASE
           WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
           WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
           WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
           WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
           END                                                                        GRUPOCOMERCIAL,
       TO_CHAR(M.IFOLIOMOVIMIENTO) AS                                                 FOLIOINTERNO,
       TO_CHAR(MON.INUMMONEDERO)   AS                                                 INUMMONEDERO,
       TF.STIPOTARIFA              AS                                                 TIPOTARIFA,
       TO_CHAR(M.DMONTO)           AS                                                 DMONTO,
       M.DMONTO - (M.DMONTO * CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END / 100) MONTOCOBRADO,
       CASE WHEN O.IOPCION_PAGO = 3 THEN 1.8 ELSE 0 END                               COMISION_PORC
FROM PAGOS.ORDENES o
         INNER JOIN PAGOS.PAGOSCODI oCodi ON o.UIDORDEN = oCodi.UIDORDEN
         INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA e ON e.UIDMONEDERO = o.UIDMONEDERO
         LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA m
                   ON m.UIDMONEDERO = o.UIDMONEDERO AND m.UIDOPERACION = oCodi.UIDPAGOCODI AND m.SEMISOR = 'APP'
         LEFT JOIN MONEDEROCOMANDOS.MONEDERO MON ON MON.UIDMONEDERO = M.UIDMONEDERO
         LEFT JOIN CATALOGOS.TIPOTARIFAS TF ON TF.UIDTIPOTARIFA = MON.UIDTIPOTARIFA
         LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT ON TT.UIDTIPOTRANSACCION = M.UIDTIPOTRANSACCION
         LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO = M.UIDTIPOSMONEDERO
         LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV ON TMOV.UIDTIPOMOVIMIENTO = M.UIDTIPOMOVIMIENTO
WHERE 1 = 1
  AND m.DTFECHAOPERACION >= (select d1 from params)
  and m.DTFECHAOPERACION < (select d2 from params)
  AND oCodi.SESTATUSCODI = 'Exitoso'
  AND o.BPAGADO = 1
  AND o.IOPCION_PAGO = 4
  AND m.UIDOPERACION IS not NULL
--------------------------------
  AND M.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'
  AND M.SEMISOR = 'APP'
  AND M.DMONTO > 0
;
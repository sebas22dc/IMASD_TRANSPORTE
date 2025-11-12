SELECT DISTINCT o.UIDOPERACION,
                'e350f3d3-c742-4a13-9674-edeafc171893' AS            UIDTIPOTRANSACCION,
                'CARGO M.F'                            AS            TIPOTRANSACCION,
                tm.stipomonedero                       AS            TIPOMONEDERO,
                o.stipomovimiento                      AS            TIPOMOVIMIENTO,
                to_char(o.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
                CO.SCOMERCIO                           AS            COMERCIO,
                O.UIDCOMERCIO                          AS            UIDCOMERCIO,
                O.SFOLIOVENTA                          AS            FOLIOINTERNO,
                m.uidmonedero                          AS            UIDMONEDERO,
                TO_CHAR(do.SNUMEROMONEDERO)            AS            INUMMONEDERO,
                tt.stipotarifa                         AS            TIPOTARIFA,
                TO_CHAR(-O.DMONTOVENTA)                AS            DMONTO
from COMERCIOCONSULTAS.operaciones o
         inner join comercioconsultas.detalleoperaciones do on do.uidoperacion = o.uidoperacion
         inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
         inner join catalogos.estatus e on e.uidestatus = co.uidestatus
         left join monederocomandos.monedero m on m.inummonedero = do.snumeromonedero
         left join catalogos.tipotarifas tt on tt.uidtipotarifa = m.uidtipotarifa
         left join catalogos.tiposmonedero tm on tm.uidtipomonedero = m.uidtiposmonedero
WHERE o.SESTATUSTRANSACCION = 'CONFIRMADA'
  AND EXTRACT(YEAR FROM o.DTFECHAOPERACION) = 2025
  AND EXTRACT(MONTH FROM o.DTFECHAOPERACION) = 10
  AND EXTRACT(DAY FROM o.DTFECHAOPERACION) in (7)
--AND o.DTFECHAOPERACION >= sysdate-1
--AND o.DTFECHAOPERACION < sysdate

UNION ALL
select t.UIDOPERACION,
       UIDTIPOTRANSACCION,
       TIPOTRANSACCION,
       TIPOMONEDERO,
       TIPOMOVIMIENTO,
       DTFECHAOPERACION,
       COMERCIO,
       UIDCOMERCIO,
       FOLIOINTERNO,
       UIDMONEDERO,
       INUMMONEDERO,
       TIPOTARIFA,
       DMONTO
from (SELECT M.UIDOPERACION,
             M.UIDTIPOTRANSACCION        AS                       UIDTIPOTRANSACCION,
             TT.SNOMBRE                  AS                       TIPOTRANSACCION,
             TM.STIPOMONEDERO            AS                       TIPOMONEDERO,
             TMOV.SNOMBRE                AS                       TIPOMOVIMIENTO,
             to_char(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
             M.SEMISOR                   AS                       COMERCIO,
             'APP'                       AS                       UIDCOMERCIO,
             TO_CHAR(M.IFOLIOMOVIMIENTO) AS                       FOLIOINTERNO,
             M.UIDMONEDERO               AS                       UIDMONEDERO,
             TO_CHAR(MON.INUMMONEDERO)   AS                       INUMMONEDERO,
             TF.STIPOTARIFA              AS                       TIPOTARIFA,
             TO_CHAR(M.DMONTO)           AS                       DMONTO
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
        AND M.UIDOPERACION NOT IN (SELECT b.UIDOPERACION
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
        AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or M.UIDTIPOOPERACION is null)
        and O.SCONCEPTO is not null
        AND EXTRACT(YEAR FROM M.DTFECHAOPERACION) = 2025
        AND EXTRACT(MONTH FROM M.DTFECHAOPERACION) = 10
        AND EXTRACT(DAY FROM M.DTFECHAOPERACION) in (7)
      --AND M.DTFECHAOPERACION >= sysdate-1
--AND M.DTFECHAOPERACION < sysdate
      UNION ALL

      SELECT o.UIDORDEN                  AS                       UIDOPERACION,
             TT.UIDTIPOTRANSACCION       AS                       UIDTIPOTRANSACCION,
             tt.SNOMBRE                  AS                       TIPOTRANSACCION,
             TM.STIPOMONEDERO            AS                       STIPOMONEDERO,
             TMOV.SNOMBRE                AS                       TIPOMOVIMIENTO,
             to_char(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS') DTFECHAOPERACION,
             M.SEMISOR                   AS                       COMERCIO,
             'APP'                       AS                       UIDCOMERCIO,
             TO_CHAR(M.IFOLIOMOVIMIENTO) AS                       FOLIOINTERNO,
             MON.UIDMONEDERO             AS                       UIDMONEDERO,
             TO_CHAR(MON.INUMMONEDERO)   AS                       INUMMONEDERO,
             TF.STIPOTARIFA              AS                       TIPOTARIFA,
             TO_CHAR(M.DMONTO)           AS                       DMONTO
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
        AND M.DMONTO > 0) t;



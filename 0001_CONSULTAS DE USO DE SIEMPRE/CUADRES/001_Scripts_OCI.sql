with COMERCIOS_app AS (SELECT
                           M.UIDOPERACION,
                           O.SCONCEPTO                 AS                                                 OPERACION,
                           TT.SNOMBRE                  AS                                                 TIPOTRANSACCION,
                           TM.STIPOMONEDERO            AS                                                 TIPOMONEDERO,
                           TMOV.SNOMBRE                AS                                                 TIPOMOVIMIENTO,
                           M.DTFECHAOPERACION                                                             DTFECHAOPERACION,
--                            to_char(M.DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS')                           DTFECHAOPERACION,
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
                         AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or
                              M.UIDTIPOOPERACION is null)
                         and O.SCONCEPTO is not null
                         AND trunc(m.DTFECHAOPERACION) >= trunc(to_date('22/08/25'))
                         and trunc(m.DTFECHAOPERACION) < trunc(to_date('23/09/25')))
-- SELECT trunc(t1.DTFECHAOPERACION) FECHA_OPERACION, count(1) trxs, sum(abs(t1.DMONTO))
-- FROM COMERCIOS_app t1
-- group by trunc(t1.DTFECHAOPERACION)
-- order by FECHA_OPERACION;
SELECT trunc(DTFECHAOPERACION), count(1) trx, sum(DMONTO)
FROM COMERCIOS_app t1
group by trunc(DTFECHAOPERACION)
ORDER BY TRUNC(DTFECHAOPERACION);


with comercios_RED as (select o.soperacion as                        "OPERACION",
                              co.inumcomercio                        "CLIENTE",
                              co.scomercio                           "COMERCIO",
                              o.sfolioventa                          "FOLIO",
                              o.dtfechaoperacion                     "FECHA",
--                               trunc(o.dtfechaoperacion)              "FECHA",
                              to_char(o.dtfechaoperacion, 'HH24:MI') "HORA"
                               ,
                              o.sestatustransaccion                  "ESTATUS",
                              o.dmontoventa                          "MONTO DE VENTA",
--o.dmontocobrado "MONTO COBRADO",
                              o.dmontoventa - (o.dmontoventa * case
                                  --when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then 0 --OXXO
                                                                   when op.uidcomercio = '926527d5-bf3a-45eb-95ac-0b458aadaf35'
                                                                       then 2.5 --AKI
                                                                   when op.uidcomercio = '8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9'
                                                                       then 2.9 --DUNOSUSA
                                                                   when op.uidcomercio = '5c1656c3-fe1d-4a63-8bed-68528510434c'
                                                                       then 3.132 --SIX
                                                                   when op.uidcomercio = '3845c2dc-2d4a-4b08-b50e-fe3996bc029d'
                                                                       then 2.5 --WILLYS
                                                                   when co.snombregrupocomercial = 'COMISARIAS'
                                                                       then 6.38
                                                                   else 0
                                  end / 100)                         "MONTO COBRADO",
                              o.stipomovimiento                      "TIPO",
                              NVL(o.smotivo, ' ')                    "MOTIVO",
                              o.icantidad                            "CANTIDAD",
                              o.dsaldoanterior                       "SALDO ANTERIOR",
                              o.dsaldoactual                         "SALDO ACTUAL",
                              e.sestatus,
                              co.snombregrupocomercial               "GRUPO COMERCIAL",
                              case
                                  when op.uidcomercio = '797f81f4-e741-4d3f-9768-81ff237a65b6' then ltrim(regexp_substr(
                                          regexp_substr(op.sdatosadicionales, '[^|]+', 1, 7), '[^:]+', 1, 2))--OXXO
                                  when op.uidcomercio = '926527d5-bf3a-45eb-95ac-0b458aadaf35' then regexp_substr(
                                          regexp_substr(op.sdatosadicionales, '[^|]+', 1, 1), '\S+', 1, 2) --AKI
                                  when op.uidcomercio = '8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then ltrim(regexp_substr(
                                          regexp_substr(op.sdatosadicionales, '[^|]+', 1, 1), '[^:]+', 1, 2))--DUNOSUSA
                                  when op.uidcomercio = '5c1656c3-fe1d-4a63-8bed-68528510434c' then regexp_substr(
                                          regexp_substr(op.sdatosadicionales, '[^|]+', 1, 2), '\S+', 1, 2) --SIX
                                  when op.uidcomercio = '3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then regexp_substr(
                                          regexp_substr(op.sdatosadicionales, '[^|]+', 1, 1), '[^:]+', 1, 2)--WILLYS
                                  else ltrim(regexp_substr(op.sdatosadicionales, '[^|]+', 1, 2)) --CIFO
                                  end                                "SUCURSAL",
                              case
                                  --when op.uidcomercio='797f81f4-e741-4d3f-9768-81ff237a65b6' then 0 --OXXO
                                  when op.uidcomercio = '926527d5-bf3a-45eb-95ac-0b458aadaf35' then 2.5 --AKI
                                  when op.uidcomercio = '8a5750ea-1ec8-4c20-a0e7-eb19ce45f0c9' then 2.9 --DUNOSUSA
                                  when op.uidcomercio = '5c1656c3-fe1d-4a63-8bed-68528510434c' then 3.132 --SIX
                                  when op.uidcomercio = '3845c2dc-2d4a-4b08-b50e-fe3996bc029d' then 2.5 --WILLYS
                                  when co.snombregrupocomercial = 'COMISARIAS' then 6.38
                                  else 0
                                  end                                "COMISION"
                       from COMERCIOCONSULTAS.operaciones o
                                inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
                                inner join catalogos.estatus e on e.uidestatus = co.uidestatus
                                left join comercio.operaciones op on op.uidoperacion = o.uidoperacion
                       where trunc(o.DTFECHAOPERACION) >= trunc(TO_DATE('01-08-2025'))
                         AND trunc(o.DTFECHAOPERACION) < trunc(TO_DATE('01-09-2025'))
                       and o.SESTATUSTRANSACCION = 'CONFIRMADA'
                       order by o.DTFECHAOPERACION desc)
select trunc(t1.FECHA) FECHA_OPERACION, count(1) trxs, sum(abs(t1."MONTO DE VENTA"))
from comercios_RED t1
group by trunc(t1.FECHA)
order by FECHA_OPERACION;


with comercios_EMV AS (SELECT 'EMV'                  COMERCIO,
                              'CARGO M.F'            TIPO_TRANSACCION,
                              OL.DTFECHACAMBIOESTADO FECHA_OPERACION,
--                               TO_CHAR(OL.DTFECHACAMBIOESTADO, 'DD/MM/YYYY HH24:MM:SS') FECHA_OPERACION,
                              'EMV'                  TIPO_MONEDERO,
                              'Abono'                TIPO_MOVIMIENTO,
                              'EMV-BANCARIA'         TIPO_TARIFA,
                              SEMVCARDBRAND          TIPOTARJETA,
                              SEMVCARDBIN            FIRST6D,
                              SEMVCARDLAST           LAST4D,
                              C.DTARIFAMONTO         MONTO
                       FROM openloop.transacciones OL
                                INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
                                left join openloop.CONCILIACIONES CO ON CO.STOKENTRANSACTION = OL.STOKENTRANSACTION
                       WHERE OL.DTFECHACREACION >= TO_DATE('28-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
                         AND TRUNC(OL.DTFECHACAMBIOESTADO) >= TRUNC(TO_DATE('17/08/25'))
                         AND TRUNC(OL.DTFECHACAMBIOESTADO) < TRUNC(TO_DATE('18/08/25'))
                         AND OL.SESTADOOPERACION = 'LIQUIDADO')
SELECT trunc(t1.FECHA_OPERACION) FECHA_OPERACION, count(1) trxs, sum(abs(t1.MONTO))
FROM comercios_EMV t1
group by trunc(t1.FECHA_OPERACION)
order by FECHA_OPERACION;
--------------------------------------------------------------------------


select * from pagos.PAGOSBANORTE
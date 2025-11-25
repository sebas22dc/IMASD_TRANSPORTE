SELECT 'EMV'                                                    COMERCIO,
       'CARGO M.F'                                              TIPO_TRANSACCION,
       TO_CHAR(OL.DTFECHACAMBIOESTADO, 'DD/MM/YYYY HH24:MM:SS') FECHA_OPERACION,
       'EMV'                                                    TIPO_MONEDERO,
       'Abono'                                                  TIPO_MOVIMIENTO,
       'EMV-BANCARIA'                                           TIPO_TARIFA,
       SEMVCARDBRAND                                            TIPOTARJETA,
       SEMVCARDBIN                                              FIRST6D,
       SEMVCARDLAST                                             LAST4D,
       C.DTARIFAMONTO                                           MONTO
FROM openloop.transacciones OL
         INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
         left join openloop.CONCILIACIONES CO ON CO.STOKENTRANSACTION = OL.STOKENTRANSACTION
WHERE OL.DTFECHACREACION >= TO_DATE('28-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
  AND OL.DTFECHACAMBIOESTADO >= TRUNC(SYSDATE - [DESDE_MAS])
  AND OL.DTFECHACAMBIOESTADO < TRUNC(SYSDATE - [HASTA])
  AND OL.SESTADOOPERACION = 'LIQUIDADO'
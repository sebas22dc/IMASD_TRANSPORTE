SELECT OL.SIDTRANSACCION                      UIDOPERACION,
       'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION,
--        'CARGO M.F'                            TIPOTRANSACCION,
       'EMV'                                  UIDCOMERCIO,
       OL.DTFECHACAMBIOESTADO                 FECHA_OPERACION,
--                               TO_CHAR(OL.DTFECHACAMBIOESTADO, 'DD/MM/YYYY HH24:MM:SS') FECHA_OPERACION,
       'EMV'                                  TIPO_MONEDERO,
       'Abono'                                TIPO_MOVIMIENTO,
       '0'                                    FOLIOINTERNO,
       '0'                                    UIDMONEDERO,
       '0'                                    INUMMONEDERO,
       'EMV-BANCARIA'                         TIPOTARIFA,
--        SEMVCARDBRAND                          TIPOTARJETA,
--        SEMVCARDBIN                            FIRST6D,
--        SEMVCARDLAST                           LAST4D,
       C.DTARIFAMONTO                         MONTO
FROM openloop.transacciones OL
         INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
         left join openloop.CONCILIACIONES CO ON CO.STOKENTRANSACTION = OL.STOKENTRANSACTION
WHERE 1 = 1
  and OL.DTFECHACREACION >=
      TO_DATE('28-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS') --> CONDICION INICIAL DE CUANDO INICIO OFICIALMENTE EL COBRO CON TARJETAS DE BANCO EN VA Y VEN
  AND TRUNC(OL.DTFECHACAMBIOESTADO) >= TRUNC((SYSDATE - 6 / 24) - 1)
  AND TRUNC(OL.DTFECHACAMBIOESTADO) < TRUNC((SYSDATE - 6 / 24))
  AND OL.SESTADOOPERACION = 'LIQUIDADO'




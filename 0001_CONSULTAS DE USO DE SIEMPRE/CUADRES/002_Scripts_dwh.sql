with COMERCIOS_RED_DHW as (SELECT DISTINCT o.UIDOPERACION,
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
                                    inner join comercioconsultas.detalleoperaciones do
                                               on do.uidoperacion = o.uidoperacion
                                    inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
                                    inner join catalogos.estatus e on e.uidestatus = co.uidestatus
                                    left join monederocomandos.monedero m on m.inummonedero = do.snumeromonedero
                                    left join catalogos.tipotarifas tt on tt.uidtipotarifa = m.uidtipotarifa
                                    left join catalogos.tiposmonedero tm on tm.uidtipomonedero = m.uidtiposmonedero
                           WHERE o.SESTATUSTRANSACCION = 'CONFIRMADA'
--                      AND EXTRACT(YEAR FROM o.DTFECHAOPERACION) = 2025
--                      AND EXTRACT(MONTH FROM o.DTFECHAOPERACION) = 9
--                      AND EXTRACT(DAY FROM o.DTFECHAOPERACION) in (11)
                             AND O.DTFECHAOPERACION >= sysdate - 79
                             AND O.DTFECHAOPERACION < sysdate - 48)
select *
from COMERCIOS_RED_DHW;



with RECARGAS_APP_DHW as (SELECT M.UIDOPERACION,
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
                                   LEFT JOIN CATALOGOS.TIPOTRANSACCIONES TT
                                             ON TT.UIDTIPOTRANSACCION = M.UIDTIPOTRANSACCION
                                   LEFT JOIN CATALOGOS.TIPOSMONEDERO TM ON TM.UIDTIPOMONEDERO = M.UIDTIPOSMONEDERO
                                   LEFT JOIN CATALOGOS.TIPOMOVIMIENTOS TMOV
                                             ON TMOV.UIDTIPOMOVIMIENTO = M.UIDTIPOMOVIMIENTO
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
                                                                              b.IFOLIOMOVIMIENTO =
                                                                              a.IFOLIOMOVIMIENTO AND
                                                                              b.FECHA = trunc(A.dtfechacreacion)
                                                       WHERE SOBSERVACIONES = 'REVERSA OXXO WAY')
                            AND (M.UIDTIPOOPERACION <> '786fd3c1-6d72-4801-8da8-b28e055eca49' or
                                 M.UIDTIPOOPERACION is null)
                            and O.SCONCEPTO is not null
-- AND EXTRACT(YEAR FROM M.DTFECHAOPERACION) = 2025 AND EXTRACT(MONTH FROM M.DTFECHAOPERACION) = 9 AND EXTRACT(DAY FROM M.DTFECHAOPERACION) in (11)
                            AND M.DTFECHAOPERACION >= sysdate - 79
                            AND M.DTFECHAOPERACION < sysdate - 48)
select *
from RECARGAS_APP_DHW;






with RECARGAS_APP_DHW_PARTE2 AS (
    SELECT DISTINCT
    O.UIDORDEN AS UIDOPERACION,
    o.sconcepto as OPERACION,
    e.STIPOMONEDERO  COMERCIO,
	m.DTFECHAOPERACION FECHA,
    --CASE WHEN O.BACTIVO=1 THEN 'CONFIRMADA' ELSE 'OTRO' END ESTATUS,
    m.DMONTO MONTO,
    E.SESTATUS,
    CASE WHEN O.IOPCION_PAGO = 4 THEN 'CODI'
            WHEN O.IOPCION_PAGO = 3 THEN 'BANORTE'
            WHEN O.IOPCION_PAGO = 2 THEN 'MERCADO PAGO'
            WHEN O.IOPCION_PAGO = 1 THEN 'PAYPAL'
			ELSE NULL
        END GRUPOCOMERCIAL,
	TO_CHAR(M.IFOLIOMOVIMIENTO) AS FOLIO
FROM PAGOS.ORDENES o
    INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA e ON o.UIDMONEDERO = e.UIDMONEDERO
    INNER JOIN MONEDEROCOMANDOS.movimientosestadosdecuenta m ON o.UIDORDEN = m.UIDOPERACION
        AND m.SEMISOR = 'APP'
        AND m.UIDTIPOMOVIMIENTO = 'ef008eb7-ea41-46bb-814e-f94979913ceb'--ABONO
        AND m.UIDTIPOTRANSACCION = 'e350f3d3-c742-4a13-9674-edeafc171893'--CARGO M.F
WHERE EXTRACT(YEAR FROM M.DTFECHAOPERACION) = 2025 AND EXTRACT(MONTH FROM M.DTFECHAOPERACION) = 8 AND EXTRACT(DAY FROM M.DTFECHAOPERACION) in (29)

)
SELECT TRUNC(T1.FECHA),COUNT(1) TRX, SUM(MONTO) FROM RECARGAS_APP_DHW_PARTE2 T1
GROUP BY TRUNC(T1.FECHA);




--
-- --
-- select sysdate - 8 from dual;
-- select sysdate from dual;


with RECARGAS_EMV_DWH AS (SELECT OL.SIDTRANSACCION                      UIDOPERACION
                               , 'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION
                               , 'CARGO M.F'                            TIPOTRANSACCION
                               , 'EMV'                                  UIDCOMERCIO
                               , 'EMV'                                  COMERCIO
                               , OL.DTFECHACAMBIOESTADO                 DTFECHAOPERACION
                               , 'EMV'                                  TIPOMONEDERO
                               , 'Abono'                                TIPOMOVIMIENTO
                               , '0'                                    FOLIOINTERNO
                               , '0'                                    UIDMONEDERO
                               , '0'                                    INUMMONEDERO
                               , 'EMV-BANCARIA'                         TIPOTARIFA
                               , C.DTARIFAMONTO                         DMONTO
                          FROM openloop.transacciones OL
                                   INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
                          WHERE OL.DTFECHACREACION >= TO_DATE('28-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
                            AND OL.SESTADOOPERACION = 'LIQUIDADO'
                            and extract(year from OL.DTFECHACAMBIOESTADO) = 2025
                            and extract(month from OL.DTFECHACAMBIOESTADO) = 8
                            and extract(day from OL.DTFECHACAMBIOESTADO) in (17)
    --AND OL.DTFECHACAMBIOESTADO >= sysdate-1 and OL.DTFECHACAMBIOESTADO < sysdate
)
SELECT trunc(t1.DTFECHAOPERACION) FECHA_OPERACION, count(1) trxs, sum(abs(t1.DMONTO))
FROM RECARGAS_EMV_DWH t1
group by trunc(t1.DTFECHAOPERACION)
order by FECHA_OPERACION;


---ESTO ES DE SQL SERVER


select vic.FECHA,
       case
           when vic.GRUPOCOMERCIAL = 'APP' then 'APP'
           when vic.GRUPOCOMERCIAL = 'EMV' then 'EMV'
           else 'RED'
           end as GRUPOCOMERCIAL,
       COUNT(1)   TRX,
       SUM(MONTO) MONTO
from dbo.vwIngresosCargos vic
where vic.FECHA between '2025-08-01' and '2025-08-31'

group by vic.fecha,
         case
             when vic.GRUPOCOMERCIAL = 'APP' then 'APP'
             when vic.GRUPOCOMERCIAL = 'EMV' then 'EMV'
             else 'RED'
             end
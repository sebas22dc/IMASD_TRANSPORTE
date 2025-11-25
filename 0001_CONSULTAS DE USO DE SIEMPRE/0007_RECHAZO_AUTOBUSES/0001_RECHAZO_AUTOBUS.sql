WITH BASE_NFC AS (select nfc.uidvalidador,
                         nfc.UIDDETALLESINCRONIZADOR,
                         nfc.dtfechaoperacion,
--                          nfc.LOADTRANSCOUNTER,
                         nfc.inumerotarjeta,
                         nfc.dmontocobrado,
                         nfc.iruta,
                         nfc.DTFECHACREACION,
                         nfc.IERROR,
                         nfc.STIPOTARIFA,
                         nfc.TOKENTRANSACCION,
                         nfc.DSALDO,
                         nfc.ITRANSBORDO,
                         nfc.BPROCESADO,
                         nfc.UIDSINCRONIZACION,
                         nfc.SLATITUD,
                         nfc.SLONGITUD
                  from SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc
                  where 1 = 1
-- 				     and nfc.dtfechaoperacion >= to_date('03/10/2025 00:00:00', 'dd/mm/yyyy hh24:mi:ss')
--                      and nfc.dtfechaoperacion < to_date('04/10/2025 00:00:00', 'dd/mm/yyyy hh24:mi:ss')
                    -- AND NFC.DTFECHAOPERACION >= trunc((sysdate - 6 / 24) - [DESDE_MAS])
                    -- AND NFC.DTFECHAOPERACION < trunc((sysdate - 6 / 24) - [HASTA])
                    AND NFC.DTFECHAOPERACION >= to_date('17/11/2025') --rango entre hace 10 minutos
                    AND NFC.DTFECHAOPERACION < to_date('24/11/2025')  -- rango entre hace 5 minutos
--                     AND trunc(NFC.DTFECHAOPERACION) = trunc(sysdate - 6 / 24) -- DIA HOY
--                     AND to_number(TO_CHAR(nfc.DTFECHAOPERACION, 'HH24')) not in (6, 7, 8) -- DIA HOY
                    -- AND NFC.DTFECHAOPERACION <= (sysdate - 6 / 24 -10/1440 ) -- rango entre hace 5 minutos

                    AND (INUMEROTARJETA > 0 and INUMEROTARJETA is not null)),
     BASE_INICIO AS (SELECT 'Tarjeta Inteligente'                             TIPOTRANSACCION,
                            NFC.DTFECHAOPERACION,
                            --AGREGADOS POR AUDITORIA
                            (select SM.ICONTADORRECARGA
                             from SINCRONIZADOR.MONEDERO SM
                             where SM.INUMEROTARJETA = nfc.INUMEROTARJETA) as LTC_TOTALES,
                            (select SM.ICONTADORRECARGAAPLICADA
                             from SINCRONIZADOR.MONEDERO SM
                             where SM.INUMEROTARJETA = nfc.INUMEROTARJETA) as LTC_APLICADO,
--                             NFC.LOADTRANSCOUNTER,
                            --AGREGADOS POR AUDITORIA
                            to_char(nfc.DTFECHAOPERACION, 'yyyy/MM/dd')    as DIA_OPERACION,
                            to_char(nfc.DTFECHAOPERACION, 'HH24:MI:SS')    as HORA_OPERACION,
                            NFC.DTFECHACREACION,
                            nfc.UIDDETALLESINCRONIZADOR,
                            M.UIDMONEDERO,
                            nfc.STIPOTARIFA,
                            nfc.DMONTOCOBRADO,
                            nfc.IERROR                                        ERROR_tarjeta,
                            COALESCE(TO_CHAR(M.INUMTARJETA), '0')             INUMEROTARJETA,
                            NFC.TOKENTRANSACCION,
                            nfc.DSALDO                                     as SALDO_TARJETA,
                            NFC.DMONTOCOBRADO                                 DMONTO,
                            CASE (NFC.IERROR)
                                WHEN 0 THEN NFC.DSALDO + NFC.DMONTOCOBRADO
                                ELSE NFC.DSALDO END                           DSALDOANTERIOR,
                            NFC.ITRANSBORDO,

                            CASE
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 0
                                ELSE NFC.IERROR END                           IERROR,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 1
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 1
                                WHEN NFC.IERROR in (2, 3, 4, 6, 7)
                                    THEN ROW_NUMBER() OVER (PARTITION BY NFC.INUMEROTARJETA , TRUNC(NFC.DTFECHAOPERACION),nfc.UIDVALIDADOR , CASE WHEN NFC.IERROR = 0 THEN 1 ELSE 0 END ORDER BY NFC.DTFECHAOPERACION ASC)
                                ELSE 1 END                                 AS LIMITE,
                            CASE
                                WHEN NFC.IERROR = 0 THEN 1
                                WHEN NFC.IERROR = 5 and TOKENTRANSACCION != '00000000000000000000000000000000' THEN 1
                                ELSE 0 END                                    BEXITOSO,
--                             R.SCLAVERUTA,
--                             R.SRUTA,
                            v.SVALIDADOR,
                            v.SMODELO,
                            AU.SNUMECO,
                            NFC.BPROCESADO,
--                             case
--                                 when slatitud = '0' then '+20.98155'
--                                 when length(slatitud) = 9 and substr(slatitud, 1, 3) = '+21'
--                                     then substr(slatitud, 1, 4) || '0' || substr(slatitud, 5, 5)
--                                 when length(slatitud) = 8 and substr(slatitud, 1, 3) = '+21'
--                                     then substr(slatitud, 1, 4) || '00' || substr(slatitud, 5, 4)
--                                 when length(slatitud) = 7 and substr(slatitud, 1, 3) = '+21'
--                                     then substr(slatitud, 1, 4) || '000' || substr(slatitud, 5, 3)
--                                 when length(slatitud) = 6 and substr(slatitud, 1, 3) = '+21'
--                                     then substr(slatitud, 1, 4) || '0000' || substr(slatitud, 5, 2)
--                                 when length(slatitud) = 5 and substr(slatitud, 1, 3) = '+21'
--                                     then substr(slatitud, 1, 4) || '00000' || substr(slatitud, 5, 1)
--                                 when length(slatitud) = 8 and substr(slatitud, 1, 2) = '21'
--                                     then '+' || substr(slatitud, 1, 3) || '0' || substr(slatitud, 4, 5)
--                                 when length(slatitud) = 7 and substr(slatitud, 1, 2) = '21'
--                                     then '+' || substr(slatitud, 1, 3) || '00' || substr(slatitud, 4, 4)
--                                 when length(slatitud) = 6 and substr(slatitud, 1, 2) = '21'
--                                     then '+' || substr(slatitud, 1, 3) || '000' || substr(slatitud, 4, 3)
--                                 when length(slatitud) = 5 and substr(slatitud, 1, 2) = '21'
--                                     then '+' || substr(slatitud, 1, 3) || '0000' || substr(slatitud, 4, 2)
--                                 when length(slatitud) = 4 and substr(slatitud, 1, 2) = '21'
--                                     then '+' || substr(slatitud, 1, 3) || '00000' || substr(slatitud, 4, 1)
--                                 when substr(slatitud, 1, 2) = '20' then '+' || slatitud
--                                 else slatitud end                                                            "LATITUD",
--                             case when slongitud = '0' then '-89.62573' else replace(slongitud, '+', '-') end "LONGITUD"
--                              ,
--                             SLATITUD                                       as                                LATITUD_CRUDO,
--                             SLONGITUD                                      as                                LONGITUD_CRUDO,
--                             case
--                                 when to_number(slatitud) >= 21 then trunc(to_number(slatitud)) +
--                                                                     (to_number(slatitud) - trunc(to_number(slatitud))) /
--                                                                     10
--                                 else to_number(slatitud) end               as                                LATITUD_CORREGIDO,
                            IRUTA
                     FROM BASE_NFC NFC
                              INNER JOIN MONEDEROCONSULTAS.ESTADODECUENTA m
                                         ON M.INUMTARJETA = NFC.INUMEROTARJETA
--                               LEFT JOIN SINCRONIZADOR.RUTAS r ON R.SCLAVERUTA = NFC.IRUTA and M.Inumerotarjeta > 0
                              LEFT JOIN SINCRONIZADOR.VALIDADORES v on v.UIDVALIDADOR = NFC.UIDVALIDADOR
                              LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR AV
                                        ON AV.UIDVALIDADOR = v.UIDVALIDADOR AND AV.BACTIVO = 1
                              LEFT JOIN SINCRONIZADOR.AUTOBUSES AU ON AU.UIDAUTOBUS = AV.UIDAUTOBUS),
     baseMasSaldo as (SELECT NVL((select Sum(t1.Dmonto)
                                  from MONEDEROCOMANDOS.movimientosestadosdecuenta t1
                                  where 1 = 1
                                    and t1.uidmonedero = r.UIDMONEDERO
                                    and r.IERROR = 2
                                    and LIMITE = 1
                                    and t1.dtfechaoperacion < r.DTFECHACREACION
                                  group by r.inumerotarjeta), 0) as MontoMovimiento,
                             r.*
                      FROM BASE_INICIO r)
        ,
     Secciondos as (select (CASE
                                WHEN NFC.ERROR_tarjeta = 0 THEN 'Confirmada'
         --                                 WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION != '00000000000000000000000000000000'
--                                     THEN 'Confirmada con error 5'
                                WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION != '00000000000000000000000000000000'
                                    THEN 'Confirmada'
                                WHEN NFC.ERROR_tarjeta = 5 and TOKENTRANSACCION = '00000000000000000000000000000000'
                                    THEN 'Error en lectura'
                                WHEN NFC.ERROR_tarjeta = 1 THEN 'Tarjeta expirada'
                                WHEN NFC.ERROR_tarjeta = 2 AND (NFC.MontoMovimiento - NFC.DMONTOCOBRADO) <= 0
                                    THEN 'Sin saldo'
                                WHEN NFC.ERROR_tarjeta = 2 AND (NFC.MontoMovimiento - NFC.DMONTOCOBRADO) > 0
                                    THEN 'Rechazada'
                                WHEN NFC.ERROR_tarjeta = 3 THEN 'Deny list'
                                WHEN NFC.ERROR_tarjeta = 4 THEN 'Tarjeta no soportada'
                                WHEN NFC.ERROR_tarjeta = 6 THEN 'Falta configurar tarifa'
                                WHEN NFC.ERROR_tarjeta = 7 THEN 'Error en recarga'
                                WHEN NFC.ERROR_tarjeta = 100 THEN 'Tarjeta recargada'
                                ELSE 'Otro' END) as ESTADOTRANSACCIONVersion2,
                           NFC.*
                    from baseMasSaldo NFC),
     rechazo_por_autobus as (select estadotransaccionversion2,
                                    montomovimiento,
                                    tipotransaccion,
                                    dtfechaoperacion,
                                    dia_operacion,
                                    hora_operacion,
                                    dtfechacreacion,
                                    uiddetallesincronizador,
                                    uidmonedero,
                                    dmontocobrado,
                                    error_tarjeta,
                                    stipotarifa,
                                    inumerotarjeta,
                                    tokentransaccion,
                                    saldo_tarjeta,
                                    dmonto,
                                    dsaldoanterior,
                                    itransbordo,
                                    ierror,
                                    limite,
                                    bexitoso,
                                    svalidador,
                                    smodelo,
                                    snumeco,
                                    bprocesado,
--                                     LATITUD,
--                                     longitud,
--                                     LATITUD_CRUDO,
--                                     LONGITUD_CRUDO,
--                                     LATITUD_CORREGIDO || '' as LATITUD_CORREGIDO,
                                    IRUTA
                             from Secciondos t1),
     tablaFinal as (select DIA_OPERACION, ESTADOTRANSACCIONVersion2, SNUMECO, count(1) "Trx"
                    from rechazo_por_autobus t1
                    where t1.ESTADOTRANSACCIONVersion2 in ('Rechazada', 'Confirmada')
                      and REGEXP_REPLACE(SNUMECO, '[ _-]', '') in (
                                                                   'MU031', '10103', 'ST011', 'GC101', 'CS051', 'MU046',
                                                                   'MU076', 'MU084', 'PC202', 'LU019', 'CP015', 'CR007',
                                                                   'MJ003', 'MJ038', 'ST035', 'ST047', 'TU003', 'TU030',
                                                                   'GC005', 'GC020', 'GC033', 'GC059', 'GC071', 'GC078',
                                                                   'GC087', 'CS003', 'CS022', 'CS030', 'CS039', 'CS044',
                                                                   'CS062', 'MM020', 'TB017', 'MU067', 'MU089', 'MU095',
                                                                   'MU108', 'MU112', 'MU122', 'MU152', 'MU198', 'MU208',
                                                                   'MU217', 'MO004', 'PC224', 'MB006', '10201', 'CM028',
                                                                   'CM029', 'MJ011', 'MJ032', 'TU009', 'GC042', 'GC048',
                                                                   'GC052', 'GC079', 'MM002', 'TB002', 'TB028', 'IE029',
                                                                   'MU042', 'MU056', 'MU080', 'MU142', 'MU174', 'PC215',
                                                                   'PC211'
                        )
                    group by DIA_OPERACION, ESTADOTRANSACCIONVersion2, SNUMECO)
select *
from tablaFinal
union
select *
from (select DIA_OPERACION, ESTADOTRANSACCIONVersion2, SNUMECO, "Trx"
      from tablaFinal
      )


order by SNUMECO desc, ESTADOTRANSACCIONVersion2, DIA_OPERACION
;


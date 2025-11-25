SELECT
    /**/
    to_char(DTFECHAOPERACION, 'yyyy-mm-dd HH24:MI:SS') "FECHA VALIDADOR",
    to_char(dtfechacreacion, 'yyyy-mm-dd HH24:MI:SS')  "FECHA RECIBIDO",
    sclaveruta                                         "CLAVE DE RUTA",
    '"' || REPLACE(sruta, '"', '""') || '"'            "RUTA",
    stipotarifa                                        "TIPO TARIFA",
    to_char(inumeromonedero)                           "MONEDERO",
    to_char(inumerotarjeta)                            "NO. TARJETA",
    tipotransaccion                                    "ESTADO OPERACION",
    estadotransaccion                                  "ESTADO TRANSACCION",
    IERROR                                             "CODIGO ERROR",
    dsaldoanterior                                     "SALDO ANTERIOR",
    dmonto                                             "MONTO",
    dsaldo                                             "SALDO DESPUES",
    inumerotransbordo                                  "NUM. TRANSBORDO",
    snumeroserie                                       "NUMERO SERIE",
    snumeroeconomico                                   "AUTOBUS",
    case
        when
            (case
                 when (
                     NOT REGEXP_LIKE(SLONGITUD, '^[-+]?[0-9]+(\.[0-9]+)?$')
                         OR
                     to_number(SLONGITUD) = 0
                         OR SLONGITUD IS NULL) then to_number('-89.62573')
                 else to_number(SLONGITUD) end)
                <= -89 then
            case
                when to_number(slatitud) >= 21 then trunc(to_number(slatitud)) +
                                                    (to_number(slatitud) - trunc(to_number(slatitud))) /
                                                    10
                else
                    case
                        when (
                            NOT REGEXP_LIKE(slatitud, '^[-+]?[0-9]+(\.[0-9]+)?$')
                                OR
                            to_number(slatitud) = 0
                                OR SLATITUD IS NULL) then to_number('+20.98155')
                        else to_number(slatitud) end
                end
        else
            case
                when (NOT REGEXP_LIKE(slatitud, '^[-+]?[0-9]+(\.[0-9]+)?$')
                    OR to_number(slatitud) = 0
                    OR SLATITUD IS NULL) then to_number('+20.98155')
                else to_number(slatitud) end
        end as                                         "LATITUD",

    case
        when (
            NOT REGEXP_LIKE(SLONGITUD, '^[-+]?[0-9]+(\.[0-9]+)?$')
                OR
            to_number(SLONGITUD) = 0
                OR SLONGITUD IS NULL) then '-89.62573'
        else SLONGITUD end                             "LONGITUD"
/*--     case
--         when slatitud = '0' then '+20.98155'
--         when length(slatitud) = 9 and substr(slatitud, 1, 3) = '+21'
--             then substr(slatitud, 1, 4) || '0' || substr(slatitud, 5, 5)
--         when length(slatitud) = 8 and substr(slatitud, 1, 3) = '+21'
--             then substr(slatitud, 1, 4) || '00' || substr(slatitud, 5, 4)
--         when length(slatitud) = 7 and substr(slatitud, 1, 3) = '+21'
--             then substr(slatitud, 1, 4) || '000' || substr(slatitud, 5, 3)
--         when length(slatitud) = 6 and substr(slatitud, 1, 3) = '+21'
--             then substr(slatitud, 1, 4) || '0000' || substr(slatitud, 5, 2)
--         when length(slatitud) = 5 and substr(slatitud, 1, 3) = '+21'
--             then substr(slatitud, 1, 4) || '00000' || substr(slatitud, 5, 1)
--         when length(slatitud) = 8 and substr(slatitud, 1, 2) = '21'
--             then '+' || substr(slatitud, 1, 3) || '0' || substr(slatitud, 4, 5)
--         when length(slatitud) = 7 and substr(slatitud, 1, 2) = '21'
--             then '+' || substr(slatitud, 1, 3) || '00' || substr(slatitud, 4, 4)
--         when length(slatitud) = 6 and substr(slatitud, 1, 2) = '21'
--             then '+' || substr(slatitud, 1, 3) || '000' || substr(slatitud, 4, 3)
--         when length(slatitud) = 5 and substr(slatitud, 1, 2) = '21'
--             then '+' || substr(slatitud, 1, 3) || '0000' || substr(slatitud, 4, 2)
--         when length(slatitud) = 4 and substr(slatitud, 1, 2) = '21'
--             then '+' || substr(slatitud, 1, 3) || '00000' || substr(slatitud, 4, 1)
--         when substr(slatitud, 1, 2) = '20' then '+' || slatitud
--         else slatitud end                                                            "LATITUD",
--     case when slongitud = '0' then '-89.62573' else replace(slongitud, '+', '-') end "LONGITUD"
--         ,
--     SLATITUD                         as                                              LATITUD_CRUDO,
--     SLONGITUD                        as                                              LONGITUD_CRUDO,
--     case
--         when to_number(SLONGITUD) <= -89 then
--             case
--                 when to_number(slatitud) >= 21 then trunc(to_number(slatitud)) +
--                                                     (to_number(slatitud) - trunc(to_number(slatitud))) /
--                                                     10
--                 else
--
--                     to_number(slatitud)
--                 end
--         else to_number(slatitud) end as                                              LATITUD_CORREGIDO*/

FROM SINCRONIZADOR.viewtransacciones vt
where DTFECHACREACION >= TRUNC((SYSDATE-6/24) - [DESDE_MAS])
  AND DTFECHACREACION < TRUNC((SYSDATE-6/24) - [HASTA])
  and tipotransaccion <> 'MIFARE DESFire'
  and dsaldo >= -12
  and inumeromonedero is not null
order by DTFECHAOPERACION asc
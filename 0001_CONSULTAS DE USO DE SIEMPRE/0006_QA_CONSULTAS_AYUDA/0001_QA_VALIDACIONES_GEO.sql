----------------QR DINAMICO

select 'QR DINAMICO' AS       TIPO,
       DTFECHAOPERACION,
       DTFECHACREACION,
       UIDVALIDADOR,
       IRUTA,
       SLATITUD,
       SLONGITUD
       ,BACTIVO
       ,BBAJA
       ,case
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
           end       as       "LATITUD CORREGIDA",

       case
           when (
               NOT REGEXP_LIKE(SLONGITUD, '^[-+]?[0-9]+(\.[0-9]+)?$')
                   OR
               to_number(SLONGITUD) = 0
                   OR SLONGITUD IS NULL) then '-89.62573'
           else SLONGITUD end "LONGITUD CORREGIDA"
from PREP_SINCRONIZADOR.DETALLETRANSACCIONQRDINAMICO
WHERE UIDVALIDADOR = '79db496d-4c87-42a3-8b90-5f2932d5862f'
  AND TRUNC(DTFECHAOPERACION) = TO_DATE('19/11/2025')
ORDER BY DTFECHACREACION DESC
;
-----TARJETA


select 'NFC'   AS             TIPO,
       DTFECHAOPERACION,
       DTFECHACREACION,
       UIDVALIDADOR,
       IRUTA,
       SLATITUD,
       SLONGITUD
       ,BACTIVO
       ,BBAJA
       ,case
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
           end as             "LATITUD CORREGIDA",

       case
           when (
               NOT REGEXP_LIKE(SLONGITUD, '^[-+]?[0-9]+(\.[0-9]+)?$')
                   OR
               to_number(SLONGITUD) = 0
                   OR SLONGITUD IS NULL) then '-89.62573'
           else SLONGITUD end "LONGITUD CORREGIDA"
from PREP_SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE UIDVALIDADOR = '79db496d-4c87-42a3-8b90-5f2932d5862f'
AND TRUNC(DTFECHAOPERACION) = TO_DATE('19/11/2025')
ORDER BY DTFECHACREACION DESC
;



SELECT  t.VERSIONGPS,t.* FROM PREP_SINCRONIZADOR.TRANSACCIONEMV   t   WHERE T.VERSIONGPS='v2' ;
SELECT * FROM PREP_OPENLOOP.TRANSACCIONES t ;

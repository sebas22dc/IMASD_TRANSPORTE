WITH AUTOBUS AS (SELECT AR.UIDAUTOBUS,
                        AR.UIDCHOFER,
                        h.UIDHORARIO,
                        h.SHORARIO,
                        h.SHORAINICIO,
                        h.SHORAFINAL,
                        ROW_NUMBER() OVER (ORDER BY trunc(AR.DTFECHACREACION) DESC) idrow
                 FROM SINCRONIZADOR.AUTOBUSRUTACHOFER AR
                          left JOIN CATALOGOS.HORARIOS h ON h.UIDHORARIO = AR.UIDHORARIO
                 WHERE AR.BACTIVO = 1
                   and h.bactivo = 1)
SELECT 'OPEN LOOP'                                           TIPO_MONEDERO
     , 'EMV'                                                 TIPO_TRANSACCION
     , TO_CHAR(OL.DTFECHAOPERACION, 'DD/MM/YYYY HH24:MM:SS') FECHA_OPERACION
     , NVL(AUT.SNUMECO, '000')                               NUMERO_ECONOMICO
     , VS.SVALIDADOR                                         VALIDADOR
     , R.SCLAVERUTA                                          CLAVE_RUTA
     , R.SRUTA                                               RUTA
     , A.SHORARIO                                            HORARIO
     , case
           when to_number(OL.SLONGITUD) <= -89 then
               case
                   when to_number(OL.slatitud) >= 21 then trunc(to_number(OL.slatitud)) +
                                                          (to_number(OL.slatitud) - trunc(to_number(OL.slatitud))) /
                                                          10
                   else
                       case
                           when (
                               NOT REGEXP_LIKE(OL.slatitud, '^[-+]?[0-9]+(\.[0-9]+)?$')
                                   OR
                               to_number(OL.slatitud) = 0 OR OL.SLATITUD IS NULL) then to_number('+20.98155')
                           else to_number(OL.slatitud) end
                   end
           else
               case
                   when (
                       NOT REGEXP_LIKE(OL.slatitud, '^[-+]?[0-9]+(\.[0-9]+)?$')
                           OR
                       to_number(OL.slatitud) = 0
                           OR OL.SLATITUD IS NULL) then to_number('+20.98155')
                   else to_number(OL.slatitud) end
    end as                                                   "LATITUD"
     , case
           when (
               NOT REGEXP_LIKE(OL.SLONGITUD, '^[-+]?[0-9]+(\.[0-9]+)?$')
                   OR
               to_number(OL.SLONGITUD) = 0
                   OR OL.SLONGITUD IS NULL) then '-89.62573'
           else OL.SLONGITUD end                             "LONGITUD"
/*     , case
           when to_number(OL.slatitud) >= 21 then trunc(to_number(OL.slatitud)) +
                                                  (to_number(OL.slatitud) - trunc(to_number(OL.slatitud))) /
                                                  10
           else to_number(OL.slatitud) end                   LATITUD
     , OC.SLONGITUD                                          LONGITUD*/
     , C.SMONEDA                                             MONEDA
     , 'EMV-BANCARIA'                                        TIPO_TARIFA
     , C.DTARIFAMONTO                                        MONTO
     , OC.SEMVCARDBRAND                                      TIPOTARJETA
     , OC.SEMVCARDBIN                                        FIRST6D
     , OC.SEMVCARDLAST                                       LAST4D
     , case
           when oc.SEMVCARDBRAND = 'amex' then
               RPAD(nvl(oc.SEMVCARDBIN, '000000'), 11, 'X') || nvl(oc.SEMVCARDLAST, '0000')
           else
               RPAD(nvl(oc.SEMVCARDBIN, '000000'), 12, 'X') || nvl(oc.SEMVCARDLAST, '0000')
    end
                                                             NUMCARD
--      , OL.SLATITUD                                                                    LATITUD_CRUDO
--      , OL.SLONGITUD                                                                   LONGITUD_CRUDO
--      , case
--            when to_number(OL.slatitud) >= 21 then trunc(to_number(OL.slatitud)) +
--                                                   (to_number(OL.slatitud) - trunc(to_number(OL.slatitud))) / 10
--            else to_number(OL.slatitud) end AS                                         LATITUD_CORREGIDO
from openloop.transacciones OL
         INNER JOIN SINCRONIZADOR.VSAM V ON V.SCSN = OL.IDVALIDADOR AND V.BACTIVO = 1
         INNER JOIN SINCRONIZADOR.VALIDADORVSAM VV ON VV.UIDVSAM = V.UIDVSAM AND VV.BACTIVO = 1
         INNER JOIN SINCRONIZADOR.VALIDADORES VS ON VS.UIDVALIDADOR = VV.UIDVALIDADOR AND VS.BACTIVO = 1
         INNER JOIN SINCRONIZADOR.AUTOBUSVALIDADOR AV ON AV.UIDVALIDADOR = VS.UIDVALIDADOR AND AV.BACTIVO = 1
         INNER JOIN SINCRONIZADOR.AUTOBUSES AUT ON AUT.UIDAUTOBUS = AV.UIDAUTOBUS AND AUT.BACTIVO = 1
         INNER JOIN OPENLOOP.RUTAS R ON R.SCLAVERUTA = OL.SIDRUTA
         INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
         INNER JOIN AUTOBUS A ON A.UIDAUTOBUS = AUT.UIDAUTOBUS
         LEFT JOIN CATALOGOS.MARCASAUTOBUSES M ON M.UIDMARCAAUTOBUS = AUT.UIDMARCA
         LEFT JOIN CATALOGOS.MODELOSAUTOBUSES M2 ON M2.UIDMODELOAUTOBUS = AUT.UIDMODELO
         LEFT JOIN CATALOGOS.TIPOSAUTOBUSES T ON t.UIDTIPOAUTOBUS = AUT.STIPO
         LEFT JOIN CATALOGOS.CHOFERES CH ON CH.UIDCHOFER = A.UIDCHOFER
         LEFT JOIN SINCRONIZADOR.CONCESIONARIOS C2 ON C2.UIDCONCESIONARIO = AUT.UIDCONCESIONARIO
         LEFT JOIN openloop.CONCILIACIONES OC on OC.STOKENTRANSACTION = OL.STOKENTRANSACTION
WHERE OL.SESTADOOPERACION IN ('PENDIENTE', 'LIQUIDADO')
  AND OL.DTFECHAOPERACION >= TRUNC(SYSDATE - [DESDE_MAS])
  AND OL.DTFECHAOPERACION < TRUNC(SYSDATE - [HASTA])
order by dtfechaoperacion desc
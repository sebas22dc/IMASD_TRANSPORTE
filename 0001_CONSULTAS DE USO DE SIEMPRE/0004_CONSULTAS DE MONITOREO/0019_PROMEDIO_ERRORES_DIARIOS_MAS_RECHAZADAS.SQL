------------------------------


WITH parametros AS (SELECT TO_DATE('01/08/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d1,
                           TO_DATE('01/09/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d2
                    FROM dual),
     errores_por_dia AS (

     SELECT TRUNC(NFC.DTFECHAOPERACION)                                             AS dia,
                             /* 1=Lunes ... 7=Domingo, independiente de NLS */
                                (TRUNC(NFC.DTFECHAOPERACION) - TRUNC(NFC.DTFECHAOPERACION, 'IW')) + 1   AS num_dia_sem,
                                TRIM(TO_CHAR(NFC.DTFECHAOPERACION, 'DAY', 'NLS_DATE_LANGUAGE=SPANISH')) AS dia_semana,
                                CASE
                                    WHEN NFC.IERROR = 0 THEN '0-Confirmada'
                                    WHEN NFC.IERROR = 5 AND TOKENTRANSACCION != '00000000000000000000000000000000'
                                        THEN '5-Confirmada'
                                    WHEN NFC.IERROR = 5 AND TOKENTRANSACCION = '00000000000000000000000000000000'
                                        THEN '5-Error en lectura'
                                    WHEN NFC.IERROR = 1 THEN '1-Tarjeta expirada'
                                    WHEN NFC.IERROR = 2 THEN '2-Sin saldo'
                                    WHEN NFC.IERROR = 3 THEN '3-Deny list'
                                    WHEN NFC.IERROR = 4 THEN '4-Tarjeta no soportada'
                                    WHEN NFC.IERROR = 6 THEN '6-Falta configurar tarifa'
                                    WHEN NFC.IERROR = 7 THEN '7-Error en recarga'
                                    WHEN NFC.IERROR = 100 THEN '100-Tarjeta recargada'
                                    ELSE 'Otro'
                                    END                                                                 AS tipo_error,
                                COUNT(*)                                                                AS total_errores
                         FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC
                                  JOIN SINCRONIZADOR.MONEDERO M
                                       ON M.INUMEROTARJETA = NFC.INUMEROTARJETA AND M.INUMEROTARJETA > 0
                                  LEFT JOIN SINCRONIZADOR.VALIDADORES V ON V.UIDVALIDADOR = NFC.UIDVALIDADOR

                         --                                   LEFT JOIN SINCRONIZADOR.RUTAS R ON R.SCLAVERUTA = NFC.IRUTA
                         --                                   LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR AV
                         --                                             ON AV.UIDVALIDADOR = V.UIDVALIDADOR AND AV.BACTIVO = 1
                         --                                   LEFT JOIN SINCRONIZADOR.AUTOBUSES AU ON AU.UIDAUTOBUS = AV.UIDAUTOBUS
                         WHERE NFC.DTFECHAOPERACION >= (SELECT d1 FROM parametros)
                           AND NFC.DTFECHAOPERACION < (SELECT d2 FROM parametros)
                           AND NFC.IERROR != 0
                           AND NFC.IERROR IN (2, 3, 4, 5, 7)
                         GROUP BY TRUNC(NFC.DTFECHAOPERACION),
                                  (TRUNC(NFC.DTFECHAOPERACION) - TRUNC(NFC.DTFECHAOPERACION, 'IW')) + 1,
                                  TRIM(TO_CHAR(NFC.DTFECHAOPERACION, 'DAY', 'NLS_DATE_LANGUAGE=SPANISH')),
                                  CASE
                                      WHEN NFC.IERROR = 0 THEN '0-Confirmada'
                                      WHEN NFC.IERROR = 5 AND TOKENTRANSACCION != '00000000000000000000000000000000'
                                          THEN '5-Confirmada'
                                      WHEN NFC.IERROR = 5 AND TOKENTRANSACCION = '00000000000000000000000000000000'
                                          THEN '5-Error en lectura'
                                      WHEN NFC.IERROR = 1 THEN '1-Tarjeta expirada'
                                      WHEN NFC.IERROR = 2 THEN '2-Sin saldo'
                                      WHEN NFC.IERROR = 3 THEN '3-Deny list'
                                      WHEN NFC.IERROR = 4 THEN '4-Tarjeta no soportada'
                                      WHEN NFC.IERROR = 6 THEN '6-Falta configurar tarifa'
                                      WHEN NFC.IERROR = 7 THEN '7-Error en recarga'
                                      WHEN NFC.IERROR = 100 THEN '100-Tarjeta recargada'
                                      ELSE 'Otro'
                                      END

                         ),
     stats AS (SELECT num_dia_sem,
                      dia_semana,
                      tipo_error,
                      round(STDDEV_SAMP(total_errores))                             AS desvest_muestral,
                      round(AVG(total_errores)) - round(STDDEV_SAMP(total_errores)) AS riesgo_bajo,
                      round(AVG(total_errores))                                     AS riesgo_medio,
                      round(AVG(total_errores)) + round(STDDEV_SAMP(total_errores)) AS Riesgo_alto
               FROM errores_por_dia
               GROUP BY num_dia_sem, dia_semana, tipo_error)
SELECT *
FROM stats
ORDER BY num_dia_sem, tipo_error;

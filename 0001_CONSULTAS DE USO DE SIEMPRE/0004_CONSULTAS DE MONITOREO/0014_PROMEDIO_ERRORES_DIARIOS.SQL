WITH params AS (SELECT TO_DATE('01/08/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d1,
                       TO_DATE('01/09/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d2
                FROM dual),
     cal AS (SELECT d1 + LEVEL - 1 AS fecha
             FROM params
             CONNECT BY LEVEL <= (d2 - d1) -- genera cada día del rango (excluye d2)
     ),
     dias AS (SELECT fecha,
                  /* Lunes=1 ... Domingo=7, sin depender de NLS */
                     (TRUNC(fecha) - TRUNC(fecha, 'IW')) + 1 AS num_dia
              FROM cal),
     Pivote_Dias_Mes as (SELECT CASE num_dia
                                    WHEN 1 THEN 'LUNES'
                                    WHEN 2 THEN 'MARTES'
                                    WHEN 3 THEN 'MIÉRCOLES'
                                    WHEN 4 THEN 'JUEVES'
                                    WHEN 5 THEN 'VIERNES'
                                    WHEN 6 THEN 'SÁBADO'
                                    WHEN 7 THEN 'DOMINGO'
                                    END  AS dia_semana,
                                COUNT(*) AS total_dias,
                                num_dia
                         FROM dias
                         GROUP BY num_dia),
     Pivote_Error_Dia_Mes
         as (SELECT /*+ FULL(NFC) FULL(M) FULL(R) FULL(V) FULL(AU) FULL(AV) LEADING(NFC M) PARALLEL(NFC 4) */
                 TO_CHAR(NFC.DTFECHAOPERACION, 'DAY', 'NLS_DATE_LANGUAGE=SPANISH') AS DIA
                  , CASE
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
                        ELSE 'Otro' end                                            as tipoERROR
                  , COUNT(*)                                                       AS TOTAL_ERRORES
             FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC
                      INNER JOIN SINCRONIZADOR.MONEDERO M
                                 ON M.INUMEROTARJETA = NFC.INUMEROTARJETA AND M.INUMEROTARJETA > 0
                      LEFT JOIN SINCRONIZADOR.RUTAS R ON R.SCLAVERUTA = NFC.IRUTA
                      LEFT JOIN SINCRONIZADOR.VALIDADORES V ON V.UIDVALIDADOR = NFC.UIDVALIDADOR
                      LEFT JOIN CATALOGOS.AUTOBUSVALIDADOR AV
                                ON AV.UIDVALIDADOR = V.UIDVALIDADOR AND AV.BACTIVO = 1
                      LEFT JOIN SINCRONIZADOR.AUTOBUSES AU ON AU.UIDAUTOBUS = AV.UIDAUTOBUS
             WHERE 1 = 1
               and NFC.DTFECHAOPERACION >= TO_DATE('01/08/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
               and NFC.DTFECHAOPERACION < TO_DATE('01/09/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
               AND NFC.IERROR != 0
               AND NFC.IERROR IN (2, 3, 4, 7, 5)
-- and NFC.IERROR IN (6) -- EN ESTA SECCION SE PUEDE COMENTAR O AGREGAR LOS ERROES A VISUALIZAR
             GROUP BY TO_CHAR(NFC.DTFECHAOPERACION, 'DAY', 'NLS_DATE_LANGUAGE=SPANISH'),
                      --NFC.STIPOTARIFA,
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
                          END)
select t2.num_dia,
       t1.DIA,
       t1.tipoERROR,
--       t1.TOTAL_ERRORES,
       round(t1.TOTAL_ERRORES / t2.total_dias, 0) as promedio_diario
from Pivote_Error_Dia_Mes t1
         join Pivote_Dias_Mes t2 on trim(t1.DIA) = trim(t2.dia_semana)


------------------------------


WITH parametros AS (SELECT TO_DATE('11/08/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d1,
                           TO_DATE('09/09/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') d2
                    FROM dual),


     errores_por_dia AS (SELECT TRUNC(NFC.DTFECHAOPERACION)                                             AS dia,
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
                                      END),
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

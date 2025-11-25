WITH registros_ordenados AS (
    SELECT
        INUMEROTARJETA,
        TRUNC(DTFECHAOPERACION) AS FECHA,
        DTFECHACREACION,
        LOADTRANSCOUNTER,
        DSALDO,
        IERROR,
        ROW_NUMBER() OVER (
            PARTITION BY INUMEROTARJETA, TRUNC(DTFECHAOPERACION)
            ORDER BY DTFECHAOPERACION DESC
        ) AS RN
    FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
)
, ultimos_n_dias as (
SELECT
    INUMEROTARJETA,
    FECHA,
    DTFECHACREACION,
    LOADTRANSCOUNTER,
    DSALDO,
    IERROR,ROW_NUMBER() OVER (
            PARTITION BY INUMEROTARJETA
            ORDER BY FECHA DESC
        ) AS RN2
FROM registros_ordenados
WHERE RN = 1 --and trunc(FECHA) > sysdate -7
--AND IERROR = 2
)
SELECT n.inumerotarjeta
, e.dsaldo saldoMON
,SALDO saldoNFC
,n2.ierror
,NVL(Reincidencias,0)Reincidencias
, max(n.FECHA) fechaoperacion
, loadtranscounter2 ltc_nfc
, LTC_listas
, fecharecarga
,fechalista
,montorecarga
, CASE WHEN XA.STARJETA IS NULL THEN 'Sin agrupador' else 'Con agrupacion' end Agrupado--, r.ID
, 0 as BENVIADA
FROM ultimos_n_dias n
inner join ultimos_n_dias n2 on n2.inumerotarjeta = n.inumerotarjeta and n2.RN2 = 1
inner join monederoconsultas.estadodecuenta e on e.inumtarjeta = n.inumerotarjeta
inner join (select STARJETA,
   MAX(dtfechacreacion) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS fecharecarga
  ,MAX(dtfechamodificacion) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS fechalista
  ,MAX(dsaldoactual) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS montorecarga
  ,MAX(icontadorrecarga) KEEP (DENSE_RANK LAST ORDER BY icontadorrecarga) AS LTC_listas
    FROM SINCRONIZADOR.CAMBIOSMONEDERO WHERE UIDLISTACUENTAS <> '00000000-0000-0000-0000-000000000000'  GROUP BY STARJETA ) CM ON CM.STARJETA = n.inumerotarjeta
LEFT JOIN (SELECT inumerotarjeta, COUNT(0) Reincidencias FROM ultimos_n_dias WHERE IERROR = 2 and FECHA > SYSDATE -10 GROUP BY inumerotarjeta) X ON X.inumerotarjeta = n.inumerotarjeta
INNER JOIN (
select inumerotarjeta,
   MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
  ,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  ,MAX(loadtranscounter)  AS loadtranscounter2
  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  GROUP BY inumerotarjeta
) XX ON XX.inumerotarjeta = N2.inumerotarjeta
LEFT JOIN (SELECT STARJETA FROM SINCRONIZADOR.CAMBIOSMONEDERO WHERE BCABECERAGRUPO >0 GROUP BY STARJETA) XA ON XA.STARJETA = N2.inumerotarjeta
--LEFT JOIN sincronizador.recargas r ON r.spanhash = e.spanhash and  r.icontadorrecarga = LTC_listas
where 1=1
AND n2.ierror = 2 --and (abs(e.dsaldo)-abs(n2.dsaldo))>0
and loadtranscounter2 < LTC_listas
--and e.dsaldo <> SALDO
and e.dsaldo > 0
and e.sestatus = 'ACTIVO'
--and r.ID is not null
and  n.inumerotarjeta like '5%'
and NVL(Reincidencias,0) > 0
and DTFECHAOPERACION > sysdate -10
and fechalista < DTFECHAOPERACION
--and XA.STARJETA is null
GROUP BY n.inumerotarjeta, n2.loadtranscounter,e.dsaldo,n2.dsaldo,n2.ierror,NVL(Reincidencias,0), LTC_listas, fecharecarga,fechalista,montorecarga,
DTFECHAOPERACION,SALDO,loadtranscounter2,CASE WHEN XA.STARJETA IS NULL THEN 'Sin agrupador' else 'Con agrupacion' end
--,r.ID
order by DTFECHAOPERACION desc,reincidencias desc, fechalista asc
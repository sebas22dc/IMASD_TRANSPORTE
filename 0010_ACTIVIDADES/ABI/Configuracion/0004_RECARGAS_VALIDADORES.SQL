

-- CREATE TABLE DE SQL SERVER

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'DBO'
      AND TABLE_NAME = 'RECARGAS_LTCS_PENDIENTES'
)
BEGIN
    CREATE TABLE DBO.RECARGAS_LTCS_PENDIENTES (
          Id INT PRIMARY KEY IDENTITY(1,1)
        , INUMEROTARJETA INT
        , SALDOMON DECIMAL(18, 2)
        , SALDONFC DECIMAL(18, 2)
        , IERROR INT
        , REINCIDENCIAS INT
        , FECHAOPERACION DATETIME
        , LTC_NFC INT 
        , LTC_LISTAS INT
        , FECHARECARGA DATETIME
        , FECHALISTA DATETIME
        , MONTORECARGA DECIMAL(18, 2)
        , AGRUPADO VARCHAR(50)
        , BENVIADA BIT DEFAULT 0
    );
END;
-------------------------------



-- consulta para la deteccion de tarjetas que requeiren reenvio de lista de recargas
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
--FETCH FIRST 10 ROWS ONLY
; 












---------------------------------------
-- consulta merge para reenviar la ultima recarga
MERGE INTO SINCRONIZADOR.CAMBIOSMONEDERO T
USING (
    SELECT 
    RELOADS.UIDCAMBIOSMONEDERO,
    RELOADS.UIDLISTACUENTAS,
    LISTA.IVERSION,    
    NFC.SPANHASH,
    NFC.INUMEROTARJETA,
    nvl(NFC.ICONTADORRECARGAAPLICADA,0) AS LTC_ULTIMO_APLICADO,
    nvl(NFC.ICONTADORRECARGA,0) AS LTC_RECARGA_ACTUAL,
    nvl(RELOADS.ICONTADORRECARGA,0) AS LTC_RECARGA,
    nvl(RELOADS.DSALDOACTUAL,0) AS DMONTO,
    RELOADS.SCRIPTOGRAMARECARGA,
    RELOADS.IDOPERACION,
    RELOADS.DTFECHACREACION,
    TO_CHAR(RELOADS.DTFECHACREACION, 'YYYY-MM-DD HH24:MI:SS') as sFECHACREACION,
    TO_CHAR(FROM_TZ(CAST(RELOADS.DTFECHAMODIFICACION AS TIMESTAMP), 'UTC') AT TIME ZONE 'America/Mexico_City', 'YYYY-MM-DD HH24:MI:SS') as sDTFECHAMODIFICACION,
    TO_CHAR(LISTA.DTFECHACREACION, 'YYYY-MM-DD HH24:MI:SS') AS sFECHACREACIONLISTA,
    RELOADS.BCABECERAGRUPO,
    RELOADS.UIDGRUPORECARGA
    FROM SINCRONIZADOR.MONEDERO  NFC
    INNER JOIN SINCRONIZADOR.CAMBIOSMONEDERO RELOADS ON 
              NFC.INUMEROTARJETA = RELOADS.STARJETA           
              AND nvl(RELOADS.DSALDOACTUAL,0) > 0
    LEFT JOIN SINCRONIZADOR.LISTASCUENTAS LISTA ON LISTA.UIDLISTACUENTAS = RELOADS.UIDLISTACUENTAS
    WHERE  --NFC.BACTIVO = 1 AND NFC.BBAJA =0 AND 
    nvl(NFC.INUMEROTARJETA,0)<>0
    AND NFC.SPANHASH IS NOT NULL  AND NFC.SPANHASH <> '0000000000000000000000000000000000000000000000000000000000000000'
    AND NVL(NFC.ICONTADORRECARGA,0) > 0 AND LENGTH(NFC.SPANHASH) = 64
    AND (RELOADS.UIDGRUPORECARGA = '00000000-0000-0000-0000-000000000000' OR BCABECERAGRUPO = 1 )
    AND (nvl(RELOADS.ICONTADORRECARGA,0) - nvl(NFC.ICONTADORRECARGAAPLICADA,0)) = 1
    AND NFC.INUMEROTARJETA IN (
[TARJETAS_PROCESAR]
    ) 
) D ON (T.UIDCAMBIOSMONEDERO = D.UIDCAMBIOSMONEDERO)
WHEN MATCHED THEN
    UPDATE SET uidlistacuentas = '00000000-0000-0000-0000-000000000000'
    WHERE (D.UIDCAMBIOSMONEDERO = T.UIDCAMBIOSMONEDERO);
COMMIT; 
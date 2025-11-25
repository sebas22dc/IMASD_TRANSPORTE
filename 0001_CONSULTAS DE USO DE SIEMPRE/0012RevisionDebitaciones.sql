


select * from SINCRONIZADOR.AJUSTEDEB where BPROCESADO = 0;
select count(1) from SINCRONIZADOR.AJUSTEDEB where BPROCESADO = 0;




--Evento Monedero.Abono y Monedero.Debito
SELECT
t1.UIDMONEDERO,t1.DSALDO,t1.inummonedero,t2.dsaldo
--'MONEDERO diferencias' AS fuente,
--COUNT(0) AS discrepancias
FROM MONEDEROCONSULTAS.ESTADODECUENTA t1
INNER JOIN APP.ESTADODECUENTA  t2 ON t1.UIDMONEDERO = t2.UIDMONEDERO
WHERE t1.DSALDO <> t2.DSALDO

;
-- CONSULTA PARA VALIDAR DIFERENCIAS DE SALDO (APPMINEDEROCOMMAND)
SELECT
t1.UIDMONEDERO,t1.DSALDO,t1.inummonedero,t2.dsaldo
--count(1)
FROM MONEDEROCONSULTAS.ESTADODECUENTA t1
INNER JOIN APPMONEDEROCOMMAND.ESTADODECUENTA t2 ON t1.UIDMONEDERO = t2.UIDMONEDERO
WHERE t1.BACTIVO = 1 AND t1.BBAJA = 0 AND (t1.DSALDO <> t2.DSALDO)
;

-- CONSULTA PARA VALIDAR DIFERENCIAS DE SALDO (APPMONEDEROQUERY)
SELECT
t1.UIDMONEDERO,t1.DSALDO,t1.inummonedero,t2.dsaldo
--COUNT(0) AS discrepancias
FROM MONEDEROCONSULTAS.ESTADODECUENTA t1
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA t2 ON t1.UIDMONEDERO = t2.UIDMONEDERO
WHERE t1.BACTIVO = 1 AND t1.BBAJA = 0 AND (t1.DSALDO <> t2.DSALDO)
;

----- DIFERENCIAS monederoconsultas.estadodecuenta(origen) vs apptickets.estadodecuenta(replica)
select
t1.UIDMONEDERO,t1.DSALDO,t1.inummonedero,t2.dsaldo
--count(1) as diferencias
from monederoconsultas.estadodecuenta t1
inner join apptickets.estadodecuenta t2 on t1.uidmonedero = t2.uidmonedero
where t1.BACTIVO = 1 AND t1.BBAJA = 0 AND (t1.DSALDO <> t2.DSALDO);

--------------------------- DIFERENCIAS monederoconsultas.estadodecuenta(origen) vs pagos.estadodecuenta
select
t1.UIDMONEDERO,t1.DSALDO,t1.inummonedero,t2.dsaldo
--count(1) as diferencias
from monederoconsultas.estadodecuenta t1
inner join pagos.estadodecuenta t2 on t1.uidmonedero = t2.uidmonedero
where t1.BACTIVO = 1 AND t1.BBAJA = 0 AND (t1.DSALDO <> t2.DSALDO);


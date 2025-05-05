-- 5028
-- 5000 0000 0014 7350
-- nnaaye96@gmail.com
-- 9991180489
-- "dba-Se realiza validacion y se encuentra que el folio numero 6 se encuentra duplicado.
-- razon por la cual al descargar el csv marca como -8, durante esta revision se detecta que puede
-- que este registro duplicado provenga de algun ajuste aplicado por base de datos en fechas anteriores"
-- No coincide el saldo de la tarjeta con la información al descargar el csv,
-- en el sistema muestra $4.00 y en el csv muesra -8
-- Finalizado
--
--
--
--


select IFOLIOMOVIMIENTO, UIDMOVIMIENTOS, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO,
SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION , SEMISOR,
BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE, SRUTA, SAUTOBUS
from monederoconsultas.movimientos where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' order by ifoliomovimiento asc;


select sum(DMONTO)
from monederoconsultas.movimientos where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' order by ifoliomovimiento asc;
select sum(dmonto) as saldoFinal from monederocomandos.movimientosestadosdecuenta where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' and bactivo=1;

delete from monederoconsultas.movimientos where uidmovimientos = '2ac32345-d750-6ce9-e063-0715000afe56';COMMIT;
select count(0) ALERTA
FROM (
select me.uidoperacion, me.dtfechaOperacion,
(select inummonedero from monederocomandos.monedero where uidmonedero = me.uidmonedero) as iNumMonedero, dmonto,
(select snombre from catalogos.tipomovimientos where uidtipomovimiento = me.uidtipomovimiento) as sTipoMovimiento
from monederocomandos.movimientosestadosdecuenta me where me.uidoperacion not in (SELECT uidoperacion FROM monederoconsultas.MOVIMIENTOS))
where
--DTFECHAOPERACION > '17/02/25 14:00:00.000000000' and
DTFECHAOPERACION > sysdate-1
AND DTFECHAOPERACION <= SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(10, 'MINUTE')
AND STIPOMOVIMIENTO = 'Cargo'
---------------------------------



select *
FROM (
select me.uidoperacion, me.dtfechaOperacion,
(select inummonedero from monederocomandos.monedero where uidmonedero = me.uidmonedero) as iNumMonedero, dmonto,
(select snombre from catalogos.tipomovimientos where uidtipomovimiento = me.uidtipomovimiento) as sTipoMovimiento
from monederocomandos.movimientosestadosdecuenta me where me.uidoperacion not in (SELECT uidoperacion FROM monederoconsultas.MOVIMIENTOS))
where
--DTFECHAOPERACION > '17/02/25 14:00:00.000000000' and
DTFECHAOPERACION > sysdate-1
AND DTFECHAOPERACION <= SYSDATE - NUMTODSINTERVAL(6, 'HOUR') - NUMTODSINTERVAL(10, 'MINUTE')
AND STIPOMOVIMIENTO = 'Cargo'
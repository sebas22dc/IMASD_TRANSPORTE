



10953	07/05/2025	5000000000308417	5000000000308417	EsperaRetro	Posible tema LTC	#N/D


define numBusqueda = 5000000000308417;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda and bdebitado = 1 order by dtfechaoperacion desc;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda order by dtfechaoperacion desc;
select * from monederoconsultas.estadodecuenta where inumtarjeta =&numBusqueda;
select icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =&numBusqueda;
select * FROM SINCRONIZADOR.cambiosmonedero where starjeta=&numBusqueda order by icontadorrecarga asc;


-- SIN ERROR


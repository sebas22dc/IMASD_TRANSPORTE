



10839	06/05/2025	5000000000485216	5000000000485216	EsperaRetro	Posible tema LTC	#N/D


define numBusqueda = 5000000000485216;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda and bdebitado = 1 order by dtfechaoperacion desc;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda order by dtfechaoperacion desc;
select * from monederoconsultas.estadodecuenta where inumtarjeta =&numBusqueda;
select icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =&numBusqueda;
select * FROM SINCRONIZADOR.cambiosmonedero where starjeta=&numBusqueda order by icontadorrecarga asc;


-- SIN ERROR

update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = '550ad545-e9f1-441a-9218-d61112e42342'; commit;



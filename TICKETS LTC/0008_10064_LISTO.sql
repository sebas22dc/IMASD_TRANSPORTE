



10064	29/04/2025	5000000000339087	5000000000339087	EsperaRetro	Posible tema LTC	#N/D


define numBusqueda = 5000000000339087;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda order by dtfechaoperacion desc;
select * from monederoconsultas.estadodecuenta where inumtarjeta =&numBusqueda;
select icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =&numBusqueda;
select * FROM SINCRONIZADOR.cambiosmonedero where starjeta=&numBusqueda order by icontadorrecarga asc;


-- SIN ERROR



update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = 'e39768fd-9bb8-4374-8c5b-bf93b839444c'; commit;

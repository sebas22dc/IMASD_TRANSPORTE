



9550	25/04/2025	5000000000896554	5000000000896554	EsperaRetro	Posible tema LTC	#N/D


define numBusqueda = 5000000000896554;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda order by dtfechaoperacion desc;
select * from monederoconsultas.estadodecuenta where inumtarjeta =&numBusqueda;
select icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =&numBusqueda;
select * FROM SINCRONIZADOR.cambiosmonedero where starjeta=&numBusqueda order by icontadorrecarga asc;


-- SIN ERROR



update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = '0d462aca-db41-4510-a97b-dc87cc7a6c1c'; commit;

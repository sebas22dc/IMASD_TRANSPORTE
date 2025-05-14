



11143	08/05/2025	5000000000914146	5000000000914146	EsperaRetro	Posible tema LTC	#N/D


define numBusqueda = 5000000000914146;
select nfc.* FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC nfc where inumerotarjeta =&numBusqueda order by dtfechaoperacion desc;
select * from monederoconsultas.estadodecuenta where inumtarjeta =&numBusqueda;
select icontadorrecarga, icontadorrecargaaplicada FROM SINCRONIZADOR.monedero where inumerotarjeta =&numBusqueda;
select * FROM SINCRONIZADOR.cambiosmonedero where starjeta=&numBusqueda order by icontadorrecarga asc;


update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = 'aec34377-98ed-42d3-bc25-f91e365fe804'; commit;
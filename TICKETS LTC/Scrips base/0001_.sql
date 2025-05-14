--actualizacion
---REENVIAR LISTA A VALIDACION
update SINCRONIZADOR.cambiosmonedero set uidlistacuentas = '00000000-0000-0000-0000-000000000000' where uidcambiosmonedero = 'ef655426-ac14-465b-91d0-37e1d2898a4d'; commit;


update SINCRONIZADOR.monedero set icontadorrecargaaplicada = 29 where inumerotarjeta = 5000000000145684;commit;
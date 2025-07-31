select t2.snombre, t1.* from credencializacion.tarjetas t1
left join credencializacion.ESTATUSTARJETA t2 on t1.UIDESTATUSTARJETA = t2.UIDESTATUSTARJETA
where t1.inumerotarjeta = 5000000000881611;

select t2.snombre, t1.* from credencializacion.tarjetas t1
left join credencializacion.ESTATUSTARJETA t2 on t1.UIDESTATUSTARJETA = t2.UIDESTATUSTARJETA
where t1.inumerotarjeta = 5000000000881612;

select t2.snombre, t1.* from credencializacion.tarjetas t1
left join credencializacion.ESTATUSTARJETA t2 on t1.UIDESTATUSTARJETA = t2.UIDESTATUSTARJETA
where t1.inumerotarjeta = 5000000000912537;





-----AHORA REALIZAR LOS UPDATES
----uidestatustarjeta = 1f752e96-0ecc-4765-b163-259865bfabf0
----uidestatusmonedero = 90d695c7-7769-411f-9d1e-ecca943fddc1


UPDATE credencializacion.tarjetas set UIDESTATUSTARJETA= '1f752e96-0ecc-4765-b163-259865bfabf0' where inumerotarjeta = 5000000000881611;COMMIT;
UPDATE credencializacion.tarjetas set UIDESTATUSTARJETA= '1f752e96-0ecc-4765-b163-259865bfabf0' where inumerotarjeta = 5000000000881612;COMMIT;
UPDATE credencializacion.tarjetas set UIDESTATUSTARJETA= '1f752e96-0ecc-4765-b163-259865bfabf0' where inumerotarjeta = 5000000000912537;COMMIT;




select t2.snombre, t1.* from credencializacion.tarjetas t1
left join credencializacion.ESTATUSTARJETA t2 on t1.UIDESTATUSTARJETA = t2.UIDESTATUSTARJETA
where t1.inumerotarjeta = 5000000000881611;

select t2.snombre, t1.* from credencializacion.tarjetas t1
left join credencializacion.ESTATUSTARJETA t2 on t1.UIDESTATUSTARJETA = t2.UIDESTATUSTARJETA
where t1.inumerotarjeta = 5000000000881612;

select t2.snombre, t1.* from credencializacion.tarjetas t1
left join credencializacion.ESTATUSTARJETA t2 on t1.UIDESTATUSTARJETA = t2.UIDESTATUSTARJETA
where t1.inumerotarjeta = 5000000000912537;
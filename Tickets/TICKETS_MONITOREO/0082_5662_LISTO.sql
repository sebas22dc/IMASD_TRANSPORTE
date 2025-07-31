-- 5662
-- 5000 0000 0014 1026
-- jennifer0hdz@hotmail.com
-- 9995539178
-- "dba- se encuentra que los datos de tarjeta y monedero indicado son correctos por lo que se procedera a realizar
-- una desvinculacion sobre la tarjeta para que el usuario pueda nuevamente vincularla y verla en su aplicacion
--
-- Correccion aplicada, indicar a usuario que vincule nuevamente su tarjeta fisica a su app
-- para que pueda visualizarla"	Ya aparece vinculada la tarjeta pero no aparece en la app del usuario
-- Proceso
--
--
--
--


-- dba- se encuentra que los datos de tarjeta y monedero indicado son correctos.
-- se detecta que falta un registro sobre la tabla APPMONEDEROQUERY.USUARIO
-- , que hace un vinculo entre el usuario y su aplicacion. razon por la que no se ve
-- la tarjeta


INSERT INTO APPMONEDEROQUERY.USUARIO(UIDUSUARIO, SIDAPLICACION, IESTATUSCUENTA)
values('7cac9a02-b027-47c6-bfb7-f1a0bf80b8f5','5d83685cf57ddd02',1);




UPDATE APPMONEDEROQUERY.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROQUERY.TARJETAUSUARIO
WHERE UIDTARJETA IN ('0b1b8f84-6a84-42b3-2a8c-08dc5c3b0a2f');commit;


UPDATE APPMONEDEROCOMMAND.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROCOMMAND.TARJETAUSUARIO
WHERE UIDTARJETA IN ('0b1b8f84-6a84-42b3-2a8c-08dc5c3b0a2f'
);
commit;





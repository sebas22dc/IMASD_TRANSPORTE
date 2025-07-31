-- 15020
-- 5000000000304335
--
-- ethelbracamonte20@gmail.com
--
--
--
-- Se valida desde la consulta de BD y se observa que la tarjeta con número 5000000000304335 esta vinculada a la cuenta eliminada de la usuaria con el correo ethelbracamonte20@gmail.com
-- Lo que pasa es que mi tarjeta la vincule en una cuenta que ya está eliminada tengo otra cuenta quiero ponerla y me sale que no, que, porque ya está vinculada, Entonces Quiero que se desvincule de la cuenta eliminada para poder vincularla en esta nueva, Para ver mis créditos que me quedan
--
-- Número de tarjeta: 5000 0000 0030 4335
-- Número telefónico: 9993278568
-- Nombre: Edhit Ethel Bracamonte Pereyra.
-- Desvincular el número de tarjeta 5000000000304335 de la cuenta con correo ethelbracamonte20@gmail.com
-- Proceso
-- Pedro

UPDATE APPMONEDEROQUERY.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROQUERY.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000304335'
);commit;


UPDATE APPMONEDEROCOMMAND.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROCOMMAND.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT am.UIDTARJETA
FROM APPMONEDEROCOMMAND.TARJETAUSUARIO AM
INNER JOIN APPMONEDEROCOMMAND.ESTADODECUENTA AE ON AE.UIDMONEDERO = AM.UIDMONEDERO
INNER JOIN APPMONEDEROCOMMAND.USUARIO USU ON USU.UIDUSUARIO = AM.UIDUSUARIO
INNER JOIN APP.USUARIO USU2 ON USU2.UIDUSUARIO = usu.UIDUSUARIO
WHERE
-- am.snumerotarjeta = 5000000000593414
1=1
AND AM.BACTIVO = 1
AND am.snumerotarjeta = '5000000000304335' --and am.snumerotarjeta = 5000000000593414
);
commit;
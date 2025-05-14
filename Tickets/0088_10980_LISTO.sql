-- 10980	5000000000302638
-- "Se valida en la consulta de Base de datos y se
-- observa que el numero de tarjeta 5000000000302638 esta vinculada
-- y ACTIVA a la cuenta con correo jugodeuva_samanta@hotmail.com y teléfono 9932077288
-- La tarjeta cuenta con saldo de $42.00
-- Comenta el usuario que no tiene acceso a su correo electrónica jugodeuva_samanta@hotmail.com
-- "	"Usuario pide apoyo en desvincular una tarjeta de su App en donde ya no cuenta con acceso a ese correo.
--
-- Numero de tarjeta: 5000 0000 0030 2638
-- Cuenta con un saldo actual de $28
-- Correo donde se encuentra vinculada la tarjeta: Jugodeuva_samanta@hotmail.com
-- Correo de su nuevo: Samanta.mc.01@hotmail.com
-- Cuando intenta crear una nueva cuenta le aparece “Teléfono no valido, ya esta registrado en otro usuario”
--
-- Samanta Marquez Carbajal
-- Samanta.mc.01@hotmail.com
-- 9932077288"	Desvincular la tarjeta con numero 5000000000302638
--     de la cuenta con correo jugodeuva_samanta@hotmail.com	Proceso	Pedro





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
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000302638'
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
AND am.snumerotarjeta = '5000000000302638' --and am.snumerotarjeta = 5000000000593414
);
commit;
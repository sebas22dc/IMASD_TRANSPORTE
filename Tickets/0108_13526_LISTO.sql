-- 13526
-- 5000000000115456
-- torresloriacarlos@gmail.com
-- Carlosloria12@icloud.com
-- "Desvinculación de tarjeta del correo anterior torresloriacarlos@gmail.com para poder vincularla al correo nuevo Carlosloria12@icloud.com
--
--
-- Se revisar tarjeta asociada a cuenta anterior y se encuentra que cuenta anterior esta parcialmente dada de bajo, accion realizada por el usuario.
-- por lo que se realiza proceso para desvincular tarjeta de una cuenta dada de baja"	"usuario reporta que al intentar agregar su tarjeta de va y ven de la aplicación pero sale el mensaje que me dice que ya está vinculada.
--
-- Número de tarjeta: 5000000000115456
-- Correo: Carlosloria12@icloud.com
-- Número telefónico: 9999947358
-- Nombre: Carlos Alejandro Loria torres"	Desvinculación de tarjeta	Pendiente	Mercy



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
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000115456'
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
AND am.snumerotarjeta = '5000000000115456' --and am.snumerotarjeta = 5000000000593414
);
commit;
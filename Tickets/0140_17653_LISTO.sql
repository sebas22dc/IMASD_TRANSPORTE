-- 17653			
-- "vanepreuel.95@hotmail.com
-- vanepreuel.95@gmail.com"
-- 		9991440868		
        
-- "Se valida la información de las tarjetas virtuales en el apartado Ver Tarjetas/Tarjetas Usuarios. Donde se observa que la cuenta con correo electrónico: vanepreuel.95@hotmail.com tiene la tarjeta virtual  con No. monedero 1000000001531653, tipo tarifa General, sin saldo $0.00 y con estatus ACTIVO. De igual manera, la cuenta con correo electrónico: vanepreuel.95@gmail.com tiene la tarjeta virtual  con No. monedero 1000000001051524, tipo tarifa GEN, sin saldo $0.00 y con estatus ACTIVO.

-- Se consulta en la BD, la cuenta con correo electrónico vanepreuel.95@hotmail.com . Cuenta con la tarjeta: 5000000000959002 y monedero: 1000000000265478 con estatus ACTIVA.

-- Se consulta en la BD, la cuenta con correo electrónico vanepreuel.95@gmail.com . No tiene asociada ninguna tarjeta.
-- "	"Desea eliminar las dos cuentas creadas con sus datos ya que los correos están mal anotados y no tiene acceso a ninguna

-- Cuenta 1: Christina Vanessa Molina Presuel
-- 9991440868
-- MOPC951217MYNLRH08
-- vanepreuel.95@hotmail.com

-- Cuenta 2: Christina Molina Presuel
-- 9991440868
-- MOPC951217MYNLRH08
-- vanepreuel.95@gmail.com"	Realizar la desvinculación de la tarjeta: 5000000000959002 y monedero: 1000000000265478 de la cuenta con correo electrónico vanepreuel.95@hotmail.com 	Proceso	Pedro			Documento










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
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000959002'
)
;commit;


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
AND am.snumerotarjeta = '5000000000959002' --and am.snumerotarjeta = 5000000000593414
);
commit;
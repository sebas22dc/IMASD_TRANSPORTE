-- 8287
-- "Se valida que la cuenta del usuario existe en el sistema con la siguiente información:
-- Nombre: Faustino Enrique Cardeña Noh
-- Teléfono: 9996474102
-- Correo electrónico: faustinocardena099@gmail.com
-- Tarjeta virtual : 1000000001365044
-- Tarjeta física asociada: 5000 0000 0021 0943
-- Tarifa: General
-- "	"Usuario reporta que no puede acceder a su cuenta registrada en su app ya que extravió su celular, y en
--
-- Su nuevo celular desea crear una nueva cuenta, pero al tener su teléfono asociado a esa cuenta solicita
-- Que se elimine:
--
-- Datos de la cuenta que el usuario solicita se elimine:
--
-- Usuario de la cuenta que tiene registrado: Faustino Enrique Cardena Noh
-- Correo registrado: faustinocardena099@gmail.com
-- Teléfono registrado: 9996474102
-- Monedero virtual o tarjeta física registrada en la app: 5000 0000 0021 0943
--
-- Atendió: FJPG
-- Quedamos al pendiente de su pronta respuesta, gracias.
--     "	Se requiere eliminar la cuenta y desvincular la tarjeta fisica asociada (5000 0000 0021 0943)
--     a la cuenta, desde BD.	Proceso
--
--
--




SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';COMMIT;


----DESVINCULAR LAS TARJETAS DE LA SEGUNDA CUENTA, SOLO ESA CUENTA TIENE TARJETAS ASOCIADAS


--Se actualizan registros dados de baja

UPDATE APPMONEDEROQUERY.TARJETAUSUARIO SET BACTIVO = 0, BBAJA = 1
--SELECT COUNT(0) FROM APPMONEDEROQUERY.TARJETAUSUARIO
WHERE UIDTARJETA IN (
SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1 and (usu.BBAJA = 1 OR usu.BACTIVO = 0)
AND t.BACTIVO = 1 AND usu.UIDUSUARIO = '030da66d-cb4c-4d0b-a254-ba56257d109f'
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
AND USU2.BBAJA = 1
AND AM.BACTIVO = 1
AND USU2.UIDUSUARIO = '030da66d-cb4c-4d0b-a254-ba56257d109f' --and am.snumerotarjeta = 5000000000593414
);
commit;



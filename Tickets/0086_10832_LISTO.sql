-- 10832
-- Se valida en el sistema y se observa que el usuario tiene dos cuentas con el
-- mimo numero telefonico, por lo que se solicita la devinculación (eliminación) del correo
-- jeancarlo17@gmail.com	"El usuario solicita que se desvincule de su app el correo
-- jeancarlo17@gmail.com y que solo quede el correo jeancarlo17@hotmail.com, ya que no
-- le llegan los códigos de verificación.
-- Teléfono 9991296103
-- jeancarlo17@hotmail.com
-- Juan Carlos Caamal Acevedo"	"Eliminar cuenta con correo:  jeancarlo17@gmail.com
--




SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';COMMIT;

--SELECTS DE POSTERIOR

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='d4b43a8c-c099-45ad-94da-07abe970ac95';
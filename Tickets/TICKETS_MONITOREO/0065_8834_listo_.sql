-- 8834
-- 5000000000250083
-- dlf63edgar@gmail.com
-- 775 301 8579
-- Eliminar datos del usuario
-- "Para solicitar que sean borrados mis datos ya que me registre con un número de
-- estados unidos pero no puedo continuar para ingresar a mi sesión.
--  Número de tarjeta:5000 0000 0025 0083
-- Correo: dlf63edgar@gmail.com
-- Número telefónico: 775 301 8579
-- Nombre: Diana Ferguson"	Eliminar los datos del usuario		Amely




-------- PRIMER CUENTA A DAR DE BAJA


SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='5b9c0d39-17b6-4b43-bc2c-fc61ff180ff5';COMMIT;







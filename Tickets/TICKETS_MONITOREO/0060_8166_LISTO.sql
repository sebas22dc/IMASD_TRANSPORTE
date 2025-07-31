-- 8166
-- hbacelis40 @gmail.com
-- 9996445200
-- Usuario reporta que su número de teléfono está vinculado
-- a otra cuenta, cuya cuenta pide ser eliminada para usar ese teléfono en una nueva cuenta
-- "Usuario reporta que el numero nuevo con el que intenta registrarse en la app le
-- sale que ya esta registrado  en otra cuenta, por lo que  solicita que se elimine la cuenta
-- que esta asociada a su número.
--
--
--  9996445200
-- 500000000023627
-- Hector bacelis calderon
-- hbacelis40 @gmail.com
--
-- Atendió FJPG
-- Quedamos al pendiente de sus comentarios,
-- saludos."
-- Liberar al usuario de la cuenta que está registrada con el número 9996445200




-------- PRIMER CUENTA A DAR DE BAJA

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='07b0a579-1ea5-47df-96ec-5ffba45cb06d';COMMIT;

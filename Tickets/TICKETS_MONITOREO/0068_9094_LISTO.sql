-- 9094
-- 1000000000993870
-- Juanitto.bazan@icloud.com
-- Juan.bazan04@icloud.com
-- 9871676076
-- Usuario reporta que quiere hacer un cambio de correo electrónido,
-- dado a que ya no tiene acceso al anterior
-- "Usuario informa que quiere cambiar su correo antiguo que es Juanitto.bazan@icloud.com por el
-- nuevo correo  Juan.bazan04@icloud.com  por no tiene acceso a su antiguo correo y no se puede
-- dar de alta en la aplicación.
--  1000000000993870
-- Juan Ramón Bazán Itza
-- Juanitto.bazan@icloud.com
-- 9871676076"	Cambio de correo







SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'Juan.bazan04@icloud.com' WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'Juan.bazan04@icloud.com' WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'Juan.bazan04@icloud.com' WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'Juan.bazan04@icloud.com' WHERE UIDUSUARIO = 'b5e0c9b6-f82a-4bfb-b442-e81a424faf3b';COMMIT;









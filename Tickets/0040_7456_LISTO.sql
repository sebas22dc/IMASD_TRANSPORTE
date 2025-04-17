--
-- 7456
-- santosadda146.@gmail.com
-- martinezadda83@gmail.com
-- Usuario solicita cambio de correo en la plataforma
-- "Usuario solicita se cambie el correo electrónico que tiene registrado en su app ya que no tiene acceso
--
-- a ese correo.
--
-- 5000 0000 0049 2419
--
-- usuario registrado en la app: Adda Mercedes Martínez Santos.
-- correo registrado en la app: santosadda146.@gmail.com
-- correo nuevo que desea registrar en su app: martinezadda83@gmail.com"



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'martinezadda83@gmail.com' WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'martinezadda83@gmail.com' WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'martinezadda83@gmail.com'  WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'martinezadda83@gmail.com'  WHERE UIDUSUARIO = '60febdbf-f6d4-497e-9c74-6ad07183d005';COMMIT;
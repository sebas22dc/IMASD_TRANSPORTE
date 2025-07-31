-- 7974
-- s.zamoranomedina@gmail.com.mx
-- s.zamoranomedina@gmail.com
-- 5528529928
-- Cambiar el correo: s.zamoranomedina@gmail.com.mx por: s.zamoranomedina@gmail.com
--     Actualizar correo a: s.zamoranomedina@gmail.com






SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 's.zamoranomedina@gmail.com' WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 's.zamoranomedina@gmail.com' WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 's.zamoranomedina@gmail.com' WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 's.zamoranomedina@gmail.com' WHERE UIDUSUARIO = 'f9f15f7e-21cf-428c-b95e-ea5d19ccf1ec';COMMIT;




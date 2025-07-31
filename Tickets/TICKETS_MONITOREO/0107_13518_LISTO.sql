-- 13518
-- Priscilachangamboa@gmail.com
-- Arlethy.chan@outlook.com
-- Cambio de correo
-- "Usuario solicita que cambien el correo vinculado en su cuenta.
-- Arlethy Pricila Chan Gamboa
-- Priscilachangamboa@gmail.com
-- 9999072301
-- Correo para vincular Arlethy.chan@outlook.com"	Cambio de correo	Pendiente	Mercy



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'Arlethy.chan@outlook.com' WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'Arlethy.chan@outlook.com' WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'Arlethy.chan@outlook.com' WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'Arlethy.chan@outlook.com' WHERE UIDUSUARIO = 'cff29b37-f3f8-43b6-b49a-f8fd78ae9fcb';COMMIT;

-- 15132
--
--
-- charyruiz1975@gmail.com
-- lupitarulo75@gmail.com
-- 9992605616
--
-- Usuario ya no cuenta con el acceso al correo anterior registrado.
-- Solicito el cambio de mi correo electrónico registrado en la aplicación Va-y-Ven, debido a que perdí el acceso al correo y no puedo realizar la recuperación de mi contraseña.
--
-- Correo actual: charyruiz1975@gmail.com
-- Correo nuevo: lupitarulo75@gmail.com
-- CURP: RULG751212MCSZPD01
-- Número telefónico: 9992 605616
-- Cambio de correo electrónico: charyruiz1975@gmail.com por correo nuevo: lupitarulo75@gmail.com
-- Proceso
-- Jessi



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'lupitarulo75@gmail.com' WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'lupitarulo75@gmail.com' WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'lupitarulo75@gmail.com' WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'lupitarulo75@gmail.com' WHERE UIDUSUARIO = 'ccf5a99b-fe44-42a4-b881-7f196a38595d';COMMIT;



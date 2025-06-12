-- 13936
-- lespadas0109@gmail.com
-- jerosauno@hotmail.com
-- 9992211405
-- Usuario solicita cambio  de correo electrónico
-- "Usuario reporta el robo de sus datos en su teléfono, por lo que desea realizar la modificación de su correo dado de alta en la App
-- José Leonel Erosa Espadas
-- 9992211405
-- EOEL720701HYNRSN00
-- correo actual: lespadas0109@gmail.com
-- correo que desea dar de alta: jerosauno@hotmail.com
--     Dar de baja el correo : lespadas0109@gmail.com y dar de alta el correo: jerosauno@hotmail.com	Proceso	Jessi


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'jerosauno@hotmail.com' WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'jerosauno@hotmail.com' WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'jerosauno@hotmail.com' WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'jerosauno@hotmail.com' WHERE UIDUSUARIO = '0a594467-c91e-4bab-a3f6-15fb47a41e24';COMMIT;



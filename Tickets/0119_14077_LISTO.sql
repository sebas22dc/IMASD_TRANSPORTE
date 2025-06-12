-- 14077
-- michelleramosz@outlook.con
-- michelleramosz@outlook.com
-- 9998020791		Usuario coloco incorrecto el correo electrónico por lo que solicita anexar el bueno	"Para solicitar cambiar la corrección de mi correo electrónico es el michelleramosz@outlook.con ya que por error puse mal la terminación por lo que no puedo entrar a mi cuenta.
--
--
--
-- Nombre: Michelle Ramos Zetina
--
-- Número telefónico: 9998020791
--
-- Correo bueno: michelleramosz@outlook.com"	Cambiar correo electrónico anterior: michelleramosz@outlook.con por el correo nuevo: michelleramosz@outlook.com	Proceso	Jessi




SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'michelleramosz@outlook.com' WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'michelleramosz@outlook.com' WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'michelleramosz@outlook.com' WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'michelleramosz@outlook.com' WHERE UIDUSUARIO = '0039e15d-8947-4626-ab08-203e99023095';COMMIT;
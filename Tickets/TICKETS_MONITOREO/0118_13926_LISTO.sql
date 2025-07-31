-- 13926
-- gutierrezloriamonica@gmail.comm
-- gutierrezloriamonica@gmail.com
-- Cambio de correo electrónico
-- "Pide la corrección de su correo electrónico que está mal colocado ya que esto le impide abrir nuevamente su app
--
-- Correo del registro: gutierrezloriamonica@gmail.comm
--
--  Monica Natalia Gutierrez loria
--
-- Cel 999 370 5254
--
-- gutierrezloriamonica@gmail.com"	Cambio de correo electrónico	Proceso	Mercy


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'gutierrezloriamonica@gmail.com' WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'gutierrezloriamonica@gmail.com' WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'gutierrezloriamonica@gmail.com' WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'gutierrezloriamonica@gmail.com' WHERE UIDUSUARIO = 'd886eaa9-19cb-4392-b8fe-128f10f8cf32';COMMIT;




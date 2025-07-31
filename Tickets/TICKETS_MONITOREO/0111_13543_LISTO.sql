-- 13543
-- Nefertiiiti@gmail.comS
-- sweetbetza@hotmail.com
-- Cambio de correo del anterior Nefertiiiti@gmail.comS por el correo nuevo sweetbetza@hotmail.com	"La usuaria solicita que desvinculen el correo Nefertiiiti@gmail.comS de su app , ya que se equivocó al escribirlo , solicita agreguen el correo sweetbetza@hotmail.com que es con el cual se quedara. Ya que no puede ingresar a su app.
-- Teléfono con el que se registró 9992195754
-- Sinue Betzabe Bolio Salazar
-- sweetbetza@hotmail.com"		Proceso	Mercy
--
--



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'sweetbetza@hotmail.com' WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'sweetbetza@hotmail.com' WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'sweetbetza@hotmail.com' WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'sweetbetza@hotmail.com' WHERE UIDUSUARIO = '2dc09373-48f7-4387-ba0e-7c41fe4a09e3';COMMIT;

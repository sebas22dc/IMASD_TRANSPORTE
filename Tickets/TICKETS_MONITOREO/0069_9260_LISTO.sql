-- 9260
-- luzmariacg.de.torres@gmail.comluzmaroa
-- luzmariacg.de.torres@gmail.com
-- El usuario pide que se cambie el correo ya que el que ingresó en la app está mal, se validó
-- que en efecto el correo está mal escrito
-- "Usuario solicita se cambie el correo electrónico que tiene registrado en su app ya que escribió mal su correo
--
-- 5000 0000 0035 9096
--
-- usuario registrado en la app: Luz Maria Cedeño Guerra
-- correo registrado en la app: luzmariacg.de.torres@gmail.comluzmaroa
-- correo nuevo que desea registrar en su app: luzmariacg.de.torres@gmail.com
-- numero de celular: 9993403425
--
-- Atendió FJPG
--
-- Quedamos al pendiente de sus comentarios,
-- Saludos."	cambiar correo anterior al actual		Sharis

--luzmariacg.de.torres@gmail.comluzmaroa
--luzmariacg.de.torres@gmail.com



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'luzmariacg.de.torres@gmail.com' WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'luzmariacg.de.torres@gmail.com' WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'luzmariacg.de.torres@gmail.com' WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'luzmariacg.de.torres@gmail.com' WHERE UIDUSUARIO = '20b30770-d484-451b-bd55-d72f83674a0d';COMMIT;

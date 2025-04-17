-- 7911
-- 9992641937
-- "Usuario: Maria de los angeles Poot Cua
-- Correo registrado: pootcuam@mail.com
-- Correo verdadero a registrar: pootcuam@gmail.com
--     "	Usuario reporta que no puede acceder a su cuenta
--     ya que le muestra que el correo es incorrecto, en el Sistema se puede ver que
--     el correo con el que se registró le falta una letra.  	Actualizar el correo a: pootcuam@gmail.com






SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'pootcuam@gmail.com' WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'pootcuam@gmail.com' WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'pootcuam@gmail.com' WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'pootcuam@gmail.com' WHERE UIDUSUARIO = '5a1fcb0c-00fe-49ea-b31d-416004d80792';COMMIT;







-- 7906
-- lufern_2000@hotmail.coml
-- lufern_2000@hotmail.com	9999031674
-- Se valido en el sistema y se refleja el correo incorrecto: lufern_2000@hotmail.coml
--     "Usuario solicita se cambie el correo registrado que tiene en su app porque lo registro
--     incorrectamente. Correo registrado en app: lufern_2000@hotmail.coml
-- Correo correcto: lufern_2000@hotmail.com
-- Usuario: Luis Fernando Chan Basto
-- 9999031674"
--
-- Actualizar el correo a: lufern_2000@hotmail.com


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'lufern_2000@hotmail.com' WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'lufern_2000@hotmail.com' WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'lufern_2000@hotmail.com' WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'lufern_2000@hotmail.com' WHERE UIDUSUARIO = '8274e0a4-cf3c-4235-86a8-c56ada8784d5';COMMIT;














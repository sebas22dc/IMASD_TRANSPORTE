-- -- -- La usuaria solicita la cancelación  de sus datos de la cuenta ya que
-- -- --     cometió un error al registrarse con el correo cuquismiranda@hoimail.com y
-- -- --     el correo correcto es: cuquismiranda@hotmail.com
-- -- --
-- -- -- --
-- --
-- -- Se valida la cuenta con el teléfono 9811381002 y se observa que el correo es erróneo: cuquismiranda@hoymail.com
-- -- Se inicia proceso de cambio de correo para correccion
-- --
-- -- --
-- cuquismiranda@hoymail.com
--
--
-- 	cuquismiranda@hotmail.com
--     9811381002



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'cuquismiranda@hotmail.com' WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'cuquismiranda@hotmail.com' WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'cuquismiranda@hotmail.com' WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'cuquismiranda@hotmail.com' WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661';COMMIT;


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
-- 11074
-- alex_herrera10@outloik.com
-- alex_herrera10@outlook.com
-- "- Se valida en el sistema que la cuenta con correo alex_herrera10@outloik.com
-- tiene saldo de $84.00 en su monedero virtual.
-- - Se solicita al usuario la confirmación de la eliminación y el ticket se encuentra en la espera de respuesta del cliente.
-- - De igual manera, se le indica otra opción al usuario para corregir el correo electrónico alex_herrera10@outloik.com.
--
--
-- dba- se realiza proceso de correccion de correo"	"Usuario reporta que no reconoce su correo al querer iniciar sesión a su cuenta. Solicita que se dé de baja el correo : alex_herrera10@outloik.com ya que el correcto es: alex_herrera10@outlook.com
--
-- Alejandro Herrera Figueiras
-- alex_herrera10@outlook.com
-- 2299079987"	Corrección del correo: alex_herrera10@outloik.com por el correo nuevo: alex_herrera10@outlook.com	Finalizado	Pedro


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'alex_herrera10@outlook.com' WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'alex_herrera10@outlook.com' WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'alex_herrera10@outlook.com' WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'alex_herrera10@outlook.com' WHERE UIDUSUARIO = '40bfb39a-25d8-4d23-a0af-e3e6b2a24785';COMMIT;
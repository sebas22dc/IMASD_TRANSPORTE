-- 14331
-- 5000000000721794
-- andres870502@gmail.com
-- andrescaamal870502@gmail.com
-- 9991296931
-- Usuario informa que el correo que registro antes no tiene acceso por eso solicita que le registren un correo correcto	"Usuario solicita que se realice la modificación de su correo ya que puso uno erróneo que no tiene acceso.
--
-- Pablo Andrés Caamal Kuk
--
-- Correo bueno: andrescaamal870502@gmail.com
--
-- Correo erróneo: andres870502@gmail.com
--
-- 9991296931
--
-- 5000 0000 0072 1794"	Hacer cambio de correo anterior: andres870502@gmail.com y dejar correo correcto: andrescaamal870502@gmail.com	Pendiente	Jessi


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'andrescaamal870502@gmail.com' WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'andrescaamal870502@gmail.com' WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'andrescaamal870502@gmail.com' WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'andrescaamal870502@gmail.com' WHERE UIDUSUARIO = 'fce3f424-85a1-45ec-b7ca-ab3abdc89305';COMMIT;


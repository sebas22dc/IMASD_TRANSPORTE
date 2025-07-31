-- 14354
-- ejms_jemc@hotmail.comRams
-- ejms_jemc@hotmail.com			"Usuario solicita el cambio de su correo, debido que lo registro mal y no puede acceder a la aplicación.
-- Se valida en el sistema y la información proporcionado en el ticket , es la correcta.
-- Nombre: Elías de Jesús May Sánchez
-- Teléfono: 9991501486
-- Correo erróneo: ejms_jemc@hotmail.comRams "	"Para solicitar el cambio de mi correo electrónico ya que por error puse mal mi correo y no puedo entrar a mi aplicación.
--
-- Correo actual: ejms_jemc@hotmail.comRams
--
-- Correo correcto: ejms_jemc@hotmail.com
--
-- Numero telefónico: 9991501486
--
-- Nombre: Elias de Jesús May Sánchez"	Cambiar el correo ejms_jemc@hotmail.comRams por: ejms_jemc@hotmail.com	Proceso	Pedro




SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'ejms_jemc@hotmail.com' WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'ejms_jemc@hotmail.com' WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'ejms_jemc@hotmail.com' WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'ejms_jemc@hotmail.com' WHERE UIDUSUARIO = '4c5fea95-07f1-429b-b395-3c295ea314f6';COMMIT;

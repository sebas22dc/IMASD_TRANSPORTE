-- 15043
-- arely_villamil31@hotmail.com.mx
-- arely_villamil31@hotmail.com
-- 9993622234
-- "Usuario capturo su correo incorrecto
--
--
-- Se realiza validacion, que el nuevo correo no este en uso,
-- se valida y se realiza proceso de cambio de correo"	"Usuaria solicita que le cambien el correo electrónico, ya que lo capturó mal
--
-- Arely Villamil Cervera
--
-- Correo erróneo: arely_villamil31@hotmail.com.mx
--
-- Correo bueno: arely_villamil31@hotmail.com
--
-- 9993622234"	Cambiar correo: arely_villamil31@hotmail.com.mx por corrreo correcto: arely_villamil31@hotmail.com	Proceso	Jessi



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'arely_villamil31@hotmail.com' WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'arely_villamil31@hotmail.com' WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'arely_villamil31@hotmail.com' WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'arely_villamil31@hotmail.com' WHERE UIDUSUARIO = '0842ad53-2ea7-4f7e-bdd5-e01600e9ec25';COMMIT;

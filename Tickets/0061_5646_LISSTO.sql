-- 5646
-- imeldajim89@gmail.co
-- Imeldajim89@gmail.com
-- Usuario solicita actualización de su correo: imeldajim89@gmail.co.
--     "Usuario solicita cambio de su correo electrónico ya que se equivocó al colocarlo.
-- Correo electrónico registrado: imeldajim89@gmail.co
-- Correo Electrónico correcto: Imeldajim89@gmail.com
-- Nombre: Imelda Jiménez
-- 9994752395"	Actualizar el correo: imeldajim89@gmail.co por el correo: Imeldajim89@gmail.com







SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'Imeldajim89@gmail.com' WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'Imeldajim89@gmail.com' WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'Imeldajim89@gmail.com' WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'Imeldajim89@gmail.com' WHERE UIDUSUARIO = 'd289b5a5-8bd0-473b-a344-d472b17feb25';COMMIT;






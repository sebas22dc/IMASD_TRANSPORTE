-- 16975		
-- 	rigoberto2663@hotmail.comescorpion
-- 		rigoberto2663@hotmail.com	
-- 		9994964289		
-- 		Se verifico datos de ticket de usuario y si coincide con el sistema.
-- 			"Usuario reporta que desea que eliminen su antiguo correo ya que está asociado a su cel y desea crear otra sesión con nuevo correo y mismo # de celular
-- Datos antiguos: rigoberto2663@hotmail.comescorpion Tel: 9994964289
-- Datos nuevos: rigoberto2663@hotmail.com  Tel:9994964289
-- Rigoberto Quintal Vázquez"
-- 	Realizar cambio de correo: rigoberto2663@hotmail.comescorpion al correo nuevo: rigoberto2663@hotmail.com	Proceso	Jessi			
-- 	Documento




SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'rigoberto2663@hotmail.com' WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'rigoberto2663@hotmail.com' WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'rigoberto2663@hotmail.com' WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'rigoberto2663@hotmail.com' WHERE UIDUSUARIO = 'edafc7a6-b46a-4bad-8e3a-334e9e95707d';COMMIT;






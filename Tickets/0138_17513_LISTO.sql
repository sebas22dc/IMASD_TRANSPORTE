-- 17513		
-- 	charlienovelo57@gmail.com	
--     cn9162941@gmail.com			
--     	"Usuario pide cambiar el correo electrónico que está asociado a su cuenta ya que perdió todo acceso a este y no puede recuperar la cuenta

-- Carlos Humberto Novelo Rosado
-- 9996702508
-- NORC570818HYNVSR03
-- carloshnovelo@hotmail.com

-- Correo nuevo: cn9162941@gmail.com"	"Solicitud de cambio de correo electrónico.

-- Correo actual: charlienovelo57@gmail.com

-- Correo nuevo: cn9162941@gmail.com"	Proceso	Pedro			Documento



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'cn9162941@gmail.com' WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'cn9162941@gmail.com' WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'cn9162941@gmail.com' WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'cn9162941@gmail.com' WHERE UIDUSUARIO = '51a84c4f-dc9e-4111-b947-7ebaf89c4ad6';COMMIT;

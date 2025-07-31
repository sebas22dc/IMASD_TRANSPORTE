-- 18560
-- 			usabelmlra4567@gmail.com
--             	isabelmora4567@gmail.com
--                 			"Se observa que la información obtenida en la
--                              plataforma recaudo coincide con la descripción del ticket.

-- Nombre: Paola Navarro Mora
-- Teléfono: 9996123112
-- CURP: S/N
-- Correo actual: usabelmlra4567@gmail.com"	
-- "Usuario desea que cambien su correo anterior por el nuevo ya que ya no tiene acceso al anterior 

-- Paola Isabel Mora Navarro
-- Correo nuevo: isabelmora4567@gmail.com
-- 9996123112
-- Correo anterior: usabelmlra4567@gmail.com "	
-- realizar el cambio de 
-- correo electronico actual: usabelmlra4567@gmail.com por
--  el nuevo correo electrónico: isabelmora4567@gmail.com 	
-- Proceso	Pedro			
-- Documento





SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'isabelmora4567@gmail.com' WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'isabelmora4567@gmail.com' WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'isabelmora4567@gmail.com' WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'isabelmora4567@gmail.com' WHERE UIDUSUARIO = '8c436490-8608-40b2-8fe7-ba8cc1a8440b';COMMIT;




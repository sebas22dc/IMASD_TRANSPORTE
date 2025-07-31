-- 12576
-- pedrozambra@gmsil.com
-- pedrozabmbra@gmail.com			"Se valida en el sistema que el correo electrónico pedrozambra@gmsil.com esta mal registrado.
-- INFORMACIÓN DEL USUARIO:
-- NOMBRE: Pedro Zambra Gomez
-- TELÉFONO: 9999006401
-- CURP: ZAGP490225HYNMMD00
-- CORREO: pedrozambra@gmsil.com
-- FECHA CREACIÓN: 14/01/2025 11:05:05
-- "	"Usuario Pide la corrección de su correo electrónico ya que lo escribió mal
-- Pedro Zambra Gomez
--
-- 9999006401
--
-- ZAGP490225HYNMMD00
--
-- Correo capturado erróneo: pedrozambra@gmsil.com
--
-- Correo correcto: pedrozabmbra@gmail.com"	"Realizar la corrección del correo electrónico pedrozambra@gmsil.com por el correo electrónico pedrozabmbra@gmail.com
-- "		Pedro



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'pedrozabmbra@gmail.com' WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'pedrozabmbra@gmail.com' WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'pedrozabmbra@gmail.com' WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'pedrozabmbra@gmail.com' WHERE UIDUSUARIO = '5c9df8fe-ffb1-4415-91ea-bc4c2e3ac874';COMMIT;


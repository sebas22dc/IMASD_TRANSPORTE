-- 10981
-- edgarnahuatyama@gmail.com	dh.edgarnahuatyama@gmail.com
-- "Se valida en el sistema  que el usuario cuenta con la siguiente información:
-- NOMBRE: Edgar Emmanuel Nahuat Yama
-- TELÉFONO: 9991518952
-- CURP: NAYE980704HYNHMD02
-- CORREO: edgarnahuatyama@gmail.com
-- FECHA CREACIÓN: 09/11/2024 13:26:15
-- "	"Usuario solicita se cambie el correo que tiene registrado en su app ya que perdió el acceso a su antiguo
--
-- Correo.
--
-- Datos de la cuenta:
--
-- Usuario: Edgar Emmanuel Nahuat Yama
-- Teléfono registrado: 9991518952
-- Correo registrado: edgarnahuatyama@gmail.com
--
-- Nuevo correo que se desea registrar: dh.edgarnahuatyama@gmail.com"
--     "Cambiar el correo registrado: edgarnahuatyama@gmail.com por el nuevo
--     correo que se desea registrar: dh.edgarnahuatyama@gmail.com
-- "		Pedro



SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'dh.edgarnahuatyama@gmail.com' WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'dh.edgarnahuatyama@gmail.com' WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'dh.edgarnahuatyama@gmail.com' WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'dh.edgarnahuatyama@gmail.com' WHERE UIDUSUARIO = '220487e2-5432-481c-af80-b04b3796eac0';COMMIT;


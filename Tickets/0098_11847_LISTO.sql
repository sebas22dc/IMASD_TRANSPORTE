-- 11847
-- 5000000000312184
-- carloscauich@gmail.com
-- carloscauich046@gmail.com			Cambiar el correo que tiene registrado carloscauich@gmail.com por el correo carloscauich046@gmail.com	"Pide cambiar su correo que registró en la app por el siguiente: carloscauich046@gmail.com
--
-- Datos registrados actualmente:
--
-- Juan carlos Tzuc Cauich
--
-- 9992154890
--
-- TUCJ831013HYNZCN00
--
-- carloscauich@gmail.com
--
-- 5000 0000 0031 2184"	"Cambio de correo anterior carloscauich@gmail.com
-- por el carloscauich046@gmail.com"	Pendiente	Mercy




SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'carloscauich046@gmail.com' WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'carloscauich046@gmail.com' WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'carloscauich046@gmail.com' WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'carloscauich046@gmail.com' WHERE UIDUSUARIO = '797c27ac-74c2-4e22-aa7e-52850f6a2bcd';COMMIT;



-- 11506
-- are.medina06@hotmai.com
-- are.medina06@hotmail.com
-- 9992009827
-- Se verifico y su correo le hace falta un carácter, por eso el usuario solicita la actualización del correo
--
-- El usuario solicita asistencia para la corrección de su dirección de correo electrónico. La información registrada actualmente es:
--
-- Correo incorrecto: are.medina06@hotmai.com
-- Correo correcto: are.medina06@hotmail.com
--
-- Rita Arely Medina Pech
-- 9992009827
-- are.medina06@hotmail.com
-- "	Actualizar su correo y dejar el correcto:  are.medina06@hotmail.com	Proceso	Jessica
--
--
--


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'are.medina06@hotmail.com' WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'are.medina06@hotmail.com' WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'are.medina06@hotmail.com' WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'are.medina06@hotmail.com' WHERE UIDUSUARIO = '3791295d-0e9c-422f-b721-31f44ab728cf';COMMIT;









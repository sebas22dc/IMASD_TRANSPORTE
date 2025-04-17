-- --
-- --
-- --
-- --
-- -- Usuario desea que se le cambien sus datos registrados en su aplicación
-- -- Datos actuales: Carlos de la cruz Rodríguez con un correo inicial de crodrigueznh2018@gmail.com
-- -- Nuevos datos: crodrigueznh2025@gmail.com con número de teléfono móvil 9994528634
-- -- Carlos Rodriguez
-- -- 9994528634
-- --
-- --
-- -- Se valida y se observa que el correo crodrigueznh2018@gmail.com
-- --     no existe en el sistema. Pero al validar el número de Teléfono 9994528634 se
-- --     visualiza un cuenta con el correo: crodrigueznh2024@gmail.com
-- --
-- -- se verifica información compartida y se procede a realizar el cambio de correo sobre
-- --         la cuenta  con crodrigueznh2024@gmail.com hacia el nuevo correo -> crodrigueznh2025@gmail.com
--
-- 9994528634

SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


UPDATE APP.USUARIO SET SCORREO = 'crodrigueznh2025@gmail.com', SNOMBRE='CARLOS DE LA CRUZ', SAPELLIDOPATERNO='RODRIGUEZ' WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET SCORREO = 'crodrigueznh2025@gmail.com',SNOMBRE='CARLOS DE LA CRUZ', SAPELLIDOPATERNO='RODRIGUEZ'  WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf';COMMIT;
UPDATE NOTIFICACIONES.USUARIO SET SCORREO = 'crodrigueznh2025@gmail.com',SNOMBRE='CARLOS DE LA CRUZ', SAPELLIDOPATERNO='RODRIGUEZ'  WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf';COMMIT;
UPDATE PAGOS.USUARIO SET SCORREO = 'crodrigueznh2025@gmail.com',SNOMBRE='CARLOS DE LA CRUZ', SAPELLIDOPATERNO='RODRIGUEZ'  WHERE UIDUSUARIO = '7c875a7b-03f9-474f-9501-b40b60a01fdf';COMMIT;




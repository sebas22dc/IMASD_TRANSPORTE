-- 9604
-- "Se valida en el sistema y se observa que existe registro con el correo:
-- leticialeon1803@gmail.com y fecha creación: 23/04/2025 17:29:59 .
-- Sin embargo, no hay información del telefono, CURP y Nombre.
--
--
-- dba- se revisa cuenta, se encuentra que esta parcialmente
-- dada de baja por lo que se finaliza proceso para realizar
-- baja completa"	"Usuario solicita que borren su cuenta ya
-- que por error puso mal su correo electrónico y no puede acceder a su cuenta.
-- Correo anterior: leticialeon18@gmail.com
-- Nombre: Leticia Leon bracamonte
-- Correo correcto: Leticialeon1803@gmail.com
-- Número telefónico: 9992387546"
--     Eliminar cuenta del sistema con el correo: leticialeon1803@gmail.com
--     Pedro



SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='d9a71827-86ea-417e-b6e8-7f3586f36929';COMMIT;



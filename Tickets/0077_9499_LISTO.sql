-- 9499
-- "Se valida en el sistema que el usuario tiene dos cuentas, solicita que
-- se elimine la cuenta con correo incorrecto:
-- Nombre: Guillermo Islas Zacatenco
-- Número: 9931330878
-- Correo: vixofeo8@gmail.co
-- Fecha creación: 23/04/2025 11:13:52
-- dba- se revisa la cuenta a dar de baja, y no se encuentra con saldo ni
-- con movimientos por lo que se avanza para
-- realizar el proceso"	"Usuario solicita se elimine una cuenta que tiene
-- registrado con su numero ya que ese correo le falta una
--
-- Letra, y ya registro otra cuenta con el mismo número.
--
-- Cuenta que desea eliminar el usuario con el correo erróneo:
--
-- Usuario: Guillermo Islas Zacatenco
-- Correo: Vixofeo8@gmail.co
--  Teléfono: 9931330878"	Eliminar cuenta del sistema con  el correo: vixofeo8@gmail.co	Proceso	Pedro




SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='e69d2a6d-3d94-467c-b9e8-7d0404fdd164';COMMIT;





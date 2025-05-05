-- 9962
-- "Usuario comenta que eliminen su cuenta ya que no puede acceder
--
-- 	"Usuario solicita eliminación de su cuenta en su app,
-- ya que no puede acceder a su cuenta y prefiere que se elimine.
--
-- Datos registrados en su app:
--
-- Ana Cristina Avilez Caballero
-- Annitacaballero77@gmail.coma
-- 9996375406"	Eliminar cuenta
-- Mercy






SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='363ed952-d0b5-42ef-bdea-6f6bbf0d108e';COMMIT;

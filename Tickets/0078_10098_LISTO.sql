-- 10098
-- 1000000001072426/1000000001340978
-- 9991015356
-- "Usuario solicita que se eliminen las dos cuentas que están registradas en la app con el mismo número de teléfono
--
--
-- dba- se revisan ambas cuentas a dar de baja, ninguna de ellas cuenta con
-- saldo ni movimientos asi como tampoco estan
-- asociadas a tarjetas Fisicas, por lo que se avanza con el proceso de baja."
-- "Solicita que se eliminen las dos cuentas que están registradas en la app con el número de
--
-- Teléfono 9991015356 ya que no puede acceder a su app y no le deja recuperar su contraseña.

--CUENTA 1
-- Usuario: Cynthia Haydee Chim Moo
-- Correos registrados:
-- haydeechim@gmail.com
-- haydee2317@hotmail.com
-- Teléfono: 9991015356"	"Eliminar Dos cuentas con los siguientes datos:

--CUENTA 2
-- Usuario: Cynthia Haydee Chim Moo
-- Correos registrados:
-- haydeechim@gmail.com
-- haydee2317@hotmail.com
-- Teléfono: 9991015356"	Proceso	Jessica




---CUENTA 1 haydeechim@gmail.com
SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='43173dba-f420-48a4-86d7-573c2c5793c3';COMMIT;



--- CUENTA 2 haydee2317@hotmail.com

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='adcc272d-9e1a-4198-91d7-83aa203c103a';COMMIT;






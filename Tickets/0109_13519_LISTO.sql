-- 13519
-- sergioenriquegijoncardenas895@gmail.com
-- Eliminacion de cuenta
-- Usuario pide que le borren la cuenta ya que no recuerda la contraseña y cambio de número celular. Solo quieren que le borren los datos para que él pueda crear otra cuenta ya que su CURP está vinculado y no le permite crear otra.	Eliminacion de cuenta 	Pendiente	Gael



SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';

---UPDATES
UPDATE APP.USUARIO SET BACTIVO=0,BBAJA=1                         WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';COMMIT;
UPDATE APPMONEDEROCOMMAND.USUARIO SET BACTIVO=0,BBAJA=1          WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';COMMIT;
UPDATE APPTICKETS.USUARIO SET BACTIVO=0,BBAJA=1                  WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';COMMIT;
UPDATE PAGOS.USUARIO SET BACTIVO=0,BBAJA=1                       WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';COMMIT;

--SELECTS DE POSTERIOR

SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='c45e76af-e37e-4c0b-8c41-fa9212b248c1';

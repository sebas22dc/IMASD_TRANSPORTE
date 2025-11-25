


--pameatomic@gmail.com -> este se va y se denviculan
--pamdgzh@gmail.com  este se queda

select * from pagos.usuario where scorreo = 'freddy_1198@hotmaail.com';
select * from pagos.usuario where scorreo = 'sebassdc@hotmail.com';    --7779ec68-6600-460f-a9c1-685cd09895f3
select * from app.usuario where stelefono ='9993961202';

SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '16bde67e-b936-4512-8624-308c39bbde52' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '16bde67e-b936-4512-8624-308c39bbde52'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '16bde67e-b936-4512-8624-308c39bbde52' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '16bde67e-b936-4512-8624-308c39bbde52' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES




select * from APPMONEDEROQUERY.TARJETAUSUARIO  where uidusuario ='0cd94427-b28d-4c14-89b7-d70acc8a0448';
select * from APPMONEDEROQUERY.TARJETAUSUARIO  where uidusuario ='0f6747c1-69c1-47a4-8bee-e4fd67ac5415';




SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='72d50875-d708-4785-a0f6-f6c9acbc8cee';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='72d50875-d708-4785-a0f6-f6c9acbc8cee';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='72d50875-d708-4785-a0f6-f6c9acbc8cee';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='72d50875-d708-4785-a0f6-f6c9acbc8cee';


select uidmonedero from app.tarjetas where inumerotarjeta = 5000000000626711;
select * from app.estadodecuenta t1
left join monederocomandos.estatusmonedero t2 on t1.uidestatus = t2.uidestatusmonedero
where t1.uidmonedero = 'f479161b-7fee-4af3-a6e3-2640935e0939';

select * from SINCRONIZADOR.ESTATUSMONEDERO where uidmonedero = 'f479161b-7fee-4af3-a6e3-2640935e0939';

select * from credencializacion.tarjetas where inumerotarjeta = 5000000000626711;


SELECT * FROM  APP.ESTADODECUENTA WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA  WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';
--SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';,
SELECT * FROM PAGOS.ESTADODECUENTA WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';

select * from monederocomandos.monedero where uidmonedero = 'f479161b-7fee-4af3-a6e3-2640935e0939';

select * from credencializacion.tarjetas where inumerotarjeta = 5000000000626711;
--5000000000127502

select * from ESTATUSMONEDERO.ESTATUSMONEDERO;
SELECT * FROM  MONEDEROCONSULTAS.ESTADODECUENTA  WHERE UIDMONEDERO = 'f479161b-7fee-4af3-a6e3-2640935e0939';




SELECT * FROM credencializacion.tarjetas where uidmonedero = '4b6e6f76-c220-407b-82eb-ac2e8277b005';





SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'fc0ae09f-38e0-49f0-8f6b-edc253bc0c3b' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES




select * from app.usuario where scorreo = 'danibojo1@gmail.com';
select * from app.usuario where stelefono = '9996375406';


--psic.ingridbojorquez@gmail.com
select * from app.usuario where uidusuario = '06e4a672-6bc9-4920-a8eb-f7b6b4b0bf85';
SELECT *
FROM APPMONEDEROQUERY.TARJETAUSUARIO where snumerotarjeta = '5000000000577195';

DEFINE mi_variable = (select  UIDUSUARIO from app.usuario where scorreo = 'danibojo1@gmail.com');
print mi_variable;
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO WHERE UIDUSUARIO = '%mi_variable';


SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='06e4a672-6bc9-4920-a8eb-f7b6b4b0bf85';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='06e4a672-6bc9-4920-a8eb-f7b6b4b0bf85';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='06e4a672-6bc9-4920-a8eb-f7b6b4b0bf85';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='06e4a672-6bc9-4920-a8eb-f7b6b4b0bf85';



SELECT t1.*, t2.snombregrupocomercial
FROM comercio.operaciones t1 
join comercio.comercios t2 on t1.uidcomercio = t2.uidcomercio
WHERE t1.dtfechacreacion >= TO_DATE('08/04/25 00:00:00', 'DD/MM/YY HH24:MI:SS')
  AND t1.dtfechacreacion <= TO_DATE('08/04/25 23:59:59', 'DD/MM/YY HH24:MI:SS')
  AND T2.snombregrupocomercial = 'COMISARIAS'
ORDER BY t1.dtfechaoperacion DESC;

select * from comercioconsultas.operaciones order by dtfechaoperacion desc;

SELECT t1.*, t2.snombregrupocomercial
FROM comercioconsultas.operaciones t1 
join comercio.comercios t2 on t1.uidcomercio = t2.uidcomercio
WHERE t1.dtfechaoperacion >= TO_DATE('07/04/25 00:00:00', 'DD/MM/YY HH24:MI:SS')
  AND t1.dtfechaoperacion <= TO_DATE('08/04/25 23:59:59', 'DD/MM/YY HH24:MI:SS')
  AND T2.snombregrupocomercial = 'COMISARIAS'
ORDER BY t1.dtfechaoperacion DESC;



select * from comercio.comercios where snombregrupocomercial like 'COMISARIAS'; 

--COMISARIAS




select * from app.usuario where scorreo = 'ana.avilez@certcaucel.edu.mx';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE scorreo = 'ana.avilez@certcaucel.edu.mx'; --> ESTE SI ES




select * from app.usuario where scorreo = '9902481419';
select * from app.usuario where stelefono = '9992623921';
select * from app.usuario where uidusuario = 'e91de675-c54b-44c3-b429-ca5572eac8f7';

select * from monederocomandos.monedero where inummonedero = '1000000001000538';
select * from estatusmonedero.bitacoraestatus;


select * from estatusmonedero.bitacoraestatus where uidmonedero = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';


SELECT * FROM APP.ESTADODECUENTA   WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA WHERE UIDMONEDERO = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';
SELECT * FROM PAGOS.ESTADODECUENTA  WHERE UIDMONEDERO = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO  WHERE UIDMONEDERO = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';
SELECT * FROM MONEDEROCONSULTAS.ESTADODECUENTA WHERE UIDMONEDERO = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';
SELECT * FROM monederocomandos.monedero  where uidmonedero = '4aaa64fb-0c5f-422b-b6b4-7419994300f5';

-------



select * from app.usuario where stelefono = '9993347971';--0f6747c1-69c1-47a4-8bee-e4fd67ac5415
select * from app.usuario where uidusuario = 'c733e3c9-1701-4b57-b887-39ab98eb9e4e';--
--5000 0000 0028 5286 y 
--5000 0000 0064 6072

select * from appmonederoquery.tarjetausuario where snumerotarjeta = '5000000000203978';
select * from appmonederoquery.tarjetausuario where snumerotarjeta = '5000000000646072';

select * from credencializacion.tarjetas where inumerotarjeta = '5000000000203978';

select * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario = '0cd94427-b28d-4c14-89b7-d70acc8a0448';


--Pendiente meter tarjeta a ignorar listra negra
select * from sincronizador.denegados FETCH FIRST 100 ROWS ONLY;



select * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario = (select uidusuario from app.usuario where scorreo = 'mariabarrancos@gmai.com');
select * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario = (select uidusuario from app.usuario where scorreo = 'mariabalam110@gmail.com');
select * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario = (select uidusuario from app.usuario where scorreo = 'luisabalam110@gmail.com');

select * from app.usuario where scorreo = 'mariabarrancos@gmai.com';
select * from app.usuario where scorreo = 'mariabalam110@gmail.com';
select * from app.usuario where scorreo = 'luisabalam110@gmail.com';



---------




SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1 and (usu.BBAJA = 1 OR usu.BACTIVO = 0)
AND t.BACTIVO = 1 AND usu.UIDUSUARIO = '80fd225a-a4d0-4a29-a91e-d959931e0af6'



SELECT am.UIDTARJETA
FROM APPMONEDEROCOMMAND.TARJETAUSUARIO AM
INNER JOIN APPMONEDEROCOMMAND.ESTADODECUENTA AE ON AE.UIDMONEDERO = AM.UIDMONEDERO
INNER JOIN APPMONEDEROCOMMAND.USUARIO USU ON USU.UIDUSUARIO = AM.UIDUSUARIO
INNER JOIN APP.USUARIO USU2 ON USU2.UIDUSUARIO = usu.UIDUSUARIO
WHERE
-- am.snumerotarjeta = 5000000000593414
1=1
AND USU2.BBAJA = 1
AND AM.BACTIVO = 1
AND USU2.UIDUSUARIO = '80fd225a-a4d0-4a29-a91e-d959931e0af6' --and am.snumerotarjeta = 5000000000593414

;
select * from app.usuario where stelefono = '9994536981';
select * from app.usuario where scorreo = 'abroalgo@gmai.com';


SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '676577ef-4b90-4fe0-a5d8-030e3d9bb888' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '676577ef-4b90-4fe0-a5d8-030e3d9bb888'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '676577ef-4b90-4fe0-a5d8-030e3d9bb888' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '676577ef-4b90-4fe0-a5d8-030e3d9bb888' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES







select INUMMONEDERO,DMONTO, STIPOMOVIMIENTO, SOPERACION, SMOTIVO, DTFECHAOPERACION,
IFOLIOMOVIMIENTO, SEMISOR, BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR 
from monederoconsultas.movimientos where INUMMONEDERO = '1000000001590202';




SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY;

SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario = 'c77e8d17-9e14-4dae-ace3-6add0837c49e';


select * from app.usuario where stelefono = '999';



select * from monederocomandos.monedero where inummonedero = '1000000001000538';

SELECT * FROM  MONEDEROCONSULTAS.ESTADODECUENTA  WHERE INUMTARJETA = '5000000000565252';
SELECT * FROM  MONEDEROCONSULTAS.ESTADODECUENTA  WHERE INUMMONEDERO = '1000000000168863';
SELECT t1.* FROM SINCRONIZADOR.DENEGADOS t1
join MONEDEROCONSULTAS.ESTADODECUENTA t2 on t1.SPANHASH = t2.SPANHASH WHERE t2.INUMTARJETA = '5000000000584066';

select t1.* from estatusmonedero.bitacoraestatus t1 where uidmonedero='476a3f0f-ed15-4a07-950b-6ad81262407c';
select * from APP.ESTADODECUENTA   WHERE inummonedero = '1000000001166756';


SELECT * FROM APP.ESTADODECUENTA   WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM PAGOS.ESTADODECUENTA  WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO  WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM MONEDEROCONSULTAS.ESTADODECUENTA WHERE UIDMONEDERO = '476a3f0f-ed15-4a07-950b-6ad81262407c';
SELECT * FROM monederocomandos.monedero  where uidmonedero = '476a3f0f-ed15-4a07-950b-6ad81262407c';


 

SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'f89eb8e9-0661-4f2e-86d6-3eafa9dd8661' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES

select * from app.usuario where stelefono = '9994528634'; --> tiene 2 tarjetas, este se cambio a edwincanul 4428- 5523






--5000 0000 0069 2803 / 5000 0000 0007 4059
select * from app.usuario where stelefono = '9996003213';
select * from app.usuario where scorreo = 'vanepreuel.95@hotmail.com';
SELECT * FROM monederocomandos.monedero  where inummonedero = '1000000000216652';
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where snumerotarjeta = '5000000000074059';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO  where UIDUSUARIO = '44a56cd7-7f27-4de6-bab1-e54143df89eb';
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where UIDUSUARIO = '44a56cd7-7f27-4de6-bab1-e54143df89eb';
---1000000001198932 MONE VIRTUAL
--5000000000615387  --  1000000000397616 -- TARJETA

----------------------------

SELECT * FROM APP.USUARIO                         WHERE scorreo = 'dennisosorio2010@gmail.com';
SELECT * FROM APP.USUARIO                         WHERE scorreo = 'ismaelmay690@gmail.com';
SELECT * FROM APP.USUARIO                         WHERE stelefono = '9991737213';



SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE Stelefono = '9996003213';
SELECT * FROM APPTICKETS.USUARIO                  WHERE Stelefono = '9996003213';
SELECT * FROM PAGOS.USUARIO                       WHERE Stelefono = '9996003213';

SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = 'f2b8c1de-e3a2-4902-b062-99b2a8c1f15a';

select * from monederoconsultas.estadodecuenta where inummonedero = 1000000000699523;
select * from app.tarjetas where uidtarjeta  ='c2c6c57d-a36e-49f9-cbed-08dc5c92950f';




















select * from app.usuario where scorreo='lisamoralesmelendez25@gmail.com';

select * from sincronizador.cambiosmonedero where starjeta ='5000000000945726' order by icontadorrecarga asc;



SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='f1613494-e6ba-4268-98f0-9b625db71168';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='f1613494-e6ba-4268-98f0-9b625db71168';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='f1613494-e6ba-4268-98f0-9b625db71168';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='f1613494-e6ba-4268-98f0-9b625db71168';












--5000000000614227
5000000000141026
select * from app.tarjetas where inumerotarjeta =5000000000614227;--e92da2cd-28a9-4f46-bb6c-08dc5c92950e
select * from app.tarjetas where inumerotarjeta =5000000000945726;--b57255da-8b3a-4de3-c70c-08dc5d72a8e8

select * from app.tarjetas where inumerotarjeta like '500000000096348%';
select * from credencializacion.tarjetas where inumerotarjeta like '500000000096348%' order by inumerotarjeta;
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where UIDUSUARIO = 'd4f3927f-4b3d-447d-a9d3-719ce6248162';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO  where UIDUSUARIO = 'd4f3927f-4b3d-447d-a9d3-719ce6248162';

select * from app.usuario where scorreo='mariateresareguera@gmail.com';

---800 50 40 400
select * from app.usuario where uidusuario = 'ce7399bf-44ff-4071-bfbd-752123206660';
select * from app.usuario where scorreo = 'alelizpe@aol.com';
select * from app.usuario where scorreo = 'sebassdc@hotmail.com';
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario= 'cf8508a7-1514-4813-a74e-9d1dd0a2e157';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where uidusuario= 'cf8508a7-1514-4813-a74e-9d1dd0a2e157';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where snumerotarjeta='5000000000716734';

select * from credencializacion.tarjetas where inumerotarjeta ='5000000000716734';--409

SELECT * FROM APP.USUARIO WHERE UIDUSUARIO='1c1b0e24-2370-4600-a673-7163410a2e7a';

SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '6c789a4f-fee3-45ea-9f7a-f41df77087eb'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO


select * from app.usuario where stelefono = '9996580445';
select * from app.usuario where scorreo = 'valeriacczarate@gmail.com';


SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='030da66d-cb4c-4d0b-a254-ba56257d109f';


select * from app.usuario where scorreo = 'javi_harry@hotmail.com'; 




select * from credencializacion.usuariostarjetas where sfolioexternotarjeta='5000000000509933';--5000 0000 0052 6597
select * from credencializacion.usuariostarjetas where sfolioexternotarjeta='5000000000526597';--


SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='0d99f4c5-a542-476c-8b35-45d4e7eb8260';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO          WHERE UIDUSUARIO='0d99f4c5-a542-476c-8b35-45d4e7eb8260';
SELECT * FROM APPTICKETS.USUARIO                  WHERE UIDUSUARIO='0d99f4c5-a542-476c-8b35-45d4e7eb8260';
SELECT * FROM PAGOS.USUARIO                       WHERE UIDUSUARIO='0d99f4c5-a542-476c-8b35-45d4e7eb8260';







select t2.* from monederoconsultas.detallemovimientos t1
join monederoconsultas.movimientos t2 on t2.uidmovimientos = t1.uidmovimientos
where t2.ifoliomovimiento= 134614 and t2.inummonedero = 1000000001111632;


select t3.inumeromonedero,t3.inumerotarjeta,t1.* from monederocomandos.movimientosestadosdecuenta t1
join monederoconsultas.movimientos t2 on t2.ifoliomovimiento = t1.ifoliomovimiento
join credencializacion.tarjetas t3 on t1.uidmonedero = t3.uidmonedero
where t2.ifoliomovimiento= 134614;



select * from app.usuario where scorreo = 'chivissr2006@gmail.com'; --1000000000998816
select * from app.estadodecuenta where uidmonedero = 'fdc0fdb5-2b4a-4c41-911b-4b0c433b879e';




select * from app.usuario where scorreo = 'chivissr2006@gmail.com'; --1000000000998816

select * from app.estadodecuenta where uidmonedero = 'fdc0fdb5-2b4a-4c41-911b-4b0c433b879e';



select * from app.usuario where scorreo = 'abieuan1320@gmail.com';
select * from app.estadodecuenta where uidmonedero = 'd79aeb3a-10df-41e0-91d5-fcc2be707a3c';



select t1.scorreo,t1.uidmonedero,t2.uidmonedero as vinculo_Monedero_Virtual from app.usuario t1 
left join
app.estadodecuenta t2 on t1.uidmonedero = t2.uidmonedero
where 1=1
and t2.uidmonedero is null;
and t1.scorreo = 'abieuan1320@gmail.com';

select * from monederocomandos.monedero where inummonedero='1000000000158456';

select IFOLIOMOVIMIENTO,DMONTO, SOBSERVACIONES, 
UIDESTATUS, DTFECHAOPERACION, DTFECHACREACION, DTFECHAMODIFICACION, 
DTFECHABAJA, BACTIVO, BBAJA, UIDUSUARIOCREACION, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, UIDMONEDERO, 
 SEMISOR, BFACTURADO, BRECARGADO, BCANCELADO, UIDTIPOOPERACION 
from monederocomandos.movimientosestadosdecuenta where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee';



select IFOLIOMOVIMIENTO, UIDMOVIMIENTOS, INUMMONEDERO, DMONTO, STIPOMOVIMIENTO, 
SOPERACION, SMOTIVO, DTFECHAOPERACION, BCANCELACION, UIDMOTIVOCANCELACION , SEMISOR, 
BFACTURADO, DSALDOACTUAL, DSALDOANTERIOR, SSERIE, SRUTA, SAUTOBUS 
from monederoconsultas.movimientos where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' order by ifoliomovimiento asc;


select sum(DMONTO) 
from monederoconsultas.movimientos where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' order by ifoliomovimiento asc;
select sum(dmonto) as saldoFinal from monederocomandos.movimientosestadosdecuenta where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' and bactivo=1;

select *
from monederoconsultas.movimientos where uidmonedero='c3fe94ad-2804-480a-9118-e331442a68ee' order by ifoliomovimiento asc;

select * from monederoconsultas.movimientos where uidmovimientos = '2ac32345-d750-6ce9-e063-0715000afe56';
select * from monederoconsultas.detallemovimientos where uidmovimientos = '2ac32345-d750-6ce9-e063-0715000afe56';

select * from monederoconsultas.movimientos where uidmovimientos = '2ac32345-d750-6ce9-e063-0715000afe56';



select * from app.usuario where sApellidoPaterno like '%%' and sApellidoMaterno like '%%' and snombre like '%cupul%';



select * from app.usuario where scorreo = 'marlynjce1@gmail.com'; --1000000000998816
select * from app.estadodecuenta where uidmonedero = '3f1ba38a-d5ea-4de1-835e-3620ef08aa47';










select * from app.usuario where stelefono = '9983311611';
select * from app.usuario where stelefono = '9999913160';
select * from app.usuario where scorreo = 'davidomarfm96@gmail.com';
select * from app.usuario where uidusuario = 'c2008d2c-e1ee-427d-81a4-905d4dcd261f';

SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where snumerotarjeta ='5000000000918233';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where snumerotarjeta ='5000000000918233';


SELECT * FROM APPMONEDEROQUERY.USUARIO where uidusuario= '8be3bda4-3516-4b89-a71a-05c63dbfb38a';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where uidusuario= '0679bb84-15aa-4d37-9455-5c284d4df929';
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'c2008d2c-e1ee-427d-81a4-905d4dcd261f' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
select * from APPMONEDEROCOMMAND.ESTADODECUENTA;
--2f58ba4d-a2ff-418d-a2aa-92ebc9716828

SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario ='c43aba3a-dfa5-4c62-bc26-e4408f4b2eaf';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where uidusuario ='c43aba3a-dfa5-4c62-bc26-e4408f4b2eaf';



select * from credencializacion.tarjetas where inumerotarjeta ='5000000000141026';
select * from credencializacion.tarjetas where inumerotarjeta ='5000000000683988'; 
select * from credencializacion.tarjetas where inumerotarjeta ='5000000000945726';




SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA  WHERE UIDMONEDERO = '9afc2c50-8a86-4979-be43-54684d1ababb';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '5046e62c-8eb9-4ae2-86bf-66f7fb15edc7';
SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = '5046e62c-8eb9-4ae2-86bf-66f7fb15edc7';,
select * from monederoconsultas.estadodecuenta where uidmonedero = '9afc2c50-8a86-4979-be43-54684d1ababb';
select * from monederoconsultas.estadodecuenta where uidmonedero = '5046e62c-8eb9-4ae2-86bf-66f7fb15edc7';


SELECT * FROM APP.USUARIO                         WHERE UIDUSUARIO='3bf519cd-c813-4237-a3ef-29ab52874d5f';







SELECT OWNER, TABLE_NAME, COLUMN_NAME,'select * from '||OWNER||'.'||TABLE_NAME||' where SNUMEROTARJETA = ''5000000000720442'';' as dato
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = UPPER('scorreo');

SELECT OWNER, TABLE_NAME, COLUMN_NAME,'select * from '||OWNER||'.'||TABLE_NAME||' where stelefono = ''5000000000720442'';' as dato
FROM ALL_TAB_COLUMNS
WHERE COLUMN_NAME = UPPER('stelefono');

SELECT t.*
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000141026';


SELECT t.UIDTARJETA
FROM APPMONEDEROQUERY.TARJETAUSUARIO t
INNER JOIN APPMONEDEROQUERY.ESTADODECUENTA e ON t.UIDMONEDERO = e.UIDMONEDERO
INNER JOIN CREDENCIALIZACION.ESTATUSTARJETA et ON et.UIDESTATUSTARJETA = e.UIDESTATUSTARJETA
INNER JOIN APPMONEDEROQUERY.USUARIO u ON t.UIDUSUARIO = u.UIDUSUARIO
INNER JOIN APP.USUARIO usu ON u.UIDUSUARIO = usu.UIDUSUARIO
WHERE 1=1
AND t.BACTIVO = 1 AND t.snumerotarjeta = '5000000000141026';





select * from app.usuario where scorreo= 'casturrcg.1994@gmail.com';
select * from app.usuario where stelefono = '9989007803';
select * from app.usuario where uidusuario = 'd42c62d0-d86d-45ba-a21a-d69d06d5a049';
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where snumerotarjeta ='5000000000960641';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where snumerotarjeta ='5000000000960641';
select * from APPMONEDEROQUERY.ESTADODECUENTA where inumerotarjeta = '5000000000965240';
select * from app.estadodecuenta where uidmonedero = 'bd4f4dc5-4fc6-49ce-a429-91871c1889e6';

select * from APPMONEDEROCOMMAND.TARJETAUSUARIO app where uidusuario = '844c38ea-37f5-4bb8-bd1e-c274123ac487';
select * from APPMONEDEROQUERY.TARJETAUSUARIO app where uidusuario = '844c38ea-37f5-4bb8-bd1e-c274123ac487';


select * from APPMONEDEROCOMMAND.TARJETAUSUARIO ;
select * from APPMONEDEROQUERY.TARJETAUSUARIO ;

------------


select * from app.usuario where stelefono = '9997827667';
select * from app.usuario where stelefono = '9993540787';
--select * from credencializacion.usuariostarjetas where sfolioexternotarjeta = '5000000000965240';
--select * from credencializacion.usuariostarjetas where sfolioexternotarjeta = '5000000000965240';
select * from app.usuario where uidusuario = '83c6f7bc-0ce2-4949-901d-a1f1a1d799da';
select * from pagos.usuario where uidusuario = '83c6f7bc-0ce2-4949-901d-a1f1a1d799da';


------------


select * from ;

DEFINE numeroMoneda = '1000000000607570'
Select (select dsaldo from monederoconsultas.estadodecuenta  where inummonedero = &numeroMoneda) monQ
, (select dsaldo from appmonederoquery.estadodecuenta where inummonedero = &numeroMoneda) appMonc
, (select dsaldo from apptickets.estadodecuenta where inummonedero = &numeroMoneda) APP
,(select dsaldo from pagos.estadodecuenta where inummonedero = &numeroMoneda) pagos
From dual;



select * from app.estadodecuenta where inummonedero = 1000000000075288 ;
select * from credencializacion.tarjetas;


select * from sincronizador.tarifas;

select * from appmonederocommand.estadodecuenta;
select * from appmonederoquery.estadodecuenta;

select * from pagosconsultas.estadodecuenta;

------------------SEEBAS
select * from app.usuario where stelefono = '9999039303';
select * from app.usuario where stelefono = '9994573709';
    select * from credencializacion.tarjetas where iNumeroTarjeta = '5000000000170832';
select * from credencializacion.usuariostarjetas where sfolioexternotarjeta = '5000000000170832';
select * from app.usuario where scorreo = 'emanuelxool35@gmail.com';
select * from app.usuario where scorreo = 'arenhui_shover@hotmail.com' and BACTIVO = 1;
select * from app.usuario where UIDUSUARIO = '83c6f7bc-0ce2-4949-901d-a1f1a1d799da';
------------------

SELECT * FROM  APP.ESTADODECUENTA WHERE UIDMONEDERO = 'f4ec508b-dac0-4af2-87ff-da2988cfd825';
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA  WHERE UIDMONEDERO = '8be3bda4-3516-4b89-a71a-05c63dbfb38a';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '382037f6-689c-4e3e-a225-426c06f30b17';
SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = '382037f6-689c-4e3e-a225-426c06f30b17';
SELECT * FROM PAGOS.ESTADODECUENTA WHERE UIDMONEDERO = '382037f6-689c-4e3e-a225-426c06f30b17';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO WHERE UIDMONEDERO = '382037f6-689c-4e3e-a225-426c06f30b17';

---
SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = '323512a4-d718-4461-a4ed-264320f8dbe5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '323512a4-d718-4461-a4ed-264320f8dbe5'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '323512a4-d718-4461-a4ed-264320f8dbe5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '323512a4-d718-4461-a4ed-264320f8dbe5' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES


---

select * from app.ESTADODECUENTA where inummonedero = 5000000000127502;

-----------------
select UIDMONEDERO from app.usuario where stelefono = '9841990816';
select UIDMONEDERO from SINCRONIZADOR.MONEDERO where UIDMONEDERO = '57324b24-fe0c-47e3-84c2-b54aa973b63d';
select * from app.usuario where stelefono = '9996051434';
select * from app.usuario where scorreo = 'wencaduran@gmai.com';
select * from app.usuario where scorreo = 'wencaduran05@gmail.com';
select UIDMONEDERO from pagos.USUARIO where STELEFONO = '9841990816';
select * from app.usuario where UIDUSUARIO = 'c0afe42b-e475-4d02-9b28-d387e104db4c';
select * from app.usuario where uidusuario = 'd208efff-e2d1-4c1b-b4dd-28a3cb4447df';

SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'cc76d685-47f2-4d38-8bc3-0750307664b9' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '83c6f7bc-0ce2-4949-901d-a1f1a1d799da'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = '83c6f7bc-0ce2-4949-901d-a1f1a1d799da' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = 'cc76d685-47f2-4d38-8bc3-0750307664b9' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES

----
--5000000000336969
--5000000000192469
--5000000000115364

-----------------ZONA DE AYUDAS
    select * from app.usuario where scorreo = 'lilianadavo19@gmail.com';
select * from app.usuario where scorreo = 'lilianadavoperez408@gmail.com';
select * from pagos.usuario where uidusuario = '';
select * from pagos.usuario where scorreo = 'test@gmail.com';
select * from app.usuario where uidusuario = '71374d2d-9b41-403a-8f97-705b35b5abef';
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where snumerotarjeta ='5000000001106463';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where snumerotarjeta ='5000000001106463';
SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where uidusuario ='8be3bda4-3516-4b89-a71a-05c63dbfb38a';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where uidusuario ='f4ec508b-dac0-4af2-87ff-da2988cfd825';
select * from APPMONEDEROQUERY.ESTADODECUENTA where inumerotarjeta = '5000000000642488';
select * from credencializacion.tarjetas where INUMEROMONEDERO = '5000000000642488';
select * from monederoconsultas.estadodecuenta where uidmonedero = '0c3456cb-42ad-42d4-8ab7-dadf62c1a649';
SELECT * FROM NOTIFICACIONES.USUARIO WHERE UIDUSUARIO = 'd42c62d0-d86d-45ba-a21a-d69d06d5a049' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM APP.USUARIO  WHERE UIDUSUARIO = '07adc7c8-9175-4208-a5af-606c5fbb65a8'     FETCH FIRST 100 ROWS ONLY;--> ESTE SI ES PARA CAMBIO DE CORREO
SELECT * FROM PAGOS.USUARIO WHERE UIDUSUARIO = 'e680a81a-6ae7-4790-ac33-d42de9b27643' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES
SELECT * FROM APPMONEDEROCOMMAND.USUARIO WHERE UIDUSUARIO = '5536f448-89fa-4eb1-bce9-9778a5dbb4f6' FETCH FIRST 100 ROWS ONLY; --> ESTE SI ES



Define tarjetaUsuario = 5000000000591436
with base as (
select uidusuario from APPMONEDEROCOMMAND.TARJETAUSUARIO  where bactivo = 1 and bbaja = 0 and snumerotarjeta = &tarjetaUsuario)
select SNOMBRE, SAPELLIDOPATERNO, SAPELLIDOMATERNO, STELEFONO, SCORREO, 
 BCUENTAVERIFICADA, DTFECHANACIMIENTO, SCURP,BACTIVO, BBAJA, 
CGENERO, UIDREDSOCIALGOOGLE, SREDSOCIALGOOGLE, UIDREDSOCIALFACEBOOK, SREDSOCIALFACEBOOK, 
UIDREDSOCIALAPPLE, SREDSOCIALAPPLE, SFOTOGRAFIA, BMIGRADO, DTFECHAVENCIMIENTOCONTRASENA, 
DTFECHACREACION, DTFECHAMODIFICACION, DTFECHABAJA, 
UIDMONEDERO,  
UIDUSUARIOCREACION, UIDUSUARIOMODIFICACION, UIDUSUARIOBAJA, SLADA, SIDAPLICACION, IESTATUSCUENTA, SIMAGEPATH from app.usuario where uidusuario = (select uidusuario from base);

select * from pagosconsultas.ordenes where snummonedero = '1000000000564476' order by dtfecha desc;


define numMonederoBusqueda = (select uidmonedero from monederoconsultas.estadodecuenta where inumtarjeta = '5000000000712404');
SELECT * FROM  APP.ESTADODECUENTA WHERE UIDMONEDERO = &numMonederoBusqueda;
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA  WHERE UIDMONEDERO = &numMonederoBusqueda;
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = &numMonederoBusqueda;
SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = &numMonederoBusqueda;
SELECT * FROM PAGOS.ESTADODECUENTA WHERE UIDMONEDERO = &numMonederoBusqueda;
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO WHERE UIDMONEDERO = &numMonederoBusqueda;
select * from SINCRONIZADOR.DENEGADOS where SPANHASH = (SELECT SPANHASH FROM  APP.ESTADODECUENTA WHERE UIDMONEDERO = &numMonederoBusqueda);


--------------------------------------------ANALISIS DE INFORMACION


SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 GROUP BY INUMEROTARJETA,IERROR
ORDER BY COUNT(0) DESC;

with BaseRechazados as (
SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 GROUP BY INUMEROTARJETA,IERROR
ORDER BY COUNT(0) DESC
),
baseReincidentes as (
select t1.INUMEROTARJETA from  BaseRechazados t1
join SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC   t2 on t1.INUMEROTARJETA =  t2.INUMEROTARJETA
where t2.sincidencia like 'DEB. PEND.%'
group by t1.INUMEROTARJETA)

select * from (
select t1.INUMEROTARJETA,t1.DTFECHAOPERACION,
T1.DSALDO SALDOT,
T2.DSALDO SALDOM,
ROW_NUMBER() OVER (PARTITION BY t1.INUMEROTARJETA ORDER BY t1.DTFECHAOPERACION DESC)  RN
from baseReincidentes t3
        join SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1 on t3.INUMEROTARJETA = t1.INUMEROTARJETA
        JOIN MONEDEROCONSULTAS.ESTADODECUENTA t2 ON t1.INUMEROTARJETA = t2.INUMTARJETA
        order by t1.DTFECHAOPERACION
        )
        where RN=1 and SALDOT > SALDOM;


SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 GROUP BY INUMEROTARJETA,IERROR
ORDER BY COUNT(0) DESC;
--select * FROM monederoconsultas.movimientos where ifoliomovimiento in (247469,247468) ;
----------------------------------------------------------------------------------------------------------
SELECT INUMEROTARJETA,IERROR,COUNT(0) FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
WHERE DTFECHAOPERACION > SYSDATE-3 AND IERROR = 2 
and inumerotarjeta not in (select inumerotarjeta from SINCRONIZADOR.AJUSTEDEB 
where TO_CHAR(TRUNC(NVAFECHAPROCESAR), 'dd/MM/yy')='17/05/25' )
GROUP BY INUMEROTARJETA,IERROR 
ORDER BY COUNT(0) DESC;
        
----------------------------------------------------------------------------------------------------------            
        
--        
--        otro punto, podrias sacar lo siguiente:
--tarjeta, dia de semana (1-7 o Lun-Dom) monto total, donde:
--donde se requiere sacar la recuencia de los ultimos N dias de una tarjeta, que solo haya generado error 2 en su ultima debitacion del dia. y cuantas ha acumulado en la semana (errores 2)
DEFINE NumDiasRevisar = 7
WITH base_inicial AS (
    SELECT 
        t1.INUMEROTARJETA AS NumTarjeta,
        (
            SELECT COUNT(1) 
            FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC 
            WHERE NFC.DTFECHAOPERACION >= SYSDATE - &NumDiasRevisar 
              AND NFC.IERROR = 2 
              AND NFC.INUMEROTARJETA = t1.INUMEROTARJETA
        ) AS erroresSemana
    FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC t1
    WHERE t1.DTFECHAOPERACION >= SYSDATE - &NumDiasRevisar
),
ultimaDebitacionNFC AS (
    SELECT * FROM (
        SELECT 
            NFC.INUMEROTARJETA,
            NFC.IERROR,
            ROW_NUMBER() OVER (PARTITION BY NFC.INUMEROTARJETA ORDER BY NFC.DTFECHAOPERACION DESC) AS ID,
            NFC.DSALDO
        FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC NFC
        -- WHERE TO_CHAR(TRUNC(NFC.DTFECHAOPERACION ), 'dd/MM/yy')=TO_CHAR(TRUNC(sysdate), 'dd/MM/yy')
    )
    WHERE ID = 1
),
baseFinal as (
SELECT 
    t1.*,
    TO_CHAR(SYSDATE, 'DAY') AS DiaHoy,
    CASE WHEN t2.IERROR = 2 THEN 'SI' ELSE 'NO' END AS ultima_deb_con_error_2
    --,T2.DSALDO SALDO_NFC
FROM base_inicial t1
LEFT JOIN ultimaDebitacionNFC t2 ON t1.NumTarjeta = t2.INUMEROTARJETA
WHERE t1.erroresSemana > 0
)
select
bf.*
--(SELECT DSALDO FROM monederoconsultas.estadodecuenta where inumtarjeta =BF.NUMTARJETA FETCH FIRST 1 ROWS ONLY) SALDO_APP,
--(select case when icontadorrecarga= icontadorrecargaaplicada then 'SI' else 'NO' end FROM SINCRONIZADOR.monedero where inumerotarjeta =BF.NUMTARJETA FETCH FIRST 1 ROWS ONLY) MISMOS_LTC
from baseFinal bf
--where bf.numTarjeta in (SELECT inumerotarjeta FROM SINCRONIZADOR.AJUSTEDEB WHERE TO_CHAR(TRUNC(FECHAPROCESADO), 'dd/MM/yy') = '06/06/25')
--GROUP BY NUMTARJETA, ERRORESSEMANA, DIAHOY, ULTIMA_DEB_CON_ERROR_2;
;
        
--------------
--sabana de todo monederoconsultas.estadodecuenta
select MOE.INUMMONEDERO,
XW.inumerotarjeta as num_tarjeta,
MOE.SESTATUS,MOE.DSALDO AS SALDO_MONEDERO,
XW.SALDO as SALDO_TARJETA,
MOE.DTFECHAULTIMAOPERACION AS ULT_DEBITACION,
MOE.DTFECHAULTIMOABONO as ULT_ABONO
from monederoconsultas.estadodecuenta MOE 
LEFT JOIN sincronizador.monedero XX on MOE.UIDMONEDERO = XX.UIDMONEDERO
INNER JOIN (
select inumerotarjeta,
   MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
  ,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  ,MAX(IERROR) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS IERROR
  ,MAX(loadtranscounter)  AS loadtranscounter2
  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  GROUP BY inumerotarjeta
) XW ON XW.inumerotarjeta = XX.inumerotarjeta
--
where MOE.sEstatus = 'ACTIVO' AND MOE.dSaldo < -12
and (
MOE.DTFECHAULTIMAOPERACION >= sysdate - 60 or MOE.DTFECHAULTIMOABONO >= sysdate -60  --> validar que el ultimo abono o debitacion sea dentro de los ultimos 60 dias
    );
    
    
 
    

select SUM(DSALDO) AS TOTAL
from monederoconsultas.estadodecuenta where 
sEstatus = 'ACTIVO' AND dSaldo < -12
and (
DTFECHAULTIMAOPERACION >= sysdate - 60 or DTFECHAULTIMOABONO >= sysdate -60 
    );


select * from pagos.logwebpagos;    

select count(*)
from monederoconsultas.estadodecuenta MOE 
LEFT JOIN sincronizador.monedero XX on MOE.UIDMONEDERO = XX.UIDMONEDERO
INNER JOIN (
select inumerotarjeta,
   MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
  ,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
  ,MAX(IERROR) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS IERROR
  ,MAX(loadtranscounter)  AS loadtranscounter2
  FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
  GROUP BY inumerotarjeta
) XW ON XW.inumerotarjeta = XX.inumerotarjeta
--
where MOE.sEstatus = 'ACTIVO' AND MOE.dSaldo < -12
and (
MOE.DTFECHAULTIMAOPERACION >= sysdate - 60 or MOE.DTFECHAULTIMOABONO >= sysdate -60 
    );    
    
    
    SELECT
    'EMV' COMERCIO,
    'CARGO M.F' TIPO_TRANSACCION,
    TO_CHAR(OL.DTFECHACAMBIOESTADO, 'DD/MM/YYYY HH24:MM:SS') FECHA_OPERACION,
    'EMV' TIPO_MONEDERO,
    'Abono' TIPO_MOVIMIENTO,
    'EMV-BANCARIA' TIPO_TARIFA,
    C.DTARIFAMONTO MONTO
FROM openloop.transacciones OL
    INNER JOIN OPENLOOP.CARGOS C ON OL.UIDTRANSACCION = C.UIDTRANSACCION
WHERE
    OL.DTFECHACREACION>=TO_DATE('28-04-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND OL.DTFECHACAMBIOESTADO>=TO_DATE('07-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND OL.DTFECHACAMBIOESTADO< TO_DATE('08-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND OL.SESTADOOPERACION='LIQUIDADO';
        
        
        
        
        


select * from CATALOGOS.CAJEROS;
        
-----------------------------------------


SELECT * FROM APPMONEDEROQUERY.TARJETAUSUARIO where snumerotarjeta ='5000000000218362';
SELECT * FROM APPMONEDEROCOMMAND.TARJETAUSUARIO where snumerotarjeta ='5000000000218362';

select * from monederoconsultas.estadodecuenta where inummonedero = 1000000001060864;





-------------------------------SECCION DE CONSULTAS DE TIPOS REPORTES
;
select soperacion as "OPERACIÓN", co.inumcomercio "CLIENTE", co.scomercio "COMERCIO" , o.sfolioventa "FOLIO", coop.ifoliocomercio "FOLIOCOMERCIO", trunc(o.dtfechaoperacion) "FECHA",
to_char(o.dtfechaoperacion, 'HH24:MI') "HORA", to_char(o.dtfechaoperacion,'DD/MM/YYYY HH24:MI:SS') FECHAHORA,
    lvd1.smensajesalidaapi "OPERACIÓN GUARDADA SALIDA API",
    lvd1.dtfecha "OPERACIÓN GUARDADA FECHA",
    lvd2.smensajesalidaapi "SALDO PROTEGIDO SALIDA API",
    lvd2.dtfecha "SALDO PROTEGIDO FECHA",
    lvd3.smensajesalidaapi "OPERACIÓN DETALLE GUARDADA SALIDA API",
    lvd3.dtfecha "OPERACIÓN DETALLE GUARDADA FECHA",
    lvd4.smensajesalidaapi "CONFIRMACIÓN DE SALDO PROTEGIDO SALIDA API",
    lvd4.dtfecha "CONFIRMACIÓN DE SALDO PROTEGIDO FECHA",
    lvd5.smensajesalidaapi "EXITOSA SALIDA API",
	lvd5.dtfecha "EXITOSA FECHA",
o.sestatustransaccion "ESTATUS", o.dmontoventa "MONTO DE VENTA", o.dmontocobrado "MONTO COBRADO"
,o.stipomovimiento "TIPO", NVL(smotivo,' ') "MOTIVO", o.icantidad "CANTIDAD", o.dsaldoanterior "SALDO ANTERIOR", o.dsaldoactual "SALDO ACTUAL",e.sestatus, co.snombregrupocomercial "GRUPO COMERCIAL"
--,opdet.authcode,opdet.systemtrace,opdet.cardholder,opdet.result,opdet.pan,opdet.serial,tp.sdescripcion
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    --left join comercio.operacionesdet opdet on coop.uidoperacion=opdet.uidoperacion
LEFT JOIN (
select co.scomercio,o.sfolioventa
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
where o.DTFECHAOPERACION >= TO_DATE('13-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('14-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%' and o.sestatustransaccion = 'CANCELADA'
)X ON x.scomercio = co.scomercio and x.sfolioventa = o.sfolioventa
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus='OPERACIÓN GUARDADA'
	left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus='SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus='OPERACIÓN DETALLE GUARDADA'
	left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus='CONFIRMACIÓN DE SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus='EXITOSA'
where o.DTFECHAOPERACION >= TO_DATE('13-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('14-07-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%' and o.sestatustransaccion = 'CONFIRMADA'
and x.sfolioventa is null
order by o.DTFECHAOPERACION desc;










WITH BASE_ABONOS AS (select MOE.INUMMONEDERO,
XW.inumerotarjeta as num_tarjeta,
MOE.SESTATUS,
MOE.DSALDO AS SALDO_MONEDERO,
XW.SALDO as SALDO_TARJETA,
         CASE WHEN SM.ICONTADORRECARGA = SM.ICONTADORRECARGAAPLICADA THEN (MOE.DSALDO * -1) + SALDO
         ELSE ((MOE.DSALDO * -1) + (select SUM(DSALDOACTUAL) FROM SINCRONIZADOR.cambiosmonedero
         where 1=1
         AND ICONTADORRECARGA > SM.ICONTADORRECARGAAPLICADA 
         AND ICONTADORRECARGA <= SM.ICONTADORRECARGA 
         and STARJETA = SM.INUMEROTARJETA )) + SALDO END 
         AS MONTO_ABONO,
MOE.DTFECHAULTIMAOPERACION AS ULT_DEBITACION,
MOE.DTFECHAULTIMOABONO as ULT_ABONO,
case  when XW.SALDO>0 then 'SI' else 'NO' end as CON_SALDO_TARJETA,
--CASE WHEN EXISTS (
--    SELECT 1
--    FROM APPMONEDEROCOMMAND.TARJETAUSUARIO 
--    WHERE bactivo = 1 AND bbaja = 0 and XW.inumerotarjeta = SNUMEROTARJETA
--  ) THEN 'VINCULADO APP' ELSE 'SIN APP' END AS VINCULADO_APP,
CASE WHEN APT.SNUMEROTARJETA is null THEN 'SIN APP' ELSE 'VINCULADO APP' END AS VINCULADO_APP,
CASE 
WHEN abs(MOE.DSALDO) >=0 and abs(MOE.DSALDO) <=100 THEN '0 - 100'
WHEN abs(MOE.DSALDO) >=101 and abs(MOE.DSALDO) <=300 THEN '101 - 300'
WHEN abs(MOE.DSALDO) >=301 and abs(MOE.DSALDO) <=500 THEN '301 - 500'
ELSE '501 O MAS'
END AS RANGO,
SM.ICONTADORRECARGA AS LTC_TOTALES,
SM.ICONTADORRECARGAAPLICADA AS LTC_APLICADO
from monederoconsultas.estadodecuenta MOE
LEFT JOIN sincronizador.monedero XX on MOE.UIDMONEDERO = XX.UIDMONEDERO
INNER JOIN (
select inumerotarjeta,
MAX(DTFECHAOPERACION) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS DTFECHAOPERACION
,MAX(DSALDO) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS SALDO
,MAX(IERROR) KEEP (DENSE_RANK LAST ORDER BY DTFECHAOPERACION) AS IERROR
,MAX(loadtranscounter) AS loadtranscounter2
FROM SINCRONIZADOR.DETALLESINCRONIZACIONTRANSACCIONESNFC
where 1=1
AND SINCIDENCIA not like 'DEB. PEND.%'
AND SINCIDENCIA not like 'SIM. DEB. PEND.%'-->CONDICION PARA EVITAR AGARRAR LOS QUE SEAN REPROCESOS

GROUP BY inumerotarjeta
) XW ON XW.inumerotarjeta = XX.inumerotarjeta
LEFT JOIN APPMONEDEROCOMMAND.TARJETAUSUARIO APT on APT.SNUMEROTARJETA = XW.inumerotarjeta and  APT.bactivo = 1 AND APT.bbaja = 0
JOIN SINCRONIZADOR.MONEDERO SM on XW.iNumeroTarjeta = SM.INUMEROTARJETA
LEFT JOIN monederoconsultas.movimientos MM on MM.UIDMONEDERO = SM.UIDMONEDERO AND sOperacion like 'REVERSA OXXO WAY' 
where 
MOE.sEstatus = 'ACTIVO' 
--AND MOE.dSaldo < -12 
and XW.inumerotarjeta !=0
AND SM.ICONTADORRECARGA = SM.ICONTADORRECARGAAPLICADA
and (MOE.DTFECHAULTIMAOPERACION >= sysdate - 60 or MOE.DTFECHAULTIMOABONO >= sysdate -60 --> validar que el ultimo abono o debitacion sea dentro de los ultimos 60 dias
)
AND (( -1 * MOE.DSALDO) + XW.SALDO) >0
)
SELECT INUMMONEDERO, NUM_TARJETA, SESTATUS, SALDO_MONEDERO, SALDO_TARJETA, MONTO_ABONO, ULT_DEBITACION, ULT_ABONO, CON_SALDO_TARJETA, VINCULADO_APP, RANGO,
CASE 
WHEN MONTO_ABONO >=0 and MONTO_ABONO <=100 THEN '0 - 100'
WHEN MONTO_ABONO >=101 and MONTO_ABONO <=300 THEN '101 - 300'
WHEN MONTO_ABONO >=301 and MONTO_ABONO <=500 THEN '301 - 500'
ELSE '501 O MAS'
END AS RANGO_ABONOS,
LTC_TOTALES,
LTC_APLICADO
FROM BASE_ABONOS
WHERE MONTO_ABONO>=1;


 
--------------------------------------------------------------------------------------------------------



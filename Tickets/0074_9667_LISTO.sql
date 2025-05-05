-- 9667
-- 5000000000158940
-- "Usuario comenta que no puede registrar su tarjeta a la app ya que le
-- aparece el mensaje de que su tarjeta esta bloqueada.
-- Revisando en la plataforma efectivamente la tarjeta esta bloqueada pero
-- el monedeo no, por lo cual se requiere saber quién bloqueo la tarjeta"
-- "Usuario reporta que al registrar su tarjeta física a la app le aparece una leyenda de que su tarjeta esta
-- Bloqueada, en el sistema la tarjeta se encuentra activa.
--
-- 5000 0000 0015 8940
-- Grisel peraza puga
-- flaka_peraza14@hotmail.com
-- 9992285158"	Revisar si esta bloqueada la tarjeta y ver quién lo realizó y si tiene algún motivo
-- Mercy



SELECT * FROM  APP.ESTADODECUENTA WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';
SELECT * FROM APPMONEDEROQUERY.ESTADODECUENTA  WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';
SELECT * FROM APPTICKETS.ESTADODECUENTA  WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';
--SELECT * FROM ESTATUSMONEDERO.BITACORAESTATUS WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';
SELECT * FROM PAGOS.ESTADODECUENTA WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';
SELECT * FROM SINCRONIZADOR.ESTATUSMONEDERO WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';-->su bactivo es 0 y eso esta mal




UPDATE SINCRONIZADOR.ESTATUSMONEDERO SET BACTIVO=1  WHERE UIDMONEDERO = '6da57b9a-7b43-4e7a-9c6c-1fdef535e9db';COMMIT;
-->su bactivo es 0 y pero su estatus es activo y en todos los demas lados es ACTIVO
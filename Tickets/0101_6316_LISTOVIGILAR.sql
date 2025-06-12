-- 6316
-- "5000 0000 0052 6597,
-- 5000 0000 0050 9933"
-- ddzulay@gmail.com
-- 9993562024
-- Se valida que el número de la tarjeta 5000 0000 0052 6597 no tiene los datos correctos del usuario y esta asociada a otra cuenta por lo que se requiere que se le cambien los datos que tiene en la tarjeta 5000 0000 0050 9933
-- "Usuaria reporta que los 16 dígitos de su tarjeta de estudiante no concuerdan, ella cuenta con 2 tarjetas, una física y una virtual la cual no está permitido, sin embargo la que realmente tiene sus datos correctos son los de la tarjeta 5000 0000 0050 9933.
-- Al verificar en el sistema se observa que la tarjeta 5000 0000 0052 6597 cuenta con un nombre diferente al de la usuaria, esto pudo ser un error al registrar su CURP
-- Dayra Alejandra Dzul Ay
-- ddzulay@gmail.com
-- 9993562024"
-- Pendiente

-- OIHJ031224HYNRCSA4	JESUS FRANCISCO	ORTIZ	HUCHIN	MASCULINO
UPDATE credencializacion.usuariostarjetas SET SCURP = 'DUAD031203MYNZYYA0', SNOMBRE='DAYRA ALEJANDRA', SPRIMERAPELLIDO='DZUL', SSEGUNDOAPELLIO='AY', SSEXO='FEMENINO'  WHERE sfolioexternotarjeta = '5000000000526597';


COMMIT;
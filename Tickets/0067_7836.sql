-- 7836
-- El usuario no cuenta con tarjeta virtual,
-- se valida en App/Usuarios/Ver Tarjetas en la plataforma TRANSPORTE.
-- "Usuario informa que el día de hoy abrió su aplicación de va y ven y
-- vio que tarjeta virtual no aparece en su aplicación.
-- Abril Euan
-- 9995489090
-- abieuan1320@gmail.com"
-- Asignarle una tarjeta virtual en la cuenta del usuario con correo electrónico:
--     abieuan1320@gmail.com y número de teléfono: 9995489090.	Pendiente
--
--


select * from app.usuario where scorreo = 'abieuan1320@gmail.com'; --1000000000998816
select * from app.estadodecuenta where uidmonedero = 'fdc0fdb5-2b4a-4c41-911b-4b0c433b879e';

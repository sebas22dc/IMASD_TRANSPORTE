--Evidencia venta de tarjetas
---------------------------------------------------------------------------- 
--Credencializacion.MarcarTarjeta
--SELECT t.INUMEROTARJETA,t.BVENDIDA FROM PREP_CREDENCIALIZACION.TARJETAS t 
--WHERE t.INUMEROTARJETA IN (Numero de tarjetas que envia comercio para su venta); 

--Credencializacion.Tarjetas.Vendida
--TODO AQUI SE APLICA UN MERGE  
SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_app.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1 
    and (t.SPANHASH  != c.spanhash or c.spanhash is null);
--TODO
SELECT count(1) 
FROM credencializacion.tarjetas t 
inner join appmonederoquery.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1 
    and (t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null); 

SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_appmonederocommand.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1  
    and (t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null); 
--TODO
SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_sincronizador.monedero c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1  
    and (t.inumerotarjeta != c.inumerotarjeta or c.inumerotarjeta is null);
--TODO

SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_apptickets.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1
    and (t.inumerotarjeta != c.inumtarjeta or c.inumtarjeta is null); 

SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_pagosconsultas.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1
    and (t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null); 

SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_pagos.tarjetas c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1
    and (t.uidmonedero != c.uidmonedero or c.uidmonedero is null); 

SELECT count(1) FROM PREP_credencializacion.tarjetas t
    inner join PREP_comercio.monederostarjetas c
    on t.uidmonedero = c.uidmonedero
    WHERE t.bvendida = 1 AND t.BACTIVO = 1
    and ( t.BVENDIDA != c.bvendida or c.uidtarjeta is null);

----------------------------------------------------------------------------
-- Estos eventos se envian a la vez
--Credencializacion.Tarjetas.Creada
SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_appmonederoquery.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1 
    and (t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null); 

SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_appmonederocommand.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1  
    and (t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null); 

---TODO
SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_sincronizador.monedero c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1 AND t.BVENDIDA = 1  
    and (t.SPANHASH != c.SPANHASH or c.inumerotarjeta is null);

--TODO
--Monedero.Credencializacion.Asignacion
SELECT count(1) 
FROM PREP_credencializacion.tarjetas t 
inner join PREP_monederoconsultas.estadodecuenta c
    on t.uidmonedero = c.uidmonedero
WHERE t.BACTIVO = 1
    and ( t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null); 
----TODO
SELECT count(1) FROM PREP_credencializacion.tarjetas t
    inner join PREP_comercio.monederostarjetas c
    on t.uidmonedero = c.uidmonedero
    WHERE t.BACTIVO = 1
    and ( t.uidtarjeta != c.uidtarjeta or c.uidtarjeta is null);

--Asignacion de comercio
--Credencializacion.Asigancion.Comercio
SELECT count(1) FROM PREP_credencializacion.tarjetas t
    inner join PREP_comercio.monederostarjetas c
    on t.uidmonedero = c.uidmonedero
    WHERE t.BASOCIADA = 1 AND t.BACTIVO = 1
    and ( t.UIDCOMERCIO  != c.UIDCOMERCIO or c.uidtarjeta is null);

--TODO
--Creación de comercio 
--Si aparece un registro falta en la replica de credencialización
SELECT c.UIDCOMERCIO ,c.SCOMERCIO  FROM PREP_CATALOGOS.COMERCIOS c
    left JOIN PREP_CREDENCIALIZACION.COMERCIOS r
    on c.UIDCOMERCIO = r.UIDCOMERCIO AND c.BBAJA = 0 AND c.BACTIVO = 1
    WHERE r.UIDCOMERCIO IS NULL;


--TODO
--Replica de motivos
--Si aparece un registro falta en la replica de credencialización
SELECT c.UIDCOMERCIO ,c.SCOMERCIO,r.UIDCOMERCIO,r.SCOMERCIO,c.BACTIVO FROM PREP_CATALOGOS.COMERCIOS c
    left join PREP_CREDENCIALIZACION.COMERCIOS r
    on c.UIDCOMERCIO = r.UIDCOMERCIO 
    WHERE r.UIDCOMERCIO IS NULL AND c.BBAJA = 0 AND c.BACTIVO = 1;

--Replica de tarifas
--Si aparece un registro falta en la replica de credencialización
SELECT c.UIDTIPOTARIFA ,c.STIPOTARIFA,r.UIDTIPOTARIFA,r.STIPOTARIFA,c.BACTIVO,c.IMES  FROM PREP_CATALOGOS.TIPOTARIFAS c
    left join PREP_CREDENCIALIZACION.TIPOTARIFA r
    on c.UIDTIPOTARIFA  = r.UIDTIPOTARIFA 
    WHERE r.UIDTIPOTARIFA IS NULL AND c.BBAJA = 0 AND c.BACTIVO = 1
AND (c.SCLAVETIPOTARIFA != r.SCLAVETIPOTARIFA OR c.STIPOTARIFA != r.STIPOTARIFA OR c.IMES != r.IMES OR c.inumerotipotarifa != r.inumerotipotarifa);

--Replica de motivos
--Si aparece un registro falta en la replica de credencialización
SELECT c.UIDMOTIVO ,c.SMOTIVO,r.UIDMOTIVO,r.SMOTIVO,c.BACTIVO,c.BPERMITIREDITAR,c.BPERMITIROPERACIONES FROM PREP_CATALOGOS.MOTIVOS c
    left join PREP_CATALOGOS.MOTIVOS r
    on c.UIDMOTIVO = r.UIDMOTIVO 
    WHERE r.UIDMOTIVO IS NULL AND c.BBAJA = 0 AND c.BACTIVO = 1 AND c.IMODULO IN (200, 500)
AND (c.SMOTIVO != r.SMOTIVO OR c.BPERMITIREDITAR != r.BPERMITIREDITAR OR c.BPERMITIROPERACIONES != r.BPERMITIROPERACIONES);



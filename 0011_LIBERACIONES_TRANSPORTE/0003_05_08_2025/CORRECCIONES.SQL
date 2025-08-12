--primero desasociar los monedero de las tarjetas del primer lote (5000000001105017 and 5000000001110016)  -- idsolicitud 4b77afa6-e598-4ef5-ac95-34d37c3739e3
-- a estas tarjetas hay que quitarles el idmonedero y inumeromonedero
select uidtarjeta,uidmonedero,inumeromonedero,inumerotarjeta,uidestatustarjeta,bvendida,basociada,bactivo,bbaja,uidsolicitud 
from credencializacion.tarjetas t  
where uidsolicitud = '4b77afa6-e598-4ef5-ac95-34d37c3739e3' --t.inumerotarjeta between 5000000001105017 and 5000000001110016 --primer lote de tarjetas
and t.uidmonedero in 
    (select t.uidmonedero from credencializacion.tarjetas t 
        inner join monederoconsultas.estadodecuenta m
        on t.uidmonedero = m.uidmonedero  
        where uidsolicitud = '66a1307f-9752-4ebc-b5b5-688607526d62'--t.inumerotarjeta between 5000000001110017 and 5000000001115016 --segundo lote de tarjetas
            and inummonedero between 1000000001417457 and  1000000001422456 -- primer lote de monederos
            --and t.bvendida = 1
    );--4724

-- se esta consulta se pueden tomar para asignar a las tarjetas tengan monedero null del primer lote
select uidtarjeta,uidmonedero,inummonedero,inumtarjeta,uidestatustarjeta,uidestatus,bactivo,bbaja--uidmonedero,inummonedero 
from monederoconsultas.estadodecuenta 
where inummonedero between 1000000001422465 and 1000000001427464 
    and inummonedero not in (select inumeromonedero from credencializacion.tarjetas where uidsolicitud in ('66a1307f-9752-4ebc-b5b5-688607526d62'));--4724

--validacion de los que estan asignados sin problemas
select * from credencializacion.tarjetas t where t.uidsolicitud in ('66a1307f-9752-4ebc-b5b5-688607526d62') and t.inumeromonedero between 1000000001422465 and 1000000001427464;
--276

----------------------------------------



--Actualizar monedero consultas 
MERGE INTO monederoconsultas.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025)
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.spanhash = o.spanhash,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE  m.uidtarjeta != o.uidtarjeta;
--ACTUALIZO 1 REGISTRO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
MERGE INTO app.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025)
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.spanhash = o.spanhash
        WHERE m.spanhash != o.spanhash; 
        --ACTUALIZO 0 REGISTROS
        
--commit;
 MERGE INTO appmonederoquery.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025)
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE m.uidtarjeta != o.uidtarjeta; 
--        COMMIT;
--ACTUALIZO 1 REGISTRO
MERGE INTO appmonederocommand.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025)
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        WHERE m.uidtarjeta != o.uidtarjeta; 
        -- commit;
--ACTUALIZO 1 REGISTRO        
MERGE INTO sincronizador.monedero m
USING (
    SELECT inumerotarjeta, spanhash, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025) -- Solo trae registros de las solicitudes 1 y 2
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumerotarjeta = o.inumerotarjeta,
        m.spanhash = o.spanhash
        WHERE m.spanhash != o.spanhash;
        
        -- COMMIT;
--ACTUALIZO 6 REGISTROS

MERGE INTO comercio.monederostarjetas m
USING (
    SELECT uidtarjeta, inumerotarjeta, spanhash, uidestatustarjeta, uidmotivo, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025) -- Solo trae registros de las solicitudes 1 y 2
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta,
        m.spanhash = o.spanhash,
        m.uidestatustarjeta = o.uidestatustarjeta,
        m.uidmotivotarjeta = o.uidmotivo
        where m.uidtarjeta != o.uidtarjeta ; 
        -- COMMIT;
--ACTUALIZO 0 REGISTROS
MERGE INTO apptickets.estadodecuenta m
USING (
    SELECT inumerotarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025)
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED  THEN
    UPDATE SET 
        m.inumtarjeta = o.inumerotarjeta
        WHERE m.inumtarjeta != o.inumerotarjeta;   
-- COMMIT;
--ACTUALIZO 0 REGITROS.
MERGE INTO pagos.tarjetas m
USING (
    SELECT uidtarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025) -- Solo trae registros de las solicitudes 1 y 2
) o
ON (m.uidtarjeta = o.uidtarjeta)
WHEN MATCHED THEN
    UPDATE SET 
        m.uidmonedero = o.uidmonedero
        WHERE m.uidmonedero != o.uidmonedero; 
-- COMMIT;
--ACTUALIZO 0 REGISTROS


MERGE INTO pagosconsultas.estadodecuenta m
USING (
    SELECT uidtarjeta, inumerotarjeta, uidmonedero
    FROM credencializacion.tarjetas
    WHERE inumerotarjeta in (5000000001110078, 5000000001110832, 5000000001110017, 5000000001110018, 5000000001110020, 5000000001110021, 5000000001110022, 5000000001110023, 5000000001110024, 5000000001110025)
) o
ON (m.uidmonedero = o.uidmonedero)
WHEN MATCHED THEN
    UPDATE SET 
        m.INUMTARJETA = o.inumerotarjeta,
        m.uidtarjeta = o.uidtarjeta
        WHERE m.uidtarjeta != o.uidtarjeta; 
        -- COMMIT;
--ACTUALIZO 0 REGISTROS
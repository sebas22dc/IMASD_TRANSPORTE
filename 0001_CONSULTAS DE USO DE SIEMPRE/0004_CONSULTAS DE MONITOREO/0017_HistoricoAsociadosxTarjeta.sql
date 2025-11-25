------------------Obtener lista de usuarios app que han tenido asociada la tarjeta buscada
select t2.SCORREO,
       t2.SNOMBRE || ' ' || t2.SAPELLIDOPATERNO || ' ' || t2.SAPELLIDOMATERNO NombreCompleto,
       t1.SNUMEROTARJETA,
       t1.STIPOTARIFA,
       case
           when t1.BACTIVO = 1 and t1.BBAJA = 0 then 'SI'
           else 'NO' end                                                      Asociada,
       t1.BACTIVO,
       t1.BBAJA
from APPMONEDEROCOMMAND.TARJETAUSUARIO t1
         join app.USUARIO t2 on t1.UIDUSUARIO = t2.UIDUSUARIO
where SNUMEROTARJETA = '5000000000222661'
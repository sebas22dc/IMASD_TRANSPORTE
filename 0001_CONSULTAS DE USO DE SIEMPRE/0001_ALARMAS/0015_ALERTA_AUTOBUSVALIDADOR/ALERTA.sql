


--------------------------------------correción de query de rutas de tickets
select COUNT(1) DIFS
from tarifas.RUTAS src
             join TICKETS.RUTAS dest on dest.UIDRUTA = src.UIDRUTA
WHERE
   --1=1
    dest.SRUTA != src.SRUTA
--OR dest.DTFECHAACTUALIZACION != src.DTFECHAACTUALIZACION
   OR dest.SCLAVERUTA != src.SCLAVERUTA
   OR dest.SDESCRIPCION != src.SDESCRIPCION
   OR dest.SCLAVERIDANGO != src.SCLAVERIDANGO
   OR dest.BAPLICATRANSBORDOS != src.BAPLICATRANSBORDOS
   OR dest.IORIGEN != src.IORIGEN
   OR dest.BTRANSITORIO != src.BTRANSITORIO

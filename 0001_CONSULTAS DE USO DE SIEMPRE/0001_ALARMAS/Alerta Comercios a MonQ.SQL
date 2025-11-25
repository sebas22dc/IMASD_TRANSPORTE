--VALIDA REPLICA COMERCIOS A MONC
select o.*
from comercio.operaciones o
INNER JOIN COMERCIO.COMERCIOS CC ON CC.UIDCOMERCIO = O.UIDCOMERCIO
left join comercio.operacionesdet d on d.uidoperacion = o.uidoperacion
left join monederoconsultas.estadodecuenta e on e.inummonedero = d.snumeromonedero
LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M ON M.uidoperacion = O.uidoperacion
WHERE
M.uidoperacion IS NULL
and o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
and o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
AND O.DTFECHAOPERACION > SYSDATE-1
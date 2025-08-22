

INSERT INTO MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA 
(uidmovimientoestadodecuenta,uidoperacion,uidtiposmonedero,uidtipomovimiento,uidtipotransaccion,dmonto,sobservaciones,uidestatus,dtfechaoperacion,dtfechacreacion,dtfechamodificacion,dtfechabaja,bactivo,bbaja,uidusuariocreacion,uidusuariomodificacion,
uidusuariobaja,uidmonedero,ifoliomovimiento,semisor,bfacturado,brecargado,bcancelado,uidtipooperacion)

select 
lower(SUBSTR(RAWTOHEX(SYS_GUID()), 1, 8) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 9, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 13, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 17, 4) || '-' ||
  SUBSTR(RAWTOHEX(SYS_GUID()), 21)) as uidmovimientoestadodecuenta,
o.UIDOPERACION, e.UIDTIPOMONEDERO uidtiposmonedero, 'ef008eb7-ea41-46bb-814e-f94979913ceb' UIDTIPOMOVIMIENTO, 'e350f3d3-c742-4a13-9674-edeafc171893' UIDTIPOTRANSACCION, O.FMONTO DMONTO, 'Venta de saldo' SOBSERVACIONES
,'5773658c-a461-4429-91ac-2b58083cb881' UIDESTATUS, O.DTFECHAOPERACION, O.DTFECHACREACION, NULL DTFECHAMODIFICACION, NULL DTFECHABAJA, O.BACTIVO ,O.BBAJA, '00000000-0000-0000-0000-000000000000' UIDUSUARIOCREACION, NULL UIDUSUARIOMODIFICACION, NULL UIDUSUARIOBAJA
, e.UIDMONEDERO,O.IFOLIOVENTA IFOLIOMOVIMIENTO, CC.SCOMERCIO SEMISOR, 0 BFACTURADO, 1 BRECARGADO, 0 BCANCELADO,'4eb81264-3844-4196-bffb-a9e82d0adfc8' UIDTIPOOPERACION
--trunc(O.dtfechaoperacion),count(0) 
from comercio.operaciones o 
INNER JOIN COMERCIO.COMERCIOS CC ON CC.UIDCOMERCIO = O.UIDCOMERCIO
left join comercio.operacionesdet d on d.uidoperacion = o.uidoperacion
left join monederoconsultas.estadodecuenta e on e.inummonedero = d.snumeromonedero
LEFT JOIN MONEDEROCOMANDOS.MOVIMIENTOSESTADOSDECUENTA M ON M.uidoperacion = O.uidoperacion
WHERE 
M.uidoperacion IS NULL
and o.uidproducto = 'b5b8371c-cc26-4380-9334-ab09b59b2731'
and o.uidestatusoperacion = '82610227-cf80-4c84-9fe2-98bf23aad442'
--and o.dtfechaoperacion > TO_DATE('13-02-2025 23:59:59', 'DD-MM-YYYY HH24:MI:SS') AND o.dtfechaoperacion < TO_DATE('15-02-2025 19:40:00', 'DD-MM-YYYY HH24:MI:SS')
--AND snumeromonedero IS not NULL;
--COMMIT;
and snumeromonedero = '1000000000237185';
COMMIT;
--group by trunc(o.dtfechaoperacion)
--order by trunc(o.dtfechaoperacion) desc;

--1560
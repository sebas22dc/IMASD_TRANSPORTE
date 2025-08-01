--En caso de tener transacciones con alguna correción o que se requiera tener el dato de rollback,se ingresan los idfoliocomercio en el campo coop.ifoliocomercio
--CONSULTA MONITOR OPERACIONES COMERCIO NOMBRE DEL ARCHIVO: COMERCIOS_CIFO_DDMMYY
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
/*LEFT JOIN (
select co.scomercio,o.sfolioventa
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
where o.DTFECHAOPERACION >= TO_DATE('10-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('11-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%' and o.sestatustransaccion = 'CANCELADA'
)X ON x.scomercio = co.scomercio and x.sfolioventa = o.sfolioventa*/
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus='OPERACIÓN GUARDADA'
	left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus='SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus='OPERACIÓN DETALLE GUARDADA'
	left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus='CONFIRMACIÓN DE SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus='EXITOSA'
where o.DTFECHAOPERACION >= TO_DATE('30-05-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('01-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%'-- and o.sestatustransaccion = 'CONFIRMADA'
--and x.sfolioventa is null
and coop.ifoliocomercio in('11615017300525',
'28444037310525')
order by o.DTFECHAOPERACION desc











------------------------SEBAS



--En caso de tener transacciones con alguna correción o que se requiera tener el dato de rollback,se ingresan los idfoliocomercio en el campo coop.ifoliocomercio
--CONSULTA MONITOR OPERACIONES COMERCIO NOMBRE DEL ARCHIVO: COMERCIOS_CIFO_DDMMYY
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
/*LEFT JOIN (
select co.scomercio,o.sfolioventa
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
where o.DTFECHAOPERACION >= TO_DATE('10-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('11-06-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%' and o.sestatustransaccion = 'CANCELADA'
)X ON x.scomercio = co.scomercio and x.sfolioventa = o.sfolioventa*/
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus='OPERACIÓN GUARDADA'
	left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus='SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus='OPERACIÓN DETALLE GUARDADA'
	left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus='CONFIRMACIÓN DE SALDO PROTEGIDO'
	left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus='EXITOSA'
where o.DTFECHAOPERACION >= TRUNC(SYSDATE - 1)
    AND o.DTFECHAOPERACION < TRUNC(SYSDATE)
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%'-- and o.sestatustransaccion = 'CONFIRMADA'
--and x.sfolioventa is null
and coop.ifoliocomercio in('11615017300525',
'28444037310525')
order by o.DTFECHAOPERACION desc
;
















-----------------VERSION 2 ABI
-- CONSULTA PARA CANCELADAS DE CIFO


with canceladas as (
select coop.ifoliocomercio
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    where soperacion = 'Cancelada'
    and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%'
    AND o.DTFECHAOPERACION >= TO_DATE('29-05-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND o.DTFECHAOPERACION < TO_DATE('30-05-2025 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
)
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
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus='OPERACIÓN GUARDADA'
    left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus='SALDO PROTEGIDO'
    left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus='OPERACIÓN DETALLE GUARDADA'
    left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus='CONFIRMACIÓN DE SALDO PROTEGIDO'
    left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus='EXITOSA'
where 1=1
and co.snombregrupocomercial = 'Cajero' and co.scomercio like 'CIFO%'
and coop.ifoliocomercio in(select ifoliocomercio from canceladas)
order by o.DTFECHAOPERACION desc 





;
------------------VERSION 2 SEBAS


with canceladas as (
select coop.ifoliocomercio
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    where soperacion = ''Cancelada''
    and co.snombregrupocomercial = ''Cajero'' and co.scomercio like ''CIFO%''
    AND o.DTFECHAOPERACION >= TRUNC(SYSDATE - [DESDE_MAS])
    AND o.DTFECHAOPERACION < TRUNC(SYSDATE - [HASTA])
)
select soperacion as "OPERACIÓN", co.inumcomercio "CLIENTE", co.scomercio "COMERCIO" , o.sfolioventa "FOLIO", coop.ifoliocomercio "FOLIOCOMERCIO", trunc(o.dtfechaoperacion) "FECHA",
to_char(o.dtfechaoperacion, ''HH24:MI'') "HORA", to_char(o.dtfechaoperacion,''DD/MM/YYYY HH24:MI:SS'') FECHAHORA,
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
,o.stipomovimiento "TIPO", NVL(smotivo,'' '') "MOTIVO", o.icantidad "CANTIDAD", o.dsaldoanterior "SALDO ANTERIOR", o.dsaldoactual "SALDO ACTUAL",e.sestatus, co.snombregrupocomercial "GRUPO COMERCIAL"
from COMERCIOCONSULTAS.operaciones  o
inner join comercio.comercios co on co.uidcomercio = o.uidcomercio
left join catalogos.estatus e on e.uidestatus = co.uidestatus
    left join comercio.operaciones coop on coop.uidoperacion=o.uidoperacion
    left join comercio.logventa lv on lv.ifolioventa=o.sfolioventa
    left join comercio.logventadetalle lvd1 on lvd1.uidlogventa=lv.uidlogventa and lvd1.sestatus=''OPERACIÓN GUARDADA''
    left join comercio.logventadetalle lvd2 on lvd2.uidlogventa=lv.uidlogventa and lvd2.sestatus=''SALDO PROTEGIDO''
    left join comercio.logventadetalle lvd3 on lvd3.uidlogventa=lv.uidlogventa and lvd3.sestatus=''OPERACIÓN DETALLE GUARDADA''
    left join comercio.logventadetalle lvd4 on lvd4.uidlogventa=lv.uidlogventa and lvd4.sestatus=''CONFIRMACIÓN DE SALDO PROTEGIDO''
    left join comercio.logventadetalle lvd5 on lvd5.uidlogventa=lv.uidlogventa and lvd5.sestatus=''EXITOSA''
where 1=1
and co.snombregrupocomercial = ''Cajero'' and co.scomercio like ''CIFO%''
and coop.ifoliocomercio in(select ifoliocomercio from canceladas)
order by o.DTFECHAOPERACION desc 

select
CAA.UIDAUTOBUS,
CAA.SPLACAS,
CAA.SNUMECO,
CARU.SCLAVERUTA, 
CARU.SDESCRIPCION, 
CARU.SCLAVERIDANGO,
tat.STIPOTARIFA
from catalogos.autobuses CAA
left join catalogos.autobusrutachofer CAR on CAA.UIDAUTOBUS =CAR.UIDAUTOBUS
left join catalogos.rutas CARU on CAR.UIDRUTA = CARU.UIDRUTA
left join TARIFAS."ConfiguracionesTarifa" TCT on TCT."uIdRuta" = CARU.UIDRUTA
left join tarifas.tipoTarifas tat on tat.UIDTIPOTARIFA = tct."uIdTipoTarifa"
where 
--CARU.SCLAVERUTA = '9008'
CAA.bactivo =1 
and CAA.bbaja = 0
and TCT."uIdTipoTarifa" is null
;

select * from sincronizador.VERSIONTRANSBORDO where DTFECHACREACION  >= ((sysdate -15) - 6/24)  order by DTFECHACREACION desc fetch first  100000 rows only
;
--where DTFECHACREACION >= ((sysdate -15) -(6/24));
-- select ' SINCRONIZADOR.RECARGASGRUPO' ,* from SINCRONIZADOR.RECARGASGRUPO
-- select ' sincronizador.VALIDACIONNFC' ,* from sincronizador.VALIDACIONNFC
-- select ' sincronizador.CAMBIOSMONEDERO_PENDIENTES_GRUPO' ,* from sincronizador.CAMBIOSMONEDERO_PENDIENTES_GRUPO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.RECARGAS_PENDIENTES' ,* from sincronizador.RECARGAS_PENDIENTES
-- select ' sincronizador.LOGCONTROLTICKETS' ,* from sincronizador.LOGCONTROLTICKETS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.DENEGADOS' ,* from sincronizador.DENEGADOS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.LOGCONTROLDENEGADOS' ,* from sincronizador.LOGCONTROLDENEGADOS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.NOTIFICACIONERECARGAS' ,* from sincronizador.NOTIFICACIONERECARGAS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.LOGAPLICASALDO' ,* from sincronizador.LOGAPLICASALDO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.LOGCONTROLRECARGAS' ,* from sincronizador.LOGCONTROLRECARGAS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.RECARGAS' ,* from sincronizador.RECARGAS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.TRANSACCIONVINDENDUPLICADO' ,* from sincronizador.TRANSACCIONVINDENDUPLICADO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.ESTATUSMONEDERO' ,* from sincronizador.ESTATUSMONEDERO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.TRANSACCIONQRDINAMICO' ,* from sincronizador.TRANSACCIONQRDINAMICO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.VALIDADORVSAM' ,* from sincronizador.VALIDADORVSAM where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.VERSIONCONFIGURACION' ,* from sincronizador.VERSIONCONFIGURACION where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.RUTAS' ,* from sincronizador.RUTAS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC' ,* from sincronizador.DETALLESINCRONIZACIONTRANSACCIONESNFC where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.TIPOOPERACIONES' ,* from sincronizador.TIPOOPERACIONES
-- select ' sincronizador.LOGBOLSAHSM' ,* from sincronizador.LOGBOLSAHSM where DTFECHA > ((sysdate -15) -(6/24))
-- select ' sincronizador.VERSIONTARIFA' ,* from sincronizador.VERSIONTARIFA where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.TARIFAS' ,* from sincronizador.TARIFAS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.PARAMETROS' ,* from sincronizador.PARAMETROS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.VIAJETRANSBORDO' ,* from sincronizador.VIAJETRANSBORDO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.TRANSBORDOS' ,* from sincronizador.TRANSBORDOS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.AUTOBUSVALIDADOR' ,* from sincronizador.AUTOBUSVALIDADOR where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.VSAM' ,* from sincronizador.VSAM where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.DETLOGSINCRONIZACIONES' ,* from sincronizador.DETLOGSINCRONIZACIONES where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.CAMBIOSMONEDERO' ,* from sincronizador.CAMBIOSMONEDERO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.ALERTAS' ,* from sincronizador.ALERTAS where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select ' sincronizador.VERSIONTRANSBORDO' ,* from sincronizador.VERSIONTRANSBORDO where DTFECHACREACION >= ((sysdate -15) -(6/24))
-- select  * from sincronizador.TICKET where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.TARIFA where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
select * from sincronizador.LISTASCUENTAS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGCONFIGURACIONES where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGLISTASTARIFAS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.TIPOTARIFAS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.MONEDERO where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGLISTASTRANBORDOS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGSINCRONIZACIONES where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGVSAMOPERATE where DTDATE >=((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
select * from sincronizador.SINCRONIZACIONTRANSACCIONESNFC where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
select * from sincronizador.TRANSACCIONTICKETQR where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.TICKETUSADOS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.DETALLETRANSACCIONQRDINAMICO where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.VALIDADORES where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.TRANSACCIONVINDEN where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.AUTOBUSRUTACHOFER where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.CONCESIONARIOS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.CONFIGURACIONMODULOS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.TIPODATOS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.AUTOBUSES where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGCAMBIOSMONEDERO where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.MODULOS where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.LOGVSAMOPERACION where DTDATE >=((sysdate -15) -(6/24))    order by DTFECHACREACION desc fetch first  100000 rows only;
-- select * from sincronizador.NOTIFICACIONESTATUSQR where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
select * from sincronizador.AJUSTEDEB where DTFECHACREACION >= ((sysdate -15) -(6/24))  order by DTFECHACREACION desc fetch first  100000 rows only;
select * from sincronizador.TRANSACCIONES_DESENCRIPTADAS where TRANSACTIONDATE >=((sysdate -15) -(6/24));
--


use STG_TRANSPORTE
CREATE TABLE dbo.Tarjetas_error_saldo_fisico_excedente (
iNumeroTarjeta VARCHAR(17) not null,
Vuelta int not null,
FechaInsercion DATETIME not null
);


use STG_TRANSPORTE
CREATE TABLE dbo.Tarjetas_error_saldo_fisico_excedente_FINAL (
iNumeroTarjeta VARCHAR(17) not null
);



TRUNCATE TABLE DBO.TARJETAS_ERROR_SALDO_FISICO_EXCEDENTE


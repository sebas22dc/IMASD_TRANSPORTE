
-- SE CONSERVARA UNICAMENTE EL RESULTADO DE LA TABLA DINAMICA CUANDO SE CALCULE EL REPORTE POR MEDIO DE CODIGO EN EJECUCION
-- CREATE TABLE dbo.Resultados_Reporte_Rechazo (
--     ID INT IDENTITY(1,1),
--     Error_lectura INT, -->Error en lectura
--     Tarjeta_expirada INT, -->Tarjeta expirada
-- 	Sin_saldo INT,
--     Rechazada INT,
--     Deny_list INT,
--     Tarjeta_no_soportada INT,
--     Falta_configurar_tarifa INT,
--     Error_en_recarga INT,
--     Tarjeta_recargada INT,
--     Otro INT,
--     TOTAL_GENERAL INT
--     );

    --------------------------
    CREATE TABLE dbo.Resultados_Reporte_Rechazo (
    Dia_Operacion date not null ,
    Estado_Transaccion varchar(100) not null, --> AQUI HAY QUE METER SIEMPRE UN DATO LLAMADO TOTAL_GENERAL
    Total_Datos int not null,
    CONSTRAINT PK_PivotFinal PRIMARY KEY (Dia_Operacion, Estado_Transaccion)
    );

    -- Tipo tabla para recibir filas desde C# (TVP)
CREATE TYPE dbo.ResultadosReporteRechazoRows AS TABLE(
  Dia_Operacion      date         NOT NULL,
  Estado_Transaccion varchar(100) NOT NULL,
  Total_Datos        int          NOT NULL
);

-- CONSULTAS X REPORTE
---------------------------
-- VISTA PARA OBTENER EL REPORTE DE RECHAZOS
---------------------------
CREATE OR ALTER VIEW dbo.vw_Reporte_Rechazo
AS
SELECT  
    FORMAT(b.Dia_Operacion, 'yyyy-MM-dd') AS Dia_Operacion,
    b.Estado_Transaccion,
    b.Total_Datos,
    t.TotalDia,
    CAST(1.0 * b.Total_Datos / NULLIF(t.TotalDia, 0) AS decimal(18,6)) * 100 AS Porcentaje
FROM dbo.Resultados_Reporte_Rechazo AS b
INNER JOIN (
    SELECT Dia_Operacion,
           MAX(Total_Datos) AS TotalDia
    FROM dbo.Resultados_Reporte_Rechazo
    WHERE Estado_Transaccion = 'TOTAL_GENERAL'
    GROUP BY Dia_Operacion
) AS t
    ON t.Dia_Operacion = b.Dia_Operacion
WHERE b.Estado_Transaccion <> 'TOTAL_GENERAL';
GO


------------------------------------------------------------ tabla de datos de rechazadas tarjetas registros 


    CREATE TABLE dbo.Tarjetas_Rechazo (
    Num_economico varchar(30) not null ,
    Clave_validador varchar(30) not null ,
    Num_tarjeta varchar(20) not null ,
    Dia_Operacion date not null ,
    Hora_Operacion time(0) not null ,
    Tipo_tarifa varchar(50) not null,
        CONSTRAINT UQ_Tarjetas_Rechazo UNIQUE (
        Num_tarjeta,
        Dia_Operacion
        )
    );

    -- Tipo tabla para recibir filas desde C# (TVP)
CREATE TYPE dbo.TarjetasRechazoRows AS TABLE(
    Num_economico varchar(30) not null ,
    Clave_validador varchar(30) not null ,
    Num_tarjeta varchar(20) not null ,
    Dia_Operacion date not null ,
    Hora_Operacion time(0) not null ,
    Tipo_tarifa varchar(50) not null
);


--------
CREATE TABLE dbo.Reportes_Configuraciones_CIFO (
    ID INT PRIMARY KEY,
    Nombre_archivo NVARCHAR(100),
    Ruta_Sftp nVarchar(100),
	Sql_query nvarchar(3000)
);



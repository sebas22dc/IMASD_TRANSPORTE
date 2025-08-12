CREATE TABLE dbo.Reportes_Configuraciones_CIFO (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre_archivo NVARCHAR(100),
    Ruta_Sftp nVarchar(100),
	Sql_query nvarchar(MAX)
);




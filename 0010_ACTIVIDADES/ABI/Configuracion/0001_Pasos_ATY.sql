CREATE TABLE dbo.Reportes_Configuraciones (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre_archivo nVarchar(100),
    Ruta_Sftp nVarchar(100),
	Sql_query nvarchar(MAX),
    Ruta_Local_Guardar nVarchar(200)
);



ALTER TABLE dbo.Reportes_Configuraciones
ADD bActivo BIT NOT NULL DEFAULT (1);

ALTER TABLE dbo.Reportes_Configuraciones
ADD Ruta_Local_Guardar nVarchar(200) NOT NULL DEFAULT ('');

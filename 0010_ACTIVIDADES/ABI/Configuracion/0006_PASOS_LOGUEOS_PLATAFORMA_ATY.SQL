


-----------TABLAS FISCAS DE DATOS TEMPORALES
CREATE TABLE dbo.Users_Aty_TMP (
    UidUsuario      VARCHAR(50)  NOT NULL,
    SUserName       NVARCHAR(50) NOT NULL,
    SNombres        NVARCHAR(500) NULL,
    SApellidos      NVARCHAR(500) NULL,
    SEmail          NVARCHAR(500) NULL
);
ALTER TABLE dbo.Users_Aty_TMP ADD sNombrePerfil NVARCHAR(500) DEFAULT '' NOT NULL;
-----17/09/2025
ALTER TABLE dbo.Users_Aty_TMP ADD sEstatus NVARCHAR(25) DEFAULT '' NOT NULL;




CREATE TABLE dbo.Logueos_Exitosos_TMP (
    UidUsuario      VARCHAR(50)  NOT NULL,
    dtFechaLogueo     DATETIME2(0) NOT NULL,
);

-----------TABLAS FINALES
CREATE TABLE dbo.Users_Aty (
    UidUsuario      VARCHAR(50)  NOT NULL
        CONSTRAINT PK_Users_Aty PRIMARY KEY,
    SUserName       NVARCHAR(50) NOT NULL,
    SNombres        NVARCHAR(500) NULL,
    SApellidos      NVARCHAR(500) NULL,
    SEmail          NVARCHAR(500) NULL
);
ALTER TABLE dbo.Users_Aty ADD sNombrePerfil NVARCHAR(500) DEFAULT '' NOT NULL;
-----17/09/2025
ALTER TABLE dbo.Users_Aty ADD sEstatus NVARCHAR(25) DEFAULT '' NOT NULL;

CREATE TABLE dbo.Logueos_Exitosos (
    UidUsuario      VARCHAR(50)  NOT NULL,
    dtFechaLogueo     DATETIME2(0) NOT NULL,
    CONSTRAINT PK_Logueos_Exitosos PRIMARY KEY (UidUsuario, dtFechaLogueo),
    CONSTRAINT FK_Logueos_Usuario FOREIGN KEY (UidUsuario)
        REFERENCES dbo.Users_Aty(UidUsuario) ON DELETE CASCADE
);

-- Índice útil para consultas por fecha:
CREATE INDEX IX_Logueos_Fecha ON dbo.Logueos_Exitosos (dtFechaLogueo);
CREATE INDEX IX_Logueos_Usuario_Fecha
ON dbo.Logueos_Exitosos (UidUsuario, dtFechaLogueo DESC);


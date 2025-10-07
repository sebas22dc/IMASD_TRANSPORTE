USE [DWTRANSPORTE]
GO

CREATE TABLE [fact].[INGRESOSCARGOS_version2](
	[UIDOPERACION] [nvarchar](50) NULL,
	[UIDTIPOTRANSACCION] [nvarchar](50) NOT NULL,
	[UIDCOMERCIO] [nvarchar](50) NULL,
	[FECHAKEY] [int] NOT NULL,
	[TIEMPOKEY] [int] NOT NULL,
	[UIDTIPOMON] [nvarchar](50) NULL,
	[TIPOMOVIMIENTO] [nvarchar](20) NULL,
	[FOLIO] [numeric](16, 0) NULL,
	[INUMMONEDERO] [numeric](16, 0) NULL,
	[UIDTIPOTARIFA] [nvarchar](50) NULL,
	[MONTO] [numeric](38, 2) NULL,
	[NUMTRX] [int] NULL
) ON [PRIMARY]
GO

---------------------------------------------------------------------------- 

----------------------------------------------------------------------------
























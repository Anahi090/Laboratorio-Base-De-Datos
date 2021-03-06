USE [Puntodeventas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/10/2018 02:57:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[No_cliente] [varchar](45) NOT NULL,
	[NombreC] [varchar](45) NULL,
	[PrimerApellidoC] [varchar](50) NULL,
	[SegundoApellidoC] [varchar](50) NULL,
	[Direccion] [varchar](45) NULL,
	[Telefono] [varchar](15) NULL,
	[Fotografia] [image] NULL,
 CONSTRAINT [pk_ic] PRIMARY KEY CLUSTERED 
(
	[No_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 06/10/2018 02:57:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[No_compra] [varchar](45) NOT NULL,
	[Clave_Prod] [int] NULL,
	[Fecha] [datetime] NULL,
	[TotalCompra] [varchar](70) NULL,
	[No_Provedor] [varchar](45) NULL,
 CONSTRAINT [pk_is] PRIMARY KEY CLUSTERED 
(
	[No_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 06/10/2018 02:57:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ClaveProd] [int] NOT NULL,
	[Nombre] [text] NULL,
	[Existencias] [bit] NULL,
	[Precio] [money] NULL,
 CONSTRAINT [pk_ip] PRIMARY KEY CLUSTERED 
(
	[ClaveProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provedores]    Script Date: 06/10/2018 02:57:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedores](
	[No_provedor] [varchar](45) NOT NULL,
	[NombreP] [varchar](45) NULL,
	[PrimerApellidoP] [varchar](50) NULL,
	[SegundoApellidoP] [varchar](50) NULL,
	[Domicilio] [uniqueidentifier] NULL,
	[Telefono] [varchar](15) NULL,
 CONSTRAINT [pk_in] PRIMARY KEY CLUSTERED 
(
	[No_provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 06/10/2018 02:57:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[No_ventas] [varchar](45) NOT NULL,
	[Fecha] [varchar](45) NULL,
	[Clave_Prod] [int] NULL,
	[Cantidad] [varchar](50) NULL,
	[Total] [varchar](50) NULL,
	[No_cliente] [varchar](45) NULL,
 CONSTRAINT [pk_iv] PRIMARY KEY CLUSTERED 
(
	[No_ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Producto] FOREIGN KEY([Clave_Prod])
REFERENCES [dbo].[Producto] ([ClaveProd])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Producto]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Provedores] FOREIGN KEY([No_Provedor])
REFERENCES [dbo].[Provedores] ([No_provedor])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Provedores]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([No_cliente])
REFERENCES [dbo].[Clientes] ([No_cliente])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Producto] FOREIGN KEY([Clave_Prod])
REFERENCES [dbo].[Producto] ([ClaveProd])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Producto]
GO

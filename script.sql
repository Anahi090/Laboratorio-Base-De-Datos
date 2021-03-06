USE [PuntoDeVenta]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 26/09/2018 04:11:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NOT NULL,
	[NombreCategoria] [varchar](90) NULL,
	[Descripcion] [text] NULL,
 CONSTRAINT [pk_ic] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 26/09/2018 04:11:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario](
	[idProducto] [int] NOT NULL,
	[Numcompra] [varchar](45) NULL,
	[PiezasEntrada] [bit] NULL,
	[PiezasVendidas] [bit] NULL,
	[TotalRestantes] [int] NULL,
	[idCategoria] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 26/09/2018 04:11:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[idMarca] [varchar](45) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[logo] [image] NULL,
 CONSTRAINT [pk_im] PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 26/09/2018 04:11:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] NOT NULL,
	[NombreProducto] [varchar](70) NULL,
	[idCategoria] [int] NOT NULL,
	[idProvedor] [varchar](45) NULL,
	[idMarca] [varchar](45) NOT NULL,
 CONSTRAINT [pk_ip] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provedores]    Script Date: 26/09/2018 04:11:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedores](
	[idProvedor] [varchar](45) NOT NULL,
	[NombreComapañia] [varchar](45) NULL,
	[NombreProveedor] [varchar](60) NULL,
	[PrimerApellidoP] [varchar](90) NULL,
	[SegundoApellidoP] [varchar](80) NULL,
	[Direccion] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[CodigoPostal] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
 CONSTRAINT [pk_iv] PRIMARY KEY CLUSTERED 
(
	[idProvedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [FK_inventario_Categorias]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [FK_inventario_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marcas] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([idMarca])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marcas]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Provedores] FOREIGN KEY([idProvedor])
REFERENCES [dbo].[Provedores] ([idProvedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Provedores]
GO

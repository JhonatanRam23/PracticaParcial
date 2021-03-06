	USE [rincon]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[nit] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enc_factura]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enc_factura](
	[no_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[cliente] [varchar](20) NULL,
	[total_factura] [float] NULL,
	[usuario] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[no_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vfacturas]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vfacturas]  
   AS  
   select a.no_factura as no_factura, a.fecha as fecha, b.nombre as cliente,a.total_factura total, a.usuario
from enc_factura a, cliente b
where a.cliente=b.nit

   
GO
/****** Object:  Table [dbo].[producto]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] NOT NULL,
	[nombre] [varchar](40) NULL,
	[clase] [int] NULL,
	[unidad_medidad] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_factura]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_factura](
	[factura] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[producto] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[factura] ASC,
	[cantidad] ASC,
	[producto] ASC,
	[precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vdetalles]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vdetalles]
   AS  

select a.factura as factura, a.cantidad cantidad, b.nombre as producto, a.precio as precio, a.total as total
from detalle_factura a, producto b
where a.producto=b.id

GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[fecha] [datetime] NULL,
	[tipo] [int] NULL,
	[producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [int] NULL,
	[usuario] [varchar](10) NULL,
	[comentario] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caja]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja](
	[fecha] [datetime] NULL,
	[transaccion] [varchar](50) NULL,
	[monto] [float] NULL,
	[comentario] [varchar](50) NULL,
	[saldo] [float] NULL,
	[usuario] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clase_producto]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clase_producto](
	[id] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promociones]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promociones](
	[id] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[nit] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[clase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[producto] [int] NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
	[precio] [float] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[producto] ASC,
	[fecha_ingreso] ASC,
	[precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_transaccion]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_transaccion](
	[id] [int] NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_user]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_user](
	[id] [int] NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 24/10/2019 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [varchar](10) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (1, N'Pastas')
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (2, N'Carnes')
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (3, N'Embutidos')
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (4, N'Lacteos')
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (5, N'Golosinas')
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (6, N'Gaseosas')
INSERT [dbo].[clase_producto] ([id], [nombre]) VALUES (7, N'Refrescos')
INSERT [dbo].[cliente] ([nit], [nombre], [direccion]) VALUES (N'12345678', N'Pepe2', N'Ciudad')
INSERT [dbo].[cliente] ([nit], [nombre], [direccion]) VALUES (N'7654321', N'Venado', N'Puerto')
INSERT [dbo].[cliente] ([nit], [nombre], [direccion]) VALUES (N'8306278-5', N'Jorge Garcia', N'Ciudad')
INSERT [dbo].[detalle_factura] ([factura], [cantidad], [producto], [precio], [total]) VALUES (1, 1, 2, 99, 999)
INSERT [dbo].[detalle_factura] ([factura], [cantidad], [producto], [precio], [total]) VALUES (1, 1, 4, 9, 9)
INSERT [dbo].[detalle_factura] ([factura], [cantidad], [producto], [precio], [total]) VALUES (3, 1, 1, 9, 9)
INSERT [dbo].[detalle_factura] ([factura], [cantidad], [producto], [precio], [total]) VALUES (3, 6, 1, 8, 48)
SET IDENTITY_INSERT [dbo].[enc_factura] ON 

INSERT [dbo].[enc_factura] ([no_factura], [fecha], [cliente], [total_factura], [usuario]) VALUES (1, CAST(N'2019-10-24' AS Date), N'8306278-5', 980.99, N'jgarcia')
INSERT [dbo].[enc_factura] ([no_factura], [fecha], [cliente], [total_factura], [usuario]) VALUES (2, CAST(N'2019-10-24' AS Date), N'8306278-5', 9, N'jgranados')
INSERT [dbo].[enc_factura] ([no_factura], [fecha], [cliente], [total_factura], [usuario]) VALUES (3, CAST(N'2019-10-24' AS Date), N'7654321', 0, N'jgarcia')
SET IDENTITY_INSERT [dbo].[enc_factura] OFF
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (1, N'Fideos', 2, N'Unidad')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (2, N'Corbatitas', 1, N'Unidad')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (3, N'Pollo', 2, N'Libra')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (4, N'Carne de Cerdo', 2, N'Libra')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (5, N'Jamon', 3, N'Libra')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (6, N'Longaniza', 3, N'Unidad')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (7, N'Crema', 4, N'Vaso')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (8, N'Queso', 4, N'Libra')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (9, N'Dulce', 5, N'Unidad')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (10, N'Chocolate', 5, N'Unidad')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (11, N'Pepsi', 6, N'Litro')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (12, N'Cocacola', 6, N'Litro')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (13, N'Gatorade', 7, N'Unidad')
INSERT [dbo].[producto] ([id], [nombre], [clase], [unidad_medidad]) VALUES (14, N'Revive', 7, N'Unidad')
INSERT [dbo].[proveedor] ([nit], [nombre], [direccion], [clase]) VALUES (N'87654321', N'PioLindo', N'Ciudad', 2)
INSERT [dbo].[stock] ([producto], [fecha_ingreso], [precio], [cantidad]) VALUES (1, CAST(N'2019-10-22' AS Date), 99, 10)
INSERT [dbo].[tipo_user] ([id], [descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[tipo_user] ([id], [descripcion]) VALUES (2, N'Cajero')
INSERT [dbo].[usuario] ([id], [pass], [tipo]) VALUES (N'jgarcia', N'jotagarcia', 1)
INSERT [dbo].[usuario] ([id], [pass], [tipo]) VALUES (N'jgranados', N'venado', 2)
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora_producto] FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [fk_bitacora_producto]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tipo_transaccion] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [fk_bitacora_tipo]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora_user] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [fk_bitacora_user]
GO
ALTER TABLE [dbo].[caja]  WITH CHECK ADD  CONSTRAINT [fk_caja_user] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[caja] CHECK CONSTRAINT [fk_caja_user]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [fk_detalle_factura] FOREIGN KEY([factura])
REFERENCES [dbo].[enc_factura] ([no_factura])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [fk_detalle_factura]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [fk_detalle_producto] FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [fk_detalle_producto]
GO
ALTER TABLE [dbo].[enc_factura]  WITH CHECK ADD  CONSTRAINT [fk_enc_cliente] FOREIGN KEY([cliente])
REFERENCES [dbo].[cliente] ([nit])
GO
ALTER TABLE [dbo].[enc_factura] CHECK CONSTRAINT [fk_enc_cliente]
GO
ALTER TABLE [dbo].[enc_factura]  WITH CHECK ADD  CONSTRAINT [fk_enc_usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[enc_factura] CHECK CONSTRAINT [fk_enc_usuario]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [fk_producto_clase] FOREIGN KEY([clase])
REFERENCES [dbo].[clase_producto] ([id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [fk_producto_clase]
GO
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_clase] FOREIGN KEY([clase])
REFERENCES [dbo].[clase_producto] ([id])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [fk_proveedor_clase]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [fk_stock_producto] FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [fk_stock_producto]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_user_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tipo_user] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_user_tipo]
GO

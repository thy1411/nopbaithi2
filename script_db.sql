Create database ShopDB
Go
USE [ShopDB]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/18/2024 8:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[DonGia] [float] NOT NULL,
	[Hinh] [varchar](50) NULL,
	[MaLoai] [int] NULL,
	[KhuyenMai] [bit] NULL,
 CONSTRAINT [PK_Hoa] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/18/2024 8:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (1, N'NANOFLEX TR 2.0', 2350000, N'pc01.jpg', 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (2, N'Reebok Nano X1', 1450000, N'pc02.jpg', 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (3, N'FLEXAGON FORCE 3.0', 2550000, N'pc03.jpg', 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (4, N'Nano X1 Tr Adventure', 1550000, N'pc04.jpg', 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (5, N'NANO X2 TR ADVENTURE SHOES', 2990000, N'pc05.jpg', 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (6, N'SPEED 21 TR', 2490000, N'pc06.jpg', 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (7, N'FLEXAGON FORCE 3.0', 1990000, N'pc07.jpg', 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (8, N'ENERGEN LUX RUNNING SHOES', 1790000, N'pc08.jpg', 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (9, N'REEBOK UNISEX ZIG KINETICA 3', 1279000, N'pc09.jpg', 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (10, N'REEBOK FLOATRIDE ENERGY 5', 3500000, N'pc10.jpg', 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (11, N'Hexalite Legacy Shoes', 2300000, N'pc11.jpg', 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (12, N'ENERGEN RUN 2', 4700000, N'pc12.jpg', 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (13, N'UNISEX REEBOK ENERGEN TECH', 1095000, N'pc13.jpg', 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (14, N'UNISEX REEBOK CLUB C BULC', 2690000, N'pc14.jpg', 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [Hinh], [MaLoai], [KhuyenMai]) VALUES (21, N'REEBOK CLUB C 85 VEGAN', 2550000, N'pc15.jpg', 3, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (1, N'Tập luyện')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (2, N'Chạy bộ')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (3, N'Tennis')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (4, N'Cổ điển')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TheLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TheLoai]
GO
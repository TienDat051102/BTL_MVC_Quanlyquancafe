USE [BTLWEB02]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[ThuocTinh] [nchar](20) NULL,
 CONSTRAINT [PK_Ban] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangLuongNV]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangLuongNV](
	[MaNV] [int] NOT NULL,
	[MACLV] [int] NOT NULL,
	[NgayLam] [datetime] NOT NULL,
 CONSTRAINT [PK_BangLuongNV] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MACLV] ASC,
	[NgayLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaLamViec]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLamViec](
	[MaCLV] [int] NOT NULL,
	[TenCLV] [nchar](10) NULL,
	[SoGioLV] [int] NULL,
	[TienLuongTheoCa] [money] NULL,
 CONSTRAINT [PK_dbo.CaLamViec] PRIMARY KEY CLUSTERED 
(
	[MaCLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [int] NOT NULL,
	[MaChiTietSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGiaBan] [money] NULL,
	[TongTienHD] [money] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaHoaDonNhap] [int] NOT NULL,
	[MaHH] [nchar](20) NOT NULL,
	[DonGiaNhap] [money] NULL,
	[TongTien] [money] NULL,
	[SoLuongNhap] [float] NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaChiTietSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[MaLuongDa] [nchar](10) NULL,
	[MaTopPing] [nchar](10) NULL,
	[MaSize] [nchar](10) NULL,
	[HinhAnh] [nchar](10) NULL,
	[DonGiaBan] [money] NULL,
	[GiamGia] [float] NULL,
 CONSTRAINT [PK_ChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongThucMon]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongThucMon](
	[MaSP] [int] NOT NULL,
	[MaHH] [nchar](20) NOT NULL,
	[SoLuongCanDung] [float] NOT NULL,
 CONSTRAINT [PK_CongThucMon] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbo.AnhChiTietSp]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo.AnhChiTietSp](
	[MaChiTietSP] [int] NOT NULL,
	[TenFileAnh] [nchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.AnhChiTietSp] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbo.AnhSp]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo.AnhSp](
	[MaSP] [int] NOT NULL,
	[TenFileAnh] [nchar](50) NOT NULL,
	[ViTri] [nchar](10) NULL,
 CONSTRAINT [PK_dbo.AnhSp] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbo.DanhMucSp]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo.DanhMucSp](
	[MaSP] [int] NOT NULL,
	[MaLoai] [int] NULL,
	[AnhDaiDien] [nchar](50) NULL,
	[TenSP] [nchar](30) NULL,
	[GiaBanCaoNhat] [money] NULL,
	[GioiThieuSP] [nchar](100) NULL,
	[GiaBanNhoNhat] [money] NULL,
 CONSTRAINT [PK_dbo.DanhMucSp] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [nchar](20) NOT NULL,
	[TenHH] [nchar](30) NULL,
	[SoLuongCon] [float] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [datetime] NULL,
	[MaKH] [int] NULL,
	[MaNV] [int] NULL,
	[MaBan] [int] NULL,
	[GiamGia] [float] NULL,
	[PhuongThucTT] [nchar](10) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDonNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [nchar](20) NULL,
	[MaNV] [int] NULL,
	[NgayNhapHang] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](10) NULL,
	[TenKH] [nchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[SDT] [nchar](10) NULL,
	[DiaChi] [nchar](30) NULL,
	[DiemTL] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nchar](10) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nchar](20) NOT NULL,
	[TenNCC] [nchar](50) NULL,
	[GhiChu] [nchar](500) NULL,
	[DiaChi] [nchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](10) NULL,
	[TenNhanVien] [nchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[SDT] [nchar](10) NULL,
	[DiaChi] [nchar](30) NULL,
	[ChucVu] [nchar](20) NULL,
	[AnhDaiDien] [nchar](20) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[MaSize] [nchar](10) NOT NULL,
	[LoaiSize] [nchar](10) NULL,
	[Giá] [money] NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThemDa]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThemDa](
	[MaLuongDa] [nchar](10) NOT NULL,
	[MucDa] [float] NULL,
 CONSTRAINT [PK_ThemDa] PRIMARY KEY CLUSTERED 
(
	[MaLuongDa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThemDo]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThemDo](
	[MaTopPing] [nchar](10) NOT NULL,
	[TenLoaiTopPing] [nchar](30) NULL,
	[GiaTopping] [int] NULL,
 CONSTRAINT [PK_ThemDo] PRIMARY KEY CLUSTERED 
(
	[MaTopPing] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/10/2023 2:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UsernName] [nchar](10) NOT NULL,
	[Password] [nchar](10) NULL,
	[LoaiUser] [nchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UsernName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [ThuocTinh]) VALUES (1, N'Thường              ')
INSERT [dbo].[Ban] ([MaBan], [ThuocTinh]) VALUES (2, N'Vip                 ')
SET IDENTITY_INSERT [dbo].[Ban] OFF
GO
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 1, CAST(N'2023-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 1, CAST(N'2023-04-18T16:42:17.233' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 2, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 2, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 2, CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 2, CAST(N'2023-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 2, CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 3, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 3, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 3, CAST(N'2023-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 3, CAST(N'2023-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 3, CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 4, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 4, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 4, CAST(N'2023-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (1, 4, CAST(N'2023-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 1, CAST(N'2023-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 2, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 2, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 2, CAST(N'2023-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 3, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 3, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 3, CAST(N'2023-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 3, CAST(N'2023-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 3, CAST(N'2023-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 4, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 4, CAST(N'2023-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 4, CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (6, 4, CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 1, CAST(N'2023-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 1, CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 1, CAST(N'2023-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 2, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 2, CAST(N'2023-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 2, CAST(N'2023-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 2, CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 3, CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 4, CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 4, CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 4, CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 4, CAST(N'2023-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 4, CAST(N'2023-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[BangLuongNV] ([MaNV], [MACLV], [NgayLam]) VALUES (7, 4, CAST(N'2023-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CaLamViec] ([MaCLV], [TenCLV], [SoGioLV], [TienLuongTheoCa]) VALUES (1, N'Sáng      ', 4, 22000.0000)
INSERT [dbo].[CaLamViec] ([MaCLV], [TenCLV], [SoGioLV], [TienLuongTheoCa]) VALUES (2, N'Trưa      ', 4, 22000.0000)
INSERT [dbo].[CaLamViec] ([MaCLV], [TenCLV], [SoGioLV], [TienLuongTheoCa]) VALUES (3, N'Chiều     ', 4, 22000.0000)
INSERT [dbo].[CaLamViec] ([MaCLV], [TenCLV], [SoGioLV], [TienLuongTheoCa]) VALUES (4, N'Tối       ', 4, 25000.0000)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1, 4, 2, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1, 12, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (2, 5, 2, 35000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (3, 13, 1, 25000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (3, 15, 1, 35000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (3, 17, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (3, 19, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (4, 4, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (4, 19, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (5, 5, 2, 35000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (5, 11, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (5, 12, 1, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (5, 13, 2, 30000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (5, 14, 1, 20000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1002, 13, 2, 20000.0000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1008, 22, 3, 15000.0000, 45000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1010, 24, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1010, 25, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1016, 27, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1017, 28, 50, 20000.0000, 1000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1018, 29, 10, 30000.0000, 300000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1018, 30, 10, 20000.0000, 200000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1019, 31, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1020, 32, 2, 30000.0000, 60000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1021, 33, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1021, 34, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1022, 35, 2, 30000.0000, 60000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1023, 36, 10000, 30000.0000, 300000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1024, 37, 100000, 30000.0000, 3000000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1025, 38, 10000, 30000.0000, 300000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1026, 39, 1000000, 30000.0000, 30000000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1027, 40, 100000, 30000.0000, 3000000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1028, 41, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1031, 43, 100000, 20000.0000, 2000000000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1032, 44, 3, 30000.0000, 90000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1033, 45, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1034, 46, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1038, 47, 2, 30000.0000, 60000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1038, 48, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1038, 49, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1039, 50, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1040, 51, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1041, 52, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1042, 53, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1042, 54, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1042, 55, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1043, 56, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1043, 57, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1043, 58, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1044, 59, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1045, 60, 1, 20000.0000, 20000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1045, 61, 1, 30000.0000, 30000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1045, 62, 2, 20000.0000, 40000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1049, 63, 10, 20000.0000, 200000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaChiTietSP], [SoLuong], [DonGiaBan], [TongTienHD]) VALUES (1049, 64, 5, 20000.0000, 100000.0000)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (1, N'HH01                ', 50000.0000, 2500000.0000, 50)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (1, N'HH02                ', 50000.0000, 1500000.0000, 30)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (1, N'HH03                ', 20000.0000, 600000.0000, 30)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (1, N'HH04                ', 10000.0000, 200000.0000, 20)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (2, N'HH05                ', 40000.0000, 400000.0000, 10)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (2, N'HH06                ', 30000.0000, 150000.0000, 5)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (2, N'HH07                ', 100000.0000, 400000.0000, 4)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (2, N'HH08                ', 20000.0000, 100000.0000, 5)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (2, N'HH09                ', 25000.0000, 2500000.0000, 10)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (2, N'HH10                ', 20000.0000, 60000.0000, 3)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (3, N'HH11                ', 10000.0000, 20000.0000, 2)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (6, N'HH11                ', 10000.0000, 30000.0000, 3)
INSERT [dbo].[ChiTietHoaDonNhap] ([MaHoaDonNhap], [MaHH], [DonGiaNhap], [TongTien], [SoLuongNhap]) VALUES (7, N'HH11                ', 10000.0000, 50000.0000, 5)
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (4, 1, NULL, NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (5, 16, N'Ld2       ', N'TP03      ', N'Sz1       ', NULL, 45000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (6, 15, N'Ld3       ', N'TP04      ', N'Sz2       ', NULL, 50000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (7, 17, N'Ld2       ', N'TP03      ', N'Sz3       ', NULL, 55000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (8, 5, N'Ld1       ', NULL, NULL, NULL, 25000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (9, 4, N'Ld1       ', NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (10, 7, NULL, NULL, N'Sz2       ', NULL, 35000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (11, 12, NULL, NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (12, 17, N'Ld1       ', N'TP03      ', N'Sz3       ', NULL, 50000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (13, 15, N'Ld2       ', N'TP03      ', N'Sz2       ', NULL, 50000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (14, 18, NULL, NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (15, 19, NULL, NULL, NULL, NULL, 25000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (16, 3, N'Ld2       ', NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (17, 21, NULL, NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (18, 2, NULL, NULL, NULL, NULL, 40000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (19, 4, NULL, NULL, NULL, NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (22, 1, N'Ld1       ', N'TP01      ', N'Sz1       ', N'bacxiu.jpg', 15000.0000, 5)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (24, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (25, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (26, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (27, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (28, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (29, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (30, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (31, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (32, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (33, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (34, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (35, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (36, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (37, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (38, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (39, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (40, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (41, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (42, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (43, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (44, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (45, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (46, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (47, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (48, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (49, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (50, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (51, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (52, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (53, 1, N'Ld3       ', N'TP07      ', N'Sz2       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (54, 6, N'Ld2       ', N'TP05      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (55, 5, N'Ld3       ', N'TP05      ', N'Sz2       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (56, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (57, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (58, 5, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (59, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (60, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (61, 2, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 30000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (62, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (63, 1, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [MaLuongDa], [MaTopPing], [MaSize], [HinhAnh], [DonGiaBan], [GiamGia]) VALUES (64, 3, N'Ld3       ', N'TP08      ', N'Sz3       ', NULL, 20000.0000, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (1, N'HH02                ', 0.1)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (1, N'HH03                ', 0.2)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (1, N'HH11                ', 0.1)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (2, N'HH01                ', 0.1)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (2, N'HH04                ', 0.1)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (3, N'HH01                ', 0.1)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (3, N'HH04                ', 0.1)
INSERT [dbo].[CongThucMon] ([MaSP], [MaHH], [SoLuongCanDung]) VALUES (3, N'HH11                ', 0.2)
GO
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (4, N'bacxiu.jpg                                        ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (5, N'trasua-socola.jpg                                 ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (6, N'trasua-matcha.jpg                                 ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (7, N'trasua-vani.jpg                                   ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (8, N'caphesua.jpg                                      ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (9, N'ca phe den.jpg                                    ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (10, N'nuoc-ep-duahau.jpg                                ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (11, N'Sinh-to-xoai.jpg                                  ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (12, N'trasua-vani.jpg                                   ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (13, N'trasua-matcha.jpg                                 ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (14, N'Bánh Tiramisu.jpg                                 ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (15, N'NULLBánh Cookies.jpg                              ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (16, N'cafedenda-1.jpg                                   ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (17, N'Bánh Mousse cake.jpg                              ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (18, N'cà phê pha phin .jpg                              ')
INSERT [dbo].[dbo.AnhChiTietSp] ([MaChiTietSP], [TenFileAnh]) VALUES (19, N'ca phe den.jpg                                    ')
GO
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (1, N'bacxiu.jpg                                        ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (2, N'cà phê pha phin .jpg                              ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (3, N'cafedenda-1.jpg                                   ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (4, N'ca phe den.jpg                                    ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (5, N'caphesua.jpg                                      ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (6, N'caphecotdua.jpg                                   ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (7, N'nuoc-ep-duahau.jpg                                ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (8, N'nuoc-ep-tao.jpg                                   ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (9, N'nuoc ep oi.jpg                                    ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (10, N'nuoc-ep-vai.jpg                                   ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (11, N'Nước Ép Dứa.jpg                                   ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (12, N'Sinh-to-xoai.jpg                                  ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (13, N'Sinh-to-bo.jpg                                    ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (14, N'Sinh-to-luamach.jpg                               ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (15, N'trasua-matcha.jpg                                 ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (16, N'trasua-socola.jpg                                 ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (17, N'trasua-vani.jpg                                   ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (18, N'Bánh Tiramisu.jpg                                 ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (19, N'Bánh Cookies.jpg                                  ', NULL)
INSERT [dbo].[dbo.AnhSp] ([MaSP], [TenFileAnh], [ViTri]) VALUES (20, N'Bánh  Macaron.jpg                                 ', NULL)
GO
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (1, 1, N'bacxiu.jpg                                        ', N'Bạc Xỉu                       ', 30000.0000, NULL, 20000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (2, 1, N'cà phê pha phin .jpg                              ', N'Cà Phê Pha Phin               ', 40000.0000, NULL, 30000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (3, 1, N'cafedenda-1.jpg                                   ', N'Cà Phê Đen Đá                 ', 30000.0000, NULL, 20000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (4, 1, N'ca phe den.jpg                                    ', N'Cà Phê Đen                    ', 30000.0000, NULL, 20000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (5, 1, N'caphesua.jpg                                      ', N'Cà Phê Sữa                    ', 25000.0000, NULL, 20000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (6, 1, N'caphecotdua.jpg                                   ', N'Cà Phê Cốt Dừa                ', 35000.0000, NULL, 30000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (7, 2, N'nuoc-ep-duahau.jpg                                ', N'Nước Ép Dưa hấu               ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (8, 2, N'nuoc-ep-tao.jpg                                   ', N'Nước Ép Táo                   ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (9, 2, N'nuoc ep oi.jpg                                    ', N'Nước Ép Ổi                    ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (10, 2, N'nuoc-ep-vai.jpg                                   ', N'Nước Ép Vải                   ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (11, 2, N'Nước Ép Dứa.jpg                                   ', N'Nước Ép Dứa                   ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (12, 5, N'Sinh-to-xoai.jpg                                  ', N'Sinh Tố Xoài                  ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (13, 5, N'Sinh-to-bo.jpg                                    ', N'Sinh Tố Bơ                    ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (14, 5, N'Sinh-to-luamach.jpg                               ', N'Sinh Tố Lúa Mạch              ', 20000.0000, NULL, 15000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (15, 3, N'trasua-matcha.jpg                                 ', N'Trà Sữa MatCha                ', 35000.0000, NULL, 30000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (16, 3, N'trasua-socola.jpg                                 ', N'Trà Sữa Socola                ', 35000.0000, NULL, 30000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (17, 3, N'trasua-vani.jpg                                   ', N'Trà Sữa VaNi                  ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (18, 4, N'Bánh Tiramisu.jpg                                 ', N'Bánh Tiramisu                 ', 30000.0000, NULL, 20000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (19, 4, N'Bánh Cookies.jpg                                  ', N'Bánh Cookies                  ', 30000.0000, NULL, 25000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (20, 4, N'Bánh  Macaron.jpg                                 ', N'Bánh  Macaron                 ', 25000.0000, NULL, 20000.0000)
INSERT [dbo].[dbo.DanhMucSp] ([MaSP], [MaLoai], [AnhDaiDien], [TenSP], [GiaBanCaoNhat], [GioiThieuSP], [GiaBanNhoNhat]) VALUES (21, 4, N'Bánh Mousse cake.jpg                              ', N'Bánh Mousse cake              ', 30000.0000, NULL, 25000.0000)
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH01                ', N'Cafe Hạt                      ', 41.199999999999989)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH02                ', N'Cafe xay                      ', 27.7)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH03                ', N'Sữa Đặc                       ', 25.400000000000009)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH04                ', N'Đường                         ', 11.199999999999996)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH05                ', N'Bơ                            ', 10)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH06                ', N'Quả Vải                       ', 5)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH07                ', N'Nước Cốt Dừa                  ', 4)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH08                ', N'Dừa Quả                       ', 5)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH09                ', N'Sữa Tươi                      ', 10)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH10                ', N'Xoài Quả                      ', 3)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SoLuongCon]) VALUES (N'HH11                ', N'Đá                            ', 5.6999999999999993)
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] ON 

INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 9, 4, 1, 0, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (2, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 11, 6, 2, 10000, N'CK        ', N'Khách VIP')
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (3, CAST(N'2023-02-02T00:00:00.000' AS DateTime), 10, 7, 1, 0, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (4, CAST(N'2023-02-05T00:00:00.000' AS DateTime), 12, 4, 1, 0, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (5, CAST(N'2023-02-07T00:00:00.000' AS DateTime), 11, 7, 2, 10000, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1002, CAST(N'2023-02-07T00:00:00.000' AS DateTime), 9, 5, 1, 0, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1003, CAST(N'2023-02-08T00:00:00.000' AS DateTime), 10, 1, 1, 0, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1004, CAST(N'2023-04-11T15:55:00.000' AS DateTime), 15, 5, 2, 3, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1005, CAST(N'2023-04-17T22:51:00.000' AS DateTime), 9, 1, 1, 5, N'CK        ', N'df')
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1006, CAST(N'2023-04-14T10:29:45.803' AS DateTime), 10, 3, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1007, CAST(N'2023-04-14T10:31:28.113' AS DateTime), 10, 3, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1008, CAST(N'2023-04-14T14:40:00.000' AS DateTime), 13, 4, 1, 5, N'CK        ', N'dsfsf')
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1009, CAST(N'2023-04-17T14:17:48.847' AS DateTime), 27, 1, 2, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1010, CAST(N'2023-04-17T14:19:34.867' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1011, CAST(N'2023-04-17T14:38:54.313' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1012, CAST(N'2023-04-17T14:42:03.827' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1013, CAST(N'2023-04-17T14:43:25.953' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1014, CAST(N'2023-04-17T14:45:49.217' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1015, CAST(N'2023-04-17T14:54:35.070' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1016, CAST(N'2023-04-17T15:07:13.060' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1017, CAST(N'2023-04-17T15:07:49.437' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1018, CAST(N'2023-04-17T15:09:10.483' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1019, CAST(N'2023-04-17T15:10:48.573' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1020, CAST(N'2023-04-17T15:14:03.850' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1021, CAST(N'2023-04-17T15:17:57.403' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1022, CAST(N'2023-04-17T15:19:45.340' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1023, CAST(N'2023-04-17T15:31:13.023' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1024, CAST(N'2023-04-17T15:32:58.753' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1025, CAST(N'2023-04-17T15:33:59.643' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1026, CAST(N'2023-04-17T15:35:02.823' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1027, CAST(N'2023-04-17T15:36:42.077' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1028, CAST(N'2023-04-17T15:36:52.673' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1029, CAST(N'2023-04-17T15:38:49.607' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1030, CAST(N'2023-04-17T15:40:23.900' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1031, CAST(N'2023-04-17T15:42:02.547' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1032, CAST(N'2023-04-17T15:43:55.867' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1033, CAST(N'2023-04-17T15:44:16.460' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1034, CAST(N'2023-04-17T15:44:40.853' AS DateTime), 9, 1, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1035, CAST(N'2023-04-17T15:48:46.797' AS DateTime), 9, 1, 1, NULL, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1036, CAST(N'2023-04-17T15:51:05.860' AS DateTime), 9, 1, 1, NULL, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1038, CAST(N'2023-04-17T15:53:21.277' AS DateTime), 9, 1, 1, NULL, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1039, CAST(N'2023-04-17T16:07:15.113' AS DateTime), 10, 3, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1040, CAST(N'2023-04-20T08:25:39.627' AS DateTime), 9, 1, 1, NULL, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1041, CAST(N'2023-04-21T14:01:49.110' AS DateTime), 10, 3, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1042, CAST(N'2023-04-27T11:05:14.907' AS DateTime), 10, 3, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1043, CAST(N'2023-04-27T11:06:31.957' AS DateTime), 27, 4, 2, NULL, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1044, CAST(N'2023-05-04T11:17:14.997' AS DateTime), 10, 3, 1, NULL, N'CK        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1045, CAST(N'2023-05-04T11:28:01.320' AS DateTime), 9, 1, 1, NULL, N'TM        ', NULL)
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [NgayLap], [MaKH], [MaNV], [MaBan], [GiamGia], [PhuongThucTT], [GhiChu]) VALUES (1049, CAST(N'2023-05-04T13:45:22.167' AS DateTime), 9, 1, 1, NULL, N'TM        ', NULL)
SET IDENTITY_INSERT [dbo].[HoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 

INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (1, N'NCC01               ', 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (2, N'NCC01               ', 1, CAST(N'2022-12-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (3, N'NCC02               ', 2, CAST(N'2023-04-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (4, N'NCC02               ', 2, CAST(N'2023-03-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (5, N'NCC03               ', 3, CAST(N'2023-04-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (6, N'NCC01               ', 1, CAST(N'2023-04-21T14:00:13.003' AS DateTime), N'Không')
INSERT [dbo].[HoaDonNhap] ([MaHoaDonNhap], [MaNCC], [MaNV], [NgayNhapHang], [GhiChu]) VALUES (7, N'NCC01               ', 1, CAST(N'2023-05-04T13:47:32.773' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (9, N'haizln    ', N'Đặng Xuân Hải                 ', CAST(N'2002-12-03T00:00:00.000' AS DateTime), N'012347854 ', N'Nam Định                      ', 0, N'Không')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (10, N'chiendz   ', N'Phạm Minh Chiến               ', CAST(N'2000-08-16T00:00:00.000' AS DateTime), N'014596357 ', N'Thanh Hóa                     ', 4, N'Không')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (11, N'vietvui   ', N'Bùi Hoàng Việt                ', CAST(N'1999-03-23T00:00:00.000' AS DateTime), N'015935798 ', N'Bắc Giang                     ', 8, N'VIP')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (12, N'sondamsau ', N'Lê Sơn                        ', CAST(N'1999-03-23T00:00:00.000' AS DateTime), N'026487664 ', N'Quảng Ninh                    ', 2, N'Không')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (13, N'hungho    ', N'Nguyễn Thân Hùng              ', CAST(N'2001-08-11T00:00:00.000' AS DateTime), N'0947187126', N'Thái Bình                     ', 7, N'VIP')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (14, N'locreus   ', N'Đoàn Đình Lộc                 ', CAST(N'1998-03-07T00:00:00.000' AS DateTime), N'0123475672', N'Quảng Ninh                    ', 0, N'Nhân viên ')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (15, N'vumaychem ', N'Phạm Thiên Vũ                 ', CAST(N'1996-02-04T00:00:00.000' AS DateTime), N'0547862457', N'Hà Nội                        ', 0, N'Quản Lí')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (21, N'datloto   ', N'Đào Văn Đạt                   ', CAST(N'2000-02-06T00:00:00.000' AS DateTime), N'0369258645', N'Ninh Bình                     ', 0, N'Nhân viên')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (22, N'thanhdong ', N'Đặng Tuấn Thành               ', CAST(N'2002-09-22T00:00:00.000' AS DateTime), N'0926336996', N'Hà Tĩnh                       ', 0, N'Nhân viên bưng bê')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (24, N'khaibluff ', N'Nguyễn Thế Khải               ', CAST(N'2000-07-01T00:00:00.000' AS DateTime), N'0365246895', N'Bắc Giang                     ', 0, N'Nhân viên pha chế')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (25, N'thanhhut  ', N'Nguyễn Tuấn Thành             ', CAST(N'2003-07-17T00:00:00.000' AS DateTime), N'0148647985', N'Hải Phòng                     ', 0, N'Nhân viên')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (26, N'datmaydap ', N'Đỗ Văn Đạt                    ', CAST(N'2000-04-20T00:00:00.000' AS DateTime), N'0243684957', N'Hà Nội                        ', 0, N'Nhân viên')
INSERT [dbo].[KhachHang] ([MaKH], [UserName], [TenKH], [NgaySinh], [SDT], [DiaChi], [DiemTL], [GhiChu]) VALUES (27, N'Không     ', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1, N'Cà Phê    ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (2, N'Nước Ép   ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (3, N'Trà Sữa   ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (4, N'Bánh Ngọt ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (5, N'Sinh Tố   ')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [GhiChu], [DiaChi]) VALUES (N'NCC01               ', N'Thái Bình                                         ', NULL, N'109 Quan Nhân Thanh Xuân                          ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [GhiChu], [DiaChi]) VALUES (N'NCC02               ', N'Lan Anh                                           ', NULL, N'277 Xã Đàn                                        ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [GhiChu], [DiaChi]) VALUES (N'NCC03               ', N'Cây Đa                                            ', NULL, N'230 Trường Trinh                                  ')
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (1, N'khaibluff ', N'Nguyễn Thế Khải               ', CAST(N'2000-07-01T00:00:00.000' AS DateTime), N'0365246895', N'Bắc Giang                     ', N'CV2                 ', NULL, N'Nhân viên pha chế')
INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (2, N'thanhdong ', N'Đặng Tuấn Thành               ', CAST(N'2002-09-22T00:00:00.000' AS DateTime), N'0926336996', N'Hà Tĩnh                       ', N'CV3                 ', NULL, N'Nhân viên bưng bê')
INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (3, N'vumaychem ', N'Phạm Thiên Vũ                 ', CAST(N'1996-02-04T00:00:00.000' AS DateTime), N'0547862457', N'Hà Nội                        ', N'CV1                 ', NULL, N'Quản Lí')
INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (4, N'datloto   ', N'Đào Văn Đạt                   ', CAST(N'2000-02-06T00:00:00.000' AS DateTime), N'0369258645', N'Ninh Bình                     ', N'CV                  ', N'daovandat.png       ', N'Nhân viên')
INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (5, N'thanhhut  ', N'Nguyễn Tuấn Thành             ', CAST(N'2003-07-17T00:00:00.000' AS DateTime), N'0148647985', N'Hải Phòng                     ', N'CV                  ', N'anhthanh.jpg        ', N'Nhân viên')
INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (6, N'locreus   ', N'Đoàn Đình Lộc                 ', CAST(N'1998-03-07T00:00:00.000' AS DateTime), N'0123475672', N'Quảng Ninh                    ', N'CV                  ', NULL, N'Nhân viên')
INSERT [dbo].[NhanVien] ([MaNV], [Username], [TenNhanVien], [NgaySinh], [SDT], [DiaChi], [ChucVu], [AnhDaiDien], [GhiChu]) VALUES (7, N'datmaydap ', N'Đỗ Văn Đạt                    ', CAST(N'2000-04-20T00:00:00.000' AS DateTime), N'0243684957', N'Hà Nội                        ', N'CV                  ', NULL, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
INSERT [dbo].[Size] ([MaSize], [LoaiSize], [Giá]) VALUES (N'Sz1       ', N'S         ', 5000.0000)
INSERT [dbo].[Size] ([MaSize], [LoaiSize], [Giá]) VALUES (N'Sz2       ', N'M         ', 1000.0000)
INSERT [dbo].[Size] ([MaSize], [LoaiSize], [Giá]) VALUES (N'Sz3       ', N'L         ', 15000.0000)
GO
INSERT [dbo].[ThemDa] ([MaLuongDa], [MucDa]) VALUES (N'Ld1       ', 40)
INSERT [dbo].[ThemDa] ([MaLuongDa], [MucDa]) VALUES (N'Ld2       ', 50)
INSERT [dbo].[ThemDa] ([MaLuongDa], [MucDa]) VALUES (N'Ld3       ', 60)
GO
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP01      ', N'Dừa Khô                       ', 5000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP02      ', N'Nho Khô                       ', 5000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP03      ', N'Trân Châu trắng               ', 5000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP04      ', N'Trân Châu Đen                 ', 5000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP05      ', N'Nha Đam                       ', 3000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP06      ', N'Thạch Dừa                     ', 5000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP07      ', N'Plan                          ', 7000)
INSERT [dbo].[ThemDo] ([MaTopPing], [TenLoaiTopPing], [GiaTopping]) VALUES (N'TP08      ', N'Không                         ', NULL)
GO
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'Admin     ', N'123       ', N'NV        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'chiendz   ', N'123       ', N'KH        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'datloto   ', N'123       ', N'NV        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'datmaydap ', N'123       ', N'NV        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'haizln    ', N'123       ', N'KH        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'hungho    ', N'123       ', N'KH        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'khaibluff ', N'123       ', N'NVPC      ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'Không     ', N'Không     ', N'Null      ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'locreus   ', N'123       ', N'NV        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'sondamsau ', N'123       ', N'KH        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'thanhdong ', N'123       ', N'NVBB      ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'thanhhut  ', N'123       ', N'NV        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'tiendat   ', N'123       ', N'QL        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'vietvui   ', N'123       ', N'KH        ')
INSERT [dbo].[User] ([UsernName], [Password], [LoaiUser]) VALUES (N'vumaychem ', N'123       ', N'QL        ')
GO
ALTER TABLE [dbo].[BangLuongNV]  WITH CHECK ADD  CONSTRAINT [FK_BangLuongNV_CaLamViec] FOREIGN KEY([MACLV])
REFERENCES [dbo].[CaLamViec] ([MaCLV])
GO
ALTER TABLE [dbo].[BangLuongNV] CHECK CONSTRAINT [FK_BangLuongNV_CaLamViec]
GO
ALTER TABLE [dbo].[BangLuongNV]  WITH CHECK ADD  CONSTRAINT [FK_BangLuongNV_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[BangLuongNV] CHECK CONSTRAINT [FK_BangLuongNV_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_ChiTietSanPham] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[ChiTietSanPham] ([MaChiTietSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_ChiTietSanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDonBan] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDonBan] ([MaHoaDon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDonBan]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap] FOREIGN KEY([MaHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDonNhap])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_dbo.DanhMucSp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[dbo.DanhMucSp] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_dbo.DanhMucSp]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_Size] FOREIGN KEY([MaSize])
REFERENCES [dbo].[Size] ([MaSize])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_Size]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_ThemDa] FOREIGN KEY([MaLuongDa])
REFERENCES [dbo].[ThemDa] ([MaLuongDa])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_ThemDa]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_ThemDo] FOREIGN KEY([MaTopPing])
REFERENCES [dbo].[ThemDo] ([MaTopPing])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_ThemDo]
GO
ALTER TABLE [dbo].[CongThucMon]  WITH CHECK ADD  CONSTRAINT [FK_CongThucMon_dbo.DanhMucSp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[dbo.DanhMucSp] ([MaSP])
GO
ALTER TABLE [dbo].[CongThucMon] CHECK CONSTRAINT [FK_CongThucMon_dbo.DanhMucSp]
GO
ALTER TABLE [dbo].[CongThucMon]  WITH CHECK ADD  CONSTRAINT [FK_CongThucMon_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[CongThucMon] CHECK CONSTRAINT [FK_CongThucMon_HangHoa]
GO
ALTER TABLE [dbo].[dbo.AnhChiTietSp]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AnhChiTietSp_ChiTietSanPham] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[ChiTietSanPham] ([MaChiTietSP])
GO
ALTER TABLE [dbo].[dbo.AnhChiTietSp] CHECK CONSTRAINT [FK_dbo.AnhChiTietSp_ChiTietSanPham]
GO
ALTER TABLE [dbo].[dbo.AnhSp]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AnhSp_dbo.DanhMucSp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[dbo.DanhMucSp] ([MaSP])
GO
ALTER TABLE [dbo].[dbo.AnhSp] CHECK CONSTRAINT [FK_dbo.AnhSp_dbo.DanhMucSp]
GO
ALTER TABLE [dbo].[dbo.DanhMucSp]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DanhMucSp_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[dbo.DanhMucSp] CHECK CONSTRAINT [FK_dbo.DanhMucSp_LoaiSP]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_Ban] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_Ban]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhanVien]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UsernName])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_User]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([UsernName])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_User]
GO

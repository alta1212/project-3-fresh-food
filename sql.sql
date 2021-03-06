/****** Object:  Database [SHOPFRESHFOOD]    Script Date: 07-01-2021 22:10:22 ******/
CREATE DATABASE [SHOPFRESHFOOD]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [SHOPFRESHFOOD] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET  MULTI_USER 
GO
ALTER DATABASE [SHOPFRESHFOOD] SET ENCRYPTION ON
GO
ALTER DATABASE [SHOPFRESHFOOD] SET QUERY_STORE = ON
GO
ALTER DATABASE [SHOPFRESHFOOD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[GIA_BAN]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIA_BAN](
	[MaGiaBan] [nvarchar](20) NOT NULL,
	[MaSanPham] [nvarchar](20) NULL,
	[GiaBan] [int] NULL,
	[NgayApDung] [date] NOT NULL,
	[NgayKetThuc] [date] NULL,
 CONSTRAINT [PK_GIA_BAN] PRIMARY KEY CLUSTERED 
(
	[MaGiaBan] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIA_GIAM]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIA_GIAM](
	[MaGiaGiam] [nvarchar](20) NOT NULL,
	[MaSanPham] [nvarchar](20) NULL,
	[PhanTram] [tinyint] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
 CONSTRAINT [PK_GIA_GIAM] PRIMARY KEY CLUSTERED 
(
	[MaGiaGiam] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAN_PHAM]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAN_PHAM](
	[MaLoaiSanPham] [nvarchar](20) NULL,
	[MaSanPham] [nvarchar](20) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[SoLuongNhap] [int] NULL,
	[SoLuongBan] [int] NULL,
	[SoLuongCon] [int] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](500) NULL,
	[Stars] [tinyint] NULL,
 CONSTRAINT [PK_SAN_PHAM] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductAndPrice]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  View [dbo].[ProductAndPrice] As
Select SP.MaSanPham,SP.TenSanPham,SP.HinhAnh,SP.MoTa,SP.Stars,SP.DonViTinh,GB.GiaBan
	From dbo.San_Pham SP Inner Join dbo.Gia_Ban GB
		On SP.MaSanPham = GB.MaSanPham
			Where SP.MaSanPham In 
				(
				Select SP.MaSanPham
					From dbo.San_Pham SP Inner Join dbo.Gia_Giam GG
						On SP.MaSanPham = GG.MaSanPham
				)
GO
/****** Object:  Table [dbo].[LOAI_SAN_PHAM]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI_SAN_PHAM](
	[MaLoaiSanPham] [nvarchar](20) NOT NULL,
	[TenLoaiSanPham] [nvarchar](100) NULL,
	[MoTa] [nvarchar](350) NULL,
 CONSTRAINT [PK_LOAI_SAN_PHAM] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductAndAllPriceTest]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  View [dbo].[ProductAndAllPriceTest] As
	Select SP.*,GB.GiaBan,lsp.TenLoaiSanPham
		From dbo.San_Pham SP Inner Join dbo.Gia_Ban GB 
			On SP.MaSanPham = GB.MaSanPham inner join LOAI_SAN_PHAM lsp on sp.MaLoaiSanPham=lsp.MaLoaiSanPham
GO
/****** Object:  View [dbo].[ProductAndAllPriceDiscountTest]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[ProductAndAllPriceDiscountTest] As
	Select Top(6) PP.MaSanPham, PP.TenSanPham, PP.HinhAnh, PP.MoTa, PP.Stars, PP.DonViTinh, PP.GiaBan,PP.GiaBan- PP.GiaBan / 100 * GG.PhanTram as N'Tiền giảm',GG.PhanTram,GG.NgayBatDau,GG.NgayKetThuc
		        From ProductAndPrice PP Inner Join dbo.Gia_Giam GG
			        On PP.MaSanPham = GG.MaSanPham 
						Where GG.NgayBatDau < GETDATE() And GG.NgayKetThuc >GETDATE()
GO
/****** Object:  Table [dbo].[BAI_VIET_]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAI_VIET_](
	[MaBaiViet] [nvarchar](20) NOT NULL,
	[MaNhanVien] [nvarchar](20) NULL,
	[TieuDe] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThoiGian] [datetime] NULL,
	[Hinhanh] [varchar](50) NULL,
 CONSTRAINT [PK_BAI_VIET_] PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHI_TIET_DON_HANG]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHI_TIET_DON_HANG](
	[MaChiTietDonHang] [nvarchar](100) NOT NULL,
	[MaSanPham] [nvarchar](20) NULL,
	[MaDonHang] [nvarchar](100) NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [int] NULL,
	[GiaBan] [int] NULL,
 CONSTRAINT [PK_CHI_TIET_DON_HANG] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHI_TIET_GIO_HANG]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHI_TIET_GIO_HANG](
	[MaChITietGioHang] [nvarchar](50) NOT NULL,
	[MaSanPham] [nvarchar](20) NOT NULL,
	[MaGioHang] [nvarchar](40) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_CHI_TIET_GIO_HANG] PRIMARY KEY CLUSTERED 
(
	[MaChITietGioHang] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHI_TIET_HOA_DON_NHAP_HANG]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHI_TIET_HOA_DON_NHAP_HANG](
	[MaSanPham] [nvarchar](20) NULL,
	[MaHoaDonNhap] [nvarchar](20) NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [int] NULL,
	[ThanhTien] [int] NULL,
	[MaChiTietHoaDon] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CHI_TIET_HOA_DON_NHAP_HANG] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHIET_KHAU]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHIET_KHAU](
	[MaChietKhau] [nvarchar](20) NOT NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[PhanTram] [tinyint] NULL,
	[SoTienToiThieu] [int] NULL,
	[SoTienToiDa] [nchar](10) NULL,
	[hinhAnh] [nvarchar](100) NULL,
 CONSTRAINT [PK_CHIET_KHAU] PRIMARY KEY CLUSTERED 
(
	[MaChietKhau] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DON_HANG]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DON_HANG](
	[MaDonHang] [nvarchar](100) NOT NULL,
	[MaKhachHang] [nvarchar](100) NULL,
	[MaNhanVien] [nvarchar](20) NULL,
	[TrangThai] [tinyint] NULL,
	[TongTien] [int] NULL,
	[NgayMua] [datetime] NULL,
	[NgayXacThuc] [datetime] NULL,
	[SoDienThoai] [nvarchar](14) NULL,
	[DiaChi] [nvarchar](500) NULL,
 CONSTRAINT [PK_DON_HANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FEED_BACK]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FEED_BACK](
	[MaFeedBack] [nvarchar](20) NOT NULL,
	[MaSanPham] [nvarchar](20) NULL,
	[MaKhachHang] [nvarchar](100) NULL,
	[BinhLuan] [nvarchar](200) NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[NgayBinhLuan] [datetime] NULL,
	[Stars] [float] NULL,
 CONSTRAINT [PK_FEED_BACK] PRIMARY KEY CLUSTERED 
(
	[MaFeedBack] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIO_HANG_]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIO_HANG_](
	[MaGioHang] [nvarchar](40) NOT NULL,
	[NgayMua] [date] NULL,
 CONSTRAINT [PK_GIO_HANG_] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOA_DON_NHAP_HANG]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOA_DON_NHAP_HANG](
	[MaHoaDonNhap] [nvarchar](20) NOT NULL,
	[MaNhaCungCap] [nvarchar](20) NULL,
	[NgayNhap] [datetime] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_HOA_DON_NHAP_HANG] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[MaKhachHang] [nvarchar](100) NOT NULL,
	[TaiKhoan] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](30) NULL,
	[NgayTao] [datetime] NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](12) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[IDFaceBook] [nvarchar](200) NULL,
	[MaGioHang] [nvarchar](40) NULL,
	[MaFeedBack] [nvarchar](20) NULL,
	[HinhAnh] [nvarchar](200) NULL,
	[VerificationCode] [nvarchar](50) NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAI_NHAN_VIEN_]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI_NHAN_VIEN_](
	[MaLoaiNhanVien] [nvarchar](20) NOT NULL,
	[TenLoaiNhanVien] [nvarchar](100) NULL,
	[MoTa] [nvarchar](150) NULL,
 CONSTRAINT [PK_LOAI_NHAN_VIEN_] PRIMARY KEY CLUSTERED 
(
	[MaLoaiNhanVien] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHA_CUNG_CAP]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHA_CUNG_CAP](
	[MaNhaCungCap] [nvarchar](20) NOT NULL,
	[TenNhaCungCap] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](14) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHA_CUNG_CAP] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN_]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN_](
	[MaNhanVien] [nvarchar](20) NOT NULL,
	[TenNhanVien] [nvarchar](100) NULL,
	[MaLoaiNhanVien] [nvarchar](20) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgaySinh] [date] NULL,
	[NgayVaoLam] [date] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](14) NULL,
	[Email] [nvarchar](100) NULL,
	[matKhau] [nvarchar](50) NULL,
	[HinhAnh] [varchar](50) NULL,
	[confirmationCode] [varchar](20) NULL,
 CONSTRAINT [PK_NHAN_VIEN_] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 07-01-2021 22:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV001', N'NV001', N'Lixco hợp tác cùng C.P Việt Nam tổ chức chương trình tri ân ngày 20/10', N'Cửa hàng CP Fresh Mart đa dạng các sản phẩm cho người tiêu dùng thoải mái lựa chọn như: Thịt heo tươi, thịt gà tươi, thịt cấp đông và thực phẩm chế biến từ thịt heo, gà, thủy sản, rau củ quả organic được sản xuất theo quy trình 3F khép kín từ con giống, trang trại chăn nuôi đến nhà máy chế biến.

Để phục vụ tốt nhất nhu cầu của khách hàng, trong thời gian tới, CP Fresh Mart sẽ phát triển các kênh bán hàng và giao hàng online.

Chị Ngọc Anh (Tân Bình, TP HCM) chia sẻ: "Do gần nhà thấy CP Fresh Mart có treo quảng cáo chương trình khuyến mãi nên tôi cũng tò mò vào thử. Nhưng quả thật, ở đây có rất nhiều các sản phẩm cho tôi có thể lựa chọn cho món ăn hàng ngày, thêm vào đó, việc tặng gel rửa tay cũng rất hữu ích và thiết thực vì vẫn đang trong giai đoạn phòng, chống dịch Covid-19".

Về phía Lixco, ngoài chương trình tri ân ngày 20/10 lần này phối hợp cùng với C.P. Việt Nam, trước đó, Lixco cũng liên tục đẩy mạnh các hoạt động cộng đồng, những chương trình ý nghĩa để phòng chống dịch bệnh Covid-19. Tiêu biểu, vào dịp tháng 7 vừa qua, Lixco đã trao tặng hơn 2.000 lít sản phẩm kháng khuẩn đến Đà Nẵng, Quảng Nam và Quảng Ngãi.', CAST(N'2020-10-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV002', N'NV001', N'Giảm một số mức thu phí an toàn vệ sinh thực phẩm', N'Theo đó, phí thẩm định điều kiện cơ sở kiểm nghiệm, tổ chức chứng nhận hợp quy, cơ quan kiểm tra nhà nước về thực phẩm nhập khẩu khi đánh giá lần đầu, đánh giá mở rộng được giảm từ mức 32 triệu đồng/lần/đơn vị xuống mức 28,5 triệu đồng; trường hợp đánh giá lại thì phí giảm từ 22,5 triệu đồng xuống còn 20,5 triệu đồng.', CAST(N'2020-11-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV003', N'NV001', N'Hà Nội: Sản phẩm xanh, thực phẩm sạch sẽ được đưa đến người tiêu dùng', N'Đây là hoạt động này nằm trong chuỗi sự kiến của Chương trình ‘Vì Môi trường xanh quốc gia năm 2018". Chương trình bao gồm: Khu trưng bày, quảng bá, giới thiệu các mô hình trải nghiệm xanh, sản phẩm sạch, an toàn công nghệ sinh học, các ứng dụng công nghệ 4.0 gắn với bảo vệ môi trường, bảo vệ sức khỏe cộng đồng.

Đồng thời có gần 90 gian hàng trưng bày, giới thiệu đặc sản từ các vùng, miền trên cả nước với mục đích đưa sản phẩm xanh đến với người tiêu dùng Thủ đô và bạn bè quốc tế.

Sự kiện còn nhằm đẩy mạnh tuyên truyền về lợi ích của các sản phẩm xanh, chất lượng và giá cả cạnh tranh trên thị trường của các sản phẩm xanh cũng như lợi ích thiết thực trong bảo vệ môi trường đến cộng đồng, người tiêu dùng, người sản xuất để thu hút lực lượng tiêu thụ sản phẩm xanh và nâng cao nhận thức về tiêu dùng xanh. Đồng thời tạo mối quan hệ chặt chẽ giữa nhà sản xuất xanh, sản phẩm xanh và người “tiêu dùng xanh”.

Các sản phẩm tham gia ngày hội đều là những đặc sản của các vùng, miền được quy tụ như: Nước mắm Phan Thiết; cà phê hạt và đặc sản Buôn Ma Thuột; đặc sản nem chua xứ Thanh; gạo tám Điện Biên; hành, tỏi Lý Sơn; chè Thái Nguyên; cam Cao Phong; cốm Làng Vòng…', CAST(N'2020-10-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV004', N'NV002', N'Sự thật về “Ăn Sạch” !', N'1. Ăn sạch là gì?
Ăn sạch là một khái niệm về  chế độ ăn kiêng, theo quan điểm từng người sẽ có sự khác nhau. Trong đó có một số người tránh thực phẩm tinh chế và chế biến. Có những người tránh  thành phần nhân tạo, chẳng hạn như chất bảo quản và phụ gia nhất định. Thay vào đó, mục tiêu là ăn toàn bộ thực phẩm chưa qua quá trình chế biến và gần với trạng thái tự nhiên nhất.

Ví dụ, một số người có chế độ ăn sạch từ chối ăn thực phẩm đã sử dụng hormone, kháng sinh và thuốc trừ sâu. Trong khi một người khác có thể chọn không ăn thực phẩm đóng gói trong hộp hoặc lọ.

2. Lợi ích của việc ăn sạch
Chế độ ăn sạch đem lại nhiều lợi ích sức khỏe. Chúng tăng cường năng lượng, giúp da sáng và giảm cân.

Ăn sạch giúp kiểm soát lượng năng lượng của cơ thể. Tránh tình trạng thèm ăn các thực phẩm chế biến sẵn, không có dinh dưỡng – thứ mà khiến cơ thể luôn cảm thấy đói và mất kiểm soát.

Ăn sạch chắc chắn là một cách, nhưng không phải là cách duy nhất để đạt được sức khỏe tốt hơn. Hầu hết những người ăn chế độ ăn sạch đều ăn một chế độ ăn uống lành mạnh mà không có chất phụ gia nhân tạo.

3. Những sai lầm về ăn sạch
– Sai lầm: Ăn sạch luôn tốt cho sức khỏe của bạn
Sự thật: Ăn sạch không có nghĩa là phương pháp ăn tốt nhất cho sức khỏe của bạn.

Một số người luôn tìm kiếm những thực phẩm sạch nhất. Có những người nếu họ ăn thứ gì đó mà họ không tin là sạch, họ sẽ từ bỏ. Điều này dẫn đến họ bỏ lỡ nhiều loại thực phẩm tốt cho sức khỏe.

– Sai lầm: Về một số thực phẩm bẩn
Sự thật: Thực phẩm có chất phụ gia không có nghĩa là chúng không lành mạnh.

Một số người có chế độ ăn sạch từ chối ăn bất kỳ loại thực phẩm nào có chứa chất phụ gia. Vì họ tin rằng thực phẩm không ở trạng thái tự nhiên, tinh khiết nhất. Tuy nhiên, có một số phụ gia thực phẩm có lợi.

Ví dụ bao gồm vitamin D có thể được thêm vào sữa để tăng cường xương hoặc sắt thành nước cam. Mặc dù những thực phẩm này có thể không thuần túy theo nghĩa đen. Nhưng chúng có thể giúp một người đạt được nhu cầu dinh dưỡng hàng ngày.

Tuy nhiên, một số chất phụ gia không có lợi và bẩn. Ví dụ là chất béo chuyển hóa, được thêm vào thực phẩm để kéo dài thời hạn sử dụng. Chất béo chuyển hóa được cho là làm tăng đáng kể mức cholesterol của một người. Điều này có thể dẫn đến các vấn đề với sức khỏe tim mạch.', CAST(N'2020-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV005', N'NV003', N'Liên tiếp bắt giữ thực phẩm “bẩn”: Nỗi lo về an toàn thực phẩm cuối năm
', N'Thực trạng này đã gióng lên nỗi lo về ATTP, nhất là vào thời điểm cuối năm, Tết Nguyên đán đang đến gần và nhu cầu tiêu thụ thực phẩm của người dân đang gia tăng...

Heo bệnh, nầm hôi thối, chim sẻ không nguồn gốc được đưa lên bàn nhậu nếu vận chuyển trót lọtNgày 20/12, Ban Quản lý ATTP (TP. Hồ Chí Minh) cho biết, vừa phát hiện và kịp thời ngăn chặn một vụ vận chuyển heo không đảm bảo chất lượng vào thành phố tiêu thụ.

Theo đó, qua công tác kiểm tra và giám sát, Đội Quản lý ATTP số 9 thuộc Ban Quản lý ATTP phát hiện chiếc xe tải mang biển kiểm soát 51D-24858 vận chuyển thịt heo đã được giết mổ, phân mảnh (khoảng 40 con heo) có những dấu hiệu bất thường.

Tất cả viền móng chân của heo đều có mụn nước đã vỡ gây viêm loét, các móng chân bị bong tróc, không còn bám chặt vào bàn chân. Ngoài ra, trên thịt heo còn xuất hiện các hạch sưng to, sung huyết, xuất huyết. Bước đầu đấu tranh, người vận chuyển lô hàng khai nhận, số thịt heo trên có nguồn gốc từ tỉnh Long An. Ban Quản lý an toàn thực phẩm đã lập biên bản toàn bộ lô thịt heo nói trên, tiến hành tiêu hủy theo quy định.', CAST(N'2020-10-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV006', N'NV001', N'Rau củ sạch', N'Đời sống mọi người ngày càng được nâng cao do đó nhu cầu về sử dụng thực phẩm sạch, đảm bảo sức khỏe đời sống là vấn đề được quan tâm hàng đầu hiện nay. Nắm bắt được mong muốn đó, Nông Sản Dũng Hà hoạt động với mục tiêu mang đến cho người dùng Việt một thương hiệu uy tín, an toàn khi lựa chọn và tìm mua rau củ sạch tại Hà Nội.

Cam kết cung cấp rau củ sạch 100%
Chúng tôi luôn tuyệt đối tuân thủ các nguyên tắc đảm bảo chất lượng và nguồn gốc xuất xứ về thực phẩm. Bạn hoàn toàn yên tâm khi sản phẩm của chúng tôi được nhập từ cơ sở trồng rau sạch uy tín, có giấy phép chứng nhận an toàn từ cơ quan Y tế có thẩm quyền. Nông sản Dũng Hà cam kết không sử dụng bất kì thành phần hóa chất nào trong quá trình bảo quản với mục đích cung cấp nguồn rau củ quả tốt nhất cho sức khỏe người dùng. Chúng tôi cung cấp đa dạng các mặt hàng rau củ sạch Đà Lạt, rau củ sạch Hà Nội, các loại rau sạch vùng miền khác. Và đặc biệt hơn chúng tôi cung cấp các loại hạt giống rau sạch, hạt giống hoa. Nhằm mang tới tay người tiêu dùng thực phẩm rau củ đạt chất lượng cao nhất nên từ khâu thu mua, đóng gói và bảo quản luôn đạt chuẩn nhằm giúp rau củ luôn được tươi mới.

Địa chỉ cung cấp rau củ sạch uy tín tại Hà Nội
Nông sản Dũng Hà là địa chỉ uy tín chuyên cung cấp các loại rau củ sạch chất lượng, uy tín được nhiều người tin dùng trong suốt thời gian qua. Những sản phẩm bạn chọn sẽ tới tay trong thời gian ngắn nhất sau khi đặt hàng mang đến cho gia đình Việt những bữa ăn đảm bảo vệ sinh, an toàn và ngon miệng.

Chúng tôi công ty TNHH Nông Sản Dũng Hà là đơn vị chuyên cung cấp hệ thống rau củ sạch chất lượng cao, đảm bảo an toàn đến với gia đình Việt với giá cả phù hợp nhất trên thị trường hiện nay. Mọi dòng sản phẩm cung cấp rau củ sạch của chúng tôi hiện được phân phối chính thức tại :

Nhà số A11, Ngõ 100 đường Trung Kính-Quận Cầu Giấy-Hà Nội

Địa chỉ trang web: www.nongsandungha.com', CAST(N'2020-10-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[BAI_VIET_] ([MaBaiViet], [MaNhanVien], [TieuDe], [NoiDung], [ThoiGian], [Hinhanh]) VALUES (N'BV007', N'NV002', N'Tưng bừng khai trương', N'Chào mừng người anh em thiện lành  - Hoa quả nhập khẩu Sarimi khai trương cửa hàng mới . Hệ thống hoa quả nhập khẩu Luôn Tươi Sạch & Sarimi xin gửi tới quý khách hàng chương trình giảm giá SIÊU SHOCK  - SIÊU KHUYẾN MẠI chỉ có tại 6A Nguyễn Khánh Toàn :

Nho đỏ Long Crimson giá chỉ còn : 119.000đ /kg

Táo Ambrosia Canada size 100 giá chỉ còn 50.000đ /kg

Táo Envy Mỹ size 60 giá chỉ còn 129.000đ /kg

 Chị em qua cửa hàng mua trực tiếp còn rất nhiều các mặt hàng tươi ngon với giá cực tốt , tự tay mình chọn khay hàng ưng ý nhất . Ngoài ra chị em còn được tặng ngay voucher giảm giá 50.000 cho đơn hàng trị giá từ 500.000đ (voucher áp dụng cho đơn hàng mua sau ) .

 Điều kiện áp dụng ưu đãi :

Chương trình áp dụng từ ngày : Thứ 6 - 12/04/2019

 Áp dụng khách hàng qua mua trực tiếp và đặt hàng Online . Đồng phí ship trong bán kính 5km tính từ cửa hàng gần nhất là 25.000 đ, ngoài 5km có phát sinh phí ship.

Inbox ngay để được hỗ trợ : m.me/vfoodfruit.

Hotline: 0438 29 09 99 - 0944 28 38 86', CAST(N'2020-11-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-080231_CTDH001', N'SP015', N'DH1086595548477469mkh29122020-080231', 1, 42750, 42750)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-080231_CTDH002', N'SP043', N'DH1086595548477469mkh29122020-080231', 1, 42750, 42750)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-081846_CTDH001', N'SP005', N'DH1086595548477469mkh29122020-081846', 2, 144000, 72000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-081846_CTDH002', N'SP016', N'DH1086595548477469mkh29122020-081846', 2, 144000, 72000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-081846_CTDH003', N'SP075', N'DH1086595548477469mkh29122020-081846', 1, 72000, 72000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-122848_CTDH001', N'SP044', N'DH1086595548477469mkh29122020-122848', 6, 288000, 48000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-123211_CTDH001', N'SP005', N'DH1086595548477469mkh29122020-123211', 1, 63000, 63000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-123211_CTDH002', N'SP007', N'DH1086595548477469mkh29122020-123211', 1, 63000, 63000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH1086595548477469mkh29122020-123211_CTDH003', N'SP012', N'DH1086595548477469mkh29122020-123211', 3, 189000, 63000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH887692702034417mkh29122020-082848_CTDH001', N'SP062', N'DH887692702034417mkh29122020-082848', 6, 153900, 25650)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH887692702034417mkh29122020-105238_CTDH001', N'SP021', N'DH887692702034417mkh29122020-105238', 1, 19000, 19000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH887692702034417mkh29122020-105238_CTDH002', N'SP022', N'DH887692702034417mkh29122020-105238', 1, 19000, 19000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DH887692702034417mkh29122020-105238_CTDH003', N'SP028', N'DH887692702034417mkh29122020-105238', 1, 19000, 19000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH001', N'SP003', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH002', N'SP005', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH003', N'SP024', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH004', N'SP025', N'DHcvbnmmkh25122020-115012', 6, 189000, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH005', N'SP029', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH006', N'SP034', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH007', N'SP037', N'DHcvbnmmkh25122020-115012', 2, 63000, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH008', N'SP062', N'DHcvbnmmkh25122020-115012', 5, 157500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH009', N'SP069', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH010', N'SP079', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh25122020-115012_CTDH011', N'SP079', N'DHcvbnmmkh25122020-115012', 3, 94500, 31500)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHcvbnmmkh27122020-101522_CTDH001', N'SP061', N'DHcvbnmmkh27122020-101522', 2, 150000, 75000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHtestsignmkh18122020-031448_CTDH001', N'SP038', N'DHtestsignmkh18122020-031448', 1, 290000, 290000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHtestsignmkh18122020-032625_CTDH001', N'SP021', N'DHtestsignmkh18122020-032625', 1, 20000, 20000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHtestsignmkh18122020-033653_CTDH001', N'SP002', N'DHtestsignmkh18122020-033653', 1, 9750, 9750)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHtestsignmkh29122020-091511_CTDH001', N'SP066', N'DHtestsignmkh29122020-091511', 8, 224000, 28000)
INSERT [dbo].[CHI_TIET_DON_HANG] ([MaChiTietDonHang], [MaSanPham], [MaDonHang], [SoLuong], [ThanhTien], [GiaBan]) VALUES (N'DHtestsignmkh29122020-091511_CTDH002', N'SP072', N'DHtestsignmkh29122020-091511', 14, 392000, 28000)
GO
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_107602201532909420719mkh_CTGH001', N'SP024', N'GH_107602201532909420719mkh', 1, 70000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_163265mkh_CTGH001', N'SP019', N'GH_163265mkh', 1, 300000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_2766211753646566mkh_CTGH001', N'SP001', N'GH_2766211753646566mkh', 1, 20000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_887692702034417mkh_CTGH001', N'SP005', N'GH_887692702034417mkh', 1, 90000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_cvbnmmkh_CTGH001', N'SP002', N'GH_cvbnmmkh', 1, 15000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_hihihimkh_CTGH001', N'SP012', N'GH_hihihimkh', 2, 130000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_ietuhgyguhjmkh_CTGH001', N'SP047', N'GH_ietuhgyguhjmkh', 2, 460000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_testnnmkh_CTGH001', N'SP063', N'GH_testnnmkh', 1, 34000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_testsignmkh_CTGH001', N'SP038', N'GH_testsignmkh', 3, 290000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH001', N'SP011', N'GH_tuananhmkh', 3, 90000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH002', N'SP025', N'GH_tuananhmkh', 2, 25000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH003', N'SP009', N'GH_tuananhmkh', 1, 25000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH015', N'SP021', N'GH_ietuhgyguhjmkh', 2, 20000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH016', N'SP036', N'GH_ietuhgyguhjmkh', 1, 90000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH017', N'SP073', N'GH_ietuhgyguhjmkh', 2, 35000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH018', N'SP020', N'GH_hihihimkh', 1, 180000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH019', N'SP055', N'GH_163265mkh', 1, 140000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH022', N'SP049', N'GH_163265mkh', 1, 18000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH023', N'SP032', N'GH_hihihimkh', 1, 75000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH032', N'SP069', N'GH_163265mkh', 99, 45000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH040', N'SP060', N'GH_cvbnmmkh', 1, 23000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_tuananhmkh_CTGH041', N'SP070', N'GH_2766211753646566mkh', 1, 80000)
INSERT [dbo].[CHI_TIET_GIO_HANG] ([MaChITietGioHang], [MaSanPham], [MaGioHang], [SoLuong], [DonGia]) VALUES (N'GH_vudinhchungmkh_CTGH001', N'SP072', N'GH_vudinhchungmkh', 1, 55000)
GO
INSERT [dbo].[CHIET_KHAU] ([MaChietKhau], [NgayBatDau], [NgayKetThuc], [PhanTram], [SoTienToiThieu], [SoTienToiDa], [hinhAnh]) VALUES (N'CK001', CAST(N'2020-11-30T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 20, 200000, N'500000    ', N'https://i.imgur.com/eZQ05Db.jpg')
INSERT [dbo].[CHIET_KHAU] ([MaChietKhau], [NgayBatDau], [NgayKetThuc], [PhanTram], [SoTienToiThieu], [SoTienToiDa], [hinhAnh]) VALUES (N'CK002', CAST(N'2020-11-30T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 5, 100000, N'199999    ', N'https://i.imgur.com/zKk3WUV.jpg')
INSERT [dbo].[CHIET_KHAU] ([MaChietKhau], [NgayBatDau], [NgayKetThuc], [PhanTram], [SoTienToiThieu], [SoTienToiDa], [hinhAnh]) VALUES (N'CK003', CAST(N'2020-11-30T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 30, 500001, N'700000    ', N'https://i.imgur.com/2yFFJSO.jpg')
GO
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DH1086595548477469mkh29122020-080231', N'1086595548477469mkh', N'NV001', 1, 165000, CAST(N'2020-12-29T01:02:31.920' AS DateTime), CAST(N'2020-12-29T01:05:13.653' AS DateTime), N'0986703811', N'Trung tâm thương mại Dân Tiến')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DH1086595548477469mkh29122020-081846', N'1086595548477469mkh', NULL, 0, 329000, CAST(N'2020-12-29T01:18:46.500' AS DateTime), NULL, N'0986703811', N'Trung tâm thương mại Dân Tiến')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DH1086595548477469mkh29122020-122848', N'1086595548477469mkh', N'NV001', 1, 360000, CAST(N'2020-12-28T17:28:48.597' AS DateTime), CAST(N'2020-12-28T18:01:05.263' AS DateTime), N'0986703811', N'Trung tâm thương mại Dân Tiến')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DH1086595548477469mkh29122020-123211', N'1086595548477469mkh', N'NV001', 1, 520000, CAST(N'2020-12-28T17:32:11.220' AS DateTime), CAST(N'2020-12-29T02:22:10.190' AS DateTime), N'0986703811', N'Trung tâm thương mại Dân Tiến')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DH887692702034417mkh29122020-082848', N'887692702034417mkh', NULL, 1, 162000, CAST(N'2020-12-29T01:28:48.790' AS DateTime), CAST(N'2020-12-29T03:01:21.333' AS DateTime), N'0336073883', N'5404 Abernathy Mill')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DH887692702034417mkh29122020-105238', N'887692702034417mkh', NULL, 0, 111000, CAST(N'2020-12-29T03:52:38.777' AS DateTime), NULL, N'0336073883', N'404 đỗ thế diên')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DHcvbnmmkh25122020-115012', N'cvbnmmkh', N'NV001', 1, 1843000, CAST(N'2020-12-25T04:50:12.937' AS DateTime), CAST(N'2020-12-28T17:33:53.613' AS DateTime), N'0986703811', N'Trung tâm thương mại Dân Tiến')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DHcvbnmmkh27122020-101522', N'cvbnmmkh', NULL, 1, 150000, CAST(N'2020-12-27T15:15:22.957' AS DateTime), CAST(N'2020-12-27T15:22:58.350' AS DateTime), N'0986703811', N'Trung tâm thương mại Dân Tiến')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DHtestsignmkh18122020-031448', N'testsignmkh', NULL, 1, 290000, CAST(N'2020-12-18T08:14:48.933' AS DateTime), CAST(N'2020-12-18T12:45:05.847' AS DateTime), N'0986703811', N'BerLin')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DHtestsignmkh18122020-032625', N'testsignmkh', N'NV002', 1, 20000, CAST(N'2020-12-18T08:26:25.397' AS DateTime), CAST(N'2020-12-18T12:41:43.470' AS DateTime), N'0986703811', N'BerLin')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DHtestsignmkh18122020-033653', N'testsignmkh', N'NV002', 1, 9750, CAST(N'2020-12-18T08:36:53.670' AS DateTime), CAST(N'2020-12-18T12:41:19.063' AS DateTime), N'0986703811', N'BerLin')
INSERT [dbo].[DON_HANG] ([MaDonHang], [MaKhachHang], [MaNhanVien], [TrangThai], [TongTien], [NgayMua], [NgayXacThuc], [SoDienThoai], [DiaChi]) VALUES (N'DHtestsignmkh29122020-091511', N'testsignmkh', NULL, 0, 1090000, CAST(N'2020-12-29T02:15:11.690' AS DateTime), NULL, N'0336073883', N'BerLin')
GO
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'094', N'SP008', 200000, CAST(N'2020-12-26' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB001', N'SP001', 20000, CAST(N'2020-01-03' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB002', N'SP002', 15000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB003', N'SP003', 45000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB004', N'SP004', 15000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB005', N'SP005', 90000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB006', N'SP006', 65000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB007', N'SP007', 40000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB008', N'SP008', 40000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB009', N'SP009', 25000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB010', N'SP010', 210000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB011', N'SP011', 90000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB012', N'SP012', 130000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB013', N'SP013', 41000, CAST(N'2020-01-30' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB014', N'SP014', 24000, CAST(N'2020-10-08' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB015', N'SP015', 45000, CAST(N'2020-10-08' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB016', N'SP016', 57000, CAST(N'2020-10-08' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB017', N'SP017', 25000, CAST(N'2020-10-08' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB018', N'SP018', 350000, CAST(N'2020-10-08' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB019', N'SP019', 300000, CAST(N'2020-02-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB020', N'SP020', 180000, CAST(N'2020-02-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB021', N'SP021', 20000, CAST(N'2020-02-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB022', N'SP022', 21000, CAST(N'2020-02-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB023', N'SP023', 17500, CAST(N'2020-06-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB024', N'SP024', 70000, CAST(N'2020-06-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB025', N'SP025', 25000, CAST(N'2020-06-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB026', N'SP026', 20000, CAST(N'2020-06-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB027', N'SP027', 60000, CAST(N'2019-11-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB028', N'SP028', 70000, CAST(N'2019-11-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB029', N'SP029', 20000, CAST(N'2019-11-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB030', N'SP030', 60000, CAST(N'2019-11-28' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB031', N'SP031', 21000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB032', N'SP032', 75000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB033', N'SP033', 55000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB034', N'SP034', 20000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB035', N'SP035', 35000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB036', N'SP036', 90000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB037', N'SP037', 14000, CAST(N'2020-07-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB038', N'SP038', 290000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB039', N'SP039', 175000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB040', N'SP040', 170000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB041', N'SP041', 230000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB042', N'SP042', 250000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB043', N'SP043', 120000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB044', N'SP044', 60000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB045', N'SP045', 60000, CAST(N'2020-09-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB046', N'SP046', 50000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB047', N'SP047', 460000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB048', N'SP048', 80000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB049', N'SP049', 18000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB050', N'SP050', 45000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB051', N'SP051', 40000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB052', N'SP052', 100000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB053', N'SP053', 35000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB054', N'SP054', 250000, CAST(N'2020-03-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB055', N'SP055', 140000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB056', N'SP056', 23000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB057', N'SP057', 440000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB058', N'SP058', 15000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB059', N'SP059', 60000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB060', N'SP060', 23000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB061', N'SP061', 75000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB062', N'SP062', 27000, CAST(N'2020-04-20' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB063', N'SP063', 34000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB064', N'SP064', 180000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB065', N'SP065', 37000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB066', N'SP066', 40000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB067', N'SP067', 22000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB068', N'SP068', 18000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB069', N'SP069', 45000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB070', N'SP070', 80000, CAST(N'2020-05-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB071', N'SP071', 40000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB072', N'SP072', 55000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB073', N'SP073', 35000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB074', N'SP074', 40000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB075', N'SP075', 35000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB076', N'SP076', 53000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB077', N'SP077', 75000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB078', N'SP078', 25000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB079', N'SP079', 100000, CAST(N'2020-06-07' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'gb080', N'sp079', 120000, CAST(N'2020-11-11' AS Date), CAST(N'2021-01-03' AS Date))
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB081', N'SP080', 10000, CAST(N'2020-12-18' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB082', N'SP080', 10000, CAST(N'2020-12-18' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB083', N'SP087', 10000, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB084', N'SP088', 0, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB085', N'SP089', 0, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB086', N'SP090', 100, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB087', N'SP080', 123, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB088', N'SP081', 123, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB089', N'SP082', 123, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB090', N'SP083', 0, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB091', N'SP084', 10000, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB092', N'SP085', 10000, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB093', N'SP086', 10000, CAST(N'2020-12-19' AS Date), NULL)
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GB094', N'SP004', 10000, CAST(N'2020-12-26' AS Date), CAST(N'2021-01-09' AS Date))
INSERT [dbo].[GIA_BAN] ([MaGiaBan], [MaSanPham], [GiaBan], [NgayApDung], [NgayKetThuc]) VALUES (N'GG095', N'SP013', 19, CAST(N'2021-01-05' AS Date), CAST(N'2021-01-10' AS Date))
GO
INSERT [dbo].[GIA_GIAM] ([MaGiaGiam], [MaSanPham], [PhanTram], [NgayBatDau], [NgayKetThuc]) VALUES (N'GG001', N'SP003', 20, CAST(N'2020-10-10' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[GIA_GIAM] ([MaGiaGiam], [MaSanPham], [PhanTram], [NgayBatDau], [NgayKetThuc]) VALUES (N'GG002', N'SP045', 40, CAST(N'2020-11-06' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[GIA_GIAM] ([MaGiaGiam], [MaSanPham], [PhanTram], [NgayBatDau], [NgayKetThuc]) VALUES (N'GG003', N'SP002', 35, CAST(N'2020-11-20' AS Date), CAST(N'2021-01-01' AS Date))
INSERT [dbo].[GIA_GIAM] ([MaGiaGiam], [MaSanPham], [PhanTram], [NgayBatDau], [NgayKetThuc]) VALUES (N'GG096', N'SP013', 19, CAST(N'2021-01-05' AS Date), CAST(N'2021-01-10' AS Date))
INSERT [dbo].[GIA_GIAM] ([MaGiaGiam], [MaSanPham], [PhanTram], [NgayBatDau], [NgayKetThuc]) VALUES (N'GG097', N'SP008', 10, CAST(N'2021-01-06' AS Date), CAST(N'2021-01-20' AS Date))
GO
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_107602201532909420719mkh', CAST(N'2020-12-29' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_1086595548477469mkh', CAST(N'2020-12-29' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_163265_hungld123mkh', CAST(N'2020-12-04' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_2766211753646566mkh', CAST(N'2020-12-16' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_887692702034417mkh', CAST(N'2020-12-29' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_cvbnmmkh', CAST(N'2020-11-28' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_ietuhgyguhjmkh', CAST(N'2020-12-02' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_testnnmkh', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_testsignmkh', CAST(N'2020-11-30' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_tuananhmkh', CAST(N'2020-11-28' AS Date))
INSERT [dbo].[GIO_HANG_] ([MaGioHang], [NgayMua]) VALUES (N'GH_vudinhchungmkh', CAST(N'2021-01-03' AS Date))
GO
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'0dsjfmkh', N'0dsjf', N'ka', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'a@xn--d-tfa.a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b8d37b5f-9d97-4758-a265-1eb8020ae9e2', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'101875244218728663162mkh', NULL, NULL, CAST(N'2020-12-28T03:53:26.697' AS DateTime), N'DucTuanAnh Nguyen', N'tuananh0103202nd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://lh6.googleusercontent.com/--vcVjNg9x-o/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmMUZVL48Yx4PXrT_Ce4LgzCMPRrw/s96-c/photo.jpg', NULL, 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'107602201532909420719mkh', NULL, NULL, CAST(N'2020-12-18T12:02:41.560' AS DateTime), N'Nguyễn Tuấn Anh', N'doremon209a@gmail.com', N'16732680943', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'5404 Abernathy Mill', NULL, N'GH_107602201532909420719mkh', NULL, N'https://lh3.googleusercontent.com/a-/AOh14Gjtf6e1VbbviB8SLwo0CwS7qRjDwgvwjyxj4Hzw6A=s96-c', NULL, 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'1086595548477469mkh', NULL, NULL, CAST(N'2020-12-29T00:57:41.560' AS DateTime), N'Tuananh Nguyen', NULL, N'0986703811', CAST(N'2000-03-01T00:00:00.000' AS DateTime), N'1', N'Trung tâm thương mại Dân Tiến', N'1086595548477469', N'GH_1086595548477469mkh', NULL, N'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1086595548477469&height=50&width=50&ext=1611795461&hash=AeTUSZS4oh2OLRBBkbE', NULL, 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'1231mkh', N'1231', N'1', CAST(N'2020-12-14T00:00:00.000' AS DateTime), NULL, N'yoyexiv773@boersy.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'163265_hungld123mkh', N'163265_hungld123', N'1', CAST(N'2020-12-04T00:00:00.000' AS DateTime), N'tuấn anh', N'dipesa3057@hebgsw.com', N'113', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'40444', NULL, N'GH_163265_hungld123mkh', NULL, N'https://i.imgur.com/uC5YmqE.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'163265mkh', N'163265', N'123456', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'Nguyễn Đức Tuấn Anh', N'leduyhung199312a3@gmail.com', N'0986703811', CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'1', N'1111', NULL, N'GH_163265mkh', NULL, N'https://i.imgur.com/gX5uinp.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'2766211753646566mkh', NULL, NULL, CAST(N'2020-12-28T16:12:08.477' AS DateTime), N'Tuan Anh', NULL, N'84336073883', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'404 đỗ thế diên', N'2766211753646566', N'GH_2766211753646566mkh', NULL, N'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=2766211753646566&height=50&width=50&ext=1611763927&hash=AeQ_GOjcRVodlAbfVH0', NULL, 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'887692702034417mkh', NULL, NULL, CAST(N'2020-12-29T02:04:25.250' AS DateTime), N'Tuấnanh TừBỏ Háchfb', NULL, N'0336073883', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'404 đỗ thế diên', N'887692702034417', N'GH_887692702034417mkh', NULL, N'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=887692702034417&height=50&width=50&ext=1611799464&hash=AeRkkahsxO1aunUt-hs', NULL, 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'aaaafmkh', N'aaaaf', N's', CAST(N'2020-12-18T00:00:00.000' AS DateTime), NULL, N'gexor84717@boersy.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'aaakmkh', N'aaak', N'1', CAST(N'2020-12-08T00:00:00.000' AS DateTime), NULL, N'doermon209a@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'altahmkh', N'altah', N'1', CAST(N'2020-11-30T00:00:00.000' AS DateTime), N'nguyễn tuấn anh', N'mejahiw650@ofdow.com', N'84336073883', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'1', N'404 đỗ thế diên', NULL, NULL, NULL, N'https://i.imgur.com/im6Blk7.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'aodmkh', N'aod', N'u', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'57de1407-f7a5-4ded-a5c5-2cdfb4cf3849', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'cvbnmmkh', N'cvbnm', N'h', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'a@a.a', NULL, NULL, NULL, NULL, NULL, N'GH_cvbnmmkh', NULL, NULL, N'0b28f0db-3713-4936-8680-38c782794da4', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'fghjkmkh', N'fghjk', N'gh', CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'uyh', N'yifewa1184@5y5u.com', N'0336073883', CAST(N'2020-11-11T00:00:00.000' AS DateTime), N'1', N'u', NULL, NULL, NULL, N'https://i.imgur.com/AevWYFn.png', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'hihihimkh', N'hihihi', N'a', CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'nguyễn tuấn anh', N'poyil48932@btsese.com', N'+84336073883', CAST(N'2020-11-03T00:00:00.000' AS DateTime), N'1', N'5404 Abernathy Mill', NULL, N'GH_hihihimkh', NULL, N'https://i.imgur.com/1bpet9s.png', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'hihmkh', N'hih', N'1', CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'er', N'tegot19200@xhypm.com', N'09876', CAST(N'2020-12-03T00:00:00.000' AS DateTime), N'1', N'dfg', NULL, NULL, NULL, N'https://i.imgur.com/XVh5TTy.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'hjgfmkh', N'hjgf', N'i', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'hjmkh', N'hj', N'p0', CAST(N'2020-11-27T00:00:00.000' AS DateTime), NULL, N'vitoiconchoi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'hung_ldmkh', N'hung_ld', N'1', CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'nguyễn tuấn anh', N'febiha1802@58as.com', N'033607388', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'404 đỗ thế diên nhân hòa mỹ hào hưng yên', NULL, NULL, NULL, N'https://i.imgur.com/G22DyjM.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'iadjamkh', N'iadja', N'ộas.', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'ihji@d.d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'fbc3a1cb-18ac-4d83-9814-52989e06972d', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'ìdsdf9jmkh', N'ìdsdf9j', N'i', CAST(N'2020-11-27T00:00:00.000' AS DateTime), NULL, N'vitoiconchoi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'idshmkh', N'idsh', N'j', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'iii@s.s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'dec0ac0a-33c8-4569-ab55-d1990cfc2534', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'ieeeemkh', N'ieeee', N'i', CAST(N'2020-11-27T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'6406b76f-88c8-4b69-ba8a-5cf42c0e7f3d', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'ietuhgyguhjmkh', N'ietuhgyguhj', N'j', CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'ẻghj', N'aipkdwlseqyi@dropmail.me', N'34567', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'ègthy', NULL, N'GH_ietuhgyguhjmkh', NULL, N'https://i.imgur.com/P0grvJb.png', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'ikjmkh', N'ikj', N'k', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'thucphamtk16@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'585b3088-69a7-4e3a-af3a-3db75eb14037', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'iklmkh', N'ikl', N'o', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N's@s.s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'408a7767-fc93-41a9-8838-617d2c23b459', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'imkh', N'i', N'2', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'79ba257d-96cf-4185-bd7f-39cd9010b79b', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'inkojhnmkh', N'inkojhn', N'k', CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'frtg', N'tcntigrcc@emlpro.com', N'4567', CAST(N'2020-11-06T00:00:00.000' AS DateTime), N'1', N'tyu', NULL, NULL, NULL, N'https://i.imgur.com/mOw2UGu.png', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'ipmkh', N'ip', N'j', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'thucphamtk16@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'f3919208-0f86-4bbd-80a3-797c97c9472a', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'jnmkh', N'jn', N'i', CAST(N'2020-11-26T00:00:00.000' AS DateTime), N'tuấn anh', N'mejahiw650@ofdow.com', N'0336073883', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'1', N'ạ', NULL, NULL, NULL, N'https://i.imgur.com/5fKpbsi.png', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'KH001', N'doremon2@gmail.com', N'123', CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'Nguyễn Đức Tuấn Anh', N'tuananh010320@gmail.com', N'0986703811', CAST(N'2000-03-01T00:00:00.000' AS DateTime), N'Nam', N'Hưng Yên', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'KH002', N'Anhvaem', N'123', CAST(N'2020-11-11T00:00:00.000' AS DateTime), N'Tuấn Anh Nguyễn', N'doremon@gmail.com', N'0336073883', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'Nam', N'Mỹ Hào', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'KH003', N'lethihien', N'1', CAST(N'2020-11-28T00:00:00.000' AS DateTime), N'Lê Thị Hiền', N'lethihien@gmail.com', N'0931758312', CAST(N'2002-10-08T00:00:00.000' AS DateTime), N'Nữ', N'Tân Châu - Hưng Yên', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'kkkmkh', N'kkk', N'1', CAST(N'2020-11-25T00:00:00.000' AS DateTime), N'tuấn anh', N'vitoiconchoi@gmail.com', N'0336073883', CAST(N'2020-11-17T00:00:00.000' AS DateTime), N'1', N'404', NULL, N'GH_kkkmkh', NULL, N'https://i.imgur.com/Y6SPcIM.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'kmkh', N'k', N'k', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b7089a1b-9deb-41a2-8964-304069fd8ca8', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'kokomkh', N'koko', N'i', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'llllmkh', N'llll', N'i', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'dc7b5f0c-3599-4be7-980f-e89549c806f6', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'lsmkh', N'ls', N'i', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4fa6d9d2-887c-4274-8b17-03bb4b3842c5', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'mightymkh', N'mighty', N'123456', CAST(N'2020-12-27T00:00:00.000' AS DateTime), NULL, N'hello@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'cf40f931-be94-4692-b6e1-90d44ca9cb28', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'mkhmkh', N'mkh', N'1', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'5ea98818-1462-41ab-9309-a255ea0fa652', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'q1mkh', N'q1', N'1', CAST(N'2020-12-04T00:00:00.000' AS DateTime), NULL, N'gokonax847@menece.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'smkh', N's', N'l', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'a@s.s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'61afbf02-fc4a-4c9c-ba7a-40ba3522d8b3', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'ta12mkh', N'ta12', N'12', CAST(N'2020-12-08T00:00:00.000' AS DateTime), NULL, N'tuananh010320@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'testmailmkh', N'testmail', N'1', CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'nguyễn tuấn anh', N'mejahiw650@ofdow.com', N'0336073883', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'1', N'404 đỗ thế diên', NULL, NULL, NULL, N'https://i.imgur.com/4ZGhkp4.png', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'testmkh', N'test', N'1', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'370e5448-cd2f-41be-b15f-dd1006c24ef6', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'testnnmkh', N'testnn', N'1', CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'Nguyễn Đức Tuấn Anh', N'xeloya8448@hebgsw.com', N'0986703811', CAST(N'2020-12-17T00:00:00.000' AS DateTime), N'1', N'Trung tâm thương mại Dân Tiến', NULL, N'GH_testnnmkh', NULL, N'https://picsum.photos/360/360', N'de412f72-e469-426f-a7c1-d8d8eaab0766', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'testsignmkh', N'testsign', N'u', CAST(N'2020-11-26T00:00:00.000' AS DateTime), N'Karma', N'mejahiw650@ofdow.com', N'0986703811', CAST(N'1999-12-08T00:00:00.000' AS DateTime), N'1', N'BerLin', NULL, N'GH_testsignmkh', NULL, N'https://i.imgur.com/9QucgVx.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'testtttmkh', N'testttt', N'l', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'mejahiw650@ofdow.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'fea6ddad-b947-424f-badf-0b4fbea9c7aa', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'tuananh1212mkh', N'tuananh1212', N'1', CAST(N'2020-12-08T00:00:00.000' AS DateTime), NULL, N'rifofar916@1heizi.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'tuananhmkh', N'tuananh', N'1212', CAST(N'2020-11-29T00:00:00.000' AS DateTime), N'Nguyễn Đức Tuấn Anh', N'tuananh010320@gmail.com', N'0986703811', CAST(N'2020-11-11T00:00:00.000' AS DateTime), N'1', N'1111', NULL, N'GH_tuananhmkh', NULL, N'https://i.imgur.com/QXUheZg.jpg', N'', 2)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'uhmkh', N'uh', N'j', CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, N'i@s.s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b7df5dc4-9381-4829-9c5b-83d7ab40fda2', 0)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'vbnmmkh', N'vbnm', N'11', CAST(N'2020-12-25T00:00:00.000' AS DateTime), NULL, N'worapi3086@aranelab.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', 1)
INSERT [dbo].[KHACH_HANG] ([MaKhachHang], [TaiKhoan], [MatKhau], [NgayTao], [TenKhachHang], [Email], [SoDienThoai], [NgaySinh], [GioiTinh], [DiaChi], [IDFaceBook], [MaGioHang], [MaFeedBack], [HinhAnh], [VerificationCode], [active]) VALUES (N'vudinhchungmkh', N'vudinhchung', N'123654', CAST(N'2021-01-03T00:00:00.000' AS DateTime), NULL, N'dinhchungcomputer@gmail.com', NULL, NULL, NULL, NULL, NULL, N'GH_vudinhchungmkh', NULL, NULL, N'b071011e-34fb-4d9f-8b04-f26b6396acbf', 0)
GO
INSERT [dbo].[LOAI_NHAN_VIEN_] ([MaLoaiNhanVien], [TenLoaiNhanVien], [MoTa]) VALUES (N'LNV001', N'Admin', N'Người chủ, người nhận trách nhiệm chính về mọi việc của trang web')
INSERT [dbo].[LOAI_NHAN_VIEN_] ([MaLoaiNhanVien], [TenLoaiNhanVien], [MoTa]) VALUES (N'LNV002', N'Nhân viên', N'Nhân viên bán hàng, viết bài, chốt đơn')
GO
INSERT [dbo].[LOAI_SAN_PHAM] ([MaLoaiSanPham], [TenLoaiSanPham], [MoTa]) VALUES (N'LSP001', N'Rau', N'Các loại rau sạch của cửa hàng. Các loại rau được nhập từ các nguồn nhà cung cấp uy tín')
INSERT [dbo].[LOAI_SAN_PHAM] ([MaLoaiSanPham], [TenLoaiSanPham], [MoTa]) VALUES (N'LSP002', N'Gia vị', N'Các loại gia vị không thể thiếu trong căn bếp của bạn. Ví dụ như: Hạt tiêu, muối, ớt, ... các sản phẩm đều được đảm bảo vệ sinh an toàn thực phẩm')
INSERT [dbo].[LOAI_SAN_PHAM] ([MaLoaiSanPham], [TenLoaiSanPham], [MoTa]) VALUES (N'LSP003', N'Hạt khô, hạt giống', N'Các loại hạt sấy khô. Ví dụ như: Hạt óc chó, ngũ cốc, gạo tẻ, gạo nếp, lúa mì,... và các hạt giống do các nhà cung cấp uy tín của cửa hàng ')
INSERT [dbo].[LOAI_SAN_PHAM] ([MaLoaiSanPham], [TenLoaiSanPham], [MoTa]) VALUES (N'LSP004', N'Trái cây', N'Các loại trái cây của cửa hàng bao gồm: Xoài, Dưa hấu, Mít, Sầu riêng, Nho, ... đảm bảo được độ tươi và vệ sinh an toàn thực phẩm của loại quả mà cửa hàng cso')
INSERT [dbo].[LOAI_SAN_PHAM] ([MaLoaiSanPham], [TenLoaiSanPham], [MoTa]) VALUES (N'LSP005', N'Ngũ cốc', N'Các loại ngũ cốc bao gồm: mè, gạo nức, gạo nếp, gạo tẻ, lúa mì,... Các sản phẩm của cửa hàng đều được đảm bảo vệ sinh an toàn thực phẩm')
INSERT [dbo].[LOAI_SAN_PHAM] ([MaLoaiSanPham], [TenLoaiSanPham], [MoTa]) VALUES (N'LSP006', N'Các loại đậu', N'Các loại đậu của cửa hàng như: Đậu Hà Lan, Đậu tương, đậu gà,.... các sản phẩm đều được đảm bảo vệ sinh an toàn thực phẩm')
GO
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC001', N'Siêu Thị Vạn Phước', N'67/16 Bình Hưng Hòa B, Q. Bình Tân, Tp. Hồ Chí Minh (TPHCM)', N'0899339611', N'phungthimuoi1904@gmail.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC002', N'Công Ty TNHH Chế Biến Nông Sản Thực Phẩm Thiên Hà', N'Lầu 10, Toà Nhà Vinaconex, 47 Điện Biên Phủ, P. Đa Kao, Q. 1, Tp. Hồ Chí Minh (TPHCM)', N'02839103066', N'phungthimuoi1904@gmail.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC003', N'Nông Sản Galaxy Agro - Công Ty TNHH Galaxy Agro', N'
Số 14/16, Đường 990, Khu Phố 4, Phường Phú Hữu, Quận 9, Tp. Hồ Chí Minh (TPHCM)', N'0983373877', N'nancy@galaxy-vn.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC004', N'Nông Sản Thái Thịnh - Công Ty TNHH Thái Thịnh', N'Thôn 8, Xã Đắk Ha, Huyện Đắk Glong, Tỉnh Đắk Nông', N'0965749966', N'kathaithinhfood@gmail.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC005', N'Nước Cốt Chanh Dây A.V - Công Ty TNHH Chế Biến & Thương Mại A.V', N'Tổ 6, Phường Nghĩa Thành, TX. Gia Nghĩa, Đắk Nông', N'0965749966', N'chanhdayav@gmail.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC006', N'Nông Sản Sạch Minh Hải - Công Ty TNHH Sản Xuất Thương Mại Và Xuất Nhập Khẩu Minh Hải', N'Số WBC-1810, Khu Chung Cư Westbay, KĐT. Ecopark, X. Xuân Quan, H. Văn Giang, Hưng Yên', N'0989213216', N'vuminhhai2019@gmail.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC007', N'Nông Sản Sao Khuê - Công Ty TNHH Thương Mại Xuất Nhập Khẩu Sao Khuê', N'Số 135/17/63 Đường Nguyễn Hữu Cảnh, P. 22, Q. Bình Thạnh, Tp. Hồ Chí Minh (TPHCM)', N'0908261003', N'khuestarco@made-in-vietnam.com.vn')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC008', N'Thực Phẩm Tấn Tài - Công Ty TNHH MTV Thực Phẩm Tấn Tài', N'904/35-904/35A, Nguyễn Duy, Phường 12, Quận 8, Tp. Hồ Chí Minh (TPHCM)', N'0706675696', N'hucphamtantai@gmail.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC009', N'Công Ty CP Rau Quả Tiền Giang', N'Km1977 Quốc Lộ 1A, X. Long Định, H. Châu Thành, Tiền Giang', N'02733834677', N'info@vegetigi.com')
INSERT [dbo].[NHA_CUNG_CAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai], [Email]) VALUES (N'NCC010', N'Công Ty TNHH MTV Rau Quả Bình Thuận', N'107 Đặng Văn Lãnh, P. Phú Tài, TP. Phan Thiết, Bình Thuận', N'02522210779', N'hoangrauqua@fruitsandgreens.com')
GO
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV001', N'Nguyễn Đức Tuấn Anh', N'LNV001', N'Nam', CAST(N'2000-01-03' AS Date), CAST(N'2020-01-03' AS Date), N'An Vĩ - Khoái Châu - Hưng Yên', N'0986703811', N'tuananh010320@gmail.com', N'1', N'https://i.imgur.com/s5U5j0z.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV002', N'Nguyễn Tuấn Anh', N'LNV001', N'Nam', CAST(N'2000-12-12' AS Date), CAST(N'2020-12-12' AS Date), N'Nhân Hoà - Mỹ Hào - Hưng Yên', N'0336073883', N'doremon209a@gmail.com', N'alta', N'https://i.imgur.com/LWHAfbt.jpg', N'opfVbpgoWX')
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV003', N'Nguyễn Tuấn Anh', N'LNV002', N'Nam', CAST(N'2000-08-07' AS Date), CAST(N'2020-08-07' AS Date), N'Tân Dân - Khoái Châu - Hưng Yên', N'0912341245', N'tokizosan@gmail.com', N'1', N'https://i.imgur.com/LWHAfbt.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV004', N'Phạm Gia Hoàng', N'LNV002', N'Nam', CAST(N'2000-03-01' AS Date), CAST(N'2020-03-01' AS Date), N'Phù Cừ - Khoái Châu - Hưng Yên', N'0871234124', N'hoanganhpham@gmail.com', N'1', N'https://i.imgur.com/LWHAfbt.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV005', N'Lê Thị Thu Trang', N'LNV002', N'Nữ', CAST(N'2000-10-15' AS Date), CAST(N'2020-10-15' AS Date), N'Ba Vì - Hà Nội', N'0971898413', N'letrang@gmail.com', N'1', N'https://i.imgur.com/LWHAfbt.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV007', N'Trần Thị Thư', N'LNV001', N'Nữ', CAST(N'1999-06-24' AS Date), CAST(N'2020-12-20' AS Date), N'Phù Cừ Tiên Lữ', N'91324128', N'tranthuthithu@gmail.com', N'123', N'https://i.imgur.com/X8RoI9T.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV008', N'Phạm Thị Thanh Hoài', N'LNV002', N'Nữ', CAST(N'1999-10-15' AS Date), CAST(N'2020-12-20' AS Date), N'Mường Khương - Lao Kay', N'0987123545', N'hoaithanh9xvjpr0La0Kay@yahoo.com', N'hoaikute', N'https://i.imgur.com/J8Jrn0y.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV009', N'Bùi Vân Chính', N'LNV002', N'Nữ', CAST(N'1999-02-07' AS Date), CAST(N'2020-12-20' AS Date), N'Đông Vệ - Thanh Hóa', N'00544409800', N'chinh0702c0ngchua9x@gmail.com', N'123', N'https://i.imgur.com/ZuiO4ws.jpg', NULL)
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV010', N'Anh Là Tuấn Anh', N'LNV001', N'Nam', CAST(N'2000-12-12' AS Date), CAST(N'2020-12-21' AS Date), N'Trái Đất', N'00336073883', N'doremon2012a@gmail.com', N'123', N'https://i.imgur.com/VcLvbnS.png', N'')
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV011', N'Bùi thị tuyết', N'LNV002', N'Nữ', CAST(N'2015-12-08' AS Date), CAST(N'2020-12-21' AS Date), N'Hưng yên', N'0123456789', N'buithituyet@gmail.com', N'alta', N'https://i.imgur.com/ar2ZkCZ.jpg', N'')
INSERT [dbo].[NHAN_VIEN_] ([MaNhanVien], [TenNhanVien], [MaLoaiNhanVien], [GioiTinh], [NgaySinh], [NgayVaoLam], [DiaChi], [SoDienThoai], [Email], [matKhau], [HinhAnh], [confirmationCode]) VALUES (N'NV012', N'nguyễn tiến long', N'LNV002', N'Nam', CAST(N'2000-10-11' AS Date), CAST(N'2020-12-23' AS Date), N'mỹ hào hưng yên', N'0123789456', N'xemimi9242@ummoh.com', N'123', N'https://i.imgur.com/9uIACPI.jpg', N'')
GO
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP001', N'Bí Ngô', 300, 200, 100, N'https://i.imgur.com/XjeImyB.jpg', N'Kg', N'được mệnh danh là nhà vô địch về hàm lượng sắt, kẽm, giàu vitamin, muối khoáng cũng như các axít hữu cơ tham gia vào sự hình thành của protein. Rất tốt cho sự phát triển của não bộ, tốt cho người bệnh huyết áp cao, sơ gan, giải độc chất heroin, hen xuyễn.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP002', N'Rau Ngót', 500, 300, 100, N'https://i.imgur.com/7rYEYAw.jpg', N'Gam', N': có lượng đạm cao, giàu chất vôi, nhiều vitamin C, K có tác dụng thanh nhiệt, trị cảm nhiệt, hỗ trợ điều trị đái tháo đường, táo bón, chảy máu cam, chữa sót nhau thai. Là thực phẩm lành tính dùng trong bữa ăn của những người phục hồi sau phẫu thuật vết thương.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP003', N'Súp lơ', 200, 100, 100, N'https://i.imgur.com/O9qAy1b.jpg', N'Kg', N'là loại rau giàu protein, các axit amin, axit folic thúc đẩy nhanh quá trình tổng hợp ADN của tế bào, tăng số lượng tế bào, chứa nhiều acid alpha lipoic – chất chống oxy hóa giúp hòa tan chất béo vào nước và chất chống viêm.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP004', N'Bắp cải', 400, 200, 100, N'https://i.imgur.com/vIxdHlk.jpg', N'Kg', N'có chứa nhiều chất béo có lợi cho não, Omega 3 giúp cho sự phát triển trí não bộ, phòng bệnh ung thư vú ở phụ nữ, nước bắp cải tươi chữa bệnh loét da, ngăn ngừa bệnh tiểu đường, giảm cân, đau họng, đau khớp', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP005', N'Cải xoăn', 500, 100, 100, N'https://i.imgur.com/tDaMwpZ.jpg', N'Kg', N'là nhà vô địch trong tất cả những loại rau lá xanh siêu có lợi cho sức khỏe, có rất nhiều vitamin, khoáng chất, chất xơ, chất chống oxi hóa và những hoạt chất sinh học khác nhau bao gồm isothiocyanates và indole-3-carbinol được chứng minh có thể trị ung thư', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP006', N'Cải bó xôi', 540, 200, 100, N'https://i.imgur.com/y9dNQKc.jpg', N'Kg', N'có lượng dưỡng chất vitamin áp đảo trong danh sách các loại rau củ quả, chứa một lượng lớn các carotene và chất sắt, vitamin B6, axit folic và Kali dồi dào.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP007', N'Cà chua', 1000, 500, 100, N'https://i.imgur.com/bsfR7fO.jpg', N'Kg', N'Chất lycopene dồi dào bảo vệ các nhân tố có hại tấn công hệ thần kinh giúp trí nhớ nhanh nhạy, sắc bén hơn bình thường, giảm nguy cơ mắc bệnh Alzheimer.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP008', N'Củ dền', 200, 100, 100, N'https://i.imgur.com/JHZjnOr.jpg', N'Kg', N'chứa nhiều vitamin A, B1, B2, B6 và C, nhiều chất Fe, Ca, Mg, Cu, P, Na. Là nguồn cung cấp chất choline, acid folic, I, chất xơ và carbohydrates ở dạng đường tiêu hóa tự nhiên, là một loại thực phẩm có tính bổ máu, giúp cải thiện tình trạng thiếu máu, xơ vữa động mạch, huyết áp, loét dạ dày, táo bón, nhiễm độc, bệnh gan.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP009', N'Rau cải thìa', 1000, 400, 100, N'https://i.imgur.com/gMlU4Sg.jpg', N'Kg', N'Cải thìa (cải chíp) là một loại rau dễ trồng, dễ ăn. Trong trường hợp nhà bạn không có nhiều không gian để trồng trọt, có thể trồng rau cải chíp theo cách thủy canh bằng thùng xốp. Bạn nên trồng bằng nhánh rau hoặc hạt giống trong thùng nước. Tiếp đó mới nên chuyển lên thùng xống hoặc giàn thủy canh.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP010', N'Rau mầm Brussels', 200, 150, 100, N'https://i.imgur.com/Z5wdvqO.jpg', N'Kg', N'Rau mầm Brussels cũng chứa kaempferol, một chất chống oxy hóa có thể đặc biệt hiệu quả trong việc ngăn ngừa quá trình oxy hóa cho các tế bào.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP011', N'Cải cầu vồng', 100, 50, 100, N'https://i.imgur.com/ArGnAlj.jpg', N'Kg', N'Cải cầu vồng có lượng calo thấp nhưng chứa nhiều vitamin và khoáng chất thiết yếu.

Một cốc (36 gram) chỉ chứa 7 calo nhưng 1 gram chất xơ, 1 gram protein và rất nhiều vitamin A, C và K, mangan và magie. Cải cầu vồng còn được biết tới khả năng ngăn ngừa một số biến chứng do đái tháo đường gây ra.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP012', N'Măng tây', 100, 40, 100, N'https://i.imgur.com/gyKL5PK.jpg', N'Kg', N'Loại rau này rất giàu vitamin và khoáng chất, bổ sung dinh dưỡng tuyệt vời cho bất kỳ chế độ ăn uống.

Chỉ cần một nửa cốc (90 gram) măng tây cung cấp một phần ba nhu cầu folate hàng ngày của bạn.

Ngoài ra còn cung cấp nhiều selen, vitamin K, thiamin và riboflavin.

Một số nghiên cứu trong ống nghiệm cũng cho thấy măng tây có thể có lợi cho gan bằng cách hỗ trợ chức năng trao đổi chất của  gan và bảo vệ gan chống lại độc tính.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP013', N'Bắp cải tím', 140, 20, 100, N'https://i.imgur.com/QXZZMSs.jpg', N'Kg', N'Loại rau này thuộc họ rau họ cải và,giống như họ hàng của nó, bắp cải tím chứa đầy chất chống oxy hóa và các hoạt chất tăng cường sức khỏe.

Một cốc (89 gram) bắp cải tím chứa 2 gram chất xơ cũng như 85% nhu cầu vitamin C hàng ngày.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP001', N'SP014', N'Su hào', 150, 120, 100, N'https://i.imgur.com/ggJj08F.jpg', N'Kg', N'Su hào còn được gọi là bắp cải củ cải hoặc củ cải Đức, su hào là một loại rau liên quan đến bắp cải có thể ăn sống hoặc nấu chín.

Su hào sống có nhiều chất xơ, cung cấp 5 gram trong mỗi cốc (135 gram). Nó cũng chứa đầy vitamin C, cung cấp 140% giá trị hàng ngày trên mỗi cốc.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP015', N'Muối vừng Việt Nam', 100, 50, 100, N'https://i.imgur.com/iF61ToS.jpg', N'Lọ', N'Với thành phần chính mang mùi thơm của vừng, vị ngậy của lạc và vị mặn nồng của muối rang, món muối vùng thường được dùng để chấm kèm những món rau luộc thanh đạm. Là món ăn đã trở nên quen thuộc với mỗi người dân Việt Nam, muối vừng có cách làm và chế biến đơn giản chỉ bằng cách rang lên và giã nhỏ các loại nguyên liệu rồi trộn đều. Muối vừng không chỉ là một loại muối chấm, mà còn một món ăn đệm cực đưa cơm.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP016', N'Muối tiêu Phú Quốc', 100, 40, 100, N'https://i.imgur.com/zldTO1N.jpg', N'Lọ', N'Cũng là một món ăn đặc biệt thích hợp với đồ hải sản, nhưng muối tiêu Phú Quốc lại mang hương vị riêng của vùng huyện đảo xa xôi này. Không khó để tìm thấy nhiều ruộng tiêu ở khắp vùng đất này, và cũng rất dễ dàng để thưởng thức vô vàn loại muối kèm tiêu ở đây. Nhưng loại muối đơn giản với tiêu và cốt chanh vẫn là món ăn đặc biệt nhất.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP017', N'Chẳm chéo Tây Bắc', 100, 30, 100, N'https://i.imgur.com/9CUmGZf.jpg', N'Lọ', N'Đối với du khách tới Tây Bắc, Điện Biên hay Sơn La thì chẳm chéo là “đặc sản” không thể không thử. Cách chế biến của loại "muối chấm" của dân tộc Thái này rất đặc biệt với vị cay nồng của ớt nướng, vị bùi của tỏi, vị mặn của muối và đặc biệt là hương thơm ngọt ngào đậm đà của hạt mắc khén', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP018', N'Mắc Khén', 100, 30, 100, N'https://i.imgur.com/ewWPDyn.jpg', N'Lọ', N'Hạt mắc khén lá quả trên cây mắc khén là loại gia vị phổ biến và không thể thiếu trong các món ăn của đồng bào dân tộc Thái nơi đây. Được ví là linh hồn ẩm thực của Tây Bắc, hạt mắc khén từ lâu đã nổi tiếng trên thị trường, được rất nhiều người sử dụng và đặt niềm tin, đặc biệt là những bà mẹ nội trợ.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP019', N'Hạt Dổi', 140, 40, 100, N'https://i.imgur.com/aK3rVrj.jpg', N'Lọ (100gram)', N'Hạt dổi là loại gia vị độc đáo, được ví như “vàng đen” của đồng bào dân tộc núi rừng Tây Bắc. Với mùi thơm đặc biệt, loại hạt này dùng làm gia vị, hình thành nên nhiều món ăn đặc sắc, tốt cho sức khỏe.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP020', N'Muối tôm Tây Ninh', 150, 50, 100, N'https://i.imgur.com/deDtKCw.jpg', N'Lọ', N'Muối tôm Tây Ninh ngày nay đã trở thành một Thương hiệu muối phổ biến khắp cả nước. Có rất nhiều loại muối tôm khác nhau đang có sẵn trên thị trường, gia công hoặc sản xuất công nghiệp. Nhưng dù là phiên bản nào, muối tôm đậm chất Tây Ninh vẫn có vị ngọt của đường đan xen với vị ngọt của tôm, vị mặn của muối rang, mùi thơm của tỏi và sắc cam đỏ hấp dẫn từ ớt hoặc cà rốt', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP021', N'Muối ô mai', 100, 50, 100, N'https://i.imgur.com/eUKIjgU.jpg', N'Lọ (100gram)', N'Muối ô mai được làm từ muối, đường, ớt sấy, cốt ô mai làm nổi lên vị chua - cay - mặn - ngọt cùng hương vị của ô mai hấp dẫn đến khó cưỡng. Hạt muối to mới nhìn tưởng chừng khó ăn và rất mặn nhưng khi ăn những hạn muối đó lại giòn, ngọt, thơm và đem lại cảm giác khá thú vị, đôi khi hạt muối trở thành sở thích của nhiều người. Muối ô mai ngon nhất khi chấm với các hoa quả nhạt.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP022', N'Muối ớt xanh Nha Trang', 50, 20, 100, N'https://i.imgur.com/7xZSDra.jpg', N'Lọ (200gram)', N'Muối ớt xanh là một đặc sản nổi tiếng, được pha trộn khéo léo từ công thức gia truyền của người dân vùng biển Nha Trang. Một loại nước chấm sánh mịn với hương vị cay nồng từ những trái ớt xanh, cộng thêm vị chua của chanh, thơm đặc biệt của lá xả. Đây là món ăn thích hợp dùng để chấm các món ăn hải sản, thịt và ướp các thực phẩm.  ', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP023', N'Bột ớt ', 100, 20, 100, N'https://i.imgur.com/yg1xX5O.jpg', N'Lọ (100gram)', N'Để món ăn có thêm chút màu sắc thì ớt bột là một lựa chọn phù hợp. Mùi vị của ớt bột không quá cay nồng như ớt tươi nên sẽ không ảnh hưởng đến chất lượng của món ăn.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP024', N'Bột ớt Hàn Quốc', 200, 50, 100, N'https://i.imgur.com/UYakNe1.jpg', N'Túi (500gram)', N'Ớt bột Hàn Quốc là một gia vị đặc trưng của người Hàn, được dùng trong nhiều món ăn nổi tiếng như kim chi, thịt nướng. ... Ớt bột có màu đỏ, hạt thô hoặc bột, có vị hơi cay kèm theo chút vị ngọt.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP025', N'Hạt tiêu đen', 100, 20, 100, N'https://i.imgur.com/PoeOvAa.jpg', N'Lọ (120gram)', N'Hạt tiêu đen tuy không cay bằng hạt tiêu trắng nhưng nó lại thơm hơn rất nhiều và có nhiều công dụng. Ngoài vài trò là một loại gia vị trong chế biến món ăn, hạt tiêu đen còn là một vị thuốc chữa bệnh trong Đông y, mang đến nhiều tác dụng bất ngờ mà có lẽ nhiều người chưa biết.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP026', N'Hạt tiêu trắng (tiêu sọ)', 200, 100, 100, N'https://i.imgur.com/CNYsgAo.jpg', N'Lọ (100gram)', N'Tiêu sọ thường được dùng tạo mùi thơm cho các thực đơn sang trọng mà không làm mất đi tính thẩm mỹ, màu sắc của món ăn vì phần vỏ đen. Trong những món âu có dùng thành phần sữa hoặc kem làm nền thì người đầu bếp sẽ chuộng dùng tiêu sọ hạt hoặc tiêu sọ xay để hòa trùng màu với kem sữa', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP027', N'Tiêu xanh', 100, 35, 100, N'https://i.imgur.com/ClV1LNd.jpg', N'Lọ (100gram)', N'Tiêu xanh thường được dùng trong các món hầm để lấy hương và tính chất nóng ấm của hạt tiêu cũng như khử đi mùi hôi của nguyên liệu ví dụ như những món bò hầm, bao tử hầm,…', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP028', N'Tiêu hồng (Tiêu đỏ)', 100, 25, 100, N'https://i.imgur.com/Vjbruwv.jpg', N'Lọ (500gram)', N'Hạt tiêu hồng lại đóng góp rất nhiều trong y học: chúng có tác dụng kích thích lợi tiểu, nhuận tràng, điều trị triệu chứng của các bệnh cúm, cảm lạnh, ho hoặc viêm phế quản. Tiêu hồng có tính chất kháng viêm, được sử dụng để điều trị các bệnh phụ khoa như viêm âm đạo mãn tính hay là liều thuốc cho rối loạn kinh nguyệt. Tuy nhiên, nên lưu ý rằng phụ nữ mang thai không nên sử dụng hạt tiêu hồng.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP029', N'Đường cát', 200, 100, 100, N'https://i.imgur.com/D2psPfV.jpg', N'Túi (1Kg)', N'được sản xuất 100% từ mía, áp dụng công nghệ loại bỏ chất màu bằng than hoạt tính', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP030', N'Đường phèn', 200, 150, 100, N'https://i.imgur.com/9VkTmcI.jpg', N'Túi (1kg)', N'Trog nấu ăn, với công dụng vừa giúp tạo thêm vị ngon của món ăn thì giúp giải nhiệt rất tốt cho sức khỏe, do không cần qua quá trình tinh chế nên tốt cho sức khỏe người sử dụng hơn so với đường kính.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP031', N'Đường nâu (hoa mai)', 100, 60, 100, N'https://i.imgur.com/92GCojV.jpg', N'Túi (1kg)', N'Đường vàng Hoa Mai là sự kết hợp tự nhiên nhất từ đường và mật mía, đem đến vị ngọt đậm đà và màu sắc tự nhiên, hấp dẫn cho các món ăn. Đây là sản phẩm không thể thiếu trong căn bếp của các bà nội trợ”. - Trạng thái: dạng tinh thể, kích thước tương đối đồng đều, tơi, khô, không vón cục.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP032', N'Đường đen', 150, 60, 100, N'https://i.imgur.com/IsSwX0s.jpg', N'Túi (1kg)', N'Đường đen là loại đường chưa được tinh luyện, nên có màu đậm hơn và giữ được vị ngọt tự nhiên, thanh đạm vốn có của cây mía đường hơn so với các loại đường khác. Đồng thời, kích thước của hạt đường đen to hơn so với đường trắng, nhưng cũng rất dễ tan trong nước.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP033', N'Giấm trắng', 100, 30, 100, N'https://i.imgur.com/KnR5uMx.jpg', N'Chai (450ml)', N'Khử mùi tanh của thịt cá, làm đồ chua trộn salad', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP034', N'Giấm gạo', 100, 40, 100, N'https://i.imgur.com/WqFc6Yn.jpg', N'Chai (400ml)', N'Người ta sử dụng rượu gạo, rượu nếp để nấu lên, trong quá trình lên men thì sẽ tạo ra giấm gạo nên không có vị nồng như giấm tinh luyện. Giấm gạo có vị chua dịu nhẹ nên thường được sử dụng để nấu nhiều món ăn ngon hấp dẫn.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP035', N'Giấm táo', 133, 33, 100, N'https://i.imgur.com/gc4UUxM.jpg', N'Chai (500ml)', N'Giấm táo được chế biến từ nguyên liệu táo. Sau quá trình lên men từ rượu táo thì sẽ biến đổi thành giấm táo.

Giấm táo có vị chua nhẹ, độ ngọt dịu nên thường được sử dụng để làm ra các món salad trộn, tẩm ướp món ăn. Ngoài ra, giấm táo được sử dụng để chăm sóc da, giữ dáng nên khá nhiều phái nữ yêu thích.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP002', N'SP036', N'Giấm rượu', 100, 50, 100, N'https://i.imgur.com/w0Adu1k.jpg', N'Chai (500ml)', N'Giấm rượu được chế biến từ các loại rượu như nâu Pháp, vang đỏ, sam banh…Giấm rượu có mùi vị thơm nhẹ được sử dụng rất nhiều trong chế biến nhất là làm ra các nước sốt cho món ăn.

Mỗi loại giấm rượu đều có hương vị riêng biệt nên được áp dụng cho nhiều món ăn khác nhau. Nếu làm nước sốt chấm có mayonnaise thì dùng giấm vang trắng, còn tẩm ướp các loại thịt gà, vịt thì dùng giấm vang đỏ….', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP037', N'Hạnh nhân', 100, 30, 100, N'https://i.imgur.com/QvSChNX.jpg', N'Túi (500g)', N'Hạnh nhân rất giàu khoáng chất (đồng, mangan, phốt pho) và là một nguồn cung cấp vitamin E dồi dào. Hạnh nhân không chỉ giúp cải thiện hệ tiêu hóa, mà còn có khả năng điều chỉnh lượng đường trong máu và huyết áp - những yếu tố rất quan trọng để giảm nguy cơ tiền sản giật ở phụ nữ mang thai.

', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP038', N'Hạt hồ đào', 100, 40, 100, N'https://i.imgur.com/jhf6Olz.jpg', N'Túi (250gram)', N'Bề mặt hạt hồ đào có rãnh, hình bầu dục. Khi ăn loại hạt này, bạn sẽ cảm nhận vị béo, bùi và hơi ngọt. Bài viết sau, Hello Bacsi sẽ giới thiệu những giá trị mà loại hạt này mang đến cho sức khỏe cũng như thông tin thú vị kèm theo.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP039', N'Hạt Mắc ca (Macadamia)', 200, 100, 100, N'https://i.imgur.com/Y6SoIV2.jpg', N'Hộp (500g)', N'Loại hạt dinh dưỡng đến từ vùng nhiệt đới này còn đi kèm theo vô số lợi ích cho sức khỏe. Ngoài mang đến rất nhiều vitamin và khoáng chất, hạt mắc ca còn chứa chất xơ, giúp cân bằng hệ tiêu hóa. Macadamia cũng có tác dụng giúp kiểm soát lượng đường trong máu và giảm viêm.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP040', N'Hạt dẻ cười (hồ trăn)', 120, 70, 100, N'https://i.imgur.com/iyptJtD.jpg', N'Hộp (300g)', N'Hạt dẻ cười có thể được biến tấu thành rất nhiều món ăn đa dạng, từ snack hỗn hợp hạt và trái cây khô (Trail mix), đến các loại bánh và nhiều hơn nữa. Chúng rất giàu chất chống oxy hóa (ví dụ như vitamin E) và khoáng chất (bao gồm kẽm, sắt và selen). Giống như các loại hạt khác, hồ trăn cũng chứa rất nhiều chất xơ, vì vậy rất cần thiết cho hệ tiêu hóa hoạt động tốt.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP041', N'Quả óc chó', 100, 30, 100, N'https://i.imgur.com/BwTq8gi.jpg', N'Túi (1kg)', N'Bên ngoài quả óc chó có hình dạng gần giống với bộ não, bên trong lại rất giàu omega-3 - một chất dinh dưỡng giúp tăng cường sức khỏe trí não. Quả óc chó cũng chứa nhiều loại vitamin và khoáng chất có lợi, giúp giảm nguy cơ mắc các bệnh tim mạch.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP042', N'Hạt sen', 200, 140, 100, N'https://i.imgur.com/BwTq8gi.jpg', N'Túi (1kg)', N'Trong các loại hạt tốt cho bà bầu thì chắc chắn sẽ không thể bỏ qua hạt sen. Loại hạt này rất giàu protein, canxi, và phốt pho… Đây đều là những chất rất tốt cho thận, lá lách, sức khỏe tinh thần và tâm trạng của mẹ bầu. Đồng thời, hạt sen cũng có tác dụng tích cực đến sự phát triển của hệ thần kinh và não bộ của thai nhi.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP043', N'Hạt điều', 130, 20, 100, N'https://i.imgur.com/JwUE8PE.jpg', N'Hộp (500g)', N'Hạt điều có vị thơm ngon, bùi bùi khiến nhiều người yêu thích. Bên cạnh cảm giác ngon miệng, hạt điều còn mang lại một lượng dinh dưỡng lớn cho chúng ta. Trong hạt điều chứa nhiều chất sắt và kẽm. Sắt có vai trò ngăn ngừa bệnh thiếu máu, cung cấp oxy cho tế bào trong cơ thể, trong khi đó kẽm lại tăng cường khả năng miễn dịch. Vì vậy hạt điều rất thích hợp để sử dụng sau một cuộc phẫu thuật hoặc khi bạn mới ốm dậy, đó là thời điểm cơ thể bạn thiếu máu và hệ miễn dịch vẫn còn yếu.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP044', N'Hạt bí', 110, 45, 100, N'https://i.imgur.com/9qXi3Cg.jpg', N'Túi (500g)', N'Hạt bí được nhắc đến khá nhiều trong các loại hạt tốt cho bà bầu. Không chỉ là loại hạt ăn vặt ngon, hạt bí còn cung cấp các dưỡng chất cần thiết cho mẹ bầu như sắt, kali, chất béo, vitamin, calorie… Những hoạt chất này đều rất cần thiết cho sức khỏe của mẹ và sự phát triển của thai nhi.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP045', N'Hạt hướng dương', 100, 40, 100, N'https://i.imgur.com/8IEoNaP.jpg', N'Túi (1kg)', N'Hạt hướng dương có chứa hàm lượng protein tốt hơn bất kỳ loại hạt nào khác, đồng thời chưa một lượng calorie khá thấp. Hơn nữa, vitamin E và axit amin có trong hạt hướng dương sẽ giúp cải thiện sức đề kháng, giúp bà bầu có một thai kỳ an toàn và tránh được các nguy cơ sẩy thai.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP003', N'SP046', N'Nho khô', 120, 50, 100, N'https://i.imgur.com/JJr931J.jpg', N'Túi (500g)', N'Đối với mẹ bầu, nho khô có tác dụng cung cấp máu cho cơ thể nhờ hàm lượng vitamin B, sắt và một số dưỡng chất quan trọng khác. Bên cạnh đó, ăn nho khô cũng sẽ là cách để thai phụ hạn chế tình trạng táo bón, khó tiêu, viêm lợi, chảy máu chân răng,…

Nho khô được xếp vào danh sách các loại hạt tốt cho bà bầu còn bởi tác dụng rất tốt cho thai nhi như tăng cường thị lực, giảm nguy cơ mắc các khuyết tật bẩm sinh về mắt, tốt cho hệ xương,…', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP047', N'Anh đào ', 140, 20, 100, N'https://i.imgur.com/JJr931J.jpg', N'Kg', N'Quả cherry là một loại trái cây được nhiều người yêu thích vì hương vị thơm ngon và những giá trị dinh dưỡng tuyệt vời mà nó mang lại', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP048', N'Bơ', 140, 20, 100, N'https://i.imgur.com/8nNAVrF.jpg', N'Gam', N'Bơ chứa gần 20 vitamin và khoáng chất như kali, lutein và folate trong mỗi khẩu phần. Bơ có ít đường và chứa chất xơ. Dưới đây là những lợi ích sức khỏe của bơ được công bố bởi nghiên cứu khoa học.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP049', N'Chuối', 130, 20, 100, N'https://i.imgur.com/7LWssNY.jpg', N'500g', N'Chuối là loại thực phẩm tốt cho sức khỏe, bởi nó có chứa một số chất dinh dưỡng thiết yếu và cung cấp lợi ích cho tiêu hoá, sức khoẻ tim và giảm cân. Bên cạnh đó, chuối cũng là một món ăn vặt rất tiện lợi.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP050', N'Dưa Hấu', 103, 33, 100, N'https://i.imgur.com/m55GmuF.jpg', N'Kg', N'Nước là thành phần chiếm tới 95% quả dưa hấu. Chính vì vậy, bổ sung dưa hấu sẽ giúp giữ nước cho cơ thể và duy trì nồng độ điện giải. Ăn dưa hấu thường xuyên có thể giảm các triệu chứng mất nước sau khi vận động mạnh, luyện tập thể thao như chuột rút, mệt mỏi, choáng…', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP051', N'Cam', 140, 40, 100, N'https://i.imgur.com/YIOuAPf.jpg', N'500g', N'Bạn luôn biết cam là loại quả giàu các chất dinh dưỡng như: vitamin C, chất xơ, folate, chất chống oxy hóa nhưng rất ít calo và đường. Những lý do sau đây sẽ khuyến khích bạn nên ăn loại quả kỳ diệu này hàng ngày để bồi bổ cơ thể.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP052', N'Chanh Tây (chanh vàng)', 200, 140, 100, N'https://i.imgur.com/2F0LCoR.jpg', N'Kg', N'Chanh tây hay chanh vàng (lemon) có tên khoa học là Citrus limon, thường được trồng ở những vùng có khí hậu ấm', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP053', N'Chanh', 140, 30, 100, N'https://i.imgur.com/zxoHmzK.jpg', N'Gam', N'Quả chanh được ứng dụng trong rất nhiều lĩnh vực đời sống. Vị chua của chanh là thứ gia vị hoàn hảo để chế biến món ăn ngon', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP054', N'Nho xanh', 150, 20, 100, N'https://i.imgur.com/eraxhHO.jpg', N'Kg', N'Loại quả theo mùa nhất trong thời điểm này chính là quả nho. Nho là loại quả vừa ngon lại có rất nhiều công hiệu tuyệt vời trong việc bảo vệ sức khỏe con người.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP055', N'Nho mỹ nhân chỉ', 150, 50, 100, N'https://i.imgur.com/3GWsBk3.jpg', N'Kg', N'Quả hình thuôn dài như ngón tay người, vỏ mỏng, ăn có vị ngọt,... loại nho có tên “mỹ nhân chỉ” của Trung Quốc', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP056', N'Xoài', 112, 50, 100, N'https://i.imgur.com/xvUaRLB.jpg', N'Kg', N'Xoài chứa các chất chống oxy hóa vitamin A và C, kali, và chất xơ. Xoài rất dễ ăn. Bạn chỉ cần gọt vỏ, cắt bỏ hột lớn, thưởng thức thịt dày, màu cam, và chìm đắm trong vị ngọt của loại trái nhiệt đới này.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP057', N'Acai', 120, 50, 100, N'https://i.imgur.com/vcroWoE.jpg', N'Kg', N'Trái mọng Acai có nguồn gốc từ một loài cọ trong rừng mưa ở Brazil. Loại trái màu đen, nhỏ nhắn, hình tròn này có kích thước bằng một trái việt quất (có hột lớn và không ăn được) và có vị như sôcôla và trái mọng dại. Bạn có thể thấy trái Acai có trong sinh tố và các loại thức uống khác, hoặc được phơi khô và trộn với bánh ngũ cốc ăn sáng. Acai giàu anthocyanins (loại chất làm trái có màu tím) và các axít béo thiết yếu.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP058', N'Đu đủ', 140, 80, 100, N'https://i.imgur.com/h4L9PWl.jpg', N'Kg', N'Đu đủ chỉ có 118 calo, nhiều vitamin C và chứa nhiều axít folic (loại vitamin cần thiết cho quá trình tạo và duy trì tăng trưởng của tế bào) và kali. Đu đủ chứa enzyme papain, loại chất dùng làm mềm thịt và rất hữu dụng để tiêu hóa đạm. Hãy thưởng thức đu đủ tươi hoặc nướng, vắt thêm một miếng chanh thì tuyệt vời.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP059', N'Kiwi', 160, 70, 100, N'https://i.imgur.com/Rauo1Fr.jpg', N'400g', N'Kiwi là một loại quả ăn rất ngon, đẹp mắt và khá hấp dẫn người sử dụng. Quả kiwi ngày càng được sử dụng rộng rãi ở nước ta. Đặc biệt lợi ích của quả kiwi đối với sức khỏe cũng cực tốt nữa nhé.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP004', N'SP060', N'Táo', 110, 50, 100, N'https://i.imgur.com/sFTh5pt.jpg', N'500g', N'Táo tây hay pom là một loại trái cây được nhiều người ưa thích hương thơm nhẹ vị ngọt hơi chua. Những có thể bạn chưa biết chúng còn cung cấp hàm lượng lớn vitamin C, vitamin B (niacin , vitamin B6), các chất chống oxy hóa, kali, chất xơ', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP061', N'Hạt mè', 120, 40, 100, N'https://i.imgur.com/XHifFMY.jpg', N'Kg', N'Trong hạt mè (vừng) có chứa nhiều dưỡng chất như: protein (đạm), lipit (chất béo), gluxit (chất bột đường), calo nhiệt lượng, canxi, photpho, sắt và các vitamin (như B1, B2, niacin...).

Ngoài ra trong hạt mè còn có folic acid, saccharose, pentose, hắc sắc tố... Và đặc biệt là hàm lượng vitamin E rất lớn, đứng hàng đầu trong các thực phẩm (100 g mè đen chứa tới 5.14 mg vitamin E).', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP062', N'Gạo nếp cái hoa vàng', 120, 60, 100, N'https://i.imgur.com/TgCLk8N.jpg', N'Kg', N'Loại gạo này được xem là đặc sản của các tỉnh miền Bắc. Với chất lượng gạo to tròn, béo múp, màu sắc trắng ngà, có độ bám dính cao, dẻo thơm, ngon miệng.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP063', N'Nếp cẩm', 150, 70, 100, N'https://i.imgur.com/8UDT1px.jpg', N'Kg', N'Nếp cẩm còn được gọi là “bổ huyết mễ”, là một loại gạo có thành phần dinh dưỡng rất cao. So với các loại gạo khác, nếp cẩm có hàm lượng protein cao hơn 6,8% và chất béo cao hơn 20%. Không chỉ thế, nó còn chứa tới 8 loại axit amin cùng carotene và các nguyên tố vi lượng cần thiết. Trong gạo nếp cẩm chứa chất xơ, chất chống oxy hóa tương đương với quả việt quất hay quả mâm xôi, đặc biệt là nguồn vitamin E phong phú.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP064', N'Gạo Tám Thái đỏ Bảo Minh', 140, 86, 100, N'https://i.imgur.com/sX8Ma8N.jpg', N'5Kg', N'Loại gạo đầu tiên trong danh sách là gạo thám Thái đỏ Bảo Minh. Chất lượng gạo từ lâu đã được nhiều người tiêu dùng yêu thích. Gạo có hương thơm ngon đặc biệt và độ dẻo mềm ngon miệng. Ngoài ra, nó còn có hàm lượng dinh dưỡng cao, tốt cho sức khỏe người dùng.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP065', N'Gạo lứt', 120, 65, 100, N'https://i.imgur.com/KydmDbJ.jpg', N'Kg', N'Là loại gạo phù hợp với người ăn kiêng bởi hàm lượng dinh dưỡng cao nhưng lại không gây béo phì, tăng cân. Hạt gạo vẫn giữ lại được vỏ cám bên trong nên cho ra chất lượng món cơm, cháo hoàn hảo khi nấu.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP066', N'Gạo lứt huyết rồng', 110, 79, 100, N'https://i.imgur.com/kCOluaf.jpg', N'Kg', N'Với những đặc điểm tiêu biểu như hạt gạo dài, màu nâu đỏ khác lạ với hàm lượng dinh dưỡng cao mà không chứa nhiều tinh bột nên gạo lứt huyết rồng cũng là sự lựa chọn tối ưu dành cho những ai đang ăn kiêng.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP067', N'Gạo tám xoan', 140, 80, 100, N'https://i.imgur.com/OoCkjq0.jpg', N'Kg', N'Là loại gạo có mùi thơm đặc biệt, hạt gạo nhỏ dài, kích thước đều đặn nhau. Một năm chỉ trồng và sản xuất được một vụ mùa nên đó cũng là lý do loại gạo này trở nên quý giá và đắt đỏ hơn', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP068', N'Gạo sữa Mai Vàng', 150, 90, 100, N'https://i.imgur.com/ZZ9zhg0.jpg', N'Kg', N'Hương thơm tinh tế, dịu ngọt vị khi ăn, hạt cơm nở đẹp, đều khi nấu chín là những ưu điểm của dòng gạo này.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP069', N'Yến mạch', 130, 70, 100, N'https://i.imgur.com/5CcnIII.jpg', N'500g', N'Ban đầu khi yến mạch xuất hiện ở Việt Nam ít người sử dụng loại ngũ cốc này tuy nhiên càng về sau càng có nhiều người tin dùng vì sản phẩm này đặc biệt tốt cho người tiểu đường, lại giàu chất xơ, vitamin và khoáng chất, ngoài ra yến mạch còn có chất chống oxy hóa avenanthramide bảo vệ tim khỏi các bệnh khác nhau, giảm nguy cơ ung thư ruột kết và huyết áp thấp.', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP070', N'Lúa mạch', 200, 80, 100, N'https://i.imgur.com/5cFVHy0.jpg', N'Kg', N'Khi nhắc đến yến mạch thì chắc chắn phải có lúa mạch một loại ngũ cốc nguyên hạt giúp bổ sung tuyệt vời cho chế độ ăn uống lành mạnh. Bên cạnh đó lúa mạch còn chứa nhiều khoáng chất và vitamin rất tốt như: mangan, sắt, kali, phốt pho, magiê, selen, đồng, kẽm, vitamin B và chất xơ.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP005', N'SP071', N'Lúa mì nguyên chất', 150, 70, 100, N'https://i.imgur.com/AlWDTBx.jpg', N'500g', N'Lúa mì nguyên chất được các chuyên gia đánh giá là chứa thành phần dinh dưỡng tốt hơn so với lúa mì thông thường. Không những thế lúa mì nguyên chất có nhiều chất chống oxy hóa, chất xơ, vitamin và khoáng chất.

Lúa mì nguyên chất là thành phần có trong một số loại thực phẩm như: mì, mì ống, bulgur và semolina.', 1)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP072', N'Đậu phộng', 240, 120, 100, N'https://i.imgur.com/eCwYJLl.jpg', N'Kg', N'Dầu đậu phộng là một loại dầu thực vật được sản xuất từ ​​hạt của cây lạc.

Dầu thực vật này thường được sử dụng ở nhiều nơi trên thế giới và được coi là một mặt hàng chủ lực trong các món ăn Đông Nam Á và Trung Quốc.', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP073', N'Đậu hà lan', 130, 60, 100, N'https://i.imgur.com/BYGXyMB.jpg', N'Gam', N'Đậu Hà lan rất bổ dưỡng và chứa nhiều carbohydrate phức - là nguồn cung cấp năng lượng từ từ và bền vững hơn.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP074', N'Đậu xanh', 140, 85, 100, N'https://i.imgur.com/wvnwnrP.jpg', N'Gam', N'Tác dụng của đậu xanh có thể giúp phòng ngừa các bệnh nguy hiểm, cải thiện hệ tiêu hóa và thậm chí bạn còn có thể giảm cân bằng đậu xanh.. Tác dụng của đậu xanh có thể giúp phòng ngừa các bệnh nguy hiểm, cải thiện hệ tiêu hóa và thậm chí bạn còn có thể giảm cân bằng đậu xanh. Đậu xanh vừa dễ nấu, linh hoạt mà còn có nhiều tác dụng tốt cho sức khỏe.', 5)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP075', N'Đậu nành', 160, 70, 100, N'https://i.imgur.com/eRMhrQi.jpg', N'Gam', N'Từ đậu nành có thể chế biến ra rất nhiều món ăn đa dạng, có giá trị dinh dưỡng cao. Người ta có thể dùng đậu nành nguyên hạt thô hoặc đem ép để lấy dầu đậu nành (soya oil), ủ men để làm tương, xay bột chế biến thành chế biến thành đậu phụ, làm bánh kẹo, sữa đậu nành, tàu hủ, sữa chua yohurt... đáp ứng nhu cầu đạm trong khẩu phần ăn hàng ngày của người cũng như nuôi gia cầm, gia súc….', 2)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP076', N'Đậu đỏ', 140, 60, 100, N'https://i.imgur.com/oWaPU8Y.jpg', N'Gam', N'Đậu đỏ có tên Vigna angularis, là cây dây leo hàng năm thuộc phân họ Đậu. Hạt đậu đỏ chứa hàm lượng đáng kể chất xơ và xơ hòa tan, protein, carbohydrat và sắt. Trong đậu đỏ có chứa rất nhiều vitamin: B1, B6, C, E, K,... có tác dụng tăng cường thể lực, giúp cải thiện sức đề kháng, tăng khả năng chống chọi với bệnh tật', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP077', N'Đậu gà', 150, 60, 100, N'https://i.imgur.com/YWFbN8y.jpg', N'500g', N'Hạt đậu gà chứa nhiều dinh dưỡng, dễ dàng kết hợp với các thực phẩm và nguyên liệu khác giúp món ăn thêm hấp dẫn.

Ngoài ra, đậu gà còn là nguồn vitamin, khoáng chất và chất xơ dồi dào, mang lại nhiều lợi ích cho sức khỏe.

Ăn đậu gà sẽ giúp cải thiện tiêu hóa, giảm nguy cơ mắc một số bệnh về đường tiêu hóa, xương …', 3)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP078', N'Đậu đen', 140, 20, 100, N'https://i.imgur.com/3zarW4G.jpg', N'Gam', N'Một loại thực phẩm thanh mát, rất tốt cho sức khỏe.', 4)
INSERT [dbo].[SAN_PHAM] ([MaLoaiSanPham], [MaSanPham], [TenSanPham], [SoLuongNhap], [SoLuongBan], [SoLuongCon], [HinhAnh], [DonViTinh], [MoTa], [Stars]) VALUES (N'LSP006', N'SP079', N'Đậu cúc', 147, 23, 100, N'https://i.imgur.com/pkvW5hx.jpg', N'Kg', N'Đậu cúc là nguồn dinh dưỡng dồi dào. Cũng như các loại đậu, đậu cúc có hàm lượng đạm cao hơn các loại ngũ cốc khác, chứa nhiều sinh tố nhóm B, giàu sắt và nhiều chất xơ, ít chất béo và calorie. Chất đạm trong đậu có chất lượng tương đương đạm trong động vật.', 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 07-01-2021 22:10:48 ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[activeacc]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[activeacc] 
--@ImageID INT,
--@Title VARCHAR(50),
--@Image IMAGE	
@VerificationCode nvarchar(40)
AS
BEGIN
	
	update  KHACH_HANG set active = 1 ,VerificationCode='' where VerificationCode =@VerificationCode
	 

	
END
GO
/****** Object:  StoredProcedure [dbo].[Add_To_Bill]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Add_To_Bill] @MaKhachHang nvarchar(30), @TongTien int, @SoDienThoai nvarchar(14), @DiaChi nvarchar(500), @MaDonHang nvarchar(100) OutPut
As
Begin
	Set @MaDonHang = Cast ((Select FORMAT (GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'North Asia Standard Time', 'dd/MM/yyyy hh:mm:ss','en-us') as date) as nvarchar(100))
	Set @MaDonHang = Replace((Select Replace((Select Replace(@MaDonHang,'/','')),':','')),' ','-')
	Set @MaDonHang = Cast(@MaDonHang as nvarchar(100))
	Set @MaDonHang = Cast('DH'+@MaKhachHang+@MaDonHang as nvarchar(100))
	Insert into dbo.Don_Hang
	(MaDonHang,MaKhachHang,TrangThai,TongTien,NgayMua,SoDienThoai,DiaChi)
	Values(@MaDonHang,@MaKhachHang,0,@TongTien,getDate(),@SoDienThoai,@DiaChi)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_To_Bill_Detail]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Add_To_Bill_Detail] @MaDonHang nvarchar(100), @TongTien int, @SoLuong int, @DonGia int, @MaSanPham nvarchar(40)
As

Begin
	

-- Thêm đơn hàng cho khách
	Declare @MaChiTietDonHang nvarchar(100)
	-- Nếu trong đơn hàng chưa có sản phẩm nào
	If(Select Count(*) From dbo.Chi_Tiet_Don_Hang Where MaDonHang = @MaDonHang) = 0
		Begin
			Begin
				-- Sản phẩm đầu tiên của đơn hàng
				Select @MaChiTietDonHang = @MaDonHang+'_CTDH'+'001'
				Insert Into dbo.Chi_Tiet_Don_Hang(MaChiTietDonHang,MaSanPham,MaDonHang,SoLuong,GiaBan,ThanhTien)
				Values(@MaChiTietDonHang,@MaSanPham,@MaDonHang,@SoLuong,@DonGia,@SoLuong*@DonGia)
			End
		End
	Else
		-- Nếu trong chi tiết đơn hàng đã có sản phẩm
		Begin
			Declare @MaChiTietDonHangChange nvarchar(100), @MaChiTietDonHangTail nvarchar(100), @MaChiTietDonHangHead nvarchar(100), @ID int
			Select @MaChiTietDonHangChange = (Select Top(1) MaChiTietDonHang From dbo.Chi_Tiet_Don_Hang Where MaDonHang = @MaDonHang Order By MaChiTietDonHang DESC)
			Select @MaChiTietDonHangTail = Right(@MaChiTietDonHangChange,3)
			Declare @LenMaChiTietDonHangChange int = Len(@MaChiTietDonHangChange)
			Select @MaChiTietDonHangHead = Left(@MaChiTietDonHangChange,@LenMaChiTietDonHangChange-3)
			Select @ID = Cast(@MaChiTietDonHangTail as int) + 1
			Select @MaChiTietDonHang= Cast(@ID as nvarchar(50))
			While LEN(@MaChiTietDonHang) <3 
				Begin
					Select @MaChiTietDonHang = '0'+@MaChiTietDonHang
				End
			Select @MaChiTietDonHang = @MaChiTietDonHangHead + @MaChiTietDonHang
			Begin
				Insert Into dbo.Chi_Tiet_Don_Hang(MaChiTietDonHang,MaSanPham,MaDonHang,SoLuong,GiaBan,ThanhTien)
				Values(@MaChiTietDonHang,@MaSanPham,@MaDonHang,@SoLuong,@DonGia,@SoLuong*@DonGia)
			End
		End
End
GO
/****** Object:  StoredProcedure [dbo].[Add_To_Cart]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Add_To_Cart] @MaKhachHang nvarchar(30), @MaSanPham nvarchar(40), @DonGia int , @SoLuong int
As
Begin
	-- Thêm giỏ hàng cho khách hàng
	Exec Insert_To_Cart @MaKhachHang 
	Declare @MaGioHang nvarchar(40), @MaChiTietGioHang nvarchar(50)
	Select @MaGioHang = (Select MaGioHang From dbo.Khach_Hang Where MaKhachHang = @MaKhachHang or IDFaceBook+'mkh'=@MaKhachHang)
	-- Nếu trong giỏ hàng chưa có sản phẩm nào
	If(Select Count(*) From dbo.CHI_TIET_GIO_Hang Where MaGioHang = @MaGioHang ) = 0
		Begin
			Begin
				-- Sản phẩm đầu tiên của giỏ hàng
				Select @MaChiTietGioHang = @MaGioHang+'_CTGH'+'001'
				Insert Into dbo.Chi_Tiet_Gio_Hang(MaChiTietGioHang,MaSanPham,MaGioHang,SoLuong,DonGia)
				Values(@MaChiTietGioHang,@MaSanPham,@MaGioHang,@SoLuong,@DonGia)
			End
		End
	Else
	-- Nếu trong giỏ hàng đã có sản phẩm
		Begin
	-- Kiểm tra sẽ sản phẩm chọn xem có trong giỏ hàng chưa ( Nếu chưa có thì thêm số lượng là 1, còn nếu có rồi thì trường số lượng tự động tăng thêm 1)
			Declare @MaChiTietGioHangChange nvarchar(50), @MaChiTietGioHangTail nvarchar(50), @MaChiTietGioHangHead nvarchar(50), @ID int
	-- Sản phẩm đó chưa có trong giỏ hàng 
			If (Select Count(*) From dbo.CHI_TIET_Gio_Hang Where MaSanPham = @MaSanPHam) = 0
				Begin
					Select @MaChiTietGioHangChange = (Select Top(1) MaChiTietGioHang From dbo.Chi_Tiet_Gio_Hang Order By MaChiTietGioHang DESC)
					Select @MaChiTietGioHangTail = Right(@MaChiTietGioHangChange,3)
					Declare @LenMaChiTietGioHangChange int = Len(@MaChiTietGioHangChange)
					Select @MaChiTietGioHangHead = Left(@MaChiTietGioHangChange,@LenMaChiTietGioHangChange-3)
					Select @ID = Cast(@MaChiTietGioHangTail as int) + 1
					Select @MaChiTietGioHang= Cast(@ID as nvarchar(50))
					While LEN(@MaChiTietGioHang) <3 
						Begin
							Select @MaChiTietGioHang = '0'+@MaChiTietGioHang
						End
					Select @MaChiTietGioHang = @MaChiTietGioHangHead + @MaChiTietGioHang
					Begin
						Insert Into dbo.Chi_Tiet_Gio_Hang(MaChiTietGioHang,MaSanPham,MaGioHang,SoLuong,DonGia)
						Values(@MaChiTietGioHang,@MaSanPham,@MaGioHang,@SoLuong,@DonGia)
					End
			End
		-- Sản phẩm đó đã có trong giỏ hàng
		Else
			Begin
				Begin
					Update dbo.Chi_Tiet_Gio_Hang
					Set SoLuong = SoLuong + @SoLuong
					Where  MaGioHang = 'GH_'+@MaKhachHang And MaSanPham = @MaSanPham
				End
			End
	End
End
GO
/****** Object:  StoredProcedure [dbo].[Add_To_invoice]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Add_To_invoice] 
@ThanhTien int, 
@maNhaCungCap nvarchar(14), @DiaChi nvarchar(500),@maHoaDonNhap nvarchar(30) OutPut
As
Begin
	Set @maHoaDonNhap = Cast ((Select FORMAT (GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'North Asia Standard Time', 'dd/MM/yyyy hh:mm:ss','en-us') as date) as nvarchar(100))
	Set @maHoaDonNhap = Replace((Select Replace((Select Replace(@maHoaDonNhap,'/','')),':','')),' ','-')
	Set @maHoaDonNhap = Cast(@maHoaDonNhap as nvarchar(100))
	Set @maHoaDonNhap = Cast('HD'+@maNhaCungCap+@maHoaDonNhap as nvarchar(100))
	Insert into dbo.HOA_DON_NHAP_HANG
	Values(@maHoaDonNhap,@maNhaCungCap,getDate(),@ThanhTien)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_User]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Add_User] @TenNhanVien nvarchar(100),@GioiTinh nvarchar(5),
					@NgaySinh date, @DiaChi nvarchar(200),
					@Email nvarchar(100),@MaLoaiNhanVien nvarchar(20),
					@HinhAnh nvarchar(50) ,@SDT nvarchar(14)
As
Begin
	Declare @MaNhanVien nvarchar(20)
	Select @MaNhanVien = Cast((Cast(Right((Select Top(1) MaNhanVien From dbo.NHAN_VIEN_ Order By MaNhanVien Desc),3) as int)+1) as nvarchar)
	While LEN(@MaNhanVien) < 3
		Begin
			Select @MaNhanVien = '0'+@MaNhanVien
		End
	Select @MaNhanVien = 'NV'+@MaNhanVien
	Insert into dbo.NHAN_VIEN_
	Values(@MaNhanVien,@TenNhanVien,@MaLoaiNhanVien,@GioiTinh,@NgaySinh,GetDate(),@DiaChi,@SDT,@Email,'123',@HinhAnh,'')
End
GO
/****** Object:  StoredProcedure [dbo].[addDiscount]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addDiscount] 
@maSanPham nvarchar(50),
@phantram int,
@ngayApDung datetime,
@ngayKetThuc datetime
as
	begin
	declare  @maGiagiam nvarchar(50)
	Select @maGiagiam = Cast((Cast(Right((Select Top(1) MaGiaGiam From dbo.GIA_GIAM Order By MaGiaGiam Desc),3) as int)+1) as nvarchar)
			While LEN(@maGiagiam) < 3
			Begin
				Select @maGiagiam = 'GG0'+@maGiagiam
			End
	insert into GIA_GIAM values(@maGiagiam,@maSanPham,@phantram,@ngayApDung,@ngayKetThuc)
	
	end
GO
/****** Object:  StoredProcedure [dbo].[addPrice]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addPrice] 
@maSanPham nvarchar(50),
@giaBan nvarchar(50),
@ngayApDung datetime,
@ngayKetThuc datetime
as
	begin
	declare  @maGiaBan nvarchar(50)
	Select @maGiaBan = Cast((Cast(Right((Select Top(1) MaGiaBan From dbo.GIA_BAN Order By MaGiaBan Desc),3) as int)+1) as nvarchar)
			While LEN(@MaGiaBan) < 3
			Begin
				Select @maGiaBan = 'GB0'+@maGiaBan
			End
	insert into gia_ban values(@maGiaBan,@maSanPham,@giaBan,@ngayApDung,@ngayKetThuc)
	
	end
GO
/****** Object:  StoredProcedure [dbo].[ChangePass]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[ChangePass] @matKhauCu nvarchar(50),@maNhanVien nvarchar(30), @matKhau nvarchar(50), @rowEffect nvarchar(100) OutPut
As
Begin
	update NHAN_VIEN_ set matKhau=@matKhau where MaNhanVien=@maNhanVien and matKhau=@matKhauCu
	select @rowEffect= @@ROWCOUNT
	print @rowEffect
End
GO
/****** Object:  StoredProcedure [dbo].[confirmOrder]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[confirmOrder] @MaDonHang nvarchar(100),@MaNhanVien nvarchar(10),@affected int output
As
Begin
	if(@MaNhanVien!='')
	begin
		update DON_HANG set TrangThai='1',MaNhanVien=@MaNhanVien,NgayXacThuc=GETDATE() 
		where MaDonHang=@MaDonHang
		SELECT @affected=@@ROWCOUNT
		print 's'
	end
	else
	begin
	update DON_HANG set TrangThai='1',NgayXacThuc=GETDATE() where MaDonHang=@MaDonHang
		SELECT @affected=@@ROWCOUNT

	end
	End
GO
/****** Object:  StoredProcedure [dbo].[Delete_To_Cart]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Delete_To_Cart] @MaKhachHang nvarchar(100)
As
Begin
	Delete dbo.CHI_TIET_GIO_HANG 
	Where MaGioHang = 'GH_'+@MaKhachHang
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Profile]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Edit_Profile]
@maNhanVien nvarchar(10),
@tenNhanVien nvarchar(100)
,@gioiTinh nvarchar(5)
,@ngaySinh date
,@diaChi nvarchar(100)
,@SodienThoai nvarchar(14)
,@Email nvarchar(100)
,@HinhAnh nvarchar(50)
as
begin
update nhan_vien_ set tennhanvien=@tenNhanVien
,gioiTinh=@gioiTinh,ngaysinh=@ngaySinh
,diachi=@diachi,sodienthoai=@sodienthoai,email=@email,hinhanh=@hinhanh where manhanvien=@manhanvien
end
GO
/****** Object:  StoredProcedure [dbo].[Edit_Profile_User]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Edit_Profile_User]
@maNhanVien nvarchar(10),
@tenNhanVien nvarchar(100),
@maLoaiNhanVien nvarchar(10),
@gioiTinh nvarchar(5),
@ngaySinh date,
@diaChi nvarchar(100),
@SodienThoai nvarchar(14),
@Email nvarchar(100),
@HinhAnh nvarchar(50)
as
begin
	Update NHAN_VIEN_ Set
	TenNhanVien=@tenNhanVien,
	GioiTinh=@gioiTinh ,ngaysinh=@ngaySinh,
	DiaChi=@diachi,sodienthoai=@sodienthoai,
	Email=@email,hinhanh=@hinhanh,
	MaLoaiNhanVien = @maLoaiNhanVien
		Where manhanvien=@manhanvien
end
GO
/****** Object:  StoredProcedure [dbo].[EditPrice]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditPrice] 
@maGiaBan nvarchar(50),
@maSanPham nvarchar(50),
@giaBan nvarchar(50),
@ngayApDung datetime,
@ngayKetThuc datetime
as
	begin
		If @ngayKetThuc is null
		Begin
			Update GIA_BAN Set NgayKetThuc = GETDATE()
				Where MaGiaBan = @maGiaBan
			Select @maGiaBan = Cast((Cast(Right((Select Top(1) MaGiaBan From dbo.GIA_BAN Order By MaGiaBan Desc),3) as int)+1) as nvarchar)
			While LEN(@MaGiaBan) < 3
			Begin
				Select @maGiaBan = 'GB0'+@maGiaBan
			End
			Insert into dbo.GIA_BAN
			(MaGiaBan,MaSanPham,GiaBan,NgayApDung)
			Values(@maGiaBan,@maSanPham,@giaBan,GETDATE())
		End
		Else
		Begin
			Update Gia_Ban
				Set GiaBan=@giaBan,
				ngayapdung=@ngayApDung,
				ngayketthuc=@ngayKetThuc
			where magiaban=@maGiaBan
			Select @maGiaBan = Cast((Cast(Right((Select Top(1) MaGiaBan From dbo.GIA_BAN Order By MaGiaBan Desc),3) as int)+1) as nvarchar)
			While LEN(@MaGiaBan) < 3
			Begin
				Select @maGiaBan = '0'+@maGiaBan
			End
			Insert into dbo.GIA_BAN
			(MaGiaBan,MaSanPham,GiaBan,NgayApDung,NgayKetThuc)
			Values(@maGiaBan,@maSanPham,@giaBan,@ngayApDung,@ngayKetThuc)
		End
	
	end
GO
/****** Object:  StoredProcedure [dbo].[fillinfo]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fillinfo] 
@TaiKhoan nvarchar(50),
@MatKhau nvarchar(50),
@TenKhachHang nvarchar(50),
@Address NVARCHAR(50),
@SoDienThoai nvarchar(13),
@Sex bit,
@DateOfBirth date,
@AnhDaiDien Nvarchar(200),
@IdFaceBook Nvarchar(50)
AS
	BEGIN
	UPDATE [dbo].[KHACH_HANG]
	SET 
	tenkhachhang=@TenKhachHang,DiaChi=@Address,SoDienThoai=@SoDienThoai,GioiTinh=@Sex,NgaySinh=@DateOfBirth,Active='2',HinhAnh=@AnhDaiDien where (taikhoan =@TaiKhoan and matkhau=@MatKhau) or IDFaceBook=@IdFaceBook
	
	END
GO
/****** Object:  StoredProcedure [dbo].[Get_Comment_Product_FeebBack]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Get_Comment_Product_FeebBack] @maSanPham nvarchar(20)
As
Select KH.MaKhachHang,KH.HinhAnh, FB.* From dbo.KHACH_HANG KH Right Join dbo.FEED_BACK FB 
	On KH.MaKhachHang = FB.MaKhachHang
		Where FB.MaSanPham = @maSanPham
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductInfo]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetAllProductInfo] @page int, @pagesize int
As
Select PAAPT.*,PAAPDT.GiaBan - PAAPDT.GiaBan * PAAPDT.PhanTram / 100 N'Giá Khuyến Mại' , PAAPDT.NgayBatDau,PAAPDT.NgayKetThuc
	From ProductAndAllPriceTest PAAPT Left Join ProductAndAllPriceDiscountTest PAAPDT 
		On PAAPT.MaSanPham = PAAPDT.MaSanPham
            Order by PAAPT.MaSanPham asc
				Offset @pagesize * (@page- 1) Rows Fetch next @pagesize rows only 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Auto_Product_Type]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Insert_Auto_Product_Type] @MaLoaiSanPhams nvarchar(20), @TenLoaiSanPham nvarchar(100), @MoTa nvarchar(350)
As
Declare @MaLoaiSanPham nvarchar(20) , @MaLoaiSanPhamHead nvarchar(20),@MaLoaiSanPhamTail nvarchar(20), @ID int
If @MaLoaiSanPhams = ''
Begin
	Select @MaLoaiSanPham = (Select Top(1) MaLoaiSanPham From dbo.LOAI_SAN_PHAM order by MaLoaiSanPham DESC)
	Select @MaLoaiSanPhamTail = SUBSTRING(@MaLoaiSanPham,4,6)
	Select @MaLoaiSanPhamHead = SUBSTRING(@MaLoaiSanPham,0,4)
	Select @ID = Cast(@MaLoaiSanPhamTail as int) + 1
	Select @MaLoaiSanPham= Cast(@ID as nvarchar(20))
	While LEN(@MaLoaiSanPham) <3 
	Begin
		Select @MaLoaiSanPham = '0'+@MaLoaiSanPham
	End
	Select @MaLoaiSanPham = @MaLoaiSanPhamHead + @MaLoaiSanPham
	Select @MaLoaiSanPhams = @MaLoaiSanPham
End
	Insert Into dbo.Loai_San_Pham (MaLoaiSanPham,TenLoaiSanPham,MoTa)
	Values(@MaLoaiSanPhams,@TenLoaiSanPham,@MoTa)
GO
/****** Object:  StoredProcedure [dbo].[Insert_Into_Product]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Insert_Into_Product] (
@MaLoaiSanPham nvarchar(20), @TenSanPham nvarchar(50)
,@SoluongNhap int,@HinhAnh nvarchar(50),@DonViTinh nvarchar(50),@MoTa nvarchar(500),@GiaBan int)

As
Begin
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	Declare @MaGiaBan nvarchar(20), @MaSanPham nvarchar(20)
	Select @MaGiaBan = Cast((Cast(Right((Select Top(1) MaGiaBan From dbo.GIA_BAN Order By MaGiaBan Desc),3) as int)+1) as nvarchar)
	Select @MaSanPham =Cast((Cast(Right((Select Top(1) MaSanPham From dbo.SAN_PHAM Order By MaSanPham Desc),3) as int)+1) as nvarchar)
	While LEN(@MaGiaBan) < 3
		Begin
			Select @MaGiaBan = '0'+@MaGiaBan
		End
	While LEN(@MaSanPham) < 3
		Begin
			Select @MaSanPham = '0'+@MaSanPham
		End
	Select @MaGiaBan = 'GB' + @MaGiaBan 
	Select @MaSanPham  = 'SP' + @MaSanPham
	Insert  Into dbo.SAN_PHAM
	(MaLoaiSanPham,MaSanPham,TenSanPham,SoLuongNhap,SoLuongCon,SoLuongBan,HinhAnh,DonViTinh,MoTa,Stars)
	Values(@MaLoaiSanPham,@MaSanPham,@TenSanPham,@SoluongNhap,@SoluongNhap,0,@HinhAnh,@DonViTinh,@MoTa,5)
	Insert Into dbo.GIA_BAN
	(MaGiaBan,MaSanPham,NgayNhap,GiaBan,NgayApDung)
	Values(@MaGiaBan,@MaSanPham,
	(Select Cast(((Select (GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'North Asia Standard Time'))) as datetime)),
	@GiaBan,(Select Cast(((Select (GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'North Asia Standard Time'))) as date)))
SET NOCOUNT OFF;
SET XACT_ABORT OFF;
End
GO
/****** Object:  StoredProcedure [dbo].[Insert_To_Cart]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Insert_To_Cart]( @maKhachHang nvarchar(30))
As
	Declare @MaGioHang nvarchar(40)
	-- Nếu trong 
	If	(Select Count (*) From dbo.KHACH_HANG KH Where (KH.MaKhachHang = @MaKhachHang or kh.IDFaceBook+'mkh'=@maKhachHang) And KH.MaGioHang Is Not Null) = 0
	Begin
		Select @MaGioHang = 'GH_'+ (Select KH.MaKhachHang From dbo.KHACH_HANG KH
					Where KH.MaKhachHang = @maKhachHang or kh.IDFaceBook+'mkh'=@maKhachHang) 
		Insert  Into dbo.GIO_HANG_(MaGioHang,NgayMua)
		Values(@MaGioHang,GetDate())
		Update dbo.KHACH_HANG
		Set MaGioHang = @MaGioHang
		Where MaKhachHang = @maKhachHang or IDFaceBook+'mkh'=@maKhachHang
	End
	Else
	Begin
		Update dbo.Gio_Hang_
		Set NgayMua = GetDate()
		Where MaGioHang = @MaGioHang
	End
GO
/****** Object:  StoredProcedure [dbo].[Insert_To_Cart_Details]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Them Chi Tiet Gio Hang
CREATE Proc [dbo].[Insert_To_Cart_Details](@maChiTietGioHang nvarchar(20),@maGioHang nvarchar(20),@maSanPham nvarchar(20),@donGia int,@soLuong int)
As
	Insert Into dbo.CHI_TIET_GIO_HANG(MaChITietGioHang,MaGioHang,MaSanPham,DonGia,SoLuong)
	Values(@maChiTietGioHang,@maGioHang,@maSanPham,@donGia,@soLuong)
GO
/****** Object:  StoredProcedure [dbo].[Login_FaceBook]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Login_FaceBook] @IDFaceBook nvarchar(200), @TenKhachHang nvarchar(100), @HinhAnh nvarchar(200) 
As
If (Select Count(*) From dbo.KHACH_HANG Where IDFaceBook = @IDFaceBook) = 0
Begin
	Insert into dbo.KHACH_HANG 
	(MaKhachHang,NgayTao,TenKhachHang,IdFaceBook,HinhAnh,Active)
	Values(@IDFaceBook+'mkh',GetDate(),@TenKhachHang,@IdFaceBook,@HinhAnh,1)
End
GO
/****** Object:  StoredProcedure [dbo].[login_google]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[login_google]	 @IDGoogle nvarchar(200), @TenKhachHang nvarchar(100), @HinhAnh nvarchar(200) ,@mail nvarchar(100)
As
If (Select Count(*) From dbo.KHACH_HANG Where MaKhachHang = @IDGoogle+'mkh') = 0
Begin
	Insert into dbo.KHACH_HANG 
	(MaKhachHang,NgayTao,TenKhachHang,Email,HinhAnh,Active)
	Values(@IDGoogle+'mkh',GetDate(),@TenKhachHang,@mail,@HinhAnh,1)
End
GO
/****** Object:  StoredProcedure [dbo].[PostComment]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PostComment]
@MaFeedBack nvarchar(20),
@MaSanPham nvarchar(20),
@MaKhachHang nvarchar(30),
@BinhLuan nvarchar(200),
@HinhAnh nvarchar(100),
@Stars float
AS
Declare @MaFeedBacks nvarchar(20) , @MaFeedBackHead nvarchar(20),@MaFeedBackTail nvarchar(20), @ID int

if (select COUNT(*) from FEED_BACK )　=　0
	begin
			select @MaFeedBacks='FreeFire001'
	end
else
	Begin
		If @MaFeedBack = ''
		Begin
			Select @MaFeedBacks = (Select Top(1) MaFeedBack From dbo.FEED_BACK order by MaFeedBack DESC)
			Select @MaFeedBackTail = SUBSTRING(@MaFeedBacks,9,3)
			Select @MaFeedBackHead = SUBSTRING(@MaFeedBacks,0,9)
			print @MaFeedBackHead
			print @MaFeedBacktail
			Select @ID = Cast(@MaFeedBackTail as int) + 1
			Select @MaFeedBacks= Cast(@ID as nvarchar(20))
			While LEN(@MaFeedBacks) <3 
			Begin
				Select @MaFeedBacks = '0'+@MaFeedBacks
			End
			Select @MaFeedBacks = @MaFeedBackHead + @MaFeedBacks
		End
	End
	
	
Insert into FEED_BACK values(@MaFeedBacks,@MaSanPham,@MaKhachHang,@BinhLuan,@HinhAnh,GETDATE(),@Stars)
Declare @sl int,@sao int

select @sl= COUNT(MaFeedBack) from FEED_BACK where MaSanPham=@MaSanPham
select @sao= CEILING(sum(Stars)/@sl) from FEED_BACK where MaSanPham=@MaSanPham
update SAN_PHAM set Stars=@sao  where MaSanPham=@MaSanPham
GO
/****** Object:  StoredProcedure [dbo].[register]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[register] 
--@ImageID INT,
--@Title VARCHAR(50),
--@Image IMAGE
@MaKhachHang nvarchar(50),
@TaiKhoan nvarchar(50),
@MatKhau nvarchar(50),
@NgayTao datetime ,
@Email nvarchar(100),
@active bit,
@VerificationCode nvarchar(40)
AS
BEGIN
	
	INSERT INTO KHACH_HANG                             
	 (MaKhachHang,TaiKhoan,MatKhau,NgayTao,Email,Active,VerificationCode)VALUES
	(@MaKhachHang,@TaiKhoan,@MatKhau,@NgayTao  ,@Email ,@Active,@VerificationCode)

	
	end
GO
/****** Object:  StoredProcedure [dbo].[resendmail]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[resendmail] 
@TaiKhoan nvarchar(50),
@Email NVARCHAR(50),
@VerificationCode nvarchar(50)
AS
	BEGIN
	UPDATE [dbo].[KHACH_HANG]
	SET 
	VerificationCode=@VerificationCode where email =@Email and taikhoan=@taikhoan
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Get_data]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_Get_data]

@Pageindex int ,

@Pagesize int

as

begin

Select * from [dbo].[SAN_PHAM] order by masanpham desc Offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only


end
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
GO
/****** Object:  StoredProcedure [dbo].[Update_Amount_In_Cart_Details]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Update_Amount_In_Cart_Details]
@MaChiTietGioHang nvarchar(100), @SoLuong int
As
Begin
	Update dbo.Chi_Tiet_Gio_Hang
		Set SoLuong = @SoLuong
	Where MaChiTietGioHang = @MaChiTietGioHang 
End
Select * From dbo.CHIET_KHAU
GO
/****** Object:  StoredProcedure [dbo].[Update_Profile_User]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Update_Profile_User]
@maNhanVien nvarchar(10),
@tenNhanVien nvarchar(100),
@maLoaiNhanVien nvarchar(10),
@gioiTinh nvarchar(5),
@ngaySinh date,
@diaChi nvarchar(100),
@SodienThoai nvarchar(14),
@Email nvarchar(100),
@HinhAnh nvarchar(50)
as
begin
	Update NHAN_VIEN_ Set
	TenNhanVien=@tenNhanVien,
	GioiTinh=@gioiTinh ,ngaysinh=@ngaySinh,
	DiaChi=@diachi,sodienthoai=@sodienthoai,
	Email=@email,hinhanh=@hinhanh,
	MaLoaiNhanVien = @maLoaiNhanVien
		Where manhanvien=@manhanvien
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 07-01-2021 22:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateProduct]
@masanpham nvarchar(10),
@tensanpham nvarchar(50),
@hinhanh nvarchar(50),
@donvitinh nvarchar(10),
@mota nvarchar(500),
@giamoi int
as
begin
	update SAN_PHAM set TenSanPham=@tensanpham,HinhAnh=@hinhanh,DonViTinh=@donvitinh,@mota=@mota where MaSanPham=@masanpham
	update GIA_BAN set NgayKetThuc=getdate() where MaSanPham=@masanpham and NgayKetThuc is null
	declare  @maGiaBan nvarchar(50)
	Select @maGiaBan = Cast((Cast(Right((Select Top(1) MaGiaBan From dbo.GIA_BAN Order By MaGiaBan Desc),3) as int)+1) as nvarchar)
			While LEN(@MaGiaBan) < 3
			Begin
				Select @maGiaBan = 'GB0'+@maGiaBan
			End
	insert into GIA_BAN values (@maGiaBan,@masanpham,@giamoi,getdate(),null)
end
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
ALTER DATABASE [SHOPFRESHFOOD] SET  READ_WRITE 
GO

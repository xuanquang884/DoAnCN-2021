USE [master]
GO
/****** Object:  Database [TimKiemPT]    Script Date: 12/9/2021 9:45:58 PM ******/
CREATE DATABASE [TimKiemPT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimKiemPT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\TimKiemPT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimKiemPT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\TimKiemPT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TimKiemPT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimKiemPT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimKiemPT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimKiemPT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimKiemPT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimKiemPT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimKiemPT] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimKiemPT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimKiemPT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimKiemPT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimKiemPT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimKiemPT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimKiemPT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimKiemPT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimKiemPT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimKiemPT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimKiemPT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimKiemPT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimKiemPT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimKiemPT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimKiemPT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimKiemPT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimKiemPT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimKiemPT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimKiemPT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimKiemPT] SET  MULTI_USER 
GO
ALTER DATABASE [TimKiemPT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimKiemPT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimKiemPT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimKiemPT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimKiemPT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimKiemPT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimKiemPT', N'ON'
GO
ALTER DATABASE [TimKiemPT] SET QUERY_STORE = OFF
GO
USE [TimKiemPT]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountAdmin]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAdmin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](128) NULL,
	[Name] [nvarchar](128) NOT NULL,
	[SDT] [nvarchar](128) NULL,
	[Password] [nvarchar](128) NOT NULL,
	[Xacnhanpassword] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AccountAdmin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ViTien] [int] NOT NULL,
	[Image] [nvarchar](256) NULL,
	[Facebook] [nvarchar](256) NULL,
	[Zalo] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaUser] [nvarchar](128) NULL,
	[MaTin] [int] NULL,
	[SoTien] [int] NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_GiaoDich] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lien_He]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lien_He](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](255) NOT NULL,
	[Gmail] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](4000) NOT NULL,
	[Ngaytao] [datetime] NULL,
 CONSTRAINT [PK_Lien_He] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[DoUutien] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinDang]    Script Date: 12/9/2021 9:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinDang](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[ChuyenMuc] [nvarchar](250) NOT NULL,
	[TieuDe] [nvarchar](550) NOT NULL,
	[GiaTien] [int] NOT NULL,
	[DienTich] [int] NOT NULL,
	[MoTa] [nvarchar](4000) NULL,
	[NgayDang] [datetime] NULL,
	[MaNguoiDang] [nvarchar](128) NOT NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Image] [nvarchar](550) NULL,
	[LoaiTin] [int] NULL,
	[SoNgay] [int] NULL,
 CONSTRAINT [PK_TinDang] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108090748257_InitialCreate', N'WebTimKiemPhongTro.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829ECE39C85AB97417DBC06E913AC939413717ACB3DBF3B6A025DA2156A254894A1314FD657DE84FEA5FE850A26489175D6CC5768A05161639FC66381C92C3E1307FFEFEC7F8FBA7C0B71E719C90904EECA3D1A16D61EA861EA1CB899DB2C59BF7F6F7DFFDF31FE30B2F78B23E1774279C0E5AD264623F30169D3A4EE23EE00025A380B87198840B3672C3C0415EE81C1F1E7EEB1C1D3918206CC0B2ACF1C7943212E0EC033EA7217571C452E45F871EF613510E35B30CD5BA41014E22E4E289FD139EDF93E0478283BB87902EEFE3709437B2AD339F20106886FD856D214A438618887BFA29C1331603F12C8202E4DF3F4718E816C84FB0E8C6E98ABC6B8F0E8F798F9C55C302CA4D1316063D018F4E848A1CB9F95A8AB64B1582122F40D9EC99F73A53E4C4BEF27056F431F4410132C3D3A91F73E2897D5DB2384BA21BCC4645C3510E791903DC2F61FC7554453CB03AB73B284DEA7874C8FF1D58D3D467698C2714A72C46FE817597CE7DE2FE889FEFC3AF984E4E8EE68B93F76FDF21EFE4DD37F8E46DB5A7D057A0AB1540D15D1C463806D9F0A2ECBF6D39F5768EDCB06C5669936B056C0966876D5DA3A70F982ED903CC9BE3F7B675499EB0579408E3FA44094C2668C4E2143E6F52DF47731F97F54E234FFE7F03D7E3B7EF06E17A831EC9321B7A893F4C9C18E6D547EC67B5C90389F2E9551BEF2F82EC320E03FE5DB7AFBCF6CB2C4C639777263492DCA37889595DBAB1B332DE4E26CDA18637EB0275FF4D9B4BAA9AB7969477689D9950B0D8F66C28E47D59BE9D2DEE2C8A60F032D3E21A693238E39E3592400E2C95746548475D0D894207FFCEEBE24580883FC0C2D8810BB8260B1207B8ECE50F219821A2BD65BE434902EB82F73F943C34880E3F07107D86DD3406739D3114442FCE8D5B2ABE4983399F05DBE335D8D0DCFF125E229785F105E5AD36C6FB10BA5FC3945D50EF1C31FC89B90520FF84D9DD1D601071CE5C1727C9251833F6A62178DE05E0156527C7BDE1F83AB56BC764EA2312E83D136945FD5290AEBC133D85E2A118C8745E4A93A81FC225A1DD442D48CDA2E614ADA20AB2BEA272B06E920A4AB3A01941AB9C39D5607E5F3642C33B7E19ECFE7B7E9B6DDEA6B5A0A2C619AC90F8BF98E2189631EF0E318663BA1A812EEBC62E9C856CF838D317DF9B324E9F919F0ECD6AADD9902D02C3CF860C76FF67432626143F128F7B251D8E430531C077A2D79FB4DAE79C24D9B6A743AD9BDB66BE9D35C0345DCE92247449360B34813011C6A8CB0F3E9CD51ED3C87B23C745A06360E8846F7950027DB365A3BAA5E7D8C70C5B676E1E289CA2C4459EAA46E890D743B06247D508B68A8FD485FB8FC2132C1DC7BC11E287A004662AA14C9D1684BA24427EAB96A4961DB730DEF792875C738E234C39C3564D7461AE0F8770014A3ED2A0B46968EC542CAED9100D5EAB69CCDB5CD8D5B82B518AADD8648BEF6CB04BE1BFBD8861366B6C0BC6D9AC922E0218437BBB30507156E96A00F2C165DF0C543A31190C54B8545B31D0BAC67660A07595BC3A03CD8FA85DC75F3AAFEE9B79D60FCADBDFD61BD5B503DBACE963CF4C33F73DA10D83163856CDF37CCE2BF113D31CCE404E713E4B84AB2B9B08079F61560FD9ACFC5DAD1FEA3483C846D404B832B416507129A8002913AA8770452CAF513AE145F4802DE26E8DB062ED97602B36A062572F472B84E62B54D9383B9D3ECA9E95D6A01879A7C34205476310F2E255EF7807A598E2B2AA62BAF8C27DBCE14AC7C4603428A8C5733528A9E8CCE05A2A4CB35D4B3A87AC8F4BB6919624F7C9A0A5A233836B49D868BB92344E410FB7602315D5B7F081265B11E928779BB26EECE4A953A260EC1872ACC6D7288A085D5672AE448935CB13AEA66F66FD5390821CC371134D2652296DC98985315A62A9165883A497244ED83962688E789C67EA050A99766F352CFF05CBEAF6A90E62B10F14D4FC77DEC27C955FDB72559F44405D424703EED864D1748D19E89B5B3C150EF928D604F0A7A19F06D4EC67995BE7D778D5F679898A307624F9153F4A519AE2EDD647A0D3F8A87363D8B12ABD99F5C7CB0C61D27AE18B56F56EF24FCD2845B8AA8A620A61ED6CFC4C6ECD3A63263B8EFD87AC15E1656699C856A90288A29E1895840705AC52D71DB59E9352C5ACD7744794124FAA9052550F29ABE9253521AB156BE11934AAA7E8CE414D28A9A2ABB5DD9135A92555684DF51AD81A99E5BAEEA89AEC932AB0A6BA3BF62A15455E4BF7781F331E6736DDC8F283EF663B9901E36516C66136C2CAFD7E15A852DC134BDCE02B60A27C2F8DCA78FADBD4A8F2B0C7664665C030AF43B50BF2FA32D478AB6FC6ACDD7AD796FAA65B7F335E3FD37D510351CE803249C9BD3C0B4A67BEB1387FB53FBE510E6439896D156A846DFE396138187182D1EC677FEA13CC17F582E01A51B2C009CB333DECE3C3A363E9E1CEFE3CA27192C4F335E757D34B9AFA986D21698B3EA2D87D40B19A42B1C1439315A8129DBEA21E7E9AD8BF66AD4EB34007FF95151F5857C9274A7E4EA1E23E4EB1F59B9A123A4CE27D87A71EA5A0BFBD8A3714DD557EF5FF2F79D303EB3686E9746A1D4A8A5E67F8EB2F2B7A499337DD409AB5DF5BBCDED9567BBEA0459566CBFAAF15E6840DF252A190F25F017AFA775FD1B4AF113642D4BC38180A6F10159A5E14AC83657C4DE0C127CB5E13F4EBACFE75C13AA2195F1610DA1F4C7E57D07D192A5AEE701FD29C9BB6B124657A6ECDCBDE284973D77B9392BEBDD1445753B47BC00D9A86BD998BF2CAD29B07DB3A35D9CB8361EFD2EE5F3C65795FB294574EFB6E9393B7998FDC70CBF4B74A43DE83C4394D22D0EE938DB76D6BA640F09E676CF64B29DE336313DBFCEE1387B76D6CA600F19E1B5BAFF4E03DB3B55DED9F3BB6B4CE5BE8CE937DD5BC25C3858E2E8ADC96CC9B87DCE1F83F0FC108728F327F83A9CF1E6BCA7C6D61B822313335A7ADC98C9589A3F055289AD9F6EBABD8F01B3B2B689AD91A923D9B788BF5BF91B7A069E66D48A1DC451AB2368951971ADEB28E35E554BDA6B4E35A4F5AB2DCDB7CD6C6DBF9D794653C88526AB3C770BBFC7A928A0751C99053A74712B17A510C7B67E56F39C2FE9D90E50A82FF65478ADDDAAE59D25CD145586CDE9244058914A1B9C60C79B0A59EC58C2C90CBA09A07A0B347E459508F5F83CCB177456F5316A50CBA8C83B95F0B787127A0897F96295D97797C1BF1AF64882E80988407EE6FE90F29F1BD52EE4B4D4CC800C1BD0B11EEE563C978D877F95C22DD84B42390505FE914DDE320F2012CB9A533F488D7910DCCEF035E22F77915013481B40F445DEDE3738296310A1281B16A0F9F60C35EF0F4DD5F02F2B3C2D2540000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[AccountAdmin] ON 

INSERT [dbo].[AccountAdmin] ([ID], [Email], [UserName], [Name], [SDT], [Password], [Xacnhanpassword]) VALUES (8, N'dinhxuanquang1234@gmail.com', N'dinhxuanquang1234', N'Đinh Xuân Quang', N'0328265662', N'Xuanquan@123', N'Xuanquan@123')
INSERT [dbo].[AccountAdmin] ([ID], [Email], [UserName], [Name], [SDT], [Password], [Xacnhanpassword]) VALUES (9, N'nguyenminhquang123@gmail.com', N'Nguyễn Quang', N'Nguyễn Minh Quang', N'0123456789', N'Quang_123@', N'Quang_123@')
SET IDENTITY_INSERT [dbo].[AccountAdmin] OFF
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'100834850479216717756', N'8d67edb3-44ae-4adf-809d-2cab4459d719')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'103546458361013188754', N'32b08177-d492-4965-831a-ed23ddce3a1c')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'106396806049101557459', N'fc5f97da-ef73-4295-b021-6457bf37feb7')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'109818176850833617651', N'506e240f-a0aa-4822-b492-6110939679c4')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [ViTien], [Image], [Facebook], [Zalo]) VALUES (N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'xuanquang0325@gmail.com', 0, N'AB2SKme9yNnrua+CSSWDbxicBWQI4AXt6T63tzOHIUrMQbsOgzoFLJegKjmzyUYafA==', N'98d4f336-83c5-4eda-a245-f9c81c7b4db2', N'0328265662', 0, 0, NULL, 0, 0, N'Xuân Quang', N'Đinh Xuân Quang', 1732222, N'img-3.jpg', N'https://www.facebook.com/', N'0328265662')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [ViTien], [Image], [Facebook], [Zalo]) VALUES (N'230a9b87-b6bf-49fd-bcda-518fcdceeaff', N'zkyboy915@gmail.com', 0, N'AEj7mr55Q9r0LVf4J6zHCC1ajOD8bc/fO004VJSWAacP1cGREUfYACd4kEAI1rElMw==', N'f39ee674-718f-44ca-8bfd-e6a2866e8972', N'0328265662', 0, 0, NULL, 1, 0, N'zkyboy915@gmail.com', N'Dinh XUAN QUANG', 2000000, NULL, N'https://www.facebook.com/', N'0328265662')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [ViTien], [Image], [Facebook], [Zalo]) VALUES (N'2928c209-c7e5-4727-a5f8-fa9261e30f50', N'hodenvutru3@gmail.com', 0, N'AIbFxmKmy9tTwWxWB1CRqTxbLNbDs0s0YZaGXlKlUgxIOHEpjD5MrNFJiGx2v90K1Q==', N'a3da5646-7202-4077-a631-79f79d83e7ad', N'0328265662', 0, 0, NULL, 0, 0, N'hodenvutru3@gmail.com', N'Hoàng Phong', 19850000, N'img-3 (1).jpg', N'https://www.facebook.com/', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [ViTien], [Image], [Facebook], [Zalo]) VALUES (N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'minhquanght@gmail.com', 0, N'AAe42B0RSDI8KkjmLHGWjR9m1V56vxzDOnQC09QE8UIRD5mJ9G0RgKsW1GKHJbrhKw==', N'009aed8d-47d9-40b1-91c5-33919aa53e32', N'123456789', 0, 0, NULL, 1, 0, N'minhquanght@gmail.com', N'Nguyễn Minh Quang', 655000, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[GiaoDich] ON 

INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1010, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1010, 50000, CAST(N'2021-12-09T21:10:42.063' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1011, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1011, 50000, CAST(N'2021-12-09T21:15:16.387' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1012, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1012, 25000, CAST(N'2021-12-09T21:16:53.573' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1013, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1013, 25000, CAST(N'2021-12-09T21:18:24.167' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1014, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1014, 25000, CAST(N'2021-12-09T21:21:14.563' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1015, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1015, 10000, CAST(N'2021-12-09T21:23:01.450' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1016, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1016, 50000, CAST(N'2021-12-09T21:24:43.917' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1017, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1017, 50000, CAST(N'2021-12-09T21:26:30.573' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1018, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1018, 10000, CAST(N'2021-12-09T21:27:48.390' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1019, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1019, 25000, CAST(N'2021-12-09T21:29:30.523' AS DateTime))
INSERT [dbo].[GiaoDich] ([Id], [MaUser], [MaTin], [SoTien], [ThoiGian]) VALUES (1020, N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', 1020, 25000, CAST(N'2021-12-09T21:36:22.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[GiaoDich] OFF
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [DoUutien], [DonGia]) VALUES (1, N'Vip', 1, 10000)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [DoUutien], [DonGia]) VALUES (2, N'Hot', 2, 5000)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [DoUutien], [DonGia]) VALUES (3, N'Thường', 3, 2000)
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
SET IDENTITY_INSERT [dbo].[TinDang] ON 

INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1, N'Phòng Trọ', N'PHÒNG MỚI ', 2000000, 26, N'<p>Quang</p>', CAST(N'2021-11-17T09:02:57.000' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'Quận 9', N'img-3.jpg', 3, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (2, N'Nhà Nguyên Căn ', N'Phong tro Full House đầy đủ nội thất Quận 9', 2000000, 60, N'Không có ', CAST(N'2021-11-17T09:08:11.153' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'Quận 9', N'img-3.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (3, N'Phòng Trọ', N'PHÒNG MỚI ĐẦY ĐỦ TIỆN NGHI ĐƯỜNG PHAN XÍCH LONG', 2000000, 30, N'Không có ', CAST(N'2021-11-17T09:19:52.330' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'Quận 9', N'img-2.jpg,img-3 (1).jpg,img-3.jpg,img-4.jpg', 1, 7)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (4, N'Phòng Trọ', N'PHÒNG MỚI ĐẦY ĐỦ TIỆN NGHI ĐƯỜNG PHAN XÍCH LONG', 2000000, 30, N'<p>Quang</p>', CAST(N'2021-11-17T14:52:46.887' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'Quận 9', N'img-2.jpg,img-3 (1).jpg,img-3.jpg,img-4.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (5, N'Phòng Trọ', N'PHÒNG MỚI ĐẦY ĐỦ TIỆN NGHI ĐƯỜNG PHAN XÍCH LONG', 2000000, 50, N'Không có ', CAST(N'2021-11-17T15:45:10.320' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'Quận 9', N'img-2.jpg,img-3 (1).jpg,img-3.jpg,img-4.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (6, N'Phòng Trọ', N'Nha tro fullhouse', 2000000, 43, N'Vcdads', CAST(N'2021-11-17T20:18:44.100' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'Quận 9', N'img-4.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1006, N'Phòng Trọ', N'Phòng trọ dạng căn hộ mini cao cấp tại 796 Lê Đức Thọ, P.15, Quận Gò Vấp', 2000000, 50, N'Cho thuê căn hộ mini cao cấp tại 796 Lê Đức Thọ, Phường 15, Quận Gò Vấp, Tp. Hồ Chí Minh.

Diện tích 30m2, giá 2.5 triệu - 3 triệu/tháng.

Có hầm giữ xe, có thang máy, giờ tự do, có bảo vệ 24/24.

Wifi cực mạnh, máy nước nóng, trường hình cáp, sân tập thể dục và thư giãn. Chung cư cao cấp, an ninh tuyệt đối.

Liên hệ: 0328837249 Chị Giang.', CAST(N'2021-11-26T20:33:28.837' AS DateTime), N'07d4a5a5-8dd6-41d2-b904-180cefe5bdfb', N'796 Đường Lê Đức Thọ, Phường 15, Quận Gò Vấp, Hồ Chí Minh', N'img-3.jpg,img-4.jpg', 3, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1007, N'Phòng trọ', N'Phòng trọ dạng căn hộ mini cao cấp tại 796 Lê Đức Thọ, P.15, Quận Gò Vấp', 200000, 25, N'NHÀ NẰM Ở VỊ TRÍ ĐẸP, THUẬN TIỆN

Cách trung tâm Q1, Q2, Q3, Phú Nhuận 5-10 phút di chuyển (đường rộng, không bị kẹt xe, không ngập nước)

Đường nội bộ xe tải, đối diện chung cư Wilton Tower, luôn mát mẻ.

Khu dân cư an ninh, yên tĩnh, dân trí cao.

300m tới chợ Văn Thánh, Siêu Thị CoopMart, Bách Hóa Xanh.

200m tới PEARL PLAZA, 1km tới VINHOMES CENTRAL PARK.

Trước cửa nhà là cửa hàng tiện lợi 24h GS 25, Circle K, nhà thuốc Pharmacity.

Xung quanh có nhiều quán cà phê, ăn uống.

Thông qua đường D2, Ung Văn Khiêm đến các trường Đại học: Hutech, Giao thông vận tải, Ngoại thương, Hồng Bàng,…

PHÒNG MỚI - ĐẸP - ĐẦY ĐỦ TIỆN NGHI

️ Giường, nệm cao cấp.

️ WC riêng với trang thiết bị cao cấp.

️ Bàn, ghế làm việc hiện đại.

️ Tủ lạnh, Máy lạnh.

️ Tủ quần áo âm tường.

️ Bancon, cửa sổ thoáng mát, View Landmark 81 đẹp mắt.

️ Sofa băng dài cho bạn thư giãn.

️ Smart Tivi 32 inch kết nối internet thỏa sức lướt web xem phim.

MÁY NƯỚC NÓNG: năng lượng mặt trời (không tốn điện)

MÁY GIẶT SẤY: chỉ cần 1 thao tác không tốn thời gian.

THANG MÁY: di chuyển thuận tiện.

Internet cáp quang. Truyền hình cáp.

Giờ giấc tự do, không chung chủ, cửa vân tay, Camera an ninh 24/24

Dọn vệ sinh hàng tuần (khu vực chung).

Diện tích: 25-28m2.

>>> Giá hỗ trợ mùa dịch chỉ còn 4tr6 đến 5tr5

Địa chỉ: Hẻm 71 Nguyễn Văn Thương( D1 Cũ), P25, Q Bình Thạnh.

(Ảnh thực tế)

****** Liên hệ: Mr.Thoai – 0962 42 42 61', CAST(N'2021-12-06T11:37:42.503' AS DateTime), N'2928c209-c7e5-4727-a5f8-fa9261e30f50', N'256 Đường Lê Đức Thọ, Phường 15, Quận Gò Vấp, Hồ Chí Minh', N'img-4.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1008, N'Phòng trọ', N'Phòng Cao Cấp Full nội thất ngay Pearl plaza - D1, BÌNH THẠNH', 4600000, 40, N'<p>NHÀ NẰM Ở VỊ TRÍ ĐẸP, THUẬN TIỆN Cách trung tâm Q1, Q2, Q3, Phú Nhuận 5-10 phút di chuyển (đường rộng, không bị kẹt xe, không ngập nước) Đường nội bộ xe tải, đối diện chung cư Wilton Tower, luôn mát mẻ. Khu dân cư an ninh, yên tĩnh, dân trí cao. 300m tới chợ Văn Thánh, Siêu Thị CoopMart, Bách Hóa Xanh. 200m tới PEARL PLAZA, 1km tới VINHOMES CENTRAL PARK. Trước cửa nhà là cửa hàng tiện lợi 24h GS 25, Circle K, nhà thuốc Pharmacity. Xung quanh có nhiều quán cà phê, ăn uống. Thông qua đường D2, Ung Văn Khiêm đến các trường Đại học: Hutech, Giao thông vận tải, Ngoại thương, Hồng Bàng,… PHÒNG MỚI - ĐẸP - ĐẦY ĐỦ TIỆN NGHI ️ Giường, nệm cao cấp. ️ WC riêng với trang thiết bị cao cấp. ️ Bàn, ghế làm việc hiện đại. ️ Tủ lạnh, Máy lạnh. ️ Tủ quần áo âm tường. ️ Bancon, cửa sổ thoáng mát, View Landmark 81 đẹp mắt. ️ Sofa băng dài cho bạn thư giãn. ️ Smart Tivi 32 inch kết nối internet thỏa sức lướt web xem phim. MÁY NƯỚC NÓNG: năng lượng mặt trời (không tốn điện) MÁY GIẶT SẤY: chỉ cần 1 thao tác không tốn thời gian. THANG MÁY: di chuyển thuận tiện. Internet cáp quang. Truyền hình cáp. Giờ giấc tự do, không chung chủ, cửa vân tay, Camera an ninh 24/24 Dọn vệ sinh hàng tuần (khu vực chung). Diện tích: 25-28m2. &gt;&gt;&gt; Giá hỗ trợ mùa dịch chỉ còn 4tr6 đến 5tr5 Địa chỉ: Hẻm 71 Nguyễn Văn Thương( D1 Cũ), P25, Q Bình Thạnh. (Ảnh thực tế) ****** Liên hệ: Mr.Thoai – 0962 42 42 61</p>', CAST(N'2021-12-06T12:02:37.000' AS DateTime), N'2928c209-c7e5-4727-a5f8-fa9261e30f50', N'71/1 Đường D1( Nguyễn Văn Thương), Phường 25, Quận Bình Thạnh, Hồ Chí Minh', N'img-3.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1009, N'Phòng trọ', N'Phòng trọ dạng căn hộ ', 4000000, 23, N'<p>PHÒNG TRỌ CCMN, CẠNH ARTEMIS ĐƯỜNG TRƯỜNG CHINH, CÁCH CHÙA BỘC, VINCOM PHẠM NGỌC THẠCH 500M. RẤT GẦN ĐH Y, HVNH, ĐH THỦY LỢI, ĐH CÔNG ĐOÀN, CÁCH BÁCH KINH XÂY 5 PHÚT ĐI XM, ROYAL CITY NGÃ TƯ SỞ CŨNG GẦN. Giá 3.9 TRIỆU. LH: 0914468453 Nhà mình còn 1 phòng vào ở luôn trong căn CCMN cần cho thuê: ▪Dt =39m2, ở dc 4 ng, kê 2 giường thoải mái, nhà xây mới, có cửa sổ rộng sáng thoáng đãng. Nhà vs vách kính khép kín, hiện đại, rộng rãi. Có khu bếp riêng. Phòng full đồ: bếp, điều hoà, nóng lạnh, máy giặt, tủ quần áo, bàn ghế, wifi cáp quang... chỉ việc xách vali vào ở. Rất tiện chợ, bus, bệnh viện, siêu thị... Khu dân trí cao, an ninh tốt. Ngõ rộng ô tô tải đỗ tận cửa. ▪ CCMN Không Chung Chủ, giờ giấc thoải mái, đi khóa về mở. Để xe free tầng 1. Điện nc giá dân. Giá phòng: 3.9 triệu, thanh toán 1 tháng 1 ▪ Đ/C: Ngõ 69 HOÀNG VĂN THÁI, HN (Cạnh TTTM ARTEMIS - Đường Trường Chinh) LH chính chủ: 0914468463 (DĐ/SMS/Zalo). Miễn q/c.</p>', CAST(N'2021-12-06T14:08:27.000' AS DateTime), N'2928c209-c7e5-4727-a5f8-fa9261e30f50', N'256 Đường Lê Đức Thọ, Phường 15, Quận Gò Vấp, Hồ Chí Minh', N'img-3 (1).jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1010, N'Full nội thất', N'Nhà trọ cao cấp ngay tại Thành Phố Thủ Đức', 3200000, 30, N'HOT HOT

Ưu đãi khủng trong mùa covid ( giảm giá tiền phòng 1TR- 2TR)

- Giao thông di chuyển thuận lợi các tuyến đường PVĐ, Xa lộ Hà Nội

- Gần chợ, siêu thị, cửa hàng tiện lợi

- Gần các trường đại học, cao đẳng...

- Không gian siêu rộng thoải mái

- Bảo vệ 24/24 có camera.

- Nội thất đầy đủ tiện nghi

Địa chỉ đường số 11 phường trường thọ quận Thủ Đức', CAST(N'2021-12-09T21:10:42.060' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'119B Đường số 11, Phường Trường Thọ, Quận Thủ Đức, Hồ Chí Minh', N'anh1.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1011, N'Phòng trọ', N'Căn hộ mini 30m2, gần chợ Bà Chiểu', 5000000, 30, N'Hỗ trợ mùa dịch giảm 50% tháng đầu tiên. Căn hộ mini ngay chợ Bà Chiểu, Bình Thạnh, 30m2, giá 5 tr/tháng

Nhà đẹp, thông thoáng, có ban công, luôn có ánh sáng ngay chợ Bà chiểu.

Phòng trang bị máy lạnh, tủ lạnh, máy giặt, máy nước nóng, máy giặt tủ quần áo, giường nệm, toilet trong phòng, kệ bếp, đèn led tiết kiệm điện.

Miễn phí: wifi tốc độ 80Mpbs, truyền hình cáp, cửa khóa vân tay, camera an ninh, chổ để xe máy.

Giờ giấc tự do, trong khu phố rất an ninh (sinh hoạt như nhà riêng của mình).Nhà rất sạch sẽ, ngày nào cũng có người lau dọn không gian chung.

Căn hộ không chia phòng, Diện tích căn hộ 28 m2

Giá điện 2.500 đ/1KWh; nước sinh hoạt 7.500 đ/1m3 (Tính giá theo định mức của nhà nước). Rác 15.000 đ/tháng. Cam kết không phát sinh bất kỳ chi phí nào.

Giá phòng: 5 triệu

Địa chỉ: 108/3 Vũ Tùng, P.2, Quận Bình Thạnh (ngay chợ Bà chiểu), TPHCM', CAST(N'2021-12-09T21:15:16.387' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'Đường Vũ Tùng, Phường 2, Quận Bình Thạnh, Hồ Chí Minh', N'anh2.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1012, N'Nhà nguyên căn', N'Cho Thuê Nhà Nguyên Căn Hẻm Phan Xích Long Quận Phú Nhuận', 7000000, 50, N'Nhà nằm khu trung tâm sầm uất của Quận Phú Nhuận cách 50 m là Hội Anh Văn Việt Mỹ, ILa, Các Ngân hàng Lớn, Hàng loạt quán Cà phê và nhà hàng ăn uống, Siêu thị Coopmart,đối ALOHA! ️ CHO THUÊ NHÀ NGUYÊN CĂN HẺM PHAN XÍCH LONG PHƯỜNG 2 QUẬN PHÚ NHUẬN️

Nhà nằm khu trung tâm sầm uất của Quận Phú Nhuận cách 50 m là Hội Anh Văn Việt Mỹ, ILa, Các Ngân hàng Lớn, Hàng loạt quán Cà phê và nhà hàng ăn uống, Siêu thị Coopmart,đối diện Công An phường 2 Quận Phú Nhuận và cách UBND phường 10 Phú Nhuận 100m

Địa chỉ: 25/24 Phùng Văn Cung, Phường 2, Phú Nhuận

Diện tích : 4mx 6,5m 1 trệt 1 lầu đúc

Nhà gồm 1 Bếp Có Tủ Bếp rộng, 1 Tolet, 1 Ban Công Rộng Thoáng hướng ánh nắng mặt trời

- Nhà mới Sơn sửa xong NEW

- Có 2 lớp cửa cuốn và cửa kéo sắt

- Thích hợp vừa ở vừa kinh doanh online vì hẻm rộng 3m', CAST(N'2021-12-09T21:16:53.573' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N' 25/24 Đường Phùng Văn Cung, Phường 2, Quận Phú Nhuận, Hồ Chí Minh', N'nha1.jpg', 2, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1013, N'Nhà nguyên căn', N'Chính chủ cho thuê nhà Quận 4 – 5 Phút qua Quận 1', 10000000, 60, N'Gần công viên Khánh Hội, trung tâm thể thao Bến Vân Đồn, trường, chợ, siêu thị, Bách Hóa Xanh, Vinmart, cửa hàng tiện ích cách Quận 1 cây cầu Ông Lãnh.

- Địa chỉ 31/6 đường Số 11, Phường 4, Quận 4, TPHCM.

- Kết cấu đúc giả lửng, sân để xe, phòng khách, bếp, 2 phòng ngủ, 2 nhà WC, khu phơi quần áo.

- Diện tích 60 m2.

- Diện tích sử dụng: 95 m2.

- Tiện ích: 2 máy lạnh Daikin, 2 máy nước trực tiếp Panasonic, 1 tủ lạnh Panasonic, 5 quạt treo, 1 bộ bàn ghế, 1 tủ chén, 1 tủ bếp, 1 máy giặt Samsung, 1 tủ thờ.

- Nhà chính chủ cho thuê dài hạn từ 1 năm trở lên.

* Giá thuê nhà 10.000.000VND/tháng.', CAST(N'2021-12-09T21:18:24.167' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'31/6 Đường số 11, Phường 4, Quận 4, Hồ Chí Minh', N'nha2.jpg', 2, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1014, N'Nhà nguyên căn', N'Cho thuê nhà 2 mặt tiền tại 282 đường Ung Văn Khiêm, P. 25, Quận Bình Thạnh.', 35000000, 330, N'Cho thuê nhà 2 mặt tiền tại 282 đường Ung Văn Khiêm, P. 25, Quận Bình Thạnh.

DTSD 330 m2, 6m x 28m, 1 trệt 3 lầu, vị trí đẹp 2 mặt tiền đường Nguyễn Văn Thương và Ung V Khiêm giao nhau, xe cộ qua lại đông đúc tiện cho văn phòng cty, quán cafe hoặc siêu thị tiện lợi ...

Gần vòng xoay Hàng Xanh, trường đại học Hutech, Ngoại Thương, GTVT ...', CAST(N'2021-12-09T21:21:14.563' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'282 Đường Ung Văn Khiêm, Phường 25, Quận Bình Thạnh, Hồ Chí Minh', N'nha3.jpg', 2, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1015, N'Nhà nguyên căn', N'NHÀ NGUYÊN CĂN 1 TRỆT 1 LẦU NGAY CHỢ TÂN KIỂNG QUẬN 7', 8200000, 90, N'Cho thuê nhà nguyên căn Hẻm 95 Lê Văn Lương, diện tích 90m2 , 4 X 11m nhà mới xây rộng thoáng mát gồm 2 phòng ngủ, 2 toalet, phòng bếp, phòng khách, ban công, sân để xe. Khu vực an ninh, gần chợ Tân Kiểng, trường học,siêu thị, …thuận tiên đi các quận trung tâm Thành Phố.', CAST(N'2021-12-09T21:23:01.450' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'hem 95 Đường Lê Văn Lương, Phường Tân Kiểng, Quận 7, Hồ Chí Minh', N'nha4.jpg', 3, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1016, N'Nhà nguyên căn', N'Cho thuê nhà mới nguyên căn full thiết bị, diện tích sử dụng 120m2, 1 trệt 1 lầu mới xây', 9000000, 120, N'Cho thuê nhà : 1 trệt 1 lầu mới xây, ngang 5m, dài 12m, diện tích sử dụng 120m2 đường 12 phường Tam Bình full thiết bị.

- Mô tả nhà : Nhà mới xây,thiết kế đẹp,tiện dụng, 1 trệt 1 lầu, DTSD 120m2 cách mặt tiền đường 10 mét gồm : 3 phòng ngủ, 1 phòng khách, 1 phòng sinh hoạt chung, 1 khu bếp, 2 WC, 1 ban công rộng rãi thoáng mát, 1 khu vực để xe rộng rãi, cổng rào cao ráo chắc chắn.

- Đã trang bị : Máy lạnh, quạt, Máy năng lượng Mặt Trời , tủ bếp hiện đại,tủ áo,giường ngủ, internet , điện, nước đồng hồ chính.

Uu tiên cho gia đình thuê ở đi làm, người làm văn phòng thuê ở.', CAST(N'2021-12-09T21:24:43.917' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'26/3/2 Đường số 12, Phường Tam Bình, Quận Thủ Đức, Hồ Chí Minh', N'nha5.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1017, N'Căn hộ chung cư', N'Cho thuê căn hộ dịch vụ đẹp Quận 7', 7000000, 25, N'Tòa nhà chung cư mini gồm 01 hầm, 01 trệt, 05 lầu, 01 sân thượng và 100 căn hộ.

Tiện ích bao gồm:

Phí Điện 3.800đ/Kwh; Phí nước sử dụng : 18.000đ/m3

Phí gởi xe : 120.000đ/xe/tháng. Free 1 xe khi kí HĐ 6 tháng, free 2 xe cho HĐ 12 tháng

Miễn phí dọn vệ sinh 3 lần/tuần

Phí giặt đồ: 150.000/người/tháng cho 3 lần/tuần (nếu phát sinh thêm: 14.000đ/kg), được miễn phí cho HĐ từ 6 tháng trở lên

Phí Wifi và quản lý : 150.000/tháng, phí rác miễn phí. HĐ 6 tháng trở lên được miễn phí

Miễn phí sử dụng hồ bơi sân thượng và máy tập ở khu vực sảnh.', CAST(N'2021-12-09T21:26:30.573' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'320 Đường Nguyễn Văn Linh, Phường Bình Thuận, Quận 7, Hồ Chí Minh', N'chungcu1.jpg', 1, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1018, N'Căn hộ chung cư', N'Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh', 4000000, 45, N'Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh. Phòng có 1 phòng ngủ,1 phòng khách, 1 nhà bếp,sân phơi,nhà vệ sinh.

Phòng thoáng mát sạch sẽ phù hợp với gia đình ở,sinh viên và khách văn phòng. Phòng đầy đủ tiện nghi như: máy lạnh,tủ lạnh,tue quần áo, quạt,nệm, giường,kệ bếp,bồn rửa chén,máy nước nóng lạnh,…..

Phòng cách mặt tiền hoàng hoa thám 40m. Cách bệnh viện ung bướu 800m. Đi ra đường phạm văn đồng,chợ bà chiểu,bệnh viện gia định, đường vạn kiếp chỉ 3 phút', CAST(N'2021-12-09T21:27:48.390' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N' 12/4b Đường Hoàng Hoa Thám, Phường 7, Quận Bình Thạnh, Hồ Chí Minh', N'chungcu2.jpg', 3, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1019, N'Căn hộ chung cư', N'CĂN HỘ DỊCH VỤ MỚI 100% NGAY XÔ VIẾT NGHỆ TĨNH', 4800000, 35, N'Tất cả căn hộ 100% đầy đủ tiện nghi cao cấp : Tủ lạnh,kệ bếp, tủ quần áo, tivi, máy lạnh, giường + nệm cao su thiên nhiên, bếp từ nấu ăn, bộ nồi nấu ăn, chén đũa, bộ bàn ăn... WC riêng . Khách hàng không cần mua sắm gì thêm.

- Nhà có thang máy, máy giặt, máy sấy, Camera từng tầng, đảm bảo an toàn, sạch sẽ. Nhà để xe rộng rãi, an toàn.', CAST(N'2021-12-09T21:29:30.523' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'765/54/19 Đường Xô Viết Nghệ Tĩnh, Phường 26, Quận Bình Thạnh, Hồ Chí Minh', N'chungcu3.jpg', 2, 5)
INSERT [dbo].[TinDang] ([MaTin], [ChuyenMuc], [TieuDe], [GiaTien], [DienTich], [MoTa], [NgayDang], [MaNguoiDang], [DiaChi], [Image], [LoaiTin], [SoNgay]) VALUES (1020, N'Nhà nguyên căn', N'Nhà trọ cao cấp ngay tại Thành Phố Thủ Đức', 5000000, 300, N'Tất cả căn hộ 100% đầy đủ tiện nghi cao cấp : Tủ lạnh,kệ bếp, tủ quần áo, tivi, máy lạnh, giường + nệm cao su thiên nhiên, bếp từ nấu ăn, bộ nồi nấu ăn, chén đũa, bộ bàn ăn... WC riêng . Khách hàng không cần mua sắm gì thêm.

- Nhà có thang máy, máy giặt, máy sấy, Camera từng tầng, đảm bảo an toàn, sạch sẽ. Nhà để xe rộng rãi, an toàn.', CAST(N'2021-12-09T21:36:22.280' AS DateTime), N'b2a4491f-fd11-45e7-b6ed-b5c92cced4b8', N'119B Đường số 11, Phường Trường Thọ, Quận Thủ Đức, Hồ Chí Minh', N'nha2.jpg', 2, 5)
SET IDENTITY_INSERT [dbo].[TinDang] OFF
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ViTien]  DEFAULT ((0)) FOR [ViTien]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK_GiaoDich_AspNetUsers] FOREIGN KEY([MaUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [FK_GiaoDich_AspNetUsers]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK_GiaoDich_TinDang] FOREIGN KEY([MaTin])
REFERENCES [dbo].[TinDang] ([MaTin])
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [FK_GiaoDich_TinDang]
GO
ALTER TABLE [dbo].[TinDang]  WITH CHECK ADD  CONSTRAINT [FK_TinDang_AspNetUsers] FOREIGN KEY([MaNguoiDang])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TinDang] CHECK CONSTRAINT [FK_TinDang_AspNetUsers]
GO
ALTER TABLE [dbo].[TinDang]  WITH CHECK ADD  CONSTRAINT [FK_TinDang_Loai] FOREIGN KEY([LoaiTin])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[TinDang] CHECK CONSTRAINT [FK_TinDang_Loai]
GO
USE [master]
GO
ALTER DATABASE [TimKiemPT] SET  READ_WRITE 
GO

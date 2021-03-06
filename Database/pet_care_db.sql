USE [master]
GO
/****** Object:  Database [PET_MANAGEMENT]    Script Date: 4/12/2021 8:14:42 PM ******/
CREATE DATABASE [PET_MANAGEMENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PET_MANAGEMENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\PET_MANAGEMENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PET_MANAGEMENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\PET_MANAGEMENT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PET_MANAGEMENT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PET_MANAGEMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PET_MANAGEMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PET_MANAGEMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PET_MANAGEMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PET_MANAGEMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PET_MANAGEMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PET_MANAGEMENT] SET  MULTI_USER 
GO
ALTER DATABASE [PET_MANAGEMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PET_MANAGEMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PET_MANAGEMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PET_MANAGEMENT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PET_MANAGEMENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PET_MANAGEMENT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PET_MANAGEMENT', N'ON'
GO
ALTER DATABASE [PET_MANAGEMENT] SET QUERY_STORE = OFF
GO
USE [PET_MANAGEMENT]
GO
/****** Object:  Table [dbo].[Available_For]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Available_For](
	[service_id] [nvarchar](10) NOT NULL,
	[species_id] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Available_For] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC,
	[species_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[biil_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [nchar](10) NULL,
	[datetime] [datetime] NULL,
	[cost] [int] NULL,
	[discount] [float] NULL,
	[total_pay] [decimal](28, 0) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[biil_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [nchar](10) NOT NULL,
	[facility_id] [nvarchar](10) NULL,
	[pet_id] [nvarchar](10) NULL,
	[service_id] [nvarchar](10) NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [nvarchar](10) NOT NULL,
	[employee_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nchar](15) NULL,
	[address] [nvarchar](50) NULL,
	[unit_id] [nvarchar](10) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facility]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facility](
	[facility_id] [nvarchar](10) NOT NULL,
	[facility_name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nchar](15) NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[facility_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager_Facility]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager_Facility](
	[employee_id] [nvarchar](10) NOT NULL,
	[facility_id] [nvarchar](10) NULL,
	[isManager] [bit] NULL,
 CONSTRAINT [PK_Manager_Facility] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[owner_id] [nvarchar](10) NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[phone] [nchar](12) NULL,
	[email] [nvarchar](50) NULL,
	[adress] [nvarchar](50) NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[pet_id] [nvarchar](10) NOT NULL,
	[pet_name] [nvarchar](50) NULL,
	[species_id] [nvarchar](10) NULL,
	[birth] [nvarchar](50) NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[pet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet_Owner]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet_Owner](
	[owner_id] [nvarchar](10) NOT NULL,
	[pet_id] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Pet_Owner] PRIMARY KEY CLUSTERED 
(
	[owner_id] ASC,
	[pet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet_Species]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet_Species](
	[species_id] [nvarchar](10) NOT NULL,
	[species_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pet_Species] PRIMARY KEY CLUSTERED 
(
	[species_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [nvarchar](10) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[service_details] [nvarchar](max) NULL,
	[unit_id] [nvarchar](10) NULL,
	[cost] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 4/12/2021 8:14:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[unit_id] [nvarchar](10) NOT NULL,
	[unit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1         ', N'1         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1         ', N'2         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1         ', N'3         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1', N'5')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1', N'6')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'1', N'7')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'2         ', N'1         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'2         ', N'2         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'2', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'2', N'6')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'1')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'2')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'3')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'5')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'6')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'3', N'7')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'1')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'2')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'3')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'5')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'6')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'4', N'7')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'5', N'1')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'5', N'2')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'5', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'5', N'6')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'6         ', N'1         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'6         ', N'2         ')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'6', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'6', N'6')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'7', N'1')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'7', N'2')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'7', N'4')
INSERT [dbo].[Available_For] ([service_id], [species_id]) VALUES (N'7', N'6')
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (0, N'1         ', CAST(N'2020-07-19T16:47:00.000' AS DateTime), 550000, 0, CAST(550000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (1, N'2         ', CAST(N'2020-07-20T07:43:22.000' AS DateTime), 1000000, 0, CAST(1000000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (2, N'3         ', CAST(N'2020-07-21T08:16:10.000' AS DateTime), 2500000, 0, CAST(2500000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (3, N'4         ', CAST(N'2021-03-16T00:00:00.000' AS DateTime), 2500000, 20000, CAST(2480000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (4, N'5         ', CAST(N'2021-03-17T21:29:30.000' AS DateTime), 1250000, 20000, CAST(1230000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (5, N'6         ', CAST(N'2021-03-17T22:29:30.000' AS DateTime), 475000, 20000, CAST(455000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (6, N'7         ', CAST(N'2021-03-17T19:29:30.000' AS DateTime), 1000000, 20000, CAST(980000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (7, N'8         ', CAST(N'2021-04-02T17:10:55.000' AS DateTime), 750000, 20000, CAST(730000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (8, N'9         ', CAST(N'2021-04-02T23:00:05.000' AS DateTime), 750000, 20000, CAST(730000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (9, N'10        ', CAST(N'2021-04-03T22:22:22.000' AS DateTime), 750000, 20000, CAST(730000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (10, N'11        ', CAST(N'2021-04-03T22:50:10.000' AS DateTime), 750000, 20000, CAST(730000 AS Decimal(28, 0)))
INSERT [dbo].[Bill] ([biil_id], [booking_id], [datetime], [cost], [discount], [total_pay]) VALUES (11, N'12        ', CAST(N'2021-04-04T10:15:27.000' AS DateTime), 750000, 20000, CAST(730000 AS Decimal(28, 0)))
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'1         ', N'1         ', N'1         ', N'1         ', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'10        ', N'4', N'3', N'4', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'11        ', N'2', N'10', N'4', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'12        ', N'4', N'7', N'4', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'2         ', N'2         ', N'2         ', N'3         ', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'3         ', N'1         ', N'3         ', N'2         ', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'4         ', N'1', N'3', N'2', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'5         ', N'3', N'11', N'5', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'6         ', N'3', N'11', N'6', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'7         ', N'4', N'4', N'3', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'8         ', N'4', N'5', N'4', 0)
INSERT [dbo].[Booking] ([booking_id], [facility_id], [pet_id], [service_id], [status]) VALUES (N'9         ', N'4', N'6', N'4', 0)
GO
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'1', N'Nguyễn Xuân Đình', N'dinh123@gmail.com', N'0123659874     ', N'TP.HCM', N'1         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'10        ', N'Trần Thị Thúy Ngân', N'nganngan123@gmail.com', N'0355601899     ', N'Hà Nội', N'3         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'11        ', N'Lê Văn An', N'an12an@gmail.com', N'0336031112     ', N'Hà Nội', N'4         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'12        ', N'Đinh Văn Hùng', N'hung12hung@gmail.com', N'0123321012     ', N'Hà Nội', N'1         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'13', N'Nguyễn Hữu Tài', N'tai123@gmail.com', N'0336450125     ', N'Đà Nẵng', N'4')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'14', N'Nguyễn Hữu Lộc', N'loc123p@gmail.com', N'0322654789     ', N'Đà Nẵng', N'1')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'15', N'Nguyễn Chánh', N'chanh123@gmail.com', N'0366987547     ', N'Đà Nẵng', N'2')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'16', N'Lê Thái Châu', N'chau1123@gmail.com', N'0366987412     ', N'Đà Nẵng', N'3')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'17', N'Lê Đại Hành', N'hanh1123@gmail.com', N'0336965475     ', N'Đà Nẵng', N'3')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'2         ', N'Nguyễn Ánh Tuyết', N'tuyet123@gmail.com', N'0336599654     ', N'TP.HCM', N'1         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'3         ', N'Ngô Văn Tự', N'tutu123@gmail.com', N'0115666325     ', N'TP.HCM', N'2         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'4         ', N'Trần Thị Trang', N'trang123@gmail.com', N'0336999563     ', N'TP.HCM', N'2         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'5         ', N'Vũ Xuân Ánh', N'anh123@gmail.com', N'0336994521     ', N'TP.HCM', N'3         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'6         ', N'Lê Ánh Tuyết', N'tuyet123@gmail.com', N'0115547899     ', N'TP.HCM', N'4         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'7         ', N'Nguyễn Tấn An', N'anan123@gmail.com', N'0233650480     ', N'TP.HCM', N'3         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'8         ', N'Trần Đình Trọng', N'trong123@gmail.com', N'0333600215     ', N'Hà Nội', N'1         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'9         ', N'Trần Thanh Minh', N'minh123gmail.com', N'0233201564     ', N'Hà Nội', N'2         ')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'DN6', N'Nguyễn Thị Tuyết Nhung', N'nhung1123@gmail.com', N'0336556456     ', N'Đà Nẵng', N'2')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'DN7', N'Thai Thị Trinh', N'trinh1233@gmail.com', N'0336966545     ', N'Đà Nẵng', N'4')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'DN8', N'Trần Mạnh Khang', N'khang1123@gmail.com', N'0332112103     ', N'Đà Nẵng', N'1')
INSERT [dbo].[Employee] ([employee_id], [employee_name], [email], [phone], [address], [unit_id]) VALUES (N'HN6', N'Nguyễn Thanh Lộc', N'loc123@gmail.com', N'0336554800     ', N'Hà Nội', N'1')
GO
INSERT [dbo].[Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'1         ', N'Phòng Khám Thú Y PetCare Cơ sở Hà Nội ', N'920 Mai Hắc Đế, Hai Bà Trưng, Hà Nội', N'0336521012     ')
INSERT [dbo].[Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'2         ', N'Phòng Khám Thú Y PetCare Cơ sở TP.HCM 1', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP.HCM', N'0336699666     ')
INSERT [dbo].[Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'3         ', N'Phòng Khám Thú Y PetCare Cơ sở Đà Nẵng', N'117 Ngô Gia Tự, Hải Châu, Đà Nẵng', N'0332145684     ')
INSERT [dbo].[Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'4         ', N'Phòng Khám Thú Y PetCare Cơ sở TP.HCM 2', N'60 Quang Trung, quận 12, TP.HCM', N'0334556546     ')
GO
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'1         ', N'2         ', 1)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'10        ', N'1         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'11        ', N'1         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'12        ', N'1         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'13', N'3', 1)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'14', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'15', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'16', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'17', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'2         ', N'2         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'3         ', N'2         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'4         ', N'2         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'5         ', N'2         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'6         ', N'2         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'7         ', N'2         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'8         ', N'1         ', 1)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'9         ', N'1         ', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'DN6', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'DN7', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'DN8', N'3', NULL)
INSERT [dbo].[Manager_Facility] ([employee_id], [facility_id], [isManager]) VALUES (N'HN6', N'1', NULL)
GO
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'1         ', N'Quang', N'Nguyễn', N'0223645896  ', N'quang@gmail.com', N'TP.HCM', NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'10', N'Tài', N'Lê', N'0336458927  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'11', N'Tú', N'Trần', N'0336458928  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'12', N'Vũ', N'Lê', N'0336458929  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'13', N'Vân', N'Trần', N'0336458912  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'14', N'Văn', N'Nguyễn', N'0336458913  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'15', N'Khang', N'Trần', N'0336458914  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'16', N'Kỳ', N'Nguyễn', N'0336458925  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'17', N'Can', N'Trần', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'18', N'Hùng', N'Nguyễn', N'0336458925  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'19', N'Hào', N'Nguyễn', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'2         ', N'Hà', N'Lê', N'0336964569  ', N'ha12@gmail.com', N'TP.HCM', NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'20', N'Hường', N'Lê', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'21', N'Hòa', N'Trần', N'0336458925  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'22', N'Đạt', N'Nguyễn', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'23', N'Định', N'Trần', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'24', N'Đường', N'Lê', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'25', N'Dũng', N'Trần', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'26', N'Duyên', N'Nguyễn', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'3         ', N'Thanh', N'Vũ', N'0331256645  ', N'hanh@gmail.com', N'Hà Nội', NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'4', N'Minh', N'Trần', N'0336458925  ', N'minhq@gmail.com', N'TP.HCM', NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'5', N'Thanh', N'Lê', N'0336458911  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'6', N'Thương', N'Trần', N'0336458922  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'7', N'Thủy', N'Trần', N'0336458923  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'8', N'Thành', N'Trần', N'0336458924  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'9', N'Tuấn', N'Lê', N'0336458926  ', N'minhq@gmail.com', NULL, NULL)
GO
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'1         ', N'Chó Pug', N'1         ', NULL, N'owner 1')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'10', N'Chó Pitbull', N'1', NULL, N'owner 9')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'11', N'Chó Husky', N'1', NULL, N'owner 10')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'12', N'Chó Maltese', N'1', NULL, N'owner 11')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'13', N'Chó Shiba Inu', N'1', NULL, N'owner 12')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'14', N'Chó Samoyed', N'1', NULL, N'owner 13')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'15', N'Chó Bull Anh', N'1', NULL, N'owner 14')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'16', N'Chó Bull Pháp', N'1', NULL, N'owner 15')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'17', N'Chó Lạp Xưởng', N'1', NULL, N'owner 16')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'18', N'Mèo Anh lông dài ', N'2', NULL, N'owner 17')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'19', N'Mèo Anh lông ngắn', N'2', NULL, N'owner 18')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'2         ', N'Chó Pug', N'1         ', NULL, N'owner 2')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'20', N'Mèo Ba Tư', N'2', NULL, N'owner 19')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'21', N'Mèo tai cụp Scottish Fold', N'2', NULL, N'owner 20')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'22', N'Mèo Sphynx không lông', N'2', NULL, N'owner 21')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'23', N'Chuột Hamster', N'3', NULL, N'owner 22')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'24', N'Chuột Hamster', N'3', NULL, N'owner 23')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'25', N'Chuột Hamster', N'3', NULL, N'owner 24')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'26', N'Thỏ LIONHEAD', N'4', NULL, N'owner 25')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'27', N'Rồng Nam Mỹ Đỏ', N'7', NULL, N'owner 26')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'28', N'Rồng Nam Mỹ Bạch Tạng Vàng', N'7', NULL, N'owner 26')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'3         ', N'Mèo Xiêm', N'2         ', NULL, N'owner 3')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'4         ', N'Chuột Hamster', N'3         ', NULL, N'owner 1')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'5', N'Chó Poodle', N'1', NULL, N'owner 4')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'6', N'Chó Beagle', N'1', NULL, N'owner 5')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'7', N'Chó Chihuahua', N'1', NULL, N'owner 6')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'8', N'Chó Bully', N'1', NULL, N'owner 7')
INSERT [dbo].[Pet] ([pet_id], [pet_name], [species_id], [birth], [notes]) VALUES (N'9', N'Chó Corgi', N'1', NULL, N'owner 8')
GO
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'1         ', N'1         ')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'10', N'11')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'11', N'12')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'12', N'13')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'13', N'14')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'14', N'15')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'15', N'16')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'16', N'17')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'17', N'18')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'18', N'19')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'19', N'20')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'2         ', N'2         ')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'20', N'21')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'21', N'22')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'22', N'23')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'23', N'24')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'24', N'25')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'25', N'26')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'26', N'27')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'26', N'28')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'3         ', N'3         ')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'4', N'4')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'5', N'6')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'6', N'5')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'6', N'7')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'7', N'8')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'8', N'9')
INSERT [dbo].[Pet_Owner] ([owner_id], [pet_id]) VALUES (N'9', N'10')
GO
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'1         ', N'Chó')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'2         ', N'Mèo')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'3         ', N'Chuột')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'4', N'Thỏ')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'5', N'Chim')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'6', N'Khỉ')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'7', N'Rồng')
INSERT [dbo].[Pet_Species] ([species_id], [species_name]) VALUES (N'8', N'Awesome')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'1         ', N'Tiêm vacxin', N'some details', N'1         ', 550000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'2         ', N'Phối giống', N'some details', N'1         ', 2500000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'3         ', N'Khám sức khỏe định kỳ', N'some details', N'1         ', 1000000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'4         ', N'Test bệnh truyền nhiễm, ký sinh', N'some details', N'2         ', 750000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'5         ', N'Điều trị thú biếng ăn, gầy còm', N'some details', N'4         ', 1250000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'6         ', N'Cắt tỉa lông, tắm rửa', N'some details', N'3         ', 475000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'7         ', N'Mổ đẻ, triệt sản', N'some details', N'3         ', 3500000)
INSERT [dbo].[Service] ([service_id], [service_name], [service_details], [unit_id], [cost]) VALUES (N'8', N'Reset dataset test', N'some detaiols', N'3', 1000000)
GO
INSERT [dbo].[Unit] ([unit_id], [unit_name]) VALUES (N'1         ', N'Ban khám và điều trị')
INSERT [dbo].[Unit] ([unit_id], [unit_name]) VALUES (N'2         ', N'Ban xét nghiệm và chẩn đoán')
INSERT [dbo].[Unit] ([unit_id], [unit_name]) VALUES (N'3         ', N'Ban thẩm mỹ')
INSERT [dbo].[Unit] ([unit_id], [unit_name]) VALUES (N'4         ', N'Ban dinh dưỡng')
INSERT [dbo].[Unit] ([unit_id], [unit_name]) VALUES (N'5', N'Test')
GO
ALTER TABLE [dbo].[Available_For]  WITH CHECK ADD  CONSTRAINT [FK_Available_For_Pet_Species] FOREIGN KEY([species_id])
REFERENCES [dbo].[Pet_Species] ([species_id])
GO
ALTER TABLE [dbo].[Available_For] CHECK CONSTRAINT [FK_Available_For_Pet_Species]
GO
ALTER TABLE [dbo].[Available_For]  WITH CHECK ADD  CONSTRAINT [FK_Available_For_Service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Available_For] CHECK CONSTRAINT [FK_Available_For_Service]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Booking]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Facility] FOREIGN KEY([facility_id])
REFERENCES [dbo].[Facility] ([facility_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Facility]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Pet] FOREIGN KEY([pet_id])
REFERENCES [dbo].[Pet] ([pet_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Pet]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Service]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[Unit] ([unit_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Unit]
GO
ALTER TABLE [dbo].[Manager_Facility]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Facility_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Manager_Facility] CHECK CONSTRAINT [FK_Manager_Facility_Employee]
GO
ALTER TABLE [dbo].[Manager_Facility]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Facility_Facility] FOREIGN KEY([facility_id])
REFERENCES [dbo].[Facility] ([facility_id])
GO
ALTER TABLE [dbo].[Manager_Facility] CHECK CONSTRAINT [FK_Manager_Facility_Facility]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Pet_Species] FOREIGN KEY([species_id])
REFERENCES [dbo].[Pet_Species] ([species_id])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Pet_Species]
GO
ALTER TABLE [dbo].[Pet_Owner]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Owner_Owner] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Owner] ([owner_id])
GO
ALTER TABLE [dbo].[Pet_Owner] CHECK CONSTRAINT [FK_Pet_Owner_Owner]
GO
ALTER TABLE [dbo].[Pet_Owner]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Owner_Pet] FOREIGN KEY([pet_id])
REFERENCES [dbo].[Pet] ([pet_id])
GO
ALTER TABLE [dbo].[Pet_Owner] CHECK CONSTRAINT [FK_Pet_Owner_Pet]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[Unit] ([unit_id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Unit]
GO
USE [master]
GO
ALTER DATABASE [PET_MANAGEMENT] SET  READ_WRITE 
GO

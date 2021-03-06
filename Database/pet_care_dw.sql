USE [master]
GO
/****** Object:  Database [PET_DW]    Script Date: 4/12/2021 8:18:15 PM ******/
CREATE DATABASE [PET_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PET_DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\PET_DW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PET_DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\PET_DW_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PET_DW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PET_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PET_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PET_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PET_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PET_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PET_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [PET_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PET_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PET_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PET_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PET_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PET_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PET_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PET_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PET_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PET_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PET_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PET_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PET_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PET_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PET_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PET_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PET_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PET_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [PET_DW] SET  MULTI_USER 
GO
ALTER DATABASE [PET_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PET_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PET_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PET_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PET_DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PET_DW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PET_DW', N'ON'
GO
ALTER DATABASE [PET_DW] SET QUERY_STORE = OFF
GO
USE [PET_DW]
GO
/****** Object:  Table [dbo].[DIM_DateTime]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DateTime](
	[Date_time] [date] NOT NULL,
	[d_day] [int] NULL,
	[d_month] [int] NULL,
	[d_year] [int] NULL,
	[d_quarter] [int] NULL,
 CONSTRAINT [PK__DIM_Date__FA93D8A30AA088D2] PRIMARY KEY CLUSTERED 
(
	[Date_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Facility]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Facility](
	[facility_id] [nvarchar](10) NOT NULL,
	[facility_name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nchar](15) NULL,
 CONSTRAINT [PK_DIM_Facility] PRIMARY KEY CLUSTERED 
(
	[facility_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Owner]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Owner](
	[owner_id] [nvarchar](10) NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[phone] [nchar](12) NULL,
	[email] [nvarchar](50) NULL,
	[adress] [nvarchar](50) NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_DIM_Owner] PRIMARY KEY CLUSTERED 
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Service]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Service](
	[service_id] [nvarchar](10) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[service_details] [nvarchar](max) NULL,
	[unit_name] [nvarchar](50) NULL,
	[cost] [int] NULL,
 CONSTRAINT [PK_DIM_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Species]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Species](
	[species_id] [nvarchar](10) NOT NULL,
	[species_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_Species] PRIMARY KEY CLUSTERED 
(
	[species_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_UNIT]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_UNIT](
	[unit_id] [nvarchar](10) NOT NULL,
	[unit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_UNIT] PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_AMOUNT]    Script Date: 4/12/2021 8:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_AMOUNT](
	[owner_id] [nvarchar](10) NULL,
	[species_id] [nvarchar](10) NULL,
	[facility_id] [nvarchar](10) NULL,
	[date_time] [date] NULL,
	[service_id] [nvarchar](10) NULL,
	[unit_id] [nvarchar](10) NULL,
	[discount] [float] NULL,
	[total_pay] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-05-16' AS Date), 16, 5, 2020, 2)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-06-13' AS Date), 13, 6, 2020, 2)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-07-19' AS Date), 19, 7, 2020, 3)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-07-20' AS Date), 20, 7, 2020, 3)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-07-21' AS Date), 21, 7, 2020, 3)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-09-23' AS Date), 23, 9, 2020, 3)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-10-31' AS Date), 31, 10, 2020, 4)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2020-12-28' AS Date), 28, 12, 2020, 4)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-01-15' AS Date), 15, 1, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-01-16' AS Date), 16, 1, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-01-30' AS Date), 30, 1, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-02-02' AS Date), 2, 2, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-02-03' AS Date), 3, 2, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-02-28' AS Date), 28, 2, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-01' AS Date), 1, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-03' AS Date), 3, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-09' AS Date), 9, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-10' AS Date), 10, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-14' AS Date), 14, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-16' AS Date), 16, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-17' AS Date), 17, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-18' AS Date), 18, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-22' AS Date), 22, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-03-23' AS Date), 23, 3, 2021, 1)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-04-02' AS Date), 2, 4, 2021, 2)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-04-03' AS Date), 3, 4, 2021, 2)
INSERT [dbo].[DIM_DateTime] ([Date_time], [d_day], [d_month], [d_year], [d_quarter]) VALUES (CAST(N'2021-04-04' AS Date), 4, 4, 2021, 2)
GO
INSERT [dbo].[DIM_Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'1         ', N'Phòng Khám Thú Y PetCare Cơ sở Hà Nội ', N'920 Mai Hắc Đế, Hai Bà Trưng, Hà Nội', N'0336521012     ')
INSERT [dbo].[DIM_Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'2         ', N'Phòng Khám Thú Y PetCare Cơ sở TP.HCM 1', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP.HCM', N'0336699666     ')
INSERT [dbo].[DIM_Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'3         ', N'Phòng Khám Thú Y PetCare Cơ sở Đà Nẵng', N'117 Ngô Gia Tự, Hải Châu, Đà Nẵng', N'0332145684     ')
INSERT [dbo].[DIM_Facility] ([facility_id], [facility_name], [address], [phone]) VALUES (N'4         ', N'Phòng Khám Thú Y PetCare Cơ sở TP.HCM 2', N'60 Quang Trung, quận 12, TP.HCM', N'0334556546     ')
GO
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'1         ', N'Quang', N'Nguyễn', N'0223645896  ', N'quang@gmail.com', N'TP.HCM', NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'10        ', N'Tài', N'Lê', N'0336458927  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'11        ', N'Tú', N'Trần', N'0336458928  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'12        ', N'Vũ', N'Lê', N'0336458929  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'13        ', N'Vân', N'Trần', N'0336458912  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'14        ', N'Văn', N'Nguyễn', N'0336458913  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'15        ', N'Khang', N'Trần', N'0336458914  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'16        ', N'Kỳ', N'Nguyễn', N'0336458925  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'17        ', N'Can', N'Trần', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'18        ', N'Hùng', N'Nguyễn', N'0336458925  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'19        ', N'Hào', N'Nguyễn', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'2         ', N'Hà', N'Lê', N'0336964569  ', N'ha12@gmail.com', N'TP.HCM', NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'20        ', N'Hường', N'Lê', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'21        ', N'Hòa', N'Trần', N'0336458925  ', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'22        ', N'Đạt', N'Nguyễn', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'23        ', N'Định', N'Trần', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'24        ', N'Đường', N'Lê', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'25        ', N'Dũng', N'Trần', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'26        ', N'Duyên', N'Nguyễn', N'0336458925  ', N'ha12@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'3         ', N'Thanh', N'Vũ', N'0331256645  ', N'hanh@gmail.com', N'Hà Nội', NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'4         ', N'Minh', N'Trần', N'0336458925  ', N'minhq@gmail.com', N'TP.HCM', NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'5         ', N'Thanh', N'Lê', N'0336458911  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'6         ', N'Thương', N'Trần', N'0336458922  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'7         ', N'Thủy', N'Trần', N'0336458923  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'8         ', N'Thành', N'Trần', N'0336458924  ', N'minhq@gmail.com', NULL, NULL)
INSERT [dbo].[DIM_Owner] ([owner_id], [first_name], [last_name], [phone], [email], [adress], [notes]) VALUES (N'9         ', N'Tuấn', N'Lê', N'0336458926  ', N'minhq@gmail.com', NULL, NULL)
GO
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'1         ', N'Tiêm vacxin', N'some details', N'Ban khám và điều trị', 550000)
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'2         ', N'Phối giống', N'some details', N'Ban khám và điều trị', 2500000)
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'3         ', N'Khám sức khỏe định kỳ', N'some details', N'Ban khám và điều trị', 1000000)
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'4         ', N'Test bệnh truyền nhiễm, ký sinh', N'some details', N'Ban xét nghiệm và chẩn đoán', 750000)
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'5         ', N'Điều trị thú biếng ăn, gầy còm', N'some details', N'Ban dinh dưỡng', 1250000)
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'6         ', N'Cắt tỉa lông, tắm rửa', N'some details', N'Ban thẩm mỹ', 475000)
INSERT [dbo].[DIM_Service] ([service_id], [service_name], [service_details], [unit_name], [cost]) VALUES (N'7         ', N'Mổ đẻ, triệt sản', N'some details', N'Ban thẩm mỹ', 3500000)
GO
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'1         ', N'Chó')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'2         ', N'Mèo')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'3         ', N'Chuột')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'4         ', N'Thỏ')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'5         ', N'Chim')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'6         ', N'Khỉ')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'7         ', N'Rồng')
INSERT [dbo].[DIM_Species] ([species_id], [species_name]) VALUES (N'8         ', N'Awesome')
GO
INSERT [dbo].[DIM_UNIT] ([unit_id], [unit_name]) VALUES (N'1         ', N'Ban khám và điều trị')
INSERT [dbo].[DIM_UNIT] ([unit_id], [unit_name]) VALUES (N'2         ', N'Ban xét nghiệm và chẩn đoán')
INSERT [dbo].[DIM_UNIT] ([unit_id], [unit_name]) VALUES (N'3         ', N'Ban thẩm mỹ')
INSERT [dbo].[DIM_UNIT] ([unit_id], [unit_name]) VALUES (N'4         ', N'Ban dinh dưỡng')
INSERT [dbo].[DIM_UNIT] ([unit_id], [unit_name]) VALUES (N'5', N'Test')
GO
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'1         ', N'1         ', N'1         ', CAST(N'2020-07-19' AS Date), N'1         ', N'1         ', 0, CAST(550000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'10        ', N'1', N'3         ', CAST(N'2021-03-17' AS Date), N'5         ', N'4         ', 20000, CAST(1230000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'10        ', N'1', N'3         ', CAST(N'2021-03-17' AS Date), N'6         ', N'3         ', 20000, CAST(455000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'2         ', CAST(N'2020-07-20' AS Date), N'3         ', N'1         ', 0, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'1         ', CAST(N'2020-07-21' AS Date), N'2         ', N'1         ', 0, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'1         ', CAST(N'2021-03-16' AS Date), N'2         ', N'1         ', 20000, CAST(2480000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'4         ', CAST(N'2021-04-03' AS Date), N'4         ', N'2         ', 20000, CAST(730000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'4         ', N'3         ', N'4         ', CAST(N'2021-03-17' AS Date), N'3         ', N'1         ', 20000, CAST(980000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'5         ', N'1', N'4         ', CAST(N'2021-04-02' AS Date), N'4         ', N'2         ', 20000, CAST(730000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'6         ', N'1', N'4         ', CAST(N'2021-04-02' AS Date), N'4         ', N'2         ', 20000, CAST(730000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'6         ', N'1', N'4         ', CAST(N'2021-04-04' AS Date), N'4         ', N'2         ', 20000, CAST(730000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'9         ', N'1', N'2         ', CAST(N'2021-04-03' AS Date), N'4         ', N'2         ', 20000, CAST(730000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'1         ', N'1         ', N'2', CAST(N'2021-03-23' AS Date), N'1', N'1         ', 50000, CAST(500000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'1', CAST(N'2021-03-10' AS Date), N'2', N'1         ', 50000, CAST(2450000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'1', CAST(N'2021-03-10' AS Date), N'5', N'4         ', 50000, CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'4         ', N'3         ', N'2', CAST(N'2021-03-09' AS Date), N'2', N'1         ', 500000, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'1         ', N'1         ', N'2', CAST(N'2021-01-30' AS Date), N'5', N'4         ', 0, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'1', CAST(N'2020-12-28' AS Date), N'6', N'3         ', 0, CAST(475000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'2', CAST(N'2021-02-02' AS Date), N'5', N'4         ', 0, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'4         ', N'3         ', N'1', CAST(N'2020-10-31' AS Date), N'1', N'1         ', 0, CAST(550000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'2', CAST(N'2020-06-13' AS Date), N'2', N'1         ', 0, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'2', CAST(N'2020-09-23' AS Date), N'2', N'1         ', 0, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'1         ', N'1         ', N'1', CAST(N'2020-05-16' AS Date), N'1', N'1         ', 0, CAST(550000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'1', CAST(N'2020-05-16' AS Date), N'5', N'4         ', 0, CAST(475000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'2', CAST(N'2021-01-15' AS Date), N'6', N'3         ', 0, CAST(475000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'1', CAST(N'2021-01-16' AS Date), N'6', N'3         ', 0, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'3         ', N'2         ', N'2', CAST(N'2021-01-16' AS Date), N'5', N'4         ', 0, CAST(475000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'1', CAST(N'2021-02-28' AS Date), N'1', N'1         ', 0, CAST(550000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'1         ', N'1         ', N'2', CAST(N'2021-03-01' AS Date), N'1', N'1         ', 0, CAST(550000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'1         ', N'1         ', N'1', CAST(N'2021-02-03' AS Date), N'7', N'3         ', 100000, CAST(3400000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'2         ', N'1         ', N'1', CAST(N'2021-03-03' AS Date), N'2', N'1         ', 0, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'4         ', N'3         ', N'1', CAST(N'2021-03-14' AS Date), N'1', N'1         ', 0, CAST(550000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'23        ', N'3', N'4', CAST(N'2021-03-14' AS Date), N'1', N'1         ', 20000, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'26        ', N'7', N'4', CAST(N'2021-03-18' AS Date), N'1', N'1         ', 20000, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'17        ', N'2', N'3', CAST(N'2021-03-18' AS Date), N'1', N'1         ', 20000, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'16        ', N'1', N'3', CAST(N'2021-03-18' AS Date), N'1', N'1         ', 20000, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'10        ', N'1', N'3', CAST(N'2021-03-18' AS Date), N'3', N'1         ', 20000, CAST(980000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'14        ', N'1', N'2', CAST(N'2021-03-18' AS Date), N'3', N'1         ', 20000, CAST(980000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'13        ', N'1', N'1', CAST(N'2021-03-18' AS Date), N'3', N'1         ', 20000, CAST(980000 AS Decimal(18, 0)))
INSERT [dbo].[FACT_AMOUNT] ([owner_id], [species_id], [facility_id], [date_time], [service_id], [unit_id], [discount], [total_pay]) VALUES (N'11        ', N'1', N'1', CAST(N'2021-03-18' AS Date), N'3', N'1         ', 20000, CAST(980000 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[FACT_AMOUNT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DATETIME] FOREIGN KEY([date_time])
REFERENCES [dbo].[DIM_DateTime] ([Date_time])
GO
ALTER TABLE [dbo].[FACT_AMOUNT] CHECK CONSTRAINT [FK_FACT_DATETIME]
GO
ALTER TABLE [dbo].[FACT_AMOUNT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_FACILITY] FOREIGN KEY([facility_id])
REFERENCES [dbo].[DIM_Facility] ([facility_id])
GO
ALTER TABLE [dbo].[FACT_AMOUNT] CHECK CONSTRAINT [FK_FACT_FACILITY]
GO
ALTER TABLE [dbo].[FACT_AMOUNT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_OWNER] FOREIGN KEY([owner_id])
REFERENCES [dbo].[DIM_Owner] ([owner_id])
GO
ALTER TABLE [dbo].[FACT_AMOUNT] CHECK CONSTRAINT [FK_FACT_OWNER]
GO
ALTER TABLE [dbo].[FACT_AMOUNT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_SERVICE] FOREIGN KEY([service_id])
REFERENCES [dbo].[DIM_Service] ([service_id])
GO
ALTER TABLE [dbo].[FACT_AMOUNT] CHECK CONSTRAINT [FK_FACT_SERVICE]
GO
ALTER TABLE [dbo].[FACT_AMOUNT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_SPECIES] FOREIGN KEY([species_id])
REFERENCES [dbo].[DIM_Species] ([species_id])
GO
ALTER TABLE [dbo].[FACT_AMOUNT] CHECK CONSTRAINT [FK_FACT_SPECIES]
GO
ALTER TABLE [dbo].[FACT_AMOUNT]  WITH CHECK ADD  CONSTRAINT [FK_FACT_UNIT] FOREIGN KEY([unit_id])
REFERENCES [dbo].[DIM_UNIT] ([unit_id])
GO
ALTER TABLE [dbo].[FACT_AMOUNT] CHECK CONSTRAINT [FK_FACT_UNIT]
GO
USE [master]
GO
ALTER DATABASE [PET_DW] SET  READ_WRITE 
GO

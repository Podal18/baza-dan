USE [master]
GO
/****** Object:  Database [Подгорнова]    Script Date: 31.03.2023 15:41:26 ******/
CREATE DATABASE [Подгорнова]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Подгорнова', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Подгорнова.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Подгорнова_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Подгорнова_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Подгорнова] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Подгорнова].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Подгорнова] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Подгорнова] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Подгорнова] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Подгорнова] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Подгорнова] SET ARITHABORT OFF 
GO
ALTER DATABASE [Подгорнова] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Подгорнова] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Подгорнова] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Подгорнова] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Подгорнова] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Подгорнова] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Подгорнова] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Подгорнова] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Подгорнова] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Подгорнова] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Подгорнова] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Подгорнова] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Подгорнова] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Подгорнова] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Подгорнова] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Подгорнова] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Подгорнова] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Подгорнова] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Подгорнова] SET  MULTI_USER 
GO
ALTER DATABASE [Подгорнова] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Подгорнова] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Подгорнова] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Подгорнова] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Подгорнова] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Подгорнова] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Подгорнова] SET QUERY_STORE = OFF
GO
USE [Подгорнова]
GO
/****** Object:  Table [dbo].[country]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[Code] [nchar](2) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[countOfStars] [int] NOT NULL,
	[countryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotelComment]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelComment](
	[id] [int] NOT NULL,
	[hotelId] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[creationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_hotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotelimage]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelimage](
	[id] [int] NOT NULL,
	[hottelId] [int] NOT NULL,
	[imageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_hotelimage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[hotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[hotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[id] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[id] [int] NOT NULL,
	[code] [int] NOT NULL,
	[ticketcount] [nvarchar](100) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[imagePreview] [varbinary](max) NULL,
	[price] [money] NOT NULL,
	[isActual] [bit] NOT NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeOfTour]    Script Date: 31.03.2023 15:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeOfTour](
	[tourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_typeOfTour] PRIMARY KEY CLUSTERED 
(
	[tourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([id], [name], [description]) VALUES (1, N'тип 1', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (2, N'тип 2', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (3, N'тип 3', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (4, N'тип 4', NULL)
SET IDENTITY_INSERT [dbo].[type] OFF
GO
ALTER TABLE [dbo].[hotel]  WITH CHECK ADD  CONSTRAINT [FK_hotel_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([Code])
GO
ALTER TABLE [dbo].[hotel] CHECK CONSTRAINT [FK_hotel_country]
GO
ALTER TABLE [dbo].[hotelComment]  WITH CHECK ADD  CONSTRAINT [FK_hotelComment_hotel] FOREIGN KEY([hotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelComment] CHECK CONSTRAINT [FK_hotelComment_hotel]
GO
ALTER TABLE [dbo].[hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_hotelimage_hotel] FOREIGN KEY([hottelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelimage] CHECK CONSTRAINT [FK_hotelimage_hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_hotel] FOREIGN KEY([hotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_tour]
GO
ALTER TABLE [dbo].[typeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_typeOfTour_tour] FOREIGN KEY([tourId])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[typeOfTour] CHECK CONSTRAINT [FK_typeOfTour_tour]
GO
ALTER TABLE [dbo].[typeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_typeOfTour_type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[type] ([id])
GO
ALTER TABLE [dbo].[typeOfTour] CHECK CONSTRAINT [FK_typeOfTour_type]
GO
USE [master]
GO
ALTER DATABASE [Подгорнова] SET  READ_WRITE 
GO

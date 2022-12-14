USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 20/11/2022 00:42:19 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TestDB]
GO
USE [TestDB]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 20/11/2022 00:42:19 ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[device]    Script Date: 20/11/2022 00:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[device](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[sold] [bit] NOT NULL,
	[temperature] [smallint] NOT NULL,
	[simcard_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[simcard]    Script Date: 20/11/2022 00:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[simcard](
	[simid] [bigint] IDENTITY(1,1) NOT NULL,
	[country] [varchar](255) NULL,
	[operator_code] [bigint] NULL,
	[status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[simid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[device] ON 

INSERT [dbo].[device] ([id], [name], [sold], [temperature], [simcard_id]) VALUES (1, N'Water Leakage Sensor', 0, -10, 1)
INSERT [dbo].[device] ([id], [name], [sold], [temperature], [simcard_id]) VALUES (2, N'Motion Senor', 0, 45, 2)
INSERT [dbo].[device] ([id], [name], [sold], [temperature], [simcard_id]) VALUES (3, N'Electricity Sensor', 0, -3, 3)
INSERT [dbo].[device] ([id], [name], [sold], [temperature], [simcard_id]) VALUES (4, N'Fire Senor', 0, 49, 4)
INSERT [dbo].[device] ([id], [name], [sold], [temperature], [simcard_id]) VALUES (5, N'Soil Mosture Sensor', 0, 10, 5)
INSERT [dbo].[device] ([id], [name], [sold], [temperature], [simcard_id]) VALUES (6, N'Co2 Sensor', 1, 90, 6)
SET IDENTITY_INSERT [dbo].[device] OFF
GO
SET IDENTITY_INSERT [dbo].[simcard] ON 

INSERT [dbo].[simcard] ([simid], [country], [operator_code], [status]) VALUES (1, N'Itlay', 100, N'READY')
INSERT [dbo].[simcard] ([simid], [country], [operator_code], [status]) VALUES (2, N'Greece', 101, N'Deactivated')
INSERT [dbo].[simcard] ([simid], [country], [operator_code], [status]) VALUES (3, N'China', 102, N'Active')
INSERT [dbo].[simcard] ([simid], [country], [operator_code], [status]) VALUES (4, N'German', 103, N'READY')
INSERT [dbo].[simcard] ([simid], [country], [operator_code], [status]) VALUES (5, N'Bali', 104, N'WaitingForActivation')
INSERT [dbo].[simcard] ([simid], [country], [operator_code], [status]) VALUES (6, N'Spain', 105, N'Blocked')
SET IDENTITY_INSERT [dbo].[simcard] OFF
GO
/****** Object:  Index [UK_ai1vjdt9eclice8rm4rf4i0qo]    Script Date: 20/11/2022 00:42:19 ******/
ALTER TABLE [dbo].[simcard] ADD  CONSTRAINT [UK_ai1vjdt9eclice8rm4rf4i0qo] UNIQUE NONCLUSTERED 
(
	[operator_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FKck4n06w33igq9xfp1aodhrcev] FOREIGN KEY([simcard_id])
REFERENCES [dbo].[simcard] ([simid])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FKck4n06w33igq9xfp1aodhrcev]
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO

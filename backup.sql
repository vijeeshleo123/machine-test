USE [master]
GO
/****** Object:  Database [airline]    Script Date: 4/14/2023 5:45:50 PM ******/
CREATE DATABASE [airline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'airline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\airline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'airline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\airline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [airline] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [airline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [airline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [airline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [airline] SET ARITHABORT OFF 
GO
ALTER DATABASE [airline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [airline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [airline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [airline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [airline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [airline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [airline] SET  MULTI_USER 
GO
ALTER DATABASE [airline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [airline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [airline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [airline] SET QUERY_STORE = OFF
GO
USE [airline]
GO
/****** Object:  Table [dbo].[FLIGHT1]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLIGHT1](
	[Flight_id] [int] IDENTITY(1,1) NOT NULL,
	[Dep_Airport] [varchar](20) NULL,
	[Dep_DateandTime] [date] NULL,
	[Arr_Airport] [varchar](20) NULL,
	[Arr_DateandTime] [date] NULL,
 CONSTRAINT [PK_FLIGHT1] PRIMARY KEY CLUSTERED 
(
	[Flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FLIGHT1] ON 

INSERT [dbo].[FLIGHT1] ([Flight_id], [Dep_Airport], [Dep_DateandTime], [Arr_Airport], [Arr_DateandTime]) VALUES (2, N'DELHIKHKHKKLLLL', CAST(N'2023-04-09' AS Date), N'qatar', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[FLIGHT1] ([Flight_id], [Dep_Airport], [Dep_DateandTime], [Arr_Airport], [Arr_DateandTime]) VALUES (4, N'mumbai', CAST(N'2023-03-20' AS Date), N'madrid', CAST(N'2023-03-21' AS Date))
SET IDENTITY_INSERT [dbo].[FLIGHT1] OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteFlightDetails]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create Procedure [dbo].[Sp_DeleteFlightDetails]
(
@FlyId int
)

as 
Begin
DELETE FROM FLIGHT1 WHERE Flight_Id=@FlyId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllDetails]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE[dbo].[Sp_GetAllDetails]
AS
BEGIN
SELECT * FROM FLIGHT1
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetFlightById]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_GetFlightById]
 (
 @FlyId int
 )
 AS
 BEGIN
 SELECT * FROM FLIGHT1 WHERE Flight_Id= @FlyId
 END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertFlightDetails]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_InsertFlightDetails]
(
@Dep_Airport VARCHAR(20)='',
@Dep_DateAndTime DATE,
@Arr_Airport  VARCHAR(20)='',
@Arr_DateAndTime DATE
)
AS
BEGIN
 INSERT into FLIGHT1(Dep_Airport,Dep_DateAndTime,Arr_Airport,Arr_DateAndTime)
 VALUES(@Dep_Airport,@Dep_DateAndTime,@Arr_Airport,@Arr_DateAndTime)
 END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Login]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[Sp_Login]
 (
 @UserName Varchar(20),
 @PassWord Varchar(20),
 @Isvalid BIT OUT
 )
 AS
 BEGIN
 SET @Isvalid=(SELECT COUNT(1) FROM LOGIN WHERE UserName=@UserName AND PassWord=@PassWord)
 END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateFlightDetails]    Script Date: 4/14/2023 5:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_UpdateFlightDetails]
(
@FlyId int=0,
@Dep_Airport VARCHAR(20)='',
@Dep_DateAndTime DATE,
@Arr_Airport  VARCHAR(20)='',
@Arr_DateAndTime DATE
)
AS
BEGIN
 Update FLIGHT1 SET Dep_Airport=@Dep_Airport,Dep_DateAndTime=@Dep_DateAndTime,Arr_Airport=@Arr_Airport,Arr_DateAndTime=@Arr_DateAndTime WHERE Flight_Id=@FlyId
 END
GO
USE [master]
GO
ALTER DATABASE [airline] SET  READ_WRITE 
GO

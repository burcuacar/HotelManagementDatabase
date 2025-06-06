USE [master]
GO
/****** Object:  Database [HotelDb]    Script Date: 12/1/2023 1:17:52 PM ******/
CREATE DATABASE [HotelDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelDb] SET  MULTI_USER 
GO
ALTER DATABASE [HotelDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelDb] SET QUERY_STORE = OFF
GO
USE [HotelDb]
GO
/****** Object:  User [SystemAdministrator]    Script Date: 12/1/2023 1:17:52 PM ******/
CREATE USER [SystemAdministrator] FOR LOGIN [SystemAdministrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Management]    Script Date: 12/1/2023 1:17:52 PM ******/
CREATE USER [Management] FOR LOGIN [Management] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminAssistant]    Script Date: 12/1/2023 1:17:52 PM ******/
CREATE USER [AdminAssistant] FOR LOGIN [AdminAssistant] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [SystemAdministrator]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SystemAdministrator]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [SystemAdministrator]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SystemAdministrator]
GO
GRANT CONNECT TO [AdminAssistant] AS [dbo]
GO
GRANT CONNECT TO [Management] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
DENY DELETE TO [SystemAdministrator] AS [dbo]
GO
DENY UPDATE TO [SystemAdministrator] AS [dbo]
GO
GRANT CONNECT TO [SystemAdministrator] AS [dbo]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](50) NOT NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](25) NOT NULL,
	[State] [char](2) NULL,
	[Country] [varchar](25) NOT NULL,
	[ZIP] [varchar](10) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Address] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Address] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Address] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Address] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Address] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Address] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Address] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Address] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[Address] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Address] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Address] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Address] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Address] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Department] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Department] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Department] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Department] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Department] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Department] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Department] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Department] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[Department] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Department] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Department] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Department] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Department] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[ContactNumber] [varchar](12) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[DepartmentId] [int] NULL,
	[AddressId] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[EmployeeStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Employee] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Employee] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Employee] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Employee] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Employee] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Employee] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Employee] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Employee] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Employee] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Employee] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Employee] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Employee] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStatus](
	[EmployeeStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_EmployeeStatus] PRIMARY KEY CLUSTERED 
(
	[EmployeeStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[EmployeeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[EmployeeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[EmployeeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[EmployeeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[EmployeeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[EmployeeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[EmployeeStatus] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ExpenseTypeId] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[ExpenseStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Expense] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Expense] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Expense] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Expense] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Expense] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Expense] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Expense] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Expense] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Expense] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Expense] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Expense] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Expense] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[ExpenseStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseStatus](
	[ExpenseStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ExpenseStatus] PRIMARY KEY CLUSTERED 
(
	[ExpenseStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[ExpenseStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ExpenseStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[ExpenseStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ExpenseStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[ExpenseStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ExpenseStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ExpenseStatus] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[ExpenseType]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseType](
	[ExpenseTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ExpenseType_1] PRIMARY KEY CLUSTERED 
(
	[ExpenseTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[ExpenseType] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ExpenseType] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[ExpenseType] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ExpenseType] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[ExpenseType] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ExpenseType] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ExpenseType] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[ContactNumber] [varchar](12) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[CreditCard] [varchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Guest] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Guest] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Guest] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Guest] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Guest] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Guest] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Guest] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Guest] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Guest] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Guest] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Guest] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Guest] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContactNumber] [varchar](12) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[RoomCapacity] [int] NOT NULL,
	[Rating] [decimal](3, 2) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Hotel] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Hotel] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Hotel] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Hotel] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Hotel] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Hotel] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Hotel] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Hotel] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Hotel] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Hotel] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Hotel] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Hotel] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemTypeId] [int] NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[ItemStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Item] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Item] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Item] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Item] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Item] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Item] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Item] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Item] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[Item] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Item] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Item] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Item] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Item] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[ItemStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemStatus](
	[ItemStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ItemStatus] PRIMARY KEY CLUSTERED 
(
	[ItemStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[ItemStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ItemStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[ItemStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ItemStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[ItemStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ItemStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ItemStatus] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ItemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[ItemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[ItemType] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ItemType] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[ItemType] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ItemType] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[ItemType] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ItemType] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ItemType] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [bigint] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[RoomId] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Payment] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Payment] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Payment] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Payment] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Payment] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Payment] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Payment] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Payment] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Payment] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Payment] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Payment] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Payment] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[PaymentDetail]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetail](
	[PaymentDetailId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemTypeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PaymentDetail] PRIMARY KEY CLUSTERED 
(
	[PaymentDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[PaymentDetail] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[PaymentDetail] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[PaymentDetail] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[PaymentDetail] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[PaymentDetail] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[PaymentDetail] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[PaymentDetail] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[PaymentDetail] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[PaymentDetail] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[PaymentDetail] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[PaymentDetail] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[PaymentDetail] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[PaymentStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[PaymentStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[PaymentStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[PaymentStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[PaymentStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[PaymentStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[PaymentStatus] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[PaymentType] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[PaymentType] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[PaymentType] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[PaymentType] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[PaymentType] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[PaymentType] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[PaymentType] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [bigint] IDENTITY(1,1) NOT NULL,
	[GuestId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ReservationStatusId] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[CheckInDate] [datetime] NULL,
	[CheckOutDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[AdditionalNotes] [varchar](100) NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Reservation] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Reservation] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Reservation] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Reservation] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Reservation] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Reservation] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Reservation] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Reservation] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Reservation] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Reservation] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Reservation] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Reservation] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[ReservationStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatus](
	[ReservationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ReservationStatus] PRIMARY KEY CLUSTERED 
(
	[ReservationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[ReservationStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ReservationStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[ReservationStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ReservationStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[ReservationStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ReservationStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ReservationStatus] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[RoomStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[Room] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Room] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[Room] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Room] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[Room] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Room] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[Room] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Room] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[Room] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Room] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[Room] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Room] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[RoomStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_RoomStatus] PRIMARY KEY CLUSTERED 
(
	[RoomStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[RoomStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[RoomStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[RoomStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[RoomStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[RoomStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[RoomStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[RoomStatus] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Description] [varchar](100) NULL,
	[SmokeFriendly] [bit] NOT NULL,
	[PetFriendly] [bit] NOT NULL,
	[RoomTypeStatusId] [int] NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[RoomType] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[RoomType] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[RoomType] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[RoomType] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[RoomType] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[RoomType] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[RoomType] TO [Management] AS [dbo]
GO
/****** Object:  Table [dbo].[RoomTypeStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypeStatus](
	[RoomTypeStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_RoomTypeStatus] PRIMARY KEY CLUSTERED 
(
	[RoomTypeStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT ALTER ON [dbo].[RoomTypeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT CONTROL ON [dbo].[RoomTypeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT INSERT ON [dbo].[RoomTypeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[RoomTypeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT SELECT ON [dbo].[RoomTypeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT UPDATE ON [dbo].[RoomTypeStatus] TO [AdminAssistant] AS [dbo]
GO
GRANT ALTER ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
GRANT CONTROL ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
GRANT DELETE ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
GRANT INSERT ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
GRANT SELECT ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
GRANT UPDATE ON [dbo].[RoomTypeStatus] TO [Management] AS [dbo]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (1, N'1459 28th Street', N'Apt 04', N'Arlington', N'VA', N'United States', N'22206')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (2, N'1344 13rd Street', NULL, N'Los Angeles', N'CA', N'United States', N'94001')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (3, N'555 10th Street', N'Suite 3', N'Arlington', N'VA', N'United States', N'22006')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (4, N'144 X Road', N'Floor 5', N'Houston', N'TX', N'United States', N'77551')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (5, N'222 11th Drive', NULL, N'Miami', N'FL', N'United States', N'31161')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (6, N'105 23rd Street', N'Unit 35', N'Seattle', N'DC', N'United States', N'70101')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (7, N'South Hayes Street', N'Pentagon City', N'Arlington', N'VA', N'United States', N'222006')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (8, N'North Black Street', NULL, N'Arlington', N'VA', N'United States', N'222007')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (9, N'Buckingom Street', NULL, N'Arlington', N'VA', N'United States', N'222010')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (10, N'1459 6th Street', N'Apt 07', N'Arlington', N'VA', N'United States', N'22206')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (11, N'1066 7th Street', NULL, N'Los Angeles', N'CA', N'United States', N'94001')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (12, N'900 10th Street', NULL, N'Arlington', N'VA', N'United States', N'22006')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (13, N'241 Y Road', NULL, N'Houston', N'TX', N'United States', N'77551')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (14, N'467 11th Drive', NULL, N'Miami', N'FL', N'United States', N'31161')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (15, N'105 23rd Street', NULL, N'Seattle', N'DC', N'United States', N'70101')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (16, N'East Hayes Street', N'Pentagon City', N'Arlington', N'VA', N'United States', N'222006')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (17, N'West White Street', NULL, N'Arlington', N'VA', N'United States', N'222007')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (18, N'2000 1st Street', NULL, N'Arlington', N'VA', N'United States', N'22206')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (19, N'6664 2nd Street', NULL, N'Los Angeles', N'CA', N'United States', N'94001')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (20, N'935 10th Street', N'Suite 3', N'Arlington', N'VA', N'United States', N'22006')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (21, N'1904 Z Road', N'Floor 15', N'Houston', N'TX', N'United States', N'77551')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (22, N'1999 11th Drive', NULL, N'Miami', N'FL', N'United States', N'31161')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (23, N'105 23rd Street', NULL, N'Seattle', N'DC', N'United States', N'70101')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (24, N'Hayes Street', N'Pentagon City', N'Arlington', N'VA', N'United States', N'222006')
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [City], [State], [Country], [ZIP]) VALUES (25, N'Orange Black Street', NULL, N'Arlington', N'VA', N'United States', N'222007')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (1, N'Front Desk', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (2, N'Housekeeping', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (3, N'Food and Beverage', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (4, N'Sales and Marketing', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (5, N'Finance', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (6, N'Human Resources', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (7, N'Maintenance', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (8, N'Security', NULL)
INSERT [dbo].[Department] ([DepartmentId], [Name], [Description]) VALUES (9, N'IT', NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (1, N'Burcu', N'Acar', N'+13122151515', N'burcu@gmail.com', 1, 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (2, N'Tarik', N'Malci', N'+12235641012', N'tarik@gmail.com', 2, 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (3, N'Aysegul', N'Ozgan', N'+12355220030', N'aysegul@gmail.com', 3, 3, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (4, N'Aysel', N'Acar', N'+12244231324', N'aysel@gmail.com', 4, 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (5, N'Cinar', N'Ozgan', N'+17884351313', N'cinar@gmail.com', 5, 3, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (6, N'Daniel', N'Beckham', N'+12453099955', N'daniel@gmail.com', 6, 4, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (7, N'Victoria', N'Deep', N'+12226559567', N'vicktoria@gmail.com', 7, 5, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (8, N'Penelope', N'Cruz', N'+13364973883', N'penelope@gmail.com', 8, 6, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (9, N'Ana Maria', N'Savay', N'+19568102015', N'maria@gmail.com', 1, 10, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (10, N'Ethan', N'Statham', N'+18655640072', N'ethan@gmail.com', 2, 11, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (11, N'Matthew', N'Carter', N'+12356220050', N'matthew@gmail.com', 3, 12, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (12, N'Mark', N'Zuckerberg', N'+3244236324', N'mark@gmail.com', 4, 13, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (13, N'Hilary', N'Clinton', N'+17885351373', N'hilary@gmail.com', 5, 14, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (14, N'Bill', N'Brookeash', N'+2453099955', N'bill@gmail.com', 6, 15, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (15, N'Vanesa', N'Midyurova', N'+12226550567', N'vanesa@gmail.com', 7, 16, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (16, N'Klara', N'Hajkova', N'+15364993803', N'klara@gmail.com', 8, 17, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (17, N'Megan', N'Moyer', N'+3442158505', N'megan@gmail.com', 1, 18, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (18, N'Jerome', N'Brittingham', N'+12235647012', N'jerome@gmail.com', 2, 19, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (19, N'Heather', N'Banks', N'+12350240030', N'heather@gmail.com', 3, 20, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (20, N'Ian', N'Burke', N'+2244231374', N'ian@gmail.com', 4, 21, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (21, N'Robert', N'Barna', N'+17884367393', N'robert@gmail.com', 5, 22, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (22, N'Hunter', N'Espenshade', N'+12463090955', N'hunter@gmail.com', 6, 23, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (23, N'Matt', N'Sculley', N'+14446559567', N'matt@gmail.com', 7, 24, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (24, N'Veronika', N'Kashaykova', N'+17960073883', N'veronika@gmail.com', 8, 25, 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (25, N'Ahmet', N'Ozgan', N'+16664973883', N'ahmet@gmail.com', 9, 6, 1, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (26, N'Ahmet', N'Sevim', N'+19664973883', N'sevim@gmail.com', 9, 6, 2, 1)
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [ContactNumber], [Email], [DepartmentId], [AddressId], [HotelId], [EmployeeStatusId]) VALUES (27, N'Drew', N'Gold', N'+12364973883', N'drewgold@gmail.com', 9, 6, 3, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeStatus] ON 

INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (1, N'In Employment')
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (2, N'On Leave')
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (3, N'On Suspension')
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (4, N'Terminated')
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (5, N'Resigned')
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (6, N'Dead')
INSERT [dbo].[EmployeeStatus] ([EmployeeStatusId], [Name]) VALUES (7, N'Sick')
SET IDENTITY_INSERT [dbo].[EmployeeStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Expense] ON 

INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (1, 1, 2, N'Accomodation', CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (2, 2, 4, N'Transportation', CAST(2000.00 AS Decimal(18, 2)), CAST(N'2023-12-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (3, 3, 3, N'Meals', CAST(400.00 AS Decimal(18, 2)), CAST(N'2023-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (4, 4, 1, N'Travel', CAST(4000.00 AS Decimal(18, 2)), CAST(N'2023-03-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (5, 5, 3, N'Meals', CAST(450.00 AS Decimal(18, 2)), CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (6, 6, 3, N'Meals', CAST(200.00 AS Decimal(18, 2)), CAST(N'2023-10-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Expense] ([ExpenseId], [EmployeeId], [ExpenseTypeId], [Description], [Amount], [ExpenseDate], [ExpenseStatusId]) VALUES (7, 7, 3, N'Meals', CAST(250.00 AS Decimal(18, 2)), CAST(N'2023-09-12T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Expense] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseStatus] ON 

INSERT [dbo].[ExpenseStatus] ([ExpenseStatusId], [Name]) VALUES (1, N'Paid For')
INSERT [dbo].[ExpenseStatus] ([ExpenseStatusId], [Name]) VALUES (2, N'Not Paid For')
SET IDENTITY_INSERT [dbo].[ExpenseStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseType] ON 

INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (1, N'Travel')
INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (2, N'Accommodation')
INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (3, N'Meals')
INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (4, N'Transportation')
INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (5, N'Supplies')
INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (6, N'Entertainment')
INSERT [dbo].[ExpenseType] ([ExpenseTypeId], [Name]) VALUES (7, N'Miscellaneous')
SET IDENTITY_INSERT [dbo].[ExpenseType] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (1, N'Fleudy', N'Fragosa', N'+19842158505', N'fleudy@gmail.com', N'2934567929191956', 1)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (2, N'Malina', N'Ardelean', N'+12235647012', N'malina@gmail.com', N'1111777788889054', 2)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (3, N'Drew', N'Hoster', N'+19090240030', N'drew@gmail.com', N'7779944567374859', 25)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (4, N'Melissa', N'Gmitter', N'+2249961374', N'melissa@gmail.com', N'2829202888888888', 23)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (5, N'Tina', N'Lopez', N'+17000367393', N'tina@gmail.com', N'1949595959595900', 22)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (6, N'Natalija', N'Durkovic', N'+12000090955', N'natalija@gmail.com', N'2737383999998878', 20)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (7, N'Veli', N'Oz', N'+17846559567', N'veli@gmail.com', N'1916574858697856', 15)
INSERT [dbo].[Guest] ([GuestId], [FirstName], [LastName], [ContactNumber], [EmailAddress], [CreditCard], [AddressId]) VALUES (8, N'Holly', N'Green', N'+18860073883', N'holly@gmail.com', N'5000067892000456', 14)
SET IDENTITY_INSERT [dbo].[Guest] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([HotelId], [Name], [ContactNumber], [AddressId], [Email], [RoomCapacity], [Rating], [Status]) VALUES (1, N'Star Hotel', N'+12453254369', 7, N'starhotel@hotels.com', 500, CAST(4.80 AS Decimal(3, 2)), 1)
INSERT [dbo].[Hotel] ([HotelId], [Name], [ContactNumber], [AddressId], [Email], [RoomCapacity], [Rating], [Status]) VALUES (2, N'Diamond Hotel', N'+13446552113', 8, N'diamondhotel@hotels.com', 456, CAST(4.40 AS Decimal(3, 2)), 1)
INSERT [dbo].[Hotel] ([HotelId], [Name], [ContactNumber], [AddressId], [Email], [RoomCapacity], [Rating], [Status]) VALUES (3, N'Gold Hotel', N'+12559132810', 9, N'diamondhotel@hotels.com', 339, CAST(4.60 AS Decimal(3, 2)), 1)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (1, 1, N'Pizza', CAST(16.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (2, 1, N'Burger', CAST(15.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (3, 2, N'Pepsi', CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (4, 2, N'Fanta', CAST(4.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (5, 3, N'Room Cleaning', CAST(50.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (6, 4, N'Special Breakfast', CAST(35.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (7, 5, N'Sandwich', CAST(45.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (8, 6, N'Special Dinner', CAST(125.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (9, 7, N'Taco', CAST(55.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (10, 9, N'Thai Massage', CAST(260.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (11, 10, N'Yoga Class', CAST(20.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (12, 11, N'Mini Bar', CAST(58.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (13, 12, N'Special Package', CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (14, 13, N'Shuttle Service', CAST(150.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (15, 14, N'Bag', CAST(8.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (16, 15, N'Special Night Tour', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (17, 16, N'Event Consultation', CAST(300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (18, 17, N'Special Pet Service', CAST(90.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (19, 18, N'WiFi', CAST(60.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (21, 19, N'Presidential Room', CAST(10000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (26, 19, N'Single Room', CAST(1000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (28, 19, N'Double Room', CAST(2000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (29, 19, N'Suite Room', CAST(2500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (30, 19, N'King Room', CAST(3000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (31, 19, N'Queen Room', CAST(5000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (33, 19, N'Family Room', CAST(3500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (34, 19, N'Studio Room', CAST(1500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Item] ([ItemId], [ItemTypeId], [Name], [Cost], [ItemStatusId]) VALUES (35, 19, N'VIP', CAST(7000.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemStatus] ON 

INSERT [dbo].[ItemStatus] ([ItemStatusId], [Name]) VALUES (1, N'Available')
INSERT [dbo].[ItemStatus] ([ItemStatusId], [Name]) VALUES (2, N'Out of Stock')
INSERT [dbo].[ItemStatus] ([ItemStatusId], [Name]) VALUES (3, N'In Preparation')
INSERT [dbo].[ItemStatus] ([ItemStatusId], [Name]) VALUES (4, N'Cancelled')
SET IDENTITY_INSERT [dbo].[ItemStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemType] ON 

INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (1, N'Food')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (2, N'Beverage')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (3, N'Service')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (4, N'Breakfast')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (5, N'Lunch')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (6, N'Dinner')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (7, N'Snacks')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (8, N'Beverage Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (9, N'Spa Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (10, N'Fitness Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (11, N'Room Amenities')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (12, N'Conference Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (13, N'Transportation Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (14, N'Gift Shop Items')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (15, N'Tour Packages')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (16, N'Event Planning Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (17, N'Pet Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (18, N'Technology Services')
INSERT [dbo].[ItemType] ([ItemTypeId], [Name]) VALUES (19, N'Room')
SET IDENTITY_INSERT [dbo].[ItemType] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [ReservationId], [PaymentTypeId], [Cost], [RoomId], [PaymentDate], [PaymentStatusId]) VALUES (1, 2, 1, CAST(2344.95 AS Decimal(18, 2)), 20, CAST(N'2023-11-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Payment] ([PaymentId], [ReservationId], [PaymentTypeId], [Cost], [RoomId], [PaymentDate], [PaymentStatusId]) VALUES (2, 3, 1, CAST(20300.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Payment] ([PaymentId], [ReservationId], [PaymentTypeId], [Cost], [RoomId], [PaymentDate], [PaymentStatusId]) VALUES (3, 4, 1, CAST(3090.00 AS Decimal(18, 2)), 2, CAST(N'2023-11-25T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Payment] ([PaymentId], [ReservationId], [PaymentTypeId], [Cost], [RoomId], [PaymentDate], [PaymentStatusId]) VALUES (4, 5, 1, CAST(2030.00 AS Decimal(18, 2)), 3, CAST(N'2023-11-25T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Payment] ([PaymentId], [ReservationId], [PaymentTypeId], [Cost], [RoomId], [PaymentDate], [PaymentStatusId]) VALUES (5, 6, 1, CAST(10000.00 AS Decimal(18, 2)), 10, CAST(N'2023-11-25T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Payment] ([PaymentId], [ReservationId], [PaymentTypeId], [Cost], [RoomId], [PaymentDate], [PaymentStatusId]) VALUES (6, 8, 1, CAST(25000.00 AS Decimal(18, 2)), 15, CAST(N'2023-11-25T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentDetail] ON 

INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (1, 1, 1, 1, 5, CAST(84.95 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (2, 1, 10, 9, 1, CAST(260.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (3, 1, 26, 19, 2, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (4, 2, 21, 19, 2, CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (5, 2, 14, 13, 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (6, 3, 26, 19, 3, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (7, 3, 7, 5, 2, CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (8, 4, 28, 19, 1, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (9, 4, 16, 15, 1, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (10, 5, 21, 19, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[PaymentDetail] ([PaymentDetailId], [PaymentId], [ItemId], [ItemTypeId], [Quantity], [Cost]) VALUES (11, 6, 31, 19, 5, CAST(25000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PaymentDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentStatus] ON 

INSERT [dbo].[PaymentStatus] ([PaymentStatusId], [Name]) VALUES (1, N'Pending')
INSERT [dbo].[PaymentStatus] ([PaymentStatusId], [Name]) VALUES (2, N'Completed')
INSERT [dbo].[PaymentStatus] ([PaymentStatusId], [Name]) VALUES (3, N'Failed')
INSERT [dbo].[PaymentStatus] ([PaymentStatusId], [Name]) VALUES (4, N'Refunded')
SET IDENTITY_INSERT [dbo].[PaymentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PaymentTypeId], [Name]) VALUES (1, N'Credit Card')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [Name]) VALUES (2, N'Debit Card')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [Name]) VALUES (3, N'Cash')
INSERT [dbo].[PaymentType] ([PaymentTypeId], [Name]) VALUES (4, N'Mobile Payment')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (1, 1, 19, 17, 1, CAST(N'2023-12-01T00:00:00.000' AS DateTime), NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (2, 8, 20, 17, 3, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-01T00:00:00.000' AS DateTime), NULL, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (3, 3, 1, 1, 3, CAST(N'2023-11-10T00:00:00.000' AS DateTime), CAST(N'2023-11-10T00:00:00.000' AS DateTime), NULL, CAST(5500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (4, 5, 2, 1, 3, CAST(N'2023-11-25T00:00:00.000' AS DateTime), CAST(N'2023-11-25T00:00:00.000' AS DateTime), NULL, CAST(5000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (5, 7, 3, 1, 3, CAST(N'2023-11-25T00:00:00.000' AS DateTime), CAST(N'2023-11-25T00:00:00.000' AS DateTime), NULL, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (6, 6, 10, 9, 2, CAST(N'2023-11-25T00:00:00.000' AS DateTime), NULL, NULL, CAST(5000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (7, 4, 13, 9, 1, CAST(N'2023-12-11T00:00:00.000' AS DateTime), NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Reservation] ([ReservationId], [GuestId], [RoomId], [EmployeeId], [ReservationStatusId], [BookingDate], [CheckInDate], [CheckOutDate], [TotalAmount], [AdditionalNotes]) VALUES (8, 2, 15, 9, 4, CAST(N'2023-11-25T00:00:00.000' AS DateTime), CAST(N'2023-11-26T00:00:00.000' AS DateTime), CAST(N'2023-11-27T00:00:00.000' AS DateTime), CAST(10000.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[ReservationStatus] ON 

INSERT [dbo].[ReservationStatus] ([ReservationStatusId], [Name]) VALUES (1, N'Booked')
INSERT [dbo].[ReservationStatus] ([ReservationStatusId], [Name]) VALUES (2, N'Booking Paid')
INSERT [dbo].[ReservationStatus] ([ReservationStatusId], [Name]) VALUES (5, N'Canceled')
INSERT [dbo].[ReservationStatus] ([ReservationStatusId], [Name]) VALUES (3, N'Checked In')
INSERT [dbo].[ReservationStatus] ([ReservationStatusId], [Name]) VALUES (4, N'Checked Out')
SET IDENTITY_INSERT [dbo].[ReservationStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (1, 1, 1, 101, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (2, 1, 3, 103, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (3, 1, 4, 201, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (4, 1, 5, 202, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (5, 1, 6, 203, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (6, 1, 7, 301, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (7, 1, 8, 302, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (8, 1, 9, 303, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (9, 1, 10, 304, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (10, 2, 1, 101, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (11, 2, 3, 103, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (12, 2, 4, 201, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (13, 2, 5, 202, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (14, 2, 6, 203, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (15, 2, 7, 301, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (16, 2, 8, 302, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (17, 2, 9, 303, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (18, 2, 10, 304, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (19, 3, 1, 101, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (20, 3, 3, 103, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (21, 3, 4, 201, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (22, 3, 5, 202, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (23, 3, 6, 203, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (24, 3, 7, 301, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (25, 3, 8, 302, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (26, 3, 9, 303, 2)
INSERT [dbo].[Room] ([RoomId], [HotelId], [RoomTypeId], [RoomNumber], [RoomStatusId]) VALUES (27, 3, 10, 304, 2)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomStatus] ON 

INSERT [dbo].[RoomStatus] ([RoomStatusId], [Name]) VALUES (1, N'Vacant')
INSERT [dbo].[RoomStatus] ([RoomStatusId], [Name]) VALUES (2, N'Booked')
INSERT [dbo].[RoomStatus] ([RoomStatusId], [Name]) VALUES (3, N'Occupied')
INSERT [dbo].[RoomStatus] ([RoomStatusId], [Name]) VALUES (4, N'Under Renovation')
INSERT [dbo].[RoomStatus] ([RoomStatusId], [Name]) VALUES (5, N'Discontinued')
SET IDENTITY_INSERT [dbo].[RoomStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (1, N'Presidential Room', CAST(10000.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (3, N'Single Room', CAST(1000.00 AS Decimal(18, 2)), NULL, 0, 0, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (4, N'Double Room', CAST(2000.00 AS Decimal(18, 2)), NULL, 0, 0, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (5, N'Suite Room', CAST(2500.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (6, N'King Room', CAST(3000.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (7, N'Queen Room', CAST(5000.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (8, N'Family Room', CAST(3500.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (9, N'Studio Room', CAST(1500.00 AS Decimal(18, 2)), NULL, 1, 1, 2)
INSERT [dbo].[RoomType] ([RoomTypeId], [Name], [Cost], [Description], [SmokeFriendly], [PetFriendly], [RoomTypeStatusId]) VALUES (10, N'VIP', CAST(7000.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypeStatus] ON 

INSERT [dbo].[RoomTypeStatus] ([RoomTypeStatusId], [Name]) VALUES (1, N'In Use')
INSERT [dbo].[RoomTypeStatus] ([RoomTypeStatusId], [Name]) VALUES (2, N'Discontinued')
SET IDENTITY_INSERT [dbo].[RoomTypeStatus] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Department]    Script Date: 12/1/2023 1:17:53 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_Department] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FirstLastName_idx]    Script Date: 12/1/2023 1:17:53 PM ******/
CREATE NONCLUSTERED INDEX [FirstLastName_idx] ON [dbo].[Guest]
(
	[FirstName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReservationStatus]    Script Date: 12/1/2023 1:17:53 PM ******/
ALTER TABLE [dbo].[ReservationStatus] ADD  CONSTRAINT [IX_ReservationStatus] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Address]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeStatus] FOREIGN KEY([EmployeeStatusId])
REFERENCES [dbo].[EmployeeStatus] ([EmployeeStatusId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeStatus]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Hotel]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Employee]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_ExpenseStatus] FOREIGN KEY([ExpenseStatusId])
REFERENCES [dbo].[ExpenseStatus] ([ExpenseStatusId])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_ExpenseStatus]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_ExpenseType] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[ExpenseType] ([ExpenseTypeId])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_ExpenseType]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_Guest_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_Guest_Address]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Address]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemStatus] FOREIGN KEY([ItemStatusId])
REFERENCES [dbo].[ItemStatus] ([ItemStatusId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemStatus]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([ItemTypeId])
REFERENCES [dbo].[ItemType] ([ItemTypeId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentStatus]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Reservation]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Room]
GO
ALTER TABLE [dbo].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDetail_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_Item]
GO
ALTER TABLE [dbo].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDetail_ItemType] FOREIGN KEY([ItemTypeId])
REFERENCES [dbo].[ItemType] ([ItemTypeId])
GO
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_ItemType]
GO
ALTER TABLE [dbo].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDetail_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_Payment]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Employee]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([GuestId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Guest]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_ReservationStatus] FOREIGN KEY([ReservationStatusId])
REFERENCES [dbo].[ReservationStatus] ([ReservationStatusId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_ReservationStatus]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Room]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomStatus] FOREIGN KEY([RoomStatusId])
REFERENCES [dbo].[RoomStatus] ([RoomStatusId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomStatus]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[RoomType]  WITH CHECK ADD  CONSTRAINT [FK_RoomType_RoomTypeStatus] FOREIGN KEY([RoomTypeStatusId])
REFERENCES [dbo].[RoomTypeStatus] ([RoomTypeStatusId])
GO
ALTER TABLE [dbo].[RoomType] CHECK CONSTRAINT [FK_RoomType_RoomTypeStatus]
GO
USE [master]
GO
ALTER DATABASE [HotelDb] SET  READ_WRITE 
GO

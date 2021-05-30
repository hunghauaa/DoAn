USE [master]
GO
/****** Object:  Database [Project@2021]    Script Date: 5/31/2021 12:14:34 AM ******/
CREATE DATABASE [Project@2021]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project@2021', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project@2021.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project@2021_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project@2021_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project@2021] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project@2021].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project@2021] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project@2021] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project@2021] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project@2021] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project@2021] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project@2021] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project@2021] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project@2021] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project@2021] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project@2021] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project@2021] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project@2021] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project@2021] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project@2021] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project@2021] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project@2021] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project@2021] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project@2021] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project@2021] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project@2021] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project@2021] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project@2021] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project@2021] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project@2021] SET  MULTI_USER 
GO
ALTER DATABASE [Project@2021] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project@2021] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project@2021] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project@2021] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project@2021] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project@2021] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project@2021] SET QUERY_STORE = OFF
GO
USE [Project@2021]
GO
/****** Object:  User [hung]    Script Date: 5/31/2021 12:14:35 AM ******/
CREATE USER [hung] FOR LOGIN [hung] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[PRODUCT_ID] [int] NULL,
	[QUANTITY] [int] NULL,
	[STATUS] [nvarchar](50) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[UPDATED_AT] [datetime] NULL,
	[MODIFY_BY] [datetime] NULL,
	[DELETED_AT] [datetime] NULL,
 CONSTRAINT [PK__CART__3214EC27B90E846F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[PARENT_ID] [int] NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__CATEGORY__3214EC2734FB5B68] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCT_ID] [int] NULL,
	[USER_ID] [int] NULL,
	[PARENT_ID] [int] NULL,
	[CONTENT_] [text] NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__COMMENT__3214EC2738FF75CD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPANY]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[ACTIVE] [bit] NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__COMPANY__3214EC279713F80E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DELIVERY_METHOD]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DELIVERY_METHOD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](30) NULL,
	[MONEY] [int] NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__DELIVERY__3214EC27A5CD5A22] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[PAYMENT_METHOD_ID] [int] NULL,
	[DELIVERY_METHOD_ID] [int] NULL,
	[ORDER_PROGRESS_ID] [int] NULL,
	[INTO_MONEY] [int] NULL,
	[TRANSPORT_FEE] [int] NULL,
	[STATUS] [nvarchar](30) NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
	[UPDATED_AT] [datetime] NULL,
 CONSTRAINT [PK__ODER__3214EC27DD7AF000] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_DETAIL]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_DETAIL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_ID] [int] NULL,
	[PRODUCT_ID] [int] NULL,
	[QUANTITY] [int] NULL,
	[TOTAL_MONEY] [int] NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__ORDER_DE__3214EC274AC81C57] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_PROGRESS]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_PROGRESS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PROGRESS] [nvarchar](100) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__ORDER_PR__3214EC27D2D3B660] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAYMENT_MEDTHOD]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT_MEDTHOD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](30) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__PAYMENT___3214EC271B8F653F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CODE] [char](100) NULL,
	[ORIGIN_PRICE] [money] NULL,
	[SALE] [int] NULL,
	[STATUS] [nvarchar](50) NULL,
	[NAME] [nvarchar](100) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[img1] [nvarchar](max) NULL,
	[img2] [nvarchar](max) NULL,
	[img3] [nvarchar](max) NULL,
	[img4] [nvarchar](max) NULL,
	[img5] [nvarchar](max) NULL,
	[CATEGORY_ID] [nvarchar](100) NULL,
	[COMPANY_ID] [int] NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED_AT] [datetime] NULL,
	[UPDATED_AT] [datetime] NULL,
 CONSTRAINT [PK__PRODUCTS__3214EC27D21EA6BF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[UPDATED_AT] [datetime] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED_AT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLIDES]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLIDES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[LINK] [nvarchar](255) NULL,
	[IMAGE] [nvarchar](255) NULL,
	[ORD] [int] NULL,
	[STATUS] [varchar](30) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
 CONSTRAINT [PK__SLIDES__3214EC27288AD45A] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [char](50) NULL,
	[PASSWORD] [char](100) NULL,
	[NAME] [nvarchar](100) NULL,
	[GENDER] [nvarchar](5) NULL,
	[EMAIL] [char](50) NULL,
	[DATE_OF_BIRTH] [date] NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[PHONE_NUMBER] [char](15) NULL,
	[CREATED_AT] [datetime] NULL,
	[CREATED_BY] [int] NULL,
	[MODIFY_BY] [int] NULL,
	[DELETED] [datetime] NULL,
	[ROLE_ID] [int] NULL,
	[UPDATED_AT] [datetime] NULL,
 CONSTRAINT [PK__USERS__3214EC2726E7C0E7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOUCHER]    Script Date: 5/31/2021 12:14:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOUCHER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](100) NULL,
	[SALE] [int] NULL,
	[SLUG] [nchar](30) NULL,
	[USER_ID] [int] NULL,
	[CONDITION] [int] NULL,
	[CREATED_BY] [datetime] NULL,
	[MODIFYED_BY] [datetime] NULL,
	[DELETED_BY] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CART] ON 

INSERT [dbo].[CART] ([ID], [USER_ID], [PRODUCT_ID], [QUANTITY], [STATUS], [CREATED_AT], [CREATED_BY], [UPDATED_AT], [MODIFY_BY], [DELETED_AT]) VALUES (51, 2, 12, 4, N'checkout', CAST(N'2021-05-29T16:27:53.357' AS DateTime), 1, NULL, CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CART] ([ID], [USER_ID], [PRODUCT_ID], [QUANTITY], [STATUS], [CREATED_AT], [CREATED_BY], [UPDATED_AT], [MODIFY_BY], [DELETED_AT]) VALUES (52, 2, 12, 4, N'checkout', CAST(N'2021-05-29T16:27:53.357' AS DateTime), 1, NULL, CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CART] ([ID], [USER_ID], [PRODUCT_ID], [QUANTITY], [STATUS], [CREATED_AT], [CREATED_BY], [UPDATED_AT], [MODIFY_BY], [DELETED_AT]) VALUES (53, 2, 12, 4, N'checkout', CAST(N'2021-05-29T16:27:53.357' AS DateTime), 1, NULL, CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CART] ([ID], [USER_ID], [PRODUCT_ID], [QUANTITY], [STATUS], [CREATED_AT], [CREATED_BY], [UPDATED_AT], [MODIFY_BY], [DELETED_AT]) VALUES (65, 1, 9, 2, N'checkout', CAST(N'2021-05-30T22:30:24.583' AS DateTime), 1, NULL, CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CART] ([ID], [USER_ID], [PRODUCT_ID], [QUANTITY], [STATUS], [CREATED_AT], [CREATED_BY], [UPDATED_AT], [MODIFY_BY], [DELETED_AT]) VALUES (66, 1, 10, 1, N'checkout', CAST(N'2021-05-30T23:17:17.910' AS DateTime), 1, NULL, CAST(N'1900-01-02T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CART] OFF
GO
SET IDENTITY_INSERT [dbo].[DELIVERY_METHOD] ON 

INSERT [dbo].[DELIVERY_METHOD] ([ID], [NAME], [MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (1, N'Giao hàng nhanh', 5000, CAST(N'2021-05-29T21:18:12.727' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DELIVERY_METHOD] ([ID], [NAME], [MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (2, N'Giao hàng tiết kiệm', 4750, CAST(N'2021-05-29T21:18:25.403' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DELIVERY_METHOD] ([ID], [NAME], [MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (3, N'GrabExpress', 4900, CAST(N'2021-05-29T21:18:53.707' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DELIVERY_METHOD] ([ID], [NAME], [MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (4, N'Vận chuyển hỏa tốc', 6000, CAST(N'2021-05-29T21:19:15.343' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DELIVERY_METHOD] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDER] ON 

INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (6, 1, 1, 1, 1, 272000, 5000, NULL, NULL, CAST(N'2021-05-29T23:43:31.043' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (7, 1, 1, 1, 2, 272000, 5000, NULL, NULL, CAST(N'2021-05-29T23:43:31.043' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (8, 1, 1, 1, 3, 272000, 5000, NULL, NULL, CAST(N'2021-05-29T23:43:31.043' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (9, 1, 1, 1, 4, 272000, 5000, NULL, NULL, CAST(N'2021-05-29T23:43:31.043' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (10, 1, 1, 1, 5, 272000, 5000, NULL, NULL, CAST(N'2021-05-29T23:43:31.043' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (11, 1, 1, 1, 1, 1472000, 5000, NULL, NULL, CAST(N'2021-05-30T17:08:34.407' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (12, 1, 1, 1, 1, 1472000, 5000, NULL, NULL, CAST(N'2021-05-30T17:08:35.967' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (13, 1, 1, 1, 1, 94000, 5000, NULL, NULL, CAST(N'2021-05-30T17:21:48.010' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (14, 1, 1, 1, 1, 94000, 5000, NULL, NULL, CAST(N'2021-05-30T17:23:37.933' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (15, 1, 1, 1, 1, 1874000, 5000, NULL, NULL, CAST(N'2021-05-30T17:25:22.190' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[ORDER] ([ID], [USER_ID], [PAYMENT_METHOD_ID], [DELIVERY_METHOD_ID], [ORDER_PROGRESS_ID], [INTO_MONEY], [TRANSPORT_FEE], [STATUS], [DESCRIPTION], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [UPDATED_AT]) VALUES (16, 1, 1, 1, 1, 472000, 5000, NULL, NULL, CAST(N'2021-05-30T22:28:36.693' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ORDER] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDER_DETAIL] ON 

INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (5, 6, 7, 1, 89000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (6, 6, 9, 2, 178000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (7, 7, 7, 1, 89000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (8, 7, 9, 2, 178000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (9, 8, 7, 1, 89000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (10, 8, 9, 2, 178000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (11, 9, 7, 1, 89000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (12, 9, 9, 2, 178000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (13, 10, 7, 1, 89000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (14, 10, 9, 2, 178000, CAST(N'2021-05-29T23:43:31.057' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (15, 11, 7, 1, 89000, CAST(N'2021-05-30T17:08:34.423' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (16, 11, 9, 2, 178000, CAST(N'2021-05-30T17:08:34.423' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (17, 11, 10, 12, 1200000, CAST(N'2021-05-30T17:08:34.423' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (18, 12, 7, 1, 89000, CAST(N'2021-05-30T17:08:35.973' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (19, 12, 9, 2, 178000, CAST(N'2021-05-30T17:08:35.973' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (20, 12, 10, 12, 1200000, CAST(N'2021-05-30T17:08:35.973' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (21, 13, 16, 1, 89000, CAST(N'2021-05-30T17:21:48.037' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (22, 14, 16, 1, 89000, CAST(N'2021-05-30T17:23:37.953' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (23, 15, 7, 21, 1869000, CAST(N'2021-05-30T17:25:22.210' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (24, 16, 9, 3, 267000, CAST(N'2021-05-30T22:28:36.710' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_DETAIL] ([ID], [ORDER_ID], [PRODUCT_ID], [QUANTITY], [TOTAL_MONEY], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (25, 16, 10, 2, 200000, CAST(N'2021-05-30T22:28:36.710' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ORDER_DETAIL] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDER_PROGRESS] ON 

INSERT [dbo].[ORDER_PROGRESS] ([ID], [PROGRESS], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (1, N'Đơn hàng đã đặt', CAST(N'2021-05-29T22:17:43.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_PROGRESS] ([ID], [PROGRESS], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (2, N'Đã xác nhận thông tin thanh toán', CAST(N'2021-05-29T22:18:31.537' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_PROGRESS] ([ID], [PROGRESS], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (3, N'Đã giao cho ĐVVC', CAST(N'2021-05-29T22:20:50.760' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_PROGRESS] ([ID], [PROGRESS], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (4, N'Đã giao', CAST(N'2021-05-29T22:21:00.770' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_PROGRESS] ([ID], [PROGRESS], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (5, N'Đánh giá', CAST(N'2021-05-29T22:21:10.803' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[ORDER_PROGRESS] ([ID], [PROGRESS], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (6, N'Đã hủy', CAST(N'2021-05-29T22:21:10.803' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ORDER_PROGRESS] OFF
GO
SET IDENTITY_INSERT [dbo].[PAYMENT_MEDTHOD] ON 

INSERT [dbo].[PAYMENT_MEDTHOD] ([ID], [NAME], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (1, N'Khi nhận hàng', CAST(N'2021-05-29T22:21:41.310' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[PAYMENT_MEDTHOD] ([ID], [NAME], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED]) VALUES (2, N'Paypal', CAST(N'2021-05-29T22:21:47.727' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PAYMENT_MEDTHOD] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 

INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (1, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI1', N'Gối tựa đầu và tựa lưng có khả năng "tự nhớ", đàn hồi trở lại hình dạng ban đầu, không bao giờ bị biến dạng, móp, xẹp. Sản phẩm giúp giảm thiểu chấn thương khi có va đập mạnh. Thiết kế ôm khít, nâng đỡ vùng đầu cổ và cột sống, giúp bạn lái xe đúng tư thế, thoải mái, không bị mệt mỏi khi ngồi lái xe lâu.
Bạn có biết khi ngồi trên ghế văn phòng hoặc ghế lái ô tô lưng chúng ta luôn có xu hướng cong về phía trước? Đó chính là nguyên nhân gây ra bệnh đau lưng với nhân viên văn phòng, bệnh đau vai gáy, vôi hoá cột sống, thoái hoá đốt sống cổ và nhiều tác động xấu tới sức khoẻ cũng như vẻ đẹp của dân công sở, một giải pháp cực kỳ đơn giản là dùng gối tựa lưng, nhưng dùng gối không đúng tiêu chuẩn vừa không giải quyết được vấn đề vừa làm tình hình trở nên trầm trọng.

Bộ gối tựa đầu và tựa lưng bằng chất liệu cao su non có tính năng rất tiện lợi cho người dùng như:
- Thoáng mát, không bị nóng, bí hơi khi dùng

- Dễ dàng giặt giũ và làm sạch

- Không có mùi hôi kể cả khi dùng lâu ngày do khi nằm hay tác động lực vào gối các luồng khí sẽ lưu chuyển đều đặn

- Không có bụi bẩn, nấm mốc, kí sinh trùng vì chiếc gối luôn khô ráo, không giữ ẩm.
- Bền đẹp theo thời gian
Bộ gối tựa đầu và tựa lưng ô tô cao cấp là mẫu gối tựa lưng của chúng tôi được thiết kế theo đúng tiêu chuẩn thân hình của người châu Á, với chất liệu cao su hiện đại đàn hồi chậm mới xuất hiện tại Việt Nam qua tên gọi "cao su non" và vỏ vải dày gấp 3 lần bình thường, không nhăn, không phai màu khi giặt sẽ giúp lưng bạn luôn thẳng, không những bảo vệ sức khỏe và vóc dáng còn làm cho hình ảnh làm việc của bạn thêm nghiêm túc và chuyên nghiệp trong mắt đồng nghiệp.
Gối tựa lưng bằng cao su non với lớp vải bao bên ngoài là loại vải thoáng khí, không xù lông, khô nhanh chóng. Bên trong gối là cao su non có các đặc tính êm ái, nhẹ, mềm mại như đệm hơi, đặc biệt là khả năng thoáng khí tốt nhờ hàng ngàn khoang rỗng nhỏ li ti giúp không khí có thể lưu thông dễ dàng.
Với chất liệu tốt, không gây độc hại, rất thân thiện với môi trường, vô cùng êm ái luôn đảm bảo an toàn cho sức khoẻ của bạn khi dùng. Sản phẩm– gối tựa cổ xe ô tô được đánh giá là sản phẩm tiện ích, hữu dụng & phù hợp với từng nội thất với các loại xe khác nhau.

Sở hữu chiếc gối tựa đầu ô tô, gối tựa cổ xe ô tô, gối tựa đầu xe hơi trên đây sẽ luôn là lựa chọn tối ưu nhất của bạn, dành cho bạn sự tập trung cao độ, độ thoải mái dễ chịu nhất khi cầm lái.
- Với phương châm “Sự hài lòng của quý khách là thành công của chúng tôi”, Chúng tôi luôn luôn lắng nghe và sẵn sàng tiếp thu mọi ý kiến góp ý của quý khách hàng; không ngừng cải tiến, nghiên cứu và ứng dụng các công nghệ mới vào sản xuất để ngày càng hoàn thiện hơn các dòng sản phẩm chính, nâng cao tính năng và giảm giá thành sản xuất, mang lại cho khách hàng nhiều sự lựa chọn với giá cả hợp lý nhất.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'1', 1, CAST(N'2021-05-23T12:35:29.850' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (2, N'SP2                                                                                                 ', 101111.0000, 12, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ MARVEL BIỆT ĐỘI SIÊU ANH', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'1', 1, CAST(N'2021-05-23T12:36:52.147' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (3, N'SP3                                                                                                 ', 111111.0000, 13, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI2', N'Gối tựa đầu và tựa lưng có khả năng "tự nhớ", đàn hồi trở lại hình dạng ban đầu, không bao giờ bị biến dạng, móp, xẹp. Sản phẩm giúp giảm thiểu chấn thương khi có va đập mạnh. Thiết kế ôm khít, nâng đỡ vùng đầu cổ và cột sống, giúp bạn lái xe đúng tư thế, thoải mái, không bị mệt mỏi khi ngồi lái xe lâu.
Bạn có biết khi ngồi trên ghế văn phòng hoặc ghế lái ô tô lưng chúng ta luôn có xu hướng cong về phía trước? Đó chính là nguyên nhân gây ra bệnh đau lưng với nhân viên văn phòng, bệnh đau vai gáy, vôi hoá cột sống, thoái hoá đốt sống cổ và nhiều tác động xấu tới sức khoẻ cũng như vẻ đẹp của dân công sở, một giải pháp cực kỳ đơn giản là dùng gối tựa lưng, nhưng dùng gối không đúng tiêu chuẩn vừa không giải quyết được vấn đề vừa làm tình hình trở nên trầm trọng.

Bộ gối tựa đầu và tựa lưng bằng chất liệu cao su non có tính năng rất tiện lợi cho người dùng như:
- Thoáng mát, không bị nóng, bí hơi khi dùng

- Dễ dàng giặt giũ và làm sạch

- Không có mùi hôi kể cả khi dùng lâu ngày do khi nằm hay tác động lực vào gối các luồng khí sẽ lưu chuyển đều đặn

- Không có bụi bẩn, nấm mốc, kí sinh trùng vì chiếc gối luôn khô ráo, không giữ ẩm.
- Bền đẹp theo thời gian
Bộ gối tựa đầu và tựa lưng ô tô cao cấp là mẫu gối tựa lưng của chúng tôi được thiết kế theo đúng tiêu chuẩn thân hình của người châu Á, với chất liệu cao su hiện đại đàn hồi chậm mới xuất hiện tại Việt Nam qua tên gọi "cao su non" và vỏ vải dày gấp 3 lần bình thường, không nhăn, không phai màu khi giặt sẽ giúp lưng bạn luôn thẳng, không những bảo vệ sức khỏe và vóc dáng còn làm cho hình ảnh làm việc của bạn thêm nghiêm túc và chuyên nghiệp trong mắt đồng nghiệp.
Gối tựa lưng bằng cao su non với lớp vải bao bên ngoài là loại vải thoáng khí, không xù lông, khô nhanh chóng. Bên trong gối là cao su non có các đặc tính êm ái, nhẹ, mềm mại như đệm hơi, đặc biệt là khả năng thoáng khí tốt nhờ hàng ngàn khoang rỗng nhỏ li ti giúp không khí có thể lưu thông dễ dàng.
Với chất liệu tốt, không gây độc hại, rất thân thiện với môi trường, vô cùng êm ái luôn đảm bảo an toàn cho sức khoẻ của bạn khi dùng. Sản phẩm– gối tựa cổ xe ô tô được đánh giá là sản phẩm tiện ích, hữu dụng & phù hợp với từng nội thất với các loại xe khác nhau.

Sở hữu chiếc gối tựa đầu ô tô, gối tựa cổ xe ô tô, gối tựa đầu xe hơi trên đây sẽ luôn là lựa chọn tối ưu nhất của bạn, dành cho bạn sự tập trung cao độ, độ thoải mái dễ chịu nhất khi cầm lái.
- Với phương châm “Sự hài lòng của quý khách là thành công của chúng tôi”, Chúng tôi luôn luôn lắng nghe và sẵn sàng tiếp thu mọi ý kiến góp ý của quý khách hàng; không ngừng cải tiến, nghiên cứu và ứng dụng các công nghệ mới vào sản xuất để ngày càng hoàn thiện hơn các dòng sản phẩm chính, nâng cao tính năng và giảm giá thành sản xuất, mang lại cho khách hàng nhiều sự lựa chọn với giá cả hợp lý nhất.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'1', 1, CAST(N'2021-05-23T12:37:51.870' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (4, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI3', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:37:57.910' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (5, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI4', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:38:08.330' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (6, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI5', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:38:22.833' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (7, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI6', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:38:24.787' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (8, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI7', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:38:25.837' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (9, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI8', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:38:29.343' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (10, NULL, 100000.0000, NULL, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI9', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.
Chất liệu bằng Polyester nhồi bông cao cấp siêu êm
Họa tiết các nhân vật như: Batman, America Captain, Deadpool, người sói, người nhện,...
Gối tựa đầu tựa lưng Marvel không những làm giảm các cơn đau mỏi lưng và cổ khi ngồi lái xe còn giúp nội thất xe trở nên nổi bật cá tính và trẻ trung nói lên phong cách của chủ xe.
#tualungoto, #tualungxehoi, #goituaoto , #tuadauoto, #tuadauxehoi, #tualungxeoto, #goitualungxeoto, #goituadauxeoto, #tuajdau, #tualung, #goiomx', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:07.103' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (11, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI10', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:46.900' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (12, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI11', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:49.077' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (13, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI12', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:50.450' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (14, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI13', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:51.730' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (15, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI14', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:53.487' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (16, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI15', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:54.930' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (21, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI12', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:50.450' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (22, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI13', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:51.730' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (23, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI14', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:53.487' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (24, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI15', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:54.930' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (25, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI12', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:50.450' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (26, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI13', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:51.730' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (27, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI14', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:53.487' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PRODUCTS] ([ID], [CODE], [ORIGIN_PRICE], [SALE], [STATUS], [NAME], [DESCRIPTION], [img1], [img2], [img3], [img4], [img5], [CATEGORY_ID], [COMPANY_ID], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED_AT], [UPDATED_AT]) VALUES (28, N'SP1                                                                                                 ', 100000.0000, 11, NULL, N'GỐI TỰA ĐẦU TỰA LƯNG Ô TÔ CAO SU NON SI15', N'Bộ gối tựa đầu tựa lưng ô tô họa tiết các nhân vật trong biệt đội siêu anh hùng vũ trụ DC cực chất cực cá tính mang lại phong cách trẻ trung cho chiếc xe của bạn.', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', N'https://cf.shopee.vn/file/0aa8f3948278819bd7f533acc410843e&quot', NULL, NULL, CAST(N'2021-05-23T12:39:54.930' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([ID], [USERNAME], [PASSWORD], [NAME], [GENDER], [EMAIL], [DATE_OF_BIRTH], [ADDRESS], [PHONE_NUMBER], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [ROLE_ID], [UPDATED_AT]) VALUES (1, N'hung                                              ', N'$argon2i$v=19$m=4096,t=3,p=1$00GPMHX9TB9UMylhaljkrg$27EvlknpEkP3Vz9Xm4SqHly99sFjkbEm/cm6tuh5CuI     ', N'Nguyễn Doãn Hưng', N'Nam', N'hungnd72@wru.vn                                   ', CAST(N'1999-01-15' AS Date), N'công ty cổ phần Woodsland Lô 49 KCN - Mê Linh - Hà Nội, Thị Trấn Chi Đông, Huyện Mê Linh, Hà Nộ', N'0387825465     ', CAST(N'2021-05-25T21:16:34.873' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASSWORD], [NAME], [GENDER], [EMAIL], [DATE_OF_BIRTH], [ADDRESS], [PHONE_NUMBER], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [ROLE_ID], [UPDATED_AT]) VALUES (2, N'ádassadas                                         ', N'$argon2i$v=19$m=4096,t=3,p=1$+B21aYJmm0eisNvDca+tpA$KopfeyFtTraIJdluZnVSVac2WoNI8FQW1QOfyyAotd4     ', NULL, NULL, N'hungnd722@wru.vn                                  ', NULL, NULL, NULL, CAST(N'2021-05-25T21:35:35.780' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASSWORD], [NAME], [GENDER], [EMAIL], [DATE_OF_BIRTH], [ADDRESS], [PHONE_NUMBER], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [ROLE_ID], [UPDATED_AT]) VALUES (3, N'dsad                                              ', N'$argon2i$v=19$m=4096,t=3,p=1$nsdI/Avxa2ETtqhflAXunA$K2eBohWUH3r6PAFhpxPXotWyklRoEIo9NCSsmIP1KgY     ', NULL, NULL, N'hungnsada@wru.vn                                  ', NULL, NULL, NULL, CAST(N'2021-05-25T21:36:19.887' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASSWORD], [NAME], [GENDER], [EMAIL], [DATE_OF_BIRTH], [ADDRESS], [PHONE_NUMBER], [CREATED_AT], [CREATED_BY], [MODIFY_BY], [DELETED], [ROLE_ID], [UPDATED_AT]) VALUES (4, N'hung                                              ', N'$argon2i$v=19$m=4096,t=3,p=1$zmfJEl3wVy+3LZQaNHdfOQ$dgdyhjVpmI7fjFc+1uJnjbFyTp+13ZijX1Vix+ZJKNM     ', NULL, NULL, N'21T0027@gmail.com                                 ', NULL, NULL, NULL, CAST(N'2021-05-25T21:49:25.557' AS DateTime), NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[CART] ADD  CONSTRAINT [DF__CART__CREATED_AT__693CA210]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[CATEGORY] ADD  CONSTRAINT [DF__CATEGORY__CREATE__3E52440B]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[COMMENT] ADD  CONSTRAINT [DF__COMMENT__CREATED__59063A47]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[COMPANY] ADD  CONSTRAINT [DF_COMPANY_ACTIVE]  DEFAULT ((1)) FOR [ACTIVE]
GO
ALTER TABLE [dbo].[COMPANY] ADD  CONSTRAINT [DF__COMPANY__CREATED__3A81B327]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[DELIVERY_METHOD] ADD  CONSTRAINT [DF__DELIVERY___CREAT__5535A963]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[ORDER] ADD  CONSTRAINT [DF__ODER__CREATED_AT__4222D4EF]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[ORDER_DETAIL] ADD  CONSTRAINT [DF__ORDER_DET__CREAT__45F365D3]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[ORDER_PROGRESS] ADD  CONSTRAINT [DF__ORDER_PRO__CREAT__4D94879B]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[PAYMENT_MEDTHOD] ADD  CONSTRAINT [DF__PAYMENT_M__CREAT__49C3F6B7]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[PRODUCTS] ADD  CONSTRAINT [DF__PRODUCTS__CREATE__36B12243]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[ROLE] ADD  CONSTRAINT [DF_ROLE_CREATED_AT]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[SLIDES] ADD  CONSTRAINT [DF__SLIDES__CREATED___5165187F]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF__USERS__CREATED_A__5EBF139D]  DEFAULT (getdate()) FOR [CREATED_AT]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_ROLE_ID]  DEFAULT ((1)) FOR [ROLE_ID]
GO
USE [master]
GO
ALTER DATABASE [Project@2021] SET  READ_WRITE 
GO

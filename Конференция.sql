USE [master]
GO

/****** Object:  Database [Конференция]    Script Date: 10.09.2019 8:44:44 ******/
CREATE DATABASE [Конференция]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Конференция', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Конференция.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Конференция_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Конференция_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Конференция] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Конференция].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Конференция] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Конференция] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Конференция] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Конференция] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Конференция] SET ARITHABORT OFF 
GO

ALTER DATABASE [Конференция] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Конференция] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Конференция] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Конференция] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Конференция] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Конференция] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Конференция] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Конференция] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Конференция] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Конференция] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Конференция] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Конференция] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Конференция] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Конференция] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Конференция] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Конференция] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Конференция] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Конференция] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Конференция] SET RECOVERY FULL 
GO

ALTER DATABASE [Конференция] SET  MULTI_USER 
GO

ALTER DATABASE [Конференция] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Конференция] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Конференция] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Конференция] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Конференция] SET  READ_WRITE 
GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Город конференции]    Script Date: 10.09.2019 8:46:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Город конференции](
	[id города] [int] IDENTITY(1,1) NOT NULL,
	[Улица] [nchar](30) NOT NULL,
	[Номер дома] [int] NOT NULL,
	[Название города] [nchar](30) NOT NULL,
	[id страны] [int] NOT NULL,
 CONSTRAINT [PK_Город] PRIMARY KEY CLUSTERED 
(
	[id города] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Город конференции]  WITH CHECK ADD  CONSTRAINT [FK_Город конференции_Страна конференции] FOREIGN KEY([id страны])
REFERENCES [dbo].[Страна конференции] ([id страны])
GO

ALTER TABLE [dbo].[Город конференции] CHECK CONSTRAINT [FK_Город конференции_Страна конференции]
GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Город людей]    Script Date: 10.09.2019 8:46:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Город людей](
	[id города людей] [int] IDENTITY(1,1) NOT NULL,
	[id страны людей] [int] NOT NULL,
	[Улица] [nchar](30) NOT NULL,
	[Номер дома] [int] NOT NULL,
	[Название города] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Город людей] PRIMARY KEY CLUSTERED 
(
	[id города людей] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Город людей]  WITH CHECK ADD  CONSTRAINT [FK_Город людей_Страна людей] FOREIGN KEY([id страны людей])
REFERENCES [dbo].[Страна людей] ([id страны людей])
GO

ALTER TABLE [dbo].[Город людей] CHECK CONSTRAINT [FK_Город людей_Страна людей]
GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Заседания]    Script Date: 10.09.2019 8:46:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Заседания](
	[id заседания] [int] IDENTITY(1,1) NOT NULL,
	[Дата] [date] NOT NULL,
	[Тема] [nchar](30) NOT NULL,
	[Номер аудитории] [int] NOT NULL,
	[id секции] [int] NOT NULL,
	[id людей] [int] NOT NULL,
 CONSTRAINT [PK_Заседания] PRIMARY KEY CLUSTERED 
(
	[id заседания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Заседания]  WITH CHECK ADD  CONSTRAINT [FK_Заседания_Люди] FOREIGN KEY([id людей])
REFERENCES [dbo].[Люди] ([id людей])
GO

ALTER TABLE [dbo].[Заседания] CHECK CONSTRAINT [FK_Заседания_Люди]
GO

ALTER TABLE [dbo].[Заседания]  WITH CHECK ADD  CONSTRAINT [FK_Заседания_Секция] FOREIGN KEY([id секции])
REFERENCES [dbo].[Секция] ([id секции])
GO

ALTER TABLE [dbo].[Заседания] CHECK CONSTRAINT [FK_Заседания_Секция]
GO


USE [Конференция]
GO

/****** Object:  Table [dbo].[Конференция]    Script Date: 10.09.2019 8:47:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Конференция](
	[id конференции] [int] IDENTITY(1,1) NOT NULL,
	[Аудитория] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[id города] [int] NOT NULL,
 CONSTRAINT [PK_Конференция] PRIMARY KEY CLUSTERED 
(
	[id конференции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Конференция]  WITH CHECK ADD  CONSTRAINT [FK_Конференция_Город конференции] FOREIGN KEY([id города])
REFERENCES [dbo].[Город конференции] ([id города])
GO

ALTER TABLE [dbo].[Конференция] CHECK CONSTRAINT [FK_Конференция_Город конференции]
GO

ALTER TABLE [dbo].[Конференция]  WITH CHECK ADD  CONSTRAINT [CK_Конференция] CHECK  (([Аудитория]>=(0)))
GO

ALTER TABLE [dbo].[Конференция] CHECK CONSTRAINT [CK_Конференция]
GO

ALTER TABLE [dbo].[Конференция]  WITH CHECK ADD  CONSTRAINT [CK_Конференция_1] CHECK  (([id города]>=(0)))
GO

ALTER TABLE [dbo].[Конференция] CHECK CONSTRAINT [CK_Конференция_1]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id города' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Конференция', @level2type=N'CONSTRAINT',@level2name=N'CK_Конференция_1'
GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Люди]    Script Date: 10.09.2019 8:47:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Люди](
	[id людей] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nchar](30) NOT NULL,
	[Имя] [nchar](30) NOT NULL,
	[Отчество] [nchar](30) NOT NULL,
	[Возраст] [int] NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[id научной степени] [int] NOT NULL,
	[id города людей] [int] NOT NULL,
 CONSTRAINT [PK_Люди] PRIMARY KEY CLUSTERED 
(
	[id людей] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Люди]  WITH CHECK ADD  CONSTRAINT [FK_Люди_Город людей] FOREIGN KEY([id города людей])
REFERENCES [dbo].[Город людей] ([id города людей])
GO

ALTER TABLE [dbo].[Люди] CHECK CONSTRAINT [FK_Люди_Город людей]
GO

ALTER TABLE [dbo].[Люди]  WITH CHECK ADD  CONSTRAINT [FK_Люди_Научная степень] FOREIGN KEY([id научной степени])
REFERENCES [dbo].[Научная степень] ([id научной степени])
GO

ALTER TABLE [dbo].[Люди] CHECK CONSTRAINT [FK_Люди_Научная степень]
GO

ALTER TABLE [dbo].[Люди]  WITH CHECK ADD  CONSTRAINT [CK_Люди] CHECK  (([Возраст]<=(180)))
GO

ALTER TABLE [dbo].[Люди] CHECK CONSTRAINT [CK_Люди]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'возраст' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Люди', @level2type=N'CONSTRAINT',@level2name=N'CK_Люди'
GO


USE [Конференция]
GO

/****** Object:  Table [dbo].[Место]    Script Date: 10.09.2019 8:47:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Место](
	[id места] [int] NOT NULL,
	[Название места] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Место] PRIMARY KEY CLUSTERED 
(
	[id места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Научная степень]    Script Date: 10.09.2019 8:47:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Научная степень](
	[id научной степени] [int] IDENTITY(1,1) NOT NULL,
	[Название научной стеени] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Научная степень] PRIMARY KEY CLUSTERED 
(
	[id научной степени] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Секция]    Script Date: 10.09.2019 8:48:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Секция](
	[id секции] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[id места] [int] NOT NULL,
	[id конференции] [int] NULL,
 CONSTRAINT [PK_Секция] PRIMARY KEY CLUSTERED 
(
	[id секции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Секция]  WITH CHECK ADD  CONSTRAINT [FK_Секция_Конференция] FOREIGN KEY([id конференции])
REFERENCES [dbo].[Конференция] ([id конференции])
GO

ALTER TABLE [dbo].[Секция] CHECK CONSTRAINT [FK_Секция_Конференция]
GO

ALTER TABLE [dbo].[Секция]  WITH CHECK ADD  CONSTRAINT [FK_Секция_Место] FOREIGN KEY([id места])
REFERENCES [dbo].[Место] ([id места])
GO

ALTER TABLE [dbo].[Секция] CHECK CONSTRAINT [FK_Секция_Место]
GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Страна конференции]    Script Date: 10.09.2019 8:48:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Страна конференции](
	[id страны] [int] NOT NULL,
	[Название страны] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Страна конференции] PRIMARY KEY CLUSTERED 
(
	[id страны] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Конференция]
GO

/****** Object:  Table [dbo].[Страна людей]    Script Date: 10.09.2019 8:48:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Страна людей](
	[id страны людей] [int] NOT NULL,
	[Название страны людей] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Страна людей] PRIMARY KEY CLUSTERED 
(
	[id страны людей] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


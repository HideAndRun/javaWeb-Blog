
/****** Object:  Database [ZQCBlog]    Script Date: 07/04/2015 15:08:38 ******/
CREATE DATABASE [ZQCBlog] ON  PRIMARY 
( NAME = N'db_mediaBlog_Data', FILENAME = N'D:\SQL server 2008\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_mediaBlog_Data.MDF' , SIZE = 2176KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_mediaBlog_Log', FILENAME = N'D:\SQL server 2008\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_mediaBlog_Log.LDF' , SIZE = 1280KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [ZQCBlog] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZQCBlog].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ZQCBlog] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ZQCBlog] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ZQCBlog] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ZQCBlog] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ZQCBlog] SET ARITHABORT OFF
GO
ALTER DATABASE [ZQCBlog] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ZQCBlog] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ZQCBlog] SET AUTO_SHRINK ON
GO
ALTER DATABASE [ZQCBlog] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ZQCBlog] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ZQCBlog] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ZQCBlog] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ZQCBlog] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ZQCBlog] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ZQCBlog] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ZQCBlog] SET  DISABLE_BROKER
GO
ALTER DATABASE [ZQCBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ZQCBlog] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ZQCBlog] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ZQCBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ZQCBlog] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ZQCBlog] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ZQCBlog] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ZQCBlog] SET  READ_WRITE
GO
ALTER DATABASE [ZQCBlog] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ZQCBlog] SET  MULTI_USER
GO
ALTER DATABASE [ZQCBlog] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [ZQCBlog] SET DB_CHAINING OFF
GO
USE [ZQCBlog]
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[user_pswd] [varchar](20) NULL,
	[user_ico] [varchar](50) NULL,
	[user_motto] [varchar](50) NULL,
	[user_sex] [varchar](2) NULL,
	[user_oicq] [varchar](15) NULL,
	[user_email] [varchar](100) NULL,
	[user_from] [varchar](100) NULL,
	[user_blogName] [varchar](100) NULL,
	[user_ctTime] [datetime] NULL,
	[user_hitNum] [int] NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_photo]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo_whoId] [int] NULL,
	[photo_src] [varchar](200) NULL,
	[photo_info] [varchar](1000) NULL,
	[photo_uptime] [datetime] NULL,
 CONSTRAINT [PK_tb_photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_word]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_word](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[word_whoId] [int] NULL,
	[word_content] [varchar](2000) NULL,
	[word_author] [varchar](50) NULL,
	[word_time] [datetime] NULL,
 CONSTRAINT [PK_tb_word] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_article]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[art_whoId] [int] NULL,
	[art_title] [varchar](50) NULL,
	[art_content] [ntext] NULL,
	[art_pubTime] [datetime] NULL,
	[art_count] [int] NULL,
 CONSTRAINT [PK_tb_article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_media]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_media](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[media_whoId] [int] NULL,
	[media_title] [varchar](100) NULL,
	[media_src] [varchar](100) NULL,
	[media_pic] [varchar](100) NULL,
	[media_info] [varchar](400) NULL,
	[media_uptime] [datetime] NULL,
	[media_lookCount] [int] NULL,
 CONSTRAINT [PK_tb_media] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_link]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_whoId] [int] NULL,
	[link_title] [varchar](100) NULL,
	[link_src] [varchar](200) NULL,
	[link_time] [datetime] NULL,
 CONSTRAINT [PK_tb_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_friend]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_friend](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[friend_whoId] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_tb_friend] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_elect]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_elect](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[elect_whoId] [int] NULL,
	[elect_title] [varchar](100) NULL,
	[elect_src] [varchar](300) NULL,
	[elect_time] [datetime] NULL,
 CONSTRAINT [PK_tb_elect] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_articleR]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_articleR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[artReview_rootId] [int] NULL,
	[artReview_author] [varchar](50) NULL,
	[artReview_content] [varchar](2000) NULL,
	[artReview_time] [datetime] NULL,
 CONSTRAINT [PK_tb_artReview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_mediaR]    Script Date: 07/04/2015 15:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_mediaR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mediaR_rootId] [int] NULL,
	[mediaR_author] [varchar](50) NULL,
	[mediaR_content] [ntext] NULL,
	[mediaR_time] [datetime] NULL,
 CONSTRAINT [PK_tb_mediaR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_tb_user_user_ico]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_user] ADD  CONSTRAINT [DF_tb_user_user_ico]  DEFAULT ('myNull.jpg') FOR [user_ico]
GO
/****** Object:  Default [DF_tb_user_user_hitNum]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_user] ADD  CONSTRAINT [DF_tb_user_user_hitNum]  DEFAULT (0) FOR [user_hitNum]
GO
/****** Object:  Default [DF_tb_article_art_count]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_article] ADD  CONSTRAINT [DF_tb_article_art_count]  DEFAULT (0) FOR [art_count]
GO
/****** Object:  Default [DF_tb_media_media_pic]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_media] ADD  CONSTRAINT [DF_tb_media_media_pic]  DEFAULT ('null.jpg') FOR [media_pic]
GO
/****** Object:  Default [DF_tb_media_media_info]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_media] ADD  CONSTRAINT [DF_tb_media_media_info]  DEFAULT ('没有视频预览') FOR [media_info]
GO
/****** Object:  Default [DF_tb_media_media_lookCount]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_media] ADD  CONSTRAINT [DF_tb_media_media_lookCount]  DEFAULT (0) FOR [media_lookCount]
GO
/****** Object:  ForeignKey [FK_tb_photo_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_photo]  WITH CHECK ADD  CONSTRAINT [FK_tb_photo_tb_user] FOREIGN KEY([photo_whoId])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_photo] CHECK CONSTRAINT [FK_tb_photo_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_word_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_word]  WITH CHECK ADD  CONSTRAINT [FK_tb_word_tb_user] FOREIGN KEY([word_whoId])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_word] CHECK CONSTRAINT [FK_tb_word_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_article_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_article]  WITH CHECK ADD  CONSTRAINT [FK_tb_article_tb_user] FOREIGN KEY([art_whoId])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_article] CHECK CONSTRAINT [FK_tb_article_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_media_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_media]  WITH CHECK ADD  CONSTRAINT [FK_tb_media_tb_user] FOREIGN KEY([media_whoId])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_media] CHECK CONSTRAINT [FK_tb_media_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_link_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_link]  WITH CHECK ADD  CONSTRAINT [FK_tb_link_tb_user] FOREIGN KEY([link_whoId])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_link] CHECK CONSTRAINT [FK_tb_link_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_friend_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_friend]  WITH CHECK ADD  CONSTRAINT [FK_tb_friend_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tb_friend] CHECK CONSTRAINT [FK_tb_friend_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_elect_tb_user]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_elect]  WITH CHECK ADD  CONSTRAINT [FK_tb_elect_tb_user] FOREIGN KEY([elect_whoId])
REFERENCES [dbo].[tb_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_elect] CHECK CONSTRAINT [FK_tb_elect_tb_user]
GO
/****** Object:  ForeignKey [FK_tb_articleR_tb_article]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_articleR]  WITH CHECK ADD  CONSTRAINT [FK_tb_articleR_tb_article] FOREIGN KEY([artReview_rootId])
REFERENCES [dbo].[tb_article] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_articleR] CHECK CONSTRAINT [FK_tb_articleR_tb_article]
GO
/****** Object:  ForeignKey [FK_tb_mediaR_tb_media]    Script Date: 07/04/2015 15:08:38 ******/
ALTER TABLE [dbo].[tb_mediaR]  WITH CHECK ADD  CONSTRAINT [FK_tb_mediaR_tb_media] FOREIGN KEY([mediaR_rootId])
REFERENCES [dbo].[tb_media] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_mediaR] CHECK CONSTRAINT [FK_tb_mediaR_tb_media]
GO

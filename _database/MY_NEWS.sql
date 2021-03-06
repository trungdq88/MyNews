CREATE DATABASE [MY_NEWS]
GO
USE [MY_NEWS]
GO
/****** Object:  Table [dbo].[Source]    Script Date: 06/17/2013 09:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source](
	[SourceId] [int] NOT NULL,
	[SourceName] [nchar](255) NULL,
	[SourceHomepage] [nchar](255) NULL,
	[SourceLogo] [nchar](255) NULL,
 CONSTRAINT [PK_Source] PRIMARY KEY CLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06/17/2013 09:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rsslink]    Script Date: 06/17/2013 09:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rsslink](
	[RsslinkId] [int] NOT NULL,
	[RsslinkUrl] [nchar](255) NULL,
	[SourceId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Rsslink] PRIMARY KEY CLUSTERED 
(
	[RsslinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Rsslink] UNIQUE NONCLUSTERED 
(
	[CategoryId] ASC,
	[RsslinkId] ASC,
	[SourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 06/17/2013 09:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] NOT NULL,
	[RsslinkId] [int] NULL,
	[ItemTitle] [nchar](255) NULL,
	[ItemDescription] [ntext] NULL,
	[ItemLink] [nchar](255) NULL,
	[ItemDate] [nchar](50) NULL,
	[ItemThumbnail] [nchar](255) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Select]    Script Date: 06/17/2013 09:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Select](
	[UserId] [int] NOT NULL,
	[RsslinkId] [int] NOT NULL,
 CONSTRAINT [PK_User_Select] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RsslinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_item_Rsslink]    Script Date: 06/17/2013 09:57:52 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_item_Rsslink] FOREIGN KEY([RsslinkId])
REFERENCES [dbo].[Rsslink] ([RsslinkId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_item_Rsslink]
GO
/****** Object:  ForeignKey [FK_Rsslink_Category]    Script Date: 06/17/2013 09:57:52 ******/
ALTER TABLE [dbo].[Rsslink]  WITH CHECK ADD  CONSTRAINT [FK_Rsslink_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Rsslink] CHECK CONSTRAINT [FK_Rsslink_Category]
GO
/****** Object:  ForeignKey [FK_Rsslink_Source]    Script Date: 06/17/2013 09:57:52 ******/
ALTER TABLE [dbo].[Rsslink]  WITH CHECK ADD  CONSTRAINT [FK_Rsslink_Source] FOREIGN KEY([SourceId])
REFERENCES [dbo].[Source] ([SourceId])
GO
ALTER TABLE [dbo].[Rsslink] CHECK CONSTRAINT [FK_Rsslink_Source]
GO
/****** Object:  ForeignKey [FK_User_Select_Rsslink]    Script Date: 06/17/2013 09:57:52 ******/
ALTER TABLE [dbo].[User_Select]  WITH CHECK ADD  CONSTRAINT [FK_User_Select_Rsslink] FOREIGN KEY([RsslinkId])
REFERENCES [dbo].[Rsslink] ([RsslinkId])
GO
ALTER TABLE [dbo].[User_Select] CHECK CONSTRAINT [FK_User_Select_Rsslink]
GO

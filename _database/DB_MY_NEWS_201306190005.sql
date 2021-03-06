CREATE DATABASE MY_NEWS
GO

USE [MY_NEWS]
GO
/****** Object:  Table [dbo].[Source]    Script Date: 06/19/2013 00:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source](
	[SourceId] [int] IDENTITY(1,1) NOT NULL,
	[SourceName] [nvarchar](255) NULL,
	[SourceHomepage] [nvarchar](255) NULL,
	[SourceLogo] [nvarchar](255) NULL,
 CONSTRAINT [PK_Source] PRIMARY KEY CLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Source] UNIQUE NONCLUSTERED 
(
	[SourceName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Source_1] UNIQUE NONCLUSTERED 
(
	[SourceHomepage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06/19/2013 00:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UX_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 06/19/2013 00:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[RsslinkId] [int] NULL,
	[ItemTitle] [nvarchar](255) NULL,
	[ItemDescription] [ntext] NULL,
	[ItemLink] [nvarchar](255) NULL,
	[ItemDate] [datetime] NULL,
	[ItemThumbnail] [nvarchar](255) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Select]    Script Date: 06/19/2013 00:05:44 ******/
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
/****** Object:  Table [dbo].[Rsslink]    Script Date: 06/19/2013 00:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rsslink](
	[RsslinkId] [int] IDENTITY(1,1) NOT NULL,
	[RsslinkUrl] [nvarchar](255) NULL,
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Rsslink_1] UNIQUE NONCLUSTERED 
(
	[RsslinkUrl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_item_Rsslink]    Script Date: 06/19/2013 00:05:44 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_item_Rsslink] FOREIGN KEY([RsslinkId])
REFERENCES [dbo].[Rsslink] ([RsslinkId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_item_Rsslink]
GO
/****** Object:  ForeignKey [FK_Rsslink_Category]    Script Date: 06/19/2013 00:05:44 ******/
ALTER TABLE [dbo].[Rsslink]  WITH CHECK ADD  CONSTRAINT [FK_Rsslink_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Rsslink] CHECK CONSTRAINT [FK_Rsslink_Category]
GO
/****** Object:  ForeignKey [FK_Rsslink_Source]    Script Date: 06/19/2013 00:05:44 ******/
ALTER TABLE [dbo].[Rsslink]  WITH CHECK ADD  CONSTRAINT [FK_Rsslink_Source] FOREIGN KEY([SourceId])
REFERENCES [dbo].[Source] ([SourceId])
GO
ALTER TABLE [dbo].[Rsslink] CHECK CONSTRAINT [FK_Rsslink_Source]
GO
/****** Object:  ForeignKey [FK_User_Select_Rsslink]    Script Date: 06/19/2013 00:05:44 ******/
ALTER TABLE [dbo].[User_Select]  WITH CHECK ADD  CONSTRAINT [FK_User_Select_Rsslink] FOREIGN KEY([RsslinkId])
REFERENCES [dbo].[Rsslink] ([RsslinkId])
GO
ALTER TABLE [dbo].[User_Select] CHECK CONSTRAINT [FK_User_Select_Rsslink]
GO

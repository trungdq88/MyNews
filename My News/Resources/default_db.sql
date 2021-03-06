USE MASTER
GO
IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='MY_NEWS')
DROP DATABASE MY_NEWS
GO
CREATE DATABASE MY_NEWS
GO
USE [MY_NEWS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06/20/2013 16:37:55 ******/
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
SET IDENTITY_INSERT [Category] ON
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (16, N'Âm Nhạc')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (1, N'Công Nghệ')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (9, N'Giải Trí')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (5, N'Giáo Dục')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (7, N'Kinh Doanh')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (6, N'Nhân Đạo')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (11, N'Nhịp Sống Trẻ')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (14, N'Ô tô - Xe máy')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (10, N'Pháp Luật')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (15, N'Phim Ảnh')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (13, N'Sức Khỏe')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (3, N'Thế Giới')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (4, N'Thể Thao')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (12, N'Tình Yêu - Giới Tính')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (8, N'Văn Hóa')
INSERT [Category] ([CategoryId], [CategoryName]) VALUES (2, N'Xã Hội')
SET IDENTITY_INSERT [Category] OFF
/****** Object:  Table [dbo].[User_Select]    Script Date: 06/20/2013 16:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Select](
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SourceId] [int] NOT NULL,
 CONSTRAINT [PK_User_Select_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[CategoryId] ASC,
	[SourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [User_Select] ([UserId], [CategoryId], [SourceId]) VALUES (0, 1, 7)
INSERT [User_Select] ([UserId], [CategoryId], [SourceId]) VALUES (0, 2, 3)
INSERT [User_Select] ([UserId], [CategoryId], [SourceId]) VALUES (0, 4, 8)
INSERT [User_Select] ([UserId], [CategoryId], [SourceId]) VALUES (0, 9, 2)
/****** Object:  Table [dbo].[Source]    Script Date: 06/20/2013 16:37:55 ******/
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
SET IDENTITY_INSERT [Source] ON
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (1, N'Tinh Tế', N'http://www.tinhte.vn/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (2, N'Dân Trí', N'http://dantri.com.vn/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (3, N'VnExpress', N'http://www.vnexpress.net/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (4, N'VOZ', N'http://www.voz.vn/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (5, N'Thế Giới Vi TÍnh', N'http://www.pcworld.com.vn/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (6, N'Thông Tin Công Nghệ', N'http://www.thongtincongnghe.com/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (7, N'ICT News', N'http://www.ictnews.vn/', N'')
INSERT [Source] ([SourceId], [SourceName], [SourceHomepage], [SourceLogo]) VALUES (8, N'Zing News', N'http://www.news.zing.vn/', N'')
SET IDENTITY_INSERT [Source] OFF
/****** Object:  Table [dbo].[Rsslink]    Script Date: 06/20/2013 16:37:55 ******/
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
SET IDENTITY_INSERT [Rsslink] ON
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (1, N'http://www.tinhte.vn/rss', 1, 1)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (2, N'http://dantri.com.vn/cong-nghe.rss', 2, 1)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (3, N'http://sohoa.vnexpress.net/rss/trang-chu', 3, 1)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (7, N'http://ictnews.vn/home/Handlers/RssHandler.ashx?ChannelID=42', 7, 1)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (8, N'http://news.zing.vn/rss/cong-nghe.html', 8, 1)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (9, N'http://dantri.com.vn/xa-hoi.rss', 2, 2)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (10, N'http://vnexpress.net/rss/gl/xa-hoi.rss', 3, 2)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (11, N'http://news.zing.vn/rss/doi-song.html', 8, 2)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (12, N'http://news.zing.vn/rss/the-gioi.html', 8, 3)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (13, N'http://dantri.com.vn/Thegioi.rss', 2, 3)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (14, N'http://vnexpress.net/rss/gl/the-gioi.rss', 3, 3)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (15, N'http://thethao.vnexpress.net/rss/bong-da.rss', 3, 4)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (16, N'http://dantri.com.vn/The-Thao.rss', 2, 4)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (17, N'http://news.zing.vn/rss/the-thao.html', 8, 4)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (18, N'http://dantri.com.vn/giaoduc-khuyenhoc.rss', 2, 5)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (19, N'http://dantri.com.vn/tamlongnhanai.rss', 2, 6)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (20, N'http://dantri.com.vn/kinhdoanh.rss', 2, 7)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (21, N'http://vnexpress.net/rss/gl/kinh-doanh.rss', 3, 7)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (22, N'http://news.zing.vn/rss/kinh-doanh.html', 8, 7)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (23, N'http://dantri.com.vn/van-hoa.rss', 2, 8)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (24, N'http://dantri.com.vn/giaitri.rss', 2, 9)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (25, N'http://giaitri.vnexpress.net/rss/phim.rss', 3, 9)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (26, N'http://dantri.com.vn/skphapluat.rss', 2, 10)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (27, N'http://vnexpress.net/rss/gl/phap-luat.rss', 3, 10)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (28, N'http://dantri.com.vn/nhipsongtre.rss', 2, 11)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (29, N'http://news.zing.vn/rss/nhip-song-tre.html', 8, 11)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (30, N'http://dantri.com.vn/tinhyeu-gioitinh.rss', 2, 12)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (31, N'http://giadinh.vnexpress.net/rss/song-khoe.rss', 3, 12)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (32, N'http://dantri.com.vn/suckhoe.rss', 2, 13)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (33, N'http://dantri.com.vn/otoxemay.rss', 2, 14)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (34, N'http://vnexpress.net/rss/gl/oto-xe-may.rss', 3, 14)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (35, N'http://news.zing.vn/rss/oto-xe-may.html', 8, 14)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (36, N'http://dantri.com.vn/giao-duc.rss', 2, 5)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (37, N'http://news.zing.vn/rss/phim-anh.html', 8, 15)
INSERT [Rsslink] ([RsslinkId], [RsslinkUrl], [SourceId], [CategoryId]) VALUES (38, N'http://news.zing.vn/rss/am-nhac.html', 8, 16)
SET IDENTITY_INSERT [Rsslink] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 06/20/2013 16:37:55 ******/
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
/****** Object:  ForeignKey [FK_item_Rsslink]    Script Date: 06/20/2013 16:37:55 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_item_Rsslink] FOREIGN KEY([RsslinkId])
REFERENCES [dbo].[Rsslink] ([RsslinkId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_item_Rsslink]
GO
/****** Object:  ForeignKey [FK_Rsslink_Category]    Script Date: 06/20/2013 16:37:55 ******/
ALTER TABLE [dbo].[Rsslink]  WITH CHECK ADD  CONSTRAINT [FK_Rsslink_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rsslink] CHECK CONSTRAINT [FK_Rsslink_Category]
GO
/****** Object:  ForeignKey [FK_Rsslink_Source]    Script Date: 06/20/2013 16:37:55 ******/
ALTER TABLE [dbo].[Rsslink]  WITH CHECK ADD  CONSTRAINT [FK_Rsslink_Source] FOREIGN KEY([SourceId])
REFERENCES [dbo].[Source] ([SourceId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rsslink] CHECK CONSTRAINT [FK_Rsslink_Source]
GO

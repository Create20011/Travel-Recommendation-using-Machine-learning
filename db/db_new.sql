USE [master]
GO
/****** Object:  Database [tour_recommandation_neww]    Script Date: 12-04-2022 10:54:00 ******/
CREATE DATABASE [tour_recommandation_neww]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tour_recommandation_neww', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\tour_recommandation_neww.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tour_recommandation_neww_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\tour_recommandation_neww_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tour_recommandation_neww] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tour_recommandation_neww].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tour_recommandation_neww] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET ARITHABORT OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [tour_recommandation_neww] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tour_recommandation_neww] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tour_recommandation_neww] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tour_recommandation_neww] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tour_recommandation_neww] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tour_recommandation_neww] SET  MULTI_USER 
GO
ALTER DATABASE [tour_recommandation_neww] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tour_recommandation_neww] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tour_recommandation_neww] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tour_recommandation_neww] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [tour_recommandation_neww]
GO
/****** Object:  Table [dbo].[admin_Master]    Script Date: 12-04-2022 10:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review_Master]    Script Date: 12-04-2022 10:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tour_id] [int] NULL,
	[User_Id] [int] NULL,
	[Review] [nvarchar](max) NULL,
	[Ratings] [int] NULL,
	[Sentiment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour_Master]    Script Date: 12-04-2022 10:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tour_name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[Discription] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Doc] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour_Register_Master]    Script Date: 12-04-2022 10:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_Register_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [nvarchar](50) NULL,
	[Tid] [nvarchar](50) NULL,
	[Date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 12-04-2022 10:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin_Master] ON 

INSERT [dbo].[admin_Master] ([ID], [Username], [Password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin_Master] OFF
SET IDENTITY_INSERT [dbo].[Review_Master] ON 

INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (1, 1, 1, N'Best Trip of the year', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (2, 1, 2, N'Best in tis price range', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (3, 1, 3, N'Good Trip to find pease and relax', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (4, 1, 4, N'Nice Place', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (5, 1, 5, N'The staff in tis trip was very carrying and funny', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (6, 2, 1, N'Pink city was the best part of the trip', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (7, 2, 2, N'Rajasthan trip was awesome ', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (8, 2, 3, N'Loved it', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (9, 2, 4, N'Pink city was awesome', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (10, 2, 5, N'Rajasthani people rocks', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (11, 3, 1, N'Himachal is full of adventures', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (12, 3, 2, N'will go again over this place', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (13, 3, 3, N'Best trek ever', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (14, 3, 4, N'felt i m at the top of the world', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (15, 3, 5, N'awesome trip', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (16, 4, 1, N'jai shiv shambhu', 3, N'Neutral')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (17, 4, 2, N'found peace in Haridwar', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (18, 4, 3, N'spritiual trip', 3, N'Neutral')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (19, 4, 4, N'Good Trip ', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (20, 4, 5, N'Nice Trip', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (21, 1002, 1, N'Best Trip Ever', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (22, 1002, 2, N'Must visit place', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (23, 1002, 3, N'India is full of places like these', 5, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (24, 1003, 1, N'leh is heaven', 4, N'Possitive')
INSERT [dbo].[Review_Master] ([Id], [Tour_id], [User_Id], [Review], [Ratings], [Sentiment]) VALUES (25, 1003, 2, N'Ladhak is beauty', 5, N'Possitive')
SET IDENTITY_INSERT [dbo].[Review_Master] OFF
SET IDENTITY_INSERT [dbo].[Tour_Master] ON 

INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (1, N'ADVENTUROUS UTTARANCHAL', N'Uttranchal, India', N'24500', N'DAY 01: DELHI – MUSSOORIE / DHANAULTI . DAY 02: KAUDIYALA. DAY 03: MUSSOORIE / DHANAULTI', N'uttaranchal.jpg', N'adventurous-uttaranchal.pdf')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (2, N'Rajasthan', N'Rajasthan,India', N'21350', N'5 cities and 6 days. Ahmedabad(1), Jaipur(2N), Pushkar (1N) ,Udaipur(2N) ', N'Jaipur_211.jpg', N'RIC_new.docx')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (3, N'Hampta Pass Himachal Trek', N'Himachal,India', N'25000', N'5 Cities, 8 Days. 1 Chandigarh, 2 Chandigarh – Kalath Base Camp, 3 Kalath – Sethan – Jobri Nala – Uchung Bihadi/Chikka (3017 MTS/ 9900 FT; 3 – 4 HRS trek), 4 Uchng Bihadi/Chikka, 5 Balu ka Ghera ', N'him.jpg', N'RIC_new.docx')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (4, N'Haridwar Rishikesh', N'Haridwar,India', N'25000', N'3 Cities, 4Days, 1 Delhi – Haridwar, 2 Haridwar, 3 Haridwar – Rishikesh Tent (1 Night), 4 Rishikesh Tent – Delhi – Departure', N'Haridwar banner.jpg', N'reference_thesis2 (1).docx')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (1002, N'KASHMIR TOUR', N'Kashmir, India', N'37,397', N'Kashmir Tour Package - We offers exclusives Kashmir Holiday Packages online at attractive prices. Plan your dream Kashmir Trip of North India now Choose among Top Hotels. Customized packages for family, group etc. Get Quote now 24X7 Customer Services. Destinations: Srinagar, Gulmarg, Sonamarg, Pahalgam', N'him.jpg', N'NCRTMACT_IoT_2020.pdf')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (1003, N'LEH LADAKH TOUR', N'leh, India', N'36,462', N'Select this leh ladakh packages to enjoy a relaxing tour experiencing the top mountains of Ladakh. Enjoy exploring the beautiful Leh Ladakh, famous for its Buddhist and See snow point Talk To Expert From Leh Ladakh Visit Pangong Lake, Nubra Valley, Khardong La Pass.And More Information. Book Leh Ladakh Holiday Tour Packages and avail Heavy Discounts from Us

', N'd5.jpg', N'NCRTMACT_IoT_2020.pdf')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (2002, N'Sikkim Gangtok', N'Sikkim', N'4000', N'Safe & Clean Cars. Clean & Well Managed Cars. Safe Pickup & Drop. Experienced Drivers. We Provide You with an Quick Car Booking Service in Siliguri. Secure Payment Policy. 24x7 Cab Service. Govt. Registered Agent. Destinations', N'download.jpg', N'1710.06836.pdf')
INSERT [dbo].[Tour_Master] ([Id], [Tour_name], [Location], [Price], [Discription], [Image], [Doc]) VALUES (2003, N'Lonavala & Khandala', N'Lonavala', N'8000', N'With lots of waterfalls, lakes and hills around, it is a popular destination for camping, trekking and other adventure sports. Surrounded by dense forests, waterfalls, and dam alongside lakes, it is a must-visit if you admire nature.', N'lonavala.jpg', N'bhilare2015.pdf')
SET IDENTITY_INSERT [dbo].[Tour_Master] OFF
SET IDENTITY_INSERT [dbo].[Tour_Register_Master] ON 

INSERT [dbo].[Tour_Register_Master] ([Id], [Uid], [Tid], [Date]) VALUES (1, N'1', N'2', CAST(0x88430B00 AS Date))
SET IDENTITY_INSERT [dbo].[Tour_Register_Master] OFF
SET IDENTITY_INSERT [dbo].[User_Master] ON 

INSERT [dbo].[User_Master] ([ID], [Name], [Email], [Phone], [Password], [Address]) VALUES (1, N'Deepak Jha', N'd@gmail.com', N'07738299907', N'12345', N'Kandivali west')
INSERT [dbo].[User_Master] ([ID], [Name], [Email], [Phone], [Password], [Address]) VALUES (2, N'Suresh Kapoor', N's@gmail.com', N'8956447451', N'12345', N'Mumbai')
INSERT [dbo].[User_Master] ([ID], [Name], [Email], [Phone], [Password], [Address]) VALUES (3, N'Ramesh Bodke', N'r@gmail.com', N'8754256312', N'12345', N'Mumbai')
INSERT [dbo].[User_Master] ([ID], [Name], [Email], [Phone], [Password], [Address]) VALUES (4, N'Roydon Dsouza', N'roy@gmail.com', N'8965221023', N'12345', N'Mumbai')
INSERT [dbo].[User_Master] ([ID], [Name], [Email], [Phone], [Password], [Address]) VALUES (5, N'Fransis Perera', N'f@gmail.com', N'9896598744', N'12345', N'Mumbai')
SET IDENTITY_INSERT [dbo].[User_Master] OFF
USE [master]
GO
ALTER DATABASE [tour_recommandation_neww] SET  READ_WRITE 
GO

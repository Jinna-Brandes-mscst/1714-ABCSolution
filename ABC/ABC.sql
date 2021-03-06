USE [master]
GO
/****** Object:  Database [ABC]    Script Date: 9/26/2021 5:47:51 PM ******/
CREATE DATABASE [ABC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ABC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ABC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ABC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ABC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABC] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ABC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABC] SET RECOVERY FULL 
GO
ALTER DATABASE [ABC] SET  MULTI_USER 
GO
ALTER DATABASE [ABC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ABC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ABC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ABC', N'ON'
GO
ALTER DATABASE [ABC] SET QUERY_STORE = OFF
GO
USE [ABC]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(300,1) NOT NULL,
	[Street_1] [nchar](50) NOT NULL,
	[Street_2] [nchar](50) NOT NULL,
	[City] [nchar](30) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[Zip] [int] NOT NULL,
	[House_Name] [nchar](20) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSP]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSP](
	[DSP_ID] [int] IDENTITY(7600,1) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Last_Name] [nchar](20) NOT NULL,
	[Phone_Number] [nchar](10) NOT NULL,
	[PC_ID] [int] NOT NULL,
 CONSTRAINT [PK_DSP] PRIMARY KEY CLUSTERED 
(
	[DSP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Job_ID] [int] NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Contact_Person] [nchar](100) NOT NULL,
	[PC_ID] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outcomes]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outcomes](
	[Outcome_ID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Goal] [nchar](100) NOT NULL,
	[Participant_ID] [int] NOT NULL,
	[DSP_ID] [int] NOT NULL,
 CONSTRAINT [PK_Outcomes] PRIMARY KEY CLUSTERED 
(
	[Outcome_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participant](
	[Participant_ID] [int] IDENTITY(6000,1) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Last_Name] [nchar](20) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Phone_Number] [nchar](10) NOT NULL,
	[PC_ID] [int] NOT NULL,
 CONSTRAINT [PK_Paritcipant] PRIMARY KEY CLUSTERED 
(
	[Participant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PC]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC](
	[PC_ID] [int] IDENTITY(7500,1) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Last_Name] [nchar](20) NOT NULL,
	[Phone_Number] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PC] PRIMARY KEY CLUSTERED 
(
	[PC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeCard]    Script Date: 9/26/2021 5:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeCard](
	[TimeCard_ID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Start_Time] [time](4) NOT NULL,
	[End_Time] [time](4) NOT NULL,
	[Job_ID] [int] NOT NULL,
	[Participant_ID] [int] NOT NULL,
	[DSP_ID] [int] NOT NULL,
 CONSTRAINT [PK_TimeCard] PRIMARY KEY CLUSTERED 
(
	[TimeCard_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (300, N'62                                                ', N'North Third Street                                ', N'LaCrescent                    ', N'MN', 55947, NULL)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (301, N'681                                               ', N'Spruce Drive                                      ', N'LaCrescent                    ', N'MN', 55947, N'Spruce              ')
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (302, N'1488                                              ', N'Gilmore Avenue                                    ', N'Winona                        ', N'MN', 55987, NULL)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (303, N'187                                               ', N'Hill Street                                       ', N'LaCrescent                    ', N'MN', 55947, N'Hill                ')
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (304, N'756                                               ', N'Lancer Boulevard                                  ', N'LaCrescent                    ', N'MN', 55947, N'Lancer              ')
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (305, N'618                                               ', N'North Holmen Drive                                ', N'Holmen                        ', N'WI', 54636, NULL)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (306, N'357                                               ', N'Town Hall Road                                    ', N'LaCrescent                    ', N'MN', 55947, N'THR                 ')
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (307, N'1200                                              ', N'LaCrosse Street                                   ', N'LaCrosse                      ', N'WI', 54603, NULL)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (308, N'202                                               ', N'Third Street South                                ', N'LaCrosse                      ', N'WI', 54603, NULL)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip], [House_Name]) VALUES (309, N'121                                               ', N'Juniper Street                                    ', N'LaCrescent                    ', N'MN', 55947, N'Juniper             ')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[DSP] ON 

INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7600, N'Jinna               ', N'Brandes             ', N'5074585078', 7502)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7601, N'Samantha            ', N'Lehnertz            ', N'5073131059', 7500)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7602, N'Denise              ', N'Jackson             ', N'5074501282', 7501)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7603, N'Heather             ', N'Smith               ', N'5078956451', 7509)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7604, N'Heidi               ', N'Jones               ', N'5078647191', 7506)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7605, N'Haley               ', N'Larson              ', N'6087815469', 7503)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7606, N'Anita               ', N'Garcia              ', N'6087965689', 7505)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7607, N'Corey               ', N'Anderson            ', N'6087659875', 7504)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7608, N'Jill                ', N'Shue                ', N'6087846547', 7507)
INSERT [dbo].[DSP] ([DSP_ID], [First_Name], [Last_Name], [Phone_Number], [PC_ID]) VALUES (7609, N'Taylor              ', N'Hanks               ', N'6087963562', 7508)
SET IDENTITY_INSERT [dbo].[DSP] OFF
GO
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (161253, 308, N'Liz Banks                                                                                           ', 7508)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (175698, 305, N'Tyler Hanson                                                                                        ', 7502)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (181301, 302, N'Ken Strange                                                                                         ', 7503)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (192501, 309, N'Lucy Starks                                                                                         ', 7506)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (194301, 300, N'Harold Franks                                                                                       ', 7509)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (356981, 301, N'Julie Strand                                                                                        ', 7504)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (569735, 304, N'Larry Crumb                                                                                         ', 7501)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (658742, 306, N'Kim Smith                                                                                           ', 7507)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (758965, 307, N'Nick Moore                                                                                          ', 7505)
INSERT [dbo].[Jobs] ([Job_ID], [Address_ID], [Contact_Person], [PC_ID]) VALUES (985647, 303, N'Jan Tyler                                                                                           ', 7500)
GO
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1001, CAST(N'2021-10-01' AS Date), N'Work Three Hours a day                                                                              ', 6009, 7600)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1002, CAST(N'2021-11-01' AS Date), N'Stay warm                                                                                           ', 6007, 7608)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1003, CAST(N'2021-10-01' AS Date), N'Finish lunch on time                                                                                ', 6002, 7605)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1004, CAST(N'2021-09-01' AS Date), N'Walk 30 minutes a day                                                                               ', 6005, 7601)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1005, CAST(N'2021-09-01' AS Date), N'Don''t steal food                                                                                    ', 6008, 7603)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1006, CAST(N'2021-08-01' AS Date), N'Safe hands                                                                                          ', 6003, 7606)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1007, CAST(N'2021-09-01' AS Date), N'Put together one puzzle a day                                                                       ', 6006, 7602)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1008, CAST(N'2021-08-01' AS Date), N'Read for 20 minutes a day                                                                           ', 6000, 7604)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1009, CAST(N'2021-10-01' AS Date), N'Complete daily exercises                                                                            ', 6004, 7607)
INSERT [dbo].[Outcomes] ([Outcome_ID], [Date], [Goal], [Participant_ID], [DSP_ID]) VALUES (1010, CAST(N'2021-10-01' AS Date), N'Work three days a week                                                                              ', 6001, 7609)
GO
SET IDENTITY_INSERT [dbo].[Participant] ON 

INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6000, N'Jane                ', N'Fonda               ', 301, N'5078957161', 7500)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6001, N'Joe                 ', N'Meyer               ', 303, N'5078956171', 7501)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6002, N'George              ', N'Martin              ', 303, N'5078956171', 7502)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6003, N'John                ', N'Smith               ', 303, N'5078956171', 7503)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6004, N'Carla               ', N'Jansen              ', 304, N'5078957611', 7504)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6005, N'June                ', N'Jones               ', 304, N'5078957611', 7505)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6006, N'Carol               ', N'Blake               ', 304, N'5078957611', 7506)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6007, N'April               ', N'Nelson              ', 301, N'5078957161', 7507)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6008, N'Kelly               ', N'Neil                ', 301, N'5078957161', 7508)
INSERT [dbo].[Participant] ([Participant_ID], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [PC_ID]) VALUES (6009, N'Sherry              ', N'Lorenz              ', 301, N'5078957161', 7509)
SET IDENTITY_INSERT [dbo].[Participant] OFF
GO
SET IDENTITY_INSERT [dbo].[PC] ON 

INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7500, N'Carmen              ', N'SanDiego            ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7501, N'Lori                ', N'Duerwachter         ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7502, N'Mike                ', N'Meyers              ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7503, N'Theresa             ', N'Caputo              ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7504, N'Bill                ', N'Porter              ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7505, N'Cathy               ', N'McGowan             ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7506, N'Judy                ', N'Mikovits            ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7507, N'Katie               ', N'Findlay             ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7508, N'Nicole              ', N'Scherzinger         ', N'5078957161')
INSERT [dbo].[PC] ([PC_ID], [First_Name], [Last_Name], [Phone_Number]) VALUES (7509, N'Jane                ', N'Lynch               ', N'5078957161')
SET IDENTITY_INSERT [dbo].[PC] OFF
GO
USE [master]
GO
ALTER DATABASE [ABC] SET  READ_WRITE 
GO

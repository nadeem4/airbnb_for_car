USE [master]
GO
/****** Object:  Database [airbnb_for_car]    Script Date: 3/19/2021 12:56:26 PM ******/
CREATE DATABASE [airbnb_for_car]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'airbnb_for_car', FILENAME = N'/var/opt/mssql/data/airbnb_for_car.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'airbnb_for_car_log', FILENAME = N'/var/opt/mssql/data/airbnb_for_car_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [airbnb_for_car] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airbnb_for_car].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airbnb_for_car] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [airbnb_for_car] SET ANSI_NULLS ON 
GO
ALTER DATABASE [airbnb_for_car] SET ANSI_PADDING ON 
GO
ALTER DATABASE [airbnb_for_car] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [airbnb_for_car] SET ARITHABORT ON 
GO
ALTER DATABASE [airbnb_for_car] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [airbnb_for_car] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airbnb_for_car] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airbnb_for_car] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airbnb_for_car] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [airbnb_for_car] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [airbnb_for_car] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airbnb_for_car] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [airbnb_for_car] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airbnb_for_car] SET  DISABLE_BROKER 
GO
ALTER DATABASE [airbnb_for_car] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airbnb_for_car] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airbnb_for_car] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airbnb_for_car] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airbnb_for_car] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airbnb_for_car] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airbnb_for_car] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airbnb_for_car] SET RECOVERY FULL 
GO
ALTER DATABASE [airbnb_for_car] SET  MULTI_USER 
GO
ALTER DATABASE [airbnb_for_car] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [airbnb_for_car] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airbnb_for_car] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airbnb_for_car] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [airbnb_for_car] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [airbnb_for_car] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'airbnb_for_car', N'ON'
GO
ALTER DATABASE [airbnb_for_car] SET QUERY_STORE = OFF
GO
USE [airbnb_for_car]
GO
/****** Object:  Table [dbo].[address_master]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address_master](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[address_line_one] [nvarchar](2000) NOT NULL,
	[address_line_two] [nvarchar](1000) NULL,
	[city] [nvarchar](200) NOT NULL,
	[state] [nvarchar](200) NOT NULL,
	[country] [nvarchar](200) NOT NULL,
	[zipcode] [nvarchar](20) NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_address_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unit_master]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unit_master](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[desc] [nvarchar](1000) NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_unit_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_address]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_address](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [pk_user_address_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_app_access_history]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_app_access_history](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[latitude] [nvarchar](100) NULL,
	[longitude] [nvarchar](100) NULL,
	[logged_in_time] [datetime] NOT NULL,
	[logged_out_time] [datetime] NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_user_app_access_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_master]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_master](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[nickname] [nvarchar](100) NULL,
	[photo_url] [nvarchar](1000) NULL,
	[sex] [nvarchar](50) NOT NULL,
	[dob] [nvarchar](12) NOT NULL,
	[about] [nvarchar](1000) NULL,
	[primary_phone] [nvarchar](30) NULL,
	[secondray_phone] [nvarchar](30) NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [pk_user_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_social_accounts]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_social_accounts](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[social_account] [nvarchar](100) NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [pk_user_social_account_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_image]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_image](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[url] [nvarchar](1000) NOT NULL,
	[desc] [nvarchar](1000) NULL,
	[vehcile_id] [int] NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_image_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_master]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_master](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[type] [nvarchar](100) NOT NULL,
	[main_image_url] [nvarchar](1000) NOT NULL,
	[model] [nvarchar](200) NOT NULL,
	[make] [nvarchar](200) NOT NULL,
	[price_per_mile] [decimal](10, 2) NOT NULL,
	[vin] [nvarchar](200) NOT NULL,
	[purchased_year] [int] NOT NULL,
	[mileage] [int] NOT NULL,
	[insured_by] [nvarchar](1000) NOT NULL,
	[drivetrain] [nvarchar](200) NULL,
	[fuel_capacity] [decimal](6, 2) NOT NULL,
	[fuel_type] [nvarchar](100) NOT NULL,
	[seating_capacity] [int] NOT NULL,
	[additional_detail] [nvarchar](1000) NULL,
	[ratings] [int] NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [pk_vehcile_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_owner]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_owner](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[owner_id] [int] NOT NULL,
	[vehcile_id] [int] NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_owner_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_rent_comments]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_rent_comments](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vehcile_rent_id] [int] NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_rent_comment_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_rent_feedback]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_rent_feedback](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vehcile_rent_id] [int] NOT NULL,
	[feedback] [nvarchar](1000) NOT NULL,
	[given_by] [nvarchar](100) NOT NULL,
	[rating] [int] NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_rent_feedback_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_rent_history]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_rent_history](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[contract_id] [int] NOT NULL,
	[dropped_at] [int] NULL,
	[actual_mileage_used] [decimal](10, 2) NULL,
	[actual_price_paid] [decimal](10, 2) NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_rent_history_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_service_history]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_service_history](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vehcile_id] [int] NOT NULL,
	[serviced_by] [nvarchar](1000) NULL,
	[serviced_on] [nvarchar](15) NOT NULL,
	[issue] [nvarchar](1000) NOT NULL,
	[mileage] [int] NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_service_history_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_rent_contract]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_rent_contract](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vehcile_id] [int] NOT NULL,
	[renter_id] [int] NOT NULL,
	[rent_time] [datetime] NOT NULL,
	[picked_from] [int] NULL,
	[dropping_location] [int] NULL,
	[rent_duration] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[expected_mileage] [decimal](20, 2) NOT NULL,
	[price_per_mile] [decimal](10, 2) NOT NULL,
	[rent_duration_unit] [nvarchar](10) NOT NULL,
	[actual_price] [decimal](10, 2) NOT NULL,
	[negotiated_price] [decimal](10, 2) NOT NULL,
	[contract_url] [nvarchar](1000) NULL,
	[addtitonal_comment] [nvarchar](1000) NULL,
	[is_open] [bit] NOT NULL,
	[expected_mileage_used] [decimal](10, 2) NULL,
 CONSTRAINT [pk_vehicle_rent_contract_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address_master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[address_master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[unit_master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[unit_master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[unit_master] ADD  DEFAULT (user_name()) FOR [created_by]
GO
ALTER TABLE [dbo].[unit_master] ADD  DEFAULT (user_name()) FOR [updated_by]
GO
ALTER TABLE [dbo].[user_address] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[user_app_access_history] ADD  DEFAULT (getdate()) FOR [logged_in_time]
GO
ALTER TABLE [dbo].[user_app_access_history] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[user_app_access_history] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[user_app_access_history] ADD  DEFAULT (user_name()) FOR [created_by]
GO
ALTER TABLE [dbo].[user_app_access_history] ADD  DEFAULT (user_name()) FOR [updated_by]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT (user_name()) FOR [created_by]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT (user_name()) FOR [updated_by]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT ((0)) FOR [is_active]
GO
ALTER TABLE [dbo].[user_social_accounts] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[user_social_accounts] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[user_social_accounts] ADD  DEFAULT (user_name()) FOR [created_by]
GO
ALTER TABLE [dbo].[user_social_accounts] ADD  DEFAULT (user_name()) FOR [updated_by]
GO
ALTER TABLE [dbo].[user_social_accounts] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vehcile_image] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_image] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehcile_master] ADD  DEFAULT ((0)) FOR [ratings]
GO
ALTER TABLE [dbo].[vehcile_master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehcile_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vehcile_owner] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_owner] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_comments] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_comments] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_feedback] ADD  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[vehcile_rent_feedback] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_feedback] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_history] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_history] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehcile_rent_history] ADD  DEFAULT (user_name()) FOR [created_by]
GO
ALTER TABLE [dbo].[vehcile_rent_history] ADD  DEFAULT (user_name()) FOR [updated_by]
GO
ALTER TABLE [dbo].[vehcile_service_history] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_service_history] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[vehicle_rent_contract] ADD  DEFAULT (getdate()) FOR [rent_time]
GO
ALTER TABLE [dbo].[vehicle_rent_contract] ADD  DEFAULT ((1)) FOR [is_open]
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD  CONSTRAINT [fk_user_address_address_id_address_master_id] FOREIGN KEY([address_id])
REFERENCES [dbo].[address_master] ([id])
GO
ALTER TABLE [dbo].[user_address] CHECK CONSTRAINT [fk_user_address_address_id_address_master_id]
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD  CONSTRAINT [fk_user_address_user_id_user_master_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_master] ([id])
GO
ALTER TABLE [dbo].[user_address] CHECK CONSTRAINT [fk_user_address_user_id_user_master_id]
GO
ALTER TABLE [dbo].[user_app_access_history]  WITH CHECK ADD  CONSTRAINT [fk_user_app_access_history_user_id_user_master_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_master] ([id])
GO
ALTER TABLE [dbo].[user_app_access_history] CHECK CONSTRAINT [fk_user_app_access_history_user_id_user_master_id]
GO
ALTER TABLE [dbo].[user_social_accounts]  WITH CHECK ADD  CONSTRAINT [fk_user_social_account_user_id_user_master_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_master] ([id])
GO
ALTER TABLE [dbo].[user_social_accounts] CHECK CONSTRAINT [fk_user_social_account_user_id_user_master_id]
GO
ALTER TABLE [dbo].[vehcile_image]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_image_vehcile_id_vehcile_master_id] FOREIGN KEY([vehcile_id])
REFERENCES [dbo].[vehcile_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_image] CHECK CONSTRAINT [fk_vehcile_image_vehcile_id_vehcile_master_id]
GO
ALTER TABLE [dbo].[vehcile_owner]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_owner_owner_id_user_master_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[user_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_owner] CHECK CONSTRAINT [fk_vehcile_owner_owner_id_user_master_id]
GO
ALTER TABLE [dbo].[vehcile_owner]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_owner_vehcile_id_vehcile_master] FOREIGN KEY([vehcile_id])
REFERENCES [dbo].[vehcile_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_owner] CHECK CONSTRAINT [fk_vehcile_owner_vehcile_id_vehcile_master]
GO
ALTER TABLE [dbo].[vehcile_rent_comments]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_comment_vehcile_rent_id_vehcile_rent_history_id] FOREIGN KEY([vehcile_rent_id])
REFERENCES [dbo].[vehcile_rent_history] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_comments] CHECK CONSTRAINT [fk_vehcile_rent_comment_vehcile_rent_id_vehcile_rent_history_id]
GO
ALTER TABLE [dbo].[vehcile_rent_feedback]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_feedback_vehcile_rent_id_vehcile_rent_history_id] FOREIGN KEY([vehcile_rent_id])
REFERENCES [dbo].[vehcile_rent_history] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_feedback] CHECK CONSTRAINT [fk_vehcile_rent_feedback_vehcile_rent_id_vehcile_rent_history_id]
GO
ALTER TABLE [dbo].[vehcile_rent_history]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_history_dropped_at_address_master_id] FOREIGN KEY([dropped_at])
REFERENCES [dbo].[address_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_history] CHECK CONSTRAINT [fk_vehcile_rent_history_dropped_at_address_master_id]
GO
ALTER TABLE [dbo].[vehcile_rent_history]  WITH CHECK ADD  CONSTRAINT [fk_vehicle_rent_history_contract_id_vehicle_contract_id] FOREIGN KEY([contract_id])
REFERENCES [dbo].[vehicle_rent_contract] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_history] CHECK CONSTRAINT [fk_vehicle_rent_history_contract_id_vehicle_contract_id]
GO
ALTER TABLE [dbo].[vehcile_service_history]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_service_history_vehcile_id_vehcile_master] FOREIGN KEY([vehcile_id])
REFERENCES [dbo].[vehcile_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_service_history] CHECK CONSTRAINT [fk_vehcile_service_history_vehcile_id_vehcile_master]
GO
ALTER TABLE [dbo].[vehicle_rent_contract]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_contract_dropping_location_address_master_id] FOREIGN KEY([dropping_location])
REFERENCES [dbo].[address_master] ([id])
GO
ALTER TABLE [dbo].[vehicle_rent_contract] CHECK CONSTRAINT [fk_vehcile_rent_contract_dropping_location_address_master_id]
GO
ALTER TABLE [dbo].[vehicle_rent_contract]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_contract_picked_from_address_master_id] FOREIGN KEY([picked_from])
REFERENCES [dbo].[address_master] ([id])
GO
ALTER TABLE [dbo].[vehicle_rent_contract] CHECK CONSTRAINT [fk_vehcile_rent_contract_picked_from_address_master_id]
GO
ALTER TABLE [dbo].[vehicle_rent_contract]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_contract_renter_id_user_master_id] FOREIGN KEY([renter_id])
REFERENCES [dbo].[user_master] ([id])
GO
ALTER TABLE [dbo].[vehicle_rent_contract] CHECK CONSTRAINT [fk_vehcile_rent_contract_renter_id_user_master_id]
GO
ALTER TABLE [dbo].[vehicle_rent_contract]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_contract_vehcile_id_vehcile_master_id] FOREIGN KEY([vehcile_id])
REFERENCES [dbo].[vehcile_master] ([id])
GO
ALTER TABLE [dbo].[vehicle_rent_contract] CHECK CONSTRAINT [fk_vehcile_rent_contract_vehcile_id_vehcile_master_id]
GO
ALTER TABLE [dbo].[user_social_accounts]  WITH CHECK ADD  CONSTRAINT [check_social_account_values] CHECK  (([social_account]='TWITTER' OR [social_account]='FACEBOOK' OR [social_account]='GOOGLE' OR [social_account]='NORMAL'))
GO
ALTER TABLE [dbo].[user_social_accounts] CHECK CONSTRAINT [check_social_account_values]
GO
/****** Object:  StoredProcedure [dbo].[add_vehicle]    Script Date: 3/19/2021 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[add_vehicle]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
USE [master]
GO
ALTER DATABASE [airbnb_for_car] SET  READ_WRITE 
GO

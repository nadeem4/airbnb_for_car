
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
/****** Object:  Table [dbo].[user_address]    Script Date: 2/26/2021 5:56:52 PM ******/
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
/****** Object:  Table [dbo].[user_master]    Script Date: 2/26/2021 5:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_master](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[photo_url] [nvarchar](1000) NULL,
	[sex] [nvarchar](50) NOT NULL,
	[dob] [nvarchar](12) NOT NULL,
	[about] [nvarchar](1000) NULL,
	[primary_phone] [nvarchar](30) NULL,
	[secondray_phone] [nvarchar](30) NULL,
	[fax] [nvarchar](30) NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_user_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_image]    Script Date: 2/26/2021 5:56:52 PM ******/
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
/****** Object:  Table [dbo].[vehcile_master]    Script Date: 2/26/2021 5:56:52 PM ******/
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
	[vin] [nvarchar](200) NOT NULL,
	[purchased_year] [int] NOT NULL,
	[mileage] [int] NOT NULL,
	[insured_by] [nvarchar](1000) NOT NULL,
	[drivetraint] [nvarchar](200) NULL,
	[fuel_capacity] [decimal](6, 2) NOT NULL,
	[fuel_type] [nvarchar](100) NOT NULL,
	[seating_capacity] [int] NOT NULL,
	[additional_detail] [nvarchar](1000) NULL,
	[ratings] [int] NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[updated_datetime] [datetime] NOT NULL,
	[created_by] [nvarchar](200) NOT NULL,
	[updated_by] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_vehcile_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehcile_owner]    Script Date: 2/26/2021 5:56:52 PM ******/
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
/****** Object:  Table [dbo].[vehcile_rent_comments]    Script Date: 2/26/2021 5:56:52 PM ******/
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
/****** Object:  Table [dbo].[vehcile_rent_feedback]    Script Date: 2/26/2021 5:56:52 PM ******/
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
/****** Object:  Table [dbo].[vehcile_rent_history]    Script Date: 2/26/2021 5:56:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehcile_rent_history](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vehcile_id] [int] NOT NULL,
	[renter_id] [int] NOT NULL,
	[rent_on] [nvarchar](15) NOT NULL,
	[rented_for] [int] NOT NULL,
	[rented_for_unit] [nvarchar](10) NOT NULL,
	[price_per_hrs] [decimal](10, 2) NOT NULL,
	[contract_id] [nvarchar](1000) NULL,
	[addtitonal_comment] [nvarchar](1000) NULL,
	[picked_from] [int] NULL,
	[dropped_at] [int] NULL,
	[mileage_used] [decimal](10, 2) NULL,
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
/****** Object:  Table [dbo].[vehcile_service_history]    Script Date: 2/26/2021 5:56:52 PM ******/
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
ALTER TABLE [dbo].[address_master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[address_master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[user_address] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[user_master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
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
ALTER TABLE [dbo].[vehcile_service_history] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[vehcile_service_history] ADD  DEFAULT (getdate()) FOR [updated_datetime]
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
ALTER TABLE [dbo].[vehcile_image]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_image_vehcile_id_vehcile_master_id] FOREIGN KEY([id])
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
ALTER TABLE [dbo].[vehcile_rent_history]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_history_picked_from_address_master_id] FOREIGN KEY([picked_from])
REFERENCES [dbo].[address_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_history] CHECK CONSTRAINT [fk_vehcile_rent_history_picked_from_address_master_id]
GO
ALTER TABLE [dbo].[vehcile_rent_history]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_history_renter_id_user_master_id] FOREIGN KEY([renter_id])
REFERENCES [dbo].[user_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_history] CHECK CONSTRAINT [fk_vehcile_rent_history_renter_id_user_master_id]
GO
ALTER TABLE [dbo].[vehcile_rent_history]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_rent_history_vehcile_id_vehcile_master_id] FOREIGN KEY([vehcile_id])
REFERENCES [dbo].[vehcile_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_rent_history] CHECK CONSTRAINT [fk_vehcile_rent_history_vehcile_id_vehcile_master_id]
GO
ALTER TABLE [dbo].[vehcile_service_history]  WITH CHECK ADD  CONSTRAINT [fk_vehcile_service_history_vehcile_id_vehcile_master] FOREIGN KEY([vehcile_id])
REFERENCES [dbo].[vehcile_master] ([id])
GO
ALTER TABLE [dbo].[vehcile_service_history] CHECK CONSTRAINT [fk_vehcile_service_history_vehcile_id_vehcile_master]
GO

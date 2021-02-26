﻿CREATE TABLE [dbo].[vehcile_master]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[type] NVARCHAR(100) NOT NULL,
	main_image_url NVARCHAR(1000) NOT NULL,
	model NVARCHAR(200) NOT NULL,
	make NVARCHAR(200) NOT NULL,
	vin NVARCHAR(200) NOT NULL,
	purchased_year INT NOT NULL,
	mileage INT NOT NULL,
	insured_by NVARCHAR(1000) NOT NULL,
	drivetraint NVARCHAR(200) NULL,
	fuel_capacity DECIMAL(6,2) NOT NULL,
	fuel_type NVARCHAR(100) NOT NULL,
	seating_capacity INT NOT NULL,
	additional_detail NVARCHAR(1000) NULL,
	ratings INT NOT NULL DEFAULT 0,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_vehcile_master_id PRIMARY KEY(id)
)
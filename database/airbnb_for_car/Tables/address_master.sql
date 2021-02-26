﻿CREATE TABLE [dbo].[address_master]
(
	[id] INT NOT NULL IDENTITY(0,1),
	address_line_one NVARCHAR(2000) NOT NULL,
	address_line_two NVARCHAR(1000) NULL,
	[city] NVARCHAR(200) NOT NULL,
	[state] NVARCHAR(200) NOT NULL,
	[country] NVARCHAR(200) NOT NULL,
	[zipcode] NVARCHAR(20) NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_address_master_id PRIMARY KEY(id)
)

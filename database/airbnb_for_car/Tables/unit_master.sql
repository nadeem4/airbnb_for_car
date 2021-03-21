﻿CREATE TABLE [dbo].[unit_master]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[name] NVARCHAR(50) NOT NULL,
	[desc] NVARCHAR(1000) NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	CONSTRAINT pk_unit_master_id PRIMARY KEY(id)
)
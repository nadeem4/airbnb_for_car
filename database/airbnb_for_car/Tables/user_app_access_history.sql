CREATE TABLE [dbo].[user_app_access_history]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[user_id] INT NOT NULL,
	latitude NVARCHAR(100) NULL,
	longitude NVARCHAR(100) NULL,
	logged_in_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	logged_out_time DATETIME NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	CONSTRAINT pk_user_app_access_history PRIMARY KEY (id),
	CONSTRAINT fk_user_app_access_history_user_id_user_master_id FOREIGN KEY ([user_id]) REFERENCES user_master(id)

)

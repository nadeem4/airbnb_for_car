CREATE TABLE [dbo].[vehcile_image]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[url] NVARCHAR(1000) NOT NULL,
	[desc] NVARCHAR(1000) NULL,
	vehcile_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_vehcile_image_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_image_vehcile_id_vehcile_master_id FOREIGN KEY(id) REFERENCES vehcile_master(id)

)

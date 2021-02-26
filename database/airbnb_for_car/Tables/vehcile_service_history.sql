CREATE TABLE [dbo].[vehcile_service_history]
(
	[id] INT NOT NULL IDENTITY(0,1),
	vehcile_id INT NOT NULL,
	serviced_by NVARCHAR(1000) NULL,
	serviced_on NVARCHAR(15) NOT NULL,
	issue NVARCHAR(1000) NOT NULL,
	mileage INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_vehcile_service_history_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_service_history_vehcile_id_vehcile_master FOREIGN KEY (vehcile_id) REFERENCES vehcile_master(id)

)

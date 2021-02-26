CREATE TABLE [dbo].[vehcile_owner]
(
	[id] INT NOT NULL IDENTITY(0,1),
	owner_id INT NOT NULL,
	vehcile_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_vehcile_owner_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_owner_owner_id_user_master_id FOREIGN KEY(owner_id) REFERENCES user_master(id),
	CONSTRAINT fk_vehcile_owner_vehcile_id_vehcile_master FOREIGN KEY(vehcile_id) REFERENCES vehcile_master(id)
)

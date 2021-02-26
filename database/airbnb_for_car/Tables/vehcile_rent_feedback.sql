CREATE TABLE [dbo].[vehcile_rent_feedback]
(
	[id] INT NOT NULL IDENTITY(0,1),
	vehcile_rent_id INT NOT NULL,
	feedback NVARCHAR(1000) NOT NULL,
	given_by NVARCHAR(100) NOT NULL,
	rating INT NOT NULL DEFAULT 0,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_vehcile_rent_feedback_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_rent_feedback_vehcile_rent_id_vehcile_rent_history_id FOREIGN KEY(vehcile_rent_id) REFERENCES vehcile_rent_history(id)

)

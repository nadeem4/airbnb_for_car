CREATE TABLE [dbo].[vehcile_rent_comments]
(
	[id] INT NOT NULL IDENTITY(0,1),
	vehcile_rent_id INT NOT NULL,
	comment NVARCHAR(MAX) NOT NULL,
	[user_id] INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	CONSTRAINT pk_vehcile_rent_comment_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_rent_comment_vehcile_rent_id_vehcile_rent_history_id FOREIGN KEY(vehcile_rent_id) REFERENCES vehcile_rent_history(id)
)

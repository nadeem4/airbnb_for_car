CREATE TABLE [dbo].[vehcile_rent_history]
(
	[id] INT NOT NULL IDENTITY(0,1),
	vehcile_id INT NOT NULL,
	renter_id INT NOT NULL,
	rent_on NVARCHAR(15) NOT NULL,
	rented_for INT NOT NULL,
	rented_for_unit NVARCHAR(10) NOT NULL,
	price_per_hrs DECIMAL(10, 2) NOT NULL,
	contract_id NVARCHAR(1000) NULL,
	addtitonal_comment NVARCHAR(1000) NULL,
	picked_from INT NULL,
	dropped_at INT NULL,
	mileage_used DECIMAL(10,2) NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_vehcile_rent_history_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_rent_history_vehcile_id_vehcile_master_id FOREIGN KEY(vehcile_id) REFERENCES vehcile_master(id),
	CONSTRAINT fk_vehcile_rent_history_renter_id_user_master_id FOREIGN KEY(renter_id) REFERENCES user_master(id),
	CONSTRAINT fk_vehcile_rent_history_picked_from_address_master_id FOREIGN KEY(picked_from) REFERENCES address_master(id),
	CONSTRAINT fk_vehcile_rent_history_dropped_at_address_master_id FOREIGN KEY(dropped_at) REFERENCES address_master(id)
)

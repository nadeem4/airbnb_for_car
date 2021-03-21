CREATE TABLE [dbo].[vehcile_rent_history]
(
	[id] INT NOT NULL IDENTITY(0,1),
	contract_id INT NOT NULL,
	dropped_at INT NULL,
	actual_mileage_used DECIMAL(10,2) NULL,
	actual_price_paid DECIMAL(10,2) NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
	CONSTRAINT pk_vehcile_rent_history_id PRIMARY KEY(id),
	CONSTRAINT fk_vehicle_rent_history_contract_id_vehicle_contract_id FOREIGN KEY(contract_id) REFERENCES vehicle_rent_contract(id),
	CONSTRAINT fk_vehcile_rent_history_dropped_at_address_master_id FOREIGN KEY(dropped_at) REFERENCES address_master(id)
)

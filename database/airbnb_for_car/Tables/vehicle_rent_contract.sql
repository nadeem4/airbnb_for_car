﻿CREATE TABLE [dbo].[vehicle_rent_contract]
(
	[id] INT NOT NULL IDENTITY(0,1),
	vehcile_id INT NOT NULL,
	renter_id INT NOT NULL,
	picked_from INT NULL,
	dropping_location INT NULL,
	rent_duration INT NOT NULL,
	discount INT NOT NULL,
	expected_mileage DECIMAL(20, 2) NOT NULL,
	price_per_mile DECIMAL(10, 2) NOT NULL,
	rent_duration_unit NVARCHAR(10) NOT NULL,
	actual_price DECIMAL(10, 2) NOT NULL,
	negotiated_price DECIMAL(10, 2) NOT NULL,
	contract_url NVARCHAR(1000) NULL,
	additional_comment NVARCHAR(1000) NULL,
	is_open BIT NOT NULL DEFAULT 1,
	current_mileage DECIMAL(20, 2) NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER ,
	updated_by NVARCHAR(200) NOT NULL  DEFAULT CURRENT_USER,
	CONSTRAINT pk_vehicle_rent_contract_id PRIMARY KEY(id),
	CONSTRAINT fk_vehcile_rent_contract_vehcile_id_vehcile_master_id FOREIGN KEY(vehcile_id) REFERENCES vehcile_master(id),
	CONSTRAINT fk_vehcile_rent_contract_renter_id_user_master_id FOREIGN KEY(renter_id) REFERENCES user_master(id),
	CONSTRAINT fk_vehcile_rent_contract_picked_from_address_master_id FOREIGN KEY(picked_from) REFERENCES address_master(id),
	CONSTRAINT fk_vehcile_rent_contract_dropping_location_address_master_id FOREIGN KEY(dropping_location) REFERENCES address_master(id)
)

CREATE PROCEDURE [dbo].[add_vehicle] @type NVARCHAR(100),
@main_image_url NVARCHAR(1000),
@model NVARCHAR(200),
@make NVARCHAR(200),
@price_per_mile DECIMAL(10, 2),
@vin NVARCHAR(200),
@purchased_year INT,
@mileage INT NOT NULL,
@insured_by NVARCHAR(1000),
@drivetrain NVARCHAR(200),
@fuel_capacity DECIMAL(6, 2),
@fuel_type NVARCHAR(100),
@seating_capacity INT,
@additional_detail NVARCHAR(1000),
@user_id INT AS BEGIN TRANSACTION BEGIN TRY
DECLARE @vehicle_id INT IF NOT EXISTS (
		SELECT *
		FROM user_master
		WHERE id = @user_id
	) THROW 51000,
	'Please signup/ login before listing vehicle',
	24
INSERT INTO vehcile_master (
		type,
		main_image_url,
		model,
		make,
		price_per_mile,
		vin,
		purchased_year,
		mileage,
		insured_by,
		drivetrain,
		fuel_capacity,
		fuel_type,
		seating_capacity,
		additional_detail,
		created_datetime
	)
VALUES (
		@type,
		@main_image_url,
		@model,
		@make,
		@price_per_mile,
		@vin,
		@purchased_year,
		@mileage,
		@insured_by,
		@drivetrain,
		@fuel_capacity,
		@fuel_type,
		@seating_capacity,
		@additional_detail
	)
SET @vehicle_id = (
		SELECT IDENT_CURRENT('vehcile_master')
	)
INSERT INTO vehcile_owner (owner_id, vehcile_id)
VALUES (@user_id, @vehicle_id) IF @@TRANCOUNT > 0 COMMIT
END TRY BEGIN CATCH IF @@TRANCOUNT > 0 ROLLBACK;
THROW
END CATCH
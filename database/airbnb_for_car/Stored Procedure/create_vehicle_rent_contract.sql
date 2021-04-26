CREATE PROCEDURE [dbo].[create_vehicle_rent_contract]
	@vehcile_id INT,
	@renter_id INT,
	@picked_from INT,
	@dropping_location INT,
	@rent_duration INT,
	@discount INT,
	@expected_mileage DECIMAL(20, 2),
	@price_per_mile DECIMAL(10, 2),
	@rent_duration_unit NVARCHAR(10),
	@actual_price DECIMAL(10, 2),
	@negotiated_price DECIMAL(10, 2),
	@contract_url NVARCHAR(1000),
	@additional_comment NVARCHAR(1000),
	@current_mileage DECIMAL(20, 2)
AS
	BEGIN TRANSACTION
	BEGIN TRY
	IF (SELECT is_active FROM vehcile_master WHERE id  = @vehcile_id) <> 1
		THROW 51000, 'Selected Vehicle Cannot be booked because onwer has disabled the listing', 23

	IF EXISTS( SELECT * FROM vehicle_rent_contract WHERE vehcile_id = @vehcile_id and is_open = 1)
		THROW 51000, 'Vehicle is already booked by someone else', 26

	IF NOT EXISTS( SELECT * FROM user_master WHERE id  = @user_id)
		THROW 51000, 'Please Signup/ login before booking', 30

	INSERT INTO vehicle_rent_contract ( 
		vehcile_id,
		renter_id, 
		picked_from, 
		dropping_location, 
		rent_duration, 
		discount,
		expected_mileage,
		price_per_mile,
		rent_duration_unit,
		actual_price,
		negotiated_price,
		contract_url,
		additional_comment,
		current_mileage
	) VALUES (
		@vehcile_id,
		@renter_id, 
		@picked_from, 
		@dropping_location, 
		@rent_duration, 
		@discount,
		@expected_mileage,
		@price_per_mile,
		@rent_duration_unit,
		@actual_price,
		@negotiated_price,
		@contract_url,
		@additional_comment,
		@current_mileage
	
	)
	IF @@TRANCOUNT > 0
		COMMIT
	END TRY
	BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK
	;THROW
	END CATCH

CREATE PROCEDURE [dbo].[close_contract]
	@rent_contract_id INT,
	@dropped_at INT,
	@actual_mileage_used DECIMAL(10,2),
	@actual_price_paid DECIMAL(10,2)
AS
	BEGIN TRANSACTION

	BEGIN TRY

		IF NOT EXISTS (SELECT *  FROM vehicle_rent_contract WHERE id  = @rent_contract_id )
			THROW 51000, 'Rent Contract does not exist', 12

		IF EXISTS ( SELECT * FROM vehicle_rent_contract WHERE id  = @rent_contract_id AND is_open = 0)
			THROW 51000, 'Rent Contract has already been closed', 15


		UPDATE vehicle_rent_contract SET is_open = 0, updated_datetime = CURRENT_TIMESTAMP
		WHERE id = @rent_contract_id

		INSERT INTO vehcile_rent_history ( contract_id, dropped_at, actual_mileage_used, actual_price_paid)
		VALUES ( @rent_contract_id, @dropped_at, @actual_mileage_used, @actual_price_paid )

		
		IF @@TRANCOUNT > 0
			COMMIT
	END TRY

	BEGIN CATCH

		IF @@TRANCOUNT > 0
			ROLLBACK

		;THROW

	END CATCH
RETURN 0

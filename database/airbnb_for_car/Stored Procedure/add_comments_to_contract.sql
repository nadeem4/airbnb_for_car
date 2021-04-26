CREATE PROCEDURE [dbo].[add_comments_to_contract] @rent_contract_id INT,
@user_id INT,
@comment NVARCHAR(MAX) AS BEGIN TRANSACTION BEGIN TRY IF NOT EXISTS (
	SELECT *
	FROM vehicle_rent_contract
	WHERE id = @rent_contract_id
) THROW 51000,
'Rent Contract does not exist',
12 IF EXISTS (
	SELECT *
	FROM user_master
	WHERE id = @user_id
) THROW 51000,
'Please signup/ login before adding comments',

15 IF NOT EXISTS (
	SELECT *
	FROM vehicle_rent_contract vrc
		INNER JOIN vehcile_owner vo ON vo.vehcile_id = vrc.vehcile_id
	WHERE vrc.renter_id = @user_id
		OR vo.owner_id = @user_id
) THROW 51000,
'User is not associated with contract',
17

INSERT INTO vehcile_rent_comments (vehcile_rent_id, comment, user_id)
VALUES (@rent_contract_id, @comment, @user_id) 

IF @@TRANCOUNT > 0 COMMIT

END TRY 
BEGIN CATCH 
IF @@TRANCOUNT > 0 ROLLBACK;
THROW
END CATCH
# Airbnb for Vehicles(Under Development)

In this project, we are designing a database for Airbnb for vehicles. This project is inspired by Airbnb, where people can rent out their place to earn some bucks. Airbnb has proven very successful in this business. They don’t own an apartment; they only act as mediators between house owners and renters.
In our project, we have three types of entities:

- User
- Vehicle.
- Contract

<br/>

Users can be of two types Vehicle Owner and Renter. Similarly, the vehicle can be of multiple types like car, trucks, etc. Our system will act as a mediator between vehicle owner and renter. Renters will provide feedback and rating to owners and their vehicles. Similarly, the owner will be able to give feedback to renters. The feedback system will ensure that owners provide the best service, and renters use their vehicles as their own by keeping good care.

<br/>

As a part of the project, we have developed

- Conceptual ERD.
- Logical ERD
- Physical ERD.

<br/>

And we have also created tables and stored procedures. We have used

- MSSQL within Docker as a Database
- Visual Studio is used as a code editor.

<br/>

We work on UI and Backend to interact with the underlying database in the future. For UI, we will use ReactJS, and for Backend, we will use Spring Boot. For Deploying all services, we are going to use Amazon EC2.

<br/>
  
<br/>

## Business Process

![business process](Booking%20Process.png)

- Users can request a vehicle owner for rent by creating a contract.
- The vehicle owner can either accept or reject the vehicle Contract.
- If the owner accepts the contract, the user can use their vehicle.
- The renter can drop the vehicle at the owner's preferred location or the company warehouse.
- If the user is dropping at the company warehouse, then someone from the company will drop the vehicle at the owner's place. Or if someone requested to book the exact car again, and the owner has accepted the request, the renter can pick up the vehicle from the warehouse.

<br/>
  
<br/>

## Technology Used

- MSSQL
- Docker
- Spring Boot
- Microservice Architecture
- AWS
- React JS

## Functionalities

- User can list, remove and update their vehicles records.
- User can rent vehicles.
- User can view listed vehicles without signing up.
- For renting, user needs to sign up.
- Google, Facebook and Twitter will be used as a Social Login/ Signup.
- User can provide feedback to vehicles.
- Users can comment.

## ERD( Entity Relationship Diagram)

ERD’s are the visual representation of database. There are three basic elements of ERD:

- Entity
- Attribute
- Relationship

### Conceptual

![conceptual_erd](erd/airbnb_for_car_data_models%20-%20conceptual.png)

<br/>

### Logical

![logical_erd](erd/airbnb_for_car_data_models%20-%20logical.png)

<br/>

### Physical

![physical_erd](erd/airbnb_for_car_data_models%20-%20Physical.png)

## Tables

- **Address Master:** It will contain all addresses related to user.

```tsql
CREATE TABLE [dbo].[address_master]
(
 [id] INT NOT NULL IDENTITY(0,1),
 address_line_one NVARCHAR(2000) NOT NULL,
 address_line_two NVARCHAR(1000) NULL,
 [city] NVARCHAR(200) NOT NULL,
 [state] NVARCHAR(200) NOT NULL,
 [country] NVARCHAR(200) NOT NULL,
 [zipcode] NVARCHAR(20) NOT NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL,
 updated_by NVARCHAR(200) NOT NULL,
 CONSTRAINT pk_address_master_id PRIMARY KEY(id)
)
```

- **User Address:** It will help us identifying the address related to user.

```tsql
CREATE TABLE [dbo].[user_address]
(
 [id] INT NOT NULL IDENTITY(0,1),
 [user_id] INT NOT NULL,
 address_id INT NOT NULL,
 is_active BIT NOT NULL DEFAULT 1,
 CONSTRAINT pk_user_address_id PRIMARY KEY(id),
 CONSTRAINT fk_user_address_user_id_user_master_id FOREIGN KEY([user_id]) REFERENCES user_master(id),
 CONSTRAINT fk_user_address_address_id_address_master_id FOREIGN KEY([address_id]) REFERENCES address_master(id)

 )
```

- **User App Access History:** It will store the information regarding user app access.

```tsql
CREATE TABLE [dbo].[user_app_access_history]
(
 [id] INT NOT NULL IDENTITY(0,1),
 [user_id] INT NOT NULL,
 latitude NVARCHAR(100) NULL,
 longitude NVARCHAR(100) NULL,
 logged_in_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 logged_out_time DATETIME NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 CONSTRAINT pk_user_app_access_history PRIMARY KEY (id),
 CONSTRAINT fk_user_app_access_history_user_id_user_master_id FOREIGN KEY ([user_id]) REFERENCES user_master(id)

)
```

- **User Master:** It will contain all users and their information.

```tsql
CREATE TABLE [dbo].[user_master]
(
 [id] INT NOT NULL IDENTITY(0,1),
 [name] NVARCHAR(200) NOT NULL,
 nickname NVARCHAR(100) NULL,
 photo_url NVARCHAR(1000) NULL,
 sex NVARCHAR(50) NOT NULL,
 dob NVARCHAR(12) NOT NULL,
 about NVARCHAR(1000) NULL,
 primary_phone NVARCHAR(30) NULL,
 secondray_phone NVARCHAR(30) NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 is_active BIT NOT NULL DEFAULT 0,
 CONSTRAINT pk_user_master_id PRIMARY KEY(id)
 )


```

- **User Social Accounts:** It will contain the different social account associated with user.

```tsql
CREATE TABLE [dbo].[user_social_accounts]
(
 [id] INT NOT NULL IDENTITY(0,1),
 [user_id] INT NOT NULL,
 social_account NVARCHAR(100) NOT NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 is_active BIT NOT NULL DEFAULT 1,
 CONSTRAINT pk_user_social_account_id PRIMARY KEY(id),
 CONSTRAINT check_social_account_values CHECK (social_account in ('NORMAL', 'GOOGLE', 'FACEBOOK', 'TWITTER')),
 CONSTRAINT fk_user_social_account_user_id_user_master_id FOREIGN KEY([user_id]) REFERENCES user_master(id)
)
```

- **Vehicle Master:** It will contain all vehicles listed by various owners.

```tsql
CREATE TABLE [dbo].[vehcile_master]
(
 [id] INT NOT NULL IDENTITY(0,1),
 [type] NVARCHAR(100) NOT NULL,
 main_image_url NVARCHAR(1000) NOT NULL,
 model NVARCHAR(200) NOT NULL,
 make NVARCHAR(200) NOT NULL,
 price_per_mile DECIMAL(10, 2) NOT NULL,
 vin NVARCHAR(200) NOT NULL,
 purchased_year INT NOT NULL,
 mileage INT NOT NULL,
 insured_by NVARCHAR(1000) NOT NULL,
 drivetrain NVARCHAR(200) NULL,
 fuel_capacity DECIMAL(6,2) NOT NULL,
 fuel_type NVARCHAR(100) NOT NULL,
 seating_capacity INT NOT NULL,
 additional_detail NVARCHAR(1000) NULL,
 ratings INT NOT NULL DEFAULT 0,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER ,
 updated_by NVARCHAR(200) NOT NULL  DEFAULT CURRENT_USER,
 is_active BIT NOT NULL DEFAULT 1,
 CONSTRAINT pk_vehcile_master_id PRIMARY KEY(id)
)
```

- **Vehicle Image:** It will contain the various images of vehicles listed by users.

```tsql
CREATE TABLE [dbo].[vehcile_image]
(
 [id] INT NOT NULL IDENTITY(0,1),
 [url] NVARCHAR(1000) NOT NULL,
 [desc] NVARCHAR(1000) NULL,
 vehcile_id INT NOT NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL,
 updated_by NVARCHAR(200) NOT NULL,
 CONSTRAINT pk_vehcile_image_id PRIMARY KEY(id),
 CONSTRAINT fk_vehcile_image_vehcile_id_vehcile_master_id FOREIGN KEY(vehcile_id) REFERENCES vehcile_master(id)

)
```

- **Vehicle Rent Contract:** It will contain the contract information between owner and renter.

```tsql
CREATE TABLE [dbo].[vehicle_rent_contract]
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
```

- **Vehicle Owner:** It will store the information regarding which vehicle is owned by which user.

```tsql
CREATE TABLE [dbo].[vehcile_owner]
(
 [id] INT NOT NULL IDENTITY(0,1),
 owner_id INT NOT NULL,
 vehcile_id INT NOT NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 updated_by NVARCHAR(200) NOT NULL DEFAULT CURRENT_USER,
 CONSTRAINT pk_vehcile_owner_id PRIMARY KEY(id),
 CONSTRAINT fk_vehcile_owner_owner_id_user_master_id FOREIGN KEY(owner_id) REFERENCES user_master(id),
 CONSTRAINT fk_vehcile_owner_vehcile_id_vehcile_master FOREIGN KEY(vehcile_id) REFERENCES vehcile_master(id)
)
```

- **Vehicle Service History:** It will contain the service history of vehicle.

```tsql
CREATE TABLE [dbo].[vehcile_service_history]
(
 [id] INT NOT NULL IDENTITY(0,1),
 vehcile_id INT NOT NULL,
 serviced_by NVARCHAR(1000) NULL,
 serviced_on NVARCHAR(15) NOT NULL,
 issue NVARCHAR(1000) NOT NULL,
 mileage INT NOT NULL,
 created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 created_by NVARCHAR(200) NOT NULL,
 updated_by NVARCHAR(200) NOT NULL,
 CONSTRAINT pk_vehcile_service_history_id PRIMARY KEY(id),
 CONSTRAINT fk_vehcile_service_history_vehcile_id_vehcile_master FOREIGN KEY (vehcile_id) REFERENCES vehcile_master(id)

)
```

- **Vehicle Rent History:** It will contain the information regarding different time each vehicle is renter, and how much miles are used and how much money is paid.

```tsql
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
```

- **Vehicle Rent Comment:** It will contain all comment added by parties involved in contract.

```tsql
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
```

- **Vehicle Rent Feedback:** It will contain all feedback provided by parties involved in contract.

```tsql
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
```

## Stored Procedure

- **Add Vehicles:** It will allow vehicle owner to list their vehicles.

```tsql
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
```

- **Create Vehicle Rent Contract:** It will allow renter to initiate a contract for rent with vehicle owner.

```tsql
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
```

- **Close Contract:** It will allow vehicle owner to close the vehicle rent contract after user has dropped off the vehicle.

```tsql
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

```

- **Add Comments:** It will allow parties involved in contract to comment.

```tsql
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
```

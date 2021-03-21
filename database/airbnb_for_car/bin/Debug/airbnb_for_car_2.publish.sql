﻿/*
Deployment script for airbnb_for_car

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "airbnb_for_car"
:setvar DefaultFilePrefix "airbnb_for_car"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehicle_rent_contract]...';


GO
ALTER TABLE [dbo].[vehicle_rent_contract] DROP CONSTRAINT [DF__vehicle_r__rent___151B244E];


GO
PRINT N'Dropping unnamed constraint on [dbo].[address_master]...';


GO
ALTER TABLE [dbo].[address_master] DROP CONSTRAINT [DF__address_m__creat__17036CC0];


GO
PRINT N'Dropping unnamed constraint on [dbo].[address_master]...';


GO
ALTER TABLE [dbo].[address_master] DROP CONSTRAINT [DF__address_m__updat__17F790F9];


GO
PRINT N'Dropping unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master] DROP CONSTRAINT [DF__unit_mast__creat__07C12930];


GO
PRINT N'Dropping unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master] DROP CONSTRAINT [DF__unit_mast__updat__08B54D69];


GO
PRINT N'Dropping unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master] DROP CONSTRAINT [DF__unit_mast__creat__09A971A2];


GO
PRINT N'Dropping unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master] DROP CONSTRAINT [DF__unit_mast__updat__0A9D95DB];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history] DROP CONSTRAINT [DF__user_app___logge__0B91BA14];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history] DROP CONSTRAINT [DF__user_app___creat__0C85DE4D];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history] DROP CONSTRAINT [DF__user_app___updat__0D7A0286];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history] DROP CONSTRAINT [DF__user_app___creat__0E6E26BF];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history] DROP CONSTRAINT [DF__user_app___updat__0F624AF8];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master] DROP CONSTRAINT [DF__tmp_ms_xx__creat__6FE99F9F];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master] DROP CONSTRAINT [DF__tmp_ms_xx__updat__70DDC3D8];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master] DROP CONSTRAINT [DF__tmp_ms_xx__creat__71D1E811];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master] DROP CONSTRAINT [DF__tmp_ms_xx__updat__72C60C4A];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts] DROP CONSTRAINT [DF__user_soci__creat__10566F31];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts] DROP CONSTRAINT [DF__user_soci__updat__114A936A];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts] DROP CONSTRAINT [DF__user_soci__creat__123EB7A3];


GO
PRINT N'Dropping unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts] DROP CONSTRAINT [DF__user_soci__updat__1332DBDC];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_image]...';


GO
ALTER TABLE [dbo].[vehcile_image] DROP CONSTRAINT [DF__vehcile_i__creat__18EBB532];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_image]...';


GO
ALTER TABLE [dbo].[vehcile_image] DROP CONSTRAINT [DF__vehcile_i__updat__19DFD96B];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_master]...';


GO
ALTER TABLE [dbo].[vehcile_master] DROP CONSTRAINT [DF__tmp_ms_xx__creat__778AC167];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_master]...';


GO
ALTER TABLE [dbo].[vehcile_master] DROP CONSTRAINT [DF__tmp_ms_xx__updat__787EE5A0];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_owner]...';


GO
ALTER TABLE [dbo].[vehcile_owner] DROP CONSTRAINT [DF__vehcile_o__creat__1AD3FDA4];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_owner]...';


GO
ALTER TABLE [dbo].[vehcile_owner] DROP CONSTRAINT [DF__vehcile_o__updat__1BC821DD];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_comments]...';


GO
ALTER TABLE [dbo].[vehcile_rent_comments] DROP CONSTRAINT [DF__vehcile_r__creat__1CBC4616];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_comments]...';


GO
ALTER TABLE [dbo].[vehcile_rent_comments] DROP CONSTRAINT [DF__vehcile_r__updat__1DB06A4F];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_feedback]...';


GO
ALTER TABLE [dbo].[vehcile_rent_feedback] DROP CONSTRAINT [DF__vehcile_r__creat__1EA48E88];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_feedback]...';


GO
ALTER TABLE [dbo].[vehcile_rent_feedback] DROP CONSTRAINT [DF__vehcile_r__updat__1F98B2C1];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history] DROP CONSTRAINT [DF__tmp_ms_xx__creat__7C4F7684];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history] DROP CONSTRAINT [DF__tmp_ms_xx__updat__7D439ABD];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history] DROP CONSTRAINT [DF__tmp_ms_xx__creat__7E37BEF6];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history] DROP CONSTRAINT [DF__tmp_ms_xx__updat__7F2BE32F];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_service_history]...';


GO
ALTER TABLE [dbo].[vehcile_service_history] DROP CONSTRAINT [DF__vehcile_s__creat__208CD6FA];


GO
PRINT N'Dropping unnamed constraint on [dbo].[vehcile_service_history]...';


GO
ALTER TABLE [dbo].[vehcile_service_history] DROP CONSTRAINT [DF__vehcile_s__updat__2180FB33];


GO
PRINT N'Dropping [dbo].[fk_vehcile_image_vehcile_id_vehcile_master_id]...';


GO
ALTER TABLE [dbo].[vehcile_image] DROP CONSTRAINT [fk_vehcile_image_vehcile_id_vehcile_master_id];


GO
PRINT N'Dropping [dbo].[check_social_account_values]...';


GO
ALTER TABLE [dbo].[user_social_accounts] DROP CONSTRAINT [check_social_account_values];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehicle_rent_contract]...';


GO
ALTER TABLE [dbo].[vehicle_rent_contract]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [rent_time];


GO
PRINT N'Creating unnamed constraint on [dbo].[address_master]...';


GO
ALTER TABLE [dbo].[address_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[address_master]...';


GO
ALTER TABLE [dbo].[address_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master]
    ADD DEFAULT CURRENT_USER FOR [created_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[unit_master]...';


GO
ALTER TABLE [dbo].[unit_master]
    ADD DEFAULT CURRENT_USER FOR [updated_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [logged_in_time];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history]
    ADD DEFAULT CURRENT_USER FOR [created_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_app_access_history]...';


GO
ALTER TABLE [dbo].[user_app_access_history]
    ADD DEFAULT CURRENT_USER FOR [updated_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master]
    ADD DEFAULT CURRENT_USER FOR [created_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master]
    ADD DEFAULT CURRENT_USER FOR [updated_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts]
    ADD DEFAULT CURRENT_USER FOR [created_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_social_accounts]...';


GO
ALTER TABLE [dbo].[user_social_accounts]
    ADD DEFAULT CURRENT_USER FOR [updated_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_image]...';


GO
ALTER TABLE [dbo].[vehcile_image]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_image]...';


GO
ALTER TABLE [dbo].[vehcile_image]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_master]...';


GO
ALTER TABLE [dbo].[vehcile_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_master]...';


GO
ALTER TABLE [dbo].[vehcile_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_owner]...';


GO
ALTER TABLE [dbo].[vehcile_owner]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_owner]...';


GO
ALTER TABLE [dbo].[vehcile_owner]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_comments]...';


GO
ALTER TABLE [dbo].[vehcile_rent_comments]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_comments]...';


GO
ALTER TABLE [dbo].[vehcile_rent_comments]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_feedback]...';


GO
ALTER TABLE [dbo].[vehcile_rent_feedback]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_feedback]...';


GO
ALTER TABLE [dbo].[vehcile_rent_feedback]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history]
    ADD DEFAULT CURRENT_USER FOR [created_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_rent_history]...';


GO
ALTER TABLE [dbo].[vehcile_rent_history]
    ADD DEFAULT CURRENT_USER FOR [updated_by];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_service_history]...';


GO
ALTER TABLE [dbo].[vehcile_service_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[vehcile_service_history]...';


GO
ALTER TABLE [dbo].[vehcile_service_history]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating [dbo].[fk_vehcile_image_vehcile_id_vehcile_master_id]...';


GO
ALTER TABLE [dbo].[vehcile_image] WITH NOCHECK
    ADD CONSTRAINT [fk_vehcile_image_vehcile_id_vehcile_master_id] FOREIGN KEY ([vehcile_id]) REFERENCES [dbo].[vehcile_master] ([id]);


GO
PRINT N'Creating [dbo].[check_social_account_values]...';


GO
ALTER TABLE [dbo].[user_social_accounts] WITH NOCHECK
    ADD CONSTRAINT [check_social_account_values] CHECK (social_account in ('NORMAL', 'GOOGLE', 'FACEBOOK', 'TWITTER'));


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[vehcile_image] WITH CHECK CHECK CONSTRAINT [fk_vehcile_image_vehcile_id_vehcile_master_id];

ALTER TABLE [dbo].[user_social_accounts] WITH CHECK CHECK CONSTRAINT [check_social_account_values];


GO
PRINT N'Update complete.';


GO
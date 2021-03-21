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

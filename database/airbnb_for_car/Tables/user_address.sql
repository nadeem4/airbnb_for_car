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

-- public.currencies definition

-- Drop table

-- DROP TABLE public.currencies;

CREATE TABLE public.currencies (
	currency_id serial4 NOT NULL,
	currency_code varchar(10) NOT NULL,
	currency_name varchar(255) NOT NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT currencies_pkey PRIMARY KEY (currency_id)
);


-- public.emojis definition

-- Drop table

-- DROP TABLE public.emojis;

CREATE TABLE public.emojis (
	emoji_id serial4 NOT NULL,
	emoji_symbol varchar(10) NOT NULL,
	emoji_description varchar(255) NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT emojis_pkey PRIMARY KEY (emoji_id)
);


-- public.notification_types definition

-- Drop table

-- DROP TABLE public.notification_types;

CREATE TABLE public.notification_types (
	notification_type_id serial4 NOT NULL,
	type_name varchar(255) NOT NULL,
	description varchar(255) NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT notification_types_pkey PRIMARY KEY (notification_type_id),
	CONSTRAINT notification_types_type_name_key UNIQUE (type_name)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	user_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	pin numeric(4) NOT NULL,
	profile_picture varchar(255) NULL,
	quotes varchar(255) NULL,
	oauth_provider bool DEFAULT false NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT users_email_key UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (user_id)
);


-- public.notifications definition

-- Drop table

-- DROP TABLE public.notifications;

CREATE TABLE public.notifications (
	notification_id serial4 NOT NULL,
	user_id int4 NULL,
	notification_type_id int4 NULL,
	notification_message text NOT NULL,
	is_read bool DEFAULT false NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT notifications_pkey PRIMARY KEY (notification_id),
	CONSTRAINT notifications_notification_type_id_fkey FOREIGN KEY (notification_type_id) REFERENCES public.notification_types(notification_type_id),
	CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.wallets definition

-- Drop table

-- DROP TABLE public.wallets;

CREATE TABLE public.wallets (
	wallet_id serial4 NOT NULL,
	user_id int4 NULL,
	currency_id int4 NULL,
	wallet_name varchar(255) NOT NULL,
	wallet_amount numeric(12, 2) NOT NULL,
	is_used bool DEFAULT false NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT wallets_pkey PRIMARY KEY (wallet_id),
	CONSTRAINT wallets_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currencies(currency_id),
	CONSTRAINT wallets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.goals definition

-- Drop table

-- DROP TABLE public.goals;

CREATE TABLE public.goals (
	goal_id serial4 NOT NULL,
	wallet_id int4 NULL,
	goal_name varchar(255) NOT NULL,
	goal_amount numeric(12, 2) NOT NULL,
	goal_current_amount numeric(12, 2) DEFAULT 0 NULL,
	goal_description varchar(255) NULL,
	goal_attachment varchar(255) NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT goals_pkey PRIMARY KEY (goal_id),
	CONSTRAINT goals_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.wallets(wallet_id)
);


-- public.pockets definition

-- Drop table

-- DROP TABLE public.pockets;

CREATE TABLE public.pockets (
	pocket_id serial4 NOT NULL,
	wallet_id int4 NULL,
	emoji_id int4 NULL,
	budget_name varchar(255) NOT NULL,
	budget_amount numeric(12, 2) NOT NULL,
	budget_current_amount numeric(12, 2) DEFAULT 0 NULL,
	budget_description varchar(255) NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT pockets_pkey PRIMARY KEY (pocket_id),
	CONSTRAINT pockets_emoji_id_fkey FOREIGN KEY (emoji_id) REFERENCES public.emojis(emoji_id),
	CONSTRAINT pockets_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.wallets(wallet_id)
);


-- public.money_records definition

-- Drop table

-- DROP TABLE public.money_records;

CREATE TABLE public.money_records (
	money_record_id serial4 NOT NULL,
	pocket_id int4 NULL,
	goal_id int4 NULL,
	record_name varchar(255) NOT NULL,
	record_type varchar(255) NOT NULL,
	transaction_date timestamptz NOT NULL,
	transaction_amount numeric(12, 2) NOT NULL,
	record_description varchar(255) NULL,
	record_attachment varchar(255) NULL,
	deleted_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT money_records_pkey PRIMARY KEY (money_record_id),
	CONSTRAINT money_records_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES public.goals(goal_id),
	CONSTRAINT money_records_pocket_id_fkey FOREIGN KEY (pocket_id) REFERENCES public.pockets(pocket_id)
);


CREATE TABLE steam (
	appid int4 NOT NULL,
	"name" varchar(255) NULL,
	release_date date NULL,
	english bool NULL,
	developer varchar NULL,
	publisher varchar NULL,
	platforms varchar(255) NULL,
	required_age int4 NULL,
	categories varchar NULL,
	genres varchar NULL,
	steamspy_tags varchar(255) NULL,
	achievements int4 NULL,
	positive_ratings int4 NULL,
	negative_ratings int4 NULL,
	average_playtime int4 NULL,
	median_playtime int4 NULL,
	owners varchar(100) NULL,
	price float8 NULL,
	CONSTRAINT pk_steam PRIMARY KEY (appid)
);

CREATE TABLE description (
	steam_appid int4 NULL,
	detailed_description varchar NULL,
	about_the_game varchar NULL,
	short_descripion varchar NULL
);


CREATE TABLE media (
	steam_appid int4 NULL,
	header_imege varchar NULL,
	screenshots varchar NULL,
	background varchar NULL,
	movies varchar NULL
);


CREATE TABLE popularity (
	gamename varchar(255) NULL,
	"year" int4 NULL,
	"month" varchar(100) NULL,
	avg float8 NULL,
	gain float8 NULL,
	peak int4 NULL,
	avg_peak_perc varchar(255) NULL
);

alter table description add FOREIGN KEY (steam_appid) references steam (appid);

alter table media add FOREIGN KEY (steam_appid) references steam (appid);



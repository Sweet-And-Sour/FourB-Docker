DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`username`	varchar(20)	NOT NULL DEFAULT "",
	`password`	varchar(50)	NOT NULL DEFAULT "",
	`email`	varchar(200)	NOT NULL DEFAULT "",
	`avatar`	varchar(200)	NOT NULL DEFAULT "/api/static/default_avatar.jpeg",
	`background`	varchar(200)	NOT NULL DEFAULT "/api/static/default_background.jpeg",
	`introduction`	varchar(200)	NOT NULL DEFAULT "",
	`created_datetime`	datetime	NOT NULL DEFAULT (current_timestamp),
	`site`	varchar(100)	NOT NULL DEFAULT "",
	`friends`	json	NOT NULL DEFAULT ("{}"),
	`field`	varchar(100) NOT NULL DEFAULT "",
	`type` varchar(20) NOT NULL DEFAULT "USER",   /* "USER", "TEAM" */
	UNIQUE (username)
);

DROP TABLE IF EXISTS `Contents`;

CREATE TABLE `Contents` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	int	NOT NULL,
	`title`	varchar(100) NOT NULL DEFAULT "",
	`contents`	text	NOT NULL DEFAULT "",
	`created_datetime`	datetime NOT	NULL DEFAULT (current_timestamp),
	`last_updated_datetime`	datetime	NOT NULL DEFAULT (current_timestamp),
	`like`	int	NOT NULL DEFAULT 0,
	`unlike`	int	NOT NULL DEFAULT 0,
	`category`	varchar(100)	NOT NULL DEFAULT "",
	`tags`	json	NOT NULL DEFAULT ("{}"),
	`thumbnail` varchar(200) NOT NULL DEFAULT "/api/static/noimage.png",
	FOREIGN KEY (user_id) REFERENCES Users(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

DROP TABLE IF EXISTS `Comments`;

CREATE TABLE `Comments` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	int	NOT NULL,
	`content_id`	int	NOT NULL,
	`contents`	text	NOT NULL,
	`created_datetime`	datetime	NULL DEFAULT (current_timestamp),
	FOREIGN KEY (user_id) REFERENCES Users(id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (content_id) REFERENCES Contents(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

DROP TABLE IF EXISTS `Files`;

CREATE TABLE `Files` (
	`hash_id`	varchar(100)	NOT NULL PRIMARY KEY,
	`originalname`	varchar(100)	NULL,
	`filename`	varchar(100)	NULL,
	`mime`	varchar(100)	NULL
);

DROP TABLE IF EXISTS `Teams`;

CREATE TABLE `Teams` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`contents`	text	NULL,
	`introduction`	varchar(200)	NULL
);

DROP TABLE IF EXISTS `TeamMembers`;

CREATE TABLE `TeamMembers` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`team_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	FOREIGN KEY (team_id) REFERENCES Users(id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (user_id) REFERENCES Users(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

DROP TABLE IF EXISTS `Tags`;

CREATE TABLE `Tags` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name`	varchar(100)	NOT NULL
);

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`name`	varchar(100)	NOT NULL,
	`thumbnail` varchar(200) NOT NULL DEFAULT "/api/static/noimage.png"
);

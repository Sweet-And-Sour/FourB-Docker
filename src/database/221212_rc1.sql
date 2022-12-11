﻿DROP TABLE IF EXISTS `Users`;

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
	`field`	varchar(100)NOT NULL DEFAULT ""
);

DROP TABLE IF EXISTS `Contents`;

CREATE TABLE `Contents` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	int	NULL,
	`team_id`	int	NULL,
	`title`	varchar(100) NOT NULL DEFAULT "",
	`contents`	text	NOT NULL DEFAULT "",
	`created_datetime`	datetime NOT	NULL DEFAULT (current_timestamp),
	`last_updated_datetime`	datetime	NOT NULL DEFAULT (current_timestamp),
	`like`	int	NOT NULL DEFAULT 0,
	`unlike`	int	NOT NULL DEFAULT 0,
	`category`	varchar(100)	NOT NULL DEFAULT "",
	`tags`	json	NOT NULL DEFAULT ("{}"),
	`thumbnail` varchar(200) NOT NULL DEFAULT "/api/static/noimage.png"
);

DROP TABLE IF EXISTS `Comments`;

CREATE TABLE `Comments` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	int	NOT NULL,
	`content_id`	int	NOT NULL,
	`contents`	text	NULL,
	`created_datetime`	datetime	NULL,
	`last_updated_datetime`	datetime	NULL
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
	`team_id`	int	NOT NULL,
	`id`	int	NOT NULL
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

ALTER TABLE `TeamMembers` ADD CONSTRAINT `FK_Teams_TO_TeamMembers_1` FOREIGN KEY (
	`team_id`
)
REFERENCES `Teams` (
	`id`
);

ALTER TABLE `TeamMembers` ADD CONSTRAINT `FK_Users_TO_TeamMembers_1` FOREIGN KEY (
	`id`
)
REFERENCES `Users` (
	`id`
);


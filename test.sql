DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`username`	varchar(20)	NULL,
	`password`	varchar(12)	NULL,
	`email`	varchar(30)	NULL,
	`avatar`	varchar(100)	NULL,
	`introduction`	varchar(200)	NULL,
	`created_datetime`	datetime	NULL,
	`site`	varchar(100)	NULL,
	`friends`	json	NULL,
	`field`	varchar(100)	NULL
);

DROP TABLE IF EXISTS `Contents`;

CREATE TABLE `Contents` (
	`id`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_id`	int	NULL,
	`team_id`	int	NULL,
	`title`	varchar(100)	NULL,
	`contents`	text	NULL,
	`created_datetime`	datetime	NULL,
	`last_updated_datetime`	datetime	NULL,
	`like`	int	NULL,
	`unlike`	int	NULL,
	`category`	varchar(100)	NULL,
	`tags`	json	NULL
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
	`files`	json	NULL,
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
	`name`	varchar(100)	NOT NULL
);

ALTER TABLE `Users` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
	`id`
);

ALTER TABLE `Contents` ADD CONSTRAINT `PK_CONTENTS` PRIMARY KEY (
	`id`
);

ALTER TABLE `Comments` ADD CONSTRAINT `PK_COMMENTS` PRIMARY KEY (
	`id`
);

ALTER TABLE `Files` ADD CONSTRAINT `PK_FILES` PRIMARY KEY (
	`hash_id`
);

ALTER TABLE `Teams` ADD CONSTRAINT `PK_TEAMS` PRIMARY KEY (
	`id`
);

ALTER TABLE `TeamMembers` ADD CONSTRAINT `PK_TEAMMEMBERS` PRIMARY KEY (
	`team_id`,
	`id`
);

ALTER TABLE `Tags` ADD CONSTRAINT `PK_TAGS` PRIMARY KEY (
	`id`
);

ALTER TABLE `Categories` ADD CONSTRAINT `PK_CATEGORIES` PRIMARY KEY (
	`id`
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


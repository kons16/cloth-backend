CREATE DATABASE IF NOT EXISTS `ict-db-test`;
USE `ict-db-test`;

CREATE TABLE IF NOT EXISTS users(
	`id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`submit_id` VARCHAR(255) NOT NULL,
	`year` INT NOT NULL,
	`sex` INT NOT NULL,
	`password_hash` VARCHAR(255) NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS clothes(
	`id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`price` BIGINT NOT NULL,
    `image_url` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS user_clothes(
	`id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`user_id` BIGINT,
	`cloth_id` BIGINT,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
	FOREIGN KEY (`cloth_id`) REFERENCES `clothes` (`id`) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cordinates(
	`id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL,
	`top_cloth_id` BIGINT,
	`pant_cloth_id` BIGINT,
	`user_id` BIGINT,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;


/*  服の初期データ  */
INSERT INTO clothes (id, name, price, image_url, type) VALUES (101, "T-shirt-S", "1500", "no_url", "a");
INSERT INTO clothes (id, name, price, image_url, type) VALUES (102, "T-shirt-M", "2000", "no_url", "a");

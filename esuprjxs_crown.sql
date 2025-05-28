-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.38 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET NAMES utf8 */
;
/*!50503 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

-- Dumping database structure for esuprjxs_crown
CREATE DATABASE IF NOT EXISTS `esuprjxs_crown` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `esuprjxs_crown`;

-- Dumping structure for table esuprjxs_crown.affiliate_links
CREATE TABLE IF NOT EXISTS `affiliate_links` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `raffle_ticket_id` bigint unsigned NOT NULL,
    `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `affiliate_links_raffle_ticket_id_foreign` (`raffle_ticket_id`),
    CONSTRAINT `affiliate_links_raffle_ticket_id_foreign` FOREIGN KEY (`raffle_ticket_id`) REFERENCES `raffle_tickets` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_links: ~1 rows (approximately)
INSERT IGNORE INTO
    `affiliate_links` (
        `id`,
        `user_id`,
        `raffle_ticket_id`,
        `link`,
        `created_at`,
        `updated_at`
    )
VALUES (
        5,
        2,
        1,
        'http://127.0.0.1:8000/track/hellotracking/P-60B170?redirect=http%3A%2F%2F127.0.0.1%3A8000%2Fproduct-details%2FP-60B170',
        '2024-11-26 18:55:17',
        '2024-11-26 18:55:17'
    );

-- Dumping structure for table esuprjxs_crown.affiliate_product
CREATE TABLE IF NOT EXISTS `affiliate_product` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL,
    `affiliate_link_id` bigint unsigned NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `affiliate_product_product_id_foreign` (`product_id`),
    KEY `affiliate_product_affiliate_link_id_foreign` (`affiliate_link_id`),
    CONSTRAINT `affiliate_product_affiliate_link_id_foreign` FOREIGN KEY (`affiliate_link_id`) REFERENCES `affiliate_links` (`id`) ON DELETE CASCADE,
    CONSTRAINT `affiliate_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_product: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.affiliate_referrals
CREATE TABLE IF NOT EXISTS `affiliate_referrals` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `raffle_ticket_id` bigint unsigned NOT NULL,
    `product_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `views_count` int NOT NULL DEFAULT '0',
    `referral_count` int NOT NULL DEFAULT '0',
    `product_price` decimal(10, 2) NOT NULL DEFAULT '0.00',
    `affiliate_commission` decimal(10, 2) NOT NULL DEFAULT '0.00',
    `total_affiliate_price` decimal(15, 2) NOT NULL DEFAULT '0.00',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `affiliate_referrals_user_id_foreign` (`user_id`),
    KEY `affiliate_referrals_raffle_ticket_id_foreign` (`raffle_ticket_id`),
    CONSTRAINT `affiliate_referrals_raffle_ticket_id_foreign` FOREIGN KEY (`raffle_ticket_id`) REFERENCES `raffle_tickets` (`id`) ON DELETE CASCADE,
    CONSTRAINT `affiliate_referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `affiliate_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_referrals: ~1 rows (approximately)
INSERT IGNORE INTO
    `affiliate_referrals` (
        `id`,
        `user_id`,
        `raffle_ticket_id`,
        `product_url`,
        `views_count`,
        `referral_count`,
        `product_price`,
        `affiliate_commission`,
        `total_affiliate_price`,
        `created_at`,
        `updated_at`
    )
VALUES (
        4,
        2,
        1,
        'http://127.0.0.1:8000/product-details/P-60B170',
        4,
        2,
        4500.00,
        2250.00,
        2250.00,
        '2024-11-26 18:55:17',
        '2024-11-27 05:44:26'
    );

-- Dumping structure for table esuprjxs_crown.affiliate_rules
CREATE TABLE IF NOT EXISTS `affiliate_rules` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `rule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_rules: ~1 rows (approximately)
INSERT IGNORE INTO
    `affiliate_rules` (
        `id`,
        `rule`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        'Commission Structure: Defines how affiliates are paid, either per sale, per lead, or per click, and specifies the payment rate (percentage or flat fee).',
        '2024-11-11 22:37:23',
        '2024-11-11 22:37:23'
    );

-- Dumping structure for table esuprjxs_crown.affiliate_users
CREATE TABLE IF NOT EXISTS `affiliate_users` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `DOB` date NOT NULL,
    `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `NIC` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `contactno` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `promotion_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
    `instagram_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `tiktok_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `youtube_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `content_website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `content_whatsapp_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `affiliate_users_email_unique` (`email`),
    CONSTRAINT `affiliate_users_chk_1` CHECK (
        json_valid(`promotion_method`)
    )
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_users: ~2 rows (approximately)
INSERT IGNORE INTO
    `affiliate_users` (
        `id`,
        `name`,
        `address`,
        `district`,
        `DOB`,
        `gender`,
        `NIC`,
        `contactno`,
        `email`,
        `password`,
        `promotion_method`,
        `instagram_url`,
        `facebook_url`,
        `tiktok_url`,
        `youtube_url`,
        `content_website_url`,
        `content_whatsapp_url`,
        `bank_name`,
        `branch`,
        `account_name`,
        `account_number`,
        `status`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        'Manushi Weerasinghe',
        'No.124, "Sisilasa"',
        'Kurunegala',
        '2000-08-19',
        'female',
        '200073203633',
        '0716280393',
        'manuw2819@gmail.com',
        '$2y$12$rUIrl.eUkDiqB7vm0QX7/.1NdM2UmfutRc5Ka7DCz8Pc4kErWPeoe',
        '"[\\"Instagram\\",\\"Facebook\\",\\"TikTok\\",\\"YouTube\\",\\"Content website\\\\\\/blog\\",\\"WhatsApp\\"]"',
        'https://www.instagram.com/manushi',
        'https://www.facebook.com/manushi',
        'https://www.titok.com/manushi',
        'https://www.youtube.com/manushi',
        'https://www.website.com/manushi',
        'https://www.whatsapp.com/manushi',
        'BOC',
        'Ridigama',
        'KGRSM Weerasinghe',
        '8465232656',
        'approved',
        '2024-11-11 22:40:12',
        '2024-11-11 22:45:46'
    ),
    (
        2,
        'k.a.kavidu malshan kulathunga',
        'f/16,delpathdeniya',
        'kegalle',
        '1999-07-21',
        'male',
        '199920302235',
        '0719707612',
        'admin@dkmart.lk',
        '$2y$12$3FkW7JE89xPHQTzVT93LWOHS1GupCv4aURH3R6Vxd.kC2/.Q6DjAq',
        '"[\\"YouTube\\"]"',
        NULL,
        NULL,
        NULL,
        'https://www.youtube.com/watch?v=BYQHcxE7g24',
        NULL,
        NULL,
        'sampath',
        'galigamuwa',
        'kavidu malshan',
        '25226987',
        'approved',
        '2024-11-19 05:53:08',
        '2024-11-26 18:56:37'
    );

-- Dumping structure for table esuprjxs_crown.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `location_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `apartment_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `total_floors` int DEFAULT NULL,
    `total_units` int DEFAULT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `amenities` text COLLATE utf8mb4_unicode_ci,
    `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
    `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `apartments_chk_1` CHECK (json_valid(`images`))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.apartments: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.bank_details
CREATE TABLE IF NOT EXISTS `bank_details` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_holder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `whatsapp_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.bank_details: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.banners
CREATE TABLE IF NOT EXISTS `banners` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.banners: ~3 rows (approximately)
INSERT IGNORE INTO
    `banners` (
        `id`,
        `image`,
        `created_at`,
        `updated_at`
    )
VALUES (
        12,
        'banners/nI0jZg4pYIBWXmUi10UDoQUNXkNqlFDFU9szPIt5.png',
        '2025-05-08 08:03:41',
        '2025-05-08 08:03:41'
    ),
    (
        13,
        'banners/PkPnmosYvSFpxoxAWawy5PVThjhNNDh0vsaYpK9b.png',
        '2025-05-08 08:03:50',
        '2025-05-08 08:03:50'
    ),
    (
        14,
        'banners/uqlOaBCxkjUA5NMGQRnsJb55f95A4JV22a9LEnOr.jpg',
        '2025-05-08 10:51:45',
        '2025-05-08 10:51:45'
    );

-- Dumping structure for table esuprjxs_crown.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `customer_id` bigint unsigned NOT NULL,
    `room_id` bigint unsigned NOT NULL,
    `booking_date` date NOT NULL,
    `start_date` date NOT NULL,
    `end_date` date NOT NULL,
    `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `booking_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `service_charge` decimal(8, 2) DEFAULT '0.00',
    `total_cost` decimal(10, 2) NOT NULL,
    `discount_applied` decimal(8, 2) DEFAULT '0.00',
    `booking_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `confirmation_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `bookings_customer_id_foreign` (`customer_id`),
    KEY `bookings_room_id_foreign` (`room_id`),
    CONSTRAINT `bookings_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_register` (`id`) ON DELETE CASCADE,
    CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.bookings: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.brands
CREATE TABLE IF NOT EXISTS `brands` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `is_top_brand` tinyint(1) DEFAULT '0',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping data for table esuprjxs_crown.brands: ~5 rows (approximately)
INSERT IGNORE INTO
    `brands` (
        `id`,
        `name`,
        `image`,
        `slug`,
        `is_top_brand`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        'LG',
        'brands/Hqdu6dflxfeIavAGEGl8XFRZ7ZH7lGh4AEqBy9sE.svg',
        'lg',
        1,
        '2025-05-16 02:52:01',
        '2025-05-16 02:52:01'
    ),
    (
        2,
        'HP',
        'brands/FOiWC5VFOi3SlA0bJKTyMDCO7Saqo8rDoGlxY5yj.png',
        'hp',
        1,
        '2025-05-16 03:01:47',
        '2025-05-16 03:01:47'
    ),
    (
        3,
        'HARMAS',
        'brands/o3mZJcVC5A6oWYTywjGZNSJ3nNWHK6mm7mePj6KJ.png',
        'harmas',
        0,
        '2025-05-16 03:02:19',
        '2025-05-16 03:02:19'
    ),
    (
        4,
        'Apple',
        'brands/94UhNezXAlKEp52hGpG0I6yDWvG1w7efiMyekpgS.png',
        'apple',
        1,
        '2025-05-16 03:04:00',
        '2025-05-16 03:04:00'
    ),
    (
        5,
        'Abans',
        'brands/F6sPf6hiNCT5ol0loL6kr41MdFhUhP5gueFgSJM6.png',
        'abans',
        1,
        '2025-05-16 03:04:45',
        '2025-05-16 03:04:45'
    );

-- Dumping structure for table esuprjxs_crown.cache
CREATE TABLE IF NOT EXISTS `cache` (
    `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `expiration` int NOT NULL,
    PRIMARY KEY (`key`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.cache: ~7 rows (approximately)
INSERT IGNORE INTO
    `cache` (`key`, `value`, `expiration`)
VALUES (
        'admin@example.com|112.134.226.211',
        'i:1;',
        1746774616
    ),
    (
        'admin@example.com|112.134.226.211:timer',
        'i:1746774616;',
        1746774616
    ),
    (
        'admin@example.com|127.0.0.1',
        'i:1;',
        1745421709
    ),
    (
        'admin@example.com|127.0.0.1:timer',
        'i:1745421709;',
        1745421709
    ),
    (
        'cart_count_7',
        'i:2;',
        1745943974
    ),
    (
        'manulakavishka7@gmail.com|127.0.0.1',
        'i:1;',
        1747392623
    ),
    (
        'manulakavishka7@gmail.com|127.0.0.1:timer',
        'i:1747392623;',
        1747392623
    );

-- Dumping structure for table esuprjxs_crown.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
    `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `expiration` int NOT NULL,
    PRIMARY KEY (`key`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.cache_locks: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `quantity` int NOT NULL DEFAULT '1',
    `price` decimal(10, 2) NOT NULL,
    `subtotal` decimal(10, 2) NOT NULL,
    `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cart_items_user_id_foreign` (`user_id`),
    KEY `cart_items_product_id_foreign` (`product_id`),
    CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
    CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 42 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.cart_items: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.categories
CREATE TABLE IF NOT EXISTS `categories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.categories: ~7 rows (approximately)
INSERT IGNORE INTO
    `categories` (
        `id`,
        `name`,
        `created_at`,
        `updated_at`
    )
VALUES (
        18,
        'TV',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        19,
        'Audio & Video',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        20,
        'Home Appliances',
        '2025-05-08 11:52:19',
        '2025-05-08 11:52:19'
    ),
    (
        21,
        'Mobile Phones & Devices',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        22,
        'Apple',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        23,
        'Computers',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        24,
        'Kitchen Appliances',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    );

-- Dumping structure for table esuprjxs_crown.company_details
CREATE TABLE IF NOT EXISTS `company_details` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `location` text COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.company_details: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.company_settings
CREATE TABLE IF NOT EXISTS `company_settings` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `footer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.company_settings: ~1 rows (approximately)
INSERT IGNORE INTO
    `company_settings` (
        `id`,
        `title`,
        `address`,
        `email`,
        `contact`,
        `website`,
        `footer_text`,
        `logo`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        'CROWN ELECTRONICS',
        'No. 38, 2nd Lane,  Rubber Watte Road,  Gangodawila, Nugegoda, Sri Lanka.',
        'dkmart@gmail.com',
        '+94 112 251 202',
        'CROWN ELECTRONICS',
        NULL,
        'storage/logo/1746454046.png',
        '2024-10-30 18:07:56',
        '2025-05-05 08:37:26'
    );

-- Dumping structure for table esuprjxs_crown.customer_orders
CREATE TABLE IF NOT EXISTS `customer_orders` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id` bigint unsigned NOT NULL,
    `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `house_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `apartment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `date` date NOT NULL,
    `total_cost` decimal(15, 2) NOT NULL,
    `status` enum(
        'Pending',
        'Accepted',
        'Packed',
        'Pickup Done',
        'Ready to Ship',
        'Shipped',
        'In Transit',
        'Customer Unavailable',
        'Rescheduled',
        'Delivered',
        'Cancelled',
        'Returned'
    ) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
    `activity_logs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
    `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `customer_orders_order_code_unique` (`order_code`),
    KEY `customer_orders_user_id_foreign` (`user_id`),
    CONSTRAINT `customer_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `customer_orders_chk_1` CHECK (json_valid(`activity_logs`))
) ENGINE = InnoDB AUTO_INCREMENT = 39 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.customer_orders: ~6 rows (approximately)
INSERT IGNORE INTO
    `customer_orders` (
        `id`,
        `order_code`,
        `user_id`,
        `customer_name`,
        `phone`,
        `email`,
        `house_no`,
        `apartment`,
        `city`,
        `postal_code`,
        `date`,
        `total_cost`,
        `status`,
        `activity_logs`,
        `payment_method`,
        `payment_status`,
        `created_at`,
        `updated_at`
    )
VALUES (
        33,
        'ORD-HMOWQ7JL',
        3,
        'k.a.kavidu malshan kulathunga',
        '0719707610',
        'freelyricshub@gmail.com',
        'f/16,delpathdeniya',
        NULL,
        'galigamuwa',
        '71350',
        '2024-11-27',
        4800.00,
        'Packed',
        '[{"timestamp":"2024-11-27 01:18:05","message":"Order accepted by the vendor."},{"timestamp":"2024-11-27 01:19:17","message":"Order packed by the vendor."}]',
        'COD',
        'Pending',
        '2024-11-26 19:39:41',
        '2024-11-26 19:49:17'
    ),
    (
        34,
        'ORD-J64XRM0S',
        6,
        'Anuradha ;mkkkmmk',
        '0783302448',
        'batmananuradha@gmail.com',
        '164/08/16, Kannadiwaththa, Bomugammana, Divulapitiya',
        ';mkmk',
        'gampaha',
        '11250',
        '2025-04-23',
        1300.00,
        'Pending',
        NULL,
        NULL,
        'Pending',
        '2025-04-23 01:01:21',
        '2025-04-23 01:01:21'
    ),
    (
        35,
        'ORD-FPZ1SOLI',
        7,
        'Anuradha Sampath',
        '0783302448',
        'anuradhasampath64@gmail.com',
        '164/08/16, Kannadiwaththa,',
        'Bomugammana, Divulapitiya',
        'gampaha',
        '11250',
        '2025-04-27',
        100300.00,
        'Pending',
        NULL,
        'COD',
        'Pending',
        '2025-04-27 02:59:29',
        '2025-04-27 03:00:10'
    ),
    (
        36,
        'ORD-TRDIBOIB',
        7,
        'Anuradha Sampath',
        '0783302448',
        'anuradhasampath64@gmail.com',
        '164/08/16, Kannadiwaththa,',
        'Bomugammana, Divulapitiya',
        'gampaha',
        '11250',
        '2025-04-27',
        2200.00,
        'Pending',
        NULL,
        NULL,
        'Pending',
        '2025-04-27 05:42:48',
        '2025-04-27 05:42:48'
    ),
    (
        37,
        'ORD-IABXMDYE',
        7,
        'Anuradha Sampath',
        '0783302448',
        'anuradhasampath64@gmail.com',
        '164/08/16, Kannadiwaththa,',
        'Bomugammana, Divulapitiya',
        'gampaha',
        '11250',
        '2025-05-02',
        18800.00,
        'Pending',
        NULL,
        NULL,
        'Pending',
        '2025-05-01 22:12:08',
        '2025-05-01 22:12:08'
    ),
    (
        38,
        'ORD-30R1X6NJ',
        7,
        'Anuradha Sampath',
        '0783302448',
        'anuradhasampath64@gmail.com',
        '164/08/16, Kannadiwaththa,',
        'Bomugammana, Divulapitiya',
        'gampaha',
        '11250',
        '2025-05-02',
        1300.00,
        'Pending',
        NULL,
        NULL,
        'Pending',
        '2025-05-01 22:18:39',
        '2025-05-01 22:18:39'
    );

-- Dumping structure for table esuprjxs_crown.customer_order_items
CREATE TABLE IF NOT EXISTS `customer_order_items` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `quantity` int NOT NULL,
    `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `cost` decimal(10, 2) NOT NULL,
    `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `reviewed` enum('yes', 'no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `customer_order_items_id_unique` (`id`),
    KEY `customer_order_items_product_id_foreign` (`product_id`),
    CONSTRAINT `customer_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.customer_order_items: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.customer_register
CREATE TABLE IF NOT EXISTS `customer_register` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `whatsapp_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `note` text COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `customer_register_email_unique` (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.customer_register: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.departments
CREATE TABLE IF NOT EXISTS `departments` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.departments: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.floors
CREATE TABLE IF NOT EXISTS `floors` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `apartment_id` bigint unsigned NOT NULL,
    `floor_number` int NOT NULL,
    `total_rooms` int DEFAULT NULL,
    `occupied_rooms` int NOT NULL DEFAULT '0',
    `floor_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
    `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `floors_apartment_id_foreign` (`apartment_id`),
    CONSTRAINT `floors_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE,
    CONSTRAINT `floors_chk_1` CHECK (json_valid(`images`))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.floors: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.inquiries
CREATE TABLE IF NOT EXISTS `inquiries` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `message` text COLLATE utf8mb4_unicode_ci,
    `reply` text COLLATE utf8mb4_unicode_ci,
    `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not replied',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.inquiries: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `attempts` tinyint unsigned NOT NULL,
    `reserved_at` int unsigned DEFAULT NULL,
    `available_at` int unsigned NOT NULL,
    `created_at` int unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `jobs_queue_index` (`queue`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.jobs: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
    `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `total_jobs` int NOT NULL,
    `pending_jobs` int NOT NULL,
    `failed_jobs` int NOT NULL,
    `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `options` mediumtext COLLATE utf8mb4_unicode_ci,
    `cancelled_at` int DEFAULT NULL,
    `created_at` int NOT NULL,
    `finished_at` int DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.job_batches: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `batch` int NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 69 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.migrations: ~55 rows (approximately)
INSERT IGNORE INTO
    `migrations` (`id`, `migration`, `batch`)
VALUES (
        1,
        '0001_01_01_000000_create_users_table',
        1
    ),
    (
        2,
        '0001_01_01_000001_create_cache_table',
        1
    ),
    (
        3,
        '0001_01_01_000002_create_jobs_table',
        1
    ),
    (
        4,
        '2024_10_25_044750_create_categories_table',
        1
    ),
    (
        5,
        '2024_10_25_044750_create_subcategories_table',
        1
    ),
    (
        6,
        '2024_10_25_045713_create_sub_subcategories_table',
        1
    ),
    (
        7,
        '2024_10_25_081517_create_products_table',
        1
    ),
    (
        8,
        '2024_10_25_081523_create_product_images_table',
        1
    ),
    (
        9,
        '2024_10_29_071017_create_system_users_table',
        1
    ),
    (
        10,
        '2024_10_30_063932_create_company_settings_table',
        1
    ),
    (
        11,
        '2024_10_30_081431_create_variations_table',
        1
    ),
    (
        15,
        '2024_11_07_050041_create_cart_items_table',
        2
    ),
    (
        20,
        '2024_11_07_090702_create_customer_orders_table',
        3
    ),
    (
        21,
        '2024_11_07_090751_create_customer_order_items_table',
        3
    ),
    (
        22,
        '2024_11_11_050757_create_affiliate_rules_table',
        4
    ),
    (
        23,
        '2024_11_06_081844_create_affiliate_users_table',
        5
    ),
    (
        24,
        '2024_11_06_084900_create_raffle_tickets_table',
        5
    ),
    (
        25,
        '2024_11_10_003001_create_affiliate_links_table',
        5
    ),
    (
        26,
        '2024_11_10_010945_create_affiliate_referrals_table',
        5
    ),
    (
        27,
        '2024_11_10_011657_create_affiliate_product_table',
        5
    ),
    (
        28,
        '2024_11_10_040931_create_payment_requests_table',
        5
    ),
    (
        29,
        '2024_11_10_045623_create_affiliate_rules_table',
        5
    ),
    (
        32,
        '2024_11_12_054225_create_wishlists_table',
        6
    ),
    (
        37,
        '2024_11_18_051105_update_products_table',
        7
    ),
    (
        38,
        '2024_11_19_042214_create_vendors_table',
        8
    ),
    (
        39,
        '2024_11_19_061623_create_shops_table',
        8
    ),
    (
        40,
        '2024_11_19_072256_add_foreign_key_to_shop_id_in_products_table',
        8
    ),
    (
        41,
        '2024_11_20_103945_create_vendor_wallets_table',
        9
    ),
    (
        42,
        '2024_11_21_045740_create_vendor_payment_requests_table',
        9
    ),
    (
        43,
        '2024_11_21_055055_add_profile_and_bank_details_to_vendors_table',
        9
    ),
    (
        44,
        '2024_11_22_102543_update_status_in_customer_orders_table',
        10
    ),
    (
        45,
        '2024_11_25_043842_add_activity_logs_to_customer_orders_table',
        11
    ),
    (
        46,
        '2024_11_21_084729_create_reviews_table',
        12
    ),
    (
        47,
        '2024_11_21_095412_add_reviewer_id_to_reviews_table',
        12
    ),
    (
        48,
        '2024_11_21_161333_add_profile_image_to_users_table',
        13
    ),
    (
        49,
        '2024_11_26_100954_add_gender_to_users_table',
        14
    ),
    (
        50,
        '2024_10_28_082501_create_apartments_table',
        15
    ),
    (
        51,
        '2024_10_28_082645_create_floors_table',
        15
    ),
    (
        52,
        '2024_10_28_083310_create_room_types_table',
        15
    ),
    (
        53,
        '2024_10_28_083927_create_rooms_table',
        15
    ),
    (
        54,
        '2024_10_29_090338_create_departments_table',
        15
    ),
    (
        55,
        '2024_10_29_090403_create_positions_table',
        15
    ),
    (
        56,
        '2024_10_29_090545_create_staff_table',
        15
    ),
    (
        57,
        '2024_10_29_115807_add_apartment_id_to_rooms_table',
        15
    ),
    (
        58,
        '2024_10_31_054542_create_customer_registers_table',
        15
    ),
    (
        59,
        '2024_11_05_055052_create_bookings_table',
        15
    ),
    (
        60,
        '2024_11_06_035923_create_orders_table',
        15
    ),
    (
        61,
        '2024_11_06_100453_create_payments_table',
        15
    ),
    (
        62,
        '2024_11_06_192215_add_total_room_charge_to_payments_table',
        15
    ),
    (
        63,
        '2024_11_13_044927_create_company_details_table',
        15
    ),
    (
        64,
        '2024_11_13_065559_create_bank_details_table',
        15
    ),
    (
        65,
        '2025_02_14_042721_create_personal_access_tokens_table',
        16
    ),
    (
        66,
        '2025_03_10_071113_create_inquiries_table',
        16
    ),
    (
        67,
        '2025_05_05_150817_create_sliders_table',
        16
    ),
    (
        68,
        '2025_05_05_152806_create_banners_table',
        17
    );

-- Dumping structure for table esuprjxs_crown.orders
CREATE TABLE IF NOT EXISTS `orders` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `customer_id` bigint unsigned NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `bookingType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `roomSelection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `startDate` date NOT NULL,
    `endDate` date NOT NULL,
    `paymentTerms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `paymentMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `discount` decimal(8, 2) DEFAULT NULL,
    `serviceCharge` decimal(8, 2) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `orders_customer_id_foreign` (`customer_id`),
    CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.orders: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.payments
CREATE TABLE IF NOT EXISTS `payments` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `booking_id` bigint unsigned NOT NULL,
    `total_room_charge` decimal(8, 2) NOT NULL,
    `total_amount` decimal(8, 2) NOT NULL DEFAULT '0.00',
    `paid_amount` decimal(8, 2) NOT NULL DEFAULT '0.00',
    `due_amount` decimal(8, 2) NOT NULL DEFAULT '0.00',
    `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `payment_date` date NOT NULL,
    `service_charge_applied` tinyint(1) NOT NULL DEFAULT '0',
    `advance_payment` tinyint(1) NOT NULL DEFAULT '0',
    `refundable_amount` decimal(8, 2) NOT NULL DEFAULT '0.00',
    `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `bank_transfer_confirmation` tinyint(1) NOT NULL DEFAULT '0',
    `transfer_slip_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `discounted_total` decimal(8, 2) NOT NULL DEFAULT '0.00',
    `partial_payment` tinyint(1) NOT NULL DEFAULT '0',
    `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `payments_booking_id_foreign` (`booking_id`),
    CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.payments: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.payment_requests
CREATE TABLE IF NOT EXISTS `payment_requests` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `withdraw_amount` decimal(10, 2) NOT NULL,
    `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `processing_fee` decimal(10, 2) NOT NULL DEFAULT '0.00',
    `paid_amount` decimal(10, 2) NOT NULL DEFAULT '0.00',
    `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
    `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.payment_requests: ~1 rows (approximately)
INSERT IGNORE INTO
    `payment_requests` (
        `id`,
        `user_id`,
        `withdraw_amount`,
        `bank_name`,
        `branch`,
        `account_name`,
        `account_number`,
        `processing_fee`,
        `paid_amount`,
        `status`,
        `requested_at`,
        `created_at`,
        `updated_at`
    )
VALUES (
        2,
        2,
        1500.00,
        'sampath',
        'galigamuwa',
        'kavidu malshan',
        '25226987',
        100.00,
        1400.00,
        'Completed',
        '2024-11-26 19:40:38',
        '2024-11-26 19:40:38',
        '2024-11-26 19:42:27'
    );

-- Dumping structure for table esuprjxs_crown.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `tokenable_id` bigint unsigned NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    `abilities` text COLLATE utf8mb4_unicode_ci,
    `last_used_at` timestamp NULL DEFAULT NULL,
    `expires_at` timestamp NULL DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
    KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (
        `tokenable_type`,
        `tokenable_id`
    )
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.positions
CREATE TABLE IF NOT EXISTS `positions` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.positions: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.products
CREATE TABLE IF NOT EXISTS `products` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `shop_id` bigint unsigned DEFAULT NULL,
    `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `product_description` text COLLATE utf8mb4_unicode_ci,
    `category_id` bigint unsigned NOT NULL,
    `brand_id` bigint unsigned DEFAULT NULL,
    `subcategory_id` bigint unsigned DEFAULT NULL,
    `sub_subcategory_id` bigint unsigned DEFAULT NULL,
    `quantity` int DEFAULT NULL,
    `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `normal_price` decimal(15, 2) NOT NULL,
    `regular_price` decimal(15, 2) DEFAULT NULL,
    `is_affiliate` tinyint(1) NOT NULL DEFAULT '0',
    `affiliate_price` decimal(15, 2) DEFAULT NULL,
    `commission_percentage` decimal(5, 2) DEFAULT NULL,
    `commission_price` decimal(15, 2) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `products_product_id_unique` (`product_id`),
    KEY `products_category_id_foreign` (`category_id`),
    KEY `products_subcategory_id_foreign` (`subcategory_id`),
    KEY `products_sub_subcategory_id_foreign` (`sub_subcategory_id`),
    KEY `products_shop_id_foreign` (`shop_id`),
    KEY `fk_products_brands1_idx` (`brand_id`),
    CONSTRAINT `fk_products_brands1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
    CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
    CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
    CONSTRAINT `products_sub_subcategory_id_foreign` FOREIGN KEY (`sub_subcategory_id`) REFERENCES `sub_subcategories` (`id`) ON DELETE SET NULL,
    CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 147 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.products: ~104 rows (approximately)
INSERT IGNORE INTO
    `products` (
        `id`,
        `product_id`,
        `shop_id`,
        `product_name`,
        `product_description`,
        `category_id`,
        `brand_id`,
        `subcategory_id`,
        `sub_subcategory_id`,
        `quantity`,
        `tags`,
        `normal_price`,
        `regular_price`,
        `is_affiliate`,
        `affiliate_price`,
        `commission_percentage`,
        `commission_price`,
        `created_at`,
        `updated_at`
    )
VALUES (
        41,
        'P-A96DE6',
        NULL,
        'JBL PartyBox Club 120 Speaker',
        'The JBL PartyBox Club 120 turns any space to party, and vibe. Powerful JBL Pro Sound fills the air while an entrancing lightshow of starry lights, cool light trails, and strobe effects syncs to your beat. Instantly pair any Bluetooth device and stream your favorite party playlist, or use the mic and guitar inputs to share your own sound. Either way, you can steer the party\'s flow with fun interactive party effects using the JBL PartyBox app. A folding ergonomic handle makes the PartyBox Club 120 easy to take with you anywhere, and the splash-proof construction means it won\'t be troubled by a little rain. It delivers up to 12 hours of playtimeâ€”and if the party\'s still flowing by then, just swap out the replaceable battery and keep the music and lights going strong. For an even bigger time, stereo pair two JBL PartyBox Club 120s for a wider soundstage, or use the JBL PartyBox app to connect multiple JBL Auracast-enabled speakers wirelessly. Roll up to the party with the JBL PartyBox Club 120.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Top Selling',
        169999.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        42,
        'P-312425',
        NULL,
        'JBL PartyBox Stage 320 Speaker',
        'Bring your party anywhere with the JBL PartyBox Stage 320, you can get the party started anytime, anywhere. Transform any space, inside or outdoors, into a dance floor. Powerful JBL Pro Sound and big thumping bass fill a wide soundstage and get the crowd moving, while their eyes are delighted by an adaptive lightshow of swirling starry lights, cool light trails, and amazing strobe effects synced to your beat. Use the mic and guitar inputs to show off your stage presence. You can steer the party\'s flow throughout the night with fun interactive party effects. The solid telescopic handle and wide, sturdy wheels mean you can roll the JBL PartyBox Stage 320 just about anywhere, and once you\'re there, the splash-proof construction means a little rain won\'t ruin the fun. Best of all, it delivers up to 18 hours of playtimeâ€”and if the good times are still rolling, just swap out the replaceable battery and keep going. For an even bigger party, it\'s easy to connect or use the JBL PartyBox app to connect multiple JBL Auracast-enabled speakers wirelessly. Bring people together and elevate the experience with the JBL PartyBox Stage 320.',
        19,
        NULL,
        60,
        NULL,
        999,
        'Top Selling',
        249999.00,
        1.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:24:51',
        '2025-05-09 13:24:51'
    ),
    (
        43,
        'P-650599',
        NULL,
        'Abans Vipe Nitro Portable Speaker - Black',
        'The Abans Vipe Nitro Portable Speaker (NITRO X7) offers powerful sound in a compact design, perfect for music lovers on the go. Featuring advanced Bluetooth connectivity, it allows seamless pairing with your devices. Its sleek and durable construction ensures long-lasting performance, while the built-in rechargeable battery provides extended playback time. Ideal for both indoor and outdoor use, the NITRO X7 delivers rich bass and clear highs, enhancing your listening experience wherever you are.',
        19,
        5,
        60,
        NULL,
        998,
        'Top Selling',
        119999.00,
        99999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:27:50',
        '2025-05-16 03:07:32'
    ),
    (
        44,
        'P-760E70',
        NULL,
        'Abans Portable Audio Speaker (Red)',
        'The Abans Portable Audio Speaker - A644RÃ‚ is a compact and dynamic speaker designed to deliver high-quality sound in a portable package. Featuring Bluetooth connectivity, it allows for wireless streaming from your devices with ease. The speaker includes a built-in rechargeable battery for extended playtime, making it convenient for both indoor and outdoor use. With its modern design, intuitive controls, and impressive audio performance, the A644R offers a versatile and enjoyable listening experience wherever you choose to use it.',
        19,
        5,
        60,
        NULL,
        999,
        'Below',
        3998.00,
        4999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:43:19',
        '2025-05-09 13:43:19'
    ),
    (
        45,
        'P-6BF8C1',
        NULL,
        'Abans Portable Audio Speaker',
        'The Abans Portable Audio Speaker - AZ1 is a compact yet powerful speaker designed for superior audio performance and portability. Featuring Bluetooth connectivity, it enables seamless wireless streaming from your devices. The speaker is equipped with a built-in rechargeable battery for extended playtime, making it suitable for both indoor and outdoor use. With its sleek design, user-friendly controls, and impressive sound quality, the AZ1 ensures a delightful listening experience wherever you choose to enjoy your music.',
        19,
        5,
        60,
        NULL,
        1000,
        'Top Selling',
        34998.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:45:26',
        '2025-05-09 13:45:26'
    ),
    (
        46,
        'P-3043CD',
        NULL,
        'Abans Portable Audio Speaker (Green)',
        'The Abans Portable Audio Speaker - A644G is a compact and dynamic speaker designed to deliver high-quality sound in a portable package. Featuring Bluetooth connectivity, it allows for wireless streaming from your devices with ease. The speaker includes a built-in rechargeable battery for extended playtime, making it convenient for both indoor and outdoor use. With its modern design, intuitive controls, and impressive audio performance, the A644R offers a versatile and enjoyable listening experience wherever you choose to use it.',
        19,
        5,
        60,
        NULL,
        1000,
        'Below',
        3998.00,
        4999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:48:35',
        '2025-05-09 13:49:24'
    ),
    (
        47,
        'P-D90CBC',
        NULL,
        'Abans Portable Audio Speaker (Black)',
        'The Abans Portable Audio Speaker - A644B is a compact and dynamic speaker designed to deliver high-quality sound in a portable package. Featuring Bluetooth connectivity, it allows for wireless streaming from your devices with ease. The speaker includes a built-in rechargeable battery for extended playtime, making it convenient for both indoor and outdoor use. With its modern design, intuitive controls, and impressive audio performance, the A644R offers a versatile and enjoyable listening experience wherever you choose to use it.',
        19,
        5,
        60,
        NULL,
        1000,
        'Below',
        3998.00,
        4999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:51:09',
        '2025-05-09 13:51:09'
    ),
    (
        48,
        'P-8F07C7',
        NULL,
        'Abans Portable Audio Speaker',
        'The Abans Portable Audio Speaker - A641G is a high-performance speaker designed for superior sound quality and portability. Featuring Bluetooth connectivity, it enables seamless wireless streaming from your devices. The speaker boasts a built-in rechargeable battery for extended playtime, making it perfect for both indoor and outdoor use. Its sleek design, combined with easy-to-use controls and powerful audio output, ensures an exceptional listening experience wherever you go.',
        19,
        5,
        60,
        NULL,
        1000,
        'Below',
        5999.00,
        6999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:52:40',
        '2025-05-09 13:52:40'
    ),
    (
        49,
        'P-869A11',
        NULL,
        'Abans Portable Audio Speaker',
        'The Abans Portable Audio Speaker - A641B is a high-performance speaker designed for superior sound quality and portability. Featuring Bluetooth connectivity, it enables seamless wireless streaming from your devices. The speaker boasts a built-in rechargeable battery for extended playtime, making it perfect for both indoor and outdoor use. Its sleek design, combined with easy-to-use controls and powerful audio output, ensures an exceptional listening experience wherever you go.',
        19,
        5,
        60,
        NULL,
        1000,
        'Below',
        5997.00,
        6999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:57:28',
        '2025-05-09 13:57:28'
    ),
    (
        50,
        'P-443ED4',
        NULL,
        'Abans Portable Audio Speaker',
        'The Abans Portable Audio Speaker - A641A is a high-performance speaker designed for superior sound quality and portability. Featuring Bluetooth connectivity, it enables seamless wireless streaming from your devices. The speaker boasts a built-in rechargeable battery for extended playtime, making it perfect for both indoor and outdoor use. Its sleek design, combined with easy-to-use controls and powerful audio output, ensures an exceptional listening experience wherever you go.',
        19,
        5,
        60,
        NULL,
        1000,
        'Below',
        5999.00,
        6999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 13:59:32',
        '2025-05-09 13:59:32'
    ),
    (
        51,
        'P-77746F',
        NULL,
        'Abans Portable Audio Speaker (Squad)',
        'The Abans Portable Audio Speaker - A417CM is a sleek and powerful speaker designed for superior sound quality and portability. Featuring Bluetooth connectivity, it allows effortless wireless streaming from your devices. The built-in rechargeable battery ensures long-lasting playtime, making it perfect for both indoor and outdoor use. With its modern design, user-friendly controls, and robust audio performance, the A417CM delivers an exceptional listening experience wherever you go.',
        19,
        5,
        60,
        NULL,
        1000,
        'Top Selling',
        12999.00,
        16999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:01:59',
        '2025-05-09 14:01:59'
    ),
    (
        52,
        'P-65ED9C',
        NULL,
        'Abans Portable Audio Speaker (Black)',
        'The Abans Portable Audio Speaker - A417B is a stylish and versatile speaker designed for high-quality sound on the go. With Bluetooth connectivity, it offers seamless wireless streaming from your devices. The speaker features a built-in rechargeable battery for extended playtime, making it ideal for both indoor and outdoor use. Its sleek design, coupled with easy-to-use controls and robust audio performance, ensures an enhanced listening experience wherever you are.',
        19,
        5,
        60,
        NULL,
        1000,
        'Top Selling',
        12998.00,
        16999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:03:50',
        '2025-05-09 14:03:50'
    ),
    (
        53,
        'P-F60CAB',
        NULL,
        'Abans Portable Audio Speaker (Black)',
        'The Abans Portable Audio Speaker - A352B is a compact and versatile speaker designed for exceptional audio performance on the go. Featuring Bluetooth connectivity, it allows seamless wireless music streaming from your devices. The speaker is equipped with a built-in rechargeable battery for extended playtime, making it perfect for both indoor and outdoor use. With its sleek design and easy-to-use controls, the A352B delivers clear sound and reliable performance, enhancing your listening experience wherever you are.',
        19,
        NULL,
        60,
        NULL,
        999,
        'Below',
        2999.00,
        3499.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:07:59',
        '2025-05-09 14:07:59'
    ),
    (
        54,
        'P-9C0EC4',
        NULL,
        'Abans Portable Audio Speaker (Red)',
        'The Abans Portable Audio Speaker - A352R is a compact and versatile speaker designed for exceptional audio performance on the go. Featuring Bluetooth connectivity, it allows seamless wireless music streaming from your devices. The speaker is equipped with a built-in rechargeable battery for extended playtime, making it perfect for both indoor and outdoor use. With its sleek design and easy-to-use controls, the A352B delivers clear sound and reliable performance, enhancing your listening experience wherever you are.',
        19,
        NULL,
        60,
        NULL,
        1000,
        NULL,
        2999.00,
        3499.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:11:37',
        '2025-05-09 14:11:37'
    ),
    (
        55,
        'P-2D37CB',
        NULL,
        'Abans Portable Party Speaker System',
        'The Abans Portable Party Speaker System - AB-600 combines portability with powerful audio performance, ideal for any party or gathering. Featuring Bluetooth connectivity, LED lighting effects, and a rechargeable battery, this speaker system offers convenience and versatility. Enjoy rich sound quality and deep bass, with intuitive controls and multiple input options for seamless music playback from various devices. Perfect for indoor and outdoor use, the AB-600 ensures a lively and immersive entertainment experience wherever you take it.',
        19,
        NULL,
        60,
        NULL,
        998,
        'Top Selling',
        29999.00,
        35999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:14:42',
        '2025-05-09 14:14:42'
    ),
    (
        56,
        'P-24265E',
        NULL,
        'Abans Party Speaker System (AB-828)',
        'The Abans Party Speaker System is the ultimate audio solution for any celebration, offering powerful sound, Bluetooth connectivity, and vibrant LED lighting. This speaker system is designed for portability and includes a rechargeable battery, multiple input options, and user-friendly controls, making it perfect for parties, outdoor events, and gatherings. Enjoy dynamic audio and deep bass, ensuring an unforgettable entertainment experience wherever you go.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Online Exclusive',
        59999.00,
        66999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:17:38',
        '2025-05-09 14:19:13'
    ),
    (
        57,
        'P-C86C3D',
        NULL,
        'Abans Party Speaker System (AB-602)',
        'The Abans Portable Party Speaker System - AB-602 is a versatile and powerful audio solution designed to elevate your entertainment experience. Featuring Bluetooth connectivity, vibrant LED lighting, and a rechargeable battery, this portable speaker system delivers dynamic sound and impressive bass, making it perfect for parties, outdoor gatherings, and events. With user-friendly controls and multiple input options, the AB-602 ensures seamless music playback from various devices, providing hours of enjoyment wherever you go.',
        19,
        NULL,
        60,
        NULL,
        1001,
        'Top Selling',
        39999.00,
        42999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:21:16',
        '2025-05-09 14:21:16'
    ),
    (
        58,
        'P-967CA1',
        NULL,
        'Abans Portable Party Speaker System - (AB-X5)',
        'The Abans Portable Party Speaker System - AB-X5 is a versatile and powerful audio solution designed to elevate your entertainment experience. Featuring Bluetooth connectivity, vibrant LED lighting, and a rechargeable battery, this portable speaker system delivers dynamic sound and impressive bass, making it perfect for parties, outdoor gatherings, and events. With user-friendly controls and multiple input options, the AB-X5 ensures seamless music playback from various devices, providing hours of enjoyment wherever you go.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Top Selling',
        64997.00,
        72999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:23:37',
        '2025-05-09 14:23:37'
    ),
    (
        59,
        'P-2E53C9',
        NULL,
        'Abans Portable Party Speaker System - AB-X3',
        'Introducing the Abans Portable Party Speaker System, your ultimate companion for every occasion. With its sleek design and powerful sound, this speaker system is perfect for indoor gatherings, outdoor parties, or just enjoying your favorite music at home.The built-in rechargeable battery ensures hours of non-stop entertainment wherever you go. With its impressive audio performance and convenient portability, the Abans Portable Party Speaker System is sure to elevate your music experience to the next level.\r\n\r\n \r\nPowerful Sound:\r\nEquipped with high-quality drivers, the AB-X3 ensures a rich and immersive audio experience, making it ideal for parties, events, or casual gatherings.\r\n\r\n \r\n\r\nPortable Design:\r\nLightweight and easy to carry, this speaker includes a convenient handle, allowing for effortless transportation.\r\n\r\n \r\n\r\nMultiple Connectivity Options:\r\nConnect via Bluetooth, USB, AUX, or SD card, ensuring compatibility with various devices, from smartphones to laptops.\r\n\r\n \r\n\r\nLED Light Show:\r\nEnhance the party atmosphere with dynamic LED lights that sync with the music, adding a visual element to your audio experience.\r\n\r\n \r\n\r\nLong Battery Life:\r\nEnjoy uninterrupted music playback with a long-lasting battery, making it perfect for outdoor use without the need for constant charging.\r\n\r\n \r\n\r\nUser-Friendly Controls:\r\nSimple buttons and knobs make it easy to adjust volume, change tracks, and switch modes, ensuring a hassle-free experience.\r\n\r\n \r\n\r\nWhether you\'re hosting a backyard barbecue, a beach party, or just hanging out with friends, the Abans AB-X3 Portable Party Speaker System is your go-to companion for an unforgettable audio experience.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Top Selling',
        49999.00,
        59999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:25:38',
        '2025-05-09 14:25:38'
    ),
    (
        60,
        'P-1AC13B',
        NULL,
        'LG XBOOM Speaker',
        'Deeper bass and clearer vocals are made possible with Bass Blast+. It features advanced EQ for perfect, customized sound.',
        19,
        1,
        60,
        NULL,
        1000,
        'Top Selling',
        31999.00,
        36999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:29:37',
        '2025-05-09 14:29:37'
    ),
    (
        61,
        'P-642A2A',
        NULL,
        'JBL Charge 5 - Squad',
        'Take the amazing power of JBL Pro Sound with you. The JBL Charge 5 has an optimized long excursion driver, a separate tweeter, and dual JBL bass radiators, all delivering impressively rich and clear audio. Get that big room sound, even when outdoors.',
        19,
        NULL,
        60,
        NULL,
        998,
        'Top Selling',
        59999.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:34:14',
        '2025-05-09 14:34:14'
    ),
    (
        62,
        'P-0DCE4F',
        NULL,
        'JBL Charge 5 - Red',
        'Take the amazing power of JBL Pro Sound with you. The JBL Charge 5 has an optimized long excursion driver, a separate tweeter, and dual JBL bass radiators, all delivering impressively rich and clear audio. Get that big room sound, even when outdoors.The fun doesn\'t have to stop. Packed with an incredible 20 hours of battery life, JBL Charge 5 lets you party all day and into the night.\r\nTo the pool. To the park. JBL Charge 5 is IP67 waterproof and dustproof, so you can bring your speaker anywhere.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Top Selling',
        59999.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        63,
        'P-005BFA',
        NULL,
        'Joyroom MC5 Handheld Microphone with Speaker - Green',
        'Multifunctional button design, joyful to singing the songs with the handled wireless microphone.\r\n\r\nOne-button voice-changing function, free to switch the modes between the four kinds of magic sound.\r\n\r\nBT 5.0, stable and fast connection, portable wireless design.\r\n\r\none-button silencing function, fast to change the original songs into anechoic accompaniment music.\r\n\r\n52mm full frequency neodymium magnet speaker with the vibrating diaphragm, happy to feel the pure and deep stereo sound.\r\n\r\nProfessional karaoke sound effect, independent debugging type, immerse yourself into the quality microphone sound.\r\n\r\nLight and easy to use, a better choice for children and old people.\r\n\r\nLarge capacity battery, long battery life, up to 8h usage time.\r\n\r\nWide compatibility, it can compatible with smartphones, tablet computers and other systems that support mainstream Karaoke software.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Below',
        9060.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:40:16',
        '2025-05-09 14:40:16'
    ),
    (
        64,
        'P-4A69CE',
        NULL,
        'Joyroom MC5 Handheld Microphone with Speaker - Blue',
        'Multifunctional button design, joyful to singing the songs with the handled wireless microphone.\r\n\r\nOne-button voice-changing function, free to switch the modes between the four kinds of magic sound.\r\n\r\nBT 5.0, stable and fast connection, portable wireless design.\r\n\r\none-button silencing function, fast to change the original songs into anechoic accompaniment music.\r\n\r\n52mm full frequency neodymium magnet speaker with the vibrating diaphragm, happy to feel the pure and deep stereo sound.\r\n\r\nProfessional karaoke sound effect, independent debugging type, immerse yourself into the quality microphone sound.\r\n\r\nLight and easy to use, a better choice for children and old people.\r\n\r\nLarge capacity battery, long battery life, up to 8h usage time.\r\n\r\nWide compatibility, it can compatible with smartphones, tablet computers and other systems that support mainstream Karaoke software.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Below',
        9060.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:45:24',
        '2025-05-09 14:45:24'
    ),
    (
        65,
        'P-72BFFE',
        NULL,
        'Abans Portable Battery Speaker - RM-500',
        '1CH DSPÃ‚  SPEAKER SYSTEM\r\n\r\nBLUETOOTH PLAYER\r\n\r\nTWS\r\n\r\nLINE IN INPUT\r\n\r\nUSB PLAYER\r\n\r\nFM TUNER\r\n\r\nDIGITAL KARAOKE\r\n\r\nCIRCLE LIGHT\r\n\r\nLED DISPLAY\r\n\r\nMUSIC EQ\r\n\r\nBUILT-IN BATTERY',
        19,
        NULL,
        60,
        NULL,
        998,
        'Below',
        49998.00,
        52999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:48:07',
        '2025-05-09 14:48:07'
    ),
    (
        66,
        'P-BACDD2',
        NULL,
        'PHILIPS Portable Bluetooth Speaker - TAS5505',
        'Bluetooth\r\n\r\n20 W Output Power\r\n\r\n12 hours play time\r\nThis speaker looks great wherever you place it. Embossed buttons let you control playback, Bluetooth, and more. The built-in mic lets you take hands-free calls, and you can thread a carrying strap through the speaker\'s lanyard hole.\r\nGo from working session to dinner party with ease. You get 12 hours play time from a single charge, and the wireless range is 20 m. Charging the speaker takes 3.5 hours, via the included USB-C cable.\r\nPlay it loud. Pair for stereo\r\nA passive radiator delivers strong bass. The sound from the 3.15" full-range driver stays clear even at high volume. Want to make your music sound even bigger? Pair with an identical speaker for stereo sound.\r\n\r\nKvadrat speaker fabric. Designed to let the sound through\r\nThis speaker is covered with a premium speaker fabric created by high-end manufacturer Kvadrat. The beautiful wool-blend material is acoustically transparent, allowing the sound to flow freely from the speaker into the room.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Below',
        46173.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:50:51',
        '2025-05-09 14:50:51'
    ),
    (
        67,
        'P-E8B5FB',
        NULL,
        'Abans Portable Speaker - RM-550',
        'Abans Portable Speaker\r\n\r\nA compact and versatile audio device that delivers powerful sound on the go. Designed for music enthusiasts, this portable speaker offers impressive audio performance, convenient connectivity options, and a sleek design. Whether you\'re at home, outdoors, or on a travel adventure, the ABANS Portable Speaker - RM-550 ensures an immersive and enjoyable audio experience.\r\n\r\nFUNCTIONS:\r\n\r\nSPEAKER SYSTEM\r\n\r\nWOODEN CABINET\r\n\r\nBLUETOOTH PLAYER\r\n\r\nFM\r\n\r\nTWS\r\n\r\nLINE IN INPUT\r\n\r\nUSB PLAYER\r\n\r\nOPTICAL INPUT\r\n\r\nCOAXIAL INPUT\r\n\r\nKARAOKE SYSTEM\r\n\r\nMUSIC EQ',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Below',
        39999.00,
        44999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:52:14',
        '2025-05-09 14:52:14'
    ),
    (
        68,
        'P-7E3C3B',
        NULL,
        'Abans Portable Speaker - RM-828',
        'Abans Portable Speaker - RM-828',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Below',
        40998.00,
        47998.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 14:56:55',
        '2025-05-09 14:56:55'
    ),
    (
        69,
        'P-E4879B',
        NULL,
        'Abans Portable Battery Speaker',
        'Abans Portable Battery Speaker - T-2',
        19,
        NULL,
        60,
        NULL,
        998,
        'Below',
        4298.00,
        4899.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 15:02:38',
        '2025-05-09 15:02:38'
    ),
    (
        70,
        'P-3DF10D',
        NULL,
        'ABANS Portable Speaker - RM-636',
        'Abans Portable Speaker - RM-636',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Below',
        21000.00,
        22999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 15:05:39',
        '2025-05-09 15:05:39'
    ),
    (
        71,
        'P-91D581',
        NULL,
        'JBL Charge 5 - Blue',
        'Take the party with you no matter what the weather. The JBL Charge 5 speaker delivers bold JBL Original Pro Sound, with its optimized long excursion driver, separate tweeter and dual pumping JBL bass radiators. Up to 20 hours of playtime and a handy powerbank to keep your devices charged to keep the party going all night. Rain? Spilled drinks? Beach sand? The IP67 waterproof and dustproof Charge 5 survives whatever comes its way. Thanks to PartyBoost, you can connect multiple JBL PartyBoost-enabled speakers for a sound big enough for any crowd. With all-new colors inspired by the latest street fashion trends, it looks as great as it sounds.\r\n\r\nBold JBL Original Pro Sound\r\nTake the amazing power of JBL Pro Sound with you. The JBL Charge 5 has an optimized long excursion driver, a separate tweeter, and dual JBL bass radiators, all delivering impressively rich and clear audio. Get that big room sound, even when outdoors.\r\n\r\n20 hours of playtime\r\nThe fun doesn\'t have to stop. Packed with an incredible 20 hours of battery life, JBL Charge 5 lets you party all day and into the night.\r\nIP67 waterproof and dustproof\r\nTo the pool. To the park. JBL Charge 5 is IP67 waterproof and dustproof, so you can bring your speaker anywhere. \r\n\r\nWireless Bluetooth Streaming\r\nWirelessly connect up to 2 smartphones or tablets to the speaker and take turns enjoying JBL Pro sound. \r\n\r\nCrank up the fun with PartyBoost\r\nPartyBoost allows you to pair two JBL PartyBoost-compatible speakers together for stereo sound or link multiple JBL PartyBoost-compatible speakers to truly pump up your party. \r\n\r\nPower up with the built-in powerbank\r\nDon\'t put the party on pause. A built-in powerbank lets you charge your devices without taking a break from the tunes.',
        19,
        NULL,
        60,
        NULL,
        1000,
        'Top Selling',
        59999.00,
        0.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:04:25',
        '2025-05-09 20:04:25'
    ),
    (
        72,
        'P-961D01',
        NULL,
        'JBL Live Pro 2 True Wireless Earbuds - Silver',
        '-',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        44998.00,
        54999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        73,
        'P-C1ED94',
        NULL,
        'JBL Live Pro 2 TWS In-Ear Bluetooth Headphones',
        '-',
        19,
        NULL,
        61,
        NULL,
        999,
        'Top Selling',
        44998.00,
        54999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:21:00',
        '2025-05-09 20:21:00'
    ),
    (
        74,
        'P-D65B16',
        NULL,
        'JBL Tune Beam Earbuds - Blue',
        '-',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        29998.00,
        39998.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:23:25',
        '2025-05-09 20:23:25'
    ),
    (
        75,
        'P-D9D80D',
        NULL,
        'JBL Tune Buds 2 True Wireless Earbuds - Blue',
        '-',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        32998.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:29:33',
        '2025-05-09 20:29:33'
    ),
    (
        76,
        'P-2C7274',
        NULL,
        'JBL Tune Buds 2 Earbuds',
        'JBL Tune Buds 2 Earbuds\r\nTake on your day one song at a time with JBL Tune Buds 2 true wireless earbuds and Adaptive Noise Cancelling. They deliver up to 48 hours of exceptional JBL Pure Bass Sound and JBL Spatial Sound, while the ergonomic (and water and dust resistant) design gives you all-day comfort in any weather. Enjoy perfect-sounding calls without ambient noise, all managed using intuitive touch controls. With Adaptive Noise Cancelling and Smart Ambient technology, you can tune out the world, or choose how much you engage with your surroundings. You can even personalize your sound experience with the JBL Headphones app and tailor audio around you with Personi-Fi 3.0. Pop in the JBL Tune Buds 2 and experience your world your way.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        32999.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:32:02',
        '2025-05-09 20:32:02'
    ),
    (
        77,
        'P-2E6DD5',
        NULL,
        'JBL Wave Buds True Wireless Earbuds',
        'Quality sound just got easierâ€”and more fun. JBL Wave Buds 2 earbuds feature exciting JBL Pure Bass Sound, plus Active Noise Cancelling and Smart Ambient technology so you decide how much of the outside world you want to hear. Manage hands-free crisp, clear calls with just a tap on the earbuds. Use the JBL Headphones app to customize your sound and Voice Prompts language. Connect seamlessly with up to 8 Bluetooth devices and switch effortlessly from one to another. And with up to 40 hours of playback time, theyâ€™re a great everyday sound companion.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        24999.00,
        29999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        78,
        'P-539924',
        NULL,
        'JBL Tune 310C USB',
        'Introducing JBL Tune 310C USB-C in-ear headphones. Theyâ€™re lightweight, comfortable and compact. A pair of 9mm dynamic drivers punch out powerful JBL Pure Bass Sound, while the High-Resolution Audio support ensures great sound quality. A USB-C connection makes them compatible with a large variety of devices like PCs, mobiles, and gaming devices. In addition, the three-button remote on a tangle-free flat cable lets you control music playback and volume adjustment, EQ presets, as well as answering calls on the fly with a built-in microphone. All this makes the JBL Tune 310C USB-C your everyday companion, at work, at home, and on the road.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Online Exclusive',
        5998.00,
        7999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:39:17',
        '2025-05-09 20:39:17'
    ),
    (
        79,
        'P-2E8769',
        NULL,
        'JBL Tune 310C Wired Hi-Res In-Ear Earphones - Black',
        'JBL Pure Bass sound, Hi-Res certified\r\nFor over 75 years, JBL has engineered the precise, impressive sound found in big venues around the world. These headphones reproduce that same JBL sound, punching out bass thatâ€™s deep, powerful. Hi-Res Audio brings clear and detailed sound quality with a wide frequency range.\r\nCompatible with USB-C devices\r\nNeed to connect to a PC, mobile or gaming device? USB-C connectivity ensures compatibility with a wide range of devices*. *Please check USB-C compatibility with your device.\r\n\r\n3-button remote with microphone\r\nControl music playback and volume adjustment with a convenient three-button remote. Got an incoming call? Answer it on the fly with the built-in microphone.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        5999.00,
        7999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:46:26',
        '2025-05-09 20:46:26'
    ),
    (
        80,
        'P-3A53EC',
        NULL,
        'JBL Tune Buds - White',
        'Pure Bass. Zero noise.\r\nTackle your day one song at a time with the JBL Tune Buds. These true wireless earbuds give you up to 48 hours of exceptional JBL Pure Bass Sound, while the ergonomic, water and dust resistant design gives you all-day comfort in any weather. A simple touch allows you to manage and enjoy perfect calls anywhere, without ambient noises. And with Active Noise Cancelling and Smart Ambient technology, you choose whether you want to tune out the world or engage with your surroundings. The bud design ensures perfect isolation from outside noises and secure fit. Best of all, the JBL Headphones App lets you personalize your entire listening experience. Stay connected to your world, your way.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        25998.00,
        34999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:49:55',
        '2025-05-09 20:49:55'
    ),
    (
        81,
        'P-79FCA0',
        NULL,
        'JBL Wave Flex - White',
        'JBL Wave Flex - White\r\nDeep bass, plenty of fun\r\nBring your sound everywhere. With bass you can feel, up to 32 total hours of battery life, and a secure, comfortable stick-open design, the splash and dust resistant JBL Wave Flex are designed for your daily entertainment. Whether you\'re roaming city streets or relaxing on the beach, your hands-free stereo calls will always be crystal clear, while Smart Ambient technology keeps you aware of your surroundings. And when you need an extra boost, you can speed charge two additional hours of power in just 10 minutes.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        22997.00,
        27999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 20:59:19',
        '2025-05-09 20:59:19'
    ),
    (
        82,
        'P-75A71D',
        NULL,
        'JBL Wave Flex - Black',
        'Deep bass, plenty of fun\r\nBring your sound everywhere. With bass you can feel, up to 32 total hours of battery life, and a secure, comfortable stick-open design, the splash and dust resistant JBL Wave Flex are designed for your daily entertainment. Whether you\'re roaming city streets or relaxing on the beach, your hands-free stereo calls will always be crystal clear, while Smart Ambient technology keeps you aware of your surroundings. And when you need an extra boost, you can speed charge two additional hours of power in just 10 minutes.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Online Exclusive',
        22997.00,
        27999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 21:02:31',
        '2025-05-09 21:02:31'
    ),
    (
        83,
        'P-9DA9E1',
        NULL,
        'JBL Wave Buds - White',
        'Deep bass, plenty of fun\r\nBring your sound everywhere. With bass you can feel, up to 32 total hours of battery life, and a secure, comfortable bud design, the splash and dust resistant JBL Wave Buds are designed for your daily entertainment. Whether you\'re roaming city streets or relaxing on the beach, your hands-free stereo calls will always be crystal clear, while Smart Ambient technology keeps you aware of your surroundings. And when you need an extra boost, you can speed charge two additional hours of power in just 10 minutes.\r\nJBL Deep Bass Sound\r\nGet the most from your mixes with high-quality audio from secure, reliable earbuds with 8mm drivers featuring JBL Deep Bass Sound.\r\nComfortable fit\r\nThe ergonomic, bud design of the JBL Wave Buds fits so comfortably you may forget you\'re wearing them. The bud design gently seals your ears blocking external noises and enhancing the bass performance.\r\nUp to 32 (8h + 24h) total hours of battery life with speed charging\r\nWith 8 hours of battery life in the earbuds and 24 in the case, the JBL Wave Buds provide all-day audio. And when you need more power, you can speed charge an extra two hours in just 10 minutes.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        19999.00,
        24999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        84,
        'P-C96427',
        NULL,
        'JBL Tune Beam - White',
        'Pure Bass. Zero noise.\r\nTackle your day one song at a time with the JBL Tune Beam. These true wireless earbuds give you up to 48 hours of exceptional JBL Pure Bass Sound, while the ergonomic, water and dust resistant design gives you all-day comfort in any weather. A simple touch allows you to manage and enjoy perfect calls anywhere, without ambient noises. And with Active Noise Cancelling and Smart Ambient technology, you choose whether you want to tune out the world or engage with your surroundings. The stick-closed design ensures a secure fit, isolation from outside noise for better sound performance. Best of all, the JBL Headphones App lets you personalize your entire listening experience. Stay connected to your world, your way.\r\n\r\nJBL Pure Bass Sound\r\nSmartly designed 6mm drivers enhanced by the stick\'s form factor deliver JBL\'s Pure Bass Sound, so you\'ll feel every pulsing beat.\r\nBluetooth 5.3 with LE audio support*\r\nThanks to the next generation Bluetooth technology, the JBL Tune Beam earbuds stream audio with low power consumption at high quality. Plus, BT 5.3 allows you to stream synchronized audio independently to each earbud, so that you can use either or both earbuds. Or you can share your video or music content with a friend wearing headphones, as BT 5.3 lets you seamlessly stream audio to multiple listeners. (*) Available via OTA update at a later stage\r\nActive Noise Cancelling with Smart Ambient\r\nHear more of what you want, less of what you don\'t. Active Noise Cancelling technology lets you minimize audio distractions. With Ambient Aware, you can tune into your surroundings at any time so that you feel safer when you\'re out in the world, while TalkThru lets you stop for a quick chat without having to remove your headphones.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        29999.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-09 21:17:00',
        '2025-05-09 21:17:00'
    ),
    (
        85,
        'P-B7776D',
        NULL,
        'JBL Tune 310C USB - Red',
        'Hi-Res Audio with JBL Pure Bass Sound. Now available to go.\r\nIntroducing JBL Tune 310C USB-C in-ear headphones. Theyâ€™re lightweight, comfortable and compact. A pair of 9mm dynamic drivers punch out powerful JBL Pure Bass Sound, while the High-Resolution Audio support ensures great sound quality. A USB-C connection makes them compatible with a large variety of devices like PCs, mobiles, and gaming devices. In addition, the three-button remote on a tangle-free flat cable lets you control music playback and volume adjustment, EQ presets, as well as answering calls on the fly with a built-in microphone. All this makes the JBL Tune 310C USB-C your everyday companion, at work, at home, and on the road.\r\nJBL Pure Bass sound, Hi-Res certified\r\nFor over 75 years, JBL has engineered the precise, impressive sound found in big venues around the world. These headphones reproduce that same JBL sound, punching out bass thatâ€™s deep, powerful. Hi-Res Audio brings clear and detailed sound quality with a wide frequency range.\r\nCompatible with USB-C devices\r\nNeed to connect to a PC, mobile or gaming device? USB-C connectivity ensures compatibility with a wide range of devices*. *Please check USB-C compatibility with your device.\r\n3-button remote with microphone\r\nControl music playback and volume adjustment with a convenient three-button remote. Got an incoming call? Answer it on the fly with the built-in microphone.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        5999.00,
        7999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 20:21:31',
        '2025-05-10 20:21:31'
    ),
    (
        86,
        'P-A0EAE7',
        NULL,
        'JBL Tune 310C USB - Blue',
        'Hi-Res Audio with JBL Pure Bass Sound. Now available to go.\r\nIntroducing JBL Tune 310C USB-C in-ear headphones. Theyâ€™re lightweight, comfortable and compact. A pair of 9mm dynamic drivers punch out powerful JBL Pure Bass Sound, while the High-Resolution Audio support ensures great sound quality. A USB-C connection makes them compatible with a large variety of devices like PCs, mobiles, and gaming devices. In addition, the three-button remote on a tangle-free flat cable lets you control music playback and volume adjustment, EQ presets, as well as answering calls on the fly with a built-in microphone. All this makes the JBL Tune 310C USB-C your everyday companion, at work, at home, and on the road.\r\nJBL Pure Bass sound, Hi-Res certified\r\nFor over 75 years, JBL has engineered the precise, impressive sound found in big venues around the world. These headphones reproduce that same JBL sound, punching out bass thatâ€™s deep, powerful. Hi-Res Audio brings clear and detailed sound quality with a wide frequency range.\r\nCompatible with USB-C devices\r\nNeed to connect to a PC, mobile or gaming device? USB-C connectivity ensures compatibility with a wide range of devices*. *Please check USB-C compatibility with your device.\r\n3-button remote with microphone\r\nControl music playback and volume adjustment with a convenient three-button remote. Got an incoming call? Answer it on the fly with the built-in microphone.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        5999.00,
        7999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 20:27:22',
        '2025-05-10 20:27:22'
    ),
    (
        87,
        'P-A9E6C2',
        NULL,
        'Sudio (Sweden) K1 Kids Headphone (Purple)',
        '-',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        7999.00,
        12999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 20:33:46',
        '2025-05-10 20:33:46'
    ),
    (
        88,
        'P-1A26AA',
        NULL,
        'Sudio (Sweden) K1 Kids Headphone (Blue)',
        '-',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        7999.00,
        12999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 20:38:25',
        '2025-05-10 20:38:25'
    ),
    (
        89,
        'P-382949',
        NULL,
        'Sudio (Sweden) T3 True Wireless Earbuds (White)',
        'Sudio T3 True Wireless Earbuds (White)\r\nThe Sudio T3 wireless earbuds snugly fit in the ears and come with a portable mini charging case, allowing users to easily carry them during any movement. This charging case extends the playback time to 25 hours, equipped with the latest Bluetooth 5.4 technology for a more stable connection.\r\n\r\n \r\n\r\nSudio T3 not only offers four stylish colorsâ€”Classic Black, Sakura Pink, Powder Blue, and Bright White but also delivers high-definition treble and soft bass, providing a comprehensive auditory experience.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Online Exclusive',
        12799.00,
        17999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 20:40:19',
        '2025-05-10 20:40:19'
    ),
    (
        90,
        'P-F451BF',
        NULL,
        'Sudio (Sweden) T3 True Wireless Earbuds (Blue)',
        'Sudio T3 True Wireless Earbuds (Blue)\r\nThe Sudio T3 wireless earbuds snugly fit in the ears and come with a portable mini charging case, allowing users to easily carry them during any movement. This charging case extends the playback time to 25 hours, equipped with the latest Bluetooth 5.4 technology for a more stable connection.\r\n\r\n \r\n\r\nSudio T3 not only offers four stylish colorsâ€”Classic Black, Sakura Pink, Powder Blue, and Bright White but also delivers high-definition treble and soft bass, providing a comprehensive auditory experience.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Online Exclusive',
        12798.00,
        17999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 20:44:47',
        '2025-05-10 20:44:47'
    ),
    (
        91,
        'P-C8777B',
        NULL,
        'Sudio (Sweden) D1 True Wireless Earbuds (Black)',
        'Sudio D1 is an in-ear headphone that fits snugly in your ears. The headphones and charging case feature a design that combines matte and smooth details, making you effortlessly stand out.\r\n\r\n \r\n\r\nThe Sudio D1 headphones cater to users with high demands for sound quality and design, while also providing practical and aesthetically pleasing options for daily users. These headphones not only offer up to 6 hours of playback time per charge (total of 30 hours), but also feature sweat and splash resistance, making them ideal for daily headphone wearers. Whether at the gym or strolling through the city, the Sudio D1 is casual, clear, and vibrant, providing even and subtle bass for the best music experience, allowing you to enjoy music anytime, anywhere.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        7999.00,
        12999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 21:08:44',
        '2025-05-10 21:08:44'
    ),
    (
        92,
        'P-B40A9F',
        NULL,
        'Sudio (Sweden) A1 Pro Wireless Earbuds (Purple)',
        'Sudio A1 Pro Wireless Earbuds with Bluetooth 5.3, Microphones, 30h Playtime, IPX4 Splash Proof, Multi-Point Bluetooth Connection.\r\nSudio continues its consistent style of minimalist design and high value-for-money. The new A1 Pro series injects rhythm and life into music, equipped with balance and deep bass and outstanding touch. With its sleek and exceptional design, this active noise-cancelling earphone seamlessly enrich your daily experience with high-quality sound and a relaxed style.\r\n\r\nSudio A1 combines the in-ear design with active noise-cancelling, Sudio A1 Pro delivers an even audio quality and effectively removes any disturbances from your daily life. This earphone comes in four exquisite colours, including Mysterious Purple, Milk Tea, Classic Black, and Pure White, making it a versatile accessory that perfectly complements your personal style.\r\nKey features:\r\nImmersive enjoyment\r\nThe Sudio A1 Pro is an in-ear earphone with active noise-cancelling, allowing you to enjoy your favourite music or show on the go or at home.\r\n\r\nWaterproof and rain-resistant\r\nWith an IPX4 waterproof rating, Sudio A1 Pro provides up to 6-7 hours of playback time, ensuring you never miss a beat.\r\n\r\nUltra-light and convenient\r\nThe Sudio A1 Pro is Sudioâ€™s lightest earphone, making it easy to carry and keep your playlist playing on repeat.\r\n\r\nPersonalized style\r\nWith four exquisite colour options â€“ Mysterious Purple, Milk Tea, Classic Black, and Pure White â€“ Sudio A1 Pro adds a touch of pleasure and style to your daily life.',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Below',
        10397.00,
        14999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 21:23:39',
        '2025-05-10 21:23:39'
    ),
    (
        93,
        'P-C53873',
        NULL,
        'Sudio (Sweden) N2 Pro Bluetooth in-Ear Earbuds with ANC (Sand Brown)',
        '-',
        19,
        NULL,
        61,
        NULL,
        1000,
        'Top Selling',
        16999.00,
        22999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-10 21:31:40',
        '2025-05-10 21:31:40'
    ),
    (
        96,
        'P-383543',
        NULL,
        'JVC 43 Inch FHD Smart TV',
        'The JVC LT-43N585 is a 43-inch Full HD Smart LED TV that offers a superior viewing experience with a resolution of 1920x1080 pixels, ensuring clear and vibrant visuals. The TV features a dynamic contrast ratio of 5000:1, enhancing picture depth, and a wide 178Â° viewing angle for consistent image quality from various positions. Equipped with dual 10W speakers, it delivers clear and immersive audio.\r\n\r\nThis smart TV runs on Android OS, offering access to popular streaming apps like Netflix and YouTube, and comes with built-in Wi-Fi for seamless internet connectivity. With multiple ports including HDMI, USB, and VGA, you can easily connect your devices. The LT-43N585 also supports a DVB-T2 tuner for digital TV reception. It is designed with user-friendly features such as a web browser and easy setup, making it a great choice for modern entertainment.',
        18,
        NULL,
        53,
        NULL,
        1000,
        'Online Exclusive',
        144999.00,
        114999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 14:34:27',
        '2025-05-14 14:34:27'
    ),
    (
        97,
        'P-29BB08',
        NULL,
        'Abans Upgraded 190L Defrost SD Refrigerator - R600 (Silver)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting Ultra Bright & Long lasting\r\n\r\nCopper Tubing Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        7,
        1000,
        'Online Exclusive',
        99990.00,
        81990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 14:46:42',
        '2025-05-14 14:46:42'
    ),
    (
        98,
        'P-E2FAD9',
        NULL,
        'Abans Upgraded 190L Defrost SD Refrigerator - R600 (Golden Brown)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\n75W power usage\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting Ultra Bright & Long lasting\r\n\r\nCopper Tubing Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        7,
        1000,
        'Online Exclusive',
        99990.00,
        81990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 14:49:34',
        '2025-05-14 14:49:34'
    ),
    (
        99,
        'P-3D5F4B',
        NULL,
        'Abans 190L Defrost SD Refrigerator - R600 Gas (Golden Brown)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\n75W power usage\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting Ultra Bright & Long lasting\r\n\r\nCopper Tubing Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        7,
        1000,
        'Online Exclusive',
        119990.00,
        74990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 14:51:47',
        '2025-05-14 14:51:47'
    ),
    (
        100,
        'P-0EC96B',
        NULL,
        'Abans 190L Defrost SD Refrigerator - R600 Gas (Silver)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\n75W power usage\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting Ultra Bright & Long lasting\r\n\r\nCopper Tubing Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        7,
        1000,
        'Top Selling',
        119990.00,
        74990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:01:05',
        '2025-05-14 15:01:05'
    ),
    (
        101,
        'P-AED0CD',
        NULL,
        'ABANS 180L Refrigerator with Base - Silver',
        '-',
        20,
        NULL,
        66,
        7,
        1000,
        'Top Selling',
        111990.00,
        76990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:04:26',
        '2025-05-14 15:04:26'
    ),
    (
        102,
        'P-E7A29F',
        NULL,
        'Abans Upgraded 190L Defrost DD Refrigerator - R600 Gas (Silver)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\nAverage power consumption is 38W per hour\r\n\r\nAverage power consumption: 27 kWh per month\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting â€“ Ultra Bright & Long lasting\r\n\r\nCopper Tubing â€“ Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        8,
        1000,
        NULL,
        108990.00,
        91990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:07:10',
        '2025-05-14 15:07:10'
    ),
    (
        103,
        'P-4EB516',
        NULL,
        'Haier 240L No Frost Double Door Inverter Refrigerator - Black Steel',
        '5 In 1 Convertible\r\n\r\n5 in 1 convertible modes helps you to convert your fridge and back to freezer in no time. 5 modes for your 5 different needs.\r\n\r\n \r\n\r\nTurbo Icing\r\n\r\nTurbo icing technology accelerates the time needed to freeze products in the freezer section. It helps make the ice 200% faster in 49 minutes*\r\n\r\n \r\n\r\nTwin Energy Saving Modes\r\n\r\nTwo energy-saving modes in one refrigerator save up to 15% energy in mode one and up to 30% energy in convertible mode, store more save more.',
        20,
        NULL,
        66,
        8,
        1000,
        'Top Selling',
        169990.00,
        139990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:09:40',
        '2025-05-14 15:09:40'
    ),
    (
        104,
        'P-5ECB5C',
        NULL,
        'Haier 240L No Frost Double Door Inverter Refrigerator - Red Rose Floral',
        '5 In 1 Convertible\r\n\r\n5 in 1 convertible modes helps you to convert your fridge and back to freezer in no time. 5 modes for your 5 different needs.\r\n\r\n \r\n\r\nTurbo Icing\r\n\r\nTurbo icing technology accelerates the time needed to freeze products in the freezer section. It helps make the ice 200% faster in 49 minutes*\r\n\r\n \r\n\r\nTwin Energy Saving Modes\r\n\r\nTwo energy-saving modes in one refrigerator save up to 15% energy in mode one and up to 30% energy in convertible mode, store more save more.',
        20,
        NULL,
        66,
        8,
        1000,
        'Top Selling',
        169990.00,
        139990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        105,
        'P-8EA446',
        NULL,
        'Haier 240L No Frost Double Door Inverter Refrigerator - Red Metallic Silver',
        '5 In 1 Convertible\r\n\r\n5 in 1 convertible modes helps you to convert your fridge and back to freezer in no time. 5 modes for your 5 different needs.\r\n\r\n \r\n\r\nTurbo Icing\r\n\r\nTurbo icing technology accelerates the time needed to freeze products in the freezer section. It helps make the ice 200% faster in 49 minutes*\r\n\r\n \r\n\r\nTwin Energy Saving Modes\r\n\r\nTwo energy-saving modes in one refrigerator save up to 15% energy in mode one and up to 30% energy in convertible mode, store more save more.',
        20,
        NULL,
        66,
        8,
        1000,
        NULL,
        169990.00,
        139990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:14:32',
        '2025-05-14 15:14:32'
    ),
    (
        106,
        'P-7D82BC',
        NULL,
        'Haier Vouge Series 328L No Frost Double Door Inverter Refrigerator Rose Blue Glass',
        '-',
        20,
        NULL,
        66,
        8,
        1000,
        'Top Selling',
        279990.00,
        229990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        107,
        'P-3EAE99',
        NULL,
        'JBL Live 670 NC Wireless On-Ear Headphones - White',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        49999.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:33:39',
        '2025-05-14 15:33:39'
    ),
    (
        108,
        'P-DE87D5',
        NULL,
        'JBL Live 670 NC Wireless On-Ear Headphones - Sandstone',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        49999.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:39:09',
        '2025-05-14 15:39:09'
    ),
    (
        109,
        'P-60B530',
        NULL,
        'JBL Live 670 NC Wireless On-Ear Headphones - Blue',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        49999.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:49:10',
        '2025-05-14 15:49:10'
    ),
    (
        110,
        'P-726D0C',
        NULL,
        'Haier Vouge Series 328L No Frost Double Door Inverter Refrigerator Cream Pink',
        '-',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        279990.00,
        229990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        111,
        'P-79F0A5',
        NULL,
        'Abans 190L Defrost Green Pro Refrigerator - R600 Gas (Blue Floral)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\nAverage power consumption is 38W per hour\r\n\r\nAverage power consumption: 27 kWh per month\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting â€“ Ultra Bright & Long lasting\r\n\r\nCopper Tubing â€“ Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        108990.00,
        92990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 15:59:03',
        '2025-05-14 15:59:03'
    ),
    (
        112,
        'P-5DB509',
        NULL,
        'LG 289L Double Door Inverter Refrigerator - Shiny Steel',
        'Smart Inverter Compressor\r\nIntegrated with a smart inverter compressor, the LG Convertible Refrigerator ensures energy-efficient performance, allowing you to significantly reduce your electricity costs.\r\n\r\nSmart Diagnosis\r\nThe Smart Diagnosis feature in this refrigerator makes troubleshooting problems quick and simple. All you have to do is dial the LG customer service helpline number and place the phone on the refrigerator.\r\n\r\nMoist â€˜Nâ€™ Fresh\r\nSporting a distinctive latticed fruit and vegetable box lid, this refrigerator limits the build-up of excess moisture while maintaining the ideal quantity of moisture to prolong freshness.\r\n\r\nToughened Glass Shelves\r\nThis refrigerator\'s shelves are built of toughened glass and can support loads of up to 175 kg, making them ideal to keep heavy food containers.\r\n\r\nDouble Twist Ice Tray\r\nThis ice dispenser includes an integrated twist ice maker, so you can simply fill the trays with water, freeze them, and then effortlessly twist them to get an entire tray of ice cubes.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        299990.00,
        169990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:03:33',
        '2025-05-14 16:03:33'
    ),
    (
        113,
        'P-2E9FB9',
        NULL,
        'Abans 285L No-Frost Smart Pro Refrigerator - Mirror Hairline',
        'Abans 285L No Frost Smart Pro Refrigerator - Mirror Hairline\r\nThe Abans 285L No Frost Smart Pro Refrigerator in Mirror Hairline offers a spacious storage capacity of 285 liters and boasts a No Frost feature, ensuring hassle-free maintenance. Its sleek Black Gold design adds a touch of elegance to any kitchen space. Equipped with smart technology, it likely offers convenient features tailored to modern living. While specific features may vary, this refrigerator is expected to deliver reliable performance and energy efficiency. For consumers seeking a stylish and functional refrigerator, the Abans 285L No Frost Smart Pro Refrigerator is certainly worth considering.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        189990.00,
        144990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:06:26',
        '2025-05-14 16:06:26'
    ),
    (
        114,
        'P-1ACB95',
        NULL,
        'Abans 285L No-Frost Smart Pro Refrigerator - Black Gold',
        'Abans 285L No Frost Smart Pro Refrigerator - Black Gold\r\nThe Abans 285L No Frost Smart Pro Refrigerator in Black Gold offers a spacious storage capacity of 285 liters and boasts a No Frost feature, ensuring hassle-free maintenance. Its sleek Black Gold design adds a touch of elegance to any kitchen space. Equipped with smart technology, it likely offers convenient features tailored to modern living. While specific features may vary, this refrigerator is expected to deliver reliable performance and energy efficiency. For consumers seeking a stylish and functional refrigerator, the Abans 285L No Frost Smart Pro Refrigerator is certainly worth considering',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        189990.00,
        144990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:08:33',
        '2025-05-14 16:08:33'
    ),
    (
        115,
        'P-3D53F8',
        NULL,
        'Abans 190L Defrost DD Refrigerator - R600 Gas (Gray Floral)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\nAverage power consumption is 38W per hour\r\n\r\nAverage power consumption: 27 kWh per month\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting â€“ Ultra Bright & Long lasting\r\n\r\nCopper Tubing â€“ Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        108990.00,
        92990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:12:19',
        '2025-05-14 16:12:19'
    ),
    (
        116,
        'P-374510',
        NULL,
        'Abans Upgraded 190L Defrost DD Refrigerator - R600 Gas (Golden Brown)',
        'R600a refrigerant - Energy Efficient & Eco friendly (Organic Refrigerant)\r\n\r\nAverage power consumption is 38W per hour\r\n\r\nAverage power consumption: 27 kWh per month\r\n\r\nFresh & Healthy\r\n\r\nLED Lighting â€“ Ultra Bright & Long lasting\r\n\r\nCopper Tubing â€“ Lifetime Durability\r\n\r\n40 millimeter forming thickness\r\n\r\nUnlimited Spares availability\r\n\r\nBigger in size compared to competitor models.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        108990.00,
        91990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:14:27',
        '2025-05-14 16:14:27'
    ),
    (
        117,
        'P-7D4929',
        NULL,
        'LG 260L Smart Inverter Refrigerator - Shiny Steel',
        'Energy Saving\r\nSmart Inverter CompressorÂ®\r\nLGâ€™s intelligent Smart Inverter CompressorÂ® is an energy expert, adjusting cooling power based on quantities of stored food and the inside and outside temperature of the refrigerator. The Smart Inverter CompressorÂ® also generates less noise, making your kitchen a quiet, relaxing place to enjoy.\r\n\r\nEasy Storage\r\n(Big Size Veggie Box)\r\nExtended Veggie Box provides more storage. Big Size Veggie Box saves your trips to the market.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        189990.00,
        164990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:20:23',
        '2025-05-14 16:20:23'
    ),
    (
        118,
        'P-66A591',
        NULL,
        'LG 308L Refrigerator - Shiny Steel',
        'Smart Inverter Compressor\r\n\r\nThe new range of LG Frost Free Refrigerators with cutting edge Smart Inverter Compressor technology that takes energy efficiency to another level and helps you save more. Not only this, it comes with 10 year warranty and provides super silent operation.\r\n\r\nMore even and 35% faster cooling\r\nLG Door Cooling+â„¢ makes inside temperature more even and cools the refrigerator 35% faster than the conventional cooling system. This reduces the temperature gap between the inner part and the door side of the compartment; thus letting the food remain fresh for long.\r\n\r\nLED Lighting\r\nEnergy Efficient & Longer Life Span\r\nLED Lighting is more energy efficient & has longer life span than conventional bulb lighting.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        224990.00,
        199990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:25:10',
        '2025-05-14 16:25:10'
    ),
    (
        119,
        'P-4E3CB0',
        NULL,
        'LG 471L Refrigerator Frost Free - Shiny Steel',
        'Even & Fast Cooling in Any Where\r\nLG DoorCooling+Â® makes inside temperature more even and cool 35% quicker than conventional cooling system.\r\nIt significantly reduces the temperature gap between the inner part and the door side of the compartment. \r\n\r\nTouch LED Display\r\nEasy Control\r\nTouch LED Display provides the pleasure of operating and enhances elegance of your refrigerator.\r\n\r\nLED Panel Lighting\r\nEnergy Efficient & Longer Life Span\r\nLED Panel Lighting is more energy efficient & has longer life span than conventional bulb lighting.',
        20,
        NULL,
        66,
        8,
        1000,
        'Online Exclusive',
        499990.00,
        349990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 16:30:12',
        '2025-05-14 16:30:12'
    ),
    (
        120,
        'P-512CCA',
        NULL,
        'Haier Vouge Series 598L Side By Side Triple Door Inverter Refrigerator Black White Glass',
        '-',
        20,
        NULL,
        66,
        9,
        1000,
        'Online Exclusive',
        509990.00,
        459990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        121,
        'P-F87A4D',
        NULL,
        'Haier 598L Side By Side Triple Door Inverter Refrigerator - Black Glass',
        '-',
        20,
        NULL,
        66,
        9,
        1000,
        'Online Exclusive',
        499990.00,
        449990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:03:43',
        '2025-05-14 18:03:43'
    ),
    (
        122,
        'P-23F763',
        NULL,
        'Haier Vouge Series 602L Side By Side Two Door Inverter Refrigerator Black Yellow',
        '-',
        20,
        NULL,
        66,
        9,
        1000,
        'Online Exclusive',
        479990.00,
        429990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:06:58',
        '2025-05-14 18:06:58'
    ),
    (
        123,
        'P-A5101B',
        NULL,
        'JBL Live 670 NC Wireless On-Ear Headphones',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        49999.00,
        39999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:07:38',
        '2025-05-14 18:12:12'
    ),
    (
        124,
        'P-65430A',
        NULL,
        'JBL Tune 770NC Adaptive Wireless Over - Ear Headphones White',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        34999.00,
        29999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:11:50',
        '2025-05-14 18:11:50'
    ),
    (
        125,
        'P-542479',
        NULL,
        'JBL Tune 770NC Adaptive Wireless Over - Ear Headphones Blue',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        34999.00,
        29999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:16:37',
        '2025-05-14 18:16:37'
    ),
    (
        126,
        'P-2EAD9C',
        NULL,
        'LG Water and Ice Dispenser with UV Nano with Smart Inverter Compressor Refrigerator - 694L',
        '-',
        20,
        NULL,
        66,
        9,
        1000,
        'Online Exclusive',
        939990.00,
        749990.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:18:10',
        '2025-05-14 18:18:10'
    ),
    (
        127,
        'P-60A2A4',
        NULL,
        'JBL Tune 770NC Adaptive Noise Cancelling Wireless Over - Ear Headphones',
        '-',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        34999.00,
        29999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:23:18',
        '2025-05-14 18:23:18'
    ),
    (
        128,
        'P-881101',
        NULL,
        'JBL Tune 520BT - White',
        'Wireless on-ear headphones with JBL Pure Bass sound\r\nThe JBL Tune 520BT headphones stream powerful JBL Pure Bass sound thanks to the latest 5.3 BT technology. Easy to use, these headphones provide up to 57 hours of pure pleasure and an extra 3 hours of battery with just 5 minutes of charge. Download the free JBL Headphones App and customize your sound through the EQ, while Voice Prompts guide you through the headphones features. Manage calls, sound and volume from the earcup, thanks to the convenient button control. If a call comes in while you are watching a video on another device, the JBL Tune 520BT seamlessly switches to your mobile device, so you never miss a call. Lightweight and comfortable even after hours of listening, the JBL Tune 520BT headphones fold flat in your backpack to follow you everywhere.\r\n\r\nJBL Pure Bass Sound\r\nThe JBL Tune 520BT utilizes the renowned JBL Pure Bass sound, the same technology that powers the most famous venues all around the world.\r\n\r\nWireless Bluetooth 5.3 technology\r\nWirelessly stream high-quality sound from your smartphone without messy cords with the help of the latest Bluetooth technology.\r\n\r\nCustomize your listening experience\r\nDownload the free JBL Headphones App to tailor the sound to your taste with the EQ. Voice prompts in your desired language guide you through the Tune 520BT features.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        17999.00,
        13999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-14 18:56:56',
        '2025-05-14 18:56:56'
    ),
    (
        129,
        'P-902D6B',
        NULL,
        'JBL Tune 520BT - Black',
        'Wireless on-ear headphones with JBL Pure Bass sound\r\nThe JBL Tune 520BT headphones stream powerful JBL Pure Bass sound thanks to the latest 5.3 BT technology. Easy to use, these headphones provide up to 57 hours of pure pleasure and an extra 3 hours of battery with just 5 minutes of charge. Download the free JBL Headphones App and customize your sound through the EQ, while Voice Prompts guide you through the headphones features. Manage calls, sound and volume from the earcup, thanks to the convenient button control. If a call comes in while you are watching a video on another device, the JBL Tune 520BT seamlessly switches to your mobile device, so you never miss a call. Lightweight and comfortable even after hours of listening, the JBL Tune 520BT headphones fold flat in your backpack to follow you everywhere.\r\n\r\nJBL Pure Bass Sound\r\nThe JBL Tune 520BT utilizes the renowned JBL Pure Bass sound, the same technology that powers the most famous venues all around the world.\r\n\r\nWireless Bluetooth 5.3 technology\r\nWirelessly stream high-quality sound from your smartphone without messy cords with the help of the latest Bluetooth technology.\r\n\r\nCustomize your listening experience\r\nDownload the free JBL Headphones App to tailor the sound to your taste with the EQ. Voice prompts in your desired language guide you through the Tune 520BT features.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        17999.00,
        13999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 08:22:49',
        '2025-05-15 08:22:49'
    ),
    (
        130,
        'P-48574B',
        NULL,
        'JBL Tune 720BT - White',
        'Immerse in JBL Pure Bass sound wherever you go.\r\nThe JBL Tune 720BT headphones stream powerful JBL Pure Bass sound thanks to the latest 5.3 BT technology. Easy to use, these headphones provide up to 76 hours of pure pleasure and an extra 3 hours of battery with just 5 minutes of charge. Download the free JBL Headphones App and customize your sound through the EQ, while Voice Prompts guide you through the headphones features. Manage calls, sound and volume from the earcup, thanks to the convenient button controls. If a call comes in while you are watching a video on another device, the JBL Tune 720BT seamlessly switches to your mobile device, so you never miss a call. Lightweight and comfortable even after hours of listening, the JBL Tune 720BT headphones fold flat in your backpack to follow you everywhere.\r\n\r\nJBL Pure Bass Sound\r\nThe JBL Tune 720BT utilizes the renowned JBL Pure Bass sound, the same technology that powers the most famous venues all around the world.\r\n\r\nWireless Bluetooth 5.3 technology\r\nWirelessly stream high-quality sound from your smartphone without messy cords with the help of the latest Bluetooth technology.\r\n\r\nCustomize your listening experience\r\nDownload the free JBL Headphones App to tailor the sound to your taste with the EQ. Voice prompts in your desired language guide you through the Tune 720BT features.\r\n\r\nFeatures\r\n\r\nUp to 76H battery life and speed charge (5mins = 3H)\r\nFor long-lasting fun, listen wirelessly for up to 76 hours and recharge the battery in as little as 2 hours with the convenient Type-C USB cable. A quick 5-minute recharge gives you 3 additional hours of music.\r\n\r\nHands-free calls with Voice Aware\r\nEasily control your sound and manage your calls from your headphones with the convenient buttons on the ear-cup. Hear your voice while talking, with the help of Voice Aware.\r\n\r\nMulti-point connections\r\nAllows you to effortlessly switch from one Bluetooth device to another. You can simply switch from a video on your tablet to a call on your mobile phone, so that you\'ll never miss a call.\r\n\r\nLightweight, comfortable and foldable design\r\nThe lightweight materials and soft ear cushions with a padded headband make the headphones comfortable to wear for extended periods. The foldable design makes it convenient for you to carry your headphones anywhere and anytime you want music.\r\n\r\nDetachable audio cable\r\nFlat battery? Extend the fun endlessly with the included audio cable.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        24999.00,
        19999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:08:36',
        '2025-05-15 09:08:36'
    ),
    (
        131,
        'P-9BD836',
        NULL,
        'Sudio (Sweden) R3 Over-Ear Headphones (Black)',
        'Sudio (Sweden) R3 Over-Ear Headphones (Black)\r\nHE EVERYDAY HEADPHONES.\r\n\r\nCharge, connect and play.\r\n\r\nThese comfortable headphones are ready to go wherever you go.\r\n\r\nSlip these headphones on as you head out the door.\r\n\r\nUp 35 hours of playtime, enjoy extra reliable bluetooth 5.4 connection, and available in 4 easy-to-match colours.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        17999.00,
        11999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:12:41',
        '2025-05-15 09:12:41'
    ),
    (
        132,
        'P-C5EFFA',
        NULL,
        'Sudio (Sweden) R3 Over-Ear Headphones (White)',
        'Sudio (Sweden) R3 Over-Ear Headphones (White)\r\nHE EVERYDAY HEADPHONES.\r\n\r\nCharge, connect and play.\r\n\r\nThese comfortable headphones are ready to go wherever you go.\r\n\r\nSlip these headphones on as you head out the door.\r\n\r\nUp 35 hours of playtime, enjoy extra reliable bluetooth 5.4 connection, and available in 4 easy-to-match colours.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        17999.00,
        11999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:15:24',
        '2025-05-15 09:15:24'
    ),
    (
        133,
        'P-87BBC7',
        NULL,
        'Sudio (Sweden) R3 Over-Ear Headphones (Pink)',
        'HE EVERYDAY HEADPHONES.\r\n\r\nCharge, connect and play.\r\n\r\nThese comfortable headphones are ready to go wherever you go.\r\n\r\nSlip these headphones on as you head out the door.\r\n\r\nUp 35 hours of playtime, enjoy extra reliable bluetooth 5.4 connection, and available in 4 easy-to-match colours.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        17999.00,
        11999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:18:48',
        '2025-05-15 09:18:48'
    ),
    (
        134,
        'P-D98766',
        NULL,
        'Sudio (Sweden) R3 Over-Ear Headphones (Blue)',
        'HE EVERYDAY HEADPHONES.\r\n\r\nCharge, connect and play.\r\n\r\nThese comfortable headphones are ready to go wherever you go.\r\n\r\nSlip these headphones on as you head out the door.\r\n\r\nUp 35 hours of playtime, enjoy extra reliable bluetooth 5.4 connection, and available in 4 easy-to-match colours.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        17999.00,
        11999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:21:33',
        '2025-05-15 09:21:33'
    ),
    (
        135,
        'P-FEBC6F',
        NULL,
        'MINISO Foldable Headphones (Grey Black)',
        'The product is foldable with fishionable color design, soft earmuffs is convenient to hearing, also available for answer and hang up the call. The product is suitable for the iPhone or Android system phones, also all the equipments of 3.5mm audio output.\r\n\r\nUsage\r\n\r\nPlug into the device, adjust the volume to a comfortable level and wear it according to L/R mark.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        3750.00,
        3750.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:24:47',
        '2025-05-15 09:24:47'
    ),
    (
        136,
        'P-0D5EC4',
        NULL,
        'Sudio (Sweden) K2 Over-Ear Headphones (White)',
        'Sudio K2 Over-Ear Headphones, Hybrid Active Noise Cancellation, with Integrated Microphone, Charging via USB-C, Up to 35 Hours Playtime, Touch Panel, Premium Crystal Sound\r\nSound Profile\r\nDeep base, and powerful active noise cancellation. With a wide soundscape, experience a symphony of sounds in your ears.',
        19,
        NULL,
        62,
        NULL,
        1000,
        NULL,
        25999.00,
        18399.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:28:48',
        '2025-05-15 09:28:48'
    ),
    (
        137,
        'P-484730',
        NULL,
        'Sudio (Sweden) K2 Over-Ear Headphones (Black)',
        'Sudio K2 Over-Ear Headphones, Hybrid Active Noise Cancellation, with Integrated Microphone, Charging via USB-C, Up to 35 Hours Playtime, Touch Panel, Premium Crystal Sound\r\nSound Profile\r\nDeep base, and powerful active noise cancellation. With a wide soundscape, experience a symphony of sounds in your ears.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        25999.00,
        18399.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:34:12',
        '2025-05-15 09:34:12'
    ),
    (
        138,
        'P-7964B2',
        NULL,
        'BL Tune 720BT - Blue',
        'Immerse in JBL Pure Bass sound wherever you go.\r\nThe JBL Tune 720BT headphones stream powerful JBL Pure Bass sound thanks to the latest 5.3 BT technology. Easy to use, these headphones provide up to 76 hours of pure pleasure and an extra 3 hours of battery with just 5 minutes of charge. Download the free JBL Headphones App and customize your sound through the EQ, while Voice Prompts guide you through the headphones features. Manage calls, sound and volume from the earcup, thanks to the convenient button controls. If a call comes in while you are watching a video on another device, the JBL Tune 720BT seamlessly switches to your mobile device, so you never miss a call. Lightweight and comfortable even after hours of listening, the JBL Tune 720BT headphones fold flat in your backpack to follow you everywhere.\r\n\r\nJBL Pure Bass Sound\r\nThe JBL Tune 720BT utilizes the renowned JBL Pure Bass sound, the same technology that powers the most famous venues all around the world.\r\n\r\nWireless Bluetooth 5.3 technology\r\nWirelessly stream high-quality sound from your smartphone without messy cords with the help of the latest Bluetooth technology.\r\n\r\nCustomize your listening experience\r\nDownload the free JBL Headphones App to tailor the sound to your taste with the EQ. Voice prompts in your desired language guide you through the Tune 720BT features.\r\n\r\nFeatures\r\n\r\nUp to 76H battery life and speed charge (5mins = 3H)\r\nFor long-lasting fun, listen wirelessly for up to 76 hours and recharge the battery in as little as 2 hours with the convenient Type-C USB cable. A quick 5-minute recharge gives you 3 additional hours of music.\r\n\r\nHands-free calls with Voice Aware\r\nEasily control your sound and manage your calls from your headphones with the convenient buttons on the ear-cup. Hear your voice while talking, with the help of Voice Aware.\r\n\r\nMulti-point connections\r\nAllows you to effortlessly switch from one BluetoothÃ‚Â® device to another. You can simply switch from a video on your tablet to a call on your mobile phone, so that youÃ¢â‚¬â„¢ll never miss a call.\r\n\r\nLightweight, comfortable and foldable design\r\nThe lightweight materials and soft ear cushions with a padded headband make the headphones comfortable to wear for extended periods. The foldable design makes it convenient for you to carry your headphones anywhere and anytime you want music.\r\n\r\nDetachable audio cable\r\nFlat battery? Extend the fun endlessly with the included audio cable.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        24999.00,
        19999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 09:41:43',
        '2025-05-15 09:41:43'
    ),
    (
        139,
        'P-74AD13',
        NULL,
        'JVC 55 Inch UHD Smart TV',
        'The JVC LT-55N775 55-inch UHD Smart TV combines cutting-edge technology with sleek design, offering an immersive viewing experience. With a 4K Ultra HD resolution of 3840x2160 pixels, it delivers crisp, lifelike images and vibrant colors, making it ideal for enjoying movies, shows, and games in stunning detail. The 55-inch display offers a large viewing area that enhances the entertainment experience in any room.\r\n\r\nEquipped with Android TV, the LT-55N775 provides access to popular streaming services like Netflix, YouTube, and more, making it easier than ever to stream your favorite content. Built-in Wi-Fi allows seamless connectivity, and the smart interface is user-friendly for effortless navigation.\r\n\r\nWith multiple HDMI and USB ports, this TV supports easy connection to external devices such as gaming consoles, soundbars, and USB drives. Its sleek design and advanced features like voice control, high-quality sound, and customizable settings make the JVC LT-55N775 a perfect choice for a modern entertainment setup.',
        18,
        NULL,
        53,
        NULL,
        1000,
        'Online Exclusive',
        299999.00,
        199999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:33:11',
        '2025-05-15 10:33:11'
    ),
    (
        140,
        'P-F50BCD',
        NULL,
        'JVC 65 Inch UHD Smart TV',
        'The JVC LT-65N885 65-inch UHD Smart TV offers a premium viewing experience with a stunning 4K Ultra HD resolution (3840x2160), providing sharp, vibrant, and lifelike visuals. The expansive 65-inch display is perfect for large living spaces, offering an immersive cinematic experience whether you\'re watching movies, sports, or playing video games. The TVâ€™s sleek design, with slim bezels, enhances any roomâ€™s aesthetic, blending style and functionality.\r\n\r\nRunning on Android TV, the LT-65N885 gives you easy access to popular streaming services such as Netflix, YouTube, and more, making it simple to enjoy your favorite content. With built-in Wi-Fi, smooth streaming and browsing are a breeze, while the intuitive interface ensures effortless navigation.\r\n\r\nMultiple HDMI and USB ports allow you to connect external devices like gaming consoles, soundbars, and USB storage. The TV also features high-quality audio, smart voice control, and advanced settings for an exceptional and customizable entertainment experience. The JVC LT-65N885 is a fantastic addition to any home theater setup.',
        18,
        NULL,
        53,
        NULL,
        1000,
        'Online Exclusive',
        399999.00,
        269999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:35:11',
        '2025-05-15 10:35:11'
    ),
    (
        141,
        'P-E61ADC',
        NULL,
        'JVC 32 Inch LED TV',
        'The JVC LED 32" HD Ready encourages the beauty of your living room with its design, sleek and slim body. This TV is superior in quality and visually stunning. It has a display size of 32 inch flat screen and comes with two HDMI ports that allow you connect your USB to view multimedia files on the television. You will experience more entertainment as it does not restrict you to just programs on television or movies via the DVD player.\r\n\r\n \r\n\r\n \r\n\r\nCrafted with Perfection\r\n\r\nJVC LED 32" Screen HD Ready TV is a revolutionary television that adds reality to your imagination and provides you a whole new level of entertainment. Its slim design with an attractive panel scores high on looks and adds to the decor of your interior as well. You will experience more entertainment as it does not restrict you to just programs on television or movies as this LED panel has a 60 Hz refresh rate to combat distortion of fast moving images. So embrace yourself with a design that is so sleek and attractive.\r\n\r\nTechnology that Unites\r\n\r\nThis HD Ready TV provides excellent black levels, high brightness, and rich colors. It provides you with high definition videos and crystal clear pictures, besides being high on sound quality. JVC Contrast and Brightness technology delivers rich videos.\r\n\r\nPerformance Reloaded\r\n\r\nGet exposed to mighty quality pictures on the 32 inch HD Ready LED display of this JVC LED 32"LED Television in astonishing HD Ready experience. This TV has a trim and solid design with vibrant colors for better images that will complement the decor of any modern home. You can spend more time watching and less time browsing as this LED panel has a 60 Hz refresh rate to combat distortion of fast moving images. It provides you with high definition videos and crystal clear piictures, besides being high on sound quality. JVC Native Resolution delivers an expanded array of rich colors and great images.',
        18,
        NULL,
        53,
        NULL,
        1000,
        'Online Exclusive',
        79999.00,
        59999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        142,
        'P-66D3D7',
        NULL,
        'JVC 32 Inch LED Smart TV',
        'This JVC LT-32N750 32 Inch HD Ready Smart TV with Wifi build is one of the most powerful series of the Smart & HD Ready LED in the TV market. It has HDMI, USB, AV In, VGA component in, motion sensing games, smart multi screen interaction and hd resolution.\r\n\r\nFar more movies, TV episodes, music, news, sports, kids\' shows and free programming than any other streaming player. Experience all your movie, video, and music experience in crystal clear, sharp, vibrant picture quality thanks to the built-in CrystalColor engine and hear the difference with JVCs innovative Sound and surround sound processor.\r\n\r\nUSB port function: With USB port function, simply plug your USB memory drive into the TV and instantaneously enjoy movies, photos or music. Now, you can experience a wide variety of content in the comfort of your living room on your TV.',
        18,
        NULL,
        53,
        NULL,
        1000,
        'Online Exclusive',
        99999.00,
        69999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        143,
        'P-B0EFE5',
        NULL,
        'JBL Tune 720BT - Black',
        'Immerse in JBL Pure Bass sound wherever you go.\r\nThe JBL Tune 720BT headphones stream powerful JBL Pure Bass sound thanks to the latest 5.3 BT technology. Easy to use, these headphones provide up to 76 hours of pure pleasure and an extra 3 hours of battery with just 5 minutes of charge. Download the free JBL Headphones App and customize your sound through the EQ, while Voice Prompts guide you through the headphones features. Manage calls, sound and volume from the earcup, thanks to the convenient button controls. If a call comes in while you are watching a video on another device, the JBL Tune 720BT seamlessly switches to your mobile device, so you never miss a call. Lightweight and comfortable even after hours of listening, the JBL Tune 720BT headphones fold flat in your backpack to follow you everywhere.\r\n\r\n JBL Pure Bass Sound\r\nThe JBL Tune 720BT utilizes the renowned JBL Pure Bass sound, the same technology that powers the most famous venues all around the world.\r\n\r\nWireless Bluetooth 5.3 technology\r\nWirelessly stream high-quality sound from your smartphone without messy cords with the help of the latest Bluetooth technology.\r\n\r\nCustomize your listening experience\r\nDownload the free JBL Headphones App to tailor the sound to your taste with the EQ. Voice prompts in your desired language guide you through the Tune 720BT features.',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        24999.00,
        19999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:40:43',
        '2025-05-15 10:40:43'
    ),
    (
        144,
        'P-F44DB4',
        NULL,
        'Fast Track Hearables Noise Cancelling Wireless Headphone (Blue)',
        'REFLEX TUNES - OVER THE HEAD BLUE WIRELESS HEADPHONES',
        19,
        NULL,
        62,
        NULL,
        1000,
        'Online Exclusive',
        29999.00,
        18999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:44:15',
        '2025-05-15 10:44:15'
    ),
    (
        145,
        'P-BE5E31',
        NULL,
        'Toshiba 43 Inch Smart TV',
        '-',
        18,
        NULL,
        55,
        NULL,
        1000,
        'Online Exclusive',
        149999.00,
        129999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:48:59',
        '2025-05-15 10:48:59'
    ),
    (
        146,
        'P-EB194F',
        NULL,
        'JVC 43 Inch FHD Smart TV',
        'The JVC LT-43N585 is a 43-inch Full HD Smart LED TV that offers a superior viewing experience with a resolution of 1920x1080 pixels, ensuring clear and vibrant visuals. The TV features a dynamic contrast ratio of 5000:1, enhancing picture depth, and a wide 178Â° viewing angle for consistent image quality from various positions. Equipped with dual 10W speakers, it delivers clear and immersive audio.\r\n\r\nThis smart TV runs on Android OS, offering access to popular streaming apps like Netflix and YouTube, and comes with built-in Wi-Fi for seamless internet connectivity. With multiple ports including HDMI, USB, and VGA, you can easily connect your devices. The LT-43N585 also supports a DVB-T2 tuner for digital TV reception. It is designed with user-friendly features such as a web browser and easy setup, making it a great choice for modern entertainment.',
        18,
        NULL,
        55,
        NULL,
        1000,
        'Online Exclusive',
        144999.00,
        114999.00,
        0,
        NULL,
        0.00,
        NULL,
        '2025-05-15 10:51:58',
        '2025-05-15 10:51:58'
    );

-- Dumping structure for table esuprjxs_crown.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_images_product_id_foreign` (`product_id`),
    CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 353 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.product_images: ~299 rows (approximately)
INSERT IGNORE INTO
    `product_images` (
        `id`,
        `product_id`,
        `image_path`,
        `created_at`,
        `updated_at`
    )
VALUES (
        52,
        'P-A96DE6',
        'product_images/1746782490_public (1).png',
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        53,
        'P-A96DE6',
        'product_images/1746782490_public.png',
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        54,
        'P-A96DE6',
        'product_images/1746782490_public (2).png',
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        55,
        'P-A96DE6',
        'product_images/1746782490_public (3).png',
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        56,
        'P-A96DE6',
        'product_images/1746782490_public (4).png',
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        57,
        'P-312425',
        'product_images/1746782691_public (5).png',
        '2025-05-09 13:24:51',
        '2025-05-09 13:24:51'
    ),
    (
        58,
        'P-312425',
        'product_images/1746782691_public (6).png',
        '2025-05-09 13:24:51',
        '2025-05-09 13:24:51'
    ),
    (
        59,
        'P-312425',
        'product_images/1746782691_public (3).png',
        '2025-05-09 13:24:51',
        '2025-05-09 13:24:51'
    ),
    (
        60,
        'P-650599',
        'product_images/1746782870_public (7).png',
        '2025-05-09 13:27:50',
        '2025-05-09 13:27:50'
    ),
    (
        61,
        'P-650599',
        'product_images/1746782870_public (8).png',
        '2025-05-09 13:27:50',
        '2025-05-09 13:27:50'
    ),
    (
        62,
        'P-650599',
        'product_images/1746782870_public (9).png',
        '2025-05-09 13:27:50',
        '2025-05-09 13:27:50'
    ),
    (
        63,
        'P-650599',
        'product_images/1746782870_public (10).png',
        '2025-05-09 13:27:50',
        '2025-05-09 13:27:50'
    ),
    (
        64,
        'P-760E70',
        'product_images/1746783799_public (11).png',
        '2025-05-09 13:43:19',
        '2025-05-09 13:43:19'
    ),
    (
        65,
        'P-6BF8C1',
        'product_images/1746783926_public (12).png',
        '2025-05-09 13:45:26',
        '2025-05-09 13:45:26'
    ),
    (
        66,
        'P-6BF8C1',
        'product_images/1746783926_public (13).png',
        '2025-05-09 13:45:26',
        '2025-05-09 13:45:26'
    ),
    (
        67,
        'P-6BF8C1',
        'product_images/1746783926_public (14).png',
        '2025-05-09 13:45:26',
        '2025-05-09 13:45:26'
    ),
    (
        68,
        'P-6BF8C1',
        'product_images/1746783926_public (15).png',
        '2025-05-09 13:45:26',
        '2025-05-09 13:45:26'
    ),
    (
        69,
        'P-3043CD',
        'product_images/1746784115_public (11).png',
        '2025-05-09 13:48:35',
        '2025-05-09 13:48:35'
    ),
    (
        70,
        'P-3043CD',
        'product_images/1746784164_public (16).png',
        '2025-05-09 13:49:24',
        '2025-05-09 13:49:24'
    ),
    (
        71,
        'P-D90CBC',
        'product_images/1746784269_public (17).png',
        '2025-05-09 13:51:09',
        '2025-05-09 13:51:09'
    ),
    (
        72,
        'P-8F07C7',
        'product_images/1746784360_public (18).png',
        '2025-05-09 13:52:41',
        '2025-05-09 13:52:41'
    ),
    (
        73,
        'P-869A11',
        'product_images/1746784648_public (19).png',
        '2025-05-09 13:57:28',
        '2025-05-09 13:57:28'
    ),
    (
        74,
        'P-443ED4',
        'product_images/1746784772_public (20).png',
        '2025-05-09 13:59:32',
        '2025-05-09 13:59:32'
    ),
    (
        75,
        'P-77746F',
        'product_images/1746784919_public (21).png',
        '2025-05-09 14:01:59',
        '2025-05-09 14:01:59'
    ),
    (
        76,
        'P-65ED9C',
        'product_images/1746785030_public (22).png',
        '2025-05-09 14:03:50',
        '2025-05-09 14:03:50'
    ),
    (
        77,
        'P-F60CAB',
        'product_images/1746785279_public (23).png',
        '2025-05-09 14:07:59',
        '2025-05-09 14:07:59'
    ),
    (
        78,
        'P-9C0EC4',
        'product_images/1746785497_public (24).png',
        '2025-05-09 14:11:37',
        '2025-05-09 14:11:37'
    ),
    (
        79,
        'P-2D37CB',
        'product_images/1746785682_public (26).png',
        '2025-05-09 14:14:42',
        '2025-05-09 14:14:42'
    ),
    (
        80,
        'P-2D37CB',
        'product_images/1746785682_public (25).png',
        '2025-05-09 14:14:42',
        '2025-05-09 14:14:42'
    ),
    (
        81,
        'P-2D37CB',
        'product_images/1746785682_public (27).png',
        '2025-05-09 14:14:42',
        '2025-05-09 14:14:42'
    ),
    (
        82,
        'P-2D37CB',
        'product_images/1746785682_public (28).png',
        '2025-05-09 14:14:42',
        '2025-05-09 14:14:42'
    ),
    (
        83,
        'P-24265E',
        'product_images/1746785858_public (29).png',
        '2025-05-09 14:17:38',
        '2025-05-09 14:17:38'
    ),
    (
        84,
        'P-24265E',
        'product_images/1746785858_public (30).png',
        '2025-05-09 14:17:38',
        '2025-05-09 14:17:38'
    ),
    (
        85,
        'P-24265E',
        'product_images/1746785858_public (31).png',
        '2025-05-09 14:17:38',
        '2025-05-09 14:17:38'
    ),
    (
        86,
        'P-24265E',
        'product_images/1746785858_public (32).png',
        '2025-05-09 14:17:38',
        '2025-05-09 14:17:38'
    ),
    (
        87,
        'P-C86C3D',
        'product_images/1746786076_public (33).png',
        '2025-05-09 14:21:16',
        '2025-05-09 14:21:16'
    ),
    (
        88,
        'P-C86C3D',
        'product_images/1746786076_public (34).png',
        '2025-05-09 14:21:16',
        '2025-05-09 14:21:16'
    ),
    (
        89,
        'P-C86C3D',
        'product_images/1746786076_public (35).png',
        '2025-05-09 14:21:16',
        '2025-05-09 14:21:16'
    ),
    (
        90,
        'P-C86C3D',
        'product_images/1746786076_public (36).png',
        '2025-05-09 14:21:16',
        '2025-05-09 14:21:16'
    ),
    (
        91,
        'P-967CA1',
        'product_images/1746786217_public (39).png',
        '2025-05-09 14:23:37',
        '2025-05-09 14:23:37'
    ),
    (
        92,
        'P-967CA1',
        'product_images/1746786217_public (40).png',
        '2025-05-09 14:23:37',
        '2025-05-09 14:23:37'
    ),
    (
        93,
        'P-967CA1',
        'product_images/1746786217_public (38).png',
        '2025-05-09 14:23:37',
        '2025-05-09 14:23:37'
    ),
    (
        94,
        'P-967CA1',
        'product_images/1746786217_public (37).png',
        '2025-05-09 14:23:37',
        '2025-05-09 14:23:37'
    ),
    (
        95,
        'P-2E53C9',
        'product_images/1746786338_public (41).png',
        '2025-05-09 14:25:38',
        '2025-05-09 14:25:38'
    ),
    (
        96,
        'P-2E53C9',
        'product_images/1746786338_public (42).png',
        '2025-05-09 14:25:38',
        '2025-05-09 14:25:38'
    ),
    (
        97,
        'P-2E53C9',
        'product_images/1746786338_public (43).png',
        '2025-05-09 14:25:38',
        '2025-05-09 14:25:38'
    ),
    (
        98,
        'P-2E53C9',
        'product_images/1746786338_public (44).png',
        '2025-05-09 14:25:38',
        '2025-05-09 14:25:38'
    ),
    (
        99,
        'P-1AC13B',
        'product_images/1746786577_public (47).png',
        '2025-05-09 14:29:37',
        '2025-05-09 14:29:37'
    ),
    (
        100,
        'P-1AC13B',
        'product_images/1746786577_public (46).png',
        '2025-05-09 14:29:37',
        '2025-05-09 14:29:37'
    ),
    (
        101,
        'P-1AC13B',
        'product_images/1746786577_public (45).png',
        '2025-05-09 14:29:37',
        '2025-05-09 14:29:37'
    ),
    (
        102,
        'P-642A2A',
        'product_images/1746786854_public (48).png',
        '2025-05-09 14:34:14',
        '2025-05-09 14:34:14'
    ),
    (
        103,
        'P-642A2A',
        'product_images/1746786854_public (49).png',
        '2025-05-09 14:34:14',
        '2025-05-09 14:34:14'
    ),
    (
        104,
        'P-642A2A',
        'product_images/1746786854_public (50).png',
        '2025-05-09 14:34:14',
        '2025-05-09 14:34:14'
    ),
    (
        105,
        'P-642A2A',
        'product_images/1746786854_public (51).png',
        '2025-05-09 14:34:14',
        '2025-05-09 14:34:14'
    ),
    (
        106,
        'P-0DCE4F',
        'product_images/1746787008_public (55).png',
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        107,
        'P-0DCE4F',
        'product_images/1746787008_public (56).png',
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        108,
        'P-0DCE4F',
        'product_images/1746787008_public (54).png',
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        109,
        'P-0DCE4F',
        'product_images/1746787008_public (53).png',
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        110,
        'P-0DCE4F',
        'product_images/1746787008_public (52).png',
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        111,
        'P-005BFA',
        'product_images/1746787216_public (60).png',
        '2025-05-09 14:40:16',
        '2025-05-09 14:40:16'
    ),
    (
        112,
        'P-005BFA',
        'product_images/1746787216_public (59).png',
        '2025-05-09 14:40:16',
        '2025-05-09 14:40:16'
    ),
    (
        113,
        'P-005BFA',
        'product_images/1746787216_public (58).png',
        '2025-05-09 14:40:16',
        '2025-05-09 14:40:16'
    ),
    (
        114,
        'P-005BFA',
        'product_images/1746787216_public (57).png',
        '2025-05-09 14:40:16',
        '2025-05-09 14:40:16'
    ),
    (
        115,
        'P-4A69CE',
        'product_images/1746787524_public (61).png',
        '2025-05-09 14:45:24',
        '2025-05-09 14:45:24'
    ),
    (
        116,
        'P-4A69CE',
        'product_images/1746787524_public (62).png',
        '2025-05-09 14:45:24',
        '2025-05-09 14:45:24'
    ),
    (
        117,
        'P-4A69CE',
        'product_images/1746787524_public (60).png',
        '2025-05-09 14:45:24',
        '2025-05-09 14:45:24'
    ),
    (
        118,
        'P-4A69CE',
        'product_images/1746787524_public (59).png',
        '2025-05-09 14:45:24',
        '2025-05-09 14:45:24'
    ),
    (
        119,
        'P-72BFFE',
        'product_images/1746787687_public (63).png',
        '2025-05-09 14:48:07',
        '2025-05-09 14:48:07'
    ),
    (
        120,
        'P-BACDD2',
        'product_images/1746787851_public (66).png',
        '2025-05-09 14:50:51',
        '2025-05-09 14:50:51'
    ),
    (
        121,
        'P-BACDD2',
        'product_images/1746787851_public (65).png',
        '2025-05-09 14:50:51',
        '2025-05-09 14:50:51'
    ),
    (
        122,
        'P-BACDD2',
        'product_images/1746787851_public (64).png',
        '2025-05-09 14:50:51',
        '2025-05-09 14:50:51'
    ),
    (
        123,
        'P-E8B5FB',
        'product_images/1746787934_public (67).png',
        '2025-05-09 14:52:14',
        '2025-05-09 14:52:14'
    ),
    (
        124,
        'P-7E3C3B',
        'product_images/1746788215_public (68).png',
        '2025-05-09 14:56:55',
        '2025-05-09 14:56:55'
    ),
    (
        125,
        'P-E4879B',
        'product_images/1746788558_public (69).png',
        '2025-05-09 15:02:38',
        '2025-05-09 15:02:38'
    ),
    (
        126,
        'P-3DF10D',
        'product_images/1746788739_public (70).png',
        '2025-05-09 15:05:39',
        '2025-05-09 15:05:39'
    ),
    (
        127,
        'P-91D581',
        'product_images/1746806665_public (71).png',
        '2025-05-09 20:04:25',
        '2025-05-09 20:04:25'
    ),
    (
        128,
        'P-91D581',
        'product_images/1746806665_public (72).png',
        '2025-05-09 20:04:25',
        '2025-05-09 20:04:25'
    ),
    (
        129,
        'P-91D581',
        'product_images/1746806665_public (73).png',
        '2025-05-09 20:04:25',
        '2025-05-09 20:04:25'
    ),
    (
        130,
        'P-961D01',
        'product_images/1746807321_public.png',
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        131,
        'P-961D01',
        'product_images/1746807321_public (1).png',
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        132,
        'P-961D01',
        'product_images/1746807321_public (2).png',
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        133,
        'P-961D01',
        'product_images/1746807321_public (3).png',
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        134,
        'P-961D01',
        'product_images/1746807321_public (4).png',
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        135,
        'P-C1ED94',
        'product_images/1746807660_public (7).png',
        '2025-05-09 20:21:00',
        '2025-05-09 20:21:00'
    ),
    (
        136,
        'P-C1ED94',
        'product_images/1746807660_public (8).png',
        '2025-05-09 20:21:00',
        '2025-05-09 20:21:00'
    ),
    (
        137,
        'P-C1ED94',
        'product_images/1746807660_public (6).png',
        '2025-05-09 20:21:00',
        '2025-05-09 20:21:00'
    ),
    (
        138,
        'P-C1ED94',
        'product_images/1746807660_public (5).png',
        '2025-05-09 20:21:00',
        '2025-05-09 20:21:00'
    ),
    (
        139,
        'P-D65B16',
        'product_images/1746807805_public (12).png',
        '2025-05-09 20:23:25',
        '2025-05-09 20:23:25'
    ),
    (
        140,
        'P-D65B16',
        'product_images/1746807805_public (11).png',
        '2025-05-09 20:23:25',
        '2025-05-09 20:23:25'
    ),
    (
        141,
        'P-D65B16',
        'product_images/1746807805_public (10).png',
        '2025-05-09 20:23:25',
        '2025-05-09 20:23:25'
    ),
    (
        142,
        'P-D65B16',
        'product_images/1746807805_public (9).png',
        '2025-05-09 20:23:25',
        '2025-05-09 20:23:25'
    ),
    (
        143,
        'P-D9D80D',
        'product_images/1746808173_public (13).png',
        '2025-05-09 20:29:33',
        '2025-05-09 20:29:33'
    ),
    (
        144,
        'P-D9D80D',
        'product_images/1746808173_public (14).png',
        '2025-05-09 20:29:33',
        '2025-05-09 20:29:33'
    ),
    (
        145,
        'P-D9D80D',
        'product_images/1746808173_public (15).png',
        '2025-05-09 20:29:33',
        '2025-05-09 20:29:33'
    ),
    (
        146,
        'P-2C7274',
        'product_images/1746808322_public (19).png',
        '2025-05-09 20:32:02',
        '2025-05-09 20:32:02'
    ),
    (
        147,
        'P-2C7274',
        'product_images/1746808322_public (20).png',
        '2025-05-09 20:32:02',
        '2025-05-09 20:32:02'
    ),
    (
        148,
        'P-2C7274',
        'product_images/1746808322_public (21).png',
        '2025-05-09 20:32:02',
        '2025-05-09 20:32:02'
    ),
    (
        149,
        'P-2E6DD5',
        'product_images/1746808466_public (22).png',
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        150,
        'P-2E6DD5',
        'product_images/1746808466_public (23).png',
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        151,
        'P-2E6DD5',
        'product_images/1746808466_public (24).png',
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        152,
        'P-2E6DD5',
        'product_images/1746808466_public (25).png',
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        153,
        'P-2E6DD5',
        'product_images/1746808466_public (26).png',
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        154,
        'P-539924',
        'product_images/1746808757_public (27).png',
        '2025-05-09 20:39:17',
        '2025-05-09 20:39:17'
    ),
    (
        155,
        'P-539924',
        'product_images/1746808757_public (28).png',
        '2025-05-09 20:39:17',
        '2025-05-09 20:39:17'
    ),
    (
        156,
        'P-539924',
        'product_images/1746808757_public (29).png',
        '2025-05-09 20:39:17',
        '2025-05-09 20:39:17'
    ),
    (
        157,
        'P-539924',
        'product_images/1746808757_public (30).png',
        '2025-05-09 20:39:17',
        '2025-05-09 20:39:17'
    ),
    (
        158,
        'P-2E8769',
        'product_images/1746809186_public (16).png',
        '2025-05-09 20:46:27',
        '2025-05-09 20:46:27'
    ),
    (
        159,
        'P-2E8769',
        'product_images/1746809187_public (1) (1).png',
        '2025-05-09 20:46:27',
        '2025-05-09 20:46:27'
    ),
    (
        160,
        'P-2E8769',
        'product_images/1746809187_public (2) (1).png',
        '2025-05-09 20:46:27',
        '2025-05-09 20:46:27'
    ),
    (
        161,
        'P-2E8769',
        'product_images/1746809187_public (3) (1).png',
        '2025-05-09 20:46:27',
        '2025-05-09 20:46:27'
    ),
    (
        162,
        'P-3A53EC',
        'product_images/1746809395_public (4) (1).png',
        '2025-05-09 20:49:55',
        '2025-05-09 20:49:55'
    ),
    (
        163,
        'P-3A53EC',
        'product_images/1746809395_public (6) (1).png',
        '2025-05-09 20:49:55',
        '2025-05-09 20:49:55'
    ),
    (
        164,
        'P-3A53EC',
        'product_images/1746809395_public (5) (1).png',
        '2025-05-09 20:49:55',
        '2025-05-09 20:49:55'
    ),
    (
        165,
        'P-79FCA0',
        'product_images/1746809959_public (11) (1).png',
        '2025-05-09 20:59:19',
        '2025-05-09 20:59:19'
    ),
    (
        166,
        'P-79FCA0',
        'product_images/1746809959_public (9) (1).png',
        '2025-05-09 20:59:19',
        '2025-05-09 20:59:19'
    ),
    (
        167,
        'P-79FCA0',
        'product_images/1746809959_public (10) (1).png',
        '2025-05-09 20:59:19',
        '2025-05-09 20:59:19'
    ),
    (
        168,
        'P-79FCA0',
        'product_images/1746809959_public (8) (1).png',
        '2025-05-09 20:59:19',
        '2025-05-09 20:59:19'
    ),
    (
        169,
        'P-75A71D',
        'product_images/1746810151_public (15) (1).png',
        '2025-05-09 21:02:31',
        '2025-05-09 21:02:31'
    ),
    (
        170,
        'P-75A71D',
        'product_images/1746810151_public (14) (1).png',
        '2025-05-09 21:02:31',
        '2025-05-09 21:02:31'
    ),
    (
        171,
        'P-75A71D',
        'product_images/1746810151_public (13) (1).png',
        '2025-05-09 21:02:31',
        '2025-05-09 21:02:31'
    ),
    (
        172,
        'P-9DA9E1',
        'product_images/1746810473_public (42).png',
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        173,
        'P-9DA9E1',
        'product_images/1746810473_public (41).png',
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        174,
        'P-9DA9E1',
        'product_images/1746810473_public (40).png',
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        175,
        'P-9DA9E1',
        'product_images/1746810473_public (38).png',
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        176,
        'P-9DA9E1',
        'product_images/1746810473_public (39).png',
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        177,
        'P-9DA9E1',
        'product_images/1746810473_public (37).png',
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        178,
        'P-C96427',
        'product_images/1746811020_public (44).png',
        '2025-05-09 21:17:00',
        '2025-05-09 21:17:00'
    ),
    (
        179,
        'P-C96427',
        'product_images/1746811020_public (45).png',
        '2025-05-09 21:17:00',
        '2025-05-09 21:17:00'
    ),
    (
        180,
        'P-C96427',
        'product_images/1746811020_public (46).png',
        '2025-05-09 21:17:00',
        '2025-05-09 21:17:00'
    ),
    (
        181,
        'P-C96427',
        'product_images/1746811020_public (47).png',
        '2025-05-09 21:17:00',
        '2025-05-09 21:17:00'
    ),
    (
        182,
        'P-B7776D',
        'product_images/1746894091_public (48).png',
        '2025-05-10 20:21:31',
        '2025-05-10 20:21:31'
    ),
    (
        183,
        'P-B7776D',
        'product_images/1746894091_public (49).png',
        '2025-05-10 20:21:31',
        '2025-05-10 20:21:31'
    ),
    (
        184,
        'P-B7776D',
        'product_images/1746894091_public (50).png',
        '2025-05-10 20:21:31',
        '2025-05-10 20:21:31'
    ),
    (
        185,
        'P-B7776D',
        'product_images/1746894091_public (51).png',
        '2025-05-10 20:21:31',
        '2025-05-10 20:21:31'
    ),
    (
        186,
        'P-A0EAE7',
        'product_images/1746894442_public (52).png',
        '2025-05-10 20:27:22',
        '2025-05-10 20:27:22'
    ),
    (
        187,
        'P-A0EAE7',
        'product_images/1746894442_public (53) (1).png',
        '2025-05-10 20:27:22',
        '2025-05-10 20:27:22'
    ),
    (
        188,
        'P-A0EAE7',
        'product_images/1746894442_public (54).png',
        '2025-05-10 20:27:22',
        '2025-05-10 20:27:22'
    ),
    (
        189,
        'P-A0EAE7',
        'product_images/1746894442_public (55).png',
        '2025-05-10 20:27:22',
        '2025-05-10 20:27:22'
    ),
    (
        190,
        'P-A9E6C2',
        'product_images/1746894826_public (57).png',
        '2025-05-10 20:33:46',
        '2025-05-10 20:33:46'
    ),
    (
        191,
        'P-A9E6C2',
        'product_images/1746894826_public (58).png',
        '2025-05-10 20:33:46',
        '2025-05-10 20:33:46'
    ),
    (
        192,
        'P-A9E6C2',
        'product_images/1746894826_public (59).png',
        '2025-05-10 20:33:46',
        '2025-05-10 20:33:46'
    ),
    (
        193,
        'P-A9E6C2',
        'product_images/1746894826_public (60).png',
        '2025-05-10 20:33:46',
        '2025-05-10 20:33:46'
    ),
    (
        194,
        'P-1A26AA',
        'product_images/1746895105_public (61).png',
        '2025-05-10 20:38:25',
        '2025-05-10 20:38:25'
    ),
    (
        195,
        'P-1A26AA',
        'product_images/1746895105_public (62).png',
        '2025-05-10 20:38:25',
        '2025-05-10 20:38:25'
    ),
    (
        196,
        'P-1A26AA',
        'product_images/1746895105_public (63).png',
        '2025-05-10 20:38:25',
        '2025-05-10 20:38:25'
    ),
    (
        197,
        'P-382949',
        'product_images/1746895219_public (64).png',
        '2025-05-10 20:40:19',
        '2025-05-10 20:40:19'
    ),
    (
        198,
        'P-382949',
        'product_images/1746895219_public (65).png',
        '2025-05-10 20:40:19',
        '2025-05-10 20:40:19'
    ),
    (
        199,
        'P-382949',
        'product_images/1746895219_public (66).png',
        '2025-05-10 20:40:19',
        '2025-05-10 20:40:19'
    ),
    (
        200,
        'P-F451BF',
        'product_images/1746895487_public (70).png',
        '2025-05-10 20:44:47',
        '2025-05-10 20:44:47'
    ),
    (
        201,
        'P-F451BF',
        'product_images/1746895487_public (69).png',
        '2025-05-10 20:44:47',
        '2025-05-10 20:44:47'
    ),
    (
        202,
        'P-F451BF',
        'product_images/1746895487_public (68).png',
        '2025-05-10 20:44:47',
        '2025-05-10 20:44:47'
    ),
    (
        203,
        'P-F451BF',
        'product_images/1746895487_public (67).png',
        '2025-05-10 20:44:47',
        '2025-05-10 20:44:47'
    ),
    (
        204,
        'P-C8777B',
        'product_images/1746896924_public (71).png',
        '2025-05-10 21:08:44',
        '2025-05-10 21:08:44'
    ),
    (
        205,
        'P-C8777B',
        'product_images/1746896924_public (72).png',
        '2025-05-10 21:08:44',
        '2025-05-10 21:08:44'
    ),
    (
        206,
        'P-C8777B',
        'product_images/1746896924_public (73).png',
        '2025-05-10 21:08:44',
        '2025-05-10 21:08:44'
    ),
    (
        207,
        'P-B40A9F',
        'product_images/1746897819_public (74).png',
        '2025-05-10 21:23:39',
        '2025-05-10 21:23:39'
    ),
    (
        208,
        'P-B40A9F',
        'product_images/1746897819_public (75).png',
        '2025-05-10 21:23:39',
        '2025-05-10 21:23:39'
    ),
    (
        209,
        'P-B40A9F',
        'product_images/1746897819_public (76).png',
        '2025-05-10 21:23:39',
        '2025-05-10 21:23:39'
    ),
    (
        210,
        'P-C53873',
        'product_images/1746898300_public (80).png',
        '2025-05-10 21:31:40',
        '2025-05-10 21:31:40'
    ),
    (
        211,
        'P-C53873',
        'product_images/1746898300_public (79).png',
        '2025-05-10 21:31:40',
        '2025-05-10 21:31:40'
    ),
    (
        212,
        'P-C53873',
        'product_images/1746898300_public (78).png',
        '2025-05-10 21:31:40',
        '2025-05-10 21:31:40'
    ),
    (
        213,
        'P-C53873',
        'product_images/1746898300_public (77).png',
        '2025-05-10 21:31:40',
        '2025-05-10 21:31:40'
    ),
    (
        216,
        'P-383543',
        'product_images/1747218867_public.png',
        '2025-05-14 14:34:27',
        '2025-05-14 14:34:27'
    ),
    (
        217,
        'P-383543',
        'product_images/1747218867_public (1).png',
        '2025-05-14 14:34:27',
        '2025-05-14 14:34:27'
    ),
    (
        218,
        'P-383543',
        'product_images/1747218867_public (2).png',
        '2025-05-14 14:34:27',
        '2025-05-14 14:34:27'
    ),
    (
        219,
        'P-383543',
        'product_images/1747218867_public (3).png',
        '2025-05-14 14:34:27',
        '2025-05-14 14:34:27'
    ),
    (
        220,
        'P-29BB08',
        'product_images/1747219602_public (1).png',
        '2025-05-14 14:46:42',
        '2025-05-14 14:46:42'
    ),
    (
        221,
        'P-29BB08',
        'product_images/1747219602_public (2).png',
        '2025-05-14 14:46:42',
        '2025-05-14 14:46:42'
    ),
    (
        222,
        'P-29BB08',
        'product_images/1747219602_public.png',
        '2025-05-14 14:46:42',
        '2025-05-14 14:46:42'
    ),
    (
        223,
        'P-E2FAD9',
        'product_images/1747219774_public.png',
        '2025-05-14 14:49:34',
        '2025-05-14 14:49:34'
    ),
    (
        224,
        'P-E2FAD9',
        'product_images/1747219774_public (1).png',
        '2025-05-14 14:49:34',
        '2025-05-14 14:49:34'
    ),
    (
        225,
        'P-3D5F4B',
        'product_images/1747219907_public.png',
        '2025-05-14 14:51:47',
        '2025-05-14 14:51:47'
    ),
    (
        226,
        'P-3D5F4B',
        'product_images/1747219907_public (1).png',
        '2025-05-14 14:51:47',
        '2025-05-14 14:51:47'
    ),
    (
        227,
        'P-3D5F4B',
        'product_images/1747219907_public (2).png',
        '2025-05-14 14:51:47',
        '2025-05-14 14:51:47'
    ),
    (
        228,
        'P-0EC96B',
        'product_images/1747220465_public.png',
        '2025-05-14 15:01:05',
        '2025-05-14 15:01:05'
    ),
    (
        229,
        'P-0EC96B',
        'product_images/1747220465_public (1).png',
        '2025-05-14 15:01:05',
        '2025-05-14 15:01:05'
    ),
    (
        230,
        'P-0EC96B',
        'product_images/1747220465_public (2).png',
        '2025-05-14 15:01:05',
        '2025-05-14 15:01:05'
    ),
    (
        231,
        'P-AED0CD',
        'product_images/1747220667_public.png',
        '2025-05-14 15:04:27',
        '2025-05-14 15:04:27'
    ),
    (
        232,
        'P-AED0CD',
        'product_images/1747220667_public (1).png',
        '2025-05-14 15:04:27',
        '2025-05-14 15:04:27'
    ),
    (
        233,
        'P-AED0CD',
        'product_images/1747220667_public (2).png',
        '2025-05-14 15:04:27',
        '2025-05-14 15:04:27'
    ),
    (
        234,
        'P-E7A29F',
        'product_images/1747220830_public.png',
        '2025-05-14 15:07:10',
        '2025-05-14 15:07:10'
    ),
    (
        235,
        'P-E7A29F',
        'product_images/1747220830_public (1).png',
        '2025-05-14 15:07:10',
        '2025-05-14 15:07:10'
    ),
    (
        236,
        'P-E7A29F',
        'product_images/1747220830_public (2).png',
        '2025-05-14 15:07:10',
        '2025-05-14 15:07:10'
    ),
    (
        237,
        'P-4EB516',
        'product_images/1747220981_public (5).png',
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        238,
        'P-4EB516',
        'product_images/1747220981_public (4).png',
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        239,
        'P-4EB516',
        'product_images/1747220981_public (3).png',
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        240,
        'P-4EB516',
        'product_images/1747220981_public (2).png',
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        241,
        'P-4EB516',
        'product_images/1747220981_public (1).png',
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        242,
        'P-4EB516',
        'product_images/1747220981_public.png',
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        243,
        'P-5ECB5C',
        'product_images/1747221109_public.png',
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        244,
        'P-5ECB5C',
        'product_images/1747221109_public (1).png',
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        245,
        'P-5ECB5C',
        'product_images/1747221109_public (2).png',
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        246,
        'P-5ECB5C',
        'product_images/1747221109_public (3).png',
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        247,
        'P-5ECB5C',
        'product_images/1747221109_public (4).png',
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        248,
        'P-8EA446',
        'product_images/1747221272_public.png',
        '2025-05-14 15:14:32',
        '2025-05-14 15:14:32'
    ),
    (
        249,
        'P-8EA446',
        'product_images/1747221272_public (1).png',
        '2025-05-14 15:14:32',
        '2025-05-14 15:14:32'
    ),
    (
        250,
        'P-8EA446',
        'product_images/1747221272_public (2).png',
        '2025-05-14 15:14:32',
        '2025-05-14 15:14:32'
    ),
    (
        251,
        'P-8EA446',
        'product_images/1747221273_public (3).png',
        '2025-05-14 15:14:33',
        '2025-05-14 15:14:33'
    ),
    (
        252,
        'P-8EA446',
        'product_images/1747221273_public (4).png',
        '2025-05-14 15:14:33',
        '2025-05-14 15:14:33'
    ),
    (
        253,
        'P-8EA446',
        'product_images/1747221273_public (5).png',
        '2025-05-14 15:14:33',
        '2025-05-14 15:14:33'
    ),
    (
        254,
        'P-7D82BC',
        'product_images/1747221415_public.png',
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        255,
        'P-7D82BC',
        'product_images/1747221415_public (1).png',
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        256,
        'P-7D82BC',
        'product_images/1747221415_public (2).png',
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        257,
        'P-7D82BC',
        'product_images/1747221415_public (3).png',
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        258,
        'P-7D82BC',
        'product_images/1747221415_public (4).png',
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        259,
        'P-3EAE99',
        'product_images/1747222419_public (2).png',
        '2025-05-14 15:33:40',
        '2025-05-14 15:33:40'
    ),
    (
        260,
        'P-DE87D5',
        'product_images/1747222749_public (3).png',
        '2025-05-14 15:39:09',
        '2025-05-14 15:39:09'
    ),
    (
        261,
        'P-60B530',
        'product_images/1747223350_public (4).png',
        '2025-05-14 15:49:10',
        '2025-05-14 15:49:10'
    ),
    (
        262,
        'P-726D0C',
        'product_images/1747223767_public.png',
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        263,
        'P-726D0C',
        'product_images/1747223767_public (1).png',
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        264,
        'P-726D0C',
        'product_images/1747223767_public (2).png',
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        265,
        'P-726D0C',
        'product_images/1747223767_public (3).png',
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        266,
        'P-726D0C',
        'product_images/1747223767_public (4).png',
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        267,
        'P-79F0A5',
        'product_images/1747223943_public.png',
        '2025-05-14 15:59:03',
        '2025-05-14 15:59:03'
    ),
    (
        268,
        'P-79F0A5',
        'product_images/1747223943_public (1).png',
        '2025-05-14 15:59:03',
        '2025-05-14 15:59:03'
    ),
    (
        269,
        'P-79F0A5',
        'product_images/1747223943_public (2).png',
        '2025-05-14 15:59:03',
        '2025-05-14 15:59:03'
    ),
    (
        270,
        'P-79F0A5',
        'product_images/1747223943_public (3).png',
        '2025-05-14 15:59:03',
        '2025-05-14 15:59:03'
    ),
    (
        271,
        'P-5DB509',
        'product_images/1747224213_public.png',
        '2025-05-14 16:03:33',
        '2025-05-14 16:03:33'
    ),
    (
        272,
        'P-5DB509',
        'product_images/1747224213_public (1).png',
        '2025-05-14 16:03:33',
        '2025-05-14 16:03:33'
    ),
    (
        273,
        'P-5DB509',
        'product_images/1747224213_public (2).png',
        '2025-05-14 16:03:33',
        '2025-05-14 16:03:33'
    ),
    (
        274,
        'P-5DB509',
        'product_images/1747224213_public (3).png',
        '2025-05-14 16:03:33',
        '2025-05-14 16:03:33'
    ),
    (
        275,
        'P-2E9FB9',
        'product_images/1747224387_public.png',
        '2025-05-14 16:06:27',
        '2025-05-14 16:06:27'
    ),
    (
        276,
        'P-2E9FB9',
        'product_images/1747224387_public (1).png',
        '2025-05-14 16:06:27',
        '2025-05-14 16:06:27'
    ),
    (
        277,
        'P-2E9FB9',
        'product_images/1747224387_public (2).png',
        '2025-05-14 16:06:27',
        '2025-05-14 16:06:27'
    ),
    (
        278,
        'P-1ACB95',
        'product_images/1747224513_public.png',
        '2025-05-14 16:08:33',
        '2025-05-14 16:08:33'
    ),
    (
        279,
        'P-1ACB95',
        'product_images/1747224513_public (1).png',
        '2025-05-14 16:08:33',
        '2025-05-14 16:08:33'
    ),
    (
        280,
        'P-1ACB95',
        'product_images/1747224513_public (2).png',
        '2025-05-14 16:08:33',
        '2025-05-14 16:08:33'
    ),
    (
        281,
        'P-3D53F8',
        'product_images/1747224739_public.png',
        '2025-05-14 16:12:19',
        '2025-05-14 16:12:19'
    ),
    (
        282,
        'P-3D53F8',
        'product_images/1747224739_public (1).png',
        '2025-05-14 16:12:19',
        '2025-05-14 16:12:19'
    ),
    (
        283,
        'P-3D53F8',
        'product_images/1747224739_public (2).png',
        '2025-05-14 16:12:19',
        '2025-05-14 16:12:19'
    ),
    (
        284,
        'P-3D53F8',
        'product_images/1747224739_public (3).png',
        '2025-05-14 16:12:19',
        '2025-05-14 16:12:19'
    ),
    (
        285,
        'P-374510',
        'product_images/1747224867_public.png',
        '2025-05-14 16:14:27',
        '2025-05-14 16:14:27'
    ),
    (
        286,
        'P-374510',
        'product_images/1747224867_public (1).png',
        '2025-05-14 16:14:27',
        '2025-05-14 16:14:27'
    ),
    (
        287,
        'P-374510',
        'product_images/1747224867_public (2).png',
        '2025-05-14 16:14:27',
        '2025-05-14 16:14:27'
    ),
    (
        288,
        'P-7D4929',
        'product_images/1747225223_public.png',
        '2025-05-14 16:20:23',
        '2025-05-14 16:20:23'
    ),
    (
        289,
        'P-7D4929',
        'product_images/1747225223_public (1).png',
        '2025-05-14 16:20:23',
        '2025-05-14 16:20:23'
    ),
    (
        290,
        'P-7D4929',
        'product_images/1747225223_public (2).png',
        '2025-05-14 16:20:23',
        '2025-05-14 16:20:23'
    ),
    (
        291,
        'P-7D4929',
        'product_images/1747225223_public (3).png',
        '2025-05-14 16:20:23',
        '2025-05-14 16:20:23'
    ),
    (
        292,
        'P-66A591',
        'product_images/1747225510_public.png',
        '2025-05-14 16:25:10',
        '2025-05-14 16:25:10'
    ),
    (
        293,
        'P-66A591',
        'product_images/1747225510_public (1).png',
        '2025-05-14 16:25:10',
        '2025-05-14 16:25:10'
    ),
    (
        294,
        'P-66A591',
        'product_images/1747225510_public (2).png',
        '2025-05-14 16:25:10',
        '2025-05-14 16:25:10'
    ),
    (
        295,
        'P-4E3CB0',
        'product_images/1747225813_public.png',
        '2025-05-14 16:30:13',
        '2025-05-14 16:30:13'
    ),
    (
        296,
        'P-4E3CB0',
        'product_images/1747225813_public (1).png',
        '2025-05-14 16:30:13',
        '2025-05-14 16:30:13'
    ),
    (
        297,
        'P-4E3CB0',
        'product_images/1747225813_public (2).png',
        '2025-05-14 16:30:13',
        '2025-05-14 16:30:13'
    ),
    (
        298,
        'P-512CCA',
        'product_images/1747231301_public.png',
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        299,
        'P-512CCA',
        'product_images/1747231301_public (1).png',
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        300,
        'P-512CCA',
        'product_images/1747231301_public (2).png',
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        301,
        'P-512CCA',
        'product_images/1747231301_public (3).png',
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        302,
        'P-512CCA',
        'product_images/1747231301_public (4).png',
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        303,
        'P-F87A4D',
        'product_images/1747231423_public.png',
        '2025-05-14 18:03:43',
        '2025-05-14 18:03:43'
    ),
    (
        304,
        'P-F87A4D',
        'product_images/1747231423_public (1).png',
        '2025-05-14 18:03:43',
        '2025-05-14 18:03:43'
    ),
    (
        305,
        'P-F87A4D',
        'product_images/1747231423_public (2).png',
        '2025-05-14 18:03:43',
        '2025-05-14 18:03:43'
    ),
    (
        306,
        'P-F87A4D',
        'product_images/1747231423_public (3).png',
        '2025-05-14 18:03:43',
        '2025-05-14 18:03:43'
    ),
    (
        307,
        'P-23F763',
        'product_images/1747231618_public.png',
        '2025-05-14 18:06:58',
        '2025-05-14 18:06:58'
    ),
    (
        308,
        'P-23F763',
        'product_images/1747231618_public (1).png',
        '2025-05-14 18:06:58',
        '2025-05-14 18:06:58'
    ),
    (
        309,
        'P-23F763',
        'product_images/1747231618_public (2).png',
        '2025-05-14 18:06:58',
        '2025-05-14 18:06:58'
    ),
    (
        310,
        'P-23F763',
        'product_images/1747231618_public (3).png',
        '2025-05-14 18:06:58',
        '2025-05-14 18:06:58'
    ),
    (
        311,
        'P-A5101B',
        'product_images/1747231658_public (5).png',
        '2025-05-14 18:07:38',
        '2025-05-14 18:07:38'
    ),
    (
        312,
        'P-65430A',
        'product_images/1747231910_public (6).png',
        '2025-05-14 18:11:50',
        '2025-05-14 18:11:50'
    ),
    (
        313,
        'P-542479',
        'product_images/1747232197_public (7).png',
        '2025-05-14 18:16:37',
        '2025-05-14 18:16:37'
    ),
    (
        314,
        'P-2EAD9C',
        'product_images/1747232290_public (4).png',
        '2025-05-14 18:18:10',
        '2025-05-14 18:18:10'
    ),
    (
        315,
        'P-2EAD9C',
        'product_images/1747232290_public (1) (1).png',
        '2025-05-14 18:18:10',
        '2025-05-14 18:18:10'
    ),
    (
        316,
        'P-2EAD9C',
        'product_images/1747232290_public (2) (1).png',
        '2025-05-14 18:18:10',
        '2025-05-14 18:18:10'
    ),
    (
        317,
        'P-2EAD9C',
        'product_images/1747232290_public (3) (1).png',
        '2025-05-14 18:18:10',
        '2025-05-14 18:18:10'
    ),
    (
        318,
        'P-60A2A4',
        'product_images/1747232598_public (8).png',
        '2025-05-14 18:23:18',
        '2025-05-14 18:23:18'
    ),
    (
        319,
        'P-881101',
        'product_images/1747234616_public (9).png',
        '2025-05-14 18:56:56',
        '2025-05-14 18:56:56'
    ),
    (
        320,
        'P-902D6B',
        'product_images/1747282969_public (11).png',
        '2025-05-15 08:22:49',
        '2025-05-15 08:22:49'
    ),
    (
        321,
        'P-48574B',
        'product_images/1747285716_public (12).png',
        '2025-05-15 09:08:36',
        '2025-05-15 09:08:36'
    ),
    (
        322,
        'P-9BD836',
        'product_images/1747285961_public (13).png',
        '2025-05-15 09:12:41',
        '2025-05-15 09:12:41'
    ),
    (
        323,
        'P-C5EFFA',
        'product_images/1747286124_public (14).png',
        '2025-05-15 09:15:24',
        '2025-05-15 09:15:24'
    ),
    (
        324,
        'P-87BBC7',
        'product_images/1747286328_public (15).png',
        '2025-05-15 09:18:48',
        '2025-05-15 09:18:48'
    ),
    (
        325,
        'P-D98766',
        'product_images/1747286493_public (16).png',
        '2025-05-15 09:21:33',
        '2025-05-15 09:21:33'
    ),
    (
        326,
        'P-FEBC6F',
        'product_images/1747286687_public (17).png',
        '2025-05-15 09:24:47',
        '2025-05-15 09:24:47'
    ),
    (
        327,
        'P-0D5EC4',
        'product_images/1747286928_public (18).png',
        '2025-05-15 09:28:48',
        '2025-05-15 09:28:48'
    ),
    (
        328,
        'P-484730',
        'product_images/1747287252_public (19).png',
        '2025-05-15 09:34:12',
        '2025-05-15 09:34:12'
    ),
    (
        329,
        'P-7964B2',
        'product_images/1747287703_public (20).png',
        '2025-05-15 09:41:43',
        '2025-05-15 09:41:43'
    ),
    (
        330,
        'P-74AD13',
        'product_images/1747290791_public.png',
        '2025-05-15 10:33:11',
        '2025-05-15 10:33:11'
    ),
    (
        331,
        'P-74AD13',
        'product_images/1747290791_public (1).png',
        '2025-05-15 10:33:11',
        '2025-05-15 10:33:11'
    ),
    (
        332,
        'P-74AD13',
        'product_images/1747290791_public (2).png',
        '2025-05-15 10:33:11',
        '2025-05-15 10:33:11'
    ),
    (
        333,
        'P-F50BCD',
        'product_images/1747290911_public (1).png',
        '2025-05-15 10:35:11',
        '2025-05-15 10:35:11'
    ),
    (
        334,
        'P-F50BCD',
        'product_images/1747290911_public.png',
        '2025-05-15 10:35:11',
        '2025-05-15 10:35:11'
    ),
    (
        335,
        'P-F50BCD',
        'product_images/1747290911_public (2).png',
        '2025-05-15 10:35:11',
        '2025-05-15 10:35:11'
    ),
    (
        336,
        'P-F50BCD',
        'product_images/1747290911_public (3).png',
        '2025-05-15 10:35:11',
        '2025-05-15 10:35:11'
    ),
    (
        337,
        'P-E61ADC',
        'product_images/1747291086_public.png',
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        338,
        'P-E61ADC',
        'product_images/1747291086_public (1).png',
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        339,
        'P-E61ADC',
        'product_images/1747291086_public (2).png',
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        340,
        'P-E61ADC',
        'product_images/1747291086_public (3).png',
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        341,
        'P-E61ADC',
        'product_images/1747291086_public (4).png',
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        342,
        'P-E61ADC',
        'product_images/1747291086_public (5).png',
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        343,
        'P-66D3D7',
        'product_images/1747291190_public.png',
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        344,
        'P-66D3D7',
        'product_images/1747291190_public (1).png',
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        345,
        'P-66D3D7',
        'product_images/1747291190_public (2).png',
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        346,
        'P-66D3D7',
        'product_images/1747291190_public (3).png',
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        347,
        'P-66D3D7',
        'product_images/1747291190_public (4).png',
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        348,
        'P-66D3D7',
        'product_images/1747291190_public (5).png',
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        349,
        'P-B0EFE5',
        'product_images/1747291243_public (21).png',
        '2025-05-15 10:40:43',
        '2025-05-15 10:40:43'
    ),
    (
        350,
        'P-F44DB4',
        'product_images/1747291455_public (22).png',
        '2025-05-15 10:44:15',
        '2025-05-15 10:44:15'
    ),
    (
        351,
        'P-BE5E31',
        'product_images/1747291740_public (23).png',
        '2025-05-15 10:49:00',
        '2025-05-15 10:49:00'
    ),
    (
        352,
        'P-EB194F',
        'product_images/1747291918_public (24).png',
        '2025-05-15 10:51:58',
        '2025-05-15 10:51:58'
    );

-- Dumping structure for table esuprjxs_crown.raffle_tickets
CREATE TABLE IF NOT EXISTS `raffle_tickets` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status` enum(
        'Pending',
        'Active',
        'Used',
        'Expired'
    ) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `raffle_tickets_token_unique` (`token`),
    KEY `raffle_tickets_user_id_foreign` (`user_id`),
    CONSTRAINT `raffle_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `affiliate_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.raffle_tickets: ~1 rows (approximately)
INSERT IGNORE INTO
    `raffle_tickets` (
        `id`,
        `user_id`,
        `token`,
        `status`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        2,
        'hellotracking',
        'Pending',
        '2024-11-19 05:54:35',
        '2024-11-19 05:54:35'
    );

-- Dumping structure for table esuprjxs_crown.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL,
    `order_item_id` bigint unsigned NOT NULL,
    `rating` int unsigned NOT NULL,
    `review` text COLLATE utf8mb4_unicode_ci,
    `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
    `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
    `status` enum(
        'Pending',
        'Published',
        'Rejected'
    ) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `reviewer_id` bigint unsigned DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `reviews_product_id_foreign` (`product_id`),
    KEY `reviews_order_item_id_foreign` (`order_item_id`),
    KEY `reviews_reviewer_id_foreign` (`reviewer_id`),
    CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `customer_order_items` (`id`) ON DELETE CASCADE,
    CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
    CONSTRAINT `reviews_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `reviews_chk_1` CHECK (json_valid(`media`))
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.reviews: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `apartment_id` bigint unsigned NOT NULL,
    `floor_id` bigint unsigned NOT NULL,
    `room_type_id` bigint unsigned NOT NULL,
    `room_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `rental_price` decimal(8, 2) DEFAULT NULL,
    `occupancy_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
    `facilities` text COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `rooms_floor_id_foreign` (`floor_id`),
    KEY `rooms_room_type_id_foreign` (`room_type_id`),
    KEY `rooms_apartment_id_foreign` (`apartment_id`),
    CONSTRAINT `rooms_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE,
    CONSTRAINT `rooms_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`) ON DELETE CASCADE,
    CONSTRAINT `rooms_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.rooms: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.room_types
CREATE TABLE IF NOT EXISTS `room_types` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `room_types_chk_1` CHECK (json_valid(`images`))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.room_types: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
    `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id` bigint unsigned DEFAULT NULL,
    `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `user_agent` text COLLATE utf8mb4_unicode_ci,
    `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_activity` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `sessions_user_id_index` (`user_id`),
    KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.sessions: ~3 rows (approximately)
INSERT IGNORE INTO
    `sessions` (
        `id`,
        `user_id`,
        `ip_address`,
        `user_agent`,
        `payload`,
        `last_activity`
    )
VALUES (
        '28dmCA4kbUNdffURPCPhRlyQ9eZgqYqSyNB1KKm3',
        NULL,
        '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
        'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejNybVNTRmgxek8xTzRPenFUUkhFckNoM3E0cXdOcnNuMDNrTnpvVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',
        1748405163
    ),
    (
        'BKiQy4M5PpsD1UJrvvRvTVMteA25bsESDaW39IRF',
        NULL,
        '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
        'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiS2hnamVHRERiRDliUmE5RjY5bzczZllRVnlEb0lYdXVucDVURlhBaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9yZXZpZXdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJpc19hZG1pbiI7YjoxO3M6NDoibmFtZSI7czo1OiJBZG1pbiI7czo1OiJlbWFpbCI7czoxNzoiYWRtaW5AZXhhbXBsZS5jb20iO3M6NToiaW1hZ2UiO047fQ==',
        1744786906
    ),
    (
        'ZiX8TanATiZ5FcEtPGRXLzwRcKF1ZoVXHanjbIrp',
        NULL,
        '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
        'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWYyRzJ6OHlyUDVIdWhsUzhRbFo4ZnI3NkRyMk9MbHBQT2d3ZklPdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',
        1744781864
    );

-- Dumping structure for table esuprjxs_crown.shops
CREATE TABLE IF NOT EXISTS `shops` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `vendor_id` bigint unsigned NOT NULL,
    `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `shop_description` text COLLATE utf8mb4_unicode_ci,
    `shop_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `shops_vendor_id_foreign` (`vendor_id`),
    CONSTRAINT `shops_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.shops: ~1 rows (approximately)
INSERT IGNORE INTO
    `shops` (
        `id`,
        `vendor_id`,
        `shop_name`,
        `shop_description`,
        `shop_logo`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        1,
        'DK Mart',
        'DK MART',
        'shop_logos/dklogo.png',
        '2024-11-19 03:03:09',
        '2024-11-25 05:52:42'
    );

-- Dumping structure for table esuprjxs_crown.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.sliders: ~3 rows (approximately)
INSERT IGNORE INTO
    `sliders` (
        `id`,
        `image`,
        `created_at`,
        `updated_at`
    )
VALUES (
        5,
        'slider_images/NCsBFkniIRpXkspADqHSTEngqGW5leB5bemMxePs.png',
        '2025-05-08 07:58:53',
        '2025-05-08 07:58:53'
    ),
    (
        6,
        'slider_images/27Kcs4HV8JUGlDHzx2mo5OQcc0KPF5UY8ykyHNrk.png',
        '2025-05-08 07:59:04',
        '2025-05-08 07:59:04'
    ),
    (
        7,
        'slider_images/mZDEe2rZER26ZyIYLCbw0uEuu0UG1C44REiJ1TsD.png',
        '2025-05-08 07:59:13',
        '2025-05-08 07:59:13'
    );

-- Dumping structure for table esuprjxs_crown.staff
CREATE TABLE IF NOT EXISTS `staff` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `position_id` bigint unsigned NOT NULL,
    `department_id` bigint unsigned NOT NULL,
    `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `date_hired` date NOT NULL,
    `shift_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `notes` text COLLATE utf8mb4_unicode_ci,
    `status` tinyint(1) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `staff_position_id_foreign` (`position_id`),
    KEY `staff_department_id_foreign` (`department_id`),
    CONSTRAINT `staff_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
    CONSTRAINT `staff_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.staff: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.subcategories
CREATE TABLE IF NOT EXISTS `subcategories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `category_id` bigint unsigned NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `subcategories_category_id_foreign` (`category_id`),
    CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 105 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.subcategories: ~52 rows (approximately)
INSERT IGNORE INTO
    `subcategories` (
        `id`,
        `category_id`,
        `name`,
        `created_at`,
        `updated_at`
    )
VALUES (
        53,
        18,
        'JVC TV Special Offer',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        54,
        18,
        'LED TV',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        55,
        18,
        'Smart LED TV',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        56,
        18,
        'UHD TV',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        57,
        18,
        'OLED TV',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        58,
        18,
        'Commercial TV',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        59,
        18,
        'TV Accessories',
        '2025-05-08 11:48:59',
        '2025-05-08 11:48:59'
    ),
    (
        60,
        19,
        'Speakers',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        61,
        19,
        'Earphones',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        62,
        19,
        'Headphones',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        63,
        19,
        'Home Theaters',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        64,
        19,
        'Sound Bars',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        65,
        19,
        'HiFi Systems',
        '2025-05-08 11:50:33',
        '2025-05-08 11:50:33'
    ),
    (
        66,
        20,
        'Refrigerators',
        '2025-05-08 11:52:19',
        '2025-05-08 11:52:19'
    ),
    (
        67,
        20,
        'Washing Machines',
        '2025-05-08 11:52:19',
        '2025-05-08 11:52:19'
    ),
    (
        68,
        20,
        'Heaters & Geyser',
        '2025-05-08 11:52:20',
        '2025-05-08 11:52:20'
    ),
    (
        69,
        20,
        'Fans',
        '2025-05-08 11:52:20',
        '2025-05-08 11:52:20'
    ),
    (
        70,
        20,
        'Irons',
        '2025-05-08 11:52:20',
        '2025-05-08 11:52:20'
    ),
    (
        71,
        20,
        'Air Conditioners',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        72,
        20,
        'Water Purifiers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        73,
        20,
        'Home Improvement',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        74,
        20,
        'Home Utensils',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        75,
        20,
        'Sanitaryware',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        76,
        20,
        'Morphy Richards',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        77,
        20,
        'Floor Care',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        78,
        21,
        'Mobile Phones',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        79,
        21,
        'Tablets',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        80,
        21,
        'Smart Bands & Smart Watches',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        81,
        21,
        'Mobile Phone Accessories',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        82,
        21,
        'Smart Education',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        83,
        22,
        'IPhones',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        84,
        22,
        'IPads',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        85,
        22,
        'IMac',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        86,
        22,
        'MacBooks',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        87,
        22,
        'AirPods',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        88,
        22,
        'Apple Watch New Arrivals',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        89,
        23,
        'Laptops',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        90,
        23,
        'Desktops & Monitors',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        91,
        23,
        'Smart Boards & Kiosk',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        92,
        23,
        'Printers & IT Peripherals',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        93,
        23,
        'IT Accessories',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        94,
        24,
        'Blenders & Mixers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        95,
        24,
        'Ovens',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        96,
        24,
        'Air Fryers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        97,
        24,
        'Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        98,
        24,
        'Kitchen and Cookware',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        99,
        24,
        'Built-in Appliances & Ovens',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        100,
        24,
        'Small Appliances',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        101,
        24,
        'Kettles & Flasks',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        102,
        24,
        'Toasters & Grills',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        103,
        24,
        'Food Processors',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        104,
        24,
        'Dishwashers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    );

-- Dumping structure for table esuprjxs_crown.sub_subcategories
CREATE TABLE IF NOT EXISTS `sub_subcategories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `subcategory_id` bigint unsigned NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `sub_subcategories_subcategory_id_foreign` (`subcategory_id`),
    CONSTRAINT `sub_subcategories_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 97 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.sub_subcategories: ~90 rows (approximately)
INSERT IGNORE INTO
    `sub_subcategories` (
        `id`,
        `subcategory_id`,
        `name`,
        `created_at`,
        `updated_at`
    )
VALUES (
        7,
        66,
        'Single Door',
        '2025-05-08 11:52:19',
        '2025-05-08 11:52:19'
    ),
    (
        8,
        66,
        'Double Door',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        9,
        66,
        'Side by Side',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        10,
        66,
        'Bottom Freezer',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        11,
        66,
        'Mini Bars',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        12,
        66,
        'Freezers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        13,
        66,
        'Bottle Coolers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        14,
        67,
        'Top Loading',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        15,
        67,
        'Front Loading',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        16,
        67,
        'Washers & Dryers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        17,
        67,
        'Semi Auto',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        18,
        68,
        'Heaters',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        19,
        68,
        'Geysers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        20,
        69,
        'Ceiling Fans',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        21,
        69,
        'Pedestal Fans',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        22,
        69,
        'Wall Fans & Table Fans',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        23,
        69,
        'Industrial Fans',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        24,
        69,
        'Air Coolers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        25,
        69,
        'Fan - New Arrivals',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        26,
        70,
        'Dry Irons',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        27,
        70,
        'Steam Irons',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        28,
        71,
        'Inverter AC',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        29,
        71,
        'Non-Inverter AC',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        30,
        73,
        'Generators',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        31,
        73,
        'Water Pumps',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        32,
        73,
        'Gardening Tools',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        33,
        73,
        'Power Tools',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        34,
        73,
        'Cleaning Durables',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        35,
        73,
        'DSI Plastic',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        36,
        73,
        'General Merchandising',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        37,
        74,
        'LED Bulb',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        38,
        74,
        'Medical Devices',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        39,
        74,
        'Torch',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        40,
        74,
        'Weighing Scale',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        41,
        74,
        'ECOCO Accessories',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        42,
        74,
        'Home Accessories',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        43,
        77,
        'Vacuum Cleaners',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        44,
        77,
        'Pressure Washers',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        45,
        77,
        'Robotic Cleaners',
        '2025-05-14 11:53:18',
        '2025-05-14 11:53:18'
    ),
    (
        46,
        78,
        'Mobile Exclusive Deals',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        47,
        78,
        'Smart Mobile Phones',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        48,
        78,
        'Feature Phones',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        49,
        80,
        'Xiaomi Mibro Smart Watches',
        '2025-05-14 12:19:24',
        '2025-05-14 12:19:24'
    ),
    (
        50,
        83,
        'iPhone 11',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        51,
        83,
        'iPhone 12',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        52,
        83,
        'iPhone 13',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        53,
        83,
        'iPhone 14',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        54,
        83,
        'iPhone 15',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        55,
        83,
        'iPhone 16',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        56,
        84,
        'iPad',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        57,
        84,
        'iPad Air',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        58,
        84,
        'iPad Pro',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        59,
        84,
        'iPad Mini',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        60,
        86,
        'MacBook Air',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        61,
        86,
        'MacBook Pro',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        62,
        86,
        'Mac Mini',
        '2025-05-14 12:32:35',
        '2025-05-14 12:32:35'
    ),
    (
        63,
        91,
        'Smart Boards',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        64,
        91,
        'Signages & Kiosk',
        '2025-05-14 12:38:58',
        '2025-05-14 12:38:58'
    ),
    (
        65,
        94,
        'Blenders & Grinders',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        66,
        94,
        'Mixers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        67,
        94,
        'Juicers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        68,
        94,
        'Coffee Machines',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        69,
        94,
        'Hand Blenders',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        70,
        95,
        'Microwave Ovens',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        71,
        95,
        'Electric Oven',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        72,
        95,
        'Cooking Ovens',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        73,
        97,
        'Pressure Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        74,
        97,
        'Rice Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        75,
        97,
        'Food Steamers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        76,
        97,
        'Induction Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        77,
        97,
        'Hot Plates',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        78,
        97,
        'Gas Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        79,
        97,
        'Freestanding Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        80,
        98,
        'Coconut Scraper',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        81,
        98,
        'Kitchen Scale',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        82,
        98,
        'Gas Cylinders & Regulators',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        83,
        98,
        'Kitchen Accessories',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        84,
        99,
        'Hobs & Cookers With Safety',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        85,
        99,
        'Hobs',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        86,
        99,
        'Built-in Ovens',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        87,
        99,
        'Freestanding Cookers',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        88,
        99,
        'Cooker Hoods',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        89,
        100,
        'Saucepans New Arrivals',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        90,
        100,
        'Glassware & Mugs',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        91,
        100,
        'Food Storage & Accessories',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        92,
        100,
        'Saucepan',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        93,
        100,
        'Kitchen Utensils',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        94,
        100,
        'Home Accessories',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        95,
        100,
        'Storage Bins & Baskets',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    ),
    (
        96,
        100,
        'Tea Sets & Dining Sets',
        '2025-05-14 12:52:49',
        '2025-05-14 12:52:49'
    );

-- Dumping structure for table esuprjxs_crown.system_users
CREATE TABLE IF NOT EXISTS `system_users` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status` enum('Active', 'Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `system_users_email_unique` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.system_users: ~2 rows (approximately)
INSERT IGNORE INTO
    `system_users` (
        `id`,
        `name`,
        `email`,
        `contact`,
        `password`,
        `role`,
        `image`,
        `status`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        'Manushi Weerasinghe',
        'manuw2819@gmail.com',
        '0716280394',
        '$2y$12$u9Wf1r7MWu8bNF/iE4ws6ubGM7eEAyVqfcixqejw.eaLguijfOwqy',
        'Admin',
        '1731475199_avatar-1.png',
        'Active',
        '2024-10-30 18:08:27',
        '2024-11-12 23:49:59'
    ),
    (
        2,
        'Manula',
        'manulakavishka9@gmail.com',
        NULL,
        '$2y$12$H4Tb6/2XXbmezI7Taa5eC.x7FFJhM8ck1OD07tyrXKVIErAxQHp96',
        'Admin',
        NULL,
        'Active',
        '2025-05-28 09:33:33',
        '2025-05-28 09:33:34'
    );

-- Dumping structure for table esuprjxs_crown.users
CREATE TABLE IF NOT EXISTS `users` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `dob` date DEFAULT NULL,
    `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `gender` enum('male', 'female', 'other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `users_email_unique` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.users: ~7 rows (approximately)
INSERT IGNORE INTO
    `users` (
        `id`,
        `name`,
        `email`,
        `address`,
        `dob`,
        `phone`,
        `gender`,
        `email_verified_at`,
        `password`,
        `remember_token`,
        `created_at`,
        `updated_at`
    )
VALUES (
        2,
        'Manushi Weerasinghe',
        'manuw2819@gmail.com',
        'No.124, "Sisilasa"',
        '2024-11-01',
        '+94716280393',
        NULL,
        NULL,
        '$2y$12$TE9JIuSOj3RLYDsnvoR.WuT2.kPTqSVp8Y78lUPsM.YISZ5T8XEGm',
        NULL,
        '2024-11-06 23:02:15',
        '2024-11-06 23:02:15'
    ),
    (
        3,
        'k.a.kavidu malshan kulathunga',
        'freelyricshub@gmail.com',
        'f/16,delpathdeniya',
        '1999-07-21',
        '+94719707612',
        'male',
        NULL,
        '$2y$12$VrTjKzIP42MAVFK0.p7LfupuFt42mHDbrWYIsjGe683Kb4enqVA9e',
        NULL,
        '2024-11-19 05:44:33',
        '2024-11-26 06:20:13'
    ),
    (
        4,
        'pavidu',
        'pavidu@gmail.com',
        'ranasigha',
        '1998-07-21',
        '+94719707615',
        NULL,
        NULL,
        '$2y$12$s3feBcTDzqIrvmNlObm2OeYsFaedZ1TzHrx4vtPjtj2gaiEFT7jfK',
        NULL,
        '2024-11-26 22:42:26',
        '2024-11-26 22:42:26'
    ),
    (
        5,
        'kasuni',
        'kasuni@gmail.com',
        'f/16,delpathdeniya',
        '2002-08-20',
        '+94719707620',
        NULL,
        NULL,
        '$2y$12$YIOghwp3KMJffBPmktWnle46DVcoWeTufAZQubYAide3R09EL8gg.',
        NULL,
        '2024-11-26 22:48:59',
        '2024-11-26 22:48:59'
    ),
    (
        6,
        'Anuradha',
        'batmananuradha@gmail.com',
        '164/08/16, Kannadiwaththa, Bomugammana, Divulapitiya, ;mkmk',
        '2025-04-01',
        '+94783302448',
        NULL,
        NULL,
        '$2y$12$zs0rtIk12WPVyHtQ/CaL0eOb2wfRBjQGYvJeOJMQWZdUWsoYk3pM6',
        NULL,
        '2025-04-23 01:00:45',
        '2025-04-23 01:00:45'
    ),
    (
        7,
        'Anuradha Sampath',
        'anuradhasampath666@gmail.com',
        '164/08/16, Kannadiwaththa,, Bomugammana, Divulapitiya',
        '2025-04-07',
        '0783302448',
        NULL,
        NULL,
        '$2y$12$E.SsdKjZ.s9ZLBsZ6Ce6buV.jSS9gfiN2w2O5x.o7JkkJq37.dIkG',
        NULL,
        '2025-04-25 03:35:10',
        '2025-04-25 03:35:10'
    ),
    (
        8,
        'm',
        'manulakavishka9@gmail.com',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        '$2y$12$H4Tb6/2XXbmezI7Taa5eC.x7FFJhM8ck1OD07tyrXKVIErAxQHp96',
        NULL,
        NULL,
        NULL
    );

-- Dumping structure for table esuprjxs_crown.variations
CREATE TABLE IF NOT EXISTS `variations` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `hex_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `quantity` int DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `variations_product_id_foreign` (`product_id`),
    CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 176 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.variations: ~104 rows (approximately)
INSERT IGNORE INTO
    `variations` (
        `id`,
        `product_id`,
        `type`,
        `value`,
        `hex_value`,
        `quantity`,
        `created_at`,
        `updated_at`
    )
VALUES (
        66,
        'P-A96DE6',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:21:30',
        '2025-05-09 13:21:30'
    ),
    (
        67,
        'P-312425',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:24:51',
        '2025-05-09 13:24:51'
    ),
    (
        69,
        'P-760E70',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:43:19',
        '2025-05-09 13:43:19'
    ),
    (
        70,
        'P-6BF8C1',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:45:26',
        '2025-05-09 13:45:26'
    ),
    (
        72,
        'P-3043CD',
        'size',
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:49:24',
        '2025-05-09 13:49:24'
    ),
    (
        73,
        'P-D90CBC',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:51:09',
        '2025-05-09 13:51:09'
    ),
    (
        74,
        'P-8F07C7',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:52:41',
        '2025-05-09 13:52:41'
    ),
    (
        75,
        'P-869A11',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:57:28',
        '2025-05-09 13:57:28'
    ),
    (
        76,
        'P-443ED4',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 13:59:32',
        '2025-05-09 13:59:32'
    ),
    (
        77,
        'P-77746F',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:01:59',
        '2025-05-09 14:01:59'
    ),
    (
        78,
        'P-65ED9C',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:03:50',
        '2025-05-09 14:03:50'
    ),
    (
        79,
        'P-F60CAB',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:07:59',
        '2025-05-09 14:07:59'
    ),
    (
        80,
        'P-9C0EC4',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:11:37',
        '2025-05-09 14:11:37'
    ),
    (
        81,
        'P-2D37CB',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:14:42',
        '2025-05-09 14:14:42'
    ),
    (
        83,
        'P-24265E',
        'size',
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:19:13',
        '2025-05-09 14:19:13'
    ),
    (
        84,
        'P-C86C3D',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:21:16',
        '2025-05-09 14:21:16'
    ),
    (
        85,
        'P-967CA1',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:23:37',
        '2025-05-09 14:23:37'
    ),
    (
        86,
        'P-2E53C9',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:25:38',
        '2025-05-09 14:25:38'
    ),
    (
        87,
        'P-1AC13B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:29:37',
        '2025-05-09 14:29:37'
    ),
    (
        88,
        'P-642A2A',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:34:14',
        '2025-05-09 14:34:14'
    ),
    (
        89,
        'P-0DCE4F',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:36:48',
        '2025-05-09 14:36:48'
    ),
    (
        90,
        'P-005BFA',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:40:16',
        '2025-05-09 14:40:16'
    ),
    (
        91,
        'P-4A69CE',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:45:24',
        '2025-05-09 14:45:24'
    ),
    (
        92,
        'P-72BFFE',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:48:07',
        '2025-05-09 14:48:07'
    ),
    (
        93,
        'P-BACDD2',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:50:51',
        '2025-05-09 14:50:51'
    ),
    (
        94,
        'P-E8B5FB',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:52:14',
        '2025-05-09 14:52:14'
    ),
    (
        95,
        'P-7E3C3B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 14:56:55',
        '2025-05-09 14:56:55'
    ),
    (
        96,
        'P-E4879B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 15:02:38',
        '2025-05-09 15:02:38'
    ),
    (
        97,
        'P-3DF10D',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 15:05:39',
        '2025-05-09 15:05:39'
    ),
    (
        98,
        'P-91D581',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:04:25',
        '2025-05-09 20:04:25'
    ),
    (
        99,
        'P-961D01',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:15:21',
        '2025-05-09 20:15:21'
    ),
    (
        100,
        'P-C1ED94',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:21:00',
        '2025-05-09 20:21:00'
    ),
    (
        101,
        'P-D65B16',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:23:25',
        '2025-05-09 20:23:25'
    ),
    (
        102,
        'P-D9D80D',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:29:33',
        '2025-05-09 20:29:33'
    ),
    (
        103,
        'P-2C7274',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:32:02',
        '2025-05-09 20:32:02'
    ),
    (
        104,
        'P-2E6DD5',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:34:26',
        '2025-05-09 20:34:26'
    ),
    (
        105,
        'P-539924',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:39:17',
        '2025-05-09 20:39:17'
    ),
    (
        106,
        'P-2E8769',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:46:27',
        '2025-05-09 20:46:27'
    ),
    (
        107,
        'P-3A53EC',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:49:55',
        '2025-05-09 20:49:55'
    ),
    (
        108,
        'P-79FCA0',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 20:59:19',
        '2025-05-09 20:59:19'
    ),
    (
        109,
        'P-75A71D',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 21:02:31',
        '2025-05-09 21:02:31'
    ),
    (
        110,
        'P-9DA9E1',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 21:07:53',
        '2025-05-09 21:07:53'
    ),
    (
        111,
        'P-C96427',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-09 21:17:00',
        '2025-05-09 21:17:00'
    ),
    (
        112,
        'P-B7776D',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 20:21:31',
        '2025-05-10 20:21:31'
    ),
    (
        113,
        'P-A0EAE7',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 20:27:22',
        '2025-05-10 20:27:22'
    ),
    (
        114,
        'P-A9E6C2',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 20:33:46',
        '2025-05-10 20:33:46'
    ),
    (
        115,
        'P-1A26AA',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 20:38:25',
        '2025-05-10 20:38:25'
    ),
    (
        116,
        'P-382949',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 20:40:19',
        '2025-05-10 20:40:19'
    ),
    (
        117,
        'P-F451BF',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 20:44:47',
        '2025-05-10 20:44:47'
    ),
    (
        118,
        'P-C8777B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 21:08:44',
        '2025-05-10 21:08:44'
    ),
    (
        119,
        'P-B40A9F',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 21:23:39',
        '2025-05-10 21:23:39'
    ),
    (
        120,
        'P-C53873',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-10 21:31:40',
        '2025-05-10 21:31:40'
    ),
    (
        123,
        'P-383543',
        'size',
        '43',
        NULL,
        NULL,
        '2025-05-14 14:34:27',
        '2025-05-14 14:34:27'
    ),
    (
        124,
        'P-29BB08',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 14:46:42',
        '2025-05-14 14:46:42'
    ),
    (
        125,
        'P-E2FAD9',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 14:49:34',
        '2025-05-14 14:49:34'
    ),
    (
        126,
        'P-3D5F4B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 14:51:47',
        '2025-05-14 14:51:47'
    ),
    (
        127,
        'P-0EC96B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:01:05',
        '2025-05-14 15:01:05'
    ),
    (
        128,
        'P-AED0CD',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:04:27',
        '2025-05-14 15:04:27'
    ),
    (
        129,
        'P-E7A29F',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:07:10',
        '2025-05-14 15:07:10'
    ),
    (
        130,
        'P-4EB516',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:09:41',
        '2025-05-14 15:09:41'
    ),
    (
        131,
        'P-5ECB5C',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:11:49',
        '2025-05-14 15:11:49'
    ),
    (
        132,
        'P-8EA446',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:14:33',
        '2025-05-14 15:14:33'
    ),
    (
        133,
        'P-7D82BC',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:16:55',
        '2025-05-14 15:16:55'
    ),
    (
        134,
        'P-3EAE99',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:33:40',
        '2025-05-14 15:33:40'
    ),
    (
        135,
        'P-DE87D5',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:39:10',
        '2025-05-14 15:39:10'
    ),
    (
        136,
        'P-60B530',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:49:10',
        '2025-05-14 15:49:10'
    ),
    (
        137,
        'P-726D0C',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:56:07',
        '2025-05-14 15:56:07'
    ),
    (
        138,
        'P-79F0A5',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 15:59:03',
        '2025-05-14 15:59:03'
    ),
    (
        139,
        'P-5DB509',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:03:33',
        '2025-05-14 16:03:33'
    ),
    (
        140,
        'P-2E9FB9',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:06:27',
        '2025-05-14 16:06:27'
    ),
    (
        141,
        'P-1ACB95',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:08:33',
        '2025-05-14 16:08:33'
    ),
    (
        142,
        'P-3D53F8',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:12:19',
        '2025-05-14 16:12:19'
    ),
    (
        143,
        'P-374510',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:14:27',
        '2025-05-14 16:14:27'
    ),
    (
        144,
        'P-7D4929',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:20:23',
        '2025-05-14 16:20:23'
    ),
    (
        145,
        'P-66A591',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:25:10',
        '2025-05-14 16:25:10'
    ),
    (
        146,
        'P-4E3CB0',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 16:30:13',
        '2025-05-14 16:30:13'
    ),
    (
        147,
        'P-512CCA',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:01:41',
        '2025-05-14 18:01:41'
    ),
    (
        148,
        'P-F87A4D',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:03:43',
        '2025-05-14 18:03:43'
    ),
    (
        149,
        'P-23F763',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:06:58',
        '2025-05-14 18:06:58'
    ),
    (
        151,
        'P-65430A',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:11:50',
        '2025-05-14 18:11:50'
    ),
    (
        152,
        'P-A5101B',
        'size',
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:12:12',
        '2025-05-14 18:12:12'
    ),
    (
        153,
        'P-542479',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:16:37',
        '2025-05-14 18:16:37'
    ),
    (
        154,
        'P-2EAD9C',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:18:10',
        '2025-05-14 18:18:10'
    ),
    (
        155,
        'P-60A2A4',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:23:18',
        '2025-05-14 18:23:18'
    ),
    (
        156,
        'P-881101',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-14 18:56:56',
        '2025-05-14 18:56:56'
    ),
    (
        157,
        'P-902D6B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 08:22:49',
        '2025-05-15 08:22:49'
    ),
    (
        158,
        'P-48574B',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:08:36',
        '2025-05-15 09:08:36'
    ),
    (
        159,
        'P-9BD836',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:12:41',
        '2025-05-15 09:12:41'
    ),
    (
        160,
        'P-C5EFFA',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:15:24',
        '2025-05-15 09:15:24'
    ),
    (
        161,
        'P-87BBC7',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:18:48',
        '2025-05-15 09:18:48'
    ),
    (
        162,
        'P-D98766',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:21:33',
        '2025-05-15 09:21:33'
    ),
    (
        163,
        'P-FEBC6F',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:24:47',
        '2025-05-15 09:24:47'
    ),
    (
        164,
        'P-0D5EC4',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:28:48',
        '2025-05-15 09:28:48'
    ),
    (
        165,
        'P-484730',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:34:12',
        '2025-05-15 09:34:12'
    ),
    (
        166,
        'P-7964B2',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 09:41:43',
        '2025-05-15 09:41:43'
    ),
    (
        167,
        'P-74AD13',
        'size',
        '55',
        NULL,
        NULL,
        '2025-05-15 10:33:11',
        '2025-05-15 10:33:11'
    ),
    (
        168,
        'P-F50BCD',
        'size',
        '65',
        NULL,
        NULL,
        '2025-05-15 10:35:11',
        '2025-05-15 10:35:11'
    ),
    (
        169,
        'P-E61ADC',
        'size',
        '32',
        NULL,
        NULL,
        '2025-05-15 10:38:06',
        '2025-05-15 10:38:06'
    ),
    (
        170,
        'P-66D3D7',
        'size',
        NULL,
        NULL,
        32,
        '2025-05-15 10:39:50',
        '2025-05-15 10:39:50'
    ),
    (
        171,
        'P-B0EFE5',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 10:40:43',
        '2025-05-15 10:40:43'
    ),
    (
        172,
        'P-F44DB4',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 10:44:15',
        '2025-05-15 10:44:15'
    ),
    (
        173,
        'P-BE5E31',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 10:49:00',
        '2025-05-15 10:49:00'
    ),
    (
        174,
        'P-EB194F',
        NULL,
        NULL,
        NULL,
        NULL,
        '2025-05-15 10:51:58',
        '2025-05-15 10:51:58'
    ),
    (
        175,
        'P-650599',
        'size',
        NULL,
        NULL,
        NULL,
        '2025-05-16 03:07:32',
        '2025-05-16 03:07:32'
    );

-- Dumping structure for table esuprjxs_crown.vendors
CREATE TABLE IF NOT EXISTS `vendors` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `status` enum(
        'pending',
        'approved',
        'rejected'
    ) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
    `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `vendors_email_unique` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.vendors: ~1 rows (approximately)
INSERT IGNORE INTO
    `vendors` (
        `id`,
        `name`,
        `email`,
        `password`,
        `phone`,
        `address`,
        `status`,
        `profile_image`,
        `bank_name`,
        `branch`,
        `account_name`,
        `account_number`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        'Admin',
        'freelyricshub@gmail.com',
        '$2y$12$ply3ddeHLJO/B1J0HMHjFeJDZWJIvDvqCnsB.clYUcxuBUslLeVR.',
        '0712345678',
        'f/16,delpathdeniya',
        'approved',
        NULL,
        'sampath',
        'kegalle',
        'kavidu',
        '12345678',
        '2024-11-19 03:01:00',
        '2024-11-26 19:51:21'
    );

-- Dumping structure for table esuprjxs_crown.vendor_payment_requests
CREATE TABLE IF NOT EXISTS `vendor_payment_requests` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `vendor_id` bigint unsigned NOT NULL,
    `request_amount` decimal(10, 2) NOT NULL,
    `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `processing_fee` decimal(10, 2) NOT NULL DEFAULT '0.00',
    `paid_amount` decimal(10, 2) NOT NULL DEFAULT '0.00',
    `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
    `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `vendor_payment_requests_vendor_id_foreign` (`vendor_id`),
    CONSTRAINT `vendor_payment_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.vendor_payment_requests: ~1 rows (approximately)
INSERT IGNORE INTO
    `vendor_payment_requests` (
        `id`,
        `vendor_id`,
        `request_amount`,
        `bank_name`,
        `branch`,
        `account_name`,
        `account_number`,
        `processing_fee`,
        `paid_amount`,
        `status`,
        `requested_at`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        1,
        1500.00,
        'sampath',
        'kegalle',
        'kavidu',
        '12345678',
        100.00,
        1400.00,
        'Completed',
        '2024-11-26 19:51:39',
        '2024-11-26 19:51:39',
        '2024-11-26 19:52:13'
    );

-- Dumping structure for table esuprjxs_crown.vendor_wallets
CREATE TABLE IF NOT EXISTS `vendor_wallets` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `vendor_id` bigint unsigned NOT NULL,
    `balance` decimal(15, 2) NOT NULL DEFAULT '0.00',
    `total_earnings` decimal(15, 2) NOT NULL DEFAULT '0.00',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `vendor_wallets_vendor_id_foreign` (`vendor_id`),
    CONSTRAINT `vendor_wallets_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.vendor_wallets: ~1 rows (approximately)
INSERT IGNORE INTO
    `vendor_wallets` (
        `id`,
        `vendor_id`,
        `balance`,
        `total_earnings`,
        `created_at`,
        `updated_at`
    )
VALUES (
        1,
        1,
        9450.00,
        9450.00,
        '2024-11-22 01:38:18',
        '2024-11-26 19:49:24'
    );

-- Dumping structure for table esuprjxs_crown.wishlists
CREATE TABLE IF NOT EXISTS `wishlists` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`, `product_id`),
    KEY `wishlists_product_id_foreign` (`product_id`),
    CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
    CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.wishlists: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */
;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */
;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */
;
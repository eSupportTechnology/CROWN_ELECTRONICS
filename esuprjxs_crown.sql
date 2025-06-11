-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.38 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for esuprjxs_crown
CREATE DATABASE IF NOT EXISTS `esuprjxs_crown` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_links: ~1 rows (approximately)
INSERT IGNORE INTO `affiliate_links` (`id`, `user_id`, `raffle_ticket_id`, `link`, `created_at`, `updated_at`) VALUES
	(5, 2, 1, 'http://127.0.0.1:8000/track/hellotracking/P-60B170?redirect=http%3A%2F%2F127.0.0.1%3A8000%2Fproduct-details%2FP-60B170', '2024-11-26 18:55:17', '2024-11-26 18:55:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_product: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.affiliate_referrals
CREATE TABLE IF NOT EXISTS `affiliate_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `raffle_ticket_id` bigint unsigned NOT NULL,
  `product_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views_count` int NOT NULL DEFAULT '0',
  `referral_count` int NOT NULL DEFAULT '0',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `affiliate_commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_affiliate_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliate_referrals_user_id_foreign` (`user_id`),
  KEY `affiliate_referrals_raffle_ticket_id_foreign` (`raffle_ticket_id`),
  CONSTRAINT `affiliate_referrals_raffle_ticket_id_foreign` FOREIGN KEY (`raffle_ticket_id`) REFERENCES `raffle_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `affiliate_referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `affiliate_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_referrals: ~1 rows (approximately)
INSERT IGNORE INTO `affiliate_referrals` (`id`, `user_id`, `raffle_ticket_id`, `product_url`, `views_count`, `referral_count`, `product_price`, `affiliate_commission`, `total_affiliate_price`, `created_at`, `updated_at`) VALUES
	(4, 2, 1, 'http://127.0.0.1:8000/product-details/P-60B170', 4, 2, 4500.00, 2250.00, 2250.00, '2024-11-26 18:55:17', '2024-11-27 05:44:26');

-- Dumping structure for table esuprjxs_crown.affiliate_rules
CREATE TABLE IF NOT EXISTS `affiliate_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_rules: ~1 rows (approximately)
INSERT IGNORE INTO `affiliate_rules` (`id`, `rule`, `created_at`, `updated_at`) VALUES
	(1, 'Commission Structure: Defines how affiliates are paid, either per sale, per lead, or per click, and specifies the payment rate (percentage or flat fee).', '2024-11-11 22:37:23', '2024-11-11 22:37:23');

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
  CONSTRAINT `affiliate_users_chk_1` CHECK (json_valid(`promotion_method`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.affiliate_users: ~2 rows (approximately)
INSERT IGNORE INTO `affiliate_users` (`id`, `name`, `address`, `district`, `DOB`, `gender`, `NIC`, `contactno`, `email`, `password`, `promotion_method`, `instagram_url`, `facebook_url`, `tiktok_url`, `youtube_url`, `content_website_url`, `content_whatsapp_url`, `bank_name`, `branch`, `account_name`, `account_number`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Manushi Weerasinghe', 'No.124, "Sisilasa"', 'Kurunegala', '2000-08-19', 'female', '200073203633', '0716280393', 'manuw2819@gmail.com', '$2y$12$rUIrl.eUkDiqB7vm0QX7/.1NdM2UmfutRc5Ka7DCz8Pc4kErWPeoe', '"[\\"Instagram\\",\\"Facebook\\",\\"TikTok\\",\\"YouTube\\",\\"Content website\\\\\\/blog\\",\\"WhatsApp\\"]"', 'https://www.instagram.com/manushi', 'https://www.facebook.com/manushi', 'https://www.titok.com/manushi', 'https://www.youtube.com/manushi', 'https://www.website.com/manushi', 'https://www.whatsapp.com/manushi', 'BOC', 'Ridigama', 'KGRSM Weerasinghe', '8465232656', 'approved', '2024-11-11 22:40:12', '2024-11-11 22:45:46'),
	(2, 'k.a.kavidu malshan kulathunga', 'f/16,delpathdeniya', 'kegalle', '1999-07-21', 'male', '199920302235', '0719707612', 'admin@dkmart.lk', '$2y$12$3FkW7JE89xPHQTzVT93LWOHS1GupCv4aURH3R6Vxd.kC2/.Q6DjAq', '"[\\"YouTube\\"]"', NULL, NULL, NULL, 'https://www.youtube.com/watch?v=BYQHcxE7g24', NULL, NULL, 'sampath', 'galigamuwa', 'kavidu malshan', '25226987', 'approved', '2024-11-19 05:53:08', '2024-11-26 18:56:37');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.bank_details: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.banners: ~3 rows (approximately)
INSERT IGNORE INTO `banners` (`id`, `image`, `created_at`, `updated_at`) VALUES
	(2, 'banners/pySXFZPbAOSNKlhLiGszBG0eQ4pR6SD5VTGCPbiW.jpg', '2025-05-05 10:31:36', '2025-05-05 10:31:36'),
	(3, 'banners/RtuR6WgcQU6Y1wjIdpW7ZR0yjo6QXoC29DePO8tF.jpg', '2025-05-05 10:31:51', '2025-05-05 10:31:51'),
	(6, 'banners/qBP8s0sWOiqqRHNujv6iqjZGtHHAbieJEZ2uqnQI.jpg', '2025-05-05 10:44:48', '2025-05-05 10:44:48');

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
  `service_charge` decimal(8,2) DEFAULT '0.00',
  `total_cost` decimal(10,2) NOT NULL,
  `discount_applied` decimal(8,2) DEFAULT '0.00',
  `booking_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_customer_id_foreign` (`customer_id`),
  KEY `bookings_room_id_foreign` (`room_id`),
  CONSTRAINT `bookings_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_register` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.bookings: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
 DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
 DEFAULT NULL,
  `is_top_brand` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
;

-- Dumping data for table esuprjxs_crown.brands: ~5 rows (approximately)
INSERT IGNORE INTO `brands` (`id`, `name`, `image`, `slug`, `is_top_brand`, `created_at`, `updated_at`) VALUES
	(1, 'LG', 'brands/Hqdu6dflxfeIavAGEGl8XFRZ7ZH7lGh4AEqBy9sE.svg', 'lg', 1, '2025-05-16 02:52:01', '2025-05-16 02:52:01'),
	(2, 'HP', 'brands/FOiWC5VFOi3SlA0bJKTyMDCO7Saqo8rDoGlxY5yj.png', 'hp', 1, '2025-05-16 03:01:47', '2025-05-16 03:01:47'),
	(3, 'HARMAS', 'brands/o3mZJcVC5A6oWYTywjGZNSJ3nNWHK6mm7mePj6KJ.png', 'harmas', 0, '2025-05-16 03:02:19', '2025-05-16 03:02:19'),
	(4, 'Apple', 'brands/94UhNezXAlKEp52hGpG0I6yDWvG1w7efiMyekpgS.png', 'apple', 1, '2025-05-16 03:04:00', '2025-05-16 03:04:00'),
	(5, 'Abans', 'brands/F6sPf6hiNCT5ol0loL6kr41MdFhUhP5gueFgSJM6.png', 'abans', 1, '2025-05-16 03:04:45', '2025-05-16 03:04:45');

-- Dumping structure for table esuprjxs_crown.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.cache: ~7 rows (approximately)
INSERT IGNORE INTO `cache` (`key`, `value`, `expiration`) VALUES
	('admin@example.com|112.134.226.211', 'i:1;', 1746774616),
	('admin@example.com|112.134.226.211:timer', 'i:1746774616;', 1746774616),
	('admin@example.com|127.0.0.1', 'i:1;', 1745421709),
	('admin@example.com|127.0.0.1:timer', 'i:1745421709;', 1745421709),
	('cart_count_7', 'i:2;', 1745943974),
	('manulakavishka7@gmail.com|127.0.0.1', 'i:1;', 1747392623),
	('manulakavishka7@gmail.com|127.0.0.1:timer', 'i:1747392623;', 1747392623);

-- Dumping structure for table esuprjxs_crown.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.cache_locks: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.cart_items: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.categories: ~17 rows (approximately)
INSERT IGNORE INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Women\'s Fashion', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(2, 'Men\'s Fashion', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
	(3, 'Electronic Devices', '2024-10-31 21:52:35', '2024-10-31 21:52:35'),
	(4, 'TV & Home Appliances', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
	(5, 'Home & Lifestyle', '2024-11-07 00:17:04', '2024-11-07 00:17:04'),
	(6, 'Groceries', '2024-11-07 00:17:32', '2024-11-07 00:17:32'),
	(7, 'Health & Beauty', '2024-11-07 00:19:18', '2024-11-07 00:19:18'),
	(8, 'Watches & Accessories', '2024-11-07 00:20:58', '2024-11-07 00:20:58'),
	(13, 'Sports & Outdoor', '2024-11-11 00:32:37', '2024-11-11 00:32:37'),
	(17, 'new one', '2025-04-22 10:20:15', '2025-04-22 10:20:15'),
	(18, 'TV', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(19, 'Audio & Video', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(20, 'Home Appliances', '2025-05-08 11:52:19', '2025-05-08 11:52:19'),
	(21, 'Mobile Phones & Devices', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(22, 'Apple', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(23, 'Computers', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(24, 'Kitchen Appliances', '2025-05-14 12:52:49', '2025-05-14 12:52:49');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.company_settings: ~1 rows (approximately)
INSERT IGNORE INTO `company_settings` (`id`, `title`, `address`, `email`, `contact`, `website`, `footer_text`, `logo`, `created_at`, `updated_at`) VALUES
	(1, 'CROWN ELECTRONICS', 'No. 38, 2nd Lane,  Rubber Watte Road,  Gangodawila, Nugegoda, Sri Lanka.', 'esuprjxs_crown@gmail.com', '+94 112 251 202', 'CROWN ELECTRONICS', NULL, 'storage/logo/1746454046.png', '2024-10-30 18:07:56', '2025-05-05 08:37:26');

-- Dumping structure for table esuprjxs_crown.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.currencies: ~3 rows (approximately)
INSERT IGNORE INTO `currencies` (`id`, `code`, `name`, `symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
	(1, 'LKR', 'LK Rupees', 'රු', 1.00000000, '2025-05-29 00:50:47', '2025-05-29 03:45:53'),
	(3, 'USD', 'US Doller', '$', 299.56000000, '2025-05-29 00:58:18', '2025-05-29 03:46:09'),
	(4, 'GBP', 'GB Pounds', '£', 404.12000000, '2025-05-29 03:35:00', '2025-05-29 04:14:07');

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
  `total_cost` decimal(15,2) NOT NULL,
  `status` enum('Pending','Accepted','Packed','Pickup Done','Ready to Ship','Shipped','In Transit','Customer Unavailable','Rescheduled','Delivered','Cancelled','Returned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.customer_orders: ~6 rows (approximately)
INSERT IGNORE INTO `customer_orders` (`id`, `order_code`, `user_id`, `customer_name`, `phone`, `email`, `house_no`, `apartment`, `city`, `postal_code`, `date`, `total_cost`, `status`, `activity_logs`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
	(33, 'ORD-HMOWQ7JL', 3, 'k.a.kavidu malshan kulathunga', '0719707610', 'freelyricshub@gmail.com', 'f/16,delpathdeniya', NULL, 'galigamuwa', '71350', '2024-11-27', 4800.00, 'Packed', '[{"timestamp":"2024-11-27 01:18:05","message":"Order accepted by the vendor."},{"timestamp":"2024-11-27 01:19:17","message":"Order packed by the vendor."}]', 'COD', 'Pending', '2024-11-26 19:39:41', '2024-11-26 19:49:17'),
	(34, 'ORD-J64XRM0S', 6, 'Anuradha ;mkkkmmk', '0783302448', 'batmananuradha@gmail.com', '164/08/16, Kannadiwaththa, Bomugammana, Divulapitiya', ';mkmk', 'gampaha', '11250', '2025-04-23', 1300.00, 'Pending', NULL, NULL, 'Pending', '2025-04-23 01:01:21', '2025-04-23 01:01:21'),
	(35, 'ORD-FPZ1SOLI', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-04-27', 100300.00, 'Pending', NULL, 'COD', 'Pending', '2025-04-27 02:59:29', '2025-04-27 03:00:10'),
	(36, 'ORD-TRDIBOIB', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-04-27', 2200.00, 'Pending', NULL, NULL, 'Pending', '2025-04-27 05:42:48', '2025-04-27 05:42:48'),
	(37, 'ORD-IABXMDYE', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-05-02', 18800.00, 'Pending', NULL, NULL, 'Pending', '2025-05-01 22:12:08', '2025-05-01 22:12:08'),
	(38, 'ORD-30R1X6NJ', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-05-02', 1300.00, 'Pending', NULL, NULL, 'Pending', '2025-05-01 22:18:39', '2025-05-01 22:18:39');

-- Dumping structure for table esuprjxs_crown.customer_order_items
CREATE TABLE IF NOT EXISTS `customer_order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reviewed` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_order_items_id_unique` (`id`),
  KEY `customer_order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `customer_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.customer_register: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.job_batches: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.migrations: ~57 rows (approximately)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2024_10_25_044750_create_categories_table', 1),
	(5, '2024_10_25_044750_create_subcategories_table', 1),
	(6, '2024_10_25_045713_create_sub_subcategories_table', 1),
	(7, '2024_10_25_081517_create_products_table', 1),
	(8, '2024_10_25_081523_create_product_images_table', 1),
	(9, '2024_10_29_071017_create_system_users_table', 1),
	(10, '2024_10_30_063932_create_company_settings_table', 1),
	(11, '2024_10_30_081431_create_variations_table', 1),
	(15, '2024_11_07_050041_create_cart_items_table', 2),
	(20, '2024_11_07_090702_create_customer_orders_table', 3),
	(21, '2024_11_07_090751_create_customer_order_items_table', 3),
	(22, '2024_11_11_050757_create_affiliate_rules_table', 4),
	(23, '2024_11_06_081844_create_affiliate_users_table', 5),
	(24, '2024_11_06_084900_create_raffle_tickets_table', 5),
	(25, '2024_11_10_003001_create_affiliate_links_table', 5),
	(26, '2024_11_10_010945_create_affiliate_referrals_table', 5),
	(27, '2024_11_10_011657_create_affiliate_product_table', 5),
	(28, '2024_11_10_040931_create_payment_requests_table', 5),
	(29, '2024_11_10_045623_create_affiliate_rules_table', 5),
	(32, '2024_11_12_054225_create_wishlists_table', 6),
	(37, '2024_11_18_051105_update_products_table', 7),
	(38, '2024_11_19_042214_create_vendors_table', 8),
	(39, '2024_11_19_061623_create_shops_table', 8),
	(40, '2024_11_19_072256_add_foreign_key_to_shop_id_in_products_table', 8),
	(41, '2024_11_20_103945_create_vendor_wallets_table', 9),
	(42, '2024_11_21_045740_create_vendor_payment_requests_table', 9),
	(43, '2024_11_21_055055_add_profile_and_bank_details_to_vendors_table', 9),
	(44, '2024_11_22_102543_update_status_in_customer_orders_table', 10),
	(45, '2024_11_25_043842_add_activity_logs_to_customer_orders_table', 11),
	(46, '2024_11_21_084729_create_reviews_table', 12),
	(47, '2024_11_21_095412_add_reviewer_id_to_reviews_table', 12),
	(48, '2024_11_21_161333_add_profile_image_to_users_table', 13),
	(49, '2024_11_26_100954_add_gender_to_users_table', 14),
	(50, '2024_10_28_082501_create_apartments_table', 15),
	(51, '2024_10_28_082645_create_floors_table', 15),
	(52, '2024_10_28_083310_create_room_types_table', 15),
	(53, '2024_10_28_083927_create_rooms_table', 15),
	(54, '2024_10_29_090338_create_departments_table', 15),
	(55, '2024_10_29_090403_create_positions_table', 15),
	(56, '2024_10_29_090545_create_staff_table', 15),
	(57, '2024_10_29_115807_add_apartment_id_to_rooms_table', 15),
	(58, '2024_10_31_054542_create_customer_registers_table', 15),
	(59, '2024_11_05_055052_create_bookings_table', 15),
	(60, '2024_11_06_035923_create_orders_table', 15),
	(61, '2024_11_06_100453_create_payments_table', 15),
	(62, '2024_11_06_192215_add_total_room_charge_to_payments_table', 15),
	(63, '2024_11_13_044927_create_company_details_table', 15),
	(64, '2024_11_13_065559_create_bank_details_table', 15),
	(65, '2025_02_14_042721_create_personal_access_tokens_table', 16),
	(66, '2025_03_10_071113_create_inquiries_table', 16),
	(67, '2025_05_05_150817_create_sliders_table', 16),
	(68, '2025_05_05_152806_create_banners_table', 17),
	(69, '2025_05_29_053856_create_currencies_table', 18),
	(70, '2025_05_29_070234_add_currency_id_to_products_table', 19);

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
  `discount` decimal(8,2) DEFAULT NULL,
  `serviceCharge` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.orders: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `total_room_charge` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `service_charge_applied` tinyint(1) NOT NULL DEFAULT '0',
  `advance_payment` tinyint(1) NOT NULL DEFAULT '0',
  `refundable_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_transfer_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `transfer_slip_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discounted_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `partial_payment` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_booking_id_foreign` (`booking_id`),
  CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.payments: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.payment_requests
CREATE TABLE IF NOT EXISTS `payment_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `withdraw_amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processing_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.payment_requests: ~1 rows (approximately)
INSERT IGNORE INTO `payment_requests` (`id`, `user_id`, `withdraw_amount`, `bank_name`, `branch`, `account_name`, `account_number`, `processing_fee`, `paid_amount`, `status`, `requested_at`, `created_at`, `updated_at`) VALUES
	(2, 2, 1500.00, 'sampath', 'galigamuwa', 'kavidu malshan', '25226987', 100.00, 1400.00, 'Completed', '2024-11-26 19:40:38', '2024-11-26 19:40:38', '2024-11-26 19:42:27');

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
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.positions
CREATE TABLE IF NOT EXISTS `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `currency_id` bigint unsigned DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `normal_price` decimal(15,2) NOT NULL,
  `regular_price` decimal(15,2) DEFAULT NULL,
  `is_affiliate` tinyint(1) NOT NULL DEFAULT '0',
  `affiliate_price` decimal(15,2) DEFAULT NULL,
  `commission_percentage` decimal(5,2) DEFAULT NULL,
  `commission_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_id_unique` (`product_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_subcategory_id_foreign` (`subcategory_id`),
  KEY `products_sub_subcategory_id_foreign` (`sub_subcategory_id`),
  KEY `products_shop_id_foreign` (`shop_id`),
  KEY `fk_products_brands1_idx` (`brand_id`),
  KEY `products_currency_id_foreign` (`currency_id`),
  CONSTRAINT `fk_products_brands1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_sub_subcategory_id_foreign` FOREIGN KEY (`sub_subcategory_id`) REFERENCES `sub_subcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.products: ~8 rows (approximately)
INSERT IGNORE INTO `products` (`id`, `product_id`, `shop_id`, `product_name`, `product_description`, `category_id`, `brand_id`, `subcategory_id`, `sub_subcategory_id`, `currency_id`, `quantity`, `tags`, `normal_price`, `regular_price`, `is_affiliate`, `affiliate_price`, `commission_percentage`, `commission_price`, `created_at`, `updated_at`) VALUES
	(26, 'P-23C4EB', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, 3, NULL, NULL, NULL, 989, 'Online Exclusive', 1000.00, 0.00, 1, 1000.00, 10.00, 100.00, '2025-04-23 07:08:26', '2025-05-29 05:20:07'),
	(27, 'P-596847', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, NULL, NULL, 194, 'Online Exclusive', 1900.00, 0.00, 1, 1900.00, 10.00, 190.00, '2025-04-23 07:09:17', '2025-05-01 22:12:08'),
	(29, 'P-8550C6', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, NULL, 4, 997, 'Below', 1000.00, 0.00, 1, 100000.00, 10.00, 10000.00, '2025-04-23 07:17:04', '2025-05-29 05:20:07'),
	(30, 'P-16E31F', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, NULL, 4, 1500, 'Top Selling', 1000.00, 0.00, 1, 1000.00, 5.00, 50.00, '2025-04-23 07:30:01', '2025-04-23 07:30:01'),
	(34, 'P-7BA8EA', NULL, 'ABC', 'asdf', 1, 3, 1, 1, 3, 116, 'Top Selling', 10.00, 10.00, 1, 10.00, 10.00, 1.00, '2025-05-15 04:13:03', '2025-05-29 06:04:43'),
	(35, 'P-F31821', NULL, 'ABC', '1234', 1, 3, 1, 1, 3, 1000, NULL, 1000010.00, 1000010.00, 0, NULL, 0.00, NULL, '2025-05-16 02:29:59', '2025-05-16 02:29:59'),
	(36, 'P-8E08CA', NULL, 'apple', '123', 1, 3, 1, 1, 3, 100, '100', 1000.00, 1000.00, 0, NULL, 0.00, NULL, '2025-05-28 04:28:32', '2025-05-28 04:30:54'),
	(37, 'P-BB050C', NULL, 'BBC', 'BBC', 4, 3, 7, NULL, 1, 99, 'Top Selling', 101.00, 100.00, 0, NULL, 0.00, NULL, '2025-05-29 01:40:35', '2025-05-29 05:10:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.product_images: ~9 rows (approximately)
INSERT IGNORE INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`, `updated_at`) VALUES
	(33, 'P-23C4EB', 'product_images/1745411906_1730285227_item6.png', '2025-04-23 07:08:26', '2025-04-23 07:08:26'),
	(34, 'P-596847', 'product_images/1745411957_1730458784_Samsung_Galaxy_A15.png', '2025-04-23 07:09:17', '2025-04-23 07:09:17'),
	(36, 'P-8550C6', 'product_images/1745412424_1731398899_category-5.jpg', '2025-04-23 07:17:04', '2025-04-23 07:17:04'),
	(39, 'P-16E31F', 'product_images/1745413201_1730275488_ass1.jpg', '2025-04-23 07:30:01', '2025-04-23 07:30:01'),
	(40, 'P-16E31F', 'product_images/1745413201_1730275488_ass2.jpg', '2025-04-23 07:30:01', '2025-04-23 07:30:01'),
	(45, 'P-7BA8EA', 'product_images/1747302183_1746782490_public (1).png', '2025-05-15 04:13:03', '2025-05-15 04:13:03'),
	(46, 'P-F31821', 'product_images/1747382399_1746782490_public (1).png', '2025-05-16 02:29:59', '2025-05-16 02:29:59'),
	(47, 'P-8E08CA', 'product_images/1748426312_1746782490_public (1).png', '2025-05-28 04:28:33', '2025-05-28 04:28:33'),
	(48, 'P-BB050C', 'product_images/1748502635_1746810151_public (15) (1).png', '2025-05-29 01:40:36', '2025-05-29 01:40:36');

-- Dumping structure for table esuprjxs_crown.raffle_tickets
CREATE TABLE IF NOT EXISTS `raffle_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Active','Used','Expired') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `raffle_tickets_token_unique` (`token`),
  KEY `raffle_tickets_user_id_foreign` (`user_id`),
  CONSTRAINT `raffle_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `affiliate_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.raffle_tickets: ~1 rows (approximately)
INSERT IGNORE INTO `raffle_tickets` (`id`, `user_id`, `token`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 'hellotracking', 'Pending', '2024-11-19 05:54:35', '2024-11-19 05:54:35');

-- Dumping structure for table esuprjxs_crown.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `order_item_id` bigint unsigned NOT NULL,
  `rating` int unsigned NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` enum('Pending','Published','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.reviews: ~0 rows (approximately)

-- Dumping structure for table esuprjxs_crown.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `apartment_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `room_type_id` bigint unsigned NOT NULL,
  `room_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rental_price` decimal(8,2) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.sessions: ~3 rows (approximately)
INSERT IGNORE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('28dmCA4kbUNdffURPCPhRlyQ9eZgqYqSyNB1KKm3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejNybVNTRmgxek8xTzRPenFUUkhFckNoM3E0cXdOcnNuMDNrTnpvVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748405163),
	('BKiQy4M5PpsD1UJrvvRvTVMteA25bsESDaW39IRF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiS2hnamVHRERiRDliUmE5RjY5bzczZllRVnlEb0lYdXVucDVURlhBaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9yZXZpZXdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJpc19hZG1pbiI7YjoxO3M6NDoibmFtZSI7czo1OiJBZG1pbiI7czo1OiJlbWFpbCI7czoxNzoiYWRtaW5AZXhhbXBsZS5jb20iO3M6NToiaW1hZ2UiO047fQ==', 1744786906),
	('ZiX8TanATiZ5FcEtPGRXLzwRcKF1ZoVXHanjbIrp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWYyRzJ6OHlyUDVIdWhsUzhRbFo4ZnI3NkRyMk9MbHBQT2d3ZklPdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744781864);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.shops: ~1 rows (approximately)
INSERT IGNORE INTO `shops` (`id`, `vendor_id`, `shop_name`, `shop_description`, `shop_logo`, `created_at`, `updated_at`) VALUES
	(1, 1, 'DK Mart', 'DK MART', 'shop_logos/dklogo.png', '2024-11-19 03:03:09', '2024-11-25 05:52:42');

-- Dumping structure for table esuprjxs_crown.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.sliders: ~6 rows (approximately)
INSERT IGNORE INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
	(2, 'slider_images/ZXtyyDMuRjRlfRQ2h5MxFengSCgNPhv1Hi1wopD7.jpg', '2025-05-05 10:19:56', '2025-05-05 10:19:56'),
	(3, 'slider_images/nT6WvbkH6dbigZwRKVeF5MV65gRoqvNPlABnHUNd.jpg', '2025-05-05 10:20:08', '2025-05-05 10:20:08'),
	(4, 'slider_images/ghGjrulk3661VAhw3yoELXec72cdvjDvTqaGRiFT.jpg', '2025-05-05 10:43:39', '2025-05-05 10:43:39'),
	(5, 'slider_images/NCsBFkniIRpXkspADqHSTEngqGW5leB5bemMxePs.png', '2025-05-08 07:58:53', '2025-05-08 07:58:53'),
	(6, 'slider_images/27Kcs4HV8JUGlDHzx2mo5OQcc0KPF5UY8ykyHNrk.png', '2025-05-08 07:59:04', '2025-05-08 07:59:04'),
	(7, 'slider_images/mZDEe2rZER26ZyIYLCbw0uEuu0UG1C44REiJ1TsD.png', '2025-05-08 07:59:13', '2025-05-08 07:59:13');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.subcategories: ~88 rows (approximately)
INSERT IGNORE INTO `subcategories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Shoes', '2024-10-30 17:18:48', '2024-11-25 13:21:17'),
	(2, 1, 'Clothings', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(3, 1, 'Bags', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(4, 2, 'Shoes', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
	(5, 2, 'Clothing', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
	(6, 3, 'Cameras', '2024-10-31 21:52:35', '2024-10-31 21:52:35'),
	(7, 4, 'Televisions', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
	(8, 4, 'Home Audio & Theater', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
	(9, 4, 'Kitchen Appliances', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
	(10, 4, 'Washing Machines & Dryers', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
	(11, 5, 'Furniture', '2024-11-07 00:17:04', '2024-11-07 00:17:04'),
	(12, 5, 'Bedding & Linens', '2024-11-07 00:17:04', '2024-11-07 00:17:04'),
	(13, 5, 'Home Decor', '2024-11-07 00:17:04', '2024-11-07 00:17:04'),
	(14, 5, 'Gardening & Outdoor', '2024-11-07 00:17:04', '2024-11-07 00:17:04'),
	(15, 6, 'Fresh Produce', '2024-11-07 00:17:32', '2024-11-07 00:17:32'),
	(16, 6, 'Dairy & Eggs', '2024-11-07 00:17:32', '2024-11-07 00:17:32'),
	(17, 6, 'Snacks & Beverages', '2024-11-07 00:17:32', '2024-11-07 00:17:32'),
	(18, 6, 'Pantry Staples', '2024-11-07 00:17:32', '2024-11-07 00:17:32'),
	(19, 3, 'Mobiles', '2024-11-07 00:17:55', '2024-11-07 00:17:55'),
	(20, 3, 'Tablets', '2024-11-07 00:17:55', '2024-11-07 00:17:55'),
	(21, 3, 'Desktops', '2024-11-07 00:17:55', '2024-11-07 00:17:55'),
	(22, 1, 'Girls\'s Fashion', '2024-11-07 00:18:07', '2024-11-07 00:18:07'),
	(23, 2, 'Mens\' bags', '2024-11-07 00:18:27', '2024-11-07 00:18:27'),
	(24, 2, 'Boys\' Fashion', '2024-11-07 00:18:27', '2024-11-07 00:18:27'),
	(25, 7, 'Make up tools', '2024-11-07 00:19:18', '2024-11-07 00:19:18'),
	(26, 7, 'Skin Care', '2024-11-07 00:19:18', '2024-11-07 00:19:18'),
	(27, 7, 'Hair Care', '2024-11-07 00:19:18', '2024-11-07 00:19:18'),
	(28, 8, 'Men\'s Watches', '2024-11-07 00:20:58', '2024-11-07 00:20:58'),
	(29, 8, 'Watch Straps & Bands', '2024-11-07 00:20:58', '2024-11-07 00:20:58'),
	(30, 8, 'Watch Repair Tools', '2024-11-07 00:20:58', '2024-11-07 00:20:58'),
	(31, 8, 'Women\'s Watches', '2024-11-07 00:20:58', '2024-11-07 00:20:58'),
	(45, 13, 'Camping & Hiking Gear', '2024-11-11 00:32:37', '2024-11-11 00:32:37'),
	(49, 13, 'Fitness Equipment', '2024-11-11 00:43:42', '2024-11-11 00:43:42'),
	(50, 13, 'Cycling Accessories', '2024-11-11 00:43:42', '2024-11-11 00:43:42'),
	(51, 13, 'Water Sports Equipment', '2024-11-11 00:43:42', '2024-11-11 00:43:42'),
	(52, 17, 'one', '2025-04-22 10:20:15', '2025-04-22 10:20:15'),
	(53, 18, 'JVC TV Special Offer', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(54, 18, 'LED TV', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(55, 18, 'Smart LED TV', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(56, 18, 'UHD TV', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(57, 18, 'OLED TV', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(58, 18, 'Commercial TV', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(59, 18, 'TV Accessories', '2025-05-08 11:48:59', '2025-05-08 11:48:59'),
	(60, 19, 'Speakers', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(61, 19, 'Earphones', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(62, 19, 'Headphones', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(63, 19, 'Home Theaters', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(64, 19, 'Sound Bars', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(65, 19, 'HiFi Systems', '2025-05-08 11:50:33', '2025-05-08 11:50:33'),
	(66, 20, 'Refrigerators', '2025-05-08 11:52:19', '2025-05-08 11:52:19'),
	(67, 20, 'Washing Machines', '2025-05-08 11:52:19', '2025-05-08 11:52:19'),
	(68, 20, 'Heaters & Geyser', '2025-05-08 11:52:20', '2025-05-08 11:52:20'),
	(69, 20, 'Fans', '2025-05-08 11:52:20', '2025-05-08 11:52:20'),
	(70, 20, 'Irons', '2025-05-08 11:52:20', '2025-05-08 11:52:20'),
	(71, 20, 'Air Conditioners', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(72, 20, 'Water Purifiers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(73, 20, 'Home Improvement', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(74, 20, 'Home Utensils', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(75, 20, 'Sanitaryware', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(76, 20, 'Morphy Richards', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(77, 20, 'Floor Care', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(78, 21, 'Mobile Phones', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(79, 21, 'Tablets', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(80, 21, 'Smart Bands & Smart Watches', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(81, 21, 'Mobile Phone Accessories', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(82, 21, 'Smart Education', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(83, 22, 'IPhones', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(84, 22, 'IPads', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(85, 22, 'IMac', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(86, 22, 'MacBooks', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(87, 22, 'AirPods', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(88, 22, 'Apple Watch New Arrivals', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(89, 23, 'Laptops', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(90, 23, 'Desktops & Monitors', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(91, 23, 'Smart Boards & Kiosk', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(92, 23, 'Printers & IT Peripherals', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(93, 23, 'IT Accessories', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(94, 24, 'Blenders & Mixers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(95, 24, 'Ovens', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(96, 24, 'Air Fryers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(97, 24, 'Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(98, 24, 'Kitchen and Cookware', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(99, 24, 'Built-in Appliances & Ovens', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(100, 24, 'Small Appliances', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(101, 24, 'Kettles & Flasks', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(102, 24, 'Toasters & Grills', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(103, 24, 'Food Processors', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(104, 24, 'Dishwashers', '2025-05-14 12:52:49', '2025-05-14 12:52:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.sub_subcategories: ~96 rows (approximately)
INSERT IGNORE INTO `sub_subcategories` (`id`, `subcategory_id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Heels', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(2, 2, 'Tops', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(3, 2, 'Dresses', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(4, 3, 'Tote Bags', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
	(5, 4, 'Boots', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
	(6, 5, 'Denim', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
	(7, 66, 'Single Door', '2025-05-08 11:52:19', '2025-05-08 11:52:19'),
	(8, 66, 'Double Door', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(9, 66, 'Side by Side', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(10, 66, 'Bottom Freezer', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(11, 66, 'Mini Bars', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(12, 66, 'Freezers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(13, 66, 'Bottle Coolers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(14, 67, 'Top Loading', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(15, 67, 'Front Loading', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(16, 67, 'Washers & Dryers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(17, 67, 'Semi Auto', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(18, 68, 'Heaters', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(19, 68, 'Geysers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(20, 69, 'Ceiling Fans', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(21, 69, 'Pedestal Fans', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(22, 69, 'Wall Fans & Table Fans', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(23, 69, 'Industrial Fans', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(24, 69, 'Air Coolers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(25, 69, 'Fan - New Arrivals', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(26, 70, 'Dry Irons', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(27, 70, 'Steam Irons', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(28, 71, 'Inverter AC', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(29, 71, 'Non-Inverter AC', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(30, 73, 'Generators', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(31, 73, 'Water Pumps', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(32, 73, 'Gardening Tools', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(33, 73, 'Power Tools', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(34, 73, 'Cleaning Durables', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(35, 73, 'DSI Plastic', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(36, 73, 'General Merchandising', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(37, 74, 'LED Bulb', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(38, 74, 'Medical Devices', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(39, 74, 'Torch', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(40, 74, 'Weighing Scale', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(41, 74, 'ECOCO Accessories', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(42, 74, 'Home Accessories', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(43, 77, 'Vacuum Cleaners', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(44, 77, 'Pressure Washers', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(45, 77, 'Robotic Cleaners', '2025-05-14 11:53:18', '2025-05-14 11:53:18'),
	(46, 78, 'Mobile Exclusive Deals', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(47, 78, 'Smart Mobile Phones', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(48, 78, 'Feature Phones', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(49, 80, 'Xiaomi Mibro Smart Watches', '2025-05-14 12:19:24', '2025-05-14 12:19:24'),
	(50, 83, 'iPhone 11', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(51, 83, 'iPhone 12', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(52, 83, 'iPhone 13', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(53, 83, 'iPhone 14', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(54, 83, 'iPhone 15', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(55, 83, 'iPhone 16', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(56, 84, 'iPad', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(57, 84, 'iPad Air', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(58, 84, 'iPad Pro', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(59, 84, 'iPad Mini', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(60, 86, 'MacBook Air', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(61, 86, 'MacBook Pro', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(62, 86, 'Mac Mini', '2025-05-14 12:32:35', '2025-05-14 12:32:35'),
	(63, 91, 'Smart Boards', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(64, 91, 'Signages & Kiosk', '2025-05-14 12:38:58', '2025-05-14 12:38:58'),
	(65, 94, 'Blenders & Grinders', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(66, 94, 'Mixers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(67, 94, 'Juicers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(68, 94, 'Coffee Machines', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(69, 94, 'Hand Blenders', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(70, 95, 'Microwave Ovens', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(71, 95, 'Electric Oven', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(72, 95, 'Cooking Ovens', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(73, 97, 'Pressure Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(74, 97, 'Rice Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(75, 97, 'Food Steamers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(76, 97, 'Induction Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(77, 97, 'Hot Plates', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(78, 97, 'Gas Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(79, 97, 'Freestanding Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(80, 98, 'Coconut Scraper', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(81, 98, 'Kitchen Scale', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(82, 98, 'Gas Cylinders & Regulators', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(83, 98, 'Kitchen Accessories', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(84, 99, 'Hobs & Cookers With Safety', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(85, 99, 'Hobs', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(86, 99, 'Built-in Ovens', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(87, 99, 'Freestanding Cookers', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(88, 99, 'Cooker Hoods', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(89, 100, 'Saucepans New Arrivals', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(90, 100, 'Glassware & Mugs', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(91, 100, 'Food Storage & Accessories', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(92, 100, 'Saucepan', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(93, 100, 'Kitchen Utensils', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(94, 100, 'Home Accessories', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(95, 100, 'Storage Bins & Baskets', '2025-05-14 12:52:49', '2025-05-14 12:52:49'),
	(96, 100, 'Tea Sets & Dining Sets', '2025-05-14 12:52:49', '2025-05-14 12:52:49');

-- Dumping structure for table esuprjxs_crown.system_users
CREATE TABLE IF NOT EXISTS `system_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.system_users: ~2 rows (approximately)
INSERT IGNORE INTO `system_users` (`id`, `name`, `email`, `contact`, `password`, `role`, `image`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Manushi Weerasinghe', 'manuw2819@gmail.com', '0716280394', '$2y$12$u9Wf1r7MWu8bNF/iE4ws6ubGM7eEAyVqfcixqejw.eaLguijfOwqy', 'Admin', '1731475199_avatar-1.png', 'Active', '2024-10-30 18:08:27', '2024-11-12 23:49:59'),
	(2, 'Manula', 'manulakavishka9@gmail.com', NULL, '$2y$12$H4Tb6/2XXbmezI7Taa5eC.x7FFJhM8ck1OD07tyrXKVIErAxQHp96', 'Admin', NULL, 'Active', '2025-05-28 09:33:33', '2025-05-28 09:33:34');

-- Dumping structure for table esuprjxs_crown.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.users: ~7 rows (approximately)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `address`, `dob`, `phone`, `gender`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Manushi Weerasinghe', 'manuw2819@gmail.com', 'No.124, "Sisilasa"', '2024-11-01', '+94716280393', NULL, NULL, '$2y$12$TE9JIuSOj3RLYDsnvoR.WuT2.kPTqSVp8Y78lUPsM.YISZ5T8XEGm', NULL, '2024-11-06 23:02:15', '2024-11-06 23:02:15'),
	(3, 'k.a.kavidu malshan kulathunga', 'freelyricshub@gmail.com', 'f/16,delpathdeniya', '1999-07-21', '+94719707612', 'male', NULL, '$2y$12$VrTjKzIP42MAVFK0.p7LfupuFt42mHDbrWYIsjGe683Kb4enqVA9e', NULL, '2024-11-19 05:44:33', '2024-11-26 06:20:13'),
	(4, 'pavidu', 'pavidu@gmail.com', 'ranasigha', '1998-07-21', '+94719707615', NULL, NULL, '$2y$12$s3feBcTDzqIrvmNlObm2OeYsFaedZ1TzHrx4vtPjtj2gaiEFT7jfK', NULL, '2024-11-26 22:42:26', '2024-11-26 22:42:26'),
	(5, 'kasuni', 'kasuni@gmail.com', 'f/16,delpathdeniya', '2002-08-20', '+94719707620', NULL, NULL, '$2y$12$YIOghwp3KMJffBPmktWnle46DVcoWeTufAZQubYAide3R09EL8gg.', NULL, '2024-11-26 22:48:59', '2024-11-26 22:48:59'),
	(6, 'Anuradha', 'batmananuradha@gmail.com', '164/08/16, Kannadiwaththa, Bomugammana, Divulapitiya, ;mkmk', '2025-04-01', '+94783302448', NULL, NULL, '$2y$12$zs0rtIk12WPVyHtQ/CaL0eOb2wfRBjQGYvJeOJMQWZdUWsoYk3pM6', NULL, '2025-04-23 01:00:45', '2025-04-23 01:00:45'),
	(7, 'Anuradha Sampath', 'anuradhasampath666@gmail.com', '164/08/16, Kannadiwaththa,, Bomugammana, Divulapitiya', '2025-04-07', '0783302448', NULL, NULL, '$2y$12$E.SsdKjZ.s9ZLBsZ6Ce6buV.jSS9gfiN2w2O5x.o7JkkJq37.dIkG', NULL, '2025-04-25 03:35:10', '2025-04-25 03:35:10'),
	(8, 'm', 'manulakavishka9@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$12$H4Tb6/2XXbmezI7Taa5eC.x7FFJhM8ck1OD07tyrXKVIErAxQHp96', NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.variations: ~9 rows (approximately)
INSERT IGNORE INTO `variations` (`id`, `product_id`, `type`, `value`, `hex_value`, `quantity`, `created_at`, `updated_at`) VALUES
	(48, 'P-596847', 'size', NULL, NULL, NULL, '2025-04-23 07:09:30', '2025-04-23 07:09:30'),
	(53, 'P-16E31F', NULL, NULL, NULL, NULL, '2025-04-23 07:30:01', '2025-04-23 07:30:01'),
	(56, 'P-8550C6', 'size', NULL, NULL, NULL, '2025-04-28 23:24:13', '2025-04-28 23:24:13'),
	(57, 'P-7BA8EA', 'size', 'xl', NULL, 10, '2025-05-15 04:13:03', '2025-05-15 04:13:03'),
	(58, 'P-23C4EB', 'size', NULL, NULL, NULL, '2025-05-15 04:20:48', '2025-05-15 04:20:48'),
	(59, 'P-F31821', NULL, NULL, NULL, NULL, '2025-05-16 02:29:59', '2025-05-16 02:29:59'),
	(62, 'P-8E08CA', 'size', 'XL', NULL, 100, '2025-05-28 04:30:54', '2025-05-28 04:30:54'),
	(63, 'P-8E08CA', 'color', NULL, '#cd4c4c', 10, '2025-05-28 04:30:54', '2025-05-28 04:30:54'),
	(66, 'P-BB050C', 'size', NULL, NULL, NULL, '2025-05-29 01:52:08', '2025-05-29 01:52:08');

-- Dumping structure for table esuprjxs_crown.vendors
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.vendors: ~1 rows (approximately)
INSERT IGNORE INTO `vendors` (`id`, `name`, `email`, `password`, `phone`, `address`, `status`, `profile_image`, `bank_name`, `branch`, `account_name`, `account_number`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'freelyricshub@gmail.com', '$2y$12$ply3ddeHLJO/B1J0HMHjFeJDZWJIvDvqCnsB.clYUcxuBUslLeVR.', '0712345678', 'f/16,delpathdeniya', 'approved', NULL, 'sampath', 'kegalle', 'kavidu', '12345678', '2024-11-19 03:01:00', '2024-11-26 19:51:21');

-- Dumping structure for table esuprjxs_crown.vendor_payment_requests
CREATE TABLE IF NOT EXISTS `vendor_payment_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `request_amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processing_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_payment_requests_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `vendor_payment_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.vendor_payment_requests: ~1 rows (approximately)
INSERT IGNORE INTO `vendor_payment_requests` (`id`, `vendor_id`, `request_amount`, `bank_name`, `branch`, `account_name`, `account_number`, `processing_fee`, `paid_amount`, `status`, `requested_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 1500.00, 'sampath', 'kegalle', 'kavidu', '12345678', 100.00, 1400.00, 'Completed', '2024-11-26 19:51:39', '2024-11-26 19:51:39', '2024-11-26 19:52:13');

-- Dumping structure for table esuprjxs_crown.vendor_wallets
CREATE TABLE IF NOT EXISTS `vendor_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_earnings` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_wallets_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `vendor_wallets_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.vendor_wallets: ~1 rows (approximately)
INSERT IGNORE INTO `vendor_wallets` (`id`, `vendor_id`, `balance`, `total_earnings`, `created_at`, `updated_at`) VALUES
	(1, 1, 9450.00, 9450.00, '2024-11-22 01:38:18', '2024-11-26 19:49:24');

-- Dumping structure for table esuprjxs_crown.wishlists
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table esuprjxs_crown.wishlists: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

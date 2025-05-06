-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 07:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dkmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_links`
--

CREATE TABLE `affiliate_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `raffle_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliate_links`
--

INSERT INTO `affiliate_links` (`id`, `user_id`, `raffle_ticket_id`, `link`, `created_at`, `updated_at`) VALUES
(5, 2, 1, 'http://127.0.0.1:8000/track/hellotracking/P-60B170?redirect=http%3A%2F%2F127.0.0.1%3A8000%2Fproduct-details%2FP-60B170', '2024-11-26 18:55:17', '2024-11-26 18:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_product`
--

CREATE TABLE `affiliate_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_link_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_referrals`
--

CREATE TABLE `affiliate_referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `raffle_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `product_url` varchar(255) NOT NULL,
  `views_count` int(11) NOT NULL DEFAULT 0,
  `referral_count` int(11) NOT NULL DEFAULT 0,
  `product_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `affiliate_commission` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_affiliate_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliate_referrals`
--

INSERT INTO `affiliate_referrals` (`id`, `user_id`, `raffle_ticket_id`, `product_url`, `views_count`, `referral_count`, `product_price`, `affiliate_commission`, `total_affiliate_price`, `created_at`, `updated_at`) VALUES
(4, 2, 1, 'http://127.0.0.1:8000/product-details/P-60B170', 4, 2, 4500.00, 2250.00, 2250.00, '2024-11-26 18:55:17', '2024-11-27 05:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_rules`
--

CREATE TABLE `affiliate_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rule` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliate_rules`
--

INSERT INTO `affiliate_rules` (`id`, `rule`, `created_at`, `updated_at`) VALUES
(1, 'Commission Structure: Defines how affiliates are paid, either per sale, per lead, or per click, and specifies the payment rate (percentage or flat fee).', '2024-11-11 22:37:23', '2024-11-11 22:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `DOB` date NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `NIC` varchar(20) NOT NULL,
  `contactno` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `promotion_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`promotion_method`)),
  `instagram_url` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `tiktok_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `content_website_url` varchar(255) DEFAULT NULL,
  `content_whatsapp_url` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `name`, `address`, `district`, `DOB`, `gender`, `NIC`, `contactno`, `email`, `password`, `promotion_method`, `instagram_url`, `facebook_url`, `tiktok_url`, `youtube_url`, `content_website_url`, `content_whatsapp_url`, `bank_name`, `branch`, `account_name`, `account_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Manushi Weerasinghe', 'No.124, \"Sisilasa\"', 'Kurunegala', '2000-08-19', 'female', '200073203633', '0716280393', 'manuw2819@gmail.com', '$2y$12$rUIrl.eUkDiqB7vm0QX7/.1NdM2UmfutRc5Ka7DCz8Pc4kErWPeoe', '\"[\\\"Instagram\\\",\\\"Facebook\\\",\\\"TikTok\\\",\\\"YouTube\\\",\\\"Content website\\\\\\/blog\\\",\\\"WhatsApp\\\"]\"', 'https://www.instagram.com/manushi', 'https://www.facebook.com/manushi', 'https://www.titok.com/manushi', 'https://www.youtube.com/manushi', 'https://www.website.com/manushi', 'https://www.whatsapp.com/manushi', 'BOC', 'Ridigama', 'KGRSM Weerasinghe', '8465232656', 'approved', '2024-11-11 22:40:12', '2024-11-11 22:45:46'),
(2, 'k.a.kavidu malshan kulathunga', 'f/16,delpathdeniya', 'kegalle', '1999-07-21', 'male', '199920302235', '0719707612', 'admin@dkmart.lk', '$2y$12$3FkW7JE89xPHQTzVT93LWOHS1GupCv4aURH3R6Vxd.kC2/.Q6DjAq', '\"[\\\"YouTube\\\"]\"', NULL, NULL, NULL, 'https://www.youtube.com/watch?v=BYQHcxE7g24', NULL, NULL, 'sampath', 'galigamuwa', 'kavidu malshan', '25226987', 'approved', '2024-11-19 05:53:08', '2024-11-26 18:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `apartment_name` varchar(255) NOT NULL,
  `total_floors` int(11) DEFAULT NULL,
  `total_units` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `amenities` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `account_holder` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `whatsapp_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `created_at`, `updated_at`) VALUES
(2, 'banners/pySXFZPbAOSNKlhLiGszBG0eQ4pR6SD5VTGCPbiW.jpg', '2025-05-05 10:31:36', '2025-05-05 10:31:36'),
(3, 'banners/RtuR6WgcQU6Y1wjIdpW7ZR0yjo6QXoC29DePO8tF.jpg', '2025-05-05 10:31:51', '2025-05-05 10:31:51'),
(6, 'banners/qBP8s0sWOiqqRHNujv6iqjZGtHHAbieJEZ2uqnQI.jpg', '2025-05-05 10:44:48', '2025-05-05 10:44:48');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `term` varchar(255) NOT NULL,
  `booking_type` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `service_charge` decimal(8,2) DEFAULT 0.00,
  `total_cost` decimal(10,2) NOT NULL,
  `discount_applied` decimal(8,2) DEFAULT 0.00,
  `booking_status` varchar(255) DEFAULT NULL,
  `confirmation_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@example.com|127.0.0.1', 'i:1;', 1745421709),
('admin@example.com|127.0.0.1:timer', 'i:1745421709;', 1745421709),
('cart_count_7', 'i:2;', 1745943974);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `price`, `subtotal`, `size`, `color`, `created_at`, `updated_at`) VALUES
(32, 6, 30, 1, 1000.00, 1000.00, NULL, NULL, '2025-04-23 21:12:37', '2025-04-23 21:12:37'),
(40, 7, 26, 2, 1000.00, 2000.00, NULL, NULL, '2025-05-01 23:02:02', '2025-05-01 23:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Women\'s Fashion', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
(2, 'Men\'s Fashion', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
(3, 'Electronic Devices', '2024-10-31 21:52:35', '2024-10-31 21:52:35'),
(4, 'TV & Home Appliances', '2024-11-07 00:16:38', '2024-11-07 00:16:38'),
(5, 'Home & Lifestyle', '2024-11-07 00:17:04', '2024-11-07 00:17:04'),
(6, 'Groceries', '2024-11-07 00:17:32', '2024-11-07 00:17:32'),
(7, 'Health & Beauty', '2024-11-07 00:19:18', '2024-11-07 00:19:18'),
(8, 'Watches & Accessories', '2024-11-07 00:20:58', '2024-11-07 00:20:58'),
(13, 'Sports & Outdoor', '2024-11-11 00:32:37', '2024-11-11 00:32:37'),
(17, 'new one', '2025-04-22 10:20:15', '2025-04-22 10:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `title`, `address`, `email`, `contact`, `website`, `footer_text`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'CROWN ELECTRONICS', 'No. 38, 2nd Lane,  Rubber Watte Road,  Gangodawila, Nugegoda, Sri Lanka.', 'dkmart@gmail.com', '+94 112 251 202', 'CROWN ELECTRONICS', NULL, 'storage/logo/1746454046.png', '2024-10-30 18:07:56', '2025-05-05 08:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `house_no` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total_cost` decimal(15,2) NOT NULL,
  `status` enum('Pending','Accepted','Packed','Pickup Done','Ready to Ship','Shipped','In Transit','Customer Unavailable','Rescheduled','Delivered','Cancelled','Returned') NOT NULL DEFAULT 'Pending',
  `activity_logs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`activity_logs`)),
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`id`, `order_code`, `user_id`, `customer_name`, `phone`, `email`, `house_no`, `apartment`, `city`, `postal_code`, `date`, `total_cost`, `status`, `activity_logs`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(33, 'ORD-HMOWQ7JL', 3, 'k.a.kavidu malshan kulathunga', '0719707610', 'freelyricshub@gmail.com', 'f/16,delpathdeniya', NULL, 'galigamuwa', '71350', '2024-11-27', 4800.00, 'Packed', '[{\"timestamp\":\"2024-11-27 01:18:05\",\"message\":\"Order accepted by the vendor.\"},{\"timestamp\":\"2024-11-27 01:19:17\",\"message\":\"Order packed by the vendor.\"}]', 'COD', 'Pending', '2024-11-26 19:39:41', '2024-11-26 19:49:17'),
(34, 'ORD-J64XRM0S', 6, 'Anuradha ;mkkkmmk', '0783302448', 'batmananuradha@gmail.com', '164/08/16, Kannadiwaththa, Bomugammana, Divulapitiya', ';mkmk', 'gampaha', '11250', '2025-04-23', 1300.00, 'Pending', NULL, NULL, 'Pending', '2025-04-23 01:01:21', '2025-04-23 01:01:21'),
(35, 'ORD-FPZ1SOLI', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-04-27', 100300.00, 'Pending', NULL, 'COD', 'Pending', '2025-04-27 02:59:29', '2025-04-27 03:00:10'),
(36, 'ORD-TRDIBOIB', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-04-27', 2200.00, 'Pending', NULL, NULL, 'Pending', '2025-04-27 05:42:48', '2025-04-27 05:42:48'),
(37, 'ORD-IABXMDYE', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-05-02', 18800.00, 'Pending', NULL, NULL, 'Pending', '2025-05-01 22:12:08', '2025-05-01 22:12:08'),
(38, 'ORD-30R1X6NJ', 7, 'Anuradha Sampath', '0783302448', 'anuradhasampath64@gmail.com', '164/08/16, Kannadiwaththa,', 'Bomugammana, Divulapitiya', 'gampaha', '11250', '2025-05-02', 1300.00, 'Pending', NULL, NULL, 'Pending', '2025-05-01 22:18:39', '2025-05-01 22:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_items`
--

CREATE TABLE `customer_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reviewed` enum('yes','no') DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_order_items`
--

INSERT INTO `customer_order_items` (`id`, `order_code`, `product_id`, `quantity`, `size`, `color`, `cost`, `date`, `reviewed`, `created_at`, `updated_at`) VALUES
(28, 'ORD-FPZ1SOLI', 29, 1, NULL, NULL, 100000.00, '2025-04-26 18:30:00', 'no', '2025-04-27 02:59:29', '2025-04-27 02:59:29'),
(29, 'ORD-TRDIBOIB', 27, 1, NULL, NULL, 1900.00, '2025-04-27 05:42:48', 'no', '2025-04-27 05:42:48', '2025-04-27 05:42:48'),
(30, 'ORD-IABXMDYE', 26, 9, NULL, NULL, 9000.00, '2025-05-01 18:30:00', 'no', '2025-05-01 22:12:08', '2025-05-01 22:12:08'),
(31, 'ORD-IABXMDYE', 27, 5, NULL, NULL, 9500.00, '2025-05-01 18:30:00', 'no', '2025-05-01 22:12:08', '2025-05-01 22:12:08'),
(32, 'ORD-30R1X6NJ', 26, 1, NULL, NULL, 1000.00, '2025-05-01 18:30:00', 'no', '2025-05-01 22:18:39', '2025-05-01 22:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer_register`
--

CREATE TABLE `customer_register` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apartment_id` bigint(20) UNSIGNED NOT NULL,
  `floor_number` int(11) NOT NULL,
  `total_rooms` int(11) DEFAULT NULL,
  `occupied_rooms` int(11) NOT NULL DEFAULT 0,
  `floor_status` varchar(255) NOT NULL DEFAULT 'available',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'not replied',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
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
(68, '2025_05_05_152806_create_banners_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bookingType` varchar(255) NOT NULL,
  `roomSelection` varchar(255) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `paymentTerms` varchar(255) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `serviceCharge` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `total_room_charge` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(255) NOT NULL,
  `payment_date` date NOT NULL,
  `service_charge_applied` tinyint(1) NOT NULL DEFAULT 0,
  `advance_payment` tinyint(1) NOT NULL DEFAULT 0,
  `refundable_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `refund_status` varchar(255) DEFAULT NULL,
  `bank_transfer_confirmation` tinyint(1) NOT NULL DEFAULT 0,
  `transfer_slip_image` varchar(255) DEFAULT NULL,
  `discounted_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `partial_payment` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `processing_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_requests`
--

INSERT INTO `payment_requests` (`id`, `user_id`, `withdraw_amount`, `bank_name`, `branch`, `account_name`, `account_number`, `processing_fee`, `paid_amount`, `status`, `requested_at`, `created_at`, `updated_at`) VALUES
(2, 2, 1500.00, 'sampath', 'galigamuwa', 'kavidu malshan', '25226987', 100.00, 1400.00, 'Completed', '2024-11-26 19:40:38', '2024-11-26 19:40:38', '2024-11-26 19:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `normal_price` decimal(8,2) NOT NULL,
  `is_affiliate` tinyint(1) NOT NULL DEFAULT 0,
  `affiliate_price` decimal(8,2) DEFAULT NULL,
  `commission_percentage` decimal(5,2) DEFAULT NULL,
  `commission_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `shop_id`, `product_name`, `product_description`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `quantity`, `tags`, `normal_price`, `is_affiliate`, `affiliate_price`, `commission_percentage`, `commission_price`, `created_at`, `updated_at`) VALUES
(26, 'P-23C4EB', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, 990, 'Online Exclusive', 1000.00, 1, 1000.00, 10.00, 100.00, '2025-04-23 07:08:26', '2025-05-01 22:18:39'),
(27, 'P-596847', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, 194, 'Online Exclusive', 1900.00, 1, 1900.00, 10.00, 190.00, '2025-04-23 07:09:17', '2025-05-01 22:12:08'),
(29, 'P-8550C6', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, 999, 'Below', 100000.00, 1, 100000.00, 10.00, 10000.00, '2025-04-23 07:17:04', '2025-04-28 23:24:13'),
(30, 'P-16E31F', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 3, NULL, NULL, 1500, 'Top Selling', 1000.00, 1, 1000.00, 5.00, 50.00, '2025-04-23 07:30:01', '2025-04-23 07:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`, `updated_at`) VALUES
(33, 'P-23C4EB', 'product_images/1745411906_1730285227_item6.png', '2025-04-23 07:08:26', '2025-04-23 07:08:26'),
(34, 'P-596847', 'product_images/1745411957_1730458784_Samsung_Galaxy_A15.png', '2025-04-23 07:09:17', '2025-04-23 07:09:17'),
(36, 'P-8550C6', 'product_images/1745412424_1731398899_category-5.jpg', '2025-04-23 07:17:04', '2025-04-23 07:17:04'),
(39, 'P-16E31F', 'product_images/1745413201_1730275488_ass1.jpg', '2025-04-23 07:30:01', '2025-04-23 07:30:01'),
(40, 'P-16E31F', 'product_images/1745413201_1730275488_ass2.jpg', '2025-04-23 07:30:01', '2025-04-23 07:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `raffle_tickets`
--

CREATE TABLE `raffle_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` enum('Pending','Active','Used','Expired') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raffle_tickets`
--

INSERT INTO `raffle_tickets` (`id`, `user_id`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'hellotracking', 'Pending', '2024-11-19 05:54:35', '2024-11-19 05:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `review` text DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`media`)),
  `status` enum('Pending','Published','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reviewer_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apartment_id` bigint(20) UNSIGNED NOT NULL,
  `floor_id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `rental_price` decimal(8,2) DEFAULT NULL,
  `occupancy_status` varchar(255) NOT NULL DEFAULT 'available',
  `facilities` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BKiQy4M5PpsD1UJrvvRvTVMteA25bsESDaW39IRF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiS2hnamVHRERiRDliUmE5RjY5bzczZllRVnlEb0lYdXVucDVURlhBaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9yZXZpZXdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJpc19hZG1pbiI7YjoxO3M6NDoibmFtZSI7czo1OiJBZG1pbiI7czo1OiJlbWFpbCI7czoxNzoiYWRtaW5AZXhhbXBsZS5jb20iO3M6NToiaW1hZ2UiO047fQ==', 1744786906),
('ZiX8TanATiZ5FcEtPGRXLzwRcKF1ZoVXHanjbIrp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWYyRzJ6OHlyUDVIdWhsUzhRbFo4ZnI3NkRyMk9MbHBQT2d3ZklPdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744781864);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `shop_description` text DEFAULT NULL,
  `shop_logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `vendor_id`, `shop_name`, `shop_description`, `shop_logo`, `created_at`, `updated_at`) VALUES
(1, 1, 'DK Mart', 'DK MART', 'shop_logos/dklogo.png', '2024-11-19 03:03:09', '2024-11-25 05:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(2, 'slider_images/ZXtyyDMuRjRlfRQ2h5MxFengSCgNPhv1Hi1wopD7.jpg', '2025-05-05 10:19:56', '2025-05-05 10:19:56'),
(3, 'slider_images/nT6WvbkH6dbigZwRKVeF5MV65gRoqvNPlABnHUNd.jpg', '2025-05-05 10:20:08', '2025-05-05 10:20:08'),
(4, 'slider_images/ghGjrulk3661VAhw3yoELXec72cdvjDvTqaGRiFT.jpg', '2025-05-05 10:43:39', '2025-05-05 10:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_hired` date NOT NULL,
  `shift_details` text NOT NULL,
  `notes` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
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
(52, 17, 'one', '2025-04-22 10:20:15', '2025-04-22 10:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `sub_subcategories`
--

CREATE TABLE `sub_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_subcategories`
--

INSERT INTO `sub_subcategories` (`id`, `subcategory_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Heels', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
(2, 2, 'Tops', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
(3, 2, 'Dresses', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
(4, 3, 'Tote Bags', '2024-10-30 17:18:48', '2024-10-30 17:18:48'),
(5, 4, 'Boots', '2024-10-31 21:48:57', '2024-10-31 21:48:57'),
(6, 5, 'Denim', '2024-10-31 21:48:57', '2024-10-31 21:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_users`
--

CREATE TABLE `system_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_users`
--

INSERT INTO `system_users` (`id`, `name`, `email`, `contact`, `password`, `role`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Manushi Weerasinghe', 'manuw2819@gmail.com', '0716280394', '$2y$12$u9Wf1r7MWu8bNF/iE4ws6ubGM7eEAyVqfcixqejw.eaLguijfOwqy', 'Admin', '1731475199_avatar-1.png', 'Active', '2024-10-30 18:08:27', '2024-11-12 23:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `dob`, `phone`, `gender`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Manushi Weerasinghe', 'manuw2819@gmail.com', 'No.124, \"Sisilasa\"', '2024-11-01', '+94716280393', NULL, NULL, '$2y$12$TE9JIuSOj3RLYDsnvoR.WuT2.kPTqSVp8Y78lUPsM.YISZ5T8XEGm', NULL, '2024-11-06 23:02:15', '2024-11-06 23:02:15'),
(3, 'k.a.kavidu malshan kulathunga', 'freelyricshub@gmail.com', 'f/16,delpathdeniya', '1999-07-21', '+94719707612', 'male', NULL, '$2y$12$VrTjKzIP42MAVFK0.p7LfupuFt42mHDbrWYIsjGe683Kb4enqVA9e', NULL, '2024-11-19 05:44:33', '2024-11-26 06:20:13'),
(4, 'pavidu', 'pavidu@gmail.com', 'ranasigha', '1998-07-21', '+94719707615', NULL, NULL, '$2y$12$s3feBcTDzqIrvmNlObm2OeYsFaedZ1TzHrx4vtPjtj2gaiEFT7jfK', NULL, '2024-11-26 22:42:26', '2024-11-26 22:42:26'),
(5, 'kasuni', 'kasuni@gmail.com', 'f/16,delpathdeniya', '2002-08-20', '+94719707620', NULL, NULL, '$2y$12$YIOghwp3KMJffBPmktWnle46DVcoWeTufAZQubYAide3R09EL8gg.', NULL, '2024-11-26 22:48:59', '2024-11-26 22:48:59'),
(6, 'Anuradha', 'batmananuradha@gmail.com', '164/08/16, Kannadiwaththa, Bomugammana, Divulapitiya, ;mkmk', '2025-04-01', '+94783302448', NULL, NULL, '$2y$12$zs0rtIk12WPVyHtQ/CaL0eOb2wfRBjQGYvJeOJMQWZdUWsoYk3pM6', NULL, '2025-04-23 01:00:45', '2025-04-23 01:00:45'),
(7, 'Anuradha Sampath', 'anuradhasampath666@gmail.com', '164/08/16, Kannadiwaththa,, Bomugammana, Divulapitiya', '2025-04-07', '0783302448', NULL, NULL, '$2y$12$E.SsdKjZ.s9ZLBsZ6Ce6buV.jSS9gfiN2w2O5x.o7JkkJq37.dIkG', NULL, '2025-04-25 03:35:10', '2025-04-25 03:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `hex_value` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `product_id`, `type`, `value`, `hex_value`, `quantity`, `created_at`, `updated_at`) VALUES
(48, 'P-596847', 'size', NULL, NULL, NULL, '2025-04-23 07:09:30', '2025-04-23 07:09:30'),
(53, 'P-16E31F', NULL, NULL, NULL, NULL, '2025-04-23 07:30:01', '2025-04-23 07:30:01'),
(54, 'P-23C4EB', 'size', NULL, NULL, NULL, '2025-04-27 05:56:02', '2025-04-27 05:56:02'),
(56, 'P-8550C6', 'size', NULL, NULL, NULL, '2025-04-28 23:24:13', '2025-04-28 23:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `profile_image` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `password`, `phone`, `address`, `status`, `profile_image`, `bank_name`, `branch`, `account_name`, `account_number`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'freelyricshub@gmail.com', '$2y$12$ply3ddeHLJO/B1J0HMHjFeJDZWJIvDvqCnsB.clYUcxuBUslLeVR.', '0712345678', 'f/16,delpathdeniya', 'approved', NULL, 'sampath', 'kegalle', 'kavidu', '12345678', '2024-11-19 03:01:00', '2024-11-26 19:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_payment_requests`
--

CREATE TABLE `vendor_payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `request_amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `processing_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_payment_requests`
--

INSERT INTO `vendor_payment_requests` (`id`, `vendor_id`, `request_amount`, `bank_name`, `branch`, `account_name`, `account_number`, `processing_fee`, `paid_amount`, `status`, `requested_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1500.00, 'sampath', 'kegalle', 'kavidu', '12345678', 100.00, 1400.00, 'Completed', '2024-11-26 19:51:39', '2024-11-26 19:51:39', '2024-11-26 19:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_wallets`
--

CREATE TABLE `vendor_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_earnings` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_wallets`
--

INSERT INTO `vendor_wallets` (`id`, `vendor_id`, `balance`, `total_earnings`, `created_at`, `updated_at`) VALUES
(1, 1, 9450.00, 9450.00, '2024-11-22 01:38:18', '2024-11-26 19:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliate_links`
--
ALTER TABLE `affiliate_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_links_raffle_ticket_id_foreign` (`raffle_ticket_id`);

--
-- Indexes for table `affiliate_product`
--
ALTER TABLE `affiliate_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_product_product_id_foreign` (`product_id`),
  ADD KEY `affiliate_product_affiliate_link_id_foreign` (`affiliate_link_id`);

--
-- Indexes for table `affiliate_referrals`
--
ALTER TABLE `affiliate_referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_referrals_user_id_foreign` (`user_id`),
  ADD KEY `affiliate_referrals_raffle_ticket_id_foreign` (`raffle_ticket_id`);

--
-- Indexes for table `affiliate_rules`
--
ALTER TABLE `affiliate_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `affiliate_users_email_unique` (`email`);

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_customer_id_foreign` (`customer_id`),
  ADD KEY `bookings_room_id_foreign` (`room_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_user_id_foreign` (`user_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_orders_order_code_unique` (`order_code`),
  ADD KEY `customer_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `customer_order_items`
--
ALTER TABLE `customer_order_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_order_items_id_unique` (`id`),
  ADD KEY `customer_order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `customer_register`
--
ALTER TABLE `customer_register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_register_email_unique` (`email`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `floors_apartment_id_foreign` (`apartment_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_id_unique` (`product_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `products_sub_subcategory_id_foreign` (`sub_subcategory_id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `raffle_tickets`
--
ALTER TABLE `raffle_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `raffle_tickets_token_unique` (`token`),
  ADD KEY `raffle_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`),
  ADD KEY `reviews_reviewer_id_foreign` (`reviewer_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_floor_id_foreign` (`floor_id`),
  ADD KEY `rooms_room_type_id_foreign` (`room_type_id`),
  ADD KEY `rooms_apartment_id_foreign` (`apartment_id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_position_id_foreign` (`position_id`),
  ADD KEY `staff_department_id_foreign` (`department_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_subcategories_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `system_users`
--
ALTER TABLE `system_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_users_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_payment_requests`
--
ALTER TABLE `vendor_payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_payment_requests_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `vendor_wallets`
--
ALTER TABLE `vendor_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_wallets_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliate_links`
--
ALTER TABLE `affiliate_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `affiliate_product`
--
ALTER TABLE `affiliate_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_referrals`
--
ALTER TABLE `affiliate_referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_rules`
--
ALTER TABLE `affiliate_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_settings`
--
ALTER TABLE `company_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `customer_order_items`
--
ALTER TABLE `customer_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `customer_register`
--
ALTER TABLE `customer_register`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `raffle_tickets`
--
ALTER TABLE `raffle_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_users`
--
ALTER TABLE `system_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_payment_requests`
--
ALTER TABLE `vendor_payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_wallets`
--
ALTER TABLE `vendor_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affiliate_links`
--
ALTER TABLE `affiliate_links`
  ADD CONSTRAINT `affiliate_links_raffle_ticket_id_foreign` FOREIGN KEY (`raffle_ticket_id`) REFERENCES `raffle_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affiliate_product`
--
ALTER TABLE `affiliate_product`
  ADD CONSTRAINT `affiliate_product_affiliate_link_id_foreign` FOREIGN KEY (`affiliate_link_id`) REFERENCES `affiliate_links` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `affiliate_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affiliate_referrals`
--
ALTER TABLE `affiliate_referrals`
  ADD CONSTRAINT `affiliate_referrals_raffle_ticket_id_foreign` FOREIGN KEY (`raffle_ticket_id`) REFERENCES `raffle_tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `affiliate_referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `affiliate_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_register` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD CONSTRAINT `customer_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_order_items`
--
ALTER TABLE `customer_order_items`
  ADD CONSTRAINT `customer_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `floors_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_subcategory_id_foreign` FOREIGN KEY (`sub_subcategory_id`) REFERENCES `sub_subcategories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `raffle_tickets`
--
ALTER TABLE `raffle_tickets`
  ADD CONSTRAINT `raffle_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `affiliate_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `customer_order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_apartment_id_foreign` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  ADD CONSTRAINT `sub_subcategories_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_payment_requests`
--
ALTER TABLE `vendor_payment_requests`
  ADD CONSTRAINT `vendor_payment_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_wallets`
--
ALTER TABLE `vendor_wallets`
  ADD CONSTRAINT `vendor_wallets_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

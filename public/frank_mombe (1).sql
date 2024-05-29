-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 07, 2024 at 07:19 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frank_mombe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_infos`
--

CREATE TABLE `admin_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `official_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_infos`
--

INSERT INTO `admin_infos` (`id`, `official_email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', '35454156156', '2024-01-30 21:10:12', '2024-01-30 21:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barber_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_time_id` int DEFAULT NULL,
  `booking_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int DEFAULT NULL,
  `dis_price` int DEFAULT '0',
  `total_price` int NOT NULL DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_location` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `member_id`, `barber_id`, `service_time_id`, `booking_time`, `booking_date`, `price`, `dis_price`, `total_price`, `image`, `custom_location`, `status`, `created_at`, `updated_at`) VALUES
(143, '58', '57', 82, '12:00 AM', '2024-01-25', 523, 52, 471, '', 'barber shop', 'complete', '2024-01-23 16:03:39', '2024-02-06 21:30:03'),
(144, '58', '57', 82, '12:00 AM', '2024-01-23', 856, 86, 770, '', 'barber shop', 'complete', '2024-01-23 16:04:53', '2024-01-23 16:08:48'),
(145, '58', '57', 81, '6:38 PM', '2024-01-24', 123, NULL, 123, '', 'barber shop', 'complete', '2024-01-24 17:48:23', '2024-01-29 20:21:38'),
(146, '58', '57', 82, '12:00 AM', '2024-01-26', 1256, 956, 300, '', 'barber shop', 'pending', '2024-01-25 18:31:37', '2024-01-25 18:31:37'),
(147, '58', '57', 81, '6:38 PM', '2024-01-25', 856, 86, 770, 'https://frank-mombe.ad-wize.com/uploads/bookings/96eae0f46f620f7b8b374979c4f48b81PayMefirst.jpg', 'barber shop', 'complete', '2024-01-25 20:44:21', '2024-01-26 15:51:10'),
(148, '58', '57', 83, '6:38 PM', '2024-01-27', 1379, NULL, 1379, '', 'barber shop', 'pending', '2024-01-26 12:54:59', '2024-01-26 12:54:59'),
(149, '58', '57', 84, '12:00 AM', '2024-01-27', 1379, 1079, 300, '', 'barber shop', 'pending', '2024-01-26 13:50:17', '2024-01-26 13:50:17'),
(150, '58', '57', 83, '6:38 PM', '2024-01-26', 1379, 1079, 300, 'https://frank-mombe.ad-wize.com/uploads/bookings/6bbb2781acc356337af8205be542f458PayMefirst.jpg', 'barber shop', 'pending', '2024-01-26 14:00:13', '2024-01-26 14:00:13'),
(151, '58', '57', 84, '12:00 AM', '2024-01-26', 1379, NULL, 1379, '', 'barber shop', 'pending', '2024-01-26 14:04:57', '2024-01-26 14:04:57'),
(152, '58', '57', 83, '6:38 PM', '2024-01-28', 1379, 1079, 300, '', 'barber shop', 'pending', '2024-01-26 14:46:31', '2024-01-26 14:46:31'),
(153, '58', '57', 83, '6:38 PM', '2024-01-30', 1379, 1079, 300, '', 'barber shop', 'pending', '2024-01-29 20:20:35', '2024-01-29 20:20:35'),
(154, '58', '57', 83, '6:38 PM', '2024-02-02', 1379, 1079, 300, '', 'barber shop', 'complete', '2024-01-31 16:52:13', '2024-01-31 17:11:36'),
(155, '58', '64', 85, '11:05 PM', '2024-02-22', 50, NULL, 50, '', 'Japan, Osaka, Naniwa Ward, Sakuragawa, 2 Chome−9−24, fds zeal', 'pending', '2024-02-07 13:58:59', '2024-02-07 13:58:59'),
(156, '58', '64', 85, '11:05 PM', '2024-02-22', 50, NULL, 50, '', 'Japan, Osaka, Naniwa Ward, Sakuragawa, 2 Chome−9−24, fds zeal', 'pending', '2024-02-07 14:00:58', '2024-02-07 14:00:58'),
(157, '58', '64', 85, '11:05 PM', '2024-02-22', 50, NULL, 50, '', 'Japan, Osaka, Naniwa Ward, Sakuragawa, 2 Chome−9−24, fds zeal', 'pending', '2024-02-07 14:02:12', '2024-02-07 14:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`id`, `booking_id`, `service_id`, `created_at`, `updated_at`) VALUES
(225, '143', '108', '2024-01-23 16:03:39', '2024-01-23 16:03:39'),
(226, '143', '107', '2024-01-23 16:03:39', '2024-01-23 16:03:39'),
(227, '144', '109', '2024-01-23 16:04:53', '2024-01-23 16:04:53'),
(228, '145', '107', '2024-01-24 17:48:23', '2024-01-24 17:48:23'),
(229, '146', '109', '2024-01-25 18:31:37', '2024-01-25 18:31:37'),
(230, '146', '108', '2024-01-25 18:31:37', '2024-01-25 18:31:37'),
(231, '147', '109', '2024-01-25 20:44:21', '2024-01-25 20:44:21'),
(232, '148', '110', '2024-01-26 12:54:59', '2024-01-26 12:54:59'),
(233, '148', '111', '2024-01-26 12:54:59', '2024-01-26 12:54:59'),
(234, '148', '112', '2024-01-26 12:54:59', '2024-01-26 12:54:59'),
(235, '149', '110', '2024-01-26 13:50:17', '2024-01-26 13:50:17'),
(236, '149', '111', '2024-01-26 13:50:17', '2024-01-26 13:50:17'),
(237, '149', '112', '2024-01-26 13:50:17', '2024-01-26 13:50:17'),
(238, '150', '112', '2024-01-26 14:00:13', '2024-01-26 14:00:13'),
(239, '150', '111', '2024-01-26 14:00:13', '2024-01-26 14:00:13'),
(240, '150', '110', '2024-01-26 14:00:13', '2024-01-26 14:00:13'),
(241, '151', '110', '2024-01-26 14:04:57', '2024-01-26 14:04:57'),
(242, '151', '111', '2024-01-26 14:04:57', '2024-01-26 14:04:57'),
(243, '151', '112', '2024-01-26 14:04:57', '2024-01-26 14:04:57'),
(244, '152', '110', '2024-01-26 14:46:31', '2024-01-26 14:46:31'),
(245, '152', '111', '2024-01-26 14:46:31', '2024-01-26 14:46:31'),
(246, '152', '112', '2024-01-26 14:46:31', '2024-01-26 14:46:31'),
(247, '153', '110', '2024-01-29 20:20:35', '2024-01-29 20:20:35'),
(248, '153', '111', '2024-01-29 20:20:35', '2024-01-29 20:20:35'),
(249, '153', '112', '2024-01-29 20:20:35', '2024-01-29 20:20:35'),
(250, '154', '111', '2024-01-31 16:52:13', '2024-01-31 16:52:13'),
(251, '154', '110', '2024-01-31 16:52:13', '2024-01-31 16:52:13'),
(252, '154', '112', '2024-01-31 16:52:13', '2024-01-31 16:52:13'),
(253, '155', '113', '2024-02-07 13:58:59', '2024-02-07 13:58:59'),
(254, '155', '114', '2024-02-07 13:59:00', '2024-02-07 13:59:00'),
(255, '156', '113', '2024-02-07 14:00:58', '2024-02-07 14:00:58'),
(256, '156', '114', '2024-02-07 14:00:58', '2024-02-07 14:00:58'),
(257, '157', '113', '2024-02-07 14:02:12', '2024-02-07 14:02:12'),
(258, '157', '114', '2024-02-07 14:02:12', '2024-02-07 14:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `booking_review`
--

CREATE TABLE `booking_review` (
  `id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `description` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_price` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `min_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300', 1000, 'active', '2023-12-01 11:44:54', '2023-11-30 19:00:00'),
(2, '98275', 'percent', '10', 500, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE `customer_history` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_05_03_000001_create_customer_columns', 1),
(9, '2019_05_03_000002_create_subscriptions_table', 1),
(10, '2019_05_03_000003_create_subscription_items_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_11_03_095742_create_reset_code_passwords_table', 1),
(14, '2022_12_06_112838_create_admin_infos_table', 1),
(15, '2022_12_06_115501_create_contact_infos_table', 1),
(16, '2023_10_30_105205_create_services_table', 2),
(17, '2022_12_06_115501_create_support_table', 3),
(18, '2023_11_08_161726_create_reviews_table', 4),
(19, '2023_11_09_112326_create_bookings_table', 5),
(20, '2023_11_10_100934_create_booking_details_table', 6),
(23, '2023_11_10_111210_create_service_timings_table', 7),
(24, '2023_11_27_155414_create_wishlist_table', 8),
(25, '2023_12_01_114024_create_coupons_table', 9),
(26, '2024_01_31_124645_create_customer_history_table', 10),
(27, '2024_01_31_150558_create_wallet_table', 11),
(28, '2024_01_31_151417_create_transaction_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('06042e25d3ebc6513ab8c8a0d937491bc97a6b34f1d4d143e34e8c570b09227a2ff747bdab4a77a9', 4, 2, 'app_api', '[]', 0, '2023-10-03 09:59:20', '2023-10-03 09:59:20', '2024-10-03 14:59:20'),
('06fe0e513f4a829eddd7c238b6b424b54303134f2dc53be3d6504717dead07044573e3d9a804e2c8', 4, 2, 'app_api', '[]', 0, '2023-10-05 06:20:34', '2023-10-05 06:20:34', '2024-10-05 11:20:34'),
('1402c8069efdd9d3fc6cd29bc51d39c3ff8b7b78adf000652b014dfcad8c9aefc8a41693c0176ab2', 9, 2, 'app_api', '[]', 0, '2023-10-05 06:12:45', '2023-10-05 06:12:45', '2024-10-05 11:12:45'),
('1c92e50539dcfe2cc995e0f063ec3adcefdb28daebceef8267f4a72947b80f4ec433e6e6875404db', 5, 2, 'app_api', '[]', 0, '2023-10-06 10:50:32', '2023-10-06 10:50:32', '2024-10-06 15:50:32'),
('20b87673ed99a2acdd495fbb6a733ffc78f0bff51ee960f92bc3364408c99e72dd7ba867e8a9d90c', 16, 2, 'app_api', '[]', 0, '2023-10-06 10:31:20', '2023-10-06 10:31:21', '2024-10-06 15:31:20'),
('22c1d72b7e5301e234fd6190f63356da6eaec440315017000d86d65fb8654bc2864a0c9ef850b9cd', 15, 2, 'app_api', '[]', 0, '2023-10-05 12:48:08', '2023-10-05 12:48:08', '2024-10-05 17:48:08'),
('27a8d56e06f34b9071602036692e1025af9d3da9baf61fba703b8120d7fc5624ff9b97fab4f5f470', 20, 2, 'app_api', '[]', 0, '2023-11-07 10:51:11', '2023-11-07 10:51:11', '2024-11-07 15:51:11'),
('3a9d5cdc36cc2e8a0100b917f8a81db81dde8f37a0956ca909d8c20e582e61f646f0b9f0ce0e17f2', 11, 2, 'app_api', '[]', 0, '2023-10-05 06:34:11', '2023-10-05 06:34:11', '2024-10-05 11:34:11'),
('5481e848ebfa5c022a2c7ca5ca776d588697d8a9338bd79deccfb0e28f0d485f8b5888d85c982c3f', 22, 2, 'app_api', '[]', 0, '2023-11-08 11:20:38', '2023-11-08 11:20:38', '2024-11-08 16:20:38'),
('5655227d0e36521ff9924b68fb24a1edb62f3e5076196df2c08491d33a3a383fc863bb77f68df279', 5, 2, 'app_api', '[]', 0, '2023-10-05 06:17:57', '2023-10-05 06:17:58', '2024-10-05 11:17:57'),
('591882be8196dd327ab154ffd188c825444a0387a1f2bccf6353093f513d5562768264cf752ff27c', 4, 2, 'app_api', '[]', 0, '2023-10-03 10:04:23', '2023-10-03 10:04:23', '2024-10-03 15:04:23'),
('5c3c6ec38e7fa9c41fa4b82a3a53dae49fb262f45f4cefb16a6aa89142cf83dc377dec04a5edbf70', 10, 2, 'app_api', '[]', 0, '2023-10-05 06:27:13', '2023-10-05 06:27:13', '2024-10-05 11:27:13'),
('67d6fc9db84a658a062d01276b90a7113fe12c6c512ac97b01187ec7dbe78f0d586ca97c2afaacb1', 21, 2, 'app_api', '[]', 0, '2023-11-07 11:10:45', '2023-11-07 11:10:45', '2024-11-07 16:10:45'),
('6a59dc71fbc32cfc5d7b8f39a2e8ace0e75343563484124a704714166a7839a8a0b46d884ca27f09', 18, 2, 'app_api', '[]', 0, '2023-10-06 10:47:53', '2023-10-06 10:47:53', '2024-10-06 15:47:53'),
('6e9cac2a9e87c8feebc1b72d79b537ffbb53d568425ac11fb823e1847484e2e0cb86e231357de6d6', 19, 2, 'app_api', '[]', 0, '2023-11-06 07:57:42', '2023-11-06 07:57:42', '2024-11-06 12:57:42'),
('743b470d77a5f8d913dda99d306126ebdc06d5cf91ed4bdb9cac37832760a92e93ef91ec7a117861', 4, 2, 'app_api', '[]', 0, '2023-10-05 06:21:05', '2023-10-05 06:21:05', '2024-10-05 11:21:05'),
('7a6c0b3eab8e81d2c2943965a72653ea67965be0cfc67c66cfa5d9103989a38c0c72e63ceaf0577c', 4, 2, 'app_api', '[]', 0, '2023-10-30 06:29:16', '2023-10-30 06:29:16', '2024-10-30 11:29:16'),
('7b9f5f019324a7a8c886621f57a284528348cdee37ea10ad8275770d0f47b61fcace054ca078f866', 7, 2, 'app_api', '[]', 0, '2023-10-05 05:55:54', '2023-10-05 05:55:54', '2024-10-05 10:55:54'),
('7cf973806b031a172a495d7f95bda4cb5dbe2c82b4a2303686702b3073ffaf506e83ae815e15a1b3', 5, 2, 'app_api', '[]', 0, '2023-10-05 06:21:05', '2023-10-05 06:21:05', '2024-10-05 11:21:05'),
('8abc05aa3a9a679abceb57c03378b275fa4b57a96601c5218fb9db057950be2706911928408f4ab9', 19, 2, 'app_api', '[]', 0, '2023-11-06 07:55:50', '2023-11-06 07:55:50', '2024-11-06 12:55:50'),
('8f74954849688d8149256fe4c4c82d131afe39752d406e02784c9f5f372b69a2b6b6b8bdfcb90c44', 13, 2, 'app_api', '[]', 0, '2023-10-05 12:38:03', '2023-10-05 12:38:03', '2024-10-05 17:38:03'),
('9147faf4023d13ed5d7962da294a75f8bd700ca70e31dc551a7037f41c349115e012dc562adeb979', 8, 2, 'app_api', '[]', 0, '2023-10-05 05:58:00', '2023-10-05 05:58:00', '2024-10-05 10:58:00'),
('94deac954d7edfdc4434e50a385d17c3bf81c7d12a6ed3b9fb6895e26efeeeb80894193b1259c910', 20, 2, 'app_api', '[]', 0, '2023-11-07 05:22:15', '2023-11-07 05:22:15', '2024-11-07 10:22:15'),
('954fe66ddae70e8f25920473aa33b4d974e95abb35632c29670084a24173cecb5df9c20ae2465c55', 17, 2, 'app_api', '[]', 0, '2023-10-06 10:38:25', '2023-10-06 10:38:25', '2024-10-06 15:38:25'),
('9f22c9ebf1fe6ffc7e60afeb53935fbfe05df07bd85049db5c69369815d47130fe7e5c5930f49baf', 20, 2, 'app_api', '[]', 0, '2023-11-08 05:28:03', '2023-11-08 05:28:03', '2024-11-08 10:28:03'),
('ac7273acf75661586918601a6c6279516f5aaf32536eaa2fdd615d0a037657d61a0c4a985e7e6a2a', 14, 2, 'app_api', '[]', 0, '2023-10-05 12:41:12', '2023-10-05 12:41:12', '2024-10-05 17:41:12'),
('b07ab65e67c8e3e105c7c5695c9fb8b682ebef1056c9357ed87e266f3fde56ce7f349fd68bd121e8', 18, 2, 'app_api', '[]', 0, '2023-10-06 10:49:04', '2023-10-06 10:49:04', '2024-10-06 15:49:04'),
('b9030a0831d100e6f2d3288b7ecd51ebefd99ee2be38c0e26e8f73ffad93b2243b44d615e33f7937', 18, 2, 'app_api', '[]', 0, '2023-10-06 10:47:25', '2023-10-06 10:47:25', '2024-10-06 15:47:25'),
('c046a22dbdb0463670fa175b23ff26b04549e89fb03c338e9f4db70db7e72d457c88c8fde299ab6d', 14, 2, 'app_api', '[]', 0, '2023-10-05 12:43:28', '2023-10-05 12:43:28', '2024-10-05 17:43:28'),
('cf705631eec1eac24c37dd94379ee28cc11df29abfb9e833f0b1d28df7e5c68989e41efac762d94e', 6, 2, 'app_api', '[]', 0, '2023-10-05 05:55:04', '2023-10-05 05:55:04', '2024-10-05 10:55:04'),
('d35daf0f0c51913e366dbb8a60c5175a38078c727156529bed8123a06f34d7dda527e3262fa7d484', 17, 2, 'app_api', '[]', 0, '2023-10-06 10:38:55', '2023-10-06 10:38:55', '2024-10-06 15:38:55'),
('d3ac32ccf23db7c4f7a2b112b13d39b746e9334589113cc768dc0f375e329209581b115e70c32f82', 25, 2, 'app_api', '[]', 0, '2023-11-08 11:38:37', '2023-11-08 11:38:37', '2024-11-08 16:38:37'),
('d4e1304e46244ef12ce38944fe47c45f8a1cfe7db549c198f56d48e2b13f181ccbe982226cb660ba', 20, 2, 'app_api', '[]', 0, '2023-11-07 05:23:50', '2023-11-07 05:23:50', '2024-11-07 10:23:50'),
('d7d61d5371d33b3385633d7d3661a635447ebbb0d7dbb3f0cc3e269d84a82d377d50d920bbf7c6b8', 15, 2, 'app_api', '[]', 0, '2023-10-05 12:45:25', '2023-10-05 12:45:25', '2024-10-05 17:45:25'),
('d8687d78fa6060594dc76507ab8723e9c7bdd7cb2d6dc5e10eeae71e2820e7a854d46cb73e283a09', 24, 2, 'app_api', '[]', 0, '2023-11-08 11:35:13', '2023-11-08 11:35:13', '2024-11-08 16:35:13'),
('def80cf58f587c5e3a2abb9a8ed94221a19a79d8b2fcc8a4574610eab6c60338e4c04f260960f785', 18, 2, 'app_api', '[]', 0, '2023-10-06 10:49:46', '2023-10-06 10:49:46', '2024-10-06 15:49:46'),
('e70891e2bba02f0275188fde3eed8b7ee9c868879706fc8ad76bc444c68798af9783f28baac1dbb3', 14, 2, 'app_api', '[]', 0, '2023-10-05 12:42:13', '2023-10-05 12:42:13', '2024-10-05 17:42:13'),
('ed51987686566441a4766ef11a29d3876968a6b8822a774aba47d04eb864924d8dfa35db668fc896', 12, 2, 'app_api', '[]', 0, '2023-10-05 12:37:25', '2023-10-05 12:37:25', '2024-10-05 17:37:25'),
('f747ce4dfb46c73c9eeef437ec2c49b125bfe8e272c7672a3db2a74cae4b19b43ced87d3a567ab79', 23, 2, 'app_api', '[]', 0, '2023-11-08 11:31:20', '2023-11-08 11:31:20', '2024-11-08 16:31:20'),
('f874f6c3e3085448ca577b7d217c649979a1dc14b43d9b344d0338e26a94e2b3b5fa2fd38161f682', 20, 2, 'app_api', '[]', 0, '2023-11-08 05:55:05', '2023-11-08 05:55:06', '2024-11-08 10:55:05'),
('fc446a087b73e72576782c2f954da422d1c482499b61eb4480bdabbe916bbbb50d9d743380009dde', 5, 2, 'app_api', '[]', 0, '2023-10-05 05:54:01', '2023-10-05 05:54:01', '2024-10-05 10:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'pmXoytZw8tGCanSufeQcM8Fk9AslQWC5kHenWXa9', NULL, 'http://localhost', 1, 0, 0, '2023-10-03 09:59:04', '2023-10-03 09:59:04'),
(2, NULL, 'Laravel Personal Access Client', '88W9UZJKvG8qLXeygWzp7fAHnMEhQNA6vyLdwjO9', NULL, 'http://localhost', 1, 0, 0, '2023-10-03 09:59:10', '2023-10-03 09:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-10-03 09:59:04', '2023-10-03 09:59:04'),
(2, 2, '2023-10-03 09:59:10', '2023-10-03 09:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 26, 'app_api', 'e7c48dfde3f25181711b757029ed0e96653e2664e942df113b591faa6936437a', '[\"*\"]', NULL, NULL, '2023-11-09 05:16:39', '2023-11-09 05:16:39'),
(2, 'App\\Models\\User', 20, 'app_api', 'f9ee403045475af6db5d9a4960d1a3b9d3079324bd9e701444a255fc3ab31942', '[\"*\"]', '2023-11-10 05:20:21', NULL, '2023-11-09 05:18:03', '2023-11-10 05:20:21'),
(3, 'App\\Models\\User', 26, 'app_api', '8ca9050eae05a9597ff0f7a4f933a677280be7180a918715eeb9e27763f3085b', '[\"*\"]', '2023-11-09 06:02:46', NULL, '2023-11-09 05:21:38', '2023-11-09 06:02:46'),
(4, 'App\\Models\\User', 27, 'app_api', '73240a1c9dbbff9b90ee506e167c673d0ea6367adb76028f1f8d4ef582fa62a0', '[\"*\"]', '2023-11-09 06:07:05', NULL, '2023-11-09 06:05:47', '2023-11-09 06:07:05'),
(5, 'App\\Models\\User', 26, 'app_api', 'b19d82de7ee201bdf94dbf1ddcf17ad9df356d6656a57a71b8247592238a5076', '[\"*\"]', '2023-11-09 06:10:13', NULL, '2023-11-09 06:08:01', '2023-11-09 06:10:13'),
(6, 'App\\Models\\User', 10, 'app_api', 'ca350c65e921db37e32eb7983f81a86f5a43b3c4efd7a30f570acbd47bb64c9d', '[\"*\"]', '2023-11-09 06:12:37', NULL, '2023-11-09 06:11:09', '2023-11-09 06:12:37'),
(7, 'App\\Models\\User', 28, 'app_api', '944ad562a77a2e8f83ba6493d582ef506aa149dc14b3ff79c156d212a3870850', '[\"*\"]', '2023-11-09 06:17:21', NULL, '2023-11-09 06:15:21', '2023-11-09 06:17:21'),
(8, 'App\\Models\\User', 29, 'app_api', '5d9248be8740c44b87794ddd3be60aaf3cde8f6fac492961ec8f8ad05fe88b5a', '[\"*\"]', '2023-11-09 06:21:36', NULL, '2023-11-09 06:20:40', '2023-11-09 06:21:36'),
(9, 'App\\Models\\User', 30, 'app_api', 'aeb6c6c558218214ed714b057a09f2f3cf112b8cfd54543311d0c6c5830e3de7', '[\"*\"]', '2023-11-09 06:26:28', NULL, '2023-11-09 06:25:16', '2023-11-09 06:26:28'),
(10, 'App\\Models\\User', 30, 'app_api', 'a029d3305b336a848851c33423e7f667e8cef6b2497670eb03b9696aa7c2e595', '[\"*\"]', '2023-11-09 06:27:19', NULL, '2023-11-09 06:27:10', '2023-11-09 06:27:19'),
(11, 'App\\Models\\User', 30, 'app_api', '9de7ec4f3734e1ceed078a678e36b6e97294add31b7e7132c46d95f520139f3b', '[\"*\"]', '2023-11-09 06:28:41', NULL, '2023-11-09 06:28:11', '2023-11-09 06:28:41'),
(12, 'App\\Models\\User', 26, 'app_api', 'e99a53c92651d64e42a53e2edefca0a6e7a3feedbfbd50592da654d6fd6b5e91', '[\"*\"]', '2023-11-09 09:36:28', NULL, '2023-11-09 06:29:24', '2023-11-09 09:36:28'),
(13, 'App\\Models\\User', 10, 'app_api', '015f7f53f4f8d3b09b2b188ce471146ce32dd39325715c3c29bab64b28da1dd5', '[\"*\"]', '2023-11-09 12:31:34', NULL, '2023-11-09 09:51:29', '2023-11-09 12:31:34'),
(14, 'App\\Models\\User', 31, 'app_api', '881cf392ac962fabda77e8935b6fe0aee8bc3c98ebaa49d2e544fa9623e2e836', '[\"*\"]', '2023-11-10 05:15:09', NULL, '2023-11-10 05:09:13', '2023-11-10 05:15:09'),
(15, 'App\\Models\\User', 31, 'app_api', '4041bc4c34e9b47a36b62142c78d51e23317eb3b9122744947c427e829e17310', '[\"*\"]', '2023-11-10 05:35:06', NULL, '2023-11-10 05:28:22', '2023-11-10 05:35:06'),
(16, 'App\\Models\\User', 10, 'app_api', '84c5f2bb1426442f502bedf07c3ad3cdcbd5f65d081ca19a76c60b87c5ce9341', '[\"*\"]', '2023-11-10 05:53:26', NULL, '2023-11-10 05:53:21', '2023-11-10 05:53:26'),
(17, 'App\\Models\\User', 10, 'app_api', 'f813923a86b1bfcd13b448e5c95312c4ea4e71be661236db4ca65ed03c0dedda', '[\"*\"]', '2023-11-10 06:12:24', NULL, '2023-11-10 06:12:15', '2023-11-10 06:12:24'),
(18, 'App\\Models\\User', 31, 'app_api', '08e8cf5d18f11be385af891e504f08251b8ffc7cbf3bff1693beeb44e6362edb', '[\"*\"]', '2023-11-10 06:16:09', NULL, '2023-11-10 06:16:01', '2023-11-10 06:16:09'),
(19, 'App\\Models\\User', 10, 'app_api', '941d502280a7823ad74764f46c2d89b108a8974e3a0a5c3708c6a4000eaa74e8', '[\"*\"]', '2023-11-10 06:17:20', NULL, '2023-11-10 06:16:42', '2023-11-10 06:17:20'),
(20, 'App\\Models\\User', 31, 'app_api', '6690c434b422b2d2108afc17781f2b30fe3308b84caf9db4085a5d2005f48248', '[\"*\"]', '2023-11-10 06:17:53', NULL, '2023-11-10 06:17:44', '2023-11-10 06:17:53'),
(21, 'App\\Models\\User', 31, 'app_api', '84fdfe320519f992b9ce9d63c81ef301635d5e44e3d1b1b9a78be38a0dfdcfa9', '[\"*\"]', '2023-11-10 06:22:51', NULL, '2023-11-10 06:22:47', '2023-11-10 06:22:51'),
(22, 'App\\Models\\User', 10, 'app_api', 'b7a29f4bb5c01e21c74a56c46ad2092f9c2f9f2533dd907e9e2b6bac7236ee68', '[\"*\"]', '2023-11-10 06:25:23', NULL, '2023-11-10 06:25:18', '2023-11-10 06:25:23'),
(23, 'App\\Models\\User', 31, 'app_api', '457fe38d163dad380ac45289fbbfb2d3f916e34f8c6cc285710a047ef9a84e05', '[\"*\"]', '2023-11-10 06:26:51', NULL, '2023-11-10 06:26:36', '2023-11-10 06:26:51'),
(24, 'App\\Models\\User', 10, 'app_api', '1f334f31448b0721149bd0d21360f74c38c58ed8a0aa14588a8088ea8b759e96', '[\"*\"]', '2023-11-10 06:31:22', NULL, '2023-11-10 06:31:17', '2023-11-10 06:31:22'),
(25, 'App\\Models\\User', 31, 'app_api', 'e5284c7ad9a16df84bc1c7dffd3154da882b457e73a0c8f8c7cf0074d59608b1', '[\"*\"]', '2023-11-10 06:32:06', NULL, '2023-11-10 06:31:58', '2023-11-10 06:32:06'),
(26, 'App\\Models\\User', 32, 'app_api', '7e3c1eb160e016344a82c24ad35d1d838d39a14e0b736422bdeeabee58b612a3', '[\"*\"]', NULL, NULL, '2023-11-10 06:34:03', '2023-11-10 06:34:03'),
(27, 'App\\Models\\User', 32, 'app_api', '66680a8f4d80c4989c7892ffd0cb6af8497770bb79c83cbfd60e1ff0319a7455', '[\"*\"]', '2023-11-10 07:25:38', NULL, '2023-11-10 06:34:31', '2023-11-10 07:25:38'),
(28, 'App\\Models\\User', 10, 'app_api', '0ea4ea44ac4c707ff8f0cae10bc2887e8319f31549a1dfbcb1b21454efc54a73', '[\"*\"]', '2023-11-10 06:37:21', NULL, '2023-11-10 06:37:17', '2023-11-10 06:37:21'),
(29, 'App\\Models\\User', 31, 'app_api', '9197ac53a7fcf4b492615ea37b70298a88226a88290fb2065d26e538fae598d1', '[\"*\"]', '2023-11-10 06:38:41', NULL, '2023-11-10 06:38:31', '2023-11-10 06:38:41'),
(30, 'App\\Models\\User', 10, 'app_api', 'be2b1cbc17e58201e66696db638f76722c3f5e0002143e8db21288ee88126df2', '[\"*\"]', '2023-11-10 06:42:14', NULL, '2023-11-10 06:42:09', '2023-11-10 06:42:14'),
(31, 'App\\Models\\User', 31, 'app_api', 'eea9d556bb9fa95f520c42e031c56453358043ef53e348d0deda3f7ad90a87e5', '[\"*\"]', '2023-11-10 06:43:07', NULL, '2023-11-10 06:42:59', '2023-11-10 06:43:07'),
(32, 'App\\Models\\User', 10, 'app_api', '881465a9949cc40acf8071921decbadf48120ffa42346a9f764c5be39f6e0bc1', '[\"*\"]', '2023-11-10 06:51:42', NULL, '2023-11-10 06:51:38', '2023-11-10 06:51:42'),
(33, 'App\\Models\\User', 10, 'app_api', '6c3a138e4e484ff79391bf0bd7641f2d58fe19520794185a60b795aad2638265', '[\"*\"]', '2023-11-10 07:03:44', NULL, '2023-11-10 07:03:37', '2023-11-10 07:03:44'),
(34, 'App\\Models\\User', 10, 'app_api', '258881f021b04ad8b5a24e447fe9cfa4d90244abb3ce3227c30e3611b0a97278', '[\"*\"]', '2023-11-10 07:13:29', NULL, '2023-11-10 07:08:23', '2023-11-10 07:13:29'),
(35, 'App\\Models\\User', 31, 'app_api', 'dbc34f637d21ce8e7d248666b2eb5f2132b5e87dd1c3202e6fba181f25b4c5dd', '[\"*\"]', '2023-11-10 07:14:54', NULL, '2023-11-10 07:14:45', '2023-11-10 07:14:54'),
(36, 'App\\Models\\User', 31, 'app_api', '913594be9c03f453c4430a0a0e83598b395b8f9b215c15fe2658c7ce8d4e5168', '[\"*\"]', '2023-11-10 07:15:32', NULL, '2023-11-10 07:15:28', '2023-11-10 07:15:32'),
(37, 'App\\Models\\User', 10, 'app_api', 'b73e5aad918080be5919cadcffd8a9092588b7b94d3422400db1cbbfd04fc7dd', '[\"*\"]', '2023-11-10 07:22:47', NULL, '2023-11-10 07:21:47', '2023-11-10 07:22:47'),
(38, 'App\\Models\\User', 31, 'app_api', 'd1b5258464c7ecf7b0fe65dab401f3e0858cb654ac29504a90a4007bc0287288', '[\"*\"]', '2023-11-10 07:23:27', NULL, '2023-11-10 07:23:18', '2023-11-10 07:23:27'),
(39, 'App\\Models\\User', 10, 'app_api', '3405115783956a70c30964a2916ea567703b7033cb32d029c5f41b6746522a34', '[\"*\"]', '2023-11-10 07:57:40', NULL, '2023-11-10 07:36:46', '2023-11-10 07:57:40'),
(40, 'App\\Models\\User', 31, 'app_api', '19dedf68a77a11ffc09f26e8dc855fdb1130a9b472a05308a5ebd64c4dbb5d89', '[\"*\"]', '2023-11-10 08:50:34', NULL, '2023-11-10 07:58:02', '2023-11-10 08:50:34'),
(41, 'App\\Models\\User', 33, 'app_api', '02bcdb7c3bb64aeb6262551ca1b51d4dc138cae89c4606f4908de4a3e634a066', '[\"*\"]', '2023-11-10 08:59:43', NULL, '2023-11-10 08:57:58', '2023-11-10 08:59:43'),
(42, 'App\\Models\\User', 34, 'app_api', '8b2a6a3cb4e3d055fa61d66e086ee6d20664bc2408315de03e8a11213f3290ff', '[\"*\"]', '2023-11-10 09:14:18', NULL, '2023-11-10 09:00:45', '2023-11-10 09:14:18'),
(43, 'App\\Models\\User', 34, 'app_api', 'c4c48253b758dcc971bfc7e60249e2b4dcafe9b1c0db622d7963c89b693c99bb', '[\"*\"]', '2023-11-10 09:14:56', NULL, '2023-11-10 09:14:52', '2023-11-10 09:14:56'),
(44, 'App\\Models\\User', 33, 'app_api', '6c0d3c8f1a6a3097f5ee90dab7d5fdc022c2b1a313c76ed52c2839b44e40e93e', '[\"*\"]', '2023-11-10 09:16:09', NULL, '2023-11-10 09:15:32', '2023-11-10 09:16:09'),
(45, 'App\\Models\\User', 34, 'app_api', '3996753f8bc19a60ef535e3efb5866e61ec57be81d5a3207169c1e2019227985', '[\"*\"]', '2023-11-10 09:16:55', NULL, '2023-11-10 09:16:38', '2023-11-10 09:16:55'),
(46, 'App\\Models\\User', 33, 'app_api', '309f91fd91280c4be605c6ea302a63841b7eee7885d1445c9150ded2daf226ab', '[\"*\"]', '2023-11-10 10:05:34', NULL, '2023-11-10 09:18:05', '2023-11-10 10:05:34'),
(47, 'App\\Models\\User', 35, 'app_api', 'c1e6f7d41f579ca19e0397bc737296c4197603dfeab3243c53aee895802a8c43', '[\"*\"]', '2023-11-10 10:18:56', NULL, '2023-11-10 10:00:48', '2023-11-10 10:18:56'),
(48, 'App\\Models\\User', 34, 'app_api', '7def18383ba2b6ccb13118897a76691f00bb46c8c707a08cad23c252f418b1a0', '[\"*\"]', '2023-11-10 10:26:45', NULL, '2023-11-10 10:06:36', '2023-11-10 10:26:45'),
(49, 'App\\Models\\User', 33, 'app_api', '7a8a9c81b1d0989ac4d7ff88cf8e26252cbe7091e1fe3f659232af40199c4b3b', '[\"*\"]', '2023-12-01 06:51:04', NULL, '2023-11-10 10:20:34', '2023-12-01 06:51:04'),
(50, 'App\\Models\\User', 34, 'app_api', 'fe144ec1b46cfd4c974c6b4b8e9f4dd3f7d01344ec387346962f13e60b5d3854', '[\"*\"]', '2023-11-10 10:31:09', NULL, '2023-11-10 10:27:23', '2023-11-10 10:31:09'),
(51, 'App\\Models\\User', 33, 'app_api', 'ce55f84faedb6952c783556253e395b393e7c4c5b05dfaa99698712008db0dbf', '[\"*\"]', '2023-11-10 10:33:58', NULL, '2023-11-10 10:32:14', '2023-11-10 10:33:58'),
(52, 'App\\Models\\User', 34, 'app_api', '762afca0bb97e60e35af7bc58eb96287791a99ac5e97f08c9bc30ba914db91cf', '[\"*\"]', '2023-11-10 11:20:06', NULL, '2023-11-10 10:34:17', '2023-11-10 11:20:06'),
(53, 'App\\Models\\User', 33, 'app_api', '2bd75806782a43f35d5c2ac7f21a9c334d4781eec8f4aac2f07d154baa44e89f', '[\"*\"]', '2023-11-10 11:21:15', NULL, '2023-11-10 11:20:37', '2023-11-10 11:21:15'),
(54, 'App\\Models\\User', 34, 'app_api', 'b4a76ff3b9e3152eed600f9d8068382badc15eccf9ef855515cdab8d51a17dcd', '[\"*\"]', '2023-11-10 11:25:35', NULL, '2023-11-10 11:21:35', '2023-11-10 11:25:35'),
(55, 'App\\Models\\User', 33, 'app_api', '9b691344a8ef430ff026ab1d6da13d230115112829bc9afc1096d02d76b985ae', '[\"*\"]', '2023-11-10 11:34:12', NULL, '2023-11-10 11:27:37', '2023-11-10 11:34:12'),
(56, 'App\\Models\\User', 34, 'app_api', 'b48846053a154585553207167f7c7a676e6cea00369de0e49938100b563c3074', '[\"*\"]', '2023-11-10 11:39:06', NULL, '2023-11-10 11:34:30', '2023-11-10 11:39:06'),
(57, 'App\\Models\\User', 33, 'app_api', '89439cb58a6093cfd4f2a5c3f1d7074165e602a8698ef345a7fbd4f56dea3092', '[\"*\"]', '2023-11-10 11:54:24', NULL, '2023-11-10 11:54:20', '2023-11-10 11:54:24'),
(58, 'App\\Models\\User', 34, 'app_api', 'd2bed593dc8fee810005222ddc98a5db7eb9262f9eead38a1c3cd7a5ae9fa75e', '[\"*\"]', '2023-11-10 12:06:50', NULL, '2023-11-10 12:06:36', '2023-11-10 12:06:50'),
(59, 'App\\Models\\User', 33, 'app_api', '4435f55cb36de9f6778d3253162d9855f3bc853ec071938ddc5c69e3bbc2a874', '[\"*\"]', '2023-11-14 05:12:43', NULL, '2023-11-10 12:40:10', '2023-11-14 05:12:43'),
(60, 'App\\Models\\User', 33, 'app_api', '6400c65eae843c90536caf872ba59da6903f051d66ebdc17acc478623621c1f6', '[\"*\"]', '2023-11-17 05:38:04', NULL, '2023-11-10 12:52:41', '2023-11-17 05:38:04'),
(61, 'App\\Models\\User', 33, 'app_api', '5479d6dd79a73f26a67610cba0a0dd549930f02c2a582bd3a1b556e83cc67d13', '[\"*\"]', '2023-11-13 06:53:08', NULL, '2023-11-13 06:43:46', '2023-11-13 06:53:08'),
(62, 'App\\Models\\User', 36, 'app_api', '27587f66a4c7d7aef2e6c7a55bb46c6c995ebd569a05c62b76ec7c23872c3dff', '[\"*\"]', NULL, NULL, '2023-11-13 06:55:20', '2023-11-13 06:55:20'),
(63, 'App\\Models\\User', 36, 'app_api', '5976a01b3110fda4ae673b5fbffd3f8bb01e9c49f8399ea3af8b5035f26b7cea', '[\"*\"]', '2023-11-27 10:23:44', NULL, '2023-11-13 06:55:43', '2023-11-27 10:23:44'),
(64, 'App\\Models\\User', 36, 'app_api', 'a6299aa312a37f5a718bab3974373101df7d54c998c0e80edf1b3b9a19861c90', '[\"*\"]', '2023-12-01 20:36:33', NULL, '2023-11-13 07:14:14', '2023-12-01 20:36:33'),
(65, 'App\\Models\\User', 34, 'app_api', 'c1fe0223fb95ea079778cf17ba3fb9cbe340a1e436ea42c95e1580f16f9a5c1e', '[\"*\"]', '2023-11-14 05:22:14', NULL, '2023-11-14 05:13:06', '2023-11-14 05:22:14'),
(66, 'App\\Models\\User', 33, 'app_api', 'a184c22fe0f3c79901c8a1d75d827b6857c94a1f7b754c53f40c5a684e25d6d7', '[\"*\"]', '2023-12-01 20:58:57', NULL, '2023-11-14 05:46:10', '2023-12-01 20:58:57'),
(67, 'App\\Models\\User', 34, 'app_api', '3f2866a37601bc77afa3afa7a0ba017cc558a7c6fbb587f628ee0a58ec023604', '[\"*\"]', '2023-11-15 06:31:15', NULL, '2023-11-15 05:42:06', '2023-11-15 06:31:15'),
(68, 'App\\Models\\User', 34, 'app_api', '57b8bf8e66174a1b6209d9def424abe1859b26e57630925169a3cdf1680d6b86', '[\"*\"]', '2023-11-15 09:13:46', NULL, '2023-11-15 06:53:48', '2023-11-15 09:13:46'),
(69, 'App\\Models\\User', 37, 'app_api', 'e1febd6739e3ecf54d5e1e3d3a147a01625b280f7fac1c6067d9724ddd0c5847', '[\"*\"]', '2023-11-15 07:41:21', NULL, '2023-11-15 07:41:20', '2023-11-15 07:41:21'),
(70, 'App\\Models\\User', 38, 'app_api', '3a7e32dc1a8bbfb8cc57f7dcef36c0d073169d8e91f6255d950c99b8c4a57cba', '[\"*\"]', '2023-11-15 08:39:14', NULL, '2023-11-15 07:49:43', '2023-11-15 08:39:14'),
(71, 'App\\Models\\User', 38, 'app_api', 'b08c6971f4c30a5f4ad98ee19f1e614186ac0b1c048af46f247cd726fe70dd48', '[\"*\"]', '2023-11-15 08:42:41', NULL, '2023-11-15 08:42:40', '2023-11-15 08:42:41'),
(72, 'App\\Models\\User', 34, 'app_api', 'd990d86571ca36fea72488fd0e4580b092dd0b9c9618eaf111a7d3061f240bdf', '[\"*\"]', '2023-11-15 12:43:18', NULL, '2023-11-15 09:15:25', '2023-11-15 12:43:18'),
(73, 'App\\Models\\User', 34, 'app_api', 'd7a9f62a255a61559ac6170bd5eed9241819f6ae388774608d2af36d6bca341d', '[\"*\"]', '2023-11-15 13:03:56', NULL, '2023-11-15 12:43:38', '2023-11-15 13:03:56'),
(74, 'App\\Models\\User', 34, 'app_api', '5e3d22aed98a451de6aa29d6e76d059751aa38192951c31a22bad12b2383d122', '[\"*\"]', '2023-11-16 07:02:43', NULL, '2023-11-16 05:06:34', '2023-11-16 07:02:43'),
(75, 'App\\Models\\User', 33, 'app_api', '6d682be6c24f82c0449f9ce8e76701d13f80981f8d87f47a3281fd90f3fc744b', '[\"*\"]', '2023-11-16 07:11:22', NULL, '2023-11-16 07:08:49', '2023-11-16 07:11:22'),
(76, 'App\\Models\\User', 34, 'app_api', '599f073410ec8d1d7027dcbb5afc13e311c6931144bba6fcf485b4d7bfc35010', '[\"*\"]', '2023-11-16 07:12:08', NULL, '2023-11-16 07:11:51', '2023-11-16 07:12:08'),
(77, 'App\\Models\\User', 33, 'app_api', 'b1f4a9d3f28e40b4313c3c18bd66c2032acbb021410dfcbf60f8fd0130c4116d', '[\"*\"]', '2023-11-16 07:32:44', NULL, '2023-11-16 07:12:32', '2023-11-16 07:32:44'),
(78, 'App\\Models\\User', 34, 'app_api', '1cd00984c62e26d6ed5582087ceab95095e958f9e18c77c5cdeb1fd5d5610384', '[\"*\"]', '2023-11-16 07:36:00', NULL, '2023-11-16 07:35:45', '2023-11-16 07:36:00'),
(79, 'App\\Models\\User', 33, 'app_api', 'bd351e0b858fa152cb3a9866deea6d96644885aaa9b82117fdff4404ed760348', '[\"*\"]', '2023-11-16 07:36:57', NULL, '2023-11-16 07:36:23', '2023-11-16 07:36:57'),
(80, 'App\\Models\\User', 34, 'app_api', 'f1d2a96917081c2fc388c31c951437c09d82cab0cf957f77d0ce4ba0a270bb5c', '[\"*\"]', '2023-11-16 09:02:51', NULL, '2023-11-16 07:59:05', '2023-11-16 09:02:51'),
(81, 'App\\Models\\User', 33, 'app_api', '89936504d0318881af4a3a13acabd5c729fcce8d0a724c09344b711db6581e8c', '[\"*\"]', '2023-11-16 09:09:04', NULL, '2023-11-16 09:03:37', '2023-11-16 09:09:04'),
(82, 'App\\Models\\User', 34, 'app_api', '1d82e03227d9ab8851bd7f9424665f01c641e8a4157c49feb8d682f4de1211f7', '[\"*\"]', '2023-11-16 09:11:29', NULL, '2023-11-16 09:10:53', '2023-11-16 09:11:29'),
(83, 'App\\Models\\User', 33, 'app_api', '2f7ec9f42682a9ebb306670c47df4b643d34a09626fb2d79120ce2fbf01550b9', '[\"*\"]', '2023-11-16 09:14:50', NULL, '2023-11-16 09:13:28', '2023-11-16 09:14:50'),
(84, 'App\\Models\\User', 33, 'app_api', 'a0dabec42a8ff4cc737e08dccfeff050eb2a7b87bd0bab95b22742584cc0f02e', '[\"*\"]', '2023-11-16 09:54:25', NULL, '2023-11-16 09:24:25', '2023-11-16 09:54:25'),
(85, 'App\\Models\\User', 33, 'app_api', '42e5907640d79defc2120325c962d76c32010d7c4478962f9880e15cde593dfb', '[\"*\"]', '2023-11-16 12:07:26', NULL, '2023-11-16 09:57:22', '2023-11-16 12:07:26'),
(86, 'App\\Models\\User', 34, 'app_api', '8f6295e9b050db327904aa576c7522a21dec0cf1184cbb9ca630a5fbaa2fed1c', '[\"*\"]', '2023-11-16 12:08:23', NULL, '2023-11-16 12:07:55', '2023-11-16 12:08:23'),
(87, 'App\\Models\\User', 33, 'app_api', 'b64f7bc8b96883325320b8b53a8052a63064a3e3fa0a634a5e442681fd819b40', '[\"*\"]', '2023-11-16 12:33:54', NULL, '2023-11-16 12:08:51', '2023-11-16 12:33:54'),
(88, 'App\\Models\\User', 34, 'app_api', '6f86feed09ac8fc0a1dae65cd1f60102fbc1dd4871c8c463923deb5553db0c93', '[\"*\"]', '2023-11-16 12:34:43', NULL, '2023-11-16 12:34:16', '2023-11-16 12:34:43'),
(89, 'App\\Models\\User', 33, 'app_api', 'cb5a099eda67d8c3788ef9319d7ff7ac084dab7d26c39313553ee8ba2ba84833', '[\"*\"]', '2023-11-17 06:00:58', NULL, '2023-11-16 12:35:22', '2023-11-17 06:00:58'),
(90, 'App\\Models\\User', 34, 'app_api', '027476934dbf110dc1dededeba1904718931f1e20ec2c8cde3255590b8e2f9d1', '[\"*\"]', '2023-11-17 06:01:59', NULL, '2023-11-17 06:01:17', '2023-11-17 06:01:59'),
(91, 'App\\Models\\User', 33, 'app_api', '2444fd8102d3826c7cd88f3ab883e1330a92c17d7847c1e55b091014589b2ff2', '[\"*\"]', '2023-11-17 06:22:22', NULL, '2023-11-17 06:12:28', '2023-11-17 06:22:22'),
(92, 'App\\Models\\User', 33, 'app_api', '9c7770479f78da87268508bb0909220f25efd79df1fa5c3304fa1a904281a57e', '[\"*\"]', '2023-11-17 06:34:29', NULL, '2023-11-17 06:34:26', '2023-11-17 06:34:29'),
(93, 'App\\Models\\User', 34, 'app_api', 'd9a1732acdfd7fcaa92220eb8160faa7001e54bfcbb88c92be8be121620f656e', '[\"*\"]', '2023-11-17 09:29:52', NULL, '2023-11-17 06:34:57', '2023-11-17 09:29:52'),
(94, 'App\\Models\\User', 33, 'app_api', '08f6a9a684e4af83853acf921c6e91a9205e92249586240b4b1aaf415ddceeb0', '[\"*\"]', '2023-11-20 05:28:06', NULL, '2023-11-20 05:25:33', '2023-11-20 05:28:06'),
(95, 'App\\Models\\User', 39, 'app_api', '7236ff846d928755a2c69bd06be477a3143fa4ea8accf579e2a7dc6f6dd71c3d', '[\"*\"]', '2023-11-27 03:19:35', NULL, '2023-11-21 05:57:18', '2023-11-27 03:19:35'),
(96, 'App\\Models\\User', 40, 'app_api', 'b10f8e03b98a9f5de7580ab8a0df3ddd03adf7a2759c7d0450e369af7d10f079', '[\"*\"]', '2023-11-22 07:29:13', NULL, '2023-11-22 07:29:11', '2023-11-22 07:29:13'),
(97, 'App\\Models\\User', 41, 'app_api', '401d19ec392bd8760fbac35fc51f39cae8b18aa6bba1fc1c5e959f4b71fe8a34', '[\"*\"]', '2023-11-22 10:44:11', NULL, '2023-11-22 07:30:12', '2023-11-22 10:44:11'),
(98, 'App\\Models\\User', 34, 'app_api', 'da7cb3d2fd8e50d3e0eb10afbbeb4e1f8091ecd3fe11b5da5fe860e74fcc6179', '[\"*\"]', '2023-11-22 10:51:24', NULL, '2023-11-22 10:51:23', '2023-11-22 10:51:24'),
(99, 'App\\Models\\User', 34, 'app_api', '64209cad5efb6be7149ae3f1872e52c64a5a285718ffd41393384f1083c7f143', '[\"*\"]', '2023-11-22 10:53:22', NULL, '2023-11-22 10:53:10', '2023-11-22 10:53:22'),
(100, 'App\\Models\\User', 34, 'app_api', 'c0215086c0492e66fc8b2098add9cc412bd259e1ceab57d96ab1925970e3538a', '[\"*\"]', '2023-11-22 10:55:43', NULL, '2023-11-22 10:54:50', '2023-11-22 10:55:43'),
(101, 'App\\Models\\User', 33, 'app_api', '24a425550d6328f40b32f4c11e1cf1471078ec8fe02b0b3935d89a240fd6b0d6', '[\"*\"]', '2023-11-22 11:04:24', NULL, '2023-11-22 11:04:23', '2023-11-22 11:04:24'),
(102, 'App\\Models\\User', 34, 'app_api', '60d904f58142ea30aae3c8d545369146f9d7f036fcbdb07dcc9c4be1cef3b617', '[\"*\"]', '2023-11-22 11:04:56', NULL, '2023-11-22 11:04:55', '2023-11-22 11:04:56'),
(103, 'App\\Models\\User', 42, 'app_api', '0b1a9503b0becadf56155973c01e09316b38b348cc00b6bc9a8166e09608f69d', '[\"*\"]', '2023-11-27 05:37:11', NULL, '2023-11-27 04:18:23', '2023-11-27 05:37:11'),
(104, 'App\\Models\\User', 42, 'app_api', 'ef92d175e6b75875d5e200bcd031a38d24413dfe9a7eff3cb02c867a748f077f', '[\"*\"]', '2023-11-27 05:37:50', NULL, '2023-11-27 05:37:48', '2023-11-27 05:37:50'),
(105, 'App\\Models\\User', 43, 'app_api', 'c4199c2fd6efd85e0799a4972858129887511a65bd8b716150b864dbffc5d19c', '[\"*\"]', '2023-11-27 08:38:58', NULL, '2023-11-27 05:39:02', '2023-11-27 08:38:58'),
(106, 'App\\Models\\User', 44, 'app_api', '73a400bd31363ba01e132bb354d7f8400cd3b7652abd28a8c125e5d02c520303', '[\"*\"]', '2023-11-29 10:41:54', NULL, '2023-11-27 06:03:53', '2023-11-29 10:41:54'),
(107, 'App\\Models\\User', 42, 'app_api', 'ab30ed6ce1e80b241354f0f80f1404acdb99b49b39f65de863b2da1bf92175b0', '[\"*\"]', '2023-11-28 04:34:36', NULL, '2023-11-27 08:47:14', '2023-11-28 04:34:36'),
(108, 'App\\Models\\User', 33, 'app_api', '47222aecb96d952d94aa1836838478d9895f75173b972cd3150a23db69f4ae24', '[\"*\"]', '2023-11-29 06:30:03', NULL, '2023-11-27 14:09:31', '2023-11-29 06:30:03'),
(109, 'App\\Models\\User', 43, 'app_api', 'c08e4ce0253da38cbd599b7d964e4b431839105466c9333cfd231c37e81e66f0', '[\"*\"]', '2023-11-28 05:27:14', NULL, '2023-11-28 04:35:02', '2023-11-28 05:27:14'),
(110, 'App\\Models\\User', 42, 'app_api', 'ed1a55dcf31e60d57aea014a4c58d8e410188f013afec3881a73a337770e5753', '[\"*\"]', '2023-11-28 05:40:28', NULL, '2023-11-28 05:27:47', '2023-11-28 05:40:28'),
(111, 'App\\Models\\User', 43, 'app_api', '56d7a3acf102071c89c9a8fb9150f6fd9c51a5564e7c9a4dadac07699f92bd37', '[\"*\"]', '2023-11-28 05:43:31', NULL, '2023-11-28 05:40:57', '2023-11-28 05:43:31'),
(112, 'App\\Models\\User', 42, 'app_api', '230dbf2928d4a09b3dd83796be9804dca6eb6b7b69ccb447af2e4483d55df21c', '[\"*\"]', '2023-11-28 06:30:27', NULL, '2023-11-28 05:47:46', '2023-11-28 06:30:27'),
(113, 'App\\Models\\User', 43, 'app_api', 'aa9c3fa80a23264a2d289f4d93a4b64dc924b13428a51c2d8a4c9eb5dcd38478', '[\"*\"]', '2023-11-28 06:32:17', NULL, '2023-11-28 06:30:50', '2023-11-28 06:32:17'),
(114, 'App\\Models\\User', 42, 'app_api', '086b2f93297c41cae2bab82eb72f96ad28d77b74e3aa5a75142061d45878414f', '[\"*\"]', '2023-11-28 06:39:41', NULL, '2023-11-28 06:32:46', '2023-11-28 06:39:41'),
(115, 'App\\Models\\User', 43, 'app_api', '1cf0ebb321e92112e3fc6d4f7e23fcf3b44078c8d705524c0773cdc39de21dce', '[\"*\"]', '2023-11-28 08:49:24', NULL, '2023-11-28 06:40:05', '2023-11-28 08:49:24'),
(116, 'App\\Models\\User', 33, 'app_api', 'ff4d6650e71d261b6c8f39f466b8672464bbae4eeb4405cfdae7a0ce6fdbc8c8', '[\"*\"]', '2023-12-01 05:32:58', NULL, '2023-11-28 06:52:15', '2023-12-01 05:32:58'),
(117, 'App\\Models\\User', 42, 'app_api', 'd85159ba07398f3c70aafeedcf7af54494f1f84648320b883a3405cfc0c6f06f', '[\"*\"]', '2023-11-28 08:52:54', NULL, '2023-11-28 08:50:03', '2023-11-28 08:52:54'),
(118, 'App\\Models\\User', 43, 'app_api', '2281280c25b7ac351a17a4cca5a851b440afc7236cbbfc4b74875dfd2c369184', '[\"*\"]', '2023-11-28 10:45:25', NULL, '2023-11-28 08:53:16', '2023-11-28 10:45:25'),
(119, 'App\\Models\\User', 42, 'app_api', 'b84adbe557fa28b1f44083417368addbd194ab636d8fd1bb27838f5ea90fbaec', '[\"*\"]', '2023-11-29 06:06:41', NULL, '2023-11-28 10:46:17', '2023-11-29 06:06:41'),
(120, 'App\\Models\\User', 43, 'app_api', 'e3595213a5e005a6fd6022ea9af321ddad6f6ff583d9a049a56373b4a4b57803', '[\"*\"]', '2023-11-29 08:14:29', NULL, '2023-11-29 06:08:00', '2023-11-29 08:14:29'),
(121, 'App\\Models\\User', 42, 'app_api', 'ec6d65d98faa65d29a6c74b11542b280aed4cb8d10a03c65e25810566746be2b', '[\"*\"]', '2023-11-29 08:29:25', NULL, '2023-11-29 08:15:00', '2023-11-29 08:29:25'),
(122, 'App\\Models\\User', 43, 'app_api', '67b3263db4db2e9b18fcb27418a3d961513ccf7f8e0b9d40fc456f5773092fdf', '[\"*\"]', '2023-11-29 09:13:57', NULL, '2023-11-29 08:29:43', '2023-11-29 09:13:57'),
(123, 'App\\Models\\User', 42, 'app_api', 'f8be381e378799c8cb6d102d0edba7d300451dd0db4ec4bc2df10e9dbf08e582', '[\"*\"]', '2023-11-29 09:23:48', NULL, '2023-11-29 09:14:49', '2023-11-29 09:23:48'),
(124, 'App\\Models\\User', 43, 'app_api', 'a59e226aa353801f793098e224c873221eb75d90ce9c1db5a8454da30e30ef88', '[\"*\"]', '2023-11-29 09:30:31', NULL, '2023-11-29 09:24:17', '2023-11-29 09:30:31'),
(125, 'App\\Models\\User', 42, 'app_api', '79a8bbca9a2e148fdf621c5df57f81780bd434d7b70187ee0c85f76528f6a797', '[\"*\"]', '2023-11-29 09:31:57', NULL, '2023-11-29 09:31:06', '2023-11-29 09:31:57'),
(126, 'App\\Models\\User', 43, 'app_api', '8723641026dc9da31f0e8612a32bb64934ba8c2b1d580f7052258e764d11e696', '[\"*\"]', '2023-11-29 09:37:12', NULL, '2023-11-29 09:32:31', '2023-11-29 09:37:12'),
(127, 'App\\Models\\User', 42, 'app_api', 'addc9bc7447b47413108a4bc555afd8d7bb7a008b536d46ecdb8bf4251909ccf', '[\"*\"]', '2023-11-29 09:43:12', NULL, '2023-11-29 09:37:44', '2023-11-29 09:43:12'),
(128, 'App\\Models\\User', 43, 'app_api', '34578e52c0966c9c21e6447103db9791f469f3047df47014dd176e3b65d5ab72', '[\"*\"]', '2023-11-29 09:54:00', NULL, '2023-11-29 09:43:38', '2023-11-29 09:54:00'),
(129, 'App\\Models\\User', 42, 'app_api', 'dd16939a86b04b4a29a41a3818518f501bb8b6c001f9972fa42265e484184cd3', '[\"*\"]', '2023-11-29 10:41:40', NULL, '2023-11-29 09:54:28', '2023-11-29 10:41:40'),
(130, 'App\\Models\\User', 45, 'app_api', 'e7b6aa6763753b5449f5adc1eef043d42548b66289460f0d2661e3273ffc698c', '[\"*\"]', '2023-11-29 10:45:27', NULL, '2023-11-29 10:42:49', '2023-11-29 10:45:27'),
(131, 'App\\Models\\User', 46, 'app_api', 'c22841b1075fdeb037151e5351804513da271113dae333406e91c6e3c175abab', '[\"*\"]', '2023-11-30 02:46:05', NULL, '2023-11-29 10:43:27', '2023-11-30 02:46:05'),
(132, 'App\\Models\\User', 42, 'app_api', 'c39d4204fac91fb4aff18c0cbce204db5e748ca520506995f87c74bd10826d1e', '[\"*\"]', '2023-11-29 10:46:33', NULL, '2023-11-29 10:45:52', '2023-11-29 10:46:33'),
(133, 'App\\Models\\User', 46, 'app_api', '2e906a3f093f69ddddaa2fbda958a5eb3cf9c6dc12e62267c7f64df354064c8d', '[\"*\"]', '2023-11-29 10:48:25', NULL, '2023-11-29 10:47:30', '2023-11-29 10:48:25'),
(134, 'App\\Models\\User', 43, 'app_api', 'ae6457d97edcdd46bfedcd756519d159d0024038948199c1bb39023aa91ecb6e', '[\"*\"]', '2023-11-29 10:52:46', NULL, '2023-11-29 10:49:56', '2023-11-29 10:52:46'),
(135, 'App\\Models\\User', 42, 'app_api', 'e45b833c041db5ebe693bcf9656161d0e46938cfddc55d9ee87673e6e6f652ac', '[\"*\"]', '2023-11-29 10:56:15', NULL, '2023-11-29 10:53:06', '2023-11-29 10:56:15'),
(136, 'App\\Models\\User', 43, 'app_api', '978345b4cd50b1db671fa642b32eb1a381a2f45c678a1f75779ad55d9658cbdc', '[\"*\"]', '2023-11-30 02:37:57', NULL, '2023-11-29 10:56:44', '2023-11-30 02:37:57'),
(137, 'App\\Models\\User', 33, 'app_api', '25e9e1c664e50e6f55bbbae680821e17c2903c3fac15d99e14317f97a7114dc8', '[\"*\"]', '2023-11-29 12:48:16', NULL, '2023-11-29 11:28:33', '2023-11-29 12:48:16'),
(138, 'App\\Models\\User', 42, 'app_api', '7c9ed0361e7d63d4d07a019532c772ec7eb0e4d691bd7ce2c91ce0b3b1deea33', '[\"*\"]', '2023-11-30 04:23:54', NULL, '2023-11-30 02:41:00', '2023-11-30 04:23:54'),
(139, 'App\\Models\\User', 43, 'app_api', '9fead8eac543abf9e2c4100848704e6250ba449a9fe38a4e760a5a20c905a937', '[\"*\"]', '2023-11-30 02:51:44', NULL, '2023-11-30 02:47:49', '2023-11-30 02:51:44'),
(140, 'App\\Models\\User', 42, 'app_api', '594eddca0c70ec0096f14304c86f3a82812b43127375131b658620741ab4dc07', '[\"*\"]', '2023-11-30 07:42:20', NULL, '2023-11-30 02:52:51', '2023-11-30 07:42:20'),
(141, 'App\\Models\\User', 43, 'app_api', '678be1dade7901d57d95c9dee0d3b9ed3ce595c696186eb7fceb8893fa05506b', '[\"*\"]', '2023-12-01 03:39:05', NULL, '2023-11-30 04:25:17', '2023-12-01 03:39:05'),
(142, 'App\\Models\\User', 45, 'app_api', '012b0d2a300146047550ead93642be23ba124a811fc01a434c773500812093c0', '[\"*\"]', '2023-11-30 08:14:03', NULL, '2023-11-30 07:44:35', '2023-11-30 08:14:03'),
(143, 'App\\Models\\User', 46, 'app_api', '63ce63f6089664d90b985bbec99529a2e53eef4730d46573a54a009ed7b03eda', '[\"*\"]', '2023-11-30 08:14:55', NULL, '2023-11-30 08:14:54', '2023-11-30 08:14:55'),
(144, 'App\\Models\\User', 46, 'app_api', '844fd456b889cbaeacafd223e71eec51d428183e81d450c13ab618fe9ae1e786', '[\"*\"]', '2023-11-30 08:15:05', NULL, '2023-11-30 08:14:54', '2023-11-30 08:15:05'),
(145, 'App\\Models\\User', 42, 'app_api', '30cf669507eb97e0b6e814adb59bb251d97d59cc8c5cb377ea0955d158ec1bf9', '[\"*\"]', '2023-11-30 08:17:25', NULL, '2023-11-30 08:16:09', '2023-11-30 08:17:25'),
(146, 'App\\Models\\User', 45, 'app_api', '6ddbbbda8ac36fe70e3e1133436142c0a5ba59ef9ac70fdbc0e672b4c5f26795', '[\"*\"]', '2023-11-30 08:23:40', NULL, '2023-11-30 08:17:57', '2023-11-30 08:23:40'),
(147, 'App\\Models\\User', 45, 'app_api', '3bf5cd8c29f60b2893d34e2a59fa9455c13d35f3b55212d6ce3768c3148f78ae', '[\"*\"]', '2023-11-30 08:29:37', NULL, '2023-11-30 08:26:01', '2023-11-30 08:29:37'),
(148, 'App\\Models\\User', 42, 'app_api', 'daf29add6847f883579c1f182ea31355aff01ff0ac133546201031d21cae25bd', '[\"*\"]', '2023-11-30 08:37:32', NULL, '2023-11-30 08:32:44', '2023-11-30 08:37:32'),
(149, 'App\\Models\\User', 45, 'app_api', '3fccef7562e0511fb1e6b6d5be1f833c106e1755c9380a76c6c868bddb45f5be', '[\"*\"]', '2023-11-30 10:11:15', NULL, '2023-11-30 08:38:17', '2023-11-30 10:11:15'),
(150, 'App\\Models\\User', 42, 'app_api', '7dd8bfede13891b58f4a9e9ffa0a67e1b4ee56603a4eeec115532dc85d1b8b9e', '[\"*\"]', '2023-11-30 10:45:55', NULL, '2023-11-30 10:39:29', '2023-11-30 10:45:55'),
(151, 'App\\Models\\User', 45, 'app_api', '771d440ccb83032dd9c68a786d8e83916f27961e2a9779944468a0f27936f3d7', '[\"*\"]', '2023-12-01 06:05:09', NULL, '2023-11-30 10:46:17', '2023-12-01 06:05:09'),
(152, 'App\\Models\\User', 42, 'app_api', 'a0cb76285c01ca90fd450c3433c85f72a9e25e1798772e3bf438296de877de3a', '[\"*\"]', '2023-11-30 12:34:46', NULL, '2023-11-30 12:29:31', '2023-11-30 12:34:46'),
(153, 'App\\Models\\User', 43, 'app_api', 'b178538d242e778f1c133b7e1c16ccbd3ed6125f0274d10302d28d813b1bc825', '[\"*\"]', '2023-11-30 12:42:02', NULL, '2023-11-30 12:35:18', '2023-11-30 12:42:02'),
(154, 'App\\Models\\User', 42, 'app_api', 'd0b6b80a169aa97c0be9b27e0d22c946da8d951763bcf26740c0df26da4d6f27', '[\"*\"]', '2023-12-01 04:30:45', NULL, '2023-12-01 03:39:49', '2023-12-01 04:30:45'),
(155, 'App\\Models\\User', 43, 'app_api', 'cdc311de015d60b083ab61e75fc1bd75cd698597474a31a5f3a53487d70916ef', '[\"*\"]', '2023-12-01 04:40:20', NULL, '2023-12-01 04:31:06', '2023-12-01 04:40:20'),
(156, 'App\\Models\\User', 42, 'app_api', '411de600dc7e4c04eaeb62b4f78c494d7bf16d61ee8269a6198c388d528e5065', '[\"*\"]', '2023-12-01 04:41:33', NULL, '2023-12-01 04:40:53', '2023-12-01 04:41:33'),
(157, 'App\\Models\\User', 43, 'app_api', '3c864abfac627b49216312eb4549e684a831295db3619cfb2fd948f965638609', '[\"*\"]', '2023-12-01 04:45:55', NULL, '2023-12-01 04:41:55', '2023-12-01 04:45:55'),
(158, 'App\\Models\\User', 42, 'app_api', '50b0095f7b7ff432748bff0cee78c6fcc21f194811639226af3dc0d7c56c9a18', '[\"*\"]', '2023-12-01 04:50:37', NULL, '2023-12-01 04:46:22', '2023-12-01 04:50:37'),
(159, 'App\\Models\\User', 43, 'app_api', '379bcce8c4a5f0d5eb407d2a874d9fca10ccf8af30314943759530793629821f', '[\"*\"]', '2023-12-01 04:52:17', NULL, '2023-12-01 04:51:01', '2023-12-01 04:52:17'),
(160, 'App\\Models\\User', 42, 'app_api', 'e7dd8e20146455f87b2c1642fe92d71d72c39ce5e69c2662ccb4b90de6133c48', '[\"*\"]', '2023-12-01 06:11:54', NULL, '2023-12-01 04:52:45', '2023-12-01 06:11:54'),
(161, 'App\\Models\\User', 45, 'app_api', '525f1f1666e0bdb3063b67c8821eae541f2c2ac4c38797fe17a68818ea660996', '[\"*\"]', '2023-12-01 09:30:22', NULL, '2023-12-01 06:06:49', '2023-12-01 09:30:22'),
(162, 'App\\Models\\User', 43, 'app_api', '664514ddd837f543548460134d74d5da0ff1dfaf17f04da5bd12199aa2934c81', '[\"*\"]', '2023-12-01 06:13:34', NULL, '2023-12-01 06:12:13', '2023-12-01 06:13:34'),
(163, 'App\\Models\\User', 42, 'app_api', '77c9105461c98ffd0cd3c63c9af060ae65f01989bfc655c696d0f765a9dd55d4', '[\"*\"]', '2023-12-01 06:17:14', NULL, '2023-12-01 06:13:57', '2023-12-01 06:17:14'),
(164, 'App\\Models\\User', 43, 'app_api', 'e0e9f131aa308c0c7980d88d68ef08f0c5c8da09aa4c09898a7164e023546d45', '[\"*\"]', '2023-12-01 06:21:16', NULL, '2023-12-01 06:17:38', '2023-12-01 06:21:16'),
(165, 'App\\Models\\User', 42, 'app_api', '6b57a13f1960d509a590e9558431d848189411208c7df2fb32986cc94b1a451f', '[\"*\"]', '2023-12-01 06:22:54', NULL, '2023-12-01 06:21:39', '2023-12-01 06:22:54'),
(166, 'App\\Models\\User', 43, 'app_api', '708662ec22a770c238992ef47c24f34fa5b42e1ee841212c2409e40d3745283b', '[\"*\"]', '2023-12-01 06:48:17', NULL, '2023-12-01 06:24:15', '2023-12-01 06:48:17'),
(167, 'App\\Models\\User', 42, 'app_api', '236c6d8a42d303a277a77d88ba5b6de6c06a584ad8e470bb093862aedef28918', '[\"*\"]', '2023-12-01 06:48:57', NULL, '2023-12-01 06:48:35', '2023-12-01 06:48:57'),
(168, 'App\\Models\\User', 43, 'app_api', '05a778e28383a78f36d2417e5b1988b281bc06cef99e8b14d2a7078f6a092ff0', '[\"*\"]', '2023-12-01 08:54:38', NULL, '2023-12-01 06:49:15', '2023-12-01 08:54:38'),
(169, 'App\\Models\\User', 42, 'app_api', 'f6274180ed6b5d66ddeccfa69af2112f41a30db85e5cca7c279491a03bf4341b', '[\"*\"]', '2023-12-01 09:30:21', NULL, '2023-12-01 08:55:04', '2023-12-01 09:30:21'),
(170, 'App\\Models\\User', 47, 'app_api', 'a4e40f146efdc7c7154159c4feb50cf113028be5e21c793dc065892c0f73952f', '[\"*\"]', '2023-12-01 09:43:54', NULL, '2023-12-01 09:31:30', '2023-12-01 09:43:54'),
(171, 'App\\Models\\User', 48, 'app_api', '606ac2bd3f7025551f1e4dead568023bb771b374b35861094e0143634ca91a38', '[\"*\"]', '2023-12-01 09:43:17', NULL, '2023-12-01 09:32:10', '2023-12-01 09:43:17'),
(172, 'App\\Models\\User', 43, 'app_api', '7d50d4860d7a5d5af970d0fdae0fadbc8a59542981ebf38166b5c198b0ab1d2d', '[\"*\"]', '2023-12-01 09:58:05', NULL, '2023-12-01 09:45:16', '2023-12-01 09:58:05'),
(173, 'App\\Models\\User', 48, 'app_api', 'afe02d5b837a7084fdf88262569fd93d5dface583a50b9eca99f15a0a218d538', '[\"*\"]', '2023-12-01 10:14:48', NULL, '2023-12-01 09:46:20', '2023-12-01 10:14:48'),
(174, 'App\\Models\\User', 42, 'app_api', '34ab73947e04e0942acd38ec16f585ed825c1d7ee4d00c7e152aa592d714ad70', '[\"*\"]', '2023-12-01 10:04:43', NULL, '2023-12-01 09:59:10', '2023-12-01 10:04:43'),
(175, 'App\\Models\\User', 42, 'app_api', '9bd1965d0864b5a30f7edeb4b62eef046ad27ead760e57013d6aacb2e6d8d52c', '[\"*\"]', '2023-12-01 10:06:08', NULL, '2023-12-01 10:05:32', '2023-12-01 10:06:08'),
(176, 'App\\Models\\User', 43, 'app_api', '5b87f79a3da2c77df999a8e5465c55452683836f521a5ca18b073da4bba03df6', '[\"*\"]', '2023-12-01 10:07:33', NULL, '2023-12-01 10:06:28', '2023-12-01 10:07:33'),
(177, 'App\\Models\\User', 42, 'app_api', '298e83852631283fa32333a40c5ee1ff070e4ef993303138e14a79c94543e63a', '[\"*\"]', '2023-12-01 10:16:59', NULL, '2023-12-01 10:09:11', '2023-12-01 10:16:59'),
(178, 'App\\Models\\User', 43, 'app_api', '509edfe8f5b4bca3563c34bbde31348f5a99204f80ca931130fb65cea0c85a70', '[\"*\"]', '2023-12-01 10:16:43', NULL, '2023-12-01 10:15:15', '2023-12-01 10:16:43'),
(179, 'App\\Models\\User', 43, 'app_api', 'c1ff9e6e08477c12807b5503abfc433e5ca3db944404f1aa9b7497cea3bfd220', '[\"*\"]', '2023-12-01 10:26:13', NULL, '2023-12-01 10:17:56', '2023-12-01 10:26:13'),
(180, 'App\\Models\\User', 49, 'app_api', '43ac8d8be4951a4a30ef38a47264b429e74cf3d2e134ca80dc24e17211a35826', '[\"*\"]', '2023-12-01 20:38:32', NULL, '2023-12-01 20:36:43', '2023-12-01 20:38:32'),
(181, 'App\\Models\\User', 50, 'app_api', '827f7f3226243eb674a2d865e24864340eeaad02d56bddc725d314f9e3b4cc6d', '[\"*\"]', '2023-12-01 20:42:06', NULL, '2023-12-01 20:39:31', '2023-12-01 20:42:06'),
(182, 'App\\Models\\User', 49, 'app_api', '02cbb692ef0c3a70b6ffb3ddeb81dfe20a99d1aad8e79c252e68cc75936ba589', '[\"*\"]', '2023-12-29 15:26:16', NULL, '2023-12-01 20:42:22', '2023-12-29 15:26:16'),
(183, 'App\\Models\\User', 49, 'app_api', 'bf22e95b30ff24cd43ead9f9f37f472ff968a85c3f6ee4fd6cdcbd1b0e26bc1b', '[\"*\"]', '2023-12-01 20:48:43', NULL, '2023-12-01 20:48:18', '2023-12-01 20:48:43'),
(184, 'App\\Models\\User', 43, 'app_api', 'bba69541e90eba3ba445963cc03d373a71f8f74d898072dab43f830bfe71e40b', '[\"*\"]', '2023-12-01 20:52:19', NULL, '2023-12-01 20:49:02', '2023-12-01 20:52:19'),
(185, 'App\\Models\\User', 49, 'app_api', 'ce0412a794020dc92764cee98dab891f3f9a34380484300a9088daa40e07b407', '[\"*\"]', '2023-12-01 21:10:18', NULL, '2023-12-01 20:52:36', '2023-12-01 21:10:18'),
(186, 'App\\Models\\User', 33, 'app_api', 'eae67448486f50283e1f2aa5c2c9e120aa6f50505f2a5bd94636ab0a02ef83bc', '[\"*\"]', '2023-12-01 21:02:48', NULL, '2023-12-01 21:02:23', '2023-12-01 21:02:48'),
(187, 'App\\Models\\User', 49, 'app_api', '98b46e18ed50f52ba8cc1123e7989b089e1feb70ce18b61da470a6b9aa7c388a', '[\"*\"]', '2023-12-01 21:10:43', NULL, '2023-12-01 21:10:29', '2023-12-01 21:10:43'),
(188, 'App\\Models\\User', 43, 'app_api', 'ac38af68bd62c56a1afcca27a37bc449e088bdc8f608c411cfbbde6f477a6cc5', '[\"*\"]', '2023-12-01 21:12:08', NULL, '2023-12-01 21:10:54', '2023-12-01 21:12:08'),
(189, 'App\\Models\\User', 49, 'app_api', '4832dac70734b69c9c6744d0f364b79934e17dac9af3f8ad9ca989872e8e89cc', '[\"*\"]', '2023-12-01 21:12:58', NULL, '2023-12-01 21:12:57', '2023-12-01 21:12:58'),
(190, 'App\\Models\\User', 49, 'app_api', 'bffdcb589b98713dff5d2cc04eb5440e3eb868e82fabc8a31ad999610846e45b', '[\"*\"]', '2023-12-01 22:38:44', NULL, '2023-12-01 21:12:57', '2023-12-01 22:38:44'),
(191, 'App\\Models\\User', 42, 'app_api', '3d64a26714570ef553b7c6d1657ffff2a30914f168c11604bee67dcac698b03c', '[\"*\"]', '2023-12-01 21:16:41', NULL, '2023-12-01 21:16:23', '2023-12-01 21:16:41'),
(192, 'App\\Models\\User', 43, 'app_api', 'a31ca4a7569dd48e9638140f4e7067bcc853d70e1a6fb65ec53a974ac97ed8ce', '[\"*\"]', '2023-12-01 22:41:50', NULL, '2023-12-01 22:40:24', '2023-12-01 22:41:50'),
(193, 'App\\Models\\User', 51, 'app_api', 'd93c88f3285b70167124ad1cf2774f98731dc31645aaac4231d8626db27f57e7', '[\"*\"]', '2023-12-01 22:45:28', NULL, '2023-12-01 22:44:22', '2023-12-01 22:45:28'),
(194, 'App\\Models\\User', 52, 'app_api', 'be871023449dc6de960a1b0fffa13a0fb6f61efce6de5e2c3e9aa86039855d5c', '[\"*\"]', '2023-12-01 22:50:16', NULL, '2023-12-01 22:49:15', '2023-12-01 22:50:16'),
(195, 'App\\Models\\User', 53, 'app_api', '66ff5b86c48ae2ce14411fe7d5f2d476d2a829087a342a43dc63c42e15077c21', '[\"*\"]', '2023-12-01 22:58:13', NULL, '2023-12-01 22:52:05', '2023-12-01 22:58:13'),
(196, 'App\\Models\\User', 52, 'app_api', '29553b230d1ed66e91841fea204ef1da6076f7053967ba86bcff7bca20d35190', '[\"*\"]', '2023-12-01 22:59:34', NULL, '2023-12-01 22:58:31', '2023-12-01 22:59:34'),
(197, 'App\\Models\\User', 54, 'app_api', '94febdc462abd61bda63a328af49c34ee40b0a0e5000216f75a44c63c91df717', '[\"*\"]', '2023-12-01 23:01:14', NULL, '2023-12-01 23:00:42', '2023-12-01 23:01:14'),
(198, 'App\\Models\\User', 54, 'app_api', 'e028b7627c7163fca5e8487f8bd3a1b3e52f97ebdb162d82299fb02b47beb1a2', '[\"*\"]', '2023-12-01 23:03:36', NULL, '2023-12-01 23:02:45', '2023-12-01 23:03:36'),
(199, 'App\\Models\\User', 53, 'app_api', 'e9dfcab786325a60bffa531d47bb2c110334aca7ca92825709a4650898e4a29c', '[\"*\"]', '2023-12-01 23:09:35', NULL, '2023-12-01 23:04:21', '2023-12-01 23:09:35'),
(200, 'App\\Models\\User', 52, 'app_api', '08a372022bcf9dc5ebf0725d7ec59fa8cae1e9280276fe77000d06b89be2bfbc', '[\"*\"]', '2023-12-01 23:10:06', NULL, '2023-12-01 23:09:55', '2023-12-01 23:10:06'),
(201, 'App\\Models\\User', 54, 'app_api', '92072f8c677779b7460b467d21d1178c390429d6532daa09a2780ccf681f7769', '[\"*\"]', '2023-12-01 23:10:18', NULL, '2023-12-01 23:10:14', '2023-12-01 23:10:18'),
(202, 'App\\Models\\User', 54, 'app_api', '0b2f8b6e9ffb6cf389f2080f80e06900b80954b74582a30290896806a7be75b0', '[\"*\"]', '2023-12-01 23:11:50', NULL, '2023-12-01 23:10:43', '2023-12-01 23:11:50'),
(203, 'App\\Models\\User', 42, 'app_api', '7b87f1fedd1b67bce4607dd2c85daeaceed14a3e8e0463aa93b8fe36dd72daf1', '[\"*\"]', '2024-01-13 23:13:54', NULL, '2023-12-01 23:12:38', '2024-01-13 23:13:54'),
(204, 'App\\Models\\User', 34, 'app_api', '468f21222b6b75f80e6b6a9be91df42827581cbfedb7ee9def6296a7a032cb2d', '[\"*\"]', '2023-12-28 04:33:00', NULL, '2023-12-27 23:01:08', '2023-12-28 04:33:00'),
(205, 'App\\Models\\User', 49, 'app_api', 'c4b2cc10bd200ced4978d1e7982c7a1a2257cfac79fce5a0932e3022a318351e', '[\"*\"]', '2023-12-28 06:03:17', NULL, '2023-12-28 04:33:16', '2023-12-28 06:03:17'),
(206, 'App\\Models\\User', 34, 'app_api', '62df14af143f79adbb275e91fc9ea6c3b9837b225cb53020ada5afb6821c12c9', '[\"*\"]', '2024-01-05 01:30:21', NULL, '2023-12-28 06:03:38', '2024-01-05 01:30:21'),
(207, 'App\\Models\\User', 45, 'app_api', '9744fe76eb4b75e094461847757c8281cc0f6ac645d1fa42bd6604eaca81fea8', '[\"*\"]', '2023-12-29 15:36:21', NULL, '2023-12-29 15:26:36', '2023-12-29 15:36:21'),
(208, 'App\\Models\\User', 49, 'app_api', 'f9bf325179ff81c6e91f54f3de8181b9dc4f0a422ec3e2b5e16948911fbe76b1', '[\"*\"]', '2024-01-05 01:37:56', NULL, '2024-01-05 01:31:23', '2024-01-05 01:37:56'),
(209, 'App\\Models\\User', 55, 'app_api', '4292974394df304926e787dec8e4b840f0c636f0a51d4d459e751d50ad18cabd', '[\"*\"]', '2024-01-22 19:43:14', NULL, '2024-01-09 19:17:32', '2024-01-22 19:43:14'),
(210, 'App\\Models\\User', 55, 'app_api', '20b1a6c660780965ada512203856e342f0487a9a560c3b43984d67bc27ae6673', '[\"*\"]', '2024-01-23 13:26:43', NULL, '2024-01-22 18:40:49', '2024-01-23 13:26:43'),
(211, 'App\\Models\\User', 56, 'app_api', '2cbfa14364326a1d161087cac5f01597240c3a3fed47b9e07f9781f0534b212b', '[\"*\"]', '2024-01-23 13:58:08', NULL, '2024-01-22 20:02:16', '2024-01-23 13:58:08'),
(212, 'App\\Models\\User', 56, 'app_api', '4e6347da003773493d04bcc4e9f74892bef60446d53ed4dfe0003e91222a16a1', '[\"*\"]', '2024-01-23 14:14:57', NULL, '2024-01-23 13:50:33', '2024-01-23 14:14:57'),
(213, 'App\\Models\\User', 44, 'app_api', 'e1b68382c3c6390d58ec1f337e60e5fbf206bc1cb6b1930bc5faac3e0509f2df', '[\"*\"]', '2024-01-23 14:07:51', NULL, '2024-01-23 13:58:38', '2024-01-23 14:07:51'),
(214, 'App\\Models\\User', 56, 'app_api', '727e8a29b60448c89ab62153a6a5b45030f79d8de1ac2f75aa4e6bc6350fed15', '[\"*\"]', '2024-01-23 15:12:38', NULL, '2024-01-23 14:08:07', '2024-01-23 15:12:38'),
(215, 'App\\Models\\User', 57, 'app_api', 'c82dbde8a1a3c8739ec4df14f7c0e8ba3b37d4ecc041ced706f7798be51a508f', '[\"*\"]', '2024-01-23 15:39:59', NULL, '2024-01-23 15:31:53', '2024-01-23 15:39:59'),
(216, 'App\\Models\\User', 58, 'app_api', '216b7c0b2f058cf6688d77069bcd15aa2baba38f58df361f3294a499d236d74a', '[\"*\"]', '2024-01-23 15:56:29', NULL, '2024-01-23 15:41:04', '2024-01-23 15:56:29'),
(217, 'App\\Models\\User', 58, 'app_api', '22aed1625f83552ca1f2ec77242c5bda5acf0c4483e96479a79079036864458b', '[\"*\"]', '2024-01-25 18:20:04', NULL, '2024-01-23 15:48:25', '2024-01-25 18:20:04'),
(218, 'App\\Models\\User', 57, 'app_api', 'b556b53f4e355aaaeb819b9857f303d208eaeb2a191e0f677b23294cdb82601f', '[\"*\"]', '2024-01-23 15:57:31', NULL, '2024-01-23 15:56:54', '2024-01-23 15:57:31'),
(219, 'App\\Models\\User', 58, 'app_api', '4f944d6cfd62d0144bd81866312fa404481199d83cea7cb6609ae2eb8f587ba1', '[\"*\"]', '2024-01-23 16:05:54', NULL, '2024-01-23 15:58:03', '2024-01-23 16:05:54'),
(220, 'App\\Models\\User', 57, 'app_api', '47b761fdbecbe7b53b8eedf2ce1c69ac1e4b35f797e8ef77d55b01ee26ef07ce', '[\"*\"]', '2024-01-23 18:39:39', NULL, '2024-01-23 16:06:31', '2024-01-23 18:39:39'),
(221, 'App\\Models\\User', 57, 'app_api', 'f2f171d2bb10700cafc06eb4cd793ad20ed252a271bc05db54931fb9d464b373', '[\"*\"]', '2024-01-24 14:45:20', NULL, '2024-01-24 13:54:27', '2024-01-24 14:45:20'),
(222, 'App\\Models\\User', 58, 'app_api', '9cce529ec775d0ba552721d1df2b4fbcff495c03cf48e8e24ce65520fe2db719', '[\"*\"]', '2024-01-24 14:23:45', NULL, '2024-01-24 14:16:39', '2024-01-24 14:23:45'),
(223, 'App\\Models\\User', 57, 'app_api', 'f1151dfef92111480a64556324f563989bbdf9005aef9e834f20ed983b610dd7', '[\"*\"]', '2024-01-26 12:53:24', NULL, '2024-01-24 14:30:46', '2024-01-26 12:53:24'),
(224, 'App\\Models\\User', 58, 'app_api', 'eb9be3c3f027aad44494a820b5f979c35fafcdbe2750a89dd44c4fd48549cafe', '[\"*\"]', '2024-01-24 14:53:07', NULL, '2024-01-24 14:52:52', '2024-01-24 14:53:07'),
(225, 'App\\Models\\User', 58, 'app_api', 'f6fb26877cc7ccc93025fcbeb203a11c0bbd629a6dabd827dcff5c4173c0a518', '[\"*\"]', '2024-01-24 17:34:39', NULL, '2024-01-24 17:10:00', '2024-01-24 17:34:39'),
(226, 'App\\Models\\User', 58, 'app_api', '7be06193f666d60ea6039148bb65f85026cd2b3cc133c4e7dcd16b3a60d15427', '[\"*\"]', '2024-01-24 18:26:07', NULL, '2024-01-24 17:41:43', '2024-01-24 18:26:07'),
(227, 'App\\Models\\User', 58, 'app_api', 'ed0f39fa89dcbdff73432a621da3999af3dc179a147f9334ca3f49eb9a9458dc', '[\"*\"]', '2024-01-29 12:33:23', NULL, '2024-01-25 18:04:22', '2024-01-29 12:33:23'),
(228, 'App\\Models\\User', 57, 'app_api', '19dd721a2dbadb460fbfa6620b43beb027c91259928e9bd782e19e5c5af2f7af', '[\"*\"]', '2024-01-25 18:29:42', NULL, '2024-01-25 18:20:32', '2024-01-25 18:29:42'),
(229, 'App\\Models\\User', 58, 'app_api', '8b2b3bb3fffce8d30c9de27c0fce50ebe96b87b1aa5b92b2f43c75a95c8ee2aa', '[\"*\"]', '2024-01-25 18:31:49', NULL, '2024-01-25 18:30:45', '2024-01-25 18:31:49'),
(230, 'App\\Models\\User', 57, 'app_api', '07b902c40f8fa44e3bb6346dc5104a9e759af007d56fdf52915f9ed2c6e9fd6c', '[\"*\"]', '2024-01-26 14:02:11', NULL, '2024-01-25 18:32:16', '2024-01-26 14:02:11'),
(231, 'App\\Models\\User', 57, 'app_api', 'fd0b6dd8b55e42481180ff5692ef6c96f6d8c26de160fe85ec343125a8e5b46e', '[\"*\"]', NULL, NULL, '2024-01-25 19:14:53', '2024-01-25 19:14:53'),
(232, 'App\\Models\\User', 57, 'app_api', '8579842c1afbe4e2dcc435768d5e95a12841025c2e77998967c6b54cd1869f23', '[\"*\"]', NULL, NULL, '2024-01-25 19:16:53', '2024-01-25 19:16:53'),
(233, 'App\\Models\\User', 58, 'app_api', '7367f456f3293cc35f5bb9dd90646a03ccf125e45833e5f5dc1b436586401bc7', '[\"*\"]', '2024-01-25 20:57:23', NULL, '2024-01-25 19:34:48', '2024-01-25 20:57:23'),
(234, 'App\\Models\\User', 57, 'app_api', 'a9c013ddf4ae60a4c82dd93762cff5d075000961139b04c34fc2993579e93c69', '[\"*\"]', '2024-01-31 17:06:34', NULL, '2024-01-25 20:57:58', '2024-01-31 17:06:34'),
(235, 'App\\Models\\User', 58, 'app_api', '5c7bca9366131284ec1b194aabed001f341febfbd2afb4b6726e9d064e33c6c1', '[\"*\"]', '2024-01-26 12:54:21', NULL, '2024-01-26 12:54:20', '2024-01-26 12:54:21'),
(236, 'App\\Models\\User', 58, 'app_api', '8c187941aa675840997768a85d8a596f6a013cc993e95bb77be277fb71356641', '[\"*\"]', '2024-01-26 14:03:02', NULL, '2024-01-26 12:54:20', '2024-01-26 14:03:02'),
(237, 'App\\Models\\User', 58, 'app_api', '5dc65687fb14c949df9112bac16eae4f5799ad4a43d4bc4643d5bc7fd44fb806', '[\"*\"]', '2024-01-26 14:38:54', NULL, '2024-01-26 14:02:55', '2024-01-26 14:38:54'),
(238, 'App\\Models\\User', 57, 'app_api', '80d2d2adc3691b15736fdc6d2e22e99e9f04f1762bb14d1ca9821b3bca6b45d9', '[\"*\"]', '2024-01-26 14:13:17', NULL, '2024-01-26 14:03:39', '2024-01-26 14:13:17'),
(239, 'App\\Models\\User', 58, 'app_api', '2ab5c1ed587aaac4543e49eac565f3146ad34a53cd3cd14af0da4addcd00e647', '[\"*\"]', '2024-01-26 15:35:37', NULL, '2024-01-26 14:40:41', '2024-01-26 15:35:37'),
(240, 'App\\Models\\User', 57, 'app_api', '8ccf9dbcad2854cab1339ef1daa90628a12e4a379cb42d3495e359c7ed56a6b4', '[\"*\"]', '2024-01-26 19:22:50', NULL, '2024-01-26 14:44:08', '2024-01-26 19:22:50'),
(241, 'App\\Models\\User', 57, 'app_api', '59d3b43770b6858b895701e724e7e96c07938f87ffa3913ef388b6101f5307f9', '[\"*\"]', '2024-01-26 16:39:30', NULL, '2024-01-26 15:36:00', '2024-01-26 16:39:30'),
(242, 'App\\Models\\User', 58, 'app_api', '0afb0f4184b102dd3a44fd1b8e0f7fd23c4c2cca7ebea13694c1f055eadcdac2', '[\"*\"]', '2024-01-26 18:52:52', NULL, '2024-01-26 16:40:35', '2024-01-26 18:52:52'),
(243, 'App\\Models\\User', 57, 'app_api', 'e3e5d58b2f394f034b4c33bd1620f7c940e9d9b8f38b78d6ab30f4cd3ff22338', '[\"*\"]', '2024-01-26 18:53:11', NULL, '2024-01-26 18:53:09', '2024-01-26 18:53:11'),
(244, 'App\\Models\\User', 57, 'app_api', 'f1c6cfed061688f8956faaaf4a69d22f06348408d23c36e5e18d6506cb687a43', '[\"*\"]', '2024-01-26 20:19:26', NULL, '2024-01-26 18:53:09', '2024-01-26 20:19:26'),
(245, 'App\\Models\\User', 58, 'app_api', '5318cd525004da3445a5e3ebdbfdfd191ad061b732d3bd94bc2bcc655b93c6e7', '[\"*\"]', '2024-01-26 21:03:09', NULL, '2024-01-26 20:21:44', '2024-01-26 21:03:09'),
(246, 'App\\Models\\User', 57, 'app_api', 'd928051b0e5a210a25a697a817642fb1e87b7a4170361ea97c6a72d56e9d59f3', '[\"*\"]', '2024-01-29 13:26:51', NULL, '2024-01-26 21:03:38', '2024-01-29 13:26:51'),
(247, 'App\\Models\\User', 58, 'app_api', '862deabcbb0557ab40e1382a521e5c713e122fcc5a6b11a80329225920425395', '[\"*\"]', '2024-01-29 13:44:43', NULL, '2024-01-29 13:43:12', '2024-01-29 13:44:43'),
(248, 'App\\Models\\User', 57, 'app_api', '223829cc74c6d05116709b36bbe2e22430494cdff3616ff782c11eefe407d5f8', '[\"*\"]', '2024-01-29 14:05:30', NULL, '2024-01-29 13:45:10', '2024-01-29 14:05:30'),
(249, 'App\\Models\\User', 58, 'app_api', 'eca923224f27a623000f4c888475a04be29862e36af138ab07d1972940677d64', '[\"*\"]', '2024-01-29 14:08:28', NULL, '2024-01-29 14:08:25', '2024-01-29 14:08:28'),
(250, 'App\\Models\\User', 58, 'app_api', 'c2e2cdf64ee322cb761920d8fe9e7b512f0d19de40ce1503747c9dd8e40ccafb', '[\"*\"]', '2024-01-29 18:39:41', NULL, '2024-01-29 14:08:25', '2024-01-29 18:39:41'),
(251, 'App\\Models\\User', 57, 'app_api', 'fb9ddc75c2740cf09420eae28106e53427930dd1222e61b1027f53d42b3a7747', '[\"*\"]', '2024-01-29 18:41:33', NULL, '2024-01-29 18:40:02', '2024-01-29 18:41:33'),
(252, 'App\\Models\\User', 58, 'app_api', '909eade4b0506a6c1052718a0d6e0300eef5d24f4904c820ccc724cf23110f99', '[\"*\"]', '2024-01-29 18:42:03', NULL, '2024-01-29 18:41:52', '2024-01-29 18:42:03'),
(253, 'App\\Models\\User', 57, 'app_api', '2c5a72549d8c7b3f0c5d65af207037363ea16661bb1c6218f4cb3ced8d543c49', '[\"*\"]', '2024-01-29 18:42:48', NULL, '2024-01-29 18:42:37', '2024-01-29 18:42:48'),
(254, 'App\\Models\\User', 58, 'app_api', '51fb2dcc06a849747720fdb2850d509540f676ea66202f79f6cdfb7c4952bd70', '[\"*\"]', '2024-01-29 19:30:34', NULL, '2024-01-29 19:28:57', '2024-01-29 19:30:34'),
(255, 'App\\Models\\User', 57, 'app_api', 'f55b13b4b9037eadf8ec3fbc1dd995058c1212ba6f96c0397276560e8af66c5e', '[\"*\"]', '2024-01-29 19:36:58', NULL, '2024-01-29 19:30:56', '2024-01-29 19:36:58'),
(256, 'App\\Models\\User', 58, 'app_api', 'ec3d1961fbfa7ca6cd3927fc28adc22f16c2654cbe18794d33a947a37e259596', '[\"*\"]', '2024-01-29 19:58:22', NULL, '2024-01-29 19:38:27', '2024-01-29 19:58:22');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(257, 'App\\Models\\User', 58, 'app_api', '7d2d2544af9c3e7e84da0d52706bfe03bbb2bc9758f9da5bfebbd6611f8fbd90', '[\"*\"]', '2024-01-29 20:20:44', NULL, '2024-01-29 20:00:00', '2024-01-29 20:20:44'),
(258, 'App\\Models\\User', 57, 'app_api', 'ea3733e8f4c8b75588cb68b385250655a17e01aaa447324a5bccb943a8acddc8', '[\"*\"]', '2024-01-29 20:21:55', NULL, '2024-01-29 20:21:15', '2024-01-29 20:21:55'),
(259, 'App\\Models\\User', 58, 'app_api', '6fce42429175acbabccab8dac5d1842f0d22209d0449ad2a31605643ce92098f', '[\"*\"]', '2024-01-29 20:22:26', NULL, '2024-01-29 20:22:24', '2024-01-29 20:22:26'),
(260, 'App\\Models\\User', 58, 'app_api', '2001302635bfa0bdcc8692c849ed9205bae17c4155ff1a19981c1fdfa2da66d8', '[\"*\"]', '2024-01-30 12:49:29', NULL, '2024-01-29 20:22:25', '2024-01-30 12:49:29'),
(261, 'App\\Models\\User', 57, 'app_api', '983f9d08a2b6f6cc1c9dde2c43c6b5117ff75bd4ba904e89173cddae24abdbf9', '[\"*\"]', '2024-01-30 13:31:20', NULL, '2024-01-30 12:50:28', '2024-01-30 13:31:20'),
(262, 'App\\Models\\User', 58, 'app_api', '4bba546afa48b802a398494ccdd6b9f79ddc6145234a50813d1a423d65ede1ae', '[\"*\"]', '2024-01-30 15:06:39', NULL, '2024-01-30 15:01:55', '2024-01-30 15:06:39'),
(263, 'App\\Models\\User', 57, 'app_api', '243531fbfc798805927f896659e75aa7a9c7eb4d4a4c6c20d9dbf308c2dc18f9', '[\"*\"]', '2024-01-30 15:07:20', NULL, '2024-01-30 15:06:57', '2024-01-30 15:07:20'),
(264, 'App\\Models\\User', 58, 'app_api', 'ba198baf692dd0b07f19689c0267671ecdfde4634536fa4e79ab2d709194ab50', '[\"*\"]', '2024-01-30 20:36:25', NULL, '2024-01-30 15:11:08', '2024-01-30 20:36:25'),
(265, 'App\\Models\\User', 57, 'app_api', '509f657ca4277b9a5f880a5a3643285b7e318bb688c8c2794c665d3843ea076a', '[\"*\"]', '2024-01-30 20:42:06', NULL, '2024-01-30 20:38:50', '2024-01-30 20:42:06'),
(266, 'App\\Models\\User', 58, 'app_api', '02ecd5e59bc1d8f53dfc75b986035a21a1c472a6611ca0a110f1b85886604412', '[\"*\"]', '2024-01-30 20:45:23', NULL, '2024-01-30 20:44:53', '2024-01-30 20:45:23'),
(267, 'App\\Models\\User', 57, 'app_api', '69edf9f92d8b27d1352a2490a885bd9504475853e4db20d5649fbe4cf3a77f34', '[\"*\"]', '2024-01-31 12:50:04', NULL, '2024-01-30 20:47:44', '2024-01-31 12:50:04'),
(268, 'App\\Models\\User', 58, 'app_api', 'c9c3b311c7de86a29f60ce4ff5917a31e70021cbb6d50b2d5f84aba49f6724a0', '[\"*\"]', '2024-01-31 15:06:08', NULL, '2024-01-31 12:51:04', '2024-01-31 15:06:08'),
(269, 'App\\Models\\User', 57, 'app_api', '1ae449c5d2889fe315041f2cedcab13595ebb496b8f32fee845673e55271d97a', '[\"*\"]', '2024-01-31 15:38:58', NULL, '2024-01-31 15:20:54', '2024-01-31 15:38:58'),
(270, 'App\\Models\\User', 58, 'app_api', 'd1251b99cf30c3a09ddd77e4f11f2118007174589f7bef4ddcaf546b78cfdc52', '[\"*\"]', '2024-01-31 16:15:09', NULL, '2024-01-31 15:39:52', '2024-01-31 16:15:09'),
(271, 'App\\Models\\User', 57, 'app_api', '2e888dfad1da69077d113c2cd7129f9e5dc6523055fefa9fcdeeee43c999bd6c', '[\"*\"]', '2024-01-31 16:15:39', NULL, '2024-01-31 16:15:35', '2024-01-31 16:15:39'),
(272, 'App\\Models\\User', 57, 'app_api', '8d5fd7875282e6f399e1ee5a433254535975f74170d8e8125bca15e714c6ae8f', '[\"*\"]', '2024-01-31 16:43:02', NULL, '2024-01-31 16:15:36', '2024-01-31 16:43:02'),
(273, 'App\\Models\\User', 58, 'app_api', '9c34f4d06d6067f4315deae34821802ce1a8d14bccf4fa4cb635c56182fbbe69', '[\"*\"]', '2024-01-31 16:49:57', NULL, '2024-01-31 16:46:39', '2024-01-31 16:49:57'),
(274, 'App\\Models\\User', 57, 'app_api', 'b4eb7f4f0693f13c3a3002150727ffe47438df55ddda2a122332cc4c387db22f', '[\"*\"]', '2024-01-31 16:50:26', NULL, '2024-01-31 16:50:24', '2024-01-31 16:50:26'),
(275, 'App\\Models\\User', 57, 'app_api', '366639876eb710eb95c2b6b148062d99e57802d05ed2cec9c24bdcd11b43bcf6', '[\"*\"]', '2024-01-31 16:50:56', NULL, '2024-01-31 16:50:24', '2024-01-31 16:50:56'),
(276, 'App\\Models\\User', 58, 'app_api', '3e74afce2435e3ca8b7e510055c20bc4593b996d88bf8ef63e95425a182f7474', '[\"*\"]', '2024-01-31 16:52:20', NULL, '2024-01-31 16:51:23', '2024-01-31 16:52:20'),
(277, 'App\\Models\\User', 57, 'app_api', 'feca045c91c3483ea50aed523a4eda28eb59fb954f963df09b3432b5858e440c', '[\"*\"]', '2024-01-31 16:57:20', NULL, '2024-01-31 16:53:13', '2024-01-31 16:57:20'),
(278, 'App\\Models\\User', 58, 'app_api', '2be7b2a1cce2619698ee66afa8fc655aa73d39c40b067955bc704490dbba04d5', '[\"*\"]', '2024-02-02 13:00:59', NULL, '2024-01-31 16:57:42', '2024-02-02 13:00:59'),
(279, 'App\\Models\\User', 57, 'app_api', '99992aa8526d76c01bc91ef6a5190ff9c43e98203f976cd245a73dd6d6419a30', '[\"*\"]', '2024-02-02 13:01:57', NULL, '2024-02-02 13:01:17', '2024-02-02 13:01:57'),
(280, 'App\\Models\\User', 58, 'app_api', '8e1875020a01ce7af27be374e3c094cb4fabbd5d40689f68e9d3fc0b2388b0cf', '[\"*\"]', '2024-02-02 13:03:19', NULL, '2024-02-02 13:02:45', '2024-02-02 13:03:19'),
(281, 'App\\Models\\User', 57, 'app_api', 'f308bb1dbac55465563fe8e8182b68ddbd7eea69b80c9182ad43abe5a0638835', '[\"*\"]', '2024-02-02 13:44:41', NULL, '2024-02-02 13:03:45', '2024-02-02 13:44:41'),
(282, 'App\\Models\\User', 58, 'app_api', 'f43c96a3944d6875d3bef6ebe33d92c383c7af6e5c41d0b1460477e63ed82240', '[\"*\"]', '2024-02-02 15:29:08', NULL, '2024-02-02 13:45:05', '2024-02-02 15:29:08'),
(283, 'App\\Models\\User', 57, 'app_api', 'ce46df3c23b7afe92d73f7b8d060e3c9a0e134cc8d0fc4312f5b0c65b5d2fdac', '[\"*\"]', '2024-02-02 15:53:14', NULL, '2024-02-02 15:29:43', '2024-02-02 15:53:14'),
(284, 'App\\Models\\User', 58, 'app_api', 'd0970f8e369d0535822e63692e85ed33133ff88a9e9b34760febba38779bddc8', '[\"*\"]', '2024-02-02 22:45:11', NULL, '2024-02-02 15:59:21', '2024-02-02 22:45:11'),
(285, 'App\\Models\\User', 59, 'app_api', 'a32ff300bd99416d04bfcb64154bf2a2035956c8487669cb639e72e9d6b6dd19', '[\"*\"]', NULL, NULL, '2024-02-05 12:45:40', '2024-02-05 12:45:40'),
(286, 'App\\Models\\User', 60, 'app_api', '15bbabbd8fef71439922b2eb9352fcdc25e68ce4058613c19593aadbc71a1578', '[\"*\"]', NULL, NULL, '2024-02-05 12:47:43', '2024-02-05 12:47:43'),
(287, 'App\\Models\\User', 57, 'app_api', '34c6d4a629c1090b4ce6f270a1d936bb502a405bbfa1789583a00748663a4570', '[\"*\"]', NULL, NULL, '2024-02-06 13:16:47', '2024-02-06 13:16:47'),
(288, 'App\\Models\\User', 59, 'app_api', '349384e10c93ec4787934886bbbf4d16d1e0965c19c37e7269ebd43ccf159c15', '[\"*\"]', NULL, NULL, '2024-02-06 13:17:55', '2024-02-06 13:17:55'),
(289, 'App\\Models\\User', 57, 'app_api', 'eb7fe27d8b45776a5e04cf3ae91b95000a5d97ea361a185ac09a59cbf68a461d', '[\"*\"]', NULL, NULL, '2024-02-06 13:39:29', '2024-02-06 13:39:29'),
(290, 'App\\Models\\User', 58, 'app_api', 'a0abfca057c4e5f2253e332cf60ddc01195304bc1c7f43494e97a565bb03cf87', '[\"*\"]', '2024-02-06 19:04:06', NULL, '2024-02-06 13:42:03', '2024-02-06 19:04:06'),
(291, 'App\\Models\\User', 57, 'app_api', 'bb0ff90ed968bc7a6a72bf7125187bd1aba637e19ba3b168850aef14798800bb', '[\"*\"]', '2024-02-06 19:15:11', NULL, '2024-02-06 19:05:44', '2024-02-06 19:15:11'),
(292, 'App\\Models\\User', 57, 'app_api', '17950b385eb7e3454ee255459fe2c75459661beb06c4deba253083cfaa81df0f', '[\"*\"]', '2024-02-06 19:46:30', NULL, '2024-02-06 19:15:37', '2024-02-06 19:46:30'),
(293, 'App\\Models\\User', 58, 'app_api', '53c67d03e2fcc11ff75c5acf9f5e98d5915e07b6d239ec98512a6885d067bb42', '[\"*\"]', '2024-02-06 21:20:37', NULL, '2024-02-06 20:06:23', '2024-02-06 21:20:37'),
(294, 'App\\Models\\User', 57, 'app_api', 'c85e96d2df1c8458f82c2c81506fd9ec325d1b37fa9d68aadf694c0dda7e1346', '[\"*\"]', '2024-02-06 21:26:25', NULL, '2024-02-06 21:20:52', '2024-02-06 21:26:25'),
(295, 'App\\Models\\User', 58, 'app_api', '72ca636ad840c2642885f0f114a81ecee3f28e3c0fab3c55aeea30ea5077e89c', '[\"*\"]', '2024-02-06 22:27:15', NULL, '2024-02-06 21:27:53', '2024-02-06 22:27:15'),
(296, 'App\\Models\\User', 58, 'app_api', '0a5e879cca5d0e3e7699e506acfe6afc6e882bf18b83bb7c912c4d18c8919caa', '[\"*\"]', '2024-02-07 07:02:55', NULL, '2024-02-07 06:35:32', '2024-02-07 07:02:55'),
(297, 'App\\Models\\User', 57, 'app_api', 'f077821b4648f63d1a99fb7d8be314c2a10403b73ad16e7d6e3a3ad57abca04a', '[\"*\"]', '2024-02-07 13:05:17', NULL, '2024-02-07 07:03:42', '2024-02-07 13:05:17'),
(298, 'App\\Models\\User', 61, 'app_api', 'cd6265a998746215b3ee67caec26268b46c3ad3488bf7dfff201646625438fbe', '[\"*\"]', '2024-02-07 09:58:34', NULL, '2024-02-07 09:56:37', '2024-02-07 09:58:34'),
(299, 'App\\Models\\User', 62, 'app_api', '2904319cd9e57fbe80bd582884403220a03e3c71976470dc95881ddc0266e294', '[\"*\"]', '2024-02-07 10:04:41', NULL, '2024-02-07 09:59:56', '2024-02-07 10:04:41'),
(300, 'App\\Models\\User', 58, 'app_api', 'b3dc25ab06f57a045b3df9c40a400178c513fa96e1d370fef1cf3660c6a88609', '[\"*\"]', '2024-02-07 12:27:46', NULL, '2024-02-07 10:11:16', '2024-02-07 12:27:46'),
(301, 'App\\Models\\User', 63, 'app_api', '30b6024c155deb92091c0d4c475da1b8fc93746caa06d59ce2f66fba0db8e451', '[\"*\"]', '2024-02-07 13:05:32', NULL, '2024-02-07 12:30:38', '2024-02-07 13:05:32'),
(302, 'App\\Models\\User', 64, 'app_api', '2237e59f72aa2b7dc2d270057aceb4cb0f08839ead424f318e8b16a8ca07e1c3', '[\"*\"]', '2024-02-07 13:13:03', NULL, '2024-02-07 13:06:50', '2024-02-07 13:13:03'),
(303, 'App\\Models\\User', 64, 'app_api', 'bcdfaa1244861c91215b41a32f59ccac1b13a1d8e20f0b7225e77ce97a29ac0b', '[\"*\"]', '2024-02-07 13:17:19', NULL, '2024-02-07 13:14:34', '2024-02-07 13:17:19'),
(304, 'App\\Models\\User', 64, 'app_api', '5f317a118d7bb7e4c97848884ebaffc26aedcb4ae3d4acdd1d234545199463e2', '[\"*\"]', '2024-02-07 13:19:46', NULL, '2024-02-07 13:19:25', '2024-02-07 13:19:46'),
(305, 'App\\Models\\User', 64, 'app_api', 'f3facb32b42ad942912b53988804b9b116be89ddaafbf063e058a588ee05521d', '[\"*\"]', '2024-02-07 13:23:03', NULL, '2024-02-07 13:20:10', '2024-02-07 13:23:03'),
(306, 'App\\Models\\User', 64, 'app_api', '16e670a8aeaaaf5f4f9cfbf30767b8ab5864b5d22aa0b57cae4c2d17abd20458', '[\"*\"]', '2024-02-07 13:29:23', NULL, '2024-02-07 13:23:42', '2024-02-07 13:29:23'),
(307, 'App\\Models\\User', 58, 'app_api', 'aec58162e1dac1d90b219b8593d6b018c63dca061b8087b399e1ada36edc28f9', '[\"*\"]', '2024-02-07 13:33:35', NULL, '2024-02-07 13:29:53', '2024-02-07 13:33:35'),
(308, 'App\\Models\\User', 64, 'app_api', '79e795d40b2cf66bcd1092332c3cc47a4ae69aec2da07ef23639c06a3beeaf40', '[\"*\"]', '2024-02-07 13:34:19', NULL, '2024-02-07 13:33:52', '2024-02-07 13:34:19'),
(309, 'App\\Models\\User', 58, 'app_api', '27135deddc7e7fd076fba3d8a6dfbfad005c29b0e6aaebf94f56ae75a6391f7d', '[\"*\"]', '2024-02-07 14:17:41', NULL, '2024-02-07 13:35:45', '2024-02-07 14:17:41'),
(310, 'App\\Models\\User', 58, 'app_api', '8277393001d9b69e72e8e7c24603e2041554940fba66507444c47e7faa1079fd', '[\"*\"]', '2024-02-07 14:18:59', NULL, '2024-02-07 14:17:55', '2024-02-07 14:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barber_id` int DEFAULT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `member_id`, `barber_id`, `rating`, `description`, `created_at`, `updated_at`) VALUES
(9, '58', 59, '3', 'very nicae keep it up 👍', '2024-01-31 17:47:59', '2024-01-31 17:47:59'),
(10, '58', 57, '5', 'amazing', '2024-01-31 19:53:09', '2024-01-31 19:53:09'),
(11, '58', 57, '4', 'my name is bottle', '2024-02-06 22:12:37', '2024-02-06 22:12:37'),
(12, '58', 143, '3', 'my name is jojo', '2024-02-06 22:23:54', '2024-02-06 22:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(110, '57', 'Gloss', 123, NULL, '2024-01-25 21:55:08', '2024-01-25 21:55:08'),
(111, '57', 'Mens haircut', 400, NULL, '2024-01-25 21:55:08', '2024-01-25 21:55:08'),
(112, '57', 'partial highlight', 856, NULL, '2024-01-25 21:55:09', '2024-01-25 21:55:09'),
(113, '64', 'Blow dry', 20, NULL, '2024-02-07 13:29:23', '2024-02-07 13:29:23'),
(114, '64', 'Blow dry with curling and striaght iron', 30, NULL, '2024-02-07 13:29:23', '2024-02-07 13:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `service_timings`
--

CREATE TABLE `service_timings` (
  `id` bigint UNSIGNED NOT NULL,
  `barber_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_timings`
--

INSERT INTO `service_timings` (`id`, `barber_id`, `time`, `status`, `created_at`, `updated_at`) VALUES
(83, '57', '6:38 PM', 'available', '2024-01-25 21:25:08', '2024-01-25 21:25:08'),
(84, '57', '12:00 AM', 'available', '2024-01-25 21:25:08', '2024-01-25 21:25:08'),
(85, '64', '11:05 PM', 'available', '2024-02-07 13:34:19', '2024-02-07 13:34:19'),
(86, '64', '5:05 PM', 'available', '2024-02-07 13:34:19', '2024-02-07 13:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `user_id`, `job_id`, `name`, `phone`, `email`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(1, '20', NULL, 'mustafa', '0321212121', 'mustafa@gmail.com', 'math', 'byeeeeeeeeeeeeeeeeeeeeeeeeeee', '2023-11-08 06:14:54', '2023-11-08 06:14:54'),
(2, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 07:55:21', '2023-11-08 07:55:21'),
(3, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 07:55:22', '2023-11-08 07:55:22'),
(4, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 07:55:46', '2023-11-08 07:55:46'),
(5, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 07:56:12', '2023-11-08 07:56:12'),
(6, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 07:56:55', '2023-11-08 07:56:55'),
(7, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:02:55', '2023-11-08 09:02:55'),
(8, '21', NULL, 'Alex', '03213469879', 'Alexak@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:03:00', '2023-11-08 09:03:00'),
(9, '21', NULL, 'Alex', '03213469879', 'Alexak888@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:03:27', '2023-11-08 09:03:27'),
(10, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:03:56', '2023-11-08 09:03:56'),
(11, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:07:33', '2023-11-08 09:07:33'),
(12, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:07:35', '2023-11-08 09:07:35'),
(13, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:07:53', '2023-11-08 09:07:53'),
(14, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:08:11', '2023-11-08 09:08:11'),
(15, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:08:15', '2023-11-08 09:08:15'),
(16, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:10:08', '2023-11-08 09:10:08'),
(17, '21', NULL, 'Alex', '03213469879', 'Alexx23@gmail.com', 'HairDry', 'About Testing The usser Worl In The data', '2023-11-08 09:10:36', '2023-11-08 09:10:36'),
(18, '45', NULL, 'name', '12312225558', 'email@gmail.com', 'subject', 'asdkajshdkajdkajdkjahsdkjahsdkj', '2023-12-29 15:33:27', '2023-12-29 15:33:27'),
(19, '58', NULL, 'sdsdas', '5454545555', 'customer1@gmail.com', 'dfdfddfdfd', 'dsfdfdfdfhhd fdifh iodhfoihdfhoihdfiohdhfohdofhoih foi dofiod fo', '2024-02-02 15:18:09', '2024-02-02 15:18:09'),
(20, '57', 144, 'dsds', '342342', 'dasdasdas@gmail.com', '423423a da a', 'r ae ae ae ae as dasd as das das da sd asd as das d as d a asd as as a', '2024-02-07 07:12:16', '2024-02-07 07:12:16'),
(21, '63', NULL, 'f', '4156165', 'd@gmail.com', 'fd', 'sd sef', '2024-02-07 12:42:34', '2024-02-07 12:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `user_id`, `pm_id`, `amount`, `reason`, `type`, `created_at`, `updated_at`) VALUES
(1, '58', 'cus_PUNzS42pN6zxqs', 40, 'Coin Purchase', 'debit', '2024-02-02 21:03:32', '2024-02-02 21:03:32'),
(2, '58', 'cus_PUNzbLa9piYjs1', 40, 'Coin Purchase', 'debit', '2024-02-02 21:03:32', '2024-02-02 21:03:32'),
(3, '58', 'cus_PUNz1zBIAGaxwz', 40, 'Coin Purchase', 'debit', '2024-02-02 21:04:10', '2024-02-02 21:04:10'),
(4, '58', 'cus_PUPcMc4IzXqnx7', 40, 'Coin Purchase', 'debit', '2024-02-02 22:45:13', '2024-02-02 22:45:13'),
(5, '63', 'cus_PWHaBekhTjepVZ', 56, 'Coin Purchase', 'debit', '2024-02-07 12:35:12', '2024-02-07 12:35:12'),
(6, '63', 'cus_PWHbqskVVLiBUa', 56, 'Coin Purchase', 'debit', '2024-02-07 12:36:00', '2024-02-07 12:36:00'),
(7, '63', 'cus_PWHbm7IMmGhkqL', 56, 'Coin Purchase', 'debit', '2024-02-07 12:36:12', '2024-02-07 12:36:12'),
(8, '63', 'cus_PWHcg5Ro29ZA77', 56, 'Coin Purchase', 'debit', '2024-02-07 12:36:23', '2024-02-07 12:36:23'),
(9, '63', 'cus_PWHcw8ULZHTvRZ', 56, 'Coin Purchase', 'debit', '2024-02-07 12:36:40', '2024-02-07 12:36:40'),
(10, '63', 'cus_PWHcK8xTNXH49d', 56, 'Coin Purchase', 'debit', '2024-02-07 12:37:02', '2024-02-07 12:37:02'),
(11, '63', 'cus_PWHeA5pVegc3wz', 20, 'Coin Purchase', 'debit', '2024-02-07 12:39:16', '2024-02-07 12:39:16'),
(12, '63', 'cus_PWHgxnHE50c91w', 40, 'Coin Purchase', 'debit', '2024-02-07 12:40:47', '2024-02-07 12:40:47'),
(13, '64', 'cus_PWIKr3fh8i3QaM', 30, 'Coin Purchase', 'debit', '2024-02-07 13:20:50', '2024-02-07 13:20:50'),
(14, '64', 'cus_PWIMk0xp5MrlIV', 40, 'Coin Purchase', 'debit', '2024-02-07 13:23:05', '2024-02-07 13:23:05'),
(15, '64', 'cus_PWIOZ6yhkjSfLC', 40, 'Coin Purchase', 'debit', '2024-02-07 13:24:33', '2024-02-07 13:24:33'),
(18, '58', NULL, 50, 'for barber booking', 'debit', '2024-02-07 14:02:12', '2024-02-07 14:02:12'),
(19, '58', 'cus_PWJBEgepYkmIet', 40, 'Coin Purchase', 'debit', '2024-02-07 14:13:52', '2024-02-07 14:13:52'),
(20, '58', 'cus_PWJG1WGTWjQxEA', 50, 'Coin Purchase', 'debit', '2024-02-07 14:18:48', '2024-02-07 14:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('customer','barber') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `email_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `featured` int DEFAULT '0',
  `location` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_mode` tinyint(1) DEFAULT '0',
  `holiday_mode` tinyint(1) DEFAULT NULL,
  `rush_service` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_month` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_year` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `photo`, `email_verified_at`, `password`, `role`, `email_code`, `status`, `featured`, `location`, `lat`, `lng`, `travel_mode`, `holiday_mode`, `rush_service`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `exp_month`, `exp_year`, `pm_last_four`, `trial_ends_at`) VALUES
(57, 'bb gdfg', '1g dfgdf', 'barber1@gmail.com', '03211231231', 'http://373d-103-125-71-7.ngrok-free.app/uploads/user/profiles/981da4641c1d4875dc864c7dd0e54ae2PayMefirst.jpg', '2024-01-23 15:31:53', '$2y$10$JFLU//4xHyCw1jejIlkBjeBrgPHb8aom54bU4V.7Xco8R2eBGNdfm', 'barber', NULL, 'active', 0, 'Frankfurt-Flughafen, Frankfurt am Main Süd, Germany', '55.378051', '-3.435973', 0, 0, 1, NULL, '2024-01-23 15:31:53', '2024-02-07 13:05:17', NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'CC', '1', 'customer1@gmail.com', '03213213213', 'https://frank-mombe.ad-wize.com/uploads/user/profiles/9d54826660c770e4e1eca3d837e5ffcbjpg', '2024-01-23 15:41:04', '$2y$10$YrplI8dNPdblHY19vwFH9OE18Vbh.TsHZ2NQ81unKU5ygi.NSvN8e', 'customer', NULL, 'active', 0, NULL, '28.6807496', '77.5218127', NULL, NULL, NULL, NULL, '2024-01-23 15:41:04', '2024-01-23 15:41:04', NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'barber', '1', 'newbarber1@gmail.com', '852147963', 'https://frank-mombe.ad-wize.com/uploads/user/profiles/d03b521d8909bcc6fef9b29eb9189993jpg', '2024-02-05 12:45:40', '$2y$10$bHV79m7CxuQXHHEMWgn5UulTpdrGUF3Nk6DXNTf5eEU1ImlYVkMPG', 'barber', NULL, 'active', 0, NULL, '55.378051', '-3.435973', NULL, NULL, NULL, NULL, '2024-02-05 12:45:40', '2024-02-05 12:45:40', NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'customer', '1', 'newcustomer@gmail.com', '1234567865', 'https://frank-mombe.ad-wize.com/uploads/user/profiles/ed4d1558fdfbf7d5be36dcf418a50042jpg', '2024-02-05 12:47:43', '$2y$10$YDr.D9APQoHGkBKJpz9tJ.LORvlvf8ct1GrsgtMNJ3dP7NYBLfUOm', 'customer', NULL, 'active', 0, NULL, '55.378051', '-3.435973', NULL, NULL, NULL, NULL, '2024-02-05 12:47:43', '2024-02-05 12:47:43', NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'mg', '1', 'mg@gmail.com', '87554564', 'http://373d-103-125-71-7.ngrok-free.app/uploads/user/profiles/7df5e1404fdca93ba09abf530343fc81PayMefirst.jpg', '2024-02-07 09:56:37', '$2y$10$Ge1rttjp05jJetXgZiucLOEsmYITaKvu3dTp0IVKJNCAbFavVZRSi', 'customer', NULL, 'active', 0, 'Ukkadam, Coimbatore, Tamil Nadu, India', '10.9902127', '76.96286580000002', NULL, NULL, NULL, NULL, '2024-02-07 09:56:37', '2024-02-07 09:58:34', NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'new', 'barber', 'barberm@gmail.com', '78675645', 'http://373d-103-125-71-7.ngrok-free.app/uploads/user/profiles/5955337efdef7900bb5fb4cf4a154189PayMefirst.jpg', '2024-02-07 09:59:56', '$2y$10$XPuWbaVYXGKmSV/ayUmKh.7hel960rEdTAtOr0nCI.NW6T7OQZZEm', 'barber', NULL, 'active', 0, 'United Kingdom', '55.378051', '-3.435973', 1, 1, 1, NULL, '2024-02-07 09:59:56', '2024-02-07 10:04:32', NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'test', 'new', 'testnew@gmail.com', '156156', 'http://373d-103-125-71-7.ngrok-free.app/uploads/user/profiles/b6fea1010003b0f9a60494d83a40f322jpg', '2024-02-07 12:30:38', '$2y$10$TQCdGzrtS5riGQBG41A/3.coAVpZJADGo8EgNzQgaeGjEUua7/BIq', 'customer', NULL, 'active', 0, 'HDFC Bank, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh, India', '28.62076', '77.3639292', 0, 0, 0, NULL, '2024-02-07 12:30:38', '2024-02-07 12:30:38', NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'test', 'barber', 'testbarber@gmail.com', '1651651', 'http://373d-103-125-71-7.ngrok-free.app/uploads/user/profiles/e9f4e88db55872b1599d9d139e850d1djpg', '2024-02-07 13:06:50', '$2a$12$IrJ9y5fygZxF4zz/28/WoOoFnNT/4ThKMeGKhs286HdyxwWscuceO', 'barber', NULL, 'active', 0, 'Dubai - United Arab Emirates', '25.2048493', '55.2707828', 1, 0, 1, NULL, '2024-02-07 13:06:50', '2024-02-07 13:22:14', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_temporary_address`
--

CREATE TABLE `user_temporary_address` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `lat` varchar(250) DEFAULT NULL,
  `lng` varchar(250) DEFAULT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_temporary_address`
--

INSERT INTO `user_temporary_address` (`id`, `user_id`, `lat`, `lng`, `name`, `created_at`, `updated_at`) VALUES
(7, 57, '55.378051', '-3.435973', 'Fasdrill, Fawn Trail, Conroe, TX, USA', '2024-02-07 09:14:10', '2024-02-07 09:14:10'),
(11, 62, '55.378051', '-3.435973', 'America', '2024-02-07 10:04:33', '2024-02-07 10:04:33'),
(12, 64, '28.6807496', '77.5218127', 'Dasna, Uttar Pradesh, India', '2024-02-07 13:22:14', '2024-02-07 13:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(2, '58', '90', '2024-02-02 21:03:32', '2024-02-07 14:18:48'),
(3, '63', '396', '2024-02-07 12:30:38', '2024-02-07 12:40:47'),
(4, '64', '110', '2024-02-07 13:06:50', '2024-02-07 13:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint UNSIGNED NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barber_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int DEFAULT NULL,
  `type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `member_id`, `barber_id`, `product_id`, `type`, `created_at`, `updated_at`) VALUES
(29, '58', '62', NULL, 'barber', '2024-02-07 12:25:34', '2024-02-07 12:25:34'),
(30, '58', '64', NULL, 'barber', '2024-02-07 13:31:53', '2024-02-07 13:31:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_infos`
--
ALTER TABLE `admin_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_review`
--
ALTER TABLE `booking_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_history`
--
ALTER TABLE `customer_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  ADD KEY `reset_code_passwords_email_index` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_timings`
--
ALTER TABLE `service_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_temporary_address`
--
ALTER TABLE `user_temporary_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_infos`
--
ALTER TABLE `admin_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `booking_review`
--
ALTER TABLE `booking_review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_history`
--
ALTER TABLE `customer_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `service_timings`
--
ALTER TABLE `service_timings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user_temporary_address`
--
ALTER TABLE `user_temporary_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2026 at 08:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quan_ly_phong_tro`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `condition` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `name`, `address`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Nhà trọ Bình Minh', '45 Lê Lợi, Phường Bến Nghé, Quận 1, TP.HCM', 'Khu trọ an ninh, sạch sẽ, đầy đủ tiện nghi.', '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(2, 'Chung cư Mini Hoa Sen', '123 Cách Mạng Tháng Tám, Quận 3, TP.HCM', 'Khu trọ an ninh, sạch sẽ, đầy đủ tiện nghi.', '2026-03-11 07:09:46', '2026-03-11 07:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `ai_response` text NOT NULL,
  `intent` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `deposit` decimal(15,2) NOT NULL DEFAULT 0.00,
  `room_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','expired','canceled') NOT NULL DEFAULT 'active',
  `content_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `room_id`, `tenant_id`, `start_date`, `end_date`, `deposit`, `room_price`, `status`, `content_pdf`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-11-11', '2026-11-11', 7152334.00, 3576167.00, 'active', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(2, 2, 3, '2025-09-11', '2026-10-11', 7888306.00, 3944153.00, 'active', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(3, 3, 4, '2026-01-11', '2027-01-11', 9756972.00, 4878486.00, 'active', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(4, 4, 5, '2025-12-11', '2026-09-11', 9441870.00, 4720935.00, 'active', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46');

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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` enum('unpaid','paid','partial') NOT NULL DEFAULT 'unpaid',
  `payment_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `contract_id`, `month`, `year`, `total_amount`, `status`, `payment_date`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2026, 3776167.00, 'unpaid', NULL, '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(2, 2, 3, 2026, 4144153.00, 'unpaid', NULL, '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(3, 3, 3, 2026, 5078486.00, 'unpaid', NULL, '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(8, 4, 3, 2026, 5870935.00, 'paid', '2026-03-11 18:47:07', '2026-03-11 11:26:59', '2026-03-11 11:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(15,2) NOT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_id`, `service_id`, `name`, `quantity`, `unit_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Điện', 50, 3500.00, 175000.00, '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(2, 2, 1, 'Điện', 50, 3500.00, 175000.00, '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(3, 3, 1, 'Điện', 50, 3500.00, 175000.00, '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(23, 8, NULL, 'Tiền phòng', 1, 4720935.00, 4720935.00, '2026-03-11 11:26:59', '2026-03-11 11:26:59'),
(24, 8, 1, 'Điện', 150, 3500.00, 525000.00, '2026-03-11 11:26:59', '2026-03-11 11:26:59'),
(25, 8, 2, 'Nước', 15, 15000.00, 225000.00, '2026-03-11 11:26:59', '2026-03-11 11:26:59'),
(26, 8, 3, 'Internet', 1, 100000.00, 100000.00, '2026-03-11 11:26:59', '2026-03-11 11:26:59'),
(27, 8, 4, 'Rác', 2, 50000.00, 100000.00, '2026-03-11 11:26:59', '2026-03-11 11:26:59'),
(28, 8, 5, 'Gửi xe', 2, 100000.00, 200000.00, '2026-03-11 11:26:59', '2026-03-11 11:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_proof` varchar(255) DEFAULT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('pending','fixing','resolved') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `room_id`, `user_id`, `title`, `description`, `image_proof`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Hỏng vòi nước nhà vệ sinh', 'Vòi nước bị rò rỉ liên tục, mong quản lý cho người sửa sớm.', NULL, 'medium', 'fixing', '2026-03-11 07:09:46', '2026-03-11 11:17:13'),
(2, 2, 3, 'Mất kết nối Internet', 'Wifi phòng không vào được từ tối qua.', NULL, 'low', 'fixing', '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(3, 4, 5, 'Hỏng bóng đèn', 'Hỏng bóng đèn nhà tắm!', NULL, 'medium', 'pending', '2026-03-11 11:46:39', '2026-03-11 11:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `meter_readings`
--

CREATE TABLE `meter_readings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `old_value` int(11) NOT NULL,
  `new_value` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `ai_confidence` double(8,2) DEFAULT NULL,
  `read_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meter_readings`
--

INSERT INTO `meter_readings` (`id`, `room_id`, `type`, `old_value`, `new_value`, `image_path`, `ai_confidence`, `read_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'electricity', 0, 138, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(2, 1, 'electricity', 200, 350, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(3, 1, 'water', 0, 12, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(4, 1, 'water', 20, 35, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(5, 2, 'electricity', 0, 154, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(6, 2, 'electricity', 200, 350, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(7, 2, 'water', 0, 20, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(8, 2, 'water', 20, 35, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(9, 3, 'electricity', 0, 102, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(10, 3, 'electricity', 200, 350, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(11, 3, 'water', 0, 10, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(12, 3, 'water', 20, 35, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(13, 4, 'electricity', 0, 118, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(14, 4, 'electricity', 200, 350, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(15, 4, 'water', 0, 14, NULL, NULL, '2026-02-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(16, 4, 'water', 20, 35, NULL, NULL, '2026-03-11', '2026-03-11 07:09:47', '2026-03-11 07:09:47');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_03_11_123120_create_buildings_table', 1),
(6, '2026_03_11_123219_create_rooms_table', 1),
(7, '2026_03_11_123229_create_services_table', 1),
(8, '2026_03_11_123238_create_profiles_table', 1),
(9, '2026_03_11_123248_create_contracts_table', 1),
(10, '2026_03_11_123258_create_assets_table', 1),
(11, '2026_03_11_123307_create_room_members_table', 1),
(12, '2026_03_11_123318_create_meter_readings_table', 1),
(13, '2026_03_11_123328_create_invoices_table', 1),
(14, '2026_03_11_123338_create_invoice_details_table', 1),
(15, '2026_03_11_123347_create_issues_table', 1),
(16, '2026_03_11_123357_create_parking_cards_table', 1),
(17, '2026_03_11_123407_create_notifications_table', 1),
(18, '2026_03_11_123417_create_chat_history_table', 1),
(19, '2026_03_11_183239_create_system_settings_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `content`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 2, 'Thông báo lịch thu tiền phòng', 'Chào bạn, từ tháng tới tiền phòng sẽ được thu vào mùng 5 hàng tháng qua hình thức chuyển khoản.', 1, '2026-03-11 07:09:47', '2026-03-11 10:56:08'),
(2, 3, 'Lời nhắc bảo trì điện', 'Khu trọ sẽ tạm ngắt điện vào 9h sáng chủ nhật tuần này để bảo trì trạm biến áp.', 1, '2026-03-11 07:09:47', '2026-03-11 07:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `parking_cards`
--

CREATE TABLE `parking_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `card_number` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parking_cards`
--

INSERT INTO `parking_cards` (`id`, `user_id`, `license_plate`, `vehicle_type`, `card_number`, `created_at`, `updated_at`) VALUES
(1, 2, '29-K312.71', 'Xe máy', 'PC-7023', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(2, 3, '29-Y678.34', 'Xe máy', 'PC-2318', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(3, 4, '29-R417.72', 'Xe máy', 'PC-8800', '2026-03-11 07:09:47', '2026-03-11 07:09:47'),
(4, 5, '29-R472.38', 'Xe máy', 'PC-2649', '2026-03-11 07:09:47', '2026-03-11 07:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_card_number` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `max_people` int(11) NOT NULL DEFAULT 2,
  `status` enum('empty','rented','maintenance') NOT NULL DEFAULT 'empty',
  `area` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `building_id`, `room_number`, `price`, `max_people`, `status`, `area`, `created_at`, `updated_at`) VALUES
(1, 1, '101', 3576167.00, 2, 'rented', 29.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(2, 1, '102', 3944153.00, 4, 'rented', 28.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(3, 1, '103', 4878486.00, 2, 'rented', 20.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(4, 1, '104', 4720935.00, 4, 'rented', 29.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(5, 1, '105', 4665957.00, 4, 'empty', 33.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(6, 1, '106', 3934254.00, 3, 'empty', 30.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(7, 1, '107', 4973919.00, 2, 'empty', 38.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(8, 1, '108', 3155843.00, 4, 'empty', 26.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(9, 1, '109', 2964465.00, 2, 'empty', 36.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(10, 1, '1010', 4949191.00, 3, 'empty', 37.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(11, 2, '201', 4813415.00, 3, 'empty', 29.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(12, 2, '202', 2998221.00, 4, 'empty', 21.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(13, 2, '203', 2626345.00, 2, 'empty', 37.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(14, 2, '204', 4915559.00, 4, 'empty', 39.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(15, 2, '205', 4184906.00, 3, 'empty', 21.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(16, 2, '206', 4604430.00, 3, 'empty', 28.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(17, 2, '207', 4607684.00, 2, 'empty', 30.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(18, 2, '208', 4141337.00, 2, 'empty', 30.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(19, 2, '209', 4056537.00, 2, 'empty', 22.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(20, 2, '2010', 4529797.00, 2, 'empty', 36.00, '2026-03-11 07:09:46', '2026-03-11 07:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `room_members`
--

CREATE TABLE `room_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_card_number` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `unit_price`, `unit`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Điện', 3500.00, 'kWh', 'Tiền điện tính theo số ký', '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(2, 'Nước', 15000.00, 'm3', 'Tiền nước tính theo khối', '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(3, 'Internet', 100000.00, 'tháng', 'Phí internet cáp quang', '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(4, 'Rác', 50000.00, 'tháng', 'Phí thu gom rác', '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(5, 'Gửi xe', 100000.00, 'xe', 'Gửi xe trong hầm nhà', '2026-03-11 10:42:41', '2026-03-11 11:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'bank_name', 'Vietcombank', '2026-03-11 11:39:16', '2026-03-11 11:39:16'),
(2, 'bank_account_holder', 'NGUYEN VAN A', '2026-03-11 11:39:16', '2026-03-11 11:39:16'),
(3, 'bank_account_number', '0123456789', '2026-03-11 11:39:16', '2026-03-11 11:39:16'),
(4, 'system_name', 'Quản lý Phòng trọ', '2026-03-11 11:39:16', '2026-03-11 11:39:16'),
(5, 'contact_phone', '0987654321', '2026-03-11 11:39:16', '2026-03-11 11:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` enum('admin','tenant') NOT NULL DEFAULT 'tenant',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `avatar`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quản trị viên', 'admin@example.com', NULL, '$2y$10$YX6To8zWmyPJ.8BSIUL3huE1f7k/Ltvy.iukcoI2fx6ItCLyeP7MS', '0988888888', NULL, 'admin', NULL, '2026-03-11 07:09:45', '2026-03-11 07:09:45'),
(2, 'Nguyễn Văn A', 'tenant1@example.com', NULL, '$2y$10$AqxOp5dZ0fmSNmM87tnBouPXi.cVSRFi2QcHN.rKnfp1wux6RhccC', '0912345678', NULL, 'tenant', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(3, 'Trần Thị B', 'tenant2@example.com', NULL, '$2y$10$5EzaFB6WTDcx0KaE460p/OLHeGBsbMahKpmXbpQeS6YvYM4/Yc/vm', '0923456789', NULL, 'tenant', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(4, 'Lê Văn C', 'tenant3@example.com', NULL, '$2y$10$DBr43fKugvA8XoFDR6kftOCI9o0A2lMmL/C0cDGApLUIQBDvSczEi', '0934567890', NULL, 'tenant', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46'),
(5, 'Phạm Minh D', 'tenant4@example.com', NULL, '$2y$10$kweh.nq.B0r.tP5uZWwWAumJNbIpk9p5Y4EiqDlyuwqL4lZAik0Uu', '0945678901', NULL, 'tenant', NULL, '2026-03-11 07:09:46', '2026-03-11 07:09:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_room_id_foreign` (`room_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_history_user_id_foreign` (`user_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contracts_room_id_foreign` (`room_id`),
  ADD KEY `contracts_tenant_id_foreign` (`tenant_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_details_service_id_foreign` (`service_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_room_id_foreign` (`room_id`),
  ADD KEY `issues_user_id_foreign` (`user_id`);

--
-- Indexes for table `meter_readings`
--
ALTER TABLE `meter_readings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meter_readings_room_id_foreign` (`room_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `parking_cards`
--
ALTER TABLE `parking_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parking_cards_card_number_unique` (`card_number`),
  ADD KEY `parking_cards_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profiles_id_card_number_unique` (`id_card_number`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_building_id_foreign` (`building_id`);

--
-- Indexes for table `room_members`
--
ALTER TABLE `room_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_members_room_id_foreign` (`room_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meter_readings`
--
ALTER TABLE `meter_readings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parking_cards`
--
ALTER TABLE `parking_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `room_members`
--
ALTER TABLE `room_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD CONSTRAINT `chat_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_details_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meter_readings`
--
ALTER TABLE `meter_readings`
  ADD CONSTRAINT `meter_readings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parking_cards`
--
ALTER TABLE `parking_cards`
  ADD CONSTRAINT `parking_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_members`
--
ALTER TABLE `room_members`
  ADD CONSTRAINT `room_members_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

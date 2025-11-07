-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2025 at 03:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `name` varchar(300) NOT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `organization_id`, `name`, `mobile_no`, `email`, `address`, `picture`, `is_active`, `create_date`) VALUES
(1, 3, 'Mamter IT Dhaka', '0192726252', '', 'Dhaka', '0.png', 1, 1761839060);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `organization_id`, `name`, `is_active`, `picture`, `create_user`, `create_date`) VALUES
(1, 3, 'RFL', 1, 'aae5fd679d21766f32365d6d32e5b280.png', 17, 1762075761),
(3, 3, 'DAHUA', 1, '0.png', 17, 1762407696),
(4, 3, 'HIKVISION', 1, '0.png', 17, 1762407702),
(6, 3, 'eee', 1, '0.png', 17, 1762441876);

-- --------------------------------------------------------

--
-- Table structure for table `business_partner`
--

CREATE TABLE `business_partner` (
  `organization_id` int(11) DEFAULT NULL,
  `partner_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `partner_type` enum('Customer','Supplier','Both') NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `credit_limit` decimal(15,2) DEFAULT NULL,
  `payment_terms` varchar(50) DEFAULT NULL,
  `sales_representative` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `business_category` varchar(100) DEFAULT NULL,
  `delivery_method` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_date` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_credential`
--

CREATE TABLE `login_credential` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1(active) 0(deactivate)',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `login_credential`
--

INSERT INTO `login_credential` (`id`, `organization_id`, `branch_id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 1, 'system', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2025-11-07 10:41:01', '2024-10-21 15:42:57', '2025-11-07 10:41:01'),
(2, 0, 0, 2, 'litan@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2024-11-27 11:06:55', '2024-10-21 15:42:57', '2025-10-30 14:29:54'),
(5, 0, 0, 6, 'admin@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 2, 1, '2025-11-01 14:35:31', '2024-11-16 23:35:56', '2025-11-01 14:35:31'),
(17, 3, 0, 10, '01829', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 3, 1, '2025-11-07 18:25:11', '2025-10-30 23:30:08', '2025-11-07 18:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1, 'New Record inserted On organizations id 6', 6, NULL, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 06:08:39', '2025-10-30'),
(2, 'Record deleted On organizations id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 09:52:55', '2025-10-30'),
(3, 'Record deleted On organizations id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 09:52:58', '2025-10-30'),
(4, 'Record deleted On organizations id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 09:53:24', '2025-10-30'),
(5, 'Record deleted On organizations id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 09:53:37', '2025-10-30'),
(6, 'Record deleted On organizations id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 09:53:40', '2025-10-30'),
(7, 'New Record inserted On organizations id 7', 7, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 10:03:38', '2025-10-30'),
(8, 'Record deleted On organizations id ', NULL, 1, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 10:14:11', '2025-10-30'),
(9, 'Record deleted On organizations id ', NULL, 1, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 10:14:19', '2025-10-30'),
(10, 'Record deleted On organizations id ', NULL, 1, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 10:17:33', '2025-10-30'),
(11, 'New Record inserted On branch  id 0', 0, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 15:44:21', '2025-10-30'),
(12, 'Record deleted On branch id ', NULL, 1, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 15:56:54', '2025-10-30'),
(13, 'New Record inserted On staff id 10', 10, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 17:30:08', '2025-10-30'),
(14, 'New Record inserted On login_credential id 17', 17, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-30 17:30:08', '2025-10-30'),
(15, 'New Record inserted On menus id 1', 1, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-31 12:40:55', '2025-10-31'),
(16, 'New Record inserted On permissions id 1', 1, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-31 13:28:20', '2025-10-31'),
(17, 'Record deleted On permissions id ', NULL, 1, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-31 13:47:10', '2025-10-31'),
(18, 'Record deleted On permissions id ', NULL, 1, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-31 13:50:08', '2025-10-31'),
(19, 'New Record inserted On menus id 2', 2, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-31 15:12:04', '2025-10-31'),
(20, 'New Record inserted On menus id 3', 3, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-10-31 15:12:20', '2025-10-31'),
(21, 'Record deleted On menus id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-02 03:50:10', '2025-11-02'),
(22, 'Record deleted On menus id ', NULL, 1, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-02 03:51:14', '2025-11-02'),
(23, 'New Record inserted On menus id 4', 4, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-02 03:53:01', '2025-11-02'),
(24, 'New Record inserted On menus id 5', 5, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-02 03:53:30', '2025-11-02'),
(25, 'New Record inserted On menus id 6', 6, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-02 03:54:13', '2025-11-02'),
(26, 'New Record inserted On menus id 7', 7, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-02 03:55:54', '2025-11-02'),
(27, 'New Record inserted On brands id 1', 1, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 09:29:22', '2025-11-02'),
(28, 'Record deleted On brands id 1', 1, 17, 'Update', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:06:52', '2025-11-02'),
(29, 'Record deleted On brands id 1', 1, 17, 'Update', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:07:16', '2025-11-02'),
(30, 'New Record inserted On permissions id 2', 2, 1, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:16:33', '2025-11-02'),
(31, 'Record deleted On permissions id ', NULL, 17, 'Delete', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:25:28', '2025-11-02'),
(32, 'Record deleted On user_permissions id ', NULL, 17, 'Delete', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:25:29', '2025-11-02'),
(33, 'Record deleted On role_permissions id ', NULL, 17, 'Delete', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:25:29', '2025-11-02'),
(34, 'New Record inserted On permissions id 3', 3, 1, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:51:19', '2025-11-02'),
(35, 'New Record inserted On permissions id 4', 4, 1, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:51:39', '2025-11-02'),
(36, 'New Record inserted On permissions id 5', 5, 1, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:51:53', '2025-11-02'),
(37, 'Record deleted On permissions id ', NULL, 1, 'Update', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:52:05', '2025-11-02'),
(38, 'New Record inserted On permissions id 6', 6, 1, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-02 10:52:19', '2025-11-02'),
(39, 'New Record inserted On permissions id 7', 7, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:34:22', '2025-11-03'),
(40, 'New Record inserted On permissions id 8', 8, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:34:47', '2025-11-03'),
(41, 'New Record inserted On permissions id 9', 9, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:35:03', '2025-11-03'),
(42, 'New Record inserted On permissions id 10', 10, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:35:29', '2025-11-03'),
(43, 'New Record inserted On permissions id 11', 11, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:35:44', '2025-11-03'),
(44, 'New Record inserted On brands id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:45:36', '2025-11-03'),
(45, 'New Record inserted On products_groups id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:46:36', '2025-11-03'),
(46, 'Record deleted On products_groups id 1', 1, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:47:42', '2025-11-03'),
(47, 'Record deleted On products_groups id 1', 1, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:47:48', '2025-11-03'),
(48, 'New Record inserted On products_groups id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:47:56', '2025-11-03'),
(49, 'Record deleted On brands id 2', 2, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-03 05:49:17', '2025-11-03'),
(50, 'New Record inserted On products id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 06:07:09', '2025-11-04'),
(51, 'Record deleted On products id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 06:58:02', '2025-11-04'),
(52, 'New Record inserted On products id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 07:03:43', '2025-11-04'),
(53, 'New Record inserted On permissions id 12', 12, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:47:04', '2025-11-04'),
(54, 'New Record inserted On permissions id 13', 13, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:47:18', '2025-11-04'),
(55, 'New Record inserted On permissions id 14', 14, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:47:32', '2025-11-04'),
(56, 'New Record inserted On permissions id 15', 15, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:47:49', '2025-11-04'),
(57, 'New Record inserted On permissions id 16', 16, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:48:00', '2025-11-04'),
(58, 'New Record inserted On menus id 8', 8, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:50:47', '2025-11-04'),
(59, 'New Record inserted On menus id 9', 9, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-04 09:51:30', '2025-11-04'),
(60, 'New Record inserted On menus id 10', 10, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 04:07:12', '2025-11-06'),
(61, 'New Record inserted On menus id 11', 11, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 04:12:20', '2025-11-06'),
(62, 'New Record inserted On products_groups id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:41:15', '2025-11-06'),
(63, 'New Record inserted On products_groups id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:41:22', '2025-11-06'),
(64, 'New Record inserted On products_groups id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:41:27', '2025-11-06'),
(65, 'New Record inserted On brands id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:41:36', '2025-11-06'),
(66, 'New Record inserted On brands id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:41:42', '2025-11-06'),
(67, 'New Record inserted On products id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:44:06', '2025-11-06'),
(68, 'New Record inserted On products id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:44:36', '2025-11-06'),
(69, 'New Record inserted On products id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:45:05', '2025-11-06'),
(70, 'New Record inserted On products id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 05:45:46', '2025-11-06'),
(71, 'New Record inserted On brands id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-06 15:02:31', '2025-11-06'),
(72, 'Record deleted On brands id 5', 5, 17, 'Delete', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-06 15:10:34', '2025-11-06'),
(73, 'New Record inserted On brands id 6', 6, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-06 15:11:16', '2025-11-06');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `icon` varchar(50) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `parent_id`, `position`, `icon`, `is_active`, `create_date`) VALUES
(1, 'Dashboard', 'dashboard', 0, 1, 'fa fa-home', 1, 1761914455),
(4, 'Products', '#', 0, 5, 'fa-solid fa-square-poll-horizontal', 1, 1762055581),
(5, 'Brand', 'products/brands', 4, 6, 'fa fa-angle-double-right', 1, 1762055609),
(6, 'Products', 'products', 4, 3, 'fa fa-angle-double-right', 1, 1762055653),
(7, 'Products groups', 'products/groups', 4, 7, 'fa fa-angle-double-right', 1, 1762055754),
(8, 'Purchase', '#', 0, 7, 'fa-solid fa-cart-arrow-down', 1, 1762249847),
(9, 'Purchase', 'purchase', 8, 4, 'fa fa-angle-double-right', 1, 1762249889),
(10, 'Business Partner', '#', 0, 13, 'fa-regular fa-handshake', 1, 1762402030),
(11, 'Partner List', 'partner', 10, 3, 'fa fa-angle-double-right', 1, 1762402338);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `mobile_no`, `email`, `address`, `picture`, `is_active`, `create_date`) VALUES
(3, 'Master IT ', '0182726353', 'masterit@gmail.com', 'Commila', '0.png', 1, 1761804289),
(7, 'Sonali', '2343443', '', 'ঢাকা', '0.png', 1, 1761818617);

-- --------------------------------------------------------

--
-- Table structure for table `partner_group`
--

CREATE TABLE `partner_group` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `controller`, `method`, `url`, `is_active`, `create_date`) VALUES
(2, 'Brands', 'products/brands', 'read', 'index', 1, 1762078593),
(3, 'Brands', 'products/brands', 'create', 'create', 1, 1762080679),
(4, 'Brands', 'products/brands', 'edit', 'edit', 1, 1762080699),
(5, 'Brands', 'products/brands', 'delete', 'delete', 1, 1762080713),
(6, 'Brands', 'products/brands', 'update', 'update', 1, 1762080739),
(7, 'Products Groups', 'products/groups', 'read', 'index', 1, 1762148060),
(8, 'Products Groups', 'products/groups', 'create', 'create', 1, 1762148086),
(9, 'Products Groups', 'products/groups', 'edit', 'edit', 1, 1762148103),
(10, 'Products Groups', 'products/groups', 'update', 'update', 1, 1762148129),
(11, 'Products Groups', 'products/groups', 'delete', 'delete', 1, 1762148144),
(12, 'Products', 'products', 'read', 'index', 1, 1762249624),
(13, 'Products', 'products', 'create', 'create', 1, 1762249638),
(14, 'Products', 'products', 'edit', 'edit', 1, 1762249652),
(15, 'Products', 'products', 'update', 'update', 1, 1762249669),
(16, 'Products', 'products', 'delete', 'delete', 1, 1762249680);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `tax_method` varchar(50) NOT NULL,
  `product_tax` decimal(10,2) NOT NULL,
  `product_tax_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) NOT NULL,
  `re_order_level` int(11) NOT NULL,
  `is_inventory` int(11) NOT NULL,
  `is_short_bill` int(11) NOT NULL,
  `is_quotation` int(11) NOT NULL,
  `note` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `organization_id`, `name`, `group_id`, `brand_id`, `unit_id`, `serial_type`, `purchase_price`, `tax_method`, `product_tax`, `product_tax_amount`, `total_amount`, `sales_price`, `warrenty`, `warrenty_days`, `re_order_level`, `is_inventory`, `is_short_bill`, `is_quotation`, `note`, `picture`, `is_active`, `create_user`, `create_date`) VALUES
(2, 3, 'DAHUA 2MP CAMERA DH-HAC-HFW1200RP', 2, 1, 10, 'unique', '3.00', 'Inclusive', '0.00', '0.00', '0.00', '0.00', 3, 'Days', 3, 1, 1, 0, 'DAHUA 2MP CAMERA DH-HAC-HFW1200RP', '0.png', 1, 17, 1762239823),
(3, 3, 'DAHUA 2MP CAMERA DH-HAC-HFW1200SP', 3, 3, 1, 'common', '500.00', 'Inclusive', '0.00', '0.00', '0.00', '1000.00', 0, 'Days', 0, 1, 1, 0, 'DAHUA 2MP CAMERA DH-HAC-HFW1200SP', '0.png', 1, 17, 1762407846),
(4, 3, 'DAHUA 2MP CAMERA DH-HAC-HFW1200DP', 3, 3, 1, 'unique', '450.00', 'Inclusive', '0.00', '0.00', '450.00', '700.00', 0, 'Days', 6, 1, 1, 0, 'DAHUA 2MP CAMERA DH-HAC-HFW1200DP', '0.png', 1, 17, 1762407875),
(5, 3, 'DAHUA 2MP IP CAMERA DH-IPC-B1B20P-L', 5, 3, 1, 'unique', '0.00', 'Inclusive', '0.00', '0.00', '0.00', '0.00', 0, 'Days', 0, 1, 1, 0, 'DAHUA 2MP IP CAMERA DH-IPC-B1B20P-L', '0.png', 1, 17, 1762407904),
(6, 3, 'HIKVISION CAMERA 2MP DS-2CE16DOT-IRPF', 4, 4, 3, 'common', '5765.00', 'Inclusive', '0.00', '0.00', '5765.00', '6888.00', 7, 'Days', 0, 0, 1, 0, 'HIKVISION CAMERA 2MP DS-2CE16DOT-IRPF', '0.png', 1, 17, 1762407945);

-- --------------------------------------------------------

--
-- Table structure for table `products_groups`
--

CREATE TABLE `products_groups` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_groups`
--

INSERT INTO `products_groups` (`id`, `organization_id`, `name`, `is_active`, `create_user`, `create_date`) VALUES
(2, 3, 'Pen Drive', 1, 17, 1762148875),
(3, 3, 'CAMERA DAHUA', 1, 17, 1762407675),
(4, 3, 'CAMERA HIKVISION', 1, 17, 1762407681),
(5, 3, 'DAHUA IP CAMERA', 1, 17, 1762407687);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `serial_number` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `invoice_id`, `product_id`, `price`, `qty`, `sub_total`, `serial_number`) VALUES
(14, '777', 2, '3.00', 1, '3.00', ''),
(15, '777', 3, '100.00', 11, '10500.00', ''),
(20, '2147483647', 3, '500.00', 1, '500.00', ''),
(22, '2147483647', 5, '0.00', 1, '0.00', ''),
(23, '2147483647', 5, '0.00', 1, '0.00', ''),
(24, '06112025234504', 5, '0.00', 2, '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_system` int(11) NOT NULL,
  `is_superadmin` int(11) NOT NULL,
  `is_admin_system` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `organization_id`, `branch_id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `is_admin_system`, `create_date`) VALUES
(1, 0, 0, 'system', 'system', 0, 0, 1, 0, 0),
(2, 0, 0, 'Super Admin', 'super_admin', 1, 1, 1, 1, 0),
(3, 0, 0, 'Admin', 'admin', 1, 1, 0, 1, 0),
(4, 0, 0, 'Client', 'client', 1, 1, 0, 1, 0),
(5, 0, 0, 'Manager', 'manager', 1, 1, 0, 1, 0),
(6, 0, 0, 'Accounts', 'accounts', 1, 1, 0, 1, 0),
(7, 0, 0, 'User', 'user', 1, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role_menu`
--

CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`id`, `role_id`, `menu_id`) VALUES
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`) VALUES
(16, 3, 2),
(17, 3, 3),
(18, 3, 4),
(19, 3, 6),
(20, 3, 5),
(21, 3, 7),
(22, 3, 8),
(23, 3, 9),
(24, 3, 10),
(25, 3, 11),
(26, 3, 12),
(27, 3, 13),
(28, 3, 14),
(29, 3, 15),
(30, 3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(300) NOT NULL,
  `short_description` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `facebook` text NOT NULL,
  `twitter` text NOT NULL,
  `linkedin` text NOT NULL,
  `instagram` text NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_icon` varchar(50) NOT NULL,
  `language` varchar(250) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `dateformat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `title`, `name`, `short_description`, `address`, `email`, `phone`, `facebook`, `twitter`, `linkedin`, `instagram`, `youtube`, `logo`, `favicon`, `country`, `currency`, `currency_icon`, `language`, `timezone`, `dateformat`) VALUES
(1, 'Mim Auto Rice Mill', 'M/S Mim Auto Rice Mill', 'asadsds', 'Mostofabad, Mangalpur, Biral Binajpur', 'info@mimautoricemill.com', '01829107469', '', '', '', '', '', '10decd517774f4598f5453b30e4f1842.png', '43c8add3ee4e2fac03dffbfd00eb372b.png', 'BD', 'BD', '৳', 'english', 'Asia/Dhaka', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `designation` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(500) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `work_exp` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `emergency_contact_no` varchar(255) NOT NULL,
  `dob` int(11) NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` int(11) NOT NULL,
  `date_of_leaving` int(11) NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(300) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `account_title` varchar(300) NOT NULL,
  `bank_account_no` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `lang_id` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `staff_type` int(11) NOT NULL,
  `hourly_rate` decimal(8,2) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `resume` varchar(255) NOT NULL,
  `joining_letter` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `organization_id`, `branch_id`, `employee_id`, `department`, `designation`, `ip_address`, `first_name`, `last_name`, `email`, `roles_id`, `qualification`, `work_exp`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `lang_id`, `bank_branch`, `basic_salary`, `staff_type`, `hourly_rate`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `is_active`, `picture`, `create_user`, `create_date`) VALUES
(1, 0, 0, '', 0, 0, '', 'System', '', 'system', 1, '', '', '', '', '', '', 0, '', 0, 0, '', '', '', '', '', '', '', '', '0.00', 0, '0.00', '', '', '', '', '', '', 1, '0.png', 0, 0),
(2, 0, 0, '', 0, 0, '', 'Admin', '', 'litan@gmail.com', 1, '', '', '', '', '', '', 0, '', 0, 0, '', '', '', '', '', '', '', '', '0.00', 0, '0.00', '', '', '', '', '', '', 1, '0.png', 0, 0),
(6, 0, 0, '', 0, 0, '', 'abir', 'r', 'admin@gmail.com', 3, '', '', '3', '33', '33', '33', 1731711600, 'Single', 1731711600, 1731711600, '', '', '', '', '', '', '', '', '0.00', 1, '100.00', '', '', '', '', '', '', 1, '0.png', 0, 1731778556),
(7, 0, 0, '', 0, 0, '', 'Md Kobir ', 'Hasan', 'kobir1@gmail.com', 3, '', '', 'Ibr', '', '0182762', '1123333', 1732230000, '', 1732230000, 1732230000, '', '', '', '', '', '', '', '', '0.00', 1, '100.00', '', '', '', '', '', '', 1, '0.png', 0, 1732250608),
(8, 0, 0, '', 0, 0, '', 'Admin', '', 'superadmin@gmail.com', 1, '', '', '', '', '', '', 0, '', 0, 0, '', '', '', '', '', '', '', '', '0.00', 0, '0.00', '', '', '', '', '', '', 1, '0.png', 0, 0),
(9, 0, 0, '2132332', 0, 0, '', 'Hridoy', 'Sarkar', 'hridoy@gmail.com', 0, '', '', 'Ibrahim', '', '01827262', '01827262', 1732834800, 'Single', 1732834800, 1732834800, '', '', 'Male', '', '', '', '', '', '0.00', 1, '100.00', '', '', '', '', '', '', 1, '0.png', 0, 1732851415),
(10, 3, 0, '', 0, 0, '', 'Master IT', '', '', 2, '', '', '', '', '01829', '', 0, '', 1761845407, 0, '', '', '', '', '', '', '', '', '0.00', 0, '0.00', '', '', '', '', '', '', 1, '0.png', 0, 1761845407);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` varchar(200) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `is_active`, `create_user`, `create_date`) VALUES
(1, 'Piece', 1, '', 0),
(2, 'KG', 1, '', 0),
(3, 'Package', 1, '', 0),
(4, 'Litre', 1, '', 0),
(5, 'Pack', 1, '', 0),
(6, 'Meter', 1, '', 0),
(7, 'Feet', 1, '', 0),
(8, 'Gram', 1, '', 0),
(9, 'CM', 1, '', 0),
(10, 'Box', 1, '', 0),
(11, 'bottel', 1, '', 0),
(12, 'bag', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_partner`
--
ALTER TABLE `business_partner`
  ADD PRIMARY KEY (`partner_id`);

--
-- Indexes for table `login_credential`
--
ALTER TABLE `login_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`url`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_group`
--
ALTER TABLE `partner_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_groups`
--
ALTER TABLE `products_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`menu_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `partner_group`
--
ALTER TABLE `partner_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products_groups`
--
ALTER TABLE `products_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2025 at 11:46 AM
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
-- Database: `smart_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_general_ledger`
--

CREATE TABLE `acc_general_ledger` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `voucher_type` varchar(50) NOT NULL,
  `purchase_invoice_id` int(11) NOT NULL,
  `sales_invoice_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `debit` decimal(15,2) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `gl_date` int(11) NOT NULL,
  `acc_coa_head_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `acc_general_ledger`
--

INSERT INTO `acc_general_ledger` (`id`, `organization_id`, `branch_id`, `voucher_type`, `purchase_invoice_id`, `sales_invoice_id`, `party_id`, `account_name`, `particulars`, `date`, `debit`, `credit`, `gl_date`, `acc_coa_head_id`, `payment_method`, `remarks`, `is_active`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(134, 3, 1, 'Sales', 0, 70, 2, 'Customer Sales', 'Sales for order', '2025-11-05', 6888.00, 0.00, 1762279200, 0, 0, 'Sales order ', 1, 17, 1764584740, 0, 0),
(135, 3, 1, 'Customer Payment', 0, 70, 2, 'Customer Account', 'Payment for order', '2025-11-05', 0.00, 500.00, 1762279200, 0, 1, 'Payment for order ', 1, 17, 1764584740, 0, 0);

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
  `id` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
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
  `customer_group_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `opening_balance_type` varchar(50) NOT NULL,
  `opening_balance` decimal(15,2) NOT NULL,
  `current_balance` decimal(15,2) NOT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_date` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_partner`
--

INSERT INTO `business_partner` (`id`, `organization_id`, `name`, `partner_type`, `contact_no`, `email`, `address`, `credit_limit`, `payment_terms`, `sales_representative`, `region`, `business_category`, `delivery_method`, `notes`, `is_active`, `customer_group_id`, `reference_id`, `opening_balance_type`, `opening_balance`, `current_balance`, `create_user`, `create_date`, `created_at`, `updated_at`) VALUES
(2, 3, 'Cash', 'Both', '0', '', 'Cash', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 10, '', 0.00, -232636.00, 17, 1764140186, '2025-11-26 06:56:26', '2025-12-01 10:25:42'),
(26, 3, 'Mintu', 'Both', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0, 'Supplier', 500.00, -379042.00, 17, 1763532091, '2025-11-19 06:01:31', '2025-11-30 04:01:38'),
(29, 3, 'Litan sarkar', 'Both', '013344444', NULL, 'tangail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '', 0.00, -121400.00, 17, 1764347142, '2025-11-28 16:25:42', '2025-11-30 08:24:26'),
(30, 3, 'Hasan Ali Vai', 'Both', '0192826', NULL, 'Dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '', 0.00, 0.00, 17, 1764581749, '2025-12-01 09:35:49', '2025-12-01 09:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_history`
--

CREATE TABLE `inv_stock_history` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `previous_purchase_price` decimal(16,2) NOT NULL,
  `previous_rebate` decimal(16,2) NOT NULL,
  `previous_sales_price` decimal(16,2) NOT NULL,
  `previous_quanity` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `quanity` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_history`
--

INSERT INTO `inv_stock_history` (`id`, `organization_id`, `branch_id`, `purchase_id`, `store_id`, `product_id`, `previous_purchase_price`, `previous_rebate`, `previous_sales_price`, `previous_quanity`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `is_active`, `create_user`, `create_date`) VALUES
(77, 3, 1, 95, 1, 7, 0.00, 0.00, 0.00, 0, 500.00, 0.00, 900.00, 6, 1, 17, 1764581585),
(78, 3, 1, 95, 1, 6, 0.00, 0.00, 0.00, 0, 5765.00, 0.00, 6888.00, 1, 1, 17, 1764581585),
(79, 3, 1, 96, 1, 6, 5765.00, 0.00, 6888.00, 0, 5765.00, 0.00, 6888.00, 50, 1, 17, 1764584287);

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_item_batch`
--

CREATE TABLE `inv_stock_item_batch` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `quanity` int(11) NOT NULL,
  `is_available` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `batch_number` varchar(100) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_item_batch`
--

INSERT INTO `inv_stock_item_batch` (`id`, `organization_id`, `branch_id`, `purchase_id`, `store_id`, `product_id`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `is_available`, `serial_type`, `batch_number`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(7, 3, 1, 95, 1, 6, 5765.00, 0.00, 6888.00, 0, 1, 'common', '333333', 17, 1764581583, 17, 1764584236),
(8, 3, 1, 96, 1, 6, 5765.00, 0.00, 6888.00, 43, 1, 'common', 'wwww', 17, 1764584286, 17, 1764584743);

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_item_serial`
--

CREATE TABLE `inv_stock_item_serial` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_date` int(11) NOT NULL,
  `purchase_price` decimal(10,0) NOT NULL,
  `rebate` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,0) NOT NULL,
  `quanity` int(11) NOT NULL,
  `is_available` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_item_serial`
--

INSERT INTO `inv_stock_item_serial` (`id`, `organization_id`, `branch_id`, `purchase_id`, `store_id`, `product_id`, `purchase_date`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `is_available`, `serial_type`, `serial`, `warrenty`, `warrenty_days`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(143, 3, 1, 1, 1, 7, 1764525600, 500, 0.00, 900, 1, 0, 'unique', '34434332', 7, 'Days', 17, 1764581583, 0, 0),
(144, 3, 1, 1, 1, 7, 1764525600, 500, 0.00, 900, 1, 0, 'unique', '43344342', 7, 'Days', 17, 1764581583, 0, 0),
(145, 3, 1, 1, 1, 7, 1764525600, 500, 0.00, 900, 1, 0, 'unique', '4rrrr', 7, 'Days', 17, 1764581583, 0, 0),
(146, 3, 1, 1, 1, 7, 1764525600, 500, 0.00, 900, 1, 0, 'unique', '111', 7, 'Days', 17, 1764581583, 0, 0),
(147, 3, 1, 1, 1, 7, 1764525600, 500, 0.00, 900, 1, 0, 'unique', '222', 7, 'Days', 17, 1764581583, 0, 0),
(148, 3, 1, 1, 1, 7, 1764525600, 500, 0.00, 900, 1, 0, 'unique', '3333', 7, 'Days', 17, 1764581583, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_master`
--

CREATE TABLE `inv_stock_master` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `rebate` decimal(10,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `quanity` int(11) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_master`
--

INSERT INTO `inv_stock_master` (`id`, `organization_id`, `branch_id`, `store_id`, `product_id`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `warrenty`, `warrenty_days`, `is_active`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(43, 3, 1, 1, 7, 500.00, 0.00, 900.00, 0, 7, 'Days', 1, 17, 1764581585, 17, 1764584097),
(44, 3, 1, 1, 6, 5765.00, 0.00, 6888.00, 43, 7, 'Days', 1, 17, 1764581585, 17, 1764584743);

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
(1, 0, 0, 1, 'system', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2025-11-29 17:35:12', '2024-10-21 15:42:57', '2025-11-29 17:35:12'),
(2, 0, 0, 2, 'litan@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2024-11-27 11:06:55', '2024-10-21 15:42:57', '2025-10-30 14:29:54'),
(5, 0, 0, 6, 'admin@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 2, 1, '2025-11-01 14:35:31', '2024-11-16 23:35:56', '2025-11-01 14:35:31'),
(17, 3, 1, 10, '01829', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 3, 1, '2025-12-01 14:23:28', '2025-10-30 23:30:08', '2025-12-01 14:23:28');

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
(73, 'New Record inserted On brands id 6', 6, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0', '2025-11-06 15:11:16', '2025-11-06'),
(74, 'New Record inserted On business_partner id 0', 0, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:36:25', '2025-11-08'),
(75, 'New Record inserted On business_partner id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:39:41', '2025-11-08'),
(76, 'New Record inserted On business_partner id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:40:53', '2025-11-08'),
(77, 'New Record inserted On business_partner id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:41:04', '2025-11-08'),
(78, 'New Record inserted On business_partner id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:41:24', '2025-11-08'),
(79, 'New Record inserted On business_partner id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:41:36', '2025-11-08'),
(80, 'New Record inserted On business_partner id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:42:13', '2025-11-08'),
(81, 'New Record inserted On business_partner id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:43:18', '2025-11-08'),
(82, 'New Record inserted On business_partner id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:43:47', '2025-11-08'),
(83, 'New Record inserted On business_partner id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:44:10', '2025-11-08'),
(84, 'New Record inserted On business_partner id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:44:51', '2025-11-08'),
(85, 'New Record inserted On business_partner id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:45:39', '2025-11-08'),
(86, 'New Record inserted On business_partner id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:45:59', '2025-11-08'),
(87, 'New Record inserted On business_partner id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:46:23', '2025-11-08'),
(88, 'New Record inserted On acc_general_ledger id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:46:23', '2025-11-08'),
(89, 'New Record inserted On business_partner id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:46:37', '2025-11-08'),
(90, 'New Record inserted On acc_general_ledger id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:46:37', '2025-11-08'),
(91, 'New Record inserted On business_partner id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:46:58', '2025-11-08'),
(92, 'New Record inserted On acc_general_ledger id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:46:59', '2025-11-08'),
(93, 'New Record inserted On business_partner id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:47:26', '2025-11-08'),
(94, 'New Record inserted On acc_general_ledger id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:47:26', '2025-11-08'),
(95, 'New Record inserted On business_partner id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:48:36', '2025-11-08'),
(96, 'New Record inserted On acc_general_ledger id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:48:37', '2025-11-08'),
(97, 'Record deleted On business_partner id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:57:38', '2025-11-08'),
(98, 'Record deleted On business_partner id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 05:57:42', '2025-11-08'),
(99, 'New Record inserted On business_partner id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 08:44:25', '2025-11-08'),
(100, 'New Record inserted On business_partner id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 08:44:41', '2025-11-08'),
(101, 'New Record inserted On business_partner id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 08:44:50', '2025-11-08'),
(102, 'New Record inserted On business_partner id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 08:45:01', '2025-11-08'),
(103, 'New Record inserted On business_partner id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 08:45:10', '2025-11-08'),
(104, 'New Record inserted On purchase id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:34:58', '2025-11-08'),
(105, 'New Record inserted On purchase id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:40:33', '2025-11-08'),
(106, 'New Record inserted On menus id 12', 12, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:52:10', '2025-11-08'),
(107, 'New Record inserted On menus id 13', 13, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:53:20', '2025-11-08'),
(108, 'New Record inserted On menus id 14', 14, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:54:35', '2025-11-08'),
(109, 'New Record inserted On menus id 15', 15, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:56:55', '2025-11-08'),
(110, 'New Record inserted On menus id 16', 16, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-08 10:57:34', '2025-11-08'),
(111, 'New Record inserted On inv_stock_item_serial id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 09:42:10', '2025-11-11'),
(112, 'New Record inserted On inv_stock_item_serial id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 09:42:10', '2025-11-11'),
(113, 'New Record inserted On inv_stock_item_serial id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 09:42:10', '2025-11-11'),
(114, 'New Record inserted On menus id 17', 17, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 09:56:53', '2025-11-11'),
(115, 'New Record inserted On menus id 18', 18, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:00:49', '2025-11-11'),
(116, 'New Record inserted On menus id 19', 19, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:01:35', '2025-11-11'),
(117, 'New Record inserted On purchase id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:49:57', '2025-11-11'),
(118, 'New Record inserted On inv_stock_item_serial id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:49:58', '2025-11-11'),
(119, 'New Record inserted On inv_stock_item_serial id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:49:58', '2025-11-11'),
(120, 'New Record inserted On inv_stock_item_serial id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:49:58', '2025-11-11'),
(121, 'New Record inserted On inv_stock_item_serial id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:49:58', '2025-11-11'),
(122, 'New Record inserted On inv_stock_item_serial id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-11 10:49:58', '2025-11-11'),
(123, 'New Record inserted On purchase id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:15', '2025-11-13'),
(124, 'New Record inserted On inv_stock_item_serial id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:15', '2025-11-13'),
(125, 'New Record inserted On inv_stock_item_serial id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:16', '2025-11-13'),
(126, 'New Record inserted On inv_stock_item_serial id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:17', '2025-11-13'),
(127, 'New Record inserted On inv_stock_item_serial id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:17', '2025-11-13'),
(128, 'New Record inserted On inv_stock_item_serial id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:17', '2025-11-13'),
(129, 'New Record inserted On inv_stock_item_serial id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:17', '2025-11-13'),
(130, 'New Record inserted On inv_stock_item_serial id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-13 06:29:17', '2025-11-13'),
(131, 'New Record inserted On purchase id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 09:24:40', '2025-11-17'),
(132, 'New Record inserted On purchase id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 09:28:45', '2025-11-17'),
(133, 'New Record inserted On purchase id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 09:51:22', '2025-11-17'),
(134, 'New Record inserted On purchase id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 09:52:35', '2025-11-17'),
(135, 'New Record inserted On inv_stock_item_serial id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 09:52:36', '2025-11-17'),
(136, 'New Record inserted On purchase id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 10:32:42', '2025-11-17'),
(137, 'New Record inserted On inv_stock_item_serial id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 10:32:42', '2025-11-17'),
(138, 'New Record inserted On inv_stock_item_serial id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 10:32:42', '2025-11-17'),
(139, 'New Record inserted On purchase id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 10:33:21', '2025-11-17'),
(140, 'New Record inserted On inv_stock_item_serial id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-17 10:33:22', '2025-11-17'),
(141, 'New Record inserted On purchase id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-18 06:31:04', '2025-11-18'),
(142, 'New Record inserted On acc_general_ledger id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-18 06:31:05', '2025-11-18'),
(143, 'New Record inserted On acc_general_ledger id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-18 06:31:05', '2025-11-18'),
(144, 'New Record inserted On acc_general_ledger id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-18 06:31:05', '2025-11-18'),
(145, 'New Record inserted On inv_stock_item_serial id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-18 06:31:05', '2025-11-18'),
(146, 'New Record inserted On inv_stock_item_serial id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-18 06:31:05', '2025-11-18'),
(147, 'New Record inserted On business_partner id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:46:38', '2025-11-19'),
(148, 'New Record inserted On acc_general_ledger id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:46:38', '2025-11-19'),
(149, 'New Record inserted On business_partner id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:47:50', '2025-11-19'),
(150, 'New Record inserted On acc_general_ledger id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:47:50', '2025-11-19'),
(151, 'New Record inserted On purchase id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:48:33', '2025-11-19'),
(152, 'New Record inserted On purchase id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:48:36', '2025-11-19'),
(153, 'New Record inserted On purchase id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:49:24', '2025-11-19'),
(154, 'New Record inserted On purchase id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:49:42', '2025-11-19'),
(155, 'New Record inserted On purchase id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:54:05', '2025-11-19'),
(156, 'New Record inserted On purchase id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:54:15', '2025-11-19'),
(157, 'New Record inserted On purchase id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:54:24', '2025-11-19'),
(158, 'New Record inserted On purchase id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:54:30', '2025-11-19'),
(159, 'New Record inserted On purchase id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:54:41', '2025-11-19'),
(160, 'New Record inserted On purchase id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:54:48', '2025-11-19'),
(161, 'New Record inserted On purchase id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:55:00', '2025-11-19'),
(162, 'New Record inserted On purchase id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:55:20', '2025-11-19'),
(163, 'New Record inserted On purchase id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:55:25', '2025-11-19'),
(164, 'New Record inserted On purchase id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:56:04', '2025-11-19'),
(165, 'New Record inserted On purchase id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:56:10', '2025-11-19'),
(166, 'New Record inserted On purchase id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:56:20', '2025-11-19'),
(167, 'New Record inserted On purchase id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:56:45', '2025-11-19'),
(168, 'New Record inserted On purchase id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:57:02', '2025-11-19'),
(169, 'New Record inserted On purchase id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:57:15', '2025-11-19'),
(170, 'New Record inserted On purchase id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:57:21', '2025-11-19'),
(171, 'New Record inserted On purchase id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:57:39', '2025-11-19'),
(172, 'New Record inserted On purchase id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:58:12', '2025-11-19'),
(173, 'New Record inserted On purchase id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:58:23', '2025-11-19'),
(174, 'New Record inserted On purchase id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:01', '2025-11-19'),
(175, 'New Record inserted On purchase id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:06', '2025-11-19'),
(176, 'New Record inserted On purchase id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:09', '2025-11-19'),
(177, 'New Record inserted On purchase id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:23', '2025-11-19'),
(178, 'New Record inserted On acc_general_ledger id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:23', '2025-11-19'),
(179, 'New Record inserted On acc_general_ledger id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:24', '2025-11-19'),
(180, 'New Record inserted On inv_stock_item_serial id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 05:59:24', '2025-11-19'),
(181, 'New Record inserted On business_partner id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:01:33', '2025-11-19'),
(182, 'New Record inserted On acc_general_ledger id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:01:33', '2025-11-19'),
(183, 'New Record inserted On purchase id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:01:56', '2025-11-19'),
(184, 'New Record inserted On acc_general_ledger id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:01:56', '2025-11-19'),
(185, 'New Record inserted On acc_general_ledger id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:01:56', '2025-11-19'),
(186, 'New Record inserted On inv_stock_item_serial id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:01:57', '2025-11-19'),
(187, 'New Record inserted On purchase id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:04:18', '2025-11-19'),
(188, 'New Record inserted On acc_general_ledger id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:04:18', '2025-11-19'),
(189, 'New Record inserted On acc_general_ledger id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:04:18', '2025-11-19'),
(190, 'New Record inserted On inv_stock_item_serial id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:04:18', '2025-11-19'),
(191, 'New Record inserted On purchase id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:13', '2025-11-19'),
(192, 'New Record inserted On acc_general_ledger id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:13', '2025-11-19'),
(193, 'New Record inserted On acc_general_ledger id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:14', '2025-11-19'),
(194, 'New Record inserted On inv_stock_item_serial id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:14', '2025-11-19'),
(195, 'New Record inserted On purchase id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:56', '2025-11-19'),
(196, 'New Record inserted On acc_general_ledger id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:56', '2025-11-19'),
(197, 'New Record inserted On acc_general_ledger id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:57', '2025-11-19'),
(198, 'New Record inserted On inv_stock_item_serial id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 06:05:57', '2025-11-19'),
(199, 'New Record inserted On purchase id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:44', '2025-11-19'),
(200, 'New Record inserted On acc_general_ledger id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:44', '2025-11-19'),
(201, 'New Record inserted On acc_general_ledger id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:44', '2025-11-19'),
(202, 'New Record inserted On acc_general_ledger id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:44', '2025-11-19'),
(203, 'New Record inserted On inv_stock_item_serial id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:45', '2025-11-19'),
(204, 'New Record inserted On inv_stock_item_serial id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:45', '2025-11-19'),
(205, 'New Record inserted On inv_stock_item_serial id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 09:49:45', '2025-11-19'),
(206, 'New Record inserted On purchase id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:16:28', '2025-11-19'),
(207, 'New Record inserted On acc_general_ledger id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:16:28', '2025-11-19'),
(208, 'New Record inserted On acc_general_ledger id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:16:28', '2025-11-19'),
(209, 'New Record inserted On inv_stock_item_serial id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:16:29', '2025-11-19'),
(210, 'New Record inserted On purchase id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:06', '2025-11-19'),
(211, 'New Record inserted On acc_general_ledger id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:06', '2025-11-19'),
(212, 'New Record inserted On acc_general_ledger id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:06', '2025-11-19'),
(213, 'New Record inserted On inv_stock_item_serial id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:06', '2025-11-19'),
(214, 'New Record inserted On purchase id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:35', '2025-11-19'),
(215, 'New Record inserted On acc_general_ledger id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:36', '2025-11-19'),
(216, 'New Record inserted On acc_general_ledger id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:36', '2025-11-19'),
(217, 'New Record inserted On inv_stock_item_serial id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:36', '2025-11-19'),
(218, 'New Record inserted On inv_stock_item_serial id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:17:36', '2025-11-19'),
(219, 'New Record inserted On purchase id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:19', '2025-11-19'),
(220, 'New Record inserted On acc_general_ledger id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:19', '2025-11-19'),
(221, 'New Record inserted On acc_general_ledger id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:20', '2025-11-19'),
(222, 'New Record inserted On inv_stock_item_serial id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:20', '2025-11-19'),
(223, 'New Record inserted On inv_stock_item_serial id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:20', '2025-11-19'),
(224, 'New Record inserted On inv_stock_item_serial id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:20', '2025-11-19'),
(225, 'New Record inserted On inv_stock_item_serial id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:43:20', '2025-11-19'),
(226, 'New Record inserted On purchase id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:11', '2025-11-19'),
(227, 'New Record inserted On acc_general_ledger id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:11', '2025-11-19'),
(228, 'New Record inserted On acc_general_ledger id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:11', '2025-11-19'),
(229, 'New Record inserted On inv_stock_item_serial id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:11', '2025-11-19'),
(230, 'New Record inserted On inv_stock_item_serial id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:12', '2025-11-19'),
(231, 'New Record inserted On inv_stock_item_serial id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:12', '2025-11-19'),
(232, 'New Record inserted On inv_stock_item_serial id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:12', '2025-11-19'),
(233, 'New Record inserted On inv_stock_item_serial id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:57:12', '2025-11-19'),
(234, 'New Record inserted On purchase id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:52', '2025-11-19'),
(235, 'New Record inserted On acc_general_ledger id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:52', '2025-11-19'),
(236, 'New Record inserted On acc_general_ledger id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:52', '2025-11-19'),
(237, 'New Record inserted On inv_stock_item_serial id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:53', '2025-11-19'),
(238, 'New Record inserted On inv_stock_item_serial id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:53', '2025-11-19'),
(239, 'New Record inserted On inv_stock_item_serial id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:53', '2025-11-19'),
(240, 'New Record inserted On inv_stock_item_serial id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:53', '2025-11-19'),
(241, 'New Record inserted On inv_stock_item_serial id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:53', '2025-11-19'),
(242, 'New Record inserted On inv_stock_item_serial id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 10:58:53', '2025-11-19'),
(243, 'New Record inserted On purchase id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:01:51', '2025-11-19'),
(244, 'New Record inserted On acc_general_ledger id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:01:52', '2025-11-19'),
(245, 'New Record inserted On acc_general_ledger id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:01:52', '2025-11-19'),
(246, 'New Record inserted On inv_stock_item_serial id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:01:53', '2025-11-19'),
(247, 'New Record inserted On inv_stock_item_serial id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:01:53', '2025-11-19'),
(248, 'New Record inserted On purchase id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:03:02', '2025-11-19'),
(249, 'New Record inserted On acc_general_ledger id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:03:02', '2025-11-19'),
(250, 'New Record inserted On acc_general_ledger id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:03:03', '2025-11-19'),
(251, 'New Record inserted On inv_stock_item_serial id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:03:03', '2025-11-19'),
(252, 'New Record inserted On inv_stock_item_serial id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:03:03', '2025-11-19'),
(253, 'New Record inserted On purchase id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:04:47', '2025-11-19'),
(254, 'New Record inserted On acc_general_ledger id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:04:47', '2025-11-19'),
(255, 'New Record inserted On acc_general_ledger id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:04:48', '2025-11-19'),
(256, 'New Record inserted On purchase id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:04:55', '2025-11-19'),
(257, 'New Record inserted On acc_general_ledger id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:04:55', '2025-11-19'),
(258, 'New Record inserted On acc_general_ledger id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:04:55', '2025-11-19'),
(259, 'New Record inserted On purchase id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:06:11', '2025-11-19'),
(260, 'New Record inserted On acc_general_ledger id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:06:11', '2025-11-19'),
(261, 'New Record inserted On acc_general_ledger id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:06:12', '2025-11-19'),
(262, 'New Record inserted On inv_stock_item_serial id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:06:12', '2025-11-19'),
(263, 'New Record inserted On inv_stock_item_serial id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:06:12', '2025-11-19'),
(264, 'New Record inserted On purchase id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:42', '2025-11-19'),
(265, 'New Record inserted On acc_general_ledger id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:43', '2025-11-19'),
(266, 'New Record inserted On acc_general_ledger id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:43', '2025-11-19'),
(267, 'New Record inserted On inv_stock_item_serial id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:43', '2025-11-19'),
(268, 'New Record inserted On inv_stock_item_serial id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:43', '2025-11-19'),
(269, 'New Record inserted On purchase id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:54', '2025-11-19'),
(270, 'New Record inserted On acc_general_ledger id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:55', '2025-11-19'),
(271, 'New Record inserted On acc_general_ledger id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:55', '2025-11-19'),
(272, 'New Record inserted On inv_stock_item_serial id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:55', '2025-11-19'),
(273, 'New Record inserted On inv_stock_item_serial id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:07:55', '2025-11-19'),
(274, 'New Record inserted On purchase id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:08:10', '2025-11-19'),
(275, 'New Record inserted On acc_general_ledger id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:08:11', '2025-11-19'),
(276, 'New Record inserted On acc_general_ledger id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:08:11', '2025-11-19');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(277, 'New Record inserted On inv_stock_item_serial id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:08:11', '2025-11-19'),
(278, 'New Record inserted On inv_stock_item_serial id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:08:11', '2025-11-19'),
(279, 'New Record inserted On purchase id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:09:22', '2025-11-19'),
(280, 'New Record inserted On acc_general_ledger id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:09:22', '2025-11-19'),
(281, 'New Record inserted On acc_general_ledger id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:09:23', '2025-11-19'),
(282, 'New Record inserted On inv_stock_item_serial id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:09:23', '2025-11-19'),
(283, 'New Record inserted On inv_stock_item_serial id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:09:23', '2025-11-19'),
(284, 'New Record inserted On menus id 20', 20, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:11:16', '2025-11-19'),
(285, 'New Record inserted On menus id 21', 21, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-19 11:11:45', '2025-11-19'),
(286, 'New Record inserted On purchase id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:22:08', '2025-11-22'),
(287, 'New Record inserted On acc_general_ledger id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:22:08', '2025-11-22'),
(288, 'New Record inserted On acc_general_ledger id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:22:08', '2025-11-22'),
(289, 'New Record inserted On inv_stock_item_serial id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:22:08', '2025-11-22'),
(290, 'New Record inserted On inv_stock_item_serial id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:22:08', '2025-11-22'),
(291, 'New Record inserted On inv_stock_item_serial id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:22:09', '2025-11-22'),
(292, 'New Record inserted On purchase id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:24:15', '2025-11-22'),
(293, 'New Record inserted On acc_general_ledger id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:24:16', '2025-11-22'),
(294, 'New Record inserted On acc_general_ledger id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:24:16', '2025-11-22'),
(295, 'New Record inserted On purchase id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:24:32', '2025-11-22'),
(296, 'New Record inserted On acc_general_ledger id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:24:32', '2025-11-22'),
(297, 'New Record inserted On acc_general_ledger id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:24:32', '2025-11-22'),
(298, 'New Record inserted On purchase id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:45', '2025-11-22'),
(299, 'New Record inserted On acc_general_ledger id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:45', '2025-11-22'),
(300, 'New Record inserted On acc_general_ledger id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:45', '2025-11-22'),
(301, 'New Record inserted On inv_stock_item_serial id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:45', '2025-11-22'),
(302, 'New Record inserted On inv_stock_item_serial id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:46', '2025-11-22'),
(303, 'New Record inserted On inv_stock_item_serial id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:46', '2025-11-22'),
(304, 'New Record inserted On inv_stock_item_serial id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:46', '2025-11-22'),
(305, 'New Record inserted On inv_stock_item_serial id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:48', '2025-11-22'),
(306, 'New Record inserted On inv_stock_item_serial id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:49', '2025-11-22'),
(307, 'New Record inserted On inv_stock_item_serial id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:50', '2025-11-22'),
(308, 'New Record inserted On inv_stock_item_serial id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:50', '2025-11-22'),
(309, 'New Record inserted On inv_stock_item_serial id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:50', '2025-11-22'),
(310, 'New Record inserted On inv_stock_item_serial id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:50', '2025-11-22'),
(311, 'New Record inserted On inv_stock_item_serial id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:51', '2025-11-22'),
(312, 'New Record inserted On inv_stock_item_serial id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:51', '2025-11-22'),
(313, 'New Record inserted On inv_stock_item_serial id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:51', '2025-11-22'),
(314, 'New Record inserted On inv_stock_item_serial id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:51', '2025-11-22'),
(315, 'New Record inserted On inv_stock_item_serial id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:51', '2025-11-22'),
(316, 'New Record inserted On inv_stock_item_serial id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:51', '2025-11-22'),
(317, 'New Record inserted On inv_stock_item_serial id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:52', '2025-11-22'),
(318, 'New Record inserted On inv_stock_item_serial id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:52', '2025-11-22'),
(319, 'New Record inserted On inv_stock_item_serial id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:52', '2025-11-22'),
(320, 'New Record inserted On inv_stock_item_serial id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:52', '2025-11-22'),
(321, 'New Record inserted On inv_stock_item_serial id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:53', '2025-11-22'),
(322, 'New Record inserted On inv_stock_item_serial id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:53', '2025-11-22'),
(323, 'New Record inserted On inv_stock_item_serial id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:53', '2025-11-22'),
(324, 'New Record inserted On inv_stock_item_batch id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:44:53', '2025-11-22'),
(325, 'New Record inserted On purchase id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:45:27', '2025-11-22'),
(326, 'New Record inserted On acc_general_ledger id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:45:28', '2025-11-22'),
(327, 'New Record inserted On acc_general_ledger id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:45:28', '2025-11-22'),
(328, 'New Record inserted On inv_stock_item_batch id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 09:45:28', '2025-11-22'),
(329, 'New Record inserted On purchase id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:47', '2025-11-22'),
(330, 'New Record inserted On acc_general_ledger id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:47', '2025-11-22'),
(331, 'New Record inserted On acc_general_ledger id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:48', '2025-11-22'),
(332, 'New Record inserted On acc_general_ledger id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:48', '2025-11-22'),
(333, 'New Record inserted On inv_stock_item_serial id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:48', '2025-11-22'),
(334, 'New Record inserted On inv_stock_item_serial id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:48', '2025-11-22'),
(335, 'New Record inserted On inv_stock_item_serial id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:48', '2025-11-22'),
(336, 'New Record inserted On inv_stock_item_batch id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-22 10:48:48', '2025-11-22'),
(337, 'New Record inserted On menus id 22', 22, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 08:28:40', '2025-11-24'),
(338, 'New Record inserted On menus id 23', 23, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 08:29:14', '2025-11-24'),
(339, 'New Record inserted On menus id 24', 24, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 08:29:31', '2025-11-24'),
(340, 'New Record inserted On purchase id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:41:27', '2025-11-24'),
(341, 'New Record inserted On acc_general_ledger id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:41:28', '2025-11-24'),
(342, 'New Record inserted On acc_general_ledger id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:41:28', '2025-11-24'),
(343, 'New Record inserted On inv_stock_item_batch id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:41:28', '2025-11-24'),
(344, 'New Record inserted On purchase id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:45:33', '2025-11-24'),
(345, 'New Record inserted On acc_general_ledger id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:45:33', '2025-11-24'),
(346, 'New Record inserted On acc_general_ledger id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:45:34', '2025-11-24'),
(347, 'New Record inserted On inv_stock_item_batch id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:45:34', '2025-11-24'),
(348, 'New Record inserted On purchase id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:16', '2025-11-24'),
(349, 'New Record inserted On acc_general_ledger id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:16', '2025-11-24'),
(350, 'New Record inserted On acc_general_ledger id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:16', '2025-11-24'),
(351, 'New Record inserted On inv_stock_item_serial id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:18', '2025-11-24'),
(352, 'New Record inserted On inv_stock_item_serial id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:18', '2025-11-24'),
(353, 'New Record inserted On inv_stock_item_serial id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:18', '2025-11-24'),
(354, 'New Record inserted On inv_stock_item_serial id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:18', '2025-11-24'),
(355, 'New Record inserted On inv_stock_item_serial id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:18', '2025-11-24'),
(356, 'New Record inserted On inv_stock_item_batch id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:19', '2025-11-24'),
(357, 'New Record inserted On inv_stock_item_serial id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:19', '2025-11-24'),
(358, 'New Record inserted On business_partner id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 06:56:26', '2025-11-26'),
(359, 'New Record inserted On purchase id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:01', '2025-11-26'),
(360, 'New Record inserted On acc_general_ledger id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:02', '2025-11-26'),
(361, 'New Record inserted On acc_general_ledger id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:02', '2025-11-26'),
(362, 'New Record inserted On inv_stock_item_serial id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:02', '2025-11-26'),
(363, 'New Record inserted On inv_stock_item_serial id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:02', '2025-11-26'),
(364, 'New Record inserted On inv_stock_item_serial id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:02', '2025-11-26'),
(365, 'New Record inserted On inv_stock_item_batch id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 16:59:02', '2025-11-26'),
(366, 'New Record inserted On purchase id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 18:02:46', '2025-11-27'),
(367, 'New Record inserted On acc_general_ledger id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 18:02:47', '2025-11-27'),
(368, 'New Record inserted On acc_general_ledger id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 18:02:47', '2025-11-27'),
(369, 'New Record inserted On inv_stock_item_serial id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 18:02:47', '2025-11-27'),
(370, 'New Record inserted On inv_stock_item_serial id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-26 18:02:47', '2025-11-27'),
(371, 'New Record inserted On purchase id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:14', '2025-11-27'),
(372, 'New Record inserted On acc_general_ledger id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:15', '2025-11-27'),
(373, 'New Record inserted On acc_general_ledger id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:15', '2025-11-27'),
(374, 'New Record inserted On inv_stock_item_serial id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:15', '2025-11-27'),
(375, 'New Record inserted On inv_stock_item_serial id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:15', '2025-11-27'),
(376, 'New Record inserted On inv_stock_item_serial id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:15', '2025-11-27'),
(377, 'New Record inserted On inv_stock_item_serial id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:28:15', '2025-11-27'),
(378, 'New Record inserted On purchase id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:34:23', '2025-11-27'),
(379, 'New Record inserted On acc_general_ledger id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:34:23', '2025-11-27'),
(380, 'New Record inserted On acc_general_ledger id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:34:23', '2025-11-27'),
(381, 'New Record inserted On inv_stock_item_serial id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:34:23', '2025-11-27'),
(382, 'New Record inserted On purchase id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:46:29', '2025-11-27'),
(383, 'New Record inserted On acc_general_ledger id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:46:29', '2025-11-27'),
(384, 'New Record inserted On acc_general_ledger id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:46:29', '2025-11-27'),
(385, 'New Record inserted On inv_stock_item_batch id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:46:29', '2025-11-27'),
(386, 'New Record inserted On purchase id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:47:31', '2025-11-27'),
(387, 'New Record inserted On acc_general_ledger id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:47:31', '2025-11-27'),
(388, 'New Record inserted On acc_general_ledger id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:47:31', '2025-11-27'),
(389, 'New Record inserted On inv_stock_item_serial id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:47:31', '2025-11-27'),
(390, 'New Record inserted On inv_stock_item_serial id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:47:31', '2025-11-27'),
(391, 'New Record inserted On purchase id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:58:15', '2025-11-27'),
(392, 'New Record inserted On acc_general_ledger id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:58:16', '2025-11-27'),
(393, 'New Record inserted On acc_general_ledger id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:58:16', '2025-11-27'),
(394, 'New Record inserted On inv_stock_item_serial id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:58:16', '2025-11-27'),
(395, 'New Record inserted On inv_stock_item_serial id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 15:58:17', '2025-11-27'),
(396, 'New Record inserted On purchase id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:02:55', '2025-11-27'),
(397, 'New Record inserted On acc_general_ledger id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:02:56', '2025-11-27'),
(398, 'New Record inserted On acc_general_ledger id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:02:56', '2025-11-27'),
(399, 'New Record inserted On inv_stock_item_batch id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:02:56', '2025-11-27'),
(400, 'New Record inserted On inv_stock_item_serial id 112', 112, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:02:56', '2025-11-27'),
(401, 'New Record inserted On purchase id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:04:16', '2025-11-27'),
(402, 'New Record inserted On acc_general_ledger id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:04:17', '2025-11-27'),
(403, 'New Record inserted On acc_general_ledger id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:04:17', '2025-11-27'),
(404, 'New Record inserted On inv_stock_item_serial id 113', 113, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-27 16:04:17', '2025-11-27'),
(405, 'New Record inserted On business_partner id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-28 15:56:02', '2025-11-28'),
(406, 'New Record inserted On sales id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-28 16:06:08', '2025-11-28'),
(407, 'New Record inserted On business_partner id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-28 16:25:42', '2025-11-28'),
(408, 'New Record inserted On sales id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-28 16:25:42', '2025-11-28'),
(409, 'New Record inserted On sales id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:54:30', '2025-11-29'),
(410, 'New Record inserted On sales id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:55:24', '2025-11-29'),
(411, 'New Record inserted On sales id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:56:14', '2025-11-29'),
(412, 'New Record inserted On sales id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:56:33', '2025-11-29'),
(413, 'New Record inserted On sales id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:56:56', '2025-11-29'),
(414, 'New Record inserted On sales id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:57:29', '2025-11-29'),
(415, 'New Record inserted On sales id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:58:08', '2025-11-29'),
(416, 'New Record inserted On sales id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 05:59:31', '2025-11-29'),
(417, 'New Record inserted On sales id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:00:17', '2025-11-29'),
(418, 'New Record inserted On sales id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:00:31', '2025-11-29'),
(419, 'New Record inserted On sales id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:03:54', '2025-11-29'),
(420, 'New Record inserted On sales_items id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:03:54', '2025-11-29'),
(421, 'New Record inserted On sales id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:04:07', '2025-11-29'),
(422, 'New Record inserted On sales_items id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:04:08', '2025-11-29'),
(423, 'New Record inserted On sales id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:05:46', '2025-11-29'),
(424, 'New Record inserted On sales_items id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:05:46', '2025-11-29'),
(425, 'New Record inserted On sales id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:06:22', '2025-11-29'),
(426, 'New Record inserted On sales_items id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:06:22', '2025-11-29'),
(427, 'New Record inserted On sales id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:07:41', '2025-11-29'),
(428, 'New Record inserted On sales_items id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:07:41', '2025-11-29'),
(429, 'New Record inserted On sales_items id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:07:41', '2025-11-29'),
(430, 'New Record inserted On products id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:15:28', '2025-11-29'),
(431, 'New Record inserted On purchase id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:14', '2025-11-29'),
(432, 'New Record inserted On acc_general_ledger id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:15', '2025-11-29'),
(433, 'New Record inserted On acc_general_ledger id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:15', '2025-11-29'),
(434, 'New Record inserted On inv_stock_item_serial id 114', 114, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:15', '2025-11-29'),
(435, 'New Record inserted On inv_stock_item_serial id 115', 115, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:15', '2025-11-29'),
(436, 'New Record inserted On inv_stock_item_serial id 116', 116, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:15', '2025-11-29'),
(437, 'New Record inserted On sales id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:38', '2025-11-29'),
(438, 'New Record inserted On sales_items id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:16:38', '2025-11-29'),
(439, 'New Record inserted On sales id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:41:31', '2025-11-29'),
(440, 'New Record inserted On sales_items id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:41:32', '2025-11-29'),
(441, 'New Record inserted On sales_income_item_serial id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:41:32', '2025-11-29'),
(442, 'New Record inserted On sales id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:59:36', '2025-11-29'),
(443, 'New Record inserted On sales_items id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 06:59:36', '2025-11-29'),
(444, 'New Record inserted On sales id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:00:51', '2025-11-29'),
(445, 'New Record inserted On sales_items id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:00:51', '2025-11-29'),
(446, 'New Record inserted On sales_income_item_serial id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:00:52', '2025-11-29'),
(447, 'New Record inserted On sales_income_item_serial id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:00:52', '2025-11-29'),
(448, 'New Record inserted On sales_items id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:00:52', '2025-11-29'),
(449, 'New Record inserted On sales_income_item_serial id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:00:52', '2025-11-29'),
(450, 'New Record inserted On sales id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:02:17', '2025-11-29'),
(451, 'New Record inserted On sales_items id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:02:17', '2025-11-29'),
(452, 'New Record inserted On sales_income_item_serial id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:02:18', '2025-11-29'),
(453, 'New Record inserted On sales_income_item_serial id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:02:18', '2025-11-29'),
(454, 'New Record inserted On purchase id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:21:10', '2025-11-29'),
(455, 'New Record inserted On acc_general_ledger id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:21:10', '2025-11-29'),
(456, 'New Record inserted On acc_general_ledger id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:21:10', '2025-11-29'),
(457, 'New Record inserted On inv_stock_item_batch id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 07:21:10', '2025-11-29'),
(458, 'New Record inserted On purchase id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:15:41', '2025-11-29'),
(459, 'New Record inserted On acc_general_ledger id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:15:41', '2025-11-29'),
(460, 'New Record inserted On acc_general_ledger id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:15:42', '2025-11-29'),
(461, 'New Record inserted On inv_stock_item_batch id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:15:42', '2025-11-29'),
(462, 'New Record inserted On sales id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:16:31', '2025-11-29'),
(463, 'New Record inserted On sales_items id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:16:32', '2025-11-29'),
(464, 'New Record inserted On sales id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:17:39', '2025-11-29'),
(465, 'New Record inserted On sales_items id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:17:40', '2025-11-29'),
(466, 'New Record inserted On sales id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:18:26', '2025-11-29'),
(467, 'New Record inserted On sales_items id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:18:26', '2025-11-29'),
(468, 'New Record inserted On sales id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:19:28', '2025-11-29'),
(469, 'New Record inserted On sales_items id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:19:28', '2025-11-29'),
(470, 'New Record inserted On sales_item_batch_profit_loss id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:19:28', '2025-11-29'),
(471, 'New Record inserted On purchase id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:20:44', '2025-11-29'),
(472, 'New Record inserted On acc_general_ledger id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:20:44', '2025-11-29'),
(473, 'New Record inserted On acc_general_ledger id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:20:44', '2025-11-29'),
(474, 'New Record inserted On inv_stock_item_batch id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:20:44', '2025-11-29'),
(475, 'New Record inserted On sales id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:21:15', '2025-11-29'),
(476, 'New Record inserted On sales_items id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:21:16', '2025-11-29'),
(477, 'New Record inserted On sales_item_batch_profit_loss id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:21:16', '2025-11-29'),
(478, 'New Record inserted On sales_item_batch_profit_loss id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:21:17', '2025-11-29'),
(479, 'New Record inserted On sales_item_batch_profit_loss id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:21:17', '2025-11-29'),
(480, 'New Record inserted On sales id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:36:04', '2025-11-29'),
(481, 'New Record inserted On sales_items id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:36:05', '2025-11-29'),
(482, 'New Record inserted On sales id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:36:14', '2025-11-29'),
(483, 'New Record inserted On sales_items id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:36:14', '2025-11-29'),
(484, 'New Record inserted On sales id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:38:02', '2025-11-29'),
(485, 'New Record inserted On sales_items id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:38:04', '2025-11-29'),
(486, 'New Record inserted On sales id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:38:36', '2025-11-29'),
(487, 'New Record inserted On sales_items id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:38:36', '2025-11-29'),
(488, 'New Record inserted On sales id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:38:42', '2025-11-29'),
(489, 'New Record inserted On sales_items id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:38:42', '2025-11-29'),
(490, 'New Record inserted On sales id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:39:14', '2025-11-29'),
(491, 'New Record inserted On sales_items id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:39:14', '2025-11-29'),
(492, 'New Record inserted On purchase id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:07', '2025-11-29'),
(493, 'New Record inserted On acc_general_ledger id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:07', '2025-11-29'),
(494, 'New Record inserted On acc_general_ledger id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:07', '2025-11-29'),
(495, 'New Record inserted On inv_stock_item_serial id 117', 117, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:07', '2025-11-29'),
(496, 'New Record inserted On inv_stock_item_serial id 118', 118, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:08', '2025-11-29'),
(497, 'New Record inserted On inv_stock_item_serial id 119', 119, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:08', '2025-11-29'),
(498, 'New Record inserted On inv_stock_item_serial id 120', 120, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:08', '2025-11-29'),
(499, 'New Record inserted On inv_stock_item_serial id 121', 121, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:08', '2025-11-29'),
(500, 'New Record inserted On inv_stock_item_serial id 122', 122, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:42:08', '2025-11-29'),
(501, 'New Record inserted On purchase id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:00', '2025-11-29'),
(502, 'New Record inserted On acc_general_ledger id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:00', '2025-11-29'),
(503, 'New Record inserted On acc_general_ledger id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:01', '2025-11-29'),
(504, 'New Record inserted On inv_stock_item_batch id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:01', '2025-11-29'),
(505, 'New Record inserted On sales id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:14', '2025-11-29'),
(506, 'New Record inserted On sales_items id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:15', '2025-11-29'),
(507, 'New Record inserted On sales_item_batch_profit_loss id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:43:15', '2025-11-29'),
(508, 'New Record inserted On sales id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:44:17', '2025-11-29'),
(509, 'New Record inserted On sales_items id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:44:18', '2025-11-29'),
(510, 'New Record inserted On sales_item_batch_profit_loss id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:44:18', '2025-11-29'),
(511, 'New Record inserted On purchase id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:47:59', '2025-11-29'),
(512, 'New Record inserted On acc_general_ledger id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:47:59', '2025-11-29'),
(513, 'New Record inserted On acc_general_ledger id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:47:59', '2025-11-29'),
(514, 'New Record inserted On inv_stock_item_serial id 123', 123, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:47:59', '2025-11-29'),
(515, 'New Record inserted On inv_stock_item_serial id 124', 124, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:00', '2025-11-29'),
(516, 'New Record inserted On inv_stock_item_serial id 125', 125, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:00', '2025-11-29'),
(517, 'New Record inserted On inv_stock_item_batch id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:00', '2025-11-29'),
(518, 'New Record inserted On purchase id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:26', '2025-11-29'),
(519, 'New Record inserted On acc_general_ledger id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:26', '2025-11-29'),
(520, 'New Record inserted On acc_general_ledger id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:26', '2025-11-29'),
(521, 'New Record inserted On inv_stock_item_batch id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:48:26', '2025-11-29'),
(522, 'New Record inserted On sales id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:50:20', '2025-11-29'),
(523, 'New Record inserted On sales_items id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:50:20', '2025-11-29'),
(524, 'New Record inserted On sales_item_batch_profit_loss id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:50:20', '2025-11-29'),
(525, 'New Record inserted On sales id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:51:21', '2025-11-29'),
(526, 'New Record inserted On sales_items id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:51:21', '2025-11-29'),
(527, 'New Record inserted On sales_item_batch_profit_loss id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:51:21', '2025-11-29'),
(528, 'New Record inserted On sales_item_batch_profit_loss id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:51:21', '2025-11-29'),
(529, 'New Record inserted On sales_items id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:51:23', '2025-11-29'),
(530, 'New Record inserted On sales id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:54:41', '2025-11-29'),
(531, 'New Record inserted On sales_items id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:54:41', '2025-11-29'),
(532, 'New Record inserted On sales id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:55:34', '2025-11-29'),
(533, 'New Record inserted On sales_items id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:55:34', '2025-11-29'),
(534, 'New Record inserted On sales id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:55:41', '2025-11-29'),
(535, 'New Record inserted On sales_items id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:55:41', '2025-11-29'),
(536, 'New Record inserted On sales id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:56:03', '2025-11-29'),
(537, 'New Record inserted On sales_items id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:56:03', '2025-11-29'),
(538, 'New Record inserted On sales_item_batch_profit_loss id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:56:03', '2025-11-29'),
(539, 'New Record inserted On sales id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:56:42', '2025-11-29'),
(540, 'New Record inserted On sales_items id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:56:42', '2025-11-29'),
(541, 'New Record inserted On purchase id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:38', '2025-11-29'),
(542, 'New Record inserted On acc_general_ledger id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:39', '2025-11-29'),
(543, 'New Record inserted On acc_general_ledger id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:39', '2025-11-29'),
(544, 'New Record inserted On inv_stock_item_serial id 126', 126, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:39', '2025-11-29'),
(545, 'New Record inserted On inv_stock_item_serial id 127', 127, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:39', '2025-11-29'),
(546, 'New Record inserted On sales id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:51', '2025-11-29'),
(547, 'New Record inserted On sales_items id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 08:59:52', '2025-11-29'),
(548, 'New Record inserted On sales id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:00:00', '2025-11-29');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(549, 'New Record inserted On sales_items id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:00:00', '2025-11-29'),
(550, 'New Record inserted On sales id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:00:15', '2025-11-29'),
(551, 'New Record inserted On sales_items id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:00:15', '2025-11-29'),
(552, 'New Record inserted On sales id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:01:00', '2025-11-29'),
(553, 'New Record inserted On sales_items id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:01:00', '2025-11-29'),
(554, 'New Record inserted On sales_item_batch_profit_loss id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:01:00', '2025-11-29'),
(555, 'New Record inserted On purchase id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:21:44', '2025-11-29'),
(556, 'New Record inserted On acc_general_ledger id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:21:44', '2025-11-29'),
(557, 'New Record inserted On acc_general_ledger id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:21:45', '2025-11-29'),
(558, 'New Record inserted On inv_stock_item_serial id 128', 128, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:21:45', '2025-11-29'),
(559, 'New Record inserted On inv_stock_item_batch id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:21:45', '2025-11-29'),
(560, 'New Record inserted On purchase id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:22:23', '2025-11-29'),
(561, 'New Record inserted On acc_general_ledger id 112', 112, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:22:24', '2025-11-29'),
(562, 'New Record inserted On acc_general_ledger id 113', 113, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:22:24', '2025-11-29'),
(563, 'New Record inserted On inv_stock_item_serial id 129', 129, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:22:24', '2025-11-29'),
(564, 'New Record inserted On inv_stock_item_batch id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:22:24', '2025-11-29'),
(565, 'New Record inserted On sales id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:23:16', '2025-11-29'),
(566, 'New Record inserted On sales_items id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:23:16', '2025-11-29'),
(567, 'New Record inserted On sales_item_batch_profit_loss id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:23:16', '2025-11-29'),
(568, 'New Record inserted On sales_items id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:23:17', '2025-11-29'),
(569, 'New Record inserted On sales_item_batch_profit_loss id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:23:17', '2025-11-29'),
(570, 'New Record inserted On sales id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:28:16', '2025-11-29'),
(571, 'New Record inserted On sales_items id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:28:16', '2025-11-29'),
(572, 'New Record inserted On sales_item_batch_profit_loss id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:28:16', '2025-11-29'),
(573, 'New Record inserted On sales id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:29:44', '2025-11-29'),
(574, 'New Record inserted On sales_items id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:29:44', '2025-11-29'),
(575, 'New Record inserted On sales_item_batch_profit_loss id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:29:45', '2025-11-29'),
(576, 'New Record inserted On purchase id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:14', '2025-11-29'),
(577, 'New Record inserted On acc_general_ledger id 114', 114, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:14', '2025-11-29'),
(578, 'New Record inserted On acc_general_ledger id 115', 115, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:15', '2025-11-29'),
(579, 'New Record inserted On inv_stock_item_batch id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:15', '2025-11-29'),
(580, 'New Record inserted On sales id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:43', '2025-11-29'),
(581, 'New Record inserted On sales_items id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:43', '2025-11-29'),
(582, 'New Record inserted On sales_item_batch_profit_loss id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:30:44', '2025-11-29'),
(583, 'New Record inserted On sales id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:32:38', '2025-11-29'),
(584, 'New Record inserted On sales_items id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:32:38', '2025-11-29'),
(585, 'New Record inserted On sales_item_batch_profit_loss id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:32:38', '2025-11-29'),
(586, 'New Record inserted On sales id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:02', '2025-11-29'),
(587, 'New Record inserted On sales_items id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:03', '2025-11-29'),
(588, 'New Record inserted On sales_item_batch_profit_loss id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:03', '2025-11-29'),
(589, 'New Record inserted On purchase id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:39', '2025-11-29'),
(590, 'New Record inserted On acc_general_ledger id 116', 116, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:40', '2025-11-29'),
(591, 'New Record inserted On acc_general_ledger id 117', 117, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:40', '2025-11-29'),
(592, 'New Record inserted On inv_stock_item_serial id 130', 130, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:40', '2025-11-29'),
(593, 'New Record inserted On inv_stock_item_serial id 131', 131, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:34:40', '2025-11-29'),
(594, 'New Record inserted On purchase id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:07', '2025-11-29'),
(595, 'New Record inserted On acc_general_ledger id 118', 118, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:08', '2025-11-29'),
(596, 'New Record inserted On acc_general_ledger id 119', 119, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:09', '2025-11-29'),
(597, 'New Record inserted On inv_stock_item_serial id 132', 132, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:09', '2025-11-29'),
(598, 'New Record inserted On sales id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:39', '2025-11-29'),
(599, 'New Record inserted On sales_items id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:39', '2025-11-29'),
(600, 'New Record inserted On sales_item_batch_profit_loss id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:39', '2025-11-29'),
(601, 'New Record inserted On sales_item_batch_profit_loss id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:35:40', '2025-11-29'),
(602, 'New Record inserted On purchase id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:37:58', '2025-11-29'),
(603, 'New Record inserted On acc_general_ledger id 120', 120, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:37:58', '2025-11-29'),
(604, 'New Record inserted On acc_general_ledger id 121', 121, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:37:58', '2025-11-29'),
(605, 'New Record inserted On inv_stock_item_serial id 133', 133, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:37:59', '2025-11-29'),
(606, 'New Record inserted On sales id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:38:20', '2025-11-29'),
(607, 'New Record inserted On sales_items id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:38:20', '2025-11-29'),
(608, 'New Record inserted On sales_item_batch_profit_loss id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:38:20', '2025-11-29'),
(609, 'New Record inserted On sales_item_batch_profit_loss id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:38:20', '2025-11-29'),
(610, 'New Record inserted On sales id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:39:17', '2025-11-29'),
(611, 'New Record inserted On sales_items id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:39:18', '2025-11-29'),
(612, 'New Record inserted On sales_item_batch_profit_loss id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:39:18', '2025-11-29'),
(613, 'New Record inserted On sales_items id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:39:18', '2025-11-29'),
(614, 'New Record inserted On sales_item_batch_profit_loss id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 09:39:18', '2025-11-29'),
(615, 'New Record inserted On menus id 25', 25, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 11:35:53', '2025-11-29'),
(616, 'New Record inserted On sales id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 11:39:55', '2025-11-29'),
(617, 'New Record inserted On sales_items id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 11:39:55', '2025-11-29'),
(618, 'New Record inserted On sales_item_batch_profit_loss id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-29 11:39:55', '2025-11-29'),
(619, 'New Record inserted On purchase id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 04:01:38', '2025-11-30'),
(620, 'New Record inserted On acc_general_ledger id 122', 122, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 04:01:38', '2025-11-30'),
(621, 'New Record inserted On acc_general_ledger id 123', 123, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 04:01:38', '2025-11-30'),
(622, 'New Record inserted On inv_stock_item_serial id 134', 134, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 04:01:38', '2025-11-30'),
(623, 'New Record inserted On inv_stock_item_serial id 135', 135, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 04:01:38', '2025-11-30'),
(624, 'New Record inserted On inv_stock_item_serial id 136', 136, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 04:01:39', '2025-11-30'),
(625, 'New Record inserted On purchase id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 06:30:43', '2025-11-30'),
(626, 'New Record inserted On acc_general_ledger id 124', 124, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 06:30:43', '2025-11-30'),
(627, 'New Record inserted On acc_general_ledger id 125', 125, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 06:30:43', '2025-11-30'),
(628, 'New Record inserted On inv_stock_item_serial id 137', 137, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 06:30:43', '2025-11-30'),
(629, 'New Record inserted On inv_stock_item_serial id 138', 138, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 06:30:44', '2025-11-30'),
(630, 'New Record inserted On inv_stock_item_serial id 139', 139, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 06:30:44', '2025-11-30'),
(631, 'New Record inserted On purchase id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 08:24:26', '2025-11-30'),
(632, 'New Record inserted On acc_general_ledger id 126', 126, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 08:24:26', '2025-11-30'),
(633, 'New Record inserted On acc_general_ledger id 127', 127, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 08:24:26', '2025-11-30'),
(634, 'New Record inserted On inv_stock_item_serial id 140', 140, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 08:24:26', '2025-11-30'),
(635, 'New Record inserted On inv_stock_item_serial id 141', 141, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 08:24:27', '2025-11-30'),
(636, 'New Record inserted On inv_stock_item_serial id 142', 142, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-30 08:24:27', '2025-11-30'),
(637, 'New Record inserted On purchase id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:03', '2025-12-01'),
(638, 'New Record inserted On acc_general_ledger id 128', 128, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:04', '2025-12-01'),
(639, 'New Record inserted On acc_general_ledger id 129', 129, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:04', '2025-12-01'),
(640, 'New Record inserted On inv_stock_item_serial id 143', 143, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:04', '2025-12-01'),
(641, 'New Record inserted On inv_stock_item_serial id 144', 144, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:04', '2025-12-01'),
(642, 'New Record inserted On inv_stock_item_serial id 145', 145, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:04', '2025-12-01'),
(643, 'New Record inserted On inv_stock_item_serial id 146', 146, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:04', '2025-12-01'),
(644, 'New Record inserted On inv_stock_item_serial id 147', 147, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:05', '2025-12-01'),
(645, 'New Record inserted On inv_stock_item_serial id 148', 148, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:05', '2025-12-01'),
(646, 'New Record inserted On inv_stock_item_batch id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:05', '2025-12-01'),
(647, 'New Record inserted On sales id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:30', '2025-12-01'),
(648, 'New Record inserted On sales_items id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:31', '2025-12-01'),
(649, 'New Record inserted On sales_item_batch_profit_loss id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:31', '2025-12-01'),
(650, 'New Record inserted On sales id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:49', '2025-12-01'),
(651, 'New Record inserted On sales_items id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:49', '2025-12-01'),
(652, 'New Record inserted On sales_item_batch_profit_loss id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:33:49', '2025-12-01'),
(653, 'New Record inserted On business_partner id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:35:49', '2025-12-01'),
(654, 'New Record inserted On sales id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:35:49', '2025-12-01'),
(655, 'New Record inserted On sales_items id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:35:50', '2025-12-01'),
(656, 'New Record inserted On sales_item_batch_profit_loss id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:35:50', '2025-12-01'),
(657, 'New Record inserted On sales_item_batch_profit_loss id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:35:51', '2025-12-01'),
(658, 'New Record inserted On sales id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:44:49', '2025-12-01'),
(659, 'New Record inserted On sales_items id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:44:49', '2025-12-01'),
(660, 'New Record inserted On sales_item_batch_profit_loss id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 09:44:50', '2025-12-01'),
(661, 'New Record inserted On sales id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:14:15', '2025-12-01'),
(662, 'New Record inserted On sales id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:14:55', '2025-12-01'),
(663, 'New Record inserted On sales_items id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:14:56', '2025-12-01'),
(664, 'New Record inserted On sales_item_batch_profit_loss id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:14:57', '2025-12-01'),
(665, 'New Record inserted On sales id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:17:15', '2025-12-01'),
(666, 'New Record inserted On sales_items id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:17:15', '2025-12-01'),
(667, 'New Record inserted On sales_item_batch_profit_loss id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:17:16', '2025-12-01'),
(668, 'New Record inserted On purchase id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:06', '2025-12-01'),
(669, 'New Record inserted On acc_general_ledger id 130', 130, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:06', '2025-12-01'),
(670, 'New Record inserted On acc_general_ledger id 131', 131, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:07', '2025-12-01'),
(671, 'New Record inserted On inv_stock_item_batch id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:07', '2025-12-01'),
(672, 'New Record inserted On sales id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:33', '2025-12-01'),
(673, 'New Record inserted On sales_items id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:33', '2025-12-01'),
(674, 'New Record inserted On sales_item_batch_profit_loss id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:18:33', '2025-12-01'),
(675, 'New Record inserted On sales id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:01', '2025-12-01'),
(676, 'New Record inserted On sales_items id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:01', '2025-12-01'),
(677, 'New Record inserted On sales_item_batch_profit_loss id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:02', '2025-12-01'),
(678, 'New Record inserted On sales id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:19', '2025-12-01'),
(679, 'New Record inserted On acc_general_ledger id 132', 132, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:19', '2025-12-01'),
(680, 'New Record inserted On sales_items id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:19', '2025-12-01'),
(681, 'New Record inserted On sales_item_batch_profit_loss id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:19:19', '2025-12-01'),
(682, 'New Record inserted On sales id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:20:14', '2025-12-01'),
(683, 'New Record inserted On sales_items id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:20:15', '2025-12-01'),
(684, 'New Record inserted On sales_item_batch_profit_loss id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:20:15', '2025-12-01'),
(685, 'New Record inserted On sales id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:20:31', '2025-12-01'),
(686, 'New Record inserted On sales_items id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:20:31', '2025-12-01'),
(687, 'New Record inserted On sales_item_batch_profit_loss id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:20:32', '2025-12-01'),
(688, 'New Record inserted On sales id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:21:22', '2025-12-01'),
(689, 'New Record inserted On acc_general_ledger id 133', 133, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:21:23', '2025-12-01'),
(690, 'New Record inserted On sales_items id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:21:23', '2025-12-01'),
(691, 'New Record inserted On sales_item_batch_profit_loss id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:21:23', '2025-12-01'),
(692, 'New Record inserted On sales id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:25:42', '2025-12-01'),
(693, 'New Record inserted On acc_general_ledger id 134', 134, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:25:42', '2025-12-01'),
(694, 'New Record inserted On acc_general_ledger id 135', 135, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:25:42', '2025-12-01'),
(695, 'New Record inserted On sales_items id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:25:43', '2025-12-01'),
(696, 'New Record inserted On sales_item_batch_profit_loss id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:25:43', '2025-12-01');

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
(9, 'Purchase List', 'purchase', 8, 4, 'fa fa-angle-double-right', 1, 1762249889),
(10, 'Business Partner', '#', 0, 13, 'fa-regular fa-handshake', 1, 1762402030),
(11, 'Partner List', 'partner', 10, 3, 'fa fa-angle-double-right', 1, 1762402338),
(12, 'New Purchase Order', 'purchase/create', 8, 1, '', 1, 1762599130),
(13, 'Order List', 'purchase/order', 8, 12, '', 1, 1762599200),
(14, 'Create Product', 'products/create', 4, 2, '', 1, 1762599274),
(15, 'Partner Group', 'partner/group', 10, 11, '', 1, 1762599415),
(16, 'Create Partner', 'partner/create', 10, 3, '', 1, 1762599454),
(17, 'Inventory', '#', 0, 9, '', 1, 1762855013),
(18, 'Stock Balance', 'inventory/stockmaster', 17, 3, '', 1, 1762855248),
(19, 'Stock Item Serial', 'inventory/stockitemserial', 17, 4, '', 1, 1762855294),
(20, 'Reports', '#', 0, 56, '', 1, 1763550676),
(21, 'Purchase Reports', 'reports/purchase', 20, 2, '', 1, 1763550705),
(22, 'Sales', '#', 0, 10, '', 1, 1763972920),
(23, 'Create Sales', 'sales/create', 22, 2, '', 1, 1763972953),
(24, 'Sales List', 'sales', 22, 3, '', 1, 1763972971),
(25, 'Income Statement Report', 'reports/profit', 20, 5, '', 1, 1764416152);

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
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `organization_id`, `branch_id`, `name`, `description`, `is_active`, `create_user`, `create_date`) VALUES
(1, 3, 1, 'Cash', '', 1, 0, 0);

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
  `product_code` varchar(255) NOT NULL,
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

INSERT INTO `products` (`id`, `organization_id`, `product_code`, `name`, `group_id`, `brand_id`, `unit_id`, `serial_type`, `purchase_price`, `tax_method`, `product_tax`, `product_tax_amount`, `total_amount`, `sales_price`, `warrenty`, `warrenty_days`, `re_order_level`, `is_inventory`, `is_short_bill`, `is_quotation`, `note`, `picture`, `is_active`, `create_user`, `create_date`) VALUES
(2, 3, '', 'DAHUA 2MP CAMERA DH-HAC-HFW1200RP', 2, 1, 10, 'unique', 3.00, 'Inclusive', 0.00, 0.00, 0.00, 0.00, 3, 'Days', 3, 1, 1, 0, 'DAHUA 2MP CAMERA DH-HAC-HFW1200RP', '0.png', 1, 17, 1762239823),
(3, 3, '', 'DAHUA 2MP CAMERA DH-HAC-HFW1200SP', 3, 3, 1, 'common', 500.00, 'Inclusive', 0.00, 0.00, 0.00, 1000.00, 1, 'Days', 0, 1, 1, 0, 'DAHUA 2MP CAMERA DH-HAC-HFW1200SP', '0.png', 1, 17, 1762407846),
(4, 3, '', 'DAHUA 2MP CAMERA DH-HAC-HFW1200DP', 3, 3, 1, 'unique', 450.00, 'Inclusive', 0.00, 0.00, 450.00, 700.00, 0, 'Days', 6, 1, 1, 0, 'DAHUA 2MP CAMERA DH-HAC-HFW1200DP', '0.png', 1, 17, 1762407875),
(5, 3, '', 'DAHUA 2MP IP CAMERA DH-IPC-B1B20P-L', 5, 3, 1, 'unique', 0.00, 'Inclusive', 0.00, 0.00, 0.00, 0.00, 0, 'Days', 0, 1, 1, 0, 'DAHUA 2MP IP CAMERA DH-IPC-B1B20P-L', '0.png', 1, 17, 1762407904),
(6, 3, '', 'HIKVISION CAMERA 2MP DS-2CE16DOT-IRPF', 4, 4, 3, 'common', 5765.00, 'Inclusive', 0.00, 0.00, 5765.00, 6888.00, 7, 'Days', 0, 0, 1, 0, 'HIKVISION CAMERA 2MP DS-2CE16DOT-IRPF', '0.png', 1, 17, 1762407945),
(7, 3, '6354', 'Nokia Mobail', 5, 4, 11, 'unique', 500.00, 'Inclusive', 0.00, 0.00, 0.00, 900.00, 7, 'Days', 1, 1, 0, 1, 'ww', '0.png', 1, 17, 1764396927);

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
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `invoice_code` varchar(255) NOT NULL,
  `code_random` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `purchase_date` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `totalQty` int(11) NOT NULL,
  `allTotal` decimal(16,2) NOT NULL,
  `totalDiscount` decimal(16,2) NOT NULL,
  `totalRebate` decimal(16,2) NOT NULL,
  `totalAmount` decimal(16,2) NOT NULL,
  `paidAmount` decimal(16,2) NOT NULL,
  `dueAmount` decimal(16,2) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `organization_id`, `branch_id`, `ip_address`, `invoice_code`, `code_random`, `invoice_no`, `purchase_date`, `supplier_id`, `store_id`, `totalQty`, `allTotal`, `totalDiscount`, `totalRebate`, `totalAmount`, `paidAmount`, `dueAmount`, `is_active`, `create_user`, `create_date`) VALUES
(95, 3, 1, '', '01122025153235', 1, 'GRN-0001', 1764525600, 2, 1, 7, 8765.00, 0.00, 0.00, 8765.00, 0.00, 8765.00, 1, 17, 1764581583),
(96, 3, 1, '', '01122025161756', 2, 'GRN-0002', 1764525600, 2, 1, 50, 288250.00, 0.00, 0.00, 288250.00, 0.00, 288250.00, 1, 17, 1764584286);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice`
--

CREATE TABLE `purchase_invoice` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `invoice_code` varchar(100) NOT NULL,
  `supplier_id` int(11) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` enum('Pending','Approved') NOT NULL DEFAULT 'Pending',
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase_invoice`
--

INSERT INTO `purchase_invoice` (`id`, `organization_id`, `invoice_code`, `supplier_id`, `remarks`, `status`, `create_user`, `create_date`) VALUES
(106, 3, '01122025153235', 0, NULL, 'Approved', 17, 1764581564),
(107, 3, '01122025161637', 0, NULL, 'Pending', 17, 1764584205),
(108, 3, '01122025161756', 0, NULL, 'Approved', 17, 1764584283);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_date` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `with_total_rebate` decimal(16,2) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `total_rebate` decimal(16,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) DEFAULT NULL,
  `serial_number` text DEFAULT NULL,
  `barcode_serial` text DEFAULT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `invoice_id`, `serial_type`, `product_id`, `purchase_date`, `price`, `qty`, `with_total_rebate`, `rebate`, `total_rebate`, `sub_total`, `sales_price`, `warrenty`, `warrenty_days`, `serial_number`, `barcode_serial`, `create_date`) VALUES
(438, '01122025153235', 'unique', 7, 0, 500.00, 6, 0.00, 0.00, 0.00, 3000.00, 900.00, 7, 'Days', NULL, '', 1764581564),
(439, '01122025153235', 'common', 6, 0, 5765.00, 1, 0.00, 0.00, 0.00, 5765.00, 6888.00, 7, 'Days', NULL, '333333', 1764581579),
(440, '01122025161637', 'common', 6, 0, 5765.00, 500, 0.00, 0.00, 0.00, 2882500.00, 6888.00, 7, 'Days', NULL, 'ewrw', 1764584205),
(441, '01122025161756', 'common', 6, 0, 5765.00, 50, 0.00, 0.00, 0.00, 288250.00, 6888.00, 7, 'Days', NULL, 'wwww', 1764584283);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item_serials`
--

CREATE TABLE `purchase_item_serials` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `serial_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase_item_serials`
--

INSERT INTO `purchase_item_serials` (`id`, `item_id`, `serial_number`) VALUES
(194, 438, '34434332'),
(195, 438, '43344342'),
(196, 438, '4rrrr'),
(197, 438, '111'),
(198, 438, '222'),
(199, 438, '3333');

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
(11, 3, 11),
(12, 3, 12),
(14, 3, 13),
(13, 3, 14),
(16, 3, 15),
(15, 3, 16),
(17, 3, 17),
(18, 3, 18),
(19, 3, 19),
(20, 3, 20),
(21, 3, 21),
(22, 3, 22),
(23, 3, 23),
(24, 3, 24),
(25, 3, 25);

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
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `invoice_code` varchar(100) NOT NULL,
  `code_random` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `sales_date` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `totalQty` int(11) NOT NULL,
  `subTotal` decimal(16,2) NOT NULL,
  `total_discount` decimal(16,2) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `payableAmount` decimal(16,2) NOT NULL,
  `dueAmount` decimal(16,2) NOT NULL,
  `paidAmount` decimal(16,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `next_due_paid_date` int(11) NOT NULL,
  `is_customer` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `mobile_no` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `organization_id`, `branch_id`, `ip_address`, `invoice_code`, `code_random`, `invoice_no`, `sales_date`, `customer_id`, `store_id`, `totalQty`, `subTotal`, `total_discount`, `adjustment`, `payableAmount`, `dueAmount`, `paidAmount`, `payment_method_id`, `next_due_paid_date`, `is_customer`, `customer_name`, `mobile_no`, `address`, `is_active`, `create_user`, `create_date`) VALUES
(57, 3, 1, '', '01122025153312', 1, 'INV-0001', 1764525600, 29, 1, 1, 900.00, 90.00, 0.00, 810.00, 810.00, 0.00, 1, 0, 0, 'Litan sarkar', '013344444', 'tangail', 1, 17, 1764581610),
(58, 3, 1, '', '01122025153331', 2, 'INV-0002', 1764525600, 2, 1, 1, 900.00, 0.00, 0.00, 900.00, 900.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764581629),
(59, 3, 1, '', '01122025153437', 3, 'INV-0003', 1764525600, 30, 1, 2, 1800.00, 0.00, 0.00, 1800.00, 1800.00, 0.00, 1, 0, 1, 'Hasan Ali Vai', '0192826', 'Dhaka', 1, 17, 1764581749),
(60, 3, 1, '', '01122025154433', 4, 'INV-0004', 1764525600, 2, 1, 1, 900.00, 0.00, 0.00, 900.00, 400.00, 500.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764582289),
(61, 3, 1, '', '01122025155609', 5, 'INV-0005', 1764525600, 2, 1, 1, 900.00, 90.00, 10.00, 800.00, 300.00, 500.00, 1, 1766512800, 0, 'Cash', '0', 'Cash', 1, 17, 1764584054),
(62, 3, 1, '', '01122025155609', 6, 'INV-0006', 1764525600, 2, 1, 1, 900.00, 90.00, 10.00, 800.00, 300.00, 500.00, 1, 1766512800, 0, 'Cash', '0', 'Cash', 1, 17, 1764584095),
(63, 3, 1, '', '01122025161649', 7, 'INV-0007', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584234),
(64, 3, 1, '', '01122025161822', 8, 'INV-0008', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584313),
(65, 3, 1, '', '01122025161834', 9, 'INV-0009', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584341),
(66, 3, 1, '', '01122025161902', 10, 'INV-0010', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584359),
(67, 3, 1, '', '01122025161920', 11, 'INV-0011', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584414),
(68, 3, 1, '', '01122025162015', 12, 'INV-0012', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584431),
(69, 3, 1, '', '01122025162032', 13, 'INV-0013', 1764525600, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6888.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1764584480),
(70, 3, 1, '', '01122025162524', 14, 'INV-0014', 1762279200, 2, 1, 1, 6888.00, 0.00, 0.00, 6888.00, 6388.00, 500.00, 1, 1766512800, 0, 'Cash', '0', 'Cash', 1, 17, 1764584740);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice`
--

CREATE TABLE `sales_invoice` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `invoice_code` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `status` enum('Pending','Approved') NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_invoice`
--

INSERT INTO `sales_invoice` (`id`, `organization_id`, `invoice_code`, `supplier_id`, `remarks`, `status`, `create_user`, `create_date`) VALUES
(232, 3, '01122025153331', 0, '', 'Approved', 17, 1764581626),
(233, 3, '01122025153437', 0, '', 'Approved', 17, 1764581714),
(234, 3, '01122025154433', 0, '', 'Approved', 17, 1764582280),
(235, 3, '01122025155609', 0, '', 'Approved', 17, 1764582977),
(236, 3, '01122025161649', 0, '', 'Approved', 17, 1764584228),
(237, 3, '01122025161822', 0, '', 'Approved', 17, 1764584308),
(238, 3, '01122025161834', 0, '', 'Approved', 17, 1764584339),
(239, 3, '01122025161902', 0, '', 'Approved', 17, 1764584357),
(240, 3, '01122025161920', 0, '', 'Approved', 17, 1764584412),
(241, 3, '01122025162015', 0, '', 'Approved', 17, 1764584429),
(242, 3, '01122025162032', 0, '', 'Approved', 17, 1764584476),
(243, 3, '01122025162524', 0, '', 'Approved', 17, 1764584731);

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `discount_percent` decimal(16,2) NOT NULL,
  `discount_amount` decimal(16,2) NOT NULL,
  `net_total` decimal(16,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(20) NOT NULL,
  `status` enum('Pending','Approved') NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `organization_id`, `branch_id`, `invoice_id`, `sales_id`, `store_id`, `serial_type`, `product_id`, `purchase_price`, `price`, `qty`, `sub_total`, `discount_percent`, `discount_amount`, `net_total`, `warrenty`, `warrenty_days`, `status`, `create_user`, `create_date`) VALUES
(50, 3, 1, '', 57, 1, 'unique', 7, 500.00, 900.00, 1, 900.00, 10.00, 90.00, 810.00, 7, 'Days', 'Approved', 17, 1764581610),
(51, 3, 1, '', 58, 1, 'unique', 7, 500.00, 900.00, 1, 900.00, 0.00, 0.00, 900.00, 7, 'Days', 'Approved', 17, 1764581629),
(52, 3, 1, '', 59, 1, 'unique', 7, 500.00, 900.00, 2, 1800.00, 0.00, 0.00, 1800.00, 7, 'Days', 'Approved', 17, 1764581749),
(53, 3, 1, '', 60, 1, 'unique', 7, 500.00, 900.00, 1, 900.00, 0.00, 0.00, 900.00, 7, 'Days', 'Approved', 17, 1764582289),
(54, 3, 1, '', 62, 1, 'unique', 7, 500.00, 900.00, 1, 900.00, 10.00, 90.00, 810.00, 7, 'Days', 'Approved', 17, 1764584095),
(55, 3, 1, '', 63, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584234),
(56, 3, 1, '', 64, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584313),
(57, 3, 1, '', 65, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584341),
(58, 3, 1, '', 66, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584359),
(59, 3, 1, '', 67, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584414),
(60, 3, 1, '', 68, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584431),
(61, 3, 1, '', 69, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584480),
(62, 3, 1, '', 70, 1, 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584740);

-- --------------------------------------------------------

--
-- Table structure for table `sales_item_batch_profit_loss`
--

CREATE TABLE `sales_item_batch_profit_loss` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `sales_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `batch_number` varchar(100) NOT NULL,
  `qty_sold` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `profit_loss` decimal(16,2) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `sales_date` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_item_batch_profit_loss`
--

INSERT INTO `sales_item_batch_profit_loss` (`id`, `organization_id`, `branch_id`, `sales_id`, `sales_item_id`, `product_id`, `batch_id`, `batch_number`, `qty_sold`, `purchase_price`, `sales_price`, `profit_loss`, `serial_type`, `sales_date`, `create_user`, `create_date`) VALUES
(22, 3, 1, 57, 50, 7, 146, '111', 1, 500.00, 900.00, 310.00, 'unique', 1764525600, 17, 1764581611),
(23, 3, 1, 58, 51, 7, 143, '34434332', 1, 500.00, 900.00, 400.00, 'unique', 1764525600, 17, 1764581629),
(24, 3, 1, 59, 52, 7, 144, '43344342', 1, 500.00, 900.00, 400.00, 'unique', 1764525600, 17, 1764581750),
(25, 3, 1, 59, 52, 7, 147, '222', 1, 500.00, 900.00, 400.00, 'unique', 1764525600, 17, 1764581751),
(26, 3, 1, 60, 53, 7, 145, '4rrrr', 1, 500.00, 900.00, 400.00, 'unique', 1764525600, 17, 1764582290),
(27, 3, 1, 62, 54, 7, 148, '3333', 1, 500.00, 900.00, 310.00, 'unique', 1764525600, 17, 1764584097),
(28, 3, 1, 63, 55, 6, 7, '333333', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584236),
(29, 3, 1, 64, 56, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584313),
(30, 3, 1, 65, 57, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584342),
(31, 3, 1, 66, 58, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584359),
(32, 3, 1, 67, 59, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584415),
(33, 3, 1, 68, 60, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584432),
(34, 3, 1, 69, 61, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1764525600, 17, 1764584483),
(35, 3, 1, 70, 62, 6, 8, 'wwww', 1, 5765.00, 6888.00, 1123.00, 'common', 1762279200, 17, 1764584743);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_items`
--

CREATE TABLE `sales_order_items` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `discount_percent` decimal(16,2) NOT NULL,
  `discount_amount` decimal(16,2) NOT NULL,
  `net_total` decimal(16,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(20) NOT NULL,
  `status` enum('Pending','Approved') NOT NULL DEFAULT 'Pending',
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_order_items`
--

INSERT INTO `sales_order_items` (`id`, `organization_id`, `invoice_id`, `serial_type`, `product_id`, `purchase_price`, `price`, `qty`, `sub_total`, `discount_percent`, `discount_amount`, `net_total`, `warrenty`, `warrenty_days`, `status`, `create_user`, `create_date`) VALUES
(335, 3, '01122025153312', 'unique', 7, 500.00, 900.00, 1, 900.00, 10.00, 90.00, 810.00, 7, 'Days', 'Approved', 17, 1764581595),
(336, 3, '01122025153331', 'unique', 7, 500.00, 900.00, 1, 900.00, 0.00, 0.00, 900.00, 7, 'Days', 'Approved', 17, 1764581626),
(337, 3, '01122025153437', 'unique', 7, 500.00, 900.00, 2, 1800.00, 0.00, 0.00, 1800.00, 7, 'Days', 'Approved', 17, 1764581714),
(338, 3, '01122025154433', 'unique', 7, 500.00, 900.00, 1, 900.00, 0.00, 0.00, 900.00, 7, 'Days', 'Approved', 17, 1764582280),
(339, 3, '01122025155609', 'unique', 7, 500.00, 900.00, 1, 900.00, 10.00, 90.00, 810.00, 7, 'Days', 'Approved', 17, 1764582977),
(340, 3, '01122025161649', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584228),
(341, 3, '01122025161822', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584308),
(342, 3, '01122025161834', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584339),
(343, 3, '01122025161902', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584357),
(344, 3, '01122025161920', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584412),
(345, 3, '01122025162015', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584429),
(346, 3, '01122025162032', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584476),
(347, 3, '01122025162524', 'common', 6, 5765.00, 6888.00, 1, 6888.00, 0.00, 0.00, 6888.00, 7, 'Days', 'Approved', 17, 1764584731);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_item_serials`
--

CREATE TABLE `sales_order_item_serials` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `is_available` int(11) DEFAULT 0,
  `batch_number` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_order_item_serials`
--

INSERT INTO `sales_order_item_serials` (`id`, `item_id`, `is_available`, `batch_number`, `serial_number`) VALUES
(244, 335, 0, '', '111'),
(245, 336, 0, '', '34434332'),
(246, 337, 0, '', '43344342'),
(247, 337, 0, '', '222'),
(248, 338, 0, '', '4rrrr'),
(249, 339, 0, '', '3333');

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
(1, 0, 0, '', 0, 0, '', 'System', '', 'system', 1, '', '', '', '', '', '', 0, '', 0, 0, '', '', '', '', '', '', '', '', 0.00, 0, 0.00, '', '', '', '', '', '', 1, '0.png', 0, 0),
(2, 0, 0, '', 0, 0, '', 'Admin', '', 'litan@gmail.com', 1, '', '', '', '', '', '', 0, '', 0, 0, '', '', '', '', '', '', '', '', 0.00, 0, 0.00, '', '', '', '', '', '', 1, '0.png', 0, 0),
(6, 0, 0, '', 0, 0, '', 'abir', 'r', 'admin@gmail.com', 3, '', '', '3', '33', '33', '33', 1731711600, 'Single', 1731711600, 1731711600, '', '', '', '', '', '', '', '', 0.00, 1, 100.00, '', '', '', '', '', '', 1, '0.png', 0, 1731778556),
(7, 0, 0, '', 0, 0, '', 'Md Kobir ', 'Hasan', 'kobir1@gmail.com', 3, '', '', 'Ibr', '', '0182762', '1123333', 1732230000, '', 1732230000, 1732230000, '', '', '', '', '', '', '', '', 0.00, 1, 100.00, '', '', '', '', '', '', 1, '0.png', 0, 1732250608),
(8, 0, 0, '', 0, 0, '', 'Admin', '', 'superadmin@gmail.com', 1, '', '', '', '', '', '', 0, '', 0, 0, '', '', '', '', '', '', '', '', 0.00, 0, 0.00, '', '', '', '', '', '', 1, '0.png', 0, 0),
(9, 0, 0, '2132332', 0, 0, '', 'Hridoy', 'Sarkar', 'hridoy@gmail.com', 0, '', '', 'Ibrahim', '', '01827262', '01827262', 1732834800, 'Single', 1732834800, 1732834800, '', '', 'Male', '', '', '', '', '', 0.00, 1, 100.00, '', '', '', '', '', '', 1, '0.png', 0, 1732851415),
(10, 3, 0, '', 0, 0, '', 'Master IT', '', '', 2, '', '', '', '', '01829', '', 0, '', 1761845407, 0, '', '', '', '', '', '', '', '', 0.00, 0, 0.00, '', '', '', '', '', '', 1, '0.png', 0, 1761845407);

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

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `organization_id`, `branch_id`, `name`, `is_active`, `create_user`, `create_date`) VALUES
(1, 3, 1, 'Inventory', 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_stock_history`
--
ALTER TABLE `inv_stock_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_stock_item_batch`
--
ALTER TABLE `inv_stock_item_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_stock_item_serial`
--
ALTER TABLE `inv_stock_item_serial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_stock_master`
--
ALTER TABLE `inv_stock_master`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
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
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_item_serials`
--
ALTER TABLE `purchase_item_serials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

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
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_item_batch_profit_loss`
--
ALTER TABLE `sales_item_batch_profit_loss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_item_serials`
--
ALTER TABLE `sales_order_item_serials`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

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
-- AUTO_INCREMENT for table `business_partner`
--
ALTER TABLE `business_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `inv_stock_history`
--
ALTER TABLE `inv_stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `inv_stock_item_batch`
--
ALTER TABLE `inv_stock_item_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inv_stock_item_serial`
--
ALTER TABLE `inv_stock_item_serial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `inv_stock_master`
--
ALTER TABLE `inv_stock_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products_groups`
--
ALTER TABLE `products_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `purchase_item_serials`
--
ALTER TABLE `purchase_item_serials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `sales_item_batch_profit_loss`
--
ALTER TABLE `sales_item_batch_profit_loss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `sales_order_item_serials`
--
ALTER TABLE `sales_order_item_serials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

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
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchase_item_serials`
--
ALTER TABLE `purchase_item_serials`
  ADD CONSTRAINT `purchase_item_serials_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `purchase_items` (`id`) ON DELETE CASCADE;

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

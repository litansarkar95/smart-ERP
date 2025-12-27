-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 12:41 PM
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
-- Table structure for table `acc_customer_received`
--

CREATE TABLE `acc_customer_received` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `code_random` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `paid_amount` decimal(16,2) NOT NULL,
  `discount_amount` decimal(16,2) NOT NULL,
  `received_date` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_general_ledger`
--

CREATE TABLE `acc_general_ledger` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `voucher_type` varchar(50) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `purchase_invoice_id` int(11) NOT NULL,
  `sales_invoice_id` int(11) NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `sales_return_id` int(11) NOT NULL,
  `customer_received_id` int(11) NOT NULL,
  `supplier_received_id` int(11) NOT NULL,
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

INSERT INTO `acc_general_ledger` (`id`, `organization_id`, `branch_id`, `voucher_type`, `invoice_no`, `purchase_invoice_id`, `sales_invoice_id`, `purchase_return_id`, `sales_return_id`, `customer_received_id`, `supplier_received_id`, `party_id`, `account_name`, `particulars`, `date`, `debit`, `credit`, `gl_date`, `acc_coa_head_id`, `payment_method`, `remarks`, `is_active`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(559, 3, 1, 'Purchase', 'GRN-0001', 305, 0, 0, 0, 0, 0, 1, 'Supplier Purchase', 'Purchase for order', '2025-12-21', 0.00, 2100.00, 1766339229, 0, 0, 'Purchase order ', 1, 17, 1766339229, 0, 0),
(560, 3, 1, 'Sales', 'INV-0001', 0, 150, 0, 0, 0, 0, 1, 'Customer Sales', 'Sales for order', '2025-12-21', 44.00, 0.00, 1766253600, 0, 0, 'Sales order ', 1, 17, 1766339282, 0, 0),
(561, 3, 1, 'Sales', 'INV-0002', 0, 151, 0, 0, 0, 0, 1, 'Customer Sales', 'Sales Replace', '2025-12-21', 0.00, 0.00, 1766339343, 0, 0, 'Sales Replace Barcode:  bbb', 1, 17, 1766339343, 0, 0),
(562, 3, 1, 'Purchase', 'GRN-0002', 306, 0, 0, 0, 0, 0, 1, 'Supplier Purchase', 'Purchase for order', '2025-12-23', 0.00, 1400.00, 1766468228, 0, 0, 'Purchase order ', 1, 17, 1766468228, 0, 0),
(563, 3, 1, 'Sales', 'INV-0003', 0, 152, 0, 0, 0, 0, 1, 'Customer Sales', 'Sales for order', '2025-12-23', 900.00, 0.00, 1766426400, 0, 0, 'Sales order ', 1, 17, 1766468251, 0, 0),
(564, 3, 1, 'Purchase', 'GRN-0003', 307, 0, 0, 0, 0, 0, 38, 'Supplier Purchase', 'Purchase for order', '2025-12-23', 0.00, 8000.00, 1766470785, 0, 0, 'Purchase order ', 1, 17, 1766470785, 0, 0),
(565, 3, 1, 'Sales', 'INV-0004', 0, 153, 0, 0, 0, 0, 1, 'Customer Sales', 'Sales for order', '2025-12-23', 800.00, 0.00, 1766426400, 0, 0, 'Sales order ', 1, 17, 1766470797, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acc_supplier_received`
--

CREATE TABLE `acc_supplier_received` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `code_random` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `paid_amount` decimal(16,2) NOT NULL,
  `discount_amount` decimal(16,2) NOT NULL,
  `received_date` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(1, 3, 'Master IT Solution', '01840325244, 01842325244', 'masterit138044@gmail.com', 'Cumilla New Market, 5th Floor, Kandirpar, Cumilla, Bangladesh', '0.png', 1, 1761839060);

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
(1, 3, 'Cash', 'Both', '0', '', 'Cash', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 10, '', 0.00, -6912.00, 17, 1764140186, '2025-11-26 06:56:26', '2025-12-23 06:19:57'),
(38, 3, 'litan', 'Both', '444', '444', '4444444444444444', NULL, NULL, NULL, NULL, NULL, NULL, '44', 1, 0, 0, '', 0.00, -7156.00, 17, 1765645867, '2025-12-13 17:11:07', '2025-12-23 06:19:46');

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
(161, 3, 1, 305, 1, 9, 0.00, 0.00, 0.00, 0, 700.00, 0.00, 44.00, 3, 1, 17, 1766339230),
(162, 3, 1, 306, 1, 9, 700.00, 0.00, 44.00, 1, 700.00, 0.00, 900.00, 2, 1, 17, 1766468229),
(163, 3, 1, 307, 1, 8, 0.00, 0.00, 0.00, 0, 500.00, 0.00, 800.00, 16, 1, 17, 1766470786);

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_item_batch`
--

CREATE TABLE `inv_stock_item_batch` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `quanity` int(11) NOT NULL,
  `is_available` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `batch_number` varchar(100) NOT NULL,
  `qty_returned` int(11) NOT NULL,
  `is_returned` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_item_batch`
--

INSERT INTO `inv_stock_item_batch` (`id`, `organization_id`, `branch_id`, `purchase_id`, `supplier_id`, `store_id`, `product_id`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `is_available`, `serial_type`, `batch_number`, `qty_returned`, `is_returned`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(48, 3, 1, 307, 38, 1, 8, 500.00, 0.00, 800.00, 15, 1, 'common', 'SN694A3482AEC91', 0, 0, 17, 1766470785, 17, 1766470798);

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_item_serial`
--

CREATE TABLE `inv_stock_item_serial` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
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
  `is_returned` int(11) NOT NULL DEFAULT 0,
  `qty_returned` int(11) NOT NULL DEFAULT 0,
  `warrenty_days` varchar(50) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_item_serial`
--

INSERT INTO `inv_stock_item_serial` (`id`, `organization_id`, `branch_id`, `purchase_id`, `supplier_id`, `store_id`, `product_id`, `purchase_date`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `is_available`, `serial_type`, `serial`, `warrenty`, `is_returned`, `qty_returned`, `warrenty_days`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(239, 3, 1, 305, 1, 1, 9, 1766253600, 700, 0.00, 44, 1, 0, 'unique', 'aaa', 44, 0, 0, 'Days', 17, 1766339229, 0, 0),
(240, 3, 1, 305, 1, 1, 9, 1766253600, 700, 0.00, 44, 1, 0, 'unique', 'bbb', 44, 0, 0, 'Days', 17, 1766339229, 0, 0),
(241, 3, 1, 305, 1, 1, 9, 1766253600, 700, 0.00, 44, 1, 1, 'unique', 'ccc', 44, 0, 0, 'Days', 17, 1766339229, 0, 0),
(242, 3, 1, 306, 1, 1, 9, 1766426400, 700, 0.00, 900, 1, 1, 'unique', '233232', 44, 0, 0, 'Days', 17, 1766468228, 0, 0),
(243, 3, 1, 306, 1, 1, 9, 1766426400, 700, 0.00, 900, 1, 0, 'unique', '3333333', 44, 0, 0, 'Days', 17, 1766468228, 0, 0);

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
(93, 3, 1, 1, 9, 700.00, 0.00, 900.00, 2, 44, 'Days', 1, 17, 1766339230, 17, 1766468253),
(94, 3, 1, 1, 8, 500.00, 0.00, 800.00, 15, 6, 'Month', 1, 17, 1766470786, 17, 1766470799);

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
(1, 0, 0, 1, 'system', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2025-12-27 11:24:17', '2024-10-21 15:42:57', '2025-12-27 11:24:17'),
(2, 0, 0, 2, 'litan@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2024-11-27 11:06:55', '2024-10-21 15:42:57', '2025-10-30 14:29:54'),
(5, 0, 0, 6, 'admin@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 2, 1, '2025-11-01 14:35:31', '2024-11-16 23:35:56', '2025-11-01 14:35:31'),
(17, 3, 1, 10, '01829', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 3, 1, '2025-12-27 11:27:55', '2025-10-30 23:30:08', '2025-12-27 11:27:55'),
(18, 3, 1, 11, 'masterit', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 3, 1, '2025-12-27 17:36:27', '2025-10-30 23:30:08', '2025-12-27 17:36:27');

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
(696, 'New Record inserted On sales_item_batch_profit_loss id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-01 10:25:43', '2025-12-01'),
(697, 'New Record inserted On purchase id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:45', '2025-12-02'),
(698, 'New Record inserted On acc_general_ledger id 136', 136, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:45', '2025-12-02'),
(699, 'New Record inserted On acc_general_ledger id 137', 137, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:46', '2025-12-02'),
(700, 'New Record inserted On inv_stock_item_serial id 149', 149, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:46', '2025-12-02'),
(701, 'New Record inserted On inv_stock_item_serial id 150', 150, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:46', '2025-12-02'),
(702, 'New Record inserted On inv_stock_item_serial id 151', 151, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:46', '2025-12-02'),
(703, 'New Record inserted On inv_stock_item_serial id 152', 152, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:46', '2025-12-02'),
(704, 'New Record inserted On inv_stock_item_serial id 153', 153, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:47', '2025-12-02'),
(705, 'New Record inserted On inv_stock_item_serial id 154', 154, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:47', '2025-12-02'),
(706, 'New Record inserted On inv_stock_item_serial id 155', 155, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:44:47', '2025-12-02'),
(707, 'New Record inserted On purchase id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:45:23', '2025-12-02'),
(708, 'New Record inserted On acc_general_ledger id 138', 138, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:45:23', '2025-12-02'),
(709, 'New Record inserted On acc_general_ledger id 139', 139, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:45:23', '2025-12-02'),
(710, 'New Record inserted On inv_stock_item_serial id 156', 156, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:45:23', '2025-12-02'),
(711, 'New Record inserted On inv_stock_item_serial id 157', 157, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:45:24', '2025-12-02'),
(712, 'New Record inserted On purchase id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:53:48', '2025-12-02'),
(713, 'New Record inserted On acc_general_ledger id 140', 140, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:53:48', '2025-12-02'),
(714, 'New Record inserted On acc_general_ledger id 141', 141, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:53:49', '2025-12-02'),
(715, 'New Record inserted On inv_stock_item_serial id 158', 158, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 10:53:49', '2025-12-02'),
(716, 'New Record inserted On purchase id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:47', '2025-12-02'),
(717, 'New Record inserted On acc_general_ledger id 142', 142, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:47', '2025-12-02'),
(718, 'New Record inserted On acc_general_ledger id 143', 143, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:47', '2025-12-02'),
(719, 'New Record inserted On acc_general_ledger id 144', 144, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:47', '2025-12-02'),
(720, 'New Record inserted On inv_stock_item_serial id 159', 159, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:48', '2025-12-02'),
(721, 'New Record inserted On inv_stock_item_serial id 160', 160, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:48', '2025-12-02'),
(722, 'New Record inserted On inv_stock_item_serial id 161', 161, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:48', '2025-12-02'),
(723, 'New Record inserted On inv_stock_item_serial id 162', 162, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:48', '2025-12-02'),
(724, 'New Record inserted On inv_stock_item_serial id 163', 163, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:48', '2025-12-02'),
(725, 'New Record inserted On inv_stock_item_batch id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-02 11:33:48', '2025-12-02'),
(726, 'New Record inserted On purchase id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:24:46', '2025-12-03'),
(727, 'New Record inserted On purchase id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:54:32', '2025-12-03'),
(728, 'New Record inserted On purchase id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:55:17', '2025-12-03'),
(729, 'New Record inserted On purchase id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:55:51', '2025-12-03'),
(730, 'New Record inserted On purchase id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:56:12', '2025-12-03'),
(731, 'New Record inserted On sales_items id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:56:13', '2025-12-03'),
(732, 'New Record inserted On purchase id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:56:42', '2025-12-03'),
(733, 'New Record inserted On purchase_items id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:56:43', '2025-12-03'),
(734, 'New Record inserted On purchase id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:58:15', '2025-12-03'),
(735, 'New Record inserted On purchase_items id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:58:15', '2025-12-03'),
(736, 'New Record inserted On purchase_items id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 06:58:15', '2025-12-03'),
(737, 'New Record inserted On purchase id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:08:11', '2025-12-03'),
(738, 'New Record inserted On purchase_items id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:08:11', '2025-12-03'),
(739, 'New Record inserted On purchase id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:09:41', '2025-12-03'),
(740, 'New Record inserted On purchase_items id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:09:41', '2025-12-03'),
(741, 'New Record inserted On purchase id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:10:16', '2025-12-03'),
(742, 'New Record inserted On purchase_items id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:10:17', '2025-12-03'),
(743, 'New Record inserted On purchase id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:11:17', '2025-12-03'),
(744, 'New Record inserted On purchase_items id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:11:17', '2025-12-03'),
(745, 'New Record inserted On purchase_item_serials id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:11:17', '2025-12-03'),
(746, 'New Record inserted On purchase id 112', 112, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:18:03', '2025-12-03'),
(747, 'New Record inserted On purchase_items id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:18:03', '2025-12-03'),
(748, 'New Record inserted On purchase_items id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:18:03', '2025-12-03'),
(749, 'New Record inserted On purchase_item_serials id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:18:04', '2025-12-03'),
(750, 'New Record inserted On purchase_item_serials id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:18:04', '2025-12-03'),
(751, 'New Record inserted On purchase id 113', 113, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:19:36', '2025-12-03'),
(752, 'New Record inserted On purchase_items id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:19:36', '2025-12-03'),
(753, 'New Record inserted On purchase_item_serials id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:19:36', '2025-12-03'),
(754, 'New Record inserted On purchase id 114', 114, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:08', '2025-12-03'),
(755, 'New Record inserted On purchase_items id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:08', '2025-12-03'),
(756, 'New Record inserted On purchase_item_serials id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:09', '2025-12-03'),
(757, 'New Record inserted On purchase id 115', 115, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:19', '2025-12-03'),
(758, 'New Record inserted On purchase_items id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:24', '2025-12-03'),
(759, 'New Record inserted On purchase_item_serials id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:27', '2025-12-03'),
(760, 'New Record inserted On purchase id 116', 116, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:47', '2025-12-03'),
(761, 'New Record inserted On purchase_items id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:48', '2025-12-03'),
(762, 'New Record inserted On purchase_item_serials id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:48', '2025-12-03'),
(763, 'New Record inserted On purchase id 117', 117, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:51', '2025-12-03'),
(764, 'New Record inserted On purchase_items id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:52', '2025-12-03'),
(765, 'New Record inserted On purchase_item_serials id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:22:52', '2025-12-03'),
(766, 'New Record inserted On purchase id 118', 118, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:15', '2025-12-03'),
(767, 'New Record inserted On purchase_items id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:15', '2025-12-03'),
(768, 'New Record inserted On purchase_items id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:16', '2025-12-03'),
(769, 'New Record inserted On purchase_item_serials id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:16', '2025-12-03'),
(770, 'New Record inserted On purchase id 119', 119, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:37', '2025-12-03'),
(771, 'New Record inserted On purchase_items id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:38', '2025-12-03'),
(772, 'New Record inserted On purchase_items id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:38', '2025-12-03'),
(773, 'New Record inserted On purchase_item_serials id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:23:38', '2025-12-03'),
(774, 'New Record inserted On purchase id 120', 120, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:24:11', '2025-12-03'),
(775, 'New Record inserted On purchase_items id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:24:11', '2025-12-03'),
(776, 'New Record inserted On purchase_item_serials id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:24:12', '2025-12-03'),
(777, 'New Record inserted On purchase id 121', 121, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:26:31', '2025-12-03'),
(778, 'New Record inserted On purchase_items id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:26:31', '2025-12-03'),
(779, 'New Record inserted On purchase id 122', 122, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:27:40', '2025-12-03'),
(780, 'New Record inserted On purchase_items id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:27:42', '2025-12-03'),
(781, 'New Record inserted On purchase id 123', 123, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:30:37', '2025-12-03'),
(782, 'New Record inserted On purchase_items id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:30:38', '2025-12-03'),
(783, 'New Record inserted On purchase_item_serials id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:30:38', '2025-12-03'),
(784, 'New Record inserted On business_partner id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:31:59', '2025-12-03'),
(785, 'New Record inserted On purchase id 124', 124, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:31:59', '2025-12-03'),
(786, 'New Record inserted On purchase_items id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:31:59', '2025-12-03'),
(787, 'New Record inserted On purchase_item_serials id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 08:31:59', '2025-12-03'),
(788, 'New Record inserted On purchase id 125', 125, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:01:24', '2025-12-03'),
(789, 'New Record inserted On purchase_items id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:01:25', '2025-12-03'),
(790, 'New Record inserted On purchase_items id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:01:25', '2025-12-03'),
(791, 'New Record inserted On purchase_item_serials id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:01:25', '2025-12-03'),
(792, 'Record deleted On purchase_order_item_serials id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:32:27', '2025-12-03'),
(793, 'Record deleted On purchase_order_items id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:32:27', '2025-12-03'),
(794, 'Record deleted On purchase_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-03 09:32:27', '2025-12-03'),
(795, 'New Record inserted On purchase id 126', 126, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:21', '2025-12-04'),
(796, 'New Record inserted On purchase_items id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(797, 'New Record inserted On purchase_item_serials id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(798, 'New Record inserted On purchase_item_serials id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(799, 'New Record inserted On purchase_item_serials id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(800, 'New Record inserted On purchase_item_serials id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(801, 'New Record inserted On purchase_item_serials id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(802, 'New Record inserted On purchase_items id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 14:54:22', '2025-12-04'),
(803, 'New Record inserted On purchase id 127', 127, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:21:35', '2025-12-04'),
(804, 'New Record inserted On purchase_items id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:21:35', '2025-12-04'),
(805, 'New Record inserted On purchase_item_serials id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:21:35', '2025-12-04'),
(806, 'New Record inserted On purchase id 128', 128, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:22:46', '2025-12-04'),
(807, 'New Record inserted On purchase_items id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:22:46', '2025-12-04'),
(808, 'New Record inserted On purchase_item_serials id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:22:46', '2025-12-04'),
(809, 'New Record inserted On purchase id 129', 129, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:23:06', '2025-12-04'),
(810, 'New Record inserted On purchase_items id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:23:06', '2025-12-04'),
(811, 'New Record inserted On purchase_item_serials id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:23:06', '2025-12-04'),
(812, 'New Record inserted On inv_stock_item_serial id 164', 164, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:23:07', '2025-12-04'),
(813, 'New Record inserted On purchase id 130', 130, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:53', '2025-12-04'),
(814, 'New Record inserted On purchase_items id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:53', '2025-12-04'),
(815, 'New Record inserted On purchase_item_serials id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:53', '2025-12-04'),
(816, 'New Record inserted On purchase_item_serials id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:53', '2025-12-04'),
(817, 'New Record inserted On purchase_item_serials id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:53', '2025-12-04'),
(818, 'New Record inserted On purchase_items id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:53', '2025-12-04');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(819, 'New Record inserted On inv_stock_item_serial id 165', 165, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:54', '2025-12-04'),
(820, 'New Record inserted On inv_stock_item_serial id 166', 166, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:54', '2025-12-04'),
(821, 'New Record inserted On inv_stock_item_serial id 167', 167, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:50:54', '2025-12-04'),
(822, 'New Record inserted On sales id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:51:05', '2025-12-04'),
(823, 'New Record inserted On acc_general_ledger id 145', 145, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:51:05', '2025-12-04'),
(824, 'New Record inserted On sales_items id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:51:05', '2025-12-04'),
(825, 'New Record inserted On sales_item_batch_profit_loss id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 15:51:05', '2025-12-04'),
(826, 'New Record inserted On sales id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 16:46:43', '2025-12-04'),
(827, 'New Record inserted On acc_general_ledger id 146', 146, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 16:46:43', '2025-12-04'),
(828, 'New Record inserted On sales_items id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 16:46:43', '2025-12-04'),
(829, 'New Record inserted On sales_item_batch_profit_loss id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 16:46:43', '2025-12-04'),
(830, 'New Record inserted On sales id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 17:46:21', '2025-12-04'),
(831, 'New Record inserted On acc_general_ledger id 147', 147, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 17:46:21', '2025-12-04'),
(832, 'New Record inserted On sales_items id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 17:46:21', '2025-12-04'),
(833, 'New Record inserted On sales_item_batch_profit_loss id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 17:46:21', '2025-12-04'),
(834, 'New Record inserted On sales id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:49:43', '2025-12-05'),
(835, 'New Record inserted On acc_general_ledger id 148', 148, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:49:43', '2025-12-05'),
(836, 'New Record inserted On sales_items id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:49:44', '2025-12-05'),
(837, 'New Record inserted On sales id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:54:37', '2025-12-05'),
(838, 'New Record inserted On acc_general_ledger id 149', 149, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:54:37', '2025-12-05'),
(839, 'New Record inserted On sales id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:55:38', '2025-12-05'),
(840, 'New Record inserted On acc_general_ledger id 150', 150, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:55:38', '2025-12-05'),
(841, 'New Record inserted On sales_items id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:55:39', '2025-12-05'),
(842, 'New Record inserted On sales id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:55:50', '2025-12-05'),
(843, 'New Record inserted On acc_general_ledger id 151', 151, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:55:50', '2025-12-05'),
(844, 'New Record inserted On sales_items id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:55:50', '2025-12-05'),
(845, 'New Record inserted On purchase id 131', 131, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:57:30', '2025-12-05'),
(846, 'New Record inserted On purchase_items id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:57:30', '2025-12-05'),
(847, 'New Record inserted On purchase id 132', 132, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:57:59', '2025-12-05'),
(848, 'New Record inserted On purchase_items id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:57:59', '2025-12-05'),
(849, 'New Record inserted On purchase id 133', 133, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:58:55', '2025-12-05'),
(850, 'New Record inserted On purchase_items id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:58:55', '2025-12-05'),
(851, 'New Record inserted On purchase id 134', 134, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:59:17', '2025-12-05'),
(852, 'New Record inserted On purchase_items id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:59:18', '2025-12-05'),
(853, 'New Record inserted On purchase id 135', 135, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:59:41', '2025-12-05'),
(854, 'New Record inserted On purchase_items id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 18:59:41', '2025-12-05'),
(855, 'New Record inserted On purchase id 136', 136, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:00:35', '2025-12-05'),
(856, 'New Record inserted On purchase_items id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:00:35', '2025-12-05'),
(857, 'New Record inserted On purchase id 137', 137, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:00:43', '2025-12-05'),
(858, 'New Record inserted On purchase_items id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:00:44', '2025-12-05'),
(859, 'New Record inserted On purchase id 138', 138, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:01:17', '2025-12-05'),
(860, 'New Record inserted On purchase_items id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:01:17', '2025-12-05'),
(861, 'New Record inserted On purchase id 139', 139, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:01:43', '2025-12-05'),
(862, 'New Record inserted On purchase_items id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:01:43', '2025-12-05'),
(863, 'New Record inserted On inv_stock_item_batch id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:01:43', '2025-12-05'),
(864, 'New Record inserted On purchase id 140', 140, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:11', '2025-12-05'),
(865, 'New Record inserted On acc_general_ledger id 152', 152, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:11', '2025-12-05'),
(866, 'New Record inserted On acc_general_ledger id 153', 153, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:11', '2025-12-05'),
(867, 'New Record inserted On purchase_items id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:12', '2025-12-05'),
(868, 'New Record inserted On inv_stock_item_batch id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:12', '2025-12-05'),
(869, 'New Record inserted On sales id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:51', '2025-12-05'),
(870, 'New Record inserted On acc_general_ledger id 154', 154, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:51', '2025-12-05'),
(871, 'New Record inserted On sales_items id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:03:51', '2025-12-05'),
(872, 'New Record inserted On sales id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:04:05', '2025-12-05'),
(873, 'New Record inserted On acc_general_ledger id 155', 155, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:04:06', '2025-12-05'),
(874, 'New Record inserted On sales_items id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:04:06', '2025-12-05'),
(875, 'New Record inserted On sales_item_batch_profit_loss id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:04:06', '2025-12-05'),
(876, 'New Record inserted On sales id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:05:52', '2025-12-05'),
(877, 'New Record inserted On acc_general_ledger id 156', 156, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:05:52', '2025-12-05'),
(878, 'New Record inserted On sales_items id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:05:52', '2025-12-05'),
(879, 'New Record inserted On sales id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:07:08', '2025-12-05'),
(880, 'New Record inserted On acc_general_ledger id 157', 157, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:07:08', '2025-12-05'),
(881, 'New Record inserted On sales_items id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:07:08', '2025-12-05'),
(882, 'New Record inserted On purchase id 141', 141, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:11:48', '2025-12-05'),
(883, 'New Record inserted On acc_general_ledger id 158', 158, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:11:48', '2025-12-05'),
(884, 'New Record inserted On acc_general_ledger id 159', 159, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:11:48', '2025-12-05'),
(885, 'New Record inserted On purchase_items id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:11:48', '2025-12-05'),
(886, 'New Record inserted On inv_stock_item_batch id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-04 19:11:48', '2025-12-05'),
(887, 'New Record inserted On purchase id 142', 142, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:13', '2025-12-05'),
(888, 'New Record inserted On acc_general_ledger id 160', 160, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(889, 'New Record inserted On acc_general_ledger id 161', 161, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(890, 'New Record inserted On purchase_items id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(891, 'New Record inserted On purchase_items id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(892, 'New Record inserted On purchase_item_serials id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(893, 'New Record inserted On purchase_item_serials id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(894, 'New Record inserted On purchase_item_serials id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(895, 'New Record inserted On purchase_item_serials id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(896, 'New Record inserted On purchase_item_serials id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(897, 'New Record inserted On inv_stock_item_serial id 168', 168, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:14', '2025-12-05'),
(898, 'New Record inserted On inv_stock_item_serial id 169', 169, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:15', '2025-12-05'),
(899, 'New Record inserted On inv_stock_item_serial id 170', 170, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:15', '2025-12-05'),
(900, 'New Record inserted On inv_stock_item_serial id 171', 171, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:15', '2025-12-05'),
(901, 'New Record inserted On inv_stock_item_serial id 172', 172, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:15', '2025-12-05'),
(902, 'New Record inserted On inv_stock_item_batch id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:16', '2025-12-05'),
(903, 'New Record inserted On sales id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:39', '2025-12-05'),
(904, 'New Record inserted On acc_general_ledger id 162', 162, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:40', '2025-12-05'),
(905, 'New Record inserted On sales_items id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:40', '2025-12-05'),
(906, 'New Record inserted On sales_item_batch_profit_loss id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:40', '2025-12-05'),
(907, 'New Record inserted On sales_item_batch_profit_loss id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:40', '2025-12-05'),
(908, 'New Record inserted On sales_items id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:42', '2025-12-05'),
(909, 'New Record inserted On sales_item_batch_profit_loss id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:42:42', '2025-12-05'),
(910, 'New Record inserted On sales id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:43:16', '2025-12-05'),
(911, 'New Record inserted On acc_general_ledger id 163', 163, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:43:16', '2025-12-05'),
(912, 'New Record inserted On sales_items id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:43:16', '2025-12-05'),
(913, 'New Record inserted On sales_item_batch_profit_loss id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 04:43:16', '2025-12-05'),
(914, 'New Record inserted On sales id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 06:22:01', '2025-12-05'),
(915, 'New Record inserted On acc_general_ledger id 164', 164, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 06:22:01', '2025-12-05'),
(916, 'New Record inserted On purchase id 143', 143, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:55', '2025-12-05'),
(917, 'New Record inserted On acc_general_ledger id 165', 165, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:55', '2025-12-05'),
(918, 'New Record inserted On acc_general_ledger id 166', 166, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:55', '2025-12-05'),
(919, 'New Record inserted On purchase_items id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:55', '2025-12-05'),
(920, 'New Record inserted On purchase_items id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:55', '2025-12-05'),
(921, 'New Record inserted On purchase_item_serials id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:56', '2025-12-05'),
(922, 'New Record inserted On inv_stock_item_serial id 173', 173, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:56', '2025-12-05'),
(923, 'New Record inserted On inv_stock_item_batch id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:06:56', '2025-12-05'),
(924, 'New Record inserted On sales id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:08:00', '2025-12-05'),
(925, 'New Record inserted On acc_general_ledger id 167', 167, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:08:00', '2025-12-05'),
(926, 'New Record inserted On sales_items id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:08:00', '2025-12-05'),
(927, 'New Record inserted On sales_item_batch_profit_loss id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:08:00', '2025-12-05'),
(928, 'New Record inserted On sales_items id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:08:00', '2025-12-05'),
(929, 'New Record inserted On sales_item_batch_profit_loss id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-05 08:08:01', '2025-12-05'),
(930, 'New Record inserted On purchase id 144', 144, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:28', '2025-12-06'),
(931, 'New Record inserted On acc_general_ledger id 168', 168, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:28', '2025-12-06'),
(932, 'New Record inserted On acc_general_ledger id 169', 169, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:28', '2025-12-06'),
(933, 'New Record inserted On purchase_items id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:28', '2025-12-06'),
(934, 'New Record inserted On purchase_item_serials id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:29', '2025-12-06'),
(935, 'New Record inserted On purchase_item_serials id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:29', '2025-12-06'),
(936, 'New Record inserted On purchase_items id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:29', '2025-12-06'),
(937, 'New Record inserted On inv_stock_item_serial id 174', 174, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:29', '2025-12-06'),
(938, 'New Record inserted On inv_stock_item_serial id 175', 175, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:29', '2025-12-06'),
(939, 'New Record inserted On inv_stock_item_batch id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:40:30', '2025-12-06'),
(940, 'New Record inserted On sales id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:05', '2025-12-06'),
(941, 'New Record inserted On acc_general_ledger id 170', 170, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:05', '2025-12-06'),
(942, 'New Record inserted On sales_items id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:05', '2025-12-06'),
(943, 'New Record inserted On sales_item_batch_profit_loss id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:05', '2025-12-06'),
(944, 'New Record inserted On sales_items id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:06', '2025-12-06'),
(945, 'New Record inserted On sales_item_batch_profit_loss id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:06', '2025-12-06'),
(946, 'New Record inserted On menus id 26', 26, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:41:54', '2025-12-06'),
(947, 'New Record inserted On purchase id 145', 145, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:55', '2025-12-06'),
(948, 'New Record inserted On acc_general_ledger id 171', 171, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:55', '2025-12-06'),
(949, 'New Record inserted On acc_general_ledger id 172', 172, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:55', '2025-12-06'),
(950, 'New Record inserted On purchase_items id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:56', '2025-12-06'),
(951, 'New Record inserted On purchase_item_serials id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:56', '2025-12-06'),
(952, 'New Record inserted On purchase_item_serials id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:56', '2025-12-06'),
(953, 'New Record inserted On purchase_item_serials id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:56', '2025-12-06'),
(954, 'New Record inserted On purchase_items id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:56', '2025-12-06'),
(955, 'New Record inserted On inv_stock_item_serial id 176', 176, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:57', '2025-12-06'),
(956, 'New Record inserted On inv_stock_item_serial id 177', 177, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:57', '2025-12-06'),
(957, 'New Record inserted On inv_stock_item_serial id 178', 178, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:57', '2025-12-06'),
(958, 'New Record inserted On inv_stock_item_batch id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:52:57', '2025-12-06'),
(959, 'New Record inserted On sales id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:54:20', '2025-12-06'),
(960, 'New Record inserted On acc_general_ledger id 173', 173, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:54:20', '2025-12-06'),
(961, 'New Record inserted On sales_items id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:54:20', '2025-12-06'),
(962, 'New Record inserted On sales_item_batch_profit_loss id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:54:20', '2025-12-06'),
(963, 'New Record inserted On sales_items id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:54:21', '2025-12-06'),
(964, 'New Record inserted On sales_item_batch_profit_loss id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 05:54:21', '2025-12-06'),
(965, 'New Record inserted On sales id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:18:40', '2025-12-06'),
(966, 'New Record inserted On acc_general_ledger id 174', 174, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:18:40', '2025-12-06'),
(967, 'New Record inserted On sales_items id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:18:40', '2025-12-06'),
(968, 'New Record inserted On sales_item_batch_profit_loss id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:18:40', '2025-12-06'),
(969, 'New Record inserted On sales_items id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:18:41', '2025-12-06'),
(970, 'New Record inserted On sales_item_batch_profit_loss id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:18:41', '2025-12-06'),
(971, 'New Record inserted On sales id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:30:35', '2025-12-06'),
(972, 'New Record inserted On acc_general_ledger id 175', 175, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:30:35', '2025-12-06'),
(973, 'New Record inserted On sales_items id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:30:36', '2025-12-06'),
(974, 'New Record inserted On sales_item_batch_profit_loss id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:30:36', '2025-12-06'),
(975, 'New Record inserted On purchase id 146', 146, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:56:46', '2025-12-06'),
(976, 'New Record inserted On acc_general_ledger id 176', 176, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:56:46', '2025-12-06'),
(977, 'New Record inserted On acc_general_ledger id 177', 177, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:56:46', '2025-12-06'),
(978, 'New Record inserted On purchase_items id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:56:46', '2025-12-06'),
(979, 'New Record inserted On purchase_item_serials id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:56:46', '2025-12-06'),
(980, 'New Record inserted On inv_stock_item_serial id 179', 179, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:56:47', '2025-12-06'),
(981, 'New Record inserted On sales id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:57:02', '2025-12-06'),
(982, 'New Record inserted On acc_general_ledger id 178', 178, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:57:02', '2025-12-06'),
(983, 'New Record inserted On sales_items id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:57:02', '2025-12-06'),
(984, 'New Record inserted On sales_item_batch_profit_loss id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 06:57:03', '2025-12-06'),
(985, 'New Record inserted On purchase id 147', 147, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:13', '2025-12-06'),
(986, 'New Record inserted On acc_general_ledger id 179', 179, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:13', '2025-12-06'),
(987, 'New Record inserted On acc_general_ledger id 180', 180, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:13', '2025-12-06'),
(988, 'New Record inserted On purchase_items id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:13', '2025-12-06'),
(989, 'New Record inserted On purchase_items id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:13', '2025-12-06'),
(990, 'New Record inserted On purchase_item_serials id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:14', '2025-12-06'),
(991, 'New Record inserted On inv_stock_item_serial id 180', 180, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:14', '2025-12-06'),
(992, 'New Record inserted On inv_stock_item_batch id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:14', '2025-12-06'),
(993, 'New Record inserted On sales id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:54', '2025-12-06'),
(994, 'New Record inserted On acc_general_ledger id 181', 181, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:54', '2025-12-06'),
(995, 'New Record inserted On sales_items id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:55', '2025-12-06'),
(996, 'New Record inserted On sales_item_batch_profit_loss id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:55', '2025-12-06'),
(997, 'New Record inserted On sales_items id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:55', '2025-12-06'),
(998, 'New Record inserted On sales_item_batch_profit_loss id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:15:56', '2025-12-06'),
(999, 'New Record inserted On sales id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:18:38', '2025-12-06'),
(1000, 'New Record inserted On acc_general_ledger id 182', 182, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:18:38', '2025-12-06'),
(1001, 'New Record inserted On sales_items id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:18:39', '2025-12-06'),
(1002, 'New Record inserted On sales_item_batch_profit_loss id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:18:39', '2025-12-06'),
(1003, 'New Record inserted On sales id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:41:12', '2025-12-06'),
(1004, 'New Record inserted On acc_general_ledger id 183', 183, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:41:15', '2025-12-06'),
(1005, 'New Record inserted On sales_items id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:41:15', '2025-12-06'),
(1006, 'New Record inserted On sales_item_batch_profit_loss id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:41:16', '2025-12-06'),
(1010, 'New Record inserted On acc_general_ledger id 187', 187, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:53:50', '2025-12-06'),
(1011, 'New Record inserted On acc_general_ledger id 188', 188, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 10:53:50', '2025-12-06'),
(1012, 'New Record inserted On sales id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 11:15:14', '2025-12-06'),
(1013, 'New Record inserted On acc_general_ledger id 189', 189, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 11:15:15', '2025-12-06'),
(1014, 'New Record inserted On sales_items id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 11:15:15', '2025-12-06'),
(1015, 'New Record inserted On sales_item_batch_profit_loss id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 11:15:15', '2025-12-06'),
(1016, 'New Record inserted On acc_general_ledger id 190', 190, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 11:15:26', '2025-12-06'),
(1017, 'New Record inserted On menus id 27', 27, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 11:53:52', '2025-12-06'),
(1018, 'New Record inserted On purchase id 148', 148, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:53', '2025-12-06'),
(1019, 'New Record inserted On acc_general_ledger id 191', 191, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1020, 'New Record inserted On acc_general_ledger id 192', 192, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1021, 'New Record inserted On purchase_items id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1022, 'New Record inserted On purchase_item_serials id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1023, 'New Record inserted On purchase_item_serials id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1024, 'New Record inserted On purchase_item_serials id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1025, 'New Record inserted On purchase_item_serials id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1026, 'New Record inserted On purchase_item_serials id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1027, 'New Record inserted On purchase_items id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1028, 'New Record inserted On inv_stock_item_serial id 181', 181, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:55', '2025-12-06'),
(1029, 'New Record inserted On inv_stock_item_serial id 182', 182, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:56', '2025-12-06'),
(1030, 'New Record inserted On inv_stock_item_serial id 183', 183, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:56', '2025-12-06'),
(1031, 'New Record inserted On inv_stock_item_serial id 184', 184, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:56', '2025-12-06'),
(1032, 'New Record inserted On inv_stock_item_serial id 185', 185, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:56', '2025-12-06'),
(1033, 'New Record inserted On inv_stock_item_batch id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:38:56', '2025-12-06'),
(1034, 'New Record inserted On sales id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:28', '2025-12-06'),
(1035, 'New Record inserted On acc_general_ledger id 193', 193, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:28', '2025-12-06'),
(1036, 'New Record inserted On sales_items id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:28', '2025-12-06'),
(1037, 'New Record inserted On sales_item_batch_profit_loss id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:28', '2025-12-06'),
(1038, 'New Record inserted On sales_item_batch_profit_loss id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:29', '2025-12-06'),
(1039, 'New Record inserted On sales_items id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:29', '2025-12-06'),
(1040, 'New Record inserted On sales_item_batch_profit_loss id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 15:39:29', '2025-12-06'),
(1041, 'New Record inserted On purchase id 149', 149, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:19', '2025-12-06'),
(1042, 'New Record inserted On acc_general_ledger id 194', 194, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:19', '2025-12-06'),
(1043, 'New Record inserted On acc_general_ledger id 195', 195, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:19', '2025-12-06'),
(1044, 'New Record inserted On purchase_items id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:19', '2025-12-06'),
(1045, 'New Record inserted On inv_stock_item_batch id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:20', '2025-12-06'),
(1046, 'New Record inserted On sales id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:52', '2025-12-06'),
(1047, 'New Record inserted On acc_general_ledger id 196', 196, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:52', '2025-12-06'),
(1048, 'New Record inserted On sales_items id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:52', '2025-12-06'),
(1049, 'New Record inserted On sales_item_batch_profit_loss id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:06:52', '2025-12-06'),
(1050, 'New Record inserted On sales id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:08:29', '2025-12-06'),
(1051, 'New Record inserted On acc_general_ledger id 197', 197, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:08:29', '2025-12-06'),
(1052, 'New Record inserted On sales_items id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:08:29', '2025-12-06'),
(1053, 'New Record inserted On sales_item_batch_profit_loss id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:08:29', '2025-12-06'),
(1054, 'New Record inserted On sales id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:25:19', '2025-12-06'),
(1055, 'New Record inserted On acc_general_ledger id 198', 198, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:25:19', '2025-12-06'),
(1056, 'New Record inserted On sales_items id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:25:19', '2025-12-06'),
(1057, 'New Record inserted On sales_item_batch_profit_loss id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:25:20', '2025-12-06'),
(1058, 'New Record inserted On purchase id 150', 150, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:55', '2025-12-06'),
(1059, 'New Record inserted On acc_general_ledger id 199', 199, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:56', '2025-12-06'),
(1060, 'New Record inserted On acc_general_ledger id 200', 200, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:56', '2025-12-06'),
(1061, 'New Record inserted On purchase_items id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:56', '2025-12-06'),
(1062, 'New Record inserted On purchase_items id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:56', '2025-12-06'),
(1063, 'New Record inserted On inv_stock_item_batch id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:56', '2025-12-06'),
(1064, 'New Record inserted On inv_stock_item_batch id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:38:56', '2025-12-06'),
(1065, 'New Record inserted On sales id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:39:14', '2025-12-06'),
(1066, 'New Record inserted On acc_general_ledger id 201', 201, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:39:14', '2025-12-06'),
(1067, 'New Record inserted On sales_items id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:39:14', '2025-12-06'),
(1068, 'New Record inserted On sales_item_batch_profit_loss id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:39:15', '2025-12-06'),
(1069, 'New Record inserted On sales id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:53:39', '2025-12-06'),
(1070, 'New Record inserted On acc_general_ledger id 202', 202, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:53:39', '2025-12-06'),
(1071, 'New Record inserted On sales_items id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:53:40', '2025-12-06'),
(1072, 'New Record inserted On sales_item_batch_profit_loss id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-06 16:53:40', '2025-12-06'),
(1073, 'New Record inserted On menus id 28', 28, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 08:45:51', '2025-12-07'),
(1074, 'New Record inserted On acc_general_ledger id 203', 203, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:14:11', '2025-12-07'),
(1088, 'New Record inserted On acc_general_ledger id 217', 217, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:42:23', '2025-12-07'),
(1089, 'New Record inserted On acc_general_ledger id 218', 218, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:42:51', '2025-12-07'),
(1090, 'New Record inserted On acc_general_ledger id 219', 219, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:43:08', '2025-12-07'),
(1091, 'New Record inserted On acc_general_ledger id 220', 220, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:43:41', '2025-12-07'),
(1092, 'New Record inserted On acc_general_ledger id 221', 221, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:43:51', '2025-12-07'),
(1093, 'New Record inserted On acc_general_ledger id 222', 222, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:43:59', '2025-12-07'),
(1095, 'New Record inserted On acc_general_ledger id 224', 224, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:44:21', '2025-12-07'),
(1096, 'New Record inserted On acc_general_ledger id 225', 225, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:45:06', '2025-12-07'),
(1097, 'New Record inserted On acc_general_ledger id 226', 226, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:45:18', '2025-12-07'),
(1098, 'New Record inserted On acc_general_ledger id 227', 227, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 09:59:18', '2025-12-07'),
(1099, 'New Record inserted On acc_general_ledger id 228', 228, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:00:08', '2025-12-07'),
(1100, 'New Record inserted On acc_general_ledger id 229', 229, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:00:40', '2025-12-07'),
(1102, 'New Record inserted On acc_general_ledger id 231', 231, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:10:44', '2025-12-07'),
(1103, 'New Record inserted On acc_general_ledger id 232', 232, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:16:38', '2025-12-07'),
(1104, 'New Record inserted On acc_general_ledger id 233', 233, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:16:46', '2025-12-07'),
(1109, 'New Record inserted On acc_general_ledger id 238', 238, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:19:15', '2025-12-07');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1110, 'New Record inserted On purchase id 151', 151, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:01', '2025-12-07'),
(1111, 'New Record inserted On acc_general_ledger id 239', 239, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:01', '2025-12-07'),
(1112, 'New Record inserted On acc_general_ledger id 240', 240, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:01', '2025-12-07'),
(1113, 'New Record inserted On purchase_items id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:02', '2025-12-07'),
(1114, 'New Record inserted On purchase_items id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:02', '2025-12-07'),
(1115, 'New Record inserted On purchase_items id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:02', '2025-12-07'),
(1116, 'New Record inserted On purchase_item_serials id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:02', '2025-12-07'),
(1117, 'New Record inserted On purchase_item_serials id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:02', '2025-12-07'),
(1118, 'New Record inserted On purchase_item_serials id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:03', '2025-12-07'),
(1119, 'New Record inserted On inv_stock_item_serial id 186', 186, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:03', '2025-12-07'),
(1120, 'New Record inserted On inv_stock_item_serial id 187', 187, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:03', '2025-12-07'),
(1121, 'New Record inserted On inv_stock_item_serial id 188', 188, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:03', '2025-12-07'),
(1122, 'New Record inserted On inv_stock_item_batch id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:04', '2025-12-07'),
(1123, 'New Record inserted On inv_stock_item_batch id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:04', '2025-12-07'),
(1124, 'New Record inserted On sales id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:45', '2025-12-07'),
(1125, 'New Record inserted On acc_general_ledger id 241', 241, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:46', '2025-12-07'),
(1126, 'New Record inserted On sales_items id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:47', '2025-12-07'),
(1127, 'New Record inserted On sales_item_batch_profit_loss id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:47', '2025-12-07'),
(1128, 'New Record inserted On sales_item_batch_profit_loss id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:47', '2025-12-07'),
(1129, 'New Record inserted On sales_items id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:48', '2025-12-07'),
(1130, 'New Record inserted On sales_item_batch_profit_loss id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:35:48', '2025-12-07'),
(1131, 'New Record inserted On acc_general_ledger id 242', 242, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:36:10', '2025-12-07'),
(1132, 'New Record inserted On acc_general_ledger id 243', 243, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:36:38', '2025-12-07'),
(1133, 'New Record inserted On acc_general_ledger id 244', 244, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:39:05', '2025-12-07'),
(1134, 'New Record inserted On acc_general_ledger id 245', 245, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:39:17', '2025-12-07'),
(1135, 'New Record inserted On acc_general_ledger id 246', 246, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:39:30', '2025-12-07'),
(1137, 'New Record inserted On acc_general_ledger id 248', 248, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:40:16', '2025-12-07'),
(1138, 'New Record inserted On acc_general_ledger id 249', 249, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:42:17', '2025-12-07'),
(1139, 'New Record inserted On acc_general_ledger id 250', 250, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:42:55', '2025-12-07'),
(1140, 'New Record inserted On acc_general_ledger id 251', 251, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:43:57', '2025-12-07'),
(1141, 'New Record inserted On acc_general_ledger id 252', 252, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 10:44:05', '2025-12-07'),
(1142, 'New Record inserted On purchase id 152', 152, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:27', '2025-12-07'),
(1143, 'New Record inserted On acc_general_ledger id 253', 253, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:27', '2025-12-07'),
(1144, 'New Record inserted On acc_general_ledger id 254', 254, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:27', '2025-12-07'),
(1145, 'New Record inserted On purchase_items id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:27', '2025-12-07'),
(1146, 'New Record inserted On purchase_item_serials id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:28', '2025-12-07'),
(1147, 'New Record inserted On inv_stock_item_serial id 189', 189, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:28', '2025-12-07'),
(1148, 'New Record inserted On sales id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:39', '2025-12-07'),
(1149, 'New Record inserted On acc_general_ledger id 255', 255, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:39', '2025-12-07'),
(1150, 'New Record inserted On sales_items id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:39', '2025-12-07'),
(1151, 'New Record inserted On sales_item_batch_profit_loss id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:39', '2025-12-07'),
(1152, 'New Record inserted On acc_general_ledger id 256', 256, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:02:50', '2025-12-07'),
(1153, 'New Record inserted On purchase id 153', 153, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:37', '2025-12-07'),
(1154, 'New Record inserted On acc_general_ledger id 257', 257, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:37', '2025-12-07'),
(1155, 'New Record inserted On acc_general_ledger id 258', 258, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:37', '2025-12-07'),
(1156, 'New Record inserted On purchase_items id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:38', '2025-12-07'),
(1157, 'New Record inserted On purchase_item_serials id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:38', '2025-12-07'),
(1158, 'New Record inserted On inv_stock_item_serial id 190', 190, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:38', '2025-12-07'),
(1159, 'New Record inserted On sales id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:48', '2025-12-07'),
(1160, 'New Record inserted On acc_general_ledger id 259', 259, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:48', '2025-12-07'),
(1161, 'New Record inserted On sales_items id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:48', '2025-12-07'),
(1162, 'New Record inserted On sales_item_batch_profit_loss id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-07 16:05:48', '2025-12-07'),
(1163, 'New Record inserted On menus id 29', 29, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 08:38:19', '2025-12-09'),
(1164, 'New Record inserted On menus id 30', 30, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 08:38:58', '2025-12-09'),
(1165, 'New Record inserted On purchase id 154', 154, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:01:07', '2025-12-09'),
(1166, 'New Record inserted On acc_general_ledger id 260', 260, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:01:07', '2025-12-09'),
(1167, 'New Record inserted On acc_general_ledger id 261', 261, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:01:07', '2025-12-09'),
(1168, 'New Record inserted On purchase_items id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:01:07', '2025-12-09'),
(1169, 'New Record inserted On purchase_item_serials id 49', 49, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:01:07', '2025-12-09'),
(1170, 'New Record inserted On inv_stock_item_serial id 191', 191, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:01:07', '2025-12-09'),
(1171, 'New Record inserted On purchase id 155', 155, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:48', '2025-12-09'),
(1172, 'New Record inserted On acc_general_ledger id 262', 262, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:48', '2025-12-09'),
(1173, 'New Record inserted On acc_general_ledger id 263', 263, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:48', '2025-12-09'),
(1174, 'New Record inserted On purchase_items id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:48', '2025-12-09'),
(1175, 'New Record inserted On purchase_items id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:48', '2025-12-09'),
(1176, 'New Record inserted On purchase_item_serials id 50', 50, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:48', '2025-12-09'),
(1177, 'New Record inserted On inv_stock_item_serial id 192', 192, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:49', '2025-12-09'),
(1178, 'New Record inserted On inv_stock_item_batch id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:03:49', '2025-12-09'),
(1179, 'New Record inserted On purchase id 156', 156, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:29', '2025-12-09'),
(1180, 'New Record inserted On acc_general_ledger id 264', 264, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:30', '2025-12-09'),
(1181, 'New Record inserted On acc_general_ledger id 265', 265, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:30', '2025-12-09'),
(1182, 'New Record inserted On purchase_items id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:30', '2025-12-09'),
(1183, 'New Record inserted On purchase_item_serials id 51', 51, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:30', '2025-12-09'),
(1184, 'New Record inserted On purchase_item_serials id 52', 52, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1185, 'New Record inserted On purchase_item_serials id 53', 53, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1186, 'New Record inserted On purchase_items id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1187, 'New Record inserted On inv_stock_item_serial id 193', 193, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1188, 'New Record inserted On inv_stock_item_serial id 194', 194, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1189, 'New Record inserted On inv_stock_item_serial id 195', 195, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1190, 'New Record inserted On inv_stock_item_batch id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:23:31', '2025-12-09'),
(1191, 'New Record inserted On sales id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:24:11', '2025-12-09'),
(1192, 'New Record inserted On acc_general_ledger id 266', 266, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:24:11', '2025-12-09'),
(1193, 'New Record inserted On sales_items id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:24:11', '2025-12-09'),
(1194, 'New Record inserted On sales_item_batch_profit_loss id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 09:24:11', '2025-12-09'),
(1195, 'New Record inserted On acc_general_ledger id 267', 267, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 12:45:32', '2025-12-09'),
(1197, 'New Record inserted On acc_general_ledger id 269', 269, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 12:48:03', '2025-12-09'),
(1198, 'New Record inserted On acc_general_ledger id 270', 270, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 12:50:00', '2025-12-09'),
(1199, 'New Record inserted On acc_general_ledger id 271', 271, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 12:50:41', '2025-12-09'),
(1211, 'New Record inserted On acc_general_ledger id 283', 283, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-09 13:48:29', '2025-12-09'),
(1224, 'New Record inserted On acc_general_ledger id 296', 296, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:06:50', '2025-12-09'),
(1225, 'New Record inserted On acc_general_ledger id 297', 297, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:07:25', '2025-12-09'),
(1226, 'New Record inserted On acc_general_ledger id 298', 298, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:08:35', '2025-12-09'),
(1227, 'New Record inserted On acc_general_ledger id 299', 299, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:09:14', '2025-12-09'),
(1229, 'New Record inserted On acc_general_ledger id 301', 301, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:11:34', '2025-12-09'),
(1230, 'New Record inserted On acc_general_ledger id 302', 302, 17, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:12:00', '2025-12-09'),
(1231, 'New Record inserted On menus id 31', 31, 1, 'Insert', '127.0.0.1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0', '2025-12-09 14:30:40', '2025-12-09'),
(1232, 'New Record inserted On purchase id 157', 157, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 06:24:55', '2025-12-10'),
(1233, 'New Record inserted On acc_general_ledger id 303', 303, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 06:24:55', '2025-12-10'),
(1234, 'New Record inserted On acc_general_ledger id 304', 304, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 06:24:56', '2025-12-10'),
(1235, 'New Record inserted On purchase_items id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 06:24:56', '2025-12-10'),
(1236, 'New Record inserted On inv_stock_item_batch id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 06:24:56', '2025-12-10'),
(1237, 'New Record inserted On acc_general_ledger id 305', 305, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 09:11:34', '2025-12-10'),
(1238, 'Record deleted On sales_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:53:59', '2025-12-10'),
(1239, 'Record deleted On sales_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:54:01', '2025-12-10'),
(1240, 'Record deleted On sales_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:54:04', '2025-12-10'),
(1241, 'New Record inserted On purchase id 158', 158, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:55:51', '2025-12-10'),
(1242, 'New Record inserted On acc_general_ledger id 306', 306, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:55:52', '2025-12-10'),
(1243, 'New Record inserted On acc_general_ledger id 307', 307, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:55:52', '2025-12-10'),
(1244, 'New Record inserted On purchase_items id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:55:52', '2025-12-10'),
(1245, 'New Record inserted On purchase_item_serials id 54', 54, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:55:52', '2025-12-10'),
(1246, 'New Record inserted On inv_stock_item_serial id 196', 196, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 10:55:52', '2025-12-10'),
(1247, 'New Record inserted On purchase id 159', 159, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 11:03:18', '2025-12-10'),
(1248, 'New Record inserted On acc_general_ledger id 308', 308, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 11:03:18', '2025-12-10'),
(1249, 'New Record inserted On acc_general_ledger id 309', 309, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 11:03:19', '2025-12-10'),
(1250, 'New Record inserted On purchase_items id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 11:03:19', '2025-12-10'),
(1251, 'New Record inserted On inv_stock_item_batch id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-10 11:03:19', '2025-12-10'),
(1252, 'New Record inserted On business_partner id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:09:30', '2025-12-12'),
(1253, 'New Record inserted On purchase id 160', 160, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:39', '2025-12-12'),
(1254, 'New Record inserted On acc_general_ledger id 310', 310, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:39', '2025-12-12'),
(1255, 'New Record inserted On acc_general_ledger id 311', 311, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:39', '2025-12-12'),
(1256, 'New Record inserted On acc_general_ledger id 312', 312, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1257, 'New Record inserted On purchase_items id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1258, 'New Record inserted On purchase_item_serials id 55', 55, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1259, 'New Record inserted On purchase_item_serials id 56', 56, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1260, 'New Record inserted On purchase_item_serials id 57', 57, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1261, 'New Record inserted On inv_stock_item_serial id 197', 197, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1262, 'New Record inserted On inv_stock_item_serial id 198', 198, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1263, 'New Record inserted On inv_stock_item_serial id 199', 199, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:10:40', '2025-12-12'),
(1264, 'New Record inserted On purchase id 161', 161, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:21', '2025-12-12'),
(1265, 'New Record inserted On acc_general_ledger id 313', 313, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:21', '2025-12-12'),
(1266, 'New Record inserted On acc_general_ledger id 314', 314, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:21', '2025-12-12'),
(1267, 'New Record inserted On acc_general_ledger id 315', 315, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:21', '2025-12-12'),
(1268, 'New Record inserted On purchase_items id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:21', '2025-12-12'),
(1269, 'New Record inserted On purchase_item_serials id 58', 58, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:21', '2025-12-12'),
(1270, 'New Record inserted On inv_stock_item_serial id 200', 200, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:12:22', '2025-12-12'),
(1271, 'New Record inserted On purchase id 162', 162, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:14:32', '2025-12-12'),
(1272, 'New Record inserted On acc_general_ledger id 316', 316, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:14:32', '2025-12-12'),
(1273, 'New Record inserted On acc_general_ledger id 317', 317, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:14:32', '2025-12-12'),
(1274, 'New Record inserted On purchase_items id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:14:33', '2025-12-12'),
(1275, 'New Record inserted On inv_stock_item_batch id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:14:33', '2025-12-12'),
(1276, 'New Record inserted On acc_general_ledger id 318', 318, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:16:15', '2025-12-12'),
(1277, 'New Record inserted On acc_general_ledger id 319', 319, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:28:09', '2025-12-12'),
(1278, 'New Record inserted On acc_general_ledger id 320', 320, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:28:09', '2025-12-12'),
(1279, 'New Record inserted On purchase id 163', 163, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:20', '2025-12-12'),
(1280, 'New Record inserted On acc_general_ledger id 321', 321, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:20', '2025-12-12'),
(1281, 'New Record inserted On acc_general_ledger id 322', 322, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:20', '2025-12-12'),
(1282, 'New Record inserted On purchase_items id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:20', '2025-12-12'),
(1283, 'New Record inserted On purchase_item_serials id 59', 59, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:20', '2025-12-12'),
(1284, 'New Record inserted On purchase_item_serials id 60', 60, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:20', '2025-12-12'),
(1285, 'New Record inserted On inv_stock_item_serial id 201', 201, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:21', '2025-12-12'),
(1286, 'New Record inserted On inv_stock_item_serial id 202', 202, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:30:21', '2025-12-12'),
(1287, 'New Record inserted On acc_general_ledger id 323', 323, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:33:24', '2025-12-12'),
(1288, 'New Record inserted On acc_general_ledger id 324', 324, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 13:33:24', '2025-12-12'),
(1289, 'New Record inserted On sales id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:16:36', '2025-12-12'),
(1290, 'New Record inserted On acc_general_ledger id 325', 325, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:16:36', '2025-12-12'),
(1291, 'New Record inserted On sales_items id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:16:36', '2025-12-12'),
(1292, 'New Record inserted On sales_item_batch_profit_loss id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:16:36', '2025-12-12'),
(1293, 'New Record inserted On purchase id 164', 164, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:14', '2025-12-12'),
(1294, 'New Record inserted On acc_general_ledger id 326', 326, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:14', '2025-12-12'),
(1295, 'New Record inserted On acc_general_ledger id 327', 327, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:14', '2025-12-12'),
(1296, 'New Record inserted On purchase_items id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:14', '2025-12-12'),
(1297, 'New Record inserted On purchase_item_serials id 61', 61, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:14', '2025-12-12'),
(1298, 'New Record inserted On purchase_item_serials id 62', 62, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:14', '2025-12-12'),
(1299, 'New Record inserted On inv_stock_item_serial id 203', 203, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:15', '2025-12-12'),
(1300, 'New Record inserted On inv_stock_item_serial id 204', 204, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:22:15', '2025-12-12'),
(1301, 'New Record inserted On acc_general_ledger id 328', 328, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:23:22', '2025-12-12'),
(1302, 'New Record inserted On acc_general_ledger id 329', 329, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:23:22', '2025-12-12'),
(1303, 'New Record inserted On sales id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:24:38', '2025-12-12'),
(1304, 'New Record inserted On acc_general_ledger id 330', 330, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:24:38', '2025-12-12'),
(1305, 'New Record inserted On acc_general_ledger id 331', 331, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:24:38', '2025-12-12'),
(1306, 'New Record inserted On sales_items id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:24:39', '2025-12-12'),
(1307, 'New Record inserted On sales_item_batch_profit_loss id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:24:39', '2025-12-12'),
(1308, 'New Record inserted On acc_general_ledger id 332', 332, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:28:55', '2025-12-12'),
(1309, 'New Record inserted On acc_general_ledger id 333', 333, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:28:55', '2025-12-12'),
(1310, 'New Record inserted On acc_general_ledger id 334', 334, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:35:59', '2025-12-12'),
(1311, 'New Record inserted On acc_general_ledger id 335', 335, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:35:59', '2025-12-12'),
(1312, 'New Record inserted On menus id 32', 32, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:47:26', '2025-12-12'),
(1313, 'New Record inserted On menus id 33', 33, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 14:50:08', '2025-12-12'),
(1314, 'New Record inserted On sales id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:00:33', '2025-12-12'),
(1315, 'New Record inserted On acc_general_ledger id 336', 336, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:00:33', '2025-12-12'),
(1316, 'New Record inserted On sales_items id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:00:33', '2025-12-12'),
(1317, 'New Record inserted On sales_item_batch_profit_loss id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:00:33', '2025-12-12'),
(1318, 'New Record inserted On acc_general_ledger id 337', 337, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:02:23', '2025-12-12'),
(1319, 'New Record inserted On purchase id 165', 165, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:48', '2025-12-12'),
(1320, 'New Record inserted On acc_general_ledger id 338', 338, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:48', '2025-12-12'),
(1321, 'New Record inserted On purchase_items id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:49', '2025-12-12'),
(1322, 'New Record inserted On purchase_item_serials id 63', 63, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:49', '2025-12-12'),
(1323, 'New Record inserted On purchase_items id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:49', '2025-12-12'),
(1324, 'New Record inserted On inv_stock_item_serial id 205', 205, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:49', '2025-12-12'),
(1325, 'New Record inserted On inv_stock_item_batch id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:27:49', '2025-12-12'),
(1326, 'New Record inserted On sales id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:28:10', '2025-12-12'),
(1327, 'New Record inserted On acc_general_ledger id 339', 339, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:28:11', '2025-12-12'),
(1328, 'New Record inserted On sales_items id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:28:11', '2025-12-12'),
(1329, 'New Record inserted On sales_item_batch_profit_loss id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:28:11', '2025-12-12'),
(1330, 'New Record inserted On sales_items id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:28:11', '2025-12-12'),
(1331, 'New Record inserted On sales_item_batch_profit_loss id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 15:28:11', '2025-12-12'),
(1332, 'New Record inserted On purchase id 166', 166, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:17:49', '2025-12-12'),
(1333, 'New Record inserted On acc_general_ledger id 340', 340, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:17:50', '2025-12-12'),
(1334, 'New Record inserted On purchase_items id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:17:50', '2025-12-12'),
(1335, 'New Record inserted On inv_stock_item_batch id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:17:50', '2025-12-12'),
(1336, 'New Record inserted On sales id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:18:17', '2025-12-12'),
(1337, 'New Record inserted On acc_general_ledger id 341', 341, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:18:17', '2025-12-12'),
(1338, 'New Record inserted On sales_items id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:18:17', '2025-12-12'),
(1339, 'New Record inserted On sales_item_batch_profit_loss id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:18:17', '2025-12-12'),
(1340, 'New Record inserted On purchase id 167', 167, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:41', '2025-12-12'),
(1341, 'New Record inserted On acc_general_ledger id 342', 342, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:41', '2025-12-12'),
(1342, 'New Record inserted On purchase_items id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:41', '2025-12-12'),
(1343, 'New Record inserted On purchase_item_serials id 64', 64, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:41', '2025-12-12'),
(1344, 'New Record inserted On purchase_item_serials id 65', 65, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:41', '2025-12-12'),
(1345, 'New Record inserted On purchase_item_serials id 66', 66, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:42', '2025-12-12'),
(1346, 'New Record inserted On inv_stock_item_serial id 206', 206, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:42', '2025-12-12'),
(1347, 'New Record inserted On inv_stock_item_serial id 207', 207, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:42', '2025-12-12'),
(1348, 'New Record inserted On inv_stock_item_serial id 208', 208, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:29:42', '2025-12-12'),
(1349, 'New Record inserted On sales id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:30:01', '2025-12-12'),
(1350, 'New Record inserted On acc_general_ledger id 343', 343, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:30:01', '2025-12-12'),
(1351, 'New Record inserted On sales_items id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:30:02', '2025-12-12'),
(1352, 'New Record inserted On sales_item_batch_profit_loss id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:30:02', '2025-12-12'),
(1353, 'New Record inserted On sales_item_batch_profit_loss id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:30:02', '2025-12-12'),
(1354, 'New Record inserted On sales_item_batch_profit_loss id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-12 16:30:02', '2025-12-12'),
(1355, 'New Record inserted On purchase id 168', 168, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:13', '2025-12-13'),
(1356, 'New Record inserted On acc_general_ledger id 344', 344, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:13', '2025-12-13'),
(1357, 'New Record inserted On purchase_items id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:13', '2025-12-13'),
(1358, 'New Record inserted On purchase_item_serials id 67', 67, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:13', '2025-12-13'),
(1359, 'New Record inserted On purchase_item_serials id 68', 68, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:14', '2025-12-13'),
(1360, 'New Record inserted On purchase_item_serials id 69', 69, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:16', '2025-12-13'),
(1361, 'New Record inserted On purchase_item_serials id 70', 70, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:17', '2025-12-13'),
(1362, 'New Record inserted On inv_stock_item_serial id 209', 209, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:19', '2025-12-13'),
(1363, 'New Record inserted On inv_stock_item_serial id 210', 210, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:19', '2025-12-13'),
(1364, 'New Record inserted On inv_stock_item_serial id 211', 211, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:19', '2025-12-13'),
(1365, 'New Record inserted On inv_stock_item_serial id 212', 212, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:20', '2025-12-13'),
(1366, 'New Record inserted On sales id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:46', '2025-12-13'),
(1367, 'New Record inserted On acc_general_ledger id 345', 345, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:47', '2025-12-13'),
(1368, 'New Record inserted On sales_items id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:50', '2025-12-13'),
(1369, 'New Record inserted On sales_item_batch_profit_loss id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:50', '2025-12-13'),
(1370, 'New Record inserted On sales_item_batch_profit_loss id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:50', '2025-12-13'),
(1371, 'New Record inserted On sales_item_batch_profit_loss id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 06:47:51', '2025-12-13'),
(1376, 'New Record inserted On acc_general_ledger id 350', 350, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:32:37', '2025-12-13'),
(1377, 'New Record inserted On business_partner id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:42:58', '2025-12-13'),
(1378, 'New Record inserted On acc_general_ledger id 351', 351, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:42:58', '2025-12-13'),
(1379, 'New Record inserted On business_partner id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:44:00', '2025-12-13'),
(1380, 'New Record inserted On acc_general_ledger id 352', 352, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:44:00', '2025-12-13'),
(1381, 'New Record inserted On business_partner id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:44:43', '2025-12-13'),
(1382, 'New Record inserted On acc_general_ledger id 353', 353, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:44:43', '2025-12-13'),
(1383, 'New Record inserted On business_partner id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:44:52', '2025-12-13'),
(1384, 'New Record inserted On acc_general_ledger id 354', 354, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 09:44:52', '2025-12-13'),
(1385, 'New Record inserted On partner_groups id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:10:53', '2025-12-13'),
(1386, 'Record deleted On partner_groups id 1', 1, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:11:10', '2025-12-13'),
(1387, 'Record deleted On partner_groups id 1', 1, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:12:50', '2025-12-13'),
(1388, 'New Record inserted On business_partner id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:15:19', '2025-12-13'),
(1389, 'New Record inserted On acc_general_ledger id 355', 355, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:15:20', '2025-12-13'),
(1390, 'New Record inserted On purchase id 169', 169, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:26:46', '2025-12-13'),
(1391, 'New Record inserted On acc_general_ledger id 356', 356, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:26:47', '2025-12-13'),
(1392, 'New Record inserted On acc_general_ledger id 357', 357, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:26:47', '2025-12-13'),
(1393, 'New Record inserted On purchase_items id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:26:47', '2025-12-13'),
(1394, 'New Record inserted On purchase_item_serials id 71', 71, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:26:47', '2025-12-13'),
(1395, 'New Record inserted On inv_stock_item_serial id 213', 213, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:26:48', '2025-12-13'),
(1396, 'New Record inserted On purchase id 170', 170, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:36:35', '2025-12-13'),
(1397, 'New Record inserted On acc_general_ledger id 358', 358, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:36:35', '2025-12-13'),
(1398, 'New Record inserted On acc_general_ledger id 359', 359, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:36:35', '2025-12-13'),
(1399, 'New Record inserted On acc_general_ledger id 360', 360, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:36:35', '2025-12-13'),
(1400, 'New Record inserted On purchase_items id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:36:35', '2025-12-13'),
(1401, 'New Record inserted On inv_stock_item_batch id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:36:35', '2025-12-13'),
(1402, 'New Record inserted On acc_general_ledger id 361', 361, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:38:28', '2025-12-13'),
(1403, 'New Record inserted On acc_general_ledger id 362', 362, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:38:28', '2025-12-13'),
(1404, 'New Record inserted On sales id 112', 112, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:42:58', '2025-12-13'),
(1405, 'New Record inserted On acc_general_ledger id 363', 363, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:42:58', '2025-12-13');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1406, 'New Record inserted On sales_items id 112', 112, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:42:58', '2025-12-13'),
(1407, 'New Record inserted On sales_item_batch_profit_loss id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:42:58', '2025-12-13'),
(1408, 'New Record inserted On acc_general_ledger id 364', 364, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:45:38', '2025-12-13'),
(1409, 'New Record inserted On acc_general_ledger id 365', 365, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:45:38', '2025-12-13'),
(1410, 'New Record inserted On menus id 34', 34, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 10:49:27', '2025-12-13'),
(1411, 'New Record inserted On products id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 15:35:24', '2025-12-13'),
(1412, 'New Record inserted On products id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 15:35:56', '2025-12-13'),
(1413, 'New Record inserted On business_partner id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 17:11:07', '2025-12-13'),
(1414, 'New Record inserted On menus id 35', 35, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 17:15:41', '2025-12-13'),
(1415, 'New Record inserted On menus id 36', 36, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 17:18:45', '2025-12-13'),
(1416, 'New Record inserted On menus id 37', 37, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-13 17:19:07', '2025-12-13'),
(1417, 'New Record inserted On purchase id 171', 171, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:56:17', '2025-12-14'),
(1418, 'New Record inserted On acc_general_ledger id 366', 366, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:56:17', '2025-12-14'),
(1419, 'New Record inserted On purchase id 172', 172, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:56:55', '2025-12-14'),
(1420, 'New Record inserted On acc_general_ledger id 367', 367, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:56:55', '2025-12-14'),
(1421, 'New Record inserted On purchase id 173', 173, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:03', '2025-12-14'),
(1422, 'New Record inserted On acc_general_ledger id 368', 368, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:03', '2025-12-14'),
(1423, 'New Record inserted On purchase id 174', 174, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:11', '2025-12-14'),
(1424, 'New Record inserted On acc_general_ledger id 369', 369, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:13', '2025-12-14'),
(1425, 'New Record inserted On purchase id 175', 175, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:23', '2025-12-14'),
(1426, 'New Record inserted On acc_general_ledger id 370', 370, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:24', '2025-12-14'),
(1427, 'New Record inserted On purchase id 176', 176, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:34', '2025-12-14'),
(1428, 'New Record inserted On acc_general_ledger id 371', 371, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:34', '2025-12-14'),
(1429, 'New Record inserted On purchase id 177', 177, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:51', '2025-12-14'),
(1430, 'New Record inserted On acc_general_ledger id 372', 372, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:57:52', '2025-12-14'),
(1431, 'New Record inserted On purchase id 178', 178, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:03', '2025-12-14'),
(1432, 'New Record inserted On acc_general_ledger id 373', 373, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:04', '2025-12-14'),
(1433, 'New Record inserted On purchase id 179', 179, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:52', '2025-12-14'),
(1434, 'New Record inserted On acc_general_ledger id 374', 374, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:52', '2025-12-14'),
(1435, 'New Record inserted On purchase id 180', 180, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:53', '2025-12-14'),
(1436, 'New Record inserted On acc_general_ledger id 375', 375, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:53', '2025-12-14'),
(1437, 'New Record inserted On purchase id 181', 181, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:53', '2025-12-14'),
(1438, 'New Record inserted On acc_general_ledger id 376', 376, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:55', '2025-12-14'),
(1439, 'New Record inserted On purchase id 182', 182, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:56', '2025-12-14'),
(1440, 'New Record inserted On acc_general_ledger id 377', 377, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:56', '2025-12-14'),
(1441, 'New Record inserted On purchase id 183', 183, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1442, 'New Record inserted On acc_general_ledger id 378', 378, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1443, 'New Record inserted On purchase id 184', 184, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1444, 'New Record inserted On acc_general_ledger id 379', 379, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1445, 'New Record inserted On purchase id 185', 185, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1446, 'New Record inserted On acc_general_ledger id 380', 380, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1447, 'New Record inserted On purchase id 186', 186, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:57', '2025-12-14'),
(1448, 'New Record inserted On acc_general_ledger id 381', 381, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:58', '2025-12-14'),
(1449, 'New Record inserted On purchase id 187', 187, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:58', '2025-12-14'),
(1450, 'New Record inserted On acc_general_ledger id 382', 382, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:58', '2025-12-14'),
(1451, 'New Record inserted On purchase id 188', 188, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:58', '2025-12-14'),
(1452, 'New Record inserted On acc_general_ledger id 383', 383, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:58', '2025-12-14'),
(1453, 'New Record inserted On purchase id 189', 189, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:59', '2025-12-14'),
(1454, 'New Record inserted On acc_general_ledger id 384', 384, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:59', '2025-12-14'),
(1455, 'New Record inserted On purchase id 190', 190, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:59', '2025-12-14'),
(1456, 'New Record inserted On acc_general_ledger id 385', 385, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:58:59', '2025-12-14'),
(1457, 'New Record inserted On purchase id 191', 191, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:00', '2025-12-14'),
(1458, 'New Record inserted On acc_general_ledger id 386', 386, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:01', '2025-12-14'),
(1459, 'New Record inserted On purchase id 192', 192, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:01', '2025-12-14'),
(1460, 'New Record inserted On acc_general_ledger id 387', 387, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:01', '2025-12-14'),
(1461, 'New Record inserted On purchase id 193', 193, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:01', '2025-12-14'),
(1462, 'New Record inserted On acc_general_ledger id 388', 388, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:01', '2025-12-14'),
(1463, 'New Record inserted On purchase id 194', 194, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:01', '2025-12-14'),
(1464, 'New Record inserted On acc_general_ledger id 389', 389, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:02', '2025-12-14'),
(1465, 'New Record inserted On purchase id 195', 195, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:02', '2025-12-14'),
(1466, 'New Record inserted On acc_general_ledger id 390', 390, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:02', '2025-12-14'),
(1467, 'New Record inserted On purchase id 196', 196, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:02', '2025-12-14'),
(1468, 'New Record inserted On acc_general_ledger id 391', 391, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:02', '2025-12-14'),
(1469, 'New Record inserted On purchase id 197', 197, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:03', '2025-12-14'),
(1470, 'New Record inserted On acc_general_ledger id 392', 392, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:03', '2025-12-14'),
(1471, 'New Record inserted On purchase id 198', 198, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:03', '2025-12-14'),
(1472, 'New Record inserted On acc_general_ledger id 393', 393, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:03', '2025-12-14'),
(1473, 'New Record inserted On purchase id 199', 199, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:05', '2025-12-14'),
(1474, 'New Record inserted On acc_general_ledger id 394', 394, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:10', '2025-12-14'),
(1475, 'New Record inserted On purchase id 200', 200, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:10', '2025-12-14'),
(1476, 'New Record inserted On acc_general_ledger id 395', 395, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:10', '2025-12-14'),
(1477, 'New Record inserted On purchase id 201', 201, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:10', '2025-12-14'),
(1478, 'New Record inserted On acc_general_ledger id 396', 396, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:11', '2025-12-14'),
(1479, 'New Record inserted On purchase id 202', 202, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:11', '2025-12-14'),
(1480, 'New Record inserted On acc_general_ledger id 397', 397, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:11', '2025-12-14'),
(1481, 'New Record inserted On purchase id 203', 203, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:11', '2025-12-14'),
(1482, 'New Record inserted On acc_general_ledger id 398', 398, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:11', '2025-12-14'),
(1483, 'New Record inserted On purchase id 204', 204, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:11', '2025-12-14'),
(1484, 'New Record inserted On acc_general_ledger id 399', 399, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:12', '2025-12-14'),
(1485, 'New Record inserted On purchase id 205', 205, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:12', '2025-12-14'),
(1486, 'New Record inserted On acc_general_ledger id 400', 400, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:18', '2025-12-14'),
(1487, 'New Record inserted On purchase id 206', 206, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:20', '2025-12-14'),
(1488, 'New Record inserted On acc_general_ledger id 401', 401, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:20', '2025-12-14'),
(1489, 'New Record inserted On purchase id 207', 207, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:23', '2025-12-14'),
(1490, 'New Record inserted On acc_general_ledger id 402', 402, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:23', '2025-12-14'),
(1491, 'New Record inserted On purchase id 208', 208, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:24', '2025-12-14'),
(1492, 'New Record inserted On acc_general_ledger id 403', 403, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:24', '2025-12-14'),
(1493, 'New Record inserted On purchase id 209', 209, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:24', '2025-12-14'),
(1494, 'New Record inserted On acc_general_ledger id 404', 404, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:24', '2025-12-14'),
(1495, 'New Record inserted On purchase id 210', 210, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:24', '2025-12-14'),
(1496, 'New Record inserted On acc_general_ledger id 405', 405, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:24', '2025-12-14'),
(1497, 'New Record inserted On purchase id 211', 211, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:25', '2025-12-14'),
(1498, 'New Record inserted On acc_general_ledger id 406', 406, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:25', '2025-12-14'),
(1499, 'New Record inserted On purchase id 212', 212, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:25', '2025-12-14'),
(1500, 'New Record inserted On acc_general_ledger id 407', 407, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:25', '2025-12-14'),
(1501, 'New Record inserted On purchase id 213', 213, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:25', '2025-12-14'),
(1502, 'New Record inserted On acc_general_ledger id 408', 408, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:26', '2025-12-14'),
(1503, 'New Record inserted On purchase id 214', 214, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:26', '2025-12-14'),
(1504, 'New Record inserted On acc_general_ledger id 409', 409, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:26', '2025-12-14'),
(1505, 'New Record inserted On purchase id 215', 215, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:27', '2025-12-14'),
(1506, 'New Record inserted On acc_general_ledger id 410', 410, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:27', '2025-12-14'),
(1507, 'New Record inserted On purchase id 216', 216, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:27', '2025-12-14'),
(1508, 'New Record inserted On acc_general_ledger id 411', 411, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:27', '2025-12-14'),
(1509, 'New Record inserted On purchase id 217', 217, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:27', '2025-12-14'),
(1510, 'New Record inserted On acc_general_ledger id 412', 412, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:28', '2025-12-14'),
(1511, 'New Record inserted On purchase id 218', 218, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:28', '2025-12-14'),
(1512, 'New Record inserted On acc_general_ledger id 413', 413, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:28', '2025-12-14'),
(1513, 'New Record inserted On purchase id 219', 219, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:28', '2025-12-14'),
(1514, 'New Record inserted On acc_general_ledger id 414', 414, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:28', '2025-12-14'),
(1515, 'New Record inserted On purchase id 220', 220, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:28', '2025-12-14'),
(1516, 'New Record inserted On acc_general_ledger id 415', 415, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:29', '2025-12-14'),
(1517, 'New Record inserted On purchase id 221', 221, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:29', '2025-12-14'),
(1518, 'New Record inserted On acc_general_ledger id 416', 416, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:29', '2025-12-14'),
(1519, 'New Record inserted On purchase id 222', 222, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:29', '2025-12-14'),
(1520, 'New Record inserted On acc_general_ledger id 417', 417, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:29', '2025-12-14'),
(1521, 'New Record inserted On purchase id 223', 223, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:30', '2025-12-14'),
(1522, 'New Record inserted On acc_general_ledger id 418', 418, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:30', '2025-12-14'),
(1523, 'New Record inserted On purchase id 224', 224, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:30', '2025-12-14'),
(1524, 'New Record inserted On acc_general_ledger id 419', 419, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:30', '2025-12-14'),
(1525, 'New Record inserted On purchase id 225', 225, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:30', '2025-12-14'),
(1526, 'New Record inserted On acc_general_ledger id 420', 420, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:31', '2025-12-14'),
(1527, 'New Record inserted On purchase id 226', 226, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:32', '2025-12-14'),
(1528, 'New Record inserted On acc_general_ledger id 421', 421, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:32', '2025-12-14'),
(1529, 'New Record inserted On purchase id 227', 227, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:35', '2025-12-14'),
(1530, 'New Record inserted On acc_general_ledger id 422', 422, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:40', '2025-12-14'),
(1531, 'New Record inserted On purchase id 228', 228, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:41', '2025-12-14'),
(1532, 'New Record inserted On acc_general_ledger id 423', 423, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:42', '2025-12-14'),
(1533, 'New Record inserted On purchase id 229', 229, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:43', '2025-12-14'),
(1534, 'New Record inserted On acc_general_ledger id 424', 424, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:44', '2025-12-14'),
(1535, 'New Record inserted On purchase id 230', 230, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:46', '2025-12-14'),
(1536, 'New Record inserted On acc_general_ledger id 425', 425, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:47', '2025-12-14'),
(1537, 'New Record inserted On purchase id 231', 231, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:48', '2025-12-14'),
(1538, 'New Record inserted On acc_general_ledger id 426', 426, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:48', '2025-12-14'),
(1539, 'New Record inserted On purchase id 232', 232, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:48', '2025-12-14'),
(1540, 'New Record inserted On acc_general_ledger id 427', 427, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:48', '2025-12-14'),
(1541, 'New Record inserted On purchase id 233', 233, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:53', '2025-12-14'),
(1542, 'New Record inserted On acc_general_ledger id 428', 428, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:53', '2025-12-14'),
(1543, 'New Record inserted On purchase id 234', 234, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:53', '2025-12-14'),
(1544, 'New Record inserted On acc_general_ledger id 429', 429, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:53', '2025-12-14'),
(1545, 'New Record inserted On purchase id 235', 235, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:54', '2025-12-14'),
(1546, 'New Record inserted On acc_general_ledger id 430', 430, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:55', '2025-12-14'),
(1547, 'New Record inserted On purchase id 236', 236, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:55', '2025-12-14'),
(1548, 'New Record inserted On acc_general_ledger id 431', 431, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:55', '2025-12-14'),
(1549, 'New Record inserted On purchase id 237', 237, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:57', '2025-12-14'),
(1550, 'New Record inserted On acc_general_ledger id 432', 432, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 05:59:59', '2025-12-14'),
(1551, 'New Record inserted On purchase id 238', 238, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:00', '2025-12-14'),
(1552, 'New Record inserted On acc_general_ledger id 433', 433, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:00', '2025-12-14'),
(1553, 'New Record inserted On purchase id 239', 239, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:00', '2025-12-14'),
(1554, 'New Record inserted On acc_general_ledger id 434', 434, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:00', '2025-12-14'),
(1555, 'New Record inserted On purchase id 240', 240, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:01', '2025-12-14'),
(1556, 'New Record inserted On acc_general_ledger id 435', 435, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:01', '2025-12-14'),
(1557, 'New Record inserted On purchase id 241', 241, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1558, 'New Record inserted On acc_general_ledger id 436', 436, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1559, 'New Record inserted On purchase id 242', 242, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1560, 'New Record inserted On acc_general_ledger id 437', 437, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1561, 'New Record inserted On purchase id 243', 243, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1562, 'New Record inserted On acc_general_ledger id 438', 438, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1563, 'New Record inserted On purchase id 244', 244, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:02', '2025-12-14'),
(1564, 'New Record inserted On acc_general_ledger id 439', 439, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:03', '2025-12-14'),
(1565, 'New Record inserted On purchase id 245', 245, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:03', '2025-12-14'),
(1566, 'New Record inserted On acc_general_ledger id 440', 440, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:03', '2025-12-14'),
(1567, 'New Record inserted On purchase id 246', 246, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:03', '2025-12-14'),
(1568, 'New Record inserted On acc_general_ledger id 441', 441, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:03', '2025-12-14'),
(1569, 'New Record inserted On purchase id 247', 247, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:04', '2025-12-14'),
(1570, 'New Record inserted On acc_general_ledger id 442', 442, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:04', '2025-12-14'),
(1571, 'New Record inserted On purchase id 248', 248, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:04', '2025-12-14'),
(1572, 'New Record inserted On acc_general_ledger id 443', 443, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:04', '2025-12-14'),
(1573, 'New Record inserted On purchase id 249', 249, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:06', '2025-12-14'),
(1574, 'New Record inserted On acc_general_ledger id 444', 444, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:06', '2025-12-14'),
(1575, 'New Record inserted On purchase id 250', 250, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:06', '2025-12-14'),
(1576, 'New Record inserted On acc_general_ledger id 445', 445, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:06', '2025-12-14'),
(1577, 'New Record inserted On purchase id 251', 251, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:07', '2025-12-14'),
(1578, 'New Record inserted On acc_general_ledger id 446', 446, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:08', '2025-12-14'),
(1579, 'New Record inserted On purchase id 252', 252, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:09', '2025-12-14'),
(1580, 'New Record inserted On acc_general_ledger id 447', 447, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:10', '2025-12-14'),
(1581, 'New Record inserted On purchase id 253', 253, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:14', '2025-12-14'),
(1582, 'New Record inserted On acc_general_ledger id 448', 448, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:14', '2025-12-14'),
(1583, 'New Record inserted On purchase id 254', 254, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:14', '2025-12-14'),
(1584, 'New Record inserted On acc_general_ledger id 449', 449, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:14', '2025-12-14'),
(1585, 'New Record inserted On purchase id 255', 255, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:14', '2025-12-14'),
(1586, 'New Record inserted On acc_general_ledger id 450', 450, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:15', '2025-12-14'),
(1587, 'New Record inserted On purchase id 256', 256, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:15', '2025-12-14'),
(1588, 'New Record inserted On acc_general_ledger id 451', 451, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:15', '2025-12-14'),
(1589, 'New Record inserted On purchase id 257', 257, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:15', '2025-12-14'),
(1590, 'New Record inserted On acc_general_ledger id 452', 452, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:16', '2025-12-14'),
(1591, 'New Record inserted On purchase id 258', 258, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:16', '2025-12-14'),
(1592, 'New Record inserted On acc_general_ledger id 453', 453, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:16', '2025-12-14'),
(1593, 'New Record inserted On purchase id 259', 259, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:18', '2025-12-14'),
(1594, 'New Record inserted On acc_general_ledger id 454', 454, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:19', '2025-12-14'),
(1595, 'New Record inserted On purchase id 260', 260, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:19', '2025-12-14'),
(1596, 'New Record inserted On acc_general_ledger id 455', 455, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:19', '2025-12-14'),
(1597, 'New Record inserted On purchase id 261', 261, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:20', '2025-12-14'),
(1598, 'New Record inserted On acc_general_ledger id 456', 456, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:20', '2025-12-14'),
(1599, 'New Record inserted On purchase id 262', 262, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:21', '2025-12-14'),
(1600, 'New Record inserted On acc_general_ledger id 457', 457, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:22', '2025-12-14'),
(1601, 'New Record inserted On purchase id 263', 263, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:22', '2025-12-14'),
(1602, 'New Record inserted On acc_general_ledger id 458', 458, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:22', '2025-12-14'),
(1603, 'New Record inserted On purchase id 264', 264, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:23', '2025-12-14'),
(1604, 'New Record inserted On acc_general_ledger id 459', 459, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:23', '2025-12-14'),
(1605, 'New Record inserted On purchase id 265', 265, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:23', '2025-12-14'),
(1606, 'New Record inserted On acc_general_ledger id 460', 460, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:23', '2025-12-14'),
(1607, 'New Record inserted On purchase id 266', 266, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:23', '2025-12-14'),
(1608, 'New Record inserted On acc_general_ledger id 461', 461, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:24', '2025-12-14'),
(1609, 'New Record inserted On purchase id 267', 267, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:24', '2025-12-14'),
(1610, 'New Record inserted On acc_general_ledger id 462', 462, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:24', '2025-12-14'),
(1611, 'New Record inserted On purchase id 268', 268, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:25', '2025-12-14'),
(1612, 'New Record inserted On acc_general_ledger id 463', 463, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:26', '2025-12-14'),
(1613, 'New Record inserted On purchase id 269', 269, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:26', '2025-12-14'),
(1614, 'New Record inserted On acc_general_ledger id 464', 464, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:26', '2025-12-14'),
(1615, 'New Record inserted On purchase id 270', 270, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:26', '2025-12-14'),
(1616, 'New Record inserted On acc_general_ledger id 465', 465, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:26', '2025-12-14'),
(1617, 'New Record inserted On purchase id 271', 271, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:26', '2025-12-14'),
(1618, 'New Record inserted On acc_general_ledger id 466', 466, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:27', '2025-12-14'),
(1619, 'New Record inserted On purchase id 272', 272, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:27', '2025-12-14'),
(1620, 'New Record inserted On acc_general_ledger id 467', 467, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:27', '2025-12-14'),
(1621, 'New Record inserted On purchase id 273', 273, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:33', '2025-12-14'),
(1622, 'New Record inserted On acc_general_ledger id 468', 468, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:00:37', '2025-12-14'),
(1623, 'New Record inserted On purchase id 274', 274, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:07:43', '2025-12-14'),
(1624, 'New Record inserted On acc_general_ledger id 469', 469, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:07:43', '2025-12-14'),
(1625, 'New Record inserted On purchase id 275', 275, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:08:01', '2025-12-14'),
(1626, 'New Record inserted On acc_general_ledger id 470', 470, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:08:01', '2025-12-14'),
(1627, 'New Record inserted On purchase id 276', 276, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:08:34', '2025-12-14'),
(1628, 'New Record inserted On acc_general_ledger id 471', 471, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:08:35', '2025-12-14'),
(1629, 'New Record inserted On purchase id 277', 277, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:13:13', '2025-12-14'),
(1630, 'New Record inserted On acc_general_ledger id 472', 472, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:13:14', '2025-12-14'),
(1631, 'New Record inserted On purchase id 278', 278, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:13:28', '2025-12-14'),
(1632, 'New Record inserted On acc_general_ledger id 473', 473, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:13:28', '2025-12-14'),
(1633, 'New Record inserted On purchase_items id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:13:28', '2025-12-14'),
(1634, 'New Record inserted On inv_stock_item_batch id 32', 32, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:13:28', '2025-12-14'),
(1635, 'New Record inserted On purchase id 279', 279, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:27', '2025-12-14'),
(1636, 'New Record inserted On acc_general_ledger id 474', 474, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:27', '2025-12-14'),
(1637, 'New Record inserted On purchase_items id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:27', '2025-12-14'),
(1638, 'New Record inserted On purchase_item_serials id 72', 72, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:27', '2025-12-14'),
(1639, 'New Record inserted On purchase_item_serials id 73', 73, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:28', '2025-12-14'),
(1640, 'New Record inserted On purchase_items id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:28', '2025-12-14'),
(1641, 'New Record inserted On purchase_items id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:28', '2025-12-14'),
(1642, 'New Record inserted On inv_stock_item_serial id 214', 214, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:28', '2025-12-14'),
(1643, 'New Record inserted On inv_stock_item_serial id 215', 215, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:28', '2025-12-14'),
(1644, 'New Record inserted On inv_stock_item_batch id 33', 33, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:28', '2025-12-14'),
(1645, 'New Record inserted On inv_stock_item_batch id 34', 34, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 06:18:29', '2025-12-14'),
(1646, 'New Record inserted On purchase id 280', 280, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:03:46', '2025-12-14'),
(1647, 'New Record inserted On acc_general_ledger id 475', 475, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:03:47', '2025-12-14'),
(1648, 'New Record inserted On acc_general_ledger id 476', 476, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:03:47', '2025-12-14'),
(1649, 'New Record inserted On purchase_items id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:03:47', '2025-12-14'),
(1650, 'New Record inserted On inv_stock_item_batch id 35', 35, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:03:47', '2025-12-14'),
(1651, 'New Record inserted On purchase id 281', 281, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:11', '2025-12-14'),
(1652, 'New Record inserted On acc_general_ledger id 477', 477, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:11', '2025-12-14'),
(1653, 'New Record inserted On purchase_items id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:12', '2025-12-14'),
(1654, 'New Record inserted On purchase_item_serials id 74', 74, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:12', '2025-12-14'),
(1655, 'New Record inserted On purchase_item_serials id 75', 75, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:12', '2025-12-14'),
(1656, 'New Record inserted On inv_stock_item_serial id 216', 216, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:12', '2025-12-14'),
(1657, 'New Record inserted On inv_stock_item_serial id 217', 217, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:07:12', '2025-12-14'),
(1658, 'Record deleted On purchase_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:08:43', '2025-12-14'),
(1659, 'New Record inserted On sales id 113', 113, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:09:04', '2025-12-14'),
(1660, 'New Record inserted On acc_general_ledger id 478', 478, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:09:04', '2025-12-14'),
(1661, 'New Record inserted On sales_items id 113', 113, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:09:04', '2025-12-14'),
(1662, 'New Record inserted On sales_item_batch_profit_loss id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 09:09:04', '2025-12-14'),
(1663, 'New Record inserted On menus id 38', 38, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 10:34:45', '2025-12-14'),
(1664, 'New Record inserted On menus id 39', 39, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 10:35:33', '2025-12-14'),
(1665, 'New Record inserted On purchase id 282', 282, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:09', '2025-12-14'),
(1666, 'New Record inserted On acc_general_ledger id 479', 479, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1667, 'New Record inserted On purchase_items id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1668, 'New Record inserted On purchase_items id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1669, 'New Record inserted On purchase_item_serials id 76', 76, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1670, 'New Record inserted On purchase_item_serials id 77', 77, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1671, 'New Record inserted On inv_stock_item_serial id 218', 218, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1672, 'New Record inserted On inv_stock_item_serial id 219', 219, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:10', '2025-12-14'),
(1673, 'New Record inserted On inv_stock_item_batch id 36', 36, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:19:11', '2025-12-14'),
(1674, 'Record deleted On sales_order_item_serials id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:33:48', '2025-12-14'),
(1675, 'Record deleted On sales_order_items id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:33:48', '2025-12-14');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1676, 'Record deleted On sales_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:33:48', '2025-12-14'),
(1677, 'Record deleted On sales_order_item_serials id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:34:32', '2025-12-14'),
(1678, 'Record deleted On sales_order_items id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:34:32', '2025-12-14'),
(1679, 'Record deleted On sales_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 15:34:32', '2025-12-14'),
(1680, 'New Record inserted On purchase id 283', 283, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:14:17', '2025-12-14'),
(1681, 'New Record inserted On acc_general_ledger id 480', 480, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:14:17', '2025-12-14'),
(1682, 'New Record inserted On purchase id 284', 284, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:16:38', '2025-12-14'),
(1683, 'New Record inserted On acc_general_ledger id 481', 481, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:16:38', '2025-12-14'),
(1684, 'New Record inserted On purchase id 285', 285, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:11', '2025-12-14'),
(1685, 'New Record inserted On acc_general_ledger id 482', 482, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:11', '2025-12-14'),
(1686, 'New Record inserted On purchase_items id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1687, 'New Record inserted On purchase_item_serials id 78', 78, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1688, 'New Record inserted On purchase_item_serials id 79', 79, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1689, 'New Record inserted On purchase_item_serials id 80', 80, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1690, 'New Record inserted On purchase_items id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1691, 'New Record inserted On purchase_items id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1692, 'New Record inserted On inv_stock_item_serial id 220', 220, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1693, 'New Record inserted On inv_stock_item_serial id 221', 221, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1694, 'New Record inserted On inv_stock_item_serial id 222', 222, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1695, 'New Record inserted On inv_stock_item_batch id 37', 37, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1696, 'New Record inserted On inv_stock_item_batch id 38', 38, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:17:12', '2025-12-14'),
(1697, 'New Record inserted On purchase id 286', 286, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:18:22', '2025-12-14'),
(1698, 'New Record inserted On acc_general_ledger id 483', 483, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:18:22', '2025-12-14'),
(1699, 'New Record inserted On purchase_items id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:18:22', '2025-12-14'),
(1700, 'New Record inserted On purchase_item_serials id 81', 81, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:18:22', '2025-12-14'),
(1701, 'New Record inserted On inv_stock_item_serial id 223', 223, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:18:22', '2025-12-14'),
(1702, 'New Record inserted On purchase id 287', 287, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:20:35', '2025-12-14'),
(1703, 'New Record inserted On acc_general_ledger id 484', 484, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:20:36', '2025-12-14'),
(1704, 'New Record inserted On purchase_items id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:20:36', '2025-12-14'),
(1705, 'New Record inserted On purchase_item_serials id 82', 82, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:20:36', '2025-12-14'),
(1706, 'New Record inserted On inv_stock_item_serial id 224', 224, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:20:36', '2025-12-14'),
(1707, 'Record deleted On purchase_order_item_serials id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:21:53', '2025-12-14'),
(1708, 'Record deleted On purchase_order_items id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:21:53', '2025-12-14'),
(1709, 'Record deleted On purchase_invoice id ', NULL, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 16:21:53', '2025-12-14'),
(1710, 'New Record inserted On sales id 114', 114, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 17:28:04', '2025-12-14'),
(1711, 'New Record inserted On acc_general_ledger id 485', 485, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 17:28:05', '2025-12-14'),
(1712, 'New Record inserted On sales_items id 114', 114, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 17:28:05', '2025-12-14'),
(1713, 'New Record inserted On sales_item_batch_profit_loss id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 17:28:05', '2025-12-14'),
(1714, 'New Record inserted On purchase id 288', 288, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:12', '2025-12-15'),
(1715, 'New Record inserted On acc_general_ledger id 486', 486, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:12', '2025-12-15'),
(1716, 'New Record inserted On purchase_items id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:12', '2025-12-15'),
(1717, 'New Record inserted On inv_stock_item_batch id 39', 39, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:12', '2025-12-15'),
(1718, 'New Record inserted On sales id 115', 115, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:30', '2025-12-15'),
(1719, 'New Record inserted On acc_general_ledger id 487', 487, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:30', '2025-12-15'),
(1720, 'New Record inserted On sales_items id 115', 115, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:30', '2025-12-15'),
(1721, 'New Record inserted On sales_item_batch_profit_loss id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:31', '2025-12-15'),
(1722, 'New Record inserted On sales id 116', 116, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:41', '2025-12-15'),
(1723, 'New Record inserted On acc_general_ledger id 488', 488, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:42', '2025-12-15'),
(1724, 'New Record inserted On sales_items id 116', 116, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:42', '2025-12-15'),
(1725, 'New Record inserted On sales_item_batch_profit_loss id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:42', '2025-12-15'),
(1726, 'New Record inserted On sales id 117', 117, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:50', '2025-12-15'),
(1727, 'New Record inserted On acc_general_ledger id 489', 489, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:50', '2025-12-15'),
(1728, 'New Record inserted On sales_items id 117', 117, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:50', '2025-12-15'),
(1729, 'New Record inserted On sales_item_batch_profit_loss id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-14 18:10:50', '2025-12-15'),
(1730, 'New Record inserted On acc_general_ledger id 490', 490, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:51:05', '2025-12-16'),
(1731, 'New Record inserted On purchase id 289', 289, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:55:56', '2025-12-16'),
(1732, 'New Record inserted On acc_general_ledger id 491', 491, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:55:56', '2025-12-16'),
(1733, 'New Record inserted On purchase_items id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:55:56', '2025-12-16'),
(1734, 'New Record inserted On purchase_item_serials id 83', 83, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:55:56', '2025-12-16'),
(1735, 'New Record inserted On inv_stock_item_serial id 225', 225, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:55:56', '2025-12-16'),
(1736, 'New Record inserted On sales id 118', 118, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:57:20', '2025-12-16'),
(1737, 'New Record inserted On acc_general_ledger id 492', 492, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:57:20', '2025-12-16'),
(1738, 'New Record inserted On acc_general_ledger id 493', 493, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:57:20', '2025-12-16'),
(1739, 'New Record inserted On sales_items id 118', 118, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:57:21', '2025-12-16'),
(1740, 'New Record inserted On sales_item_batch_profit_loss id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:57:21', '2025-12-16'),
(1741, 'New Record inserted On acc_general_ledger id 494', 494, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 04:57:44', '2025-12-16'),
(1742, 'New Record inserted On acc_general_ledger id 495', 495, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:18:08', '2025-12-16'),
(1743, 'New Record inserted On acc_general_ledger id 496', 496, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:19:03', '2025-12-16'),
(1744, 'New Record inserted On acc_general_ledger id 497', 497, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:21:48', '2025-12-16'),
(1745, 'New Record inserted On purchase id 290', 290, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:22:49', '2025-12-16'),
(1746, 'New Record inserted On acc_general_ledger id 498', 498, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:22:49', '2025-12-16'),
(1747, 'New Record inserted On purchase_items id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:22:49', '2025-12-16'),
(1748, 'New Record inserted On purchase_item_serials id 84', 84, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:22:50', '2025-12-16'),
(1749, 'New Record inserted On inv_stock_item_serial id 226', 226, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:22:50', '2025-12-16'),
(1750, 'New Record inserted On sales id 119', 119, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:23:04', '2025-12-16'),
(1751, 'New Record inserted On acc_general_ledger id 499', 499, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:23:04', '2025-12-16'),
(1752, 'New Record inserted On acc_general_ledger id 500', 500, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:23:04', '2025-12-16'),
(1753, 'New Record inserted On sales_items id 119', 119, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:23:04', '2025-12-16'),
(1754, 'New Record inserted On sales_item_batch_profit_loss id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:23:05', '2025-12-16'),
(1755, 'New Record inserted On acc_general_ledger id 501', 501, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:23:29', '2025-12-16'),
(1756, 'New Record inserted On acc_general_ledger id 502', 502, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:28:15', '2025-12-16'),
(1757, 'New Record inserted On acc_general_ledger id 503', 503, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:28:15', '2025-12-16'),
(1758, 'New Record inserted On acc_general_ledger id 504', 504, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:30:35', '2025-12-16'),
(1759, 'New Record inserted On acc_general_ledger id 505', 505, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:30:48', '2025-12-16'),
(1760, 'New Record inserted On acc_general_ledger id 506', 506, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:30:48', '2025-12-16'),
(1761, 'New Record inserted On purchase id 291', 291, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:33', '2025-12-16'),
(1762, 'New Record inserted On acc_general_ledger id 507', 507, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:33', '2025-12-16'),
(1763, 'New Record inserted On purchase_items id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:34', '2025-12-16'),
(1764, 'New Record inserted On inv_stock_item_batch id 40', 40, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:34', '2025-12-16'),
(1765, 'New Record inserted On sales id 120', 120, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:44', '2025-12-16'),
(1766, 'New Record inserted On acc_general_ledger id 508', 508, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:44', '2025-12-16'),
(1767, 'New Record inserted On sales_items id 120', 120, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:44', '2025-12-16'),
(1768, 'New Record inserted On sales_item_batch_profit_loss id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:44', '2025-12-16'),
(1769, 'New Record inserted On sales id 121', 121, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:53', '2025-12-16'),
(1770, 'New Record inserted On acc_general_ledger id 509', 509, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:54', '2025-12-16'),
(1771, 'New Record inserted On sales_items id 121', 121, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:54', '2025-12-16'),
(1772, 'New Record inserted On sales_item_batch_profit_loss id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:43:54', '2025-12-16'),
(1773, 'New Record inserted On acc_general_ledger id 510', 510, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:44:26', '2025-12-16'),
(1774, 'New Record inserted On acc_general_ledger id 511', 511, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:44:26', '2025-12-16'),
(1775, 'New Record inserted On acc_general_ledger id 512', 512, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:44:26', '2025-12-16'),
(1776, 'New Record inserted On sales id 122', 122, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:45:26', '2025-12-16'),
(1777, 'New Record inserted On acc_general_ledger id 513', 513, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:45:27', '2025-12-16'),
(1778, 'New Record inserted On sales_items id 122', 122, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:45:27', '2025-12-16'),
(1779, 'New Record inserted On sales_item_batch_profit_loss id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:45:27', '2025-12-16'),
(1780, 'New Record inserted On sales id 123', 123, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:00', '2025-12-16'),
(1781, 'New Record inserted On acc_general_ledger id 514', 514, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:00', '2025-12-16'),
(1782, 'New Record inserted On sales_items id 123', 123, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:00', '2025-12-16'),
(1783, 'New Record inserted On sales_item_batch_profit_loss id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:00', '2025-12-16'),
(1784, 'New Record inserted On acc_general_ledger id 515', 515, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:42', '2025-12-16'),
(1785, 'New Record inserted On acc_general_ledger id 516', 516, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:42', '2025-12-16'),
(1786, 'New Record inserted On acc_general_ledger id 517', 517, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 05:46:42', '2025-12-16'),
(1787, 'New Record inserted On purchase id 292', 292, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:48:50', '2025-12-16'),
(1788, 'New Record inserted On acc_general_ledger id 518', 518, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:48:50', '2025-12-16'),
(1789, 'New Record inserted On acc_general_ledger id 519', 519, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:48:50', '2025-12-16'),
(1790, 'New Record inserted On purchase_items id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:48:50', '2025-12-16'),
(1791, 'New Record inserted On inv_stock_item_batch id 41', 41, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:48:50', '2025-12-16'),
(1792, 'New Record inserted On purchase id 293', 293, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:55:49', '2025-12-16'),
(1793, 'New Record inserted On acc_general_ledger id 520', 520, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:55:49', '2025-12-16'),
(1794, 'New Record inserted On acc_general_ledger id 521', 521, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:55:50', '2025-12-16'),
(1795, 'New Record inserted On purchase_items id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:55:50', '2025-12-16'),
(1796, 'New Record inserted On inv_stock_item_batch id 42', 42, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:55:50', '2025-12-16'),
(1797, 'New Record inserted On acc_general_ledger id 522', 522, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 06:59:40', '2025-12-16'),
(1798, 'New Record inserted On acc_general_ledger id 523', 523, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:02:08', '2025-12-16'),
(1799, 'New Record inserted On acc_general_ledger id 524', 524, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:05:42', '2025-12-16'),
(1803, 'New Record inserted On acc_general_ledger id 528', 528, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:07:43', '2025-12-16'),
(1804, 'New Record inserted On acc_general_ledger id 529', 529, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:10:30', '2025-12-16'),
(1805, 'New Record inserted On acc_general_ledger id 530', 530, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:11:47', '2025-12-16'),
(1806, 'New Record inserted On menus id 40', 40, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:19:05', '2025-12-16'),
(1807, 'New Record inserted On menus id 41', 41, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:19:46', '2025-12-16'),
(1808, 'New Record inserted On menus id 42', 42, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:08', '2025-12-16'),
(1809, 'New Record inserted On purchase id 294', 294, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:57', '2025-12-16'),
(1810, 'New Record inserted On acc_general_ledger id 531', 531, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:57', '2025-12-16'),
(1811, 'New Record inserted On acc_general_ledger id 532', 532, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:57', '2025-12-16'),
(1812, 'New Record inserted On purchase_items id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:57', '2025-12-16'),
(1813, 'New Record inserted On purchase_item_serials id 85', 85, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:57', '2025-12-16'),
(1814, 'New Record inserted On inv_stock_item_serial id 227', 227, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:20:58', '2025-12-16'),
(1815, 'New Record inserted On purchase id 295', 295, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:21:45', '2025-12-16'),
(1816, 'New Record inserted On acc_general_ledger id 533', 533, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:21:45', '2025-12-16'),
(1817, 'New Record inserted On acc_general_ledger id 534', 534, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:21:45', '2025-12-16'),
(1818, 'New Record inserted On purchase_items id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:21:45', '2025-12-16'),
(1819, 'New Record inserted On purchase_item_serials id 86', 86, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:21:45', '2025-12-16'),
(1820, 'New Record inserted On inv_stock_item_serial id 228', 228, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:21:46', '2025-12-16'),
(1821, 'New Record inserted On sales id 124', 124, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:23:10', '2025-12-16'),
(1822, 'New Record inserted On acc_general_ledger id 535', 535, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:23:10', '2025-12-16'),
(1823, 'New Record inserted On sales_items id 124', 124, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:23:10', '2025-12-16'),
(1824, 'New Record inserted On sales_item_batch_profit_loss id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:23:10', '2025-12-16'),
(1825, 'New Record inserted On acc_general_ledger id 536', 536, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:23:59', '2025-12-16'),
(1826, 'New Record inserted On acc_general_ledger id 537', 537, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-16 07:24:32', '2025-12-16'),
(1827, 'New Record inserted On service_categories id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:12:04', '2025-12-17'),
(1828, 'New Record inserted On service_categories id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:12:14', '2025-12-17'),
(1829, 'Record deleted On service_categories id 2', 2, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:12:48', '2025-12-17'),
(1830, 'Record deleted On service_categories id 1', 1, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:12:55', '2025-12-17'),
(1831, 'New Record inserted On service_categories id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:13:05', '2025-12-17'),
(1832, 'New Record inserted On service_categories id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:13:41', '2025-12-17'),
(1833, 'New Record inserted On service_categories id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:13:58', '2025-12-17'),
(1834, 'New Record inserted On menus id 43', 43, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:18:40', '2025-12-17'),
(1835, 'New Record inserted On menus id 44', 44, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:19:14', '2025-12-17'),
(1836, 'New Record inserted On menus id 45', 45, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:20:07', '2025-12-17'),
(1837, 'New Record inserted On menus id 46', 46, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 09:20:26', '2025-12-17'),
(1838, 'New Record inserted On purchase id 296', 296, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:25', '2025-12-17'),
(1839, 'New Record inserted On acc_general_ledger id 538', 538, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:25', '2025-12-17'),
(1840, 'New Record inserted On purchase_items id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:25', '2025-12-17'),
(1841, 'New Record inserted On purchase_item_serials id 87', 87, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:25', '2025-12-17'),
(1842, 'New Record inserted On inv_stock_item_serial id 229', 229, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:26', '2025-12-17'),
(1843, 'New Record inserted On sales id 125', 125, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:41', '2025-12-17'),
(1844, 'New Record inserted On acc_general_ledger id 539', 539, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:41', '2025-12-17'),
(1845, 'New Record inserted On sales_items id 125', 125, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:41', '2025-12-17'),
(1846, 'New Record inserted On sales_item_batch_profit_loss id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:54:41', '2025-12-17'),
(1847, 'New Record inserted On purchase id 297', 297, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:12', '2025-12-17'),
(1848, 'New Record inserted On acc_general_ledger id 540', 540, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:12', '2025-12-17'),
(1849, 'New Record inserted On purchase_items id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:13', '2025-12-17'),
(1850, 'New Record inserted On inv_stock_item_batch id 43', 43, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:13', '2025-12-17'),
(1851, 'New Record inserted On sales id 126', 126, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:29', '2025-12-17'),
(1852, 'New Record inserted On acc_general_ledger id 541', 541, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:29', '2025-12-17'),
(1853, 'New Record inserted On sales_items id 126', 126, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:29', '2025-12-17'),
(1854, 'New Record inserted On sales_item_batch_profit_loss id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-17 16:59:29', '2025-12-17'),
(1855, 'New Record inserted On service_warranty id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-18 19:13:54', '2025-12-19'),
(1856, 'New Record inserted On service_warranty id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-18 19:14:59', '2025-12-19'),
(1857, 'New Record inserted On service_warranty id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:08:19', '2025-12-19'),
(1858, 'New Record inserted On service_warranty id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:08:49', '2025-12-19'),
(1859, 'New Record inserted On service_warranty id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:09:40', '2025-12-19'),
(1860, 'New Record inserted On service_warranty id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:10:11', '2025-12-19'),
(1861, 'New Record inserted On service_warranty id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:10:40', '2025-12-19'),
(1862, 'New Record inserted On service_warranty_order id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:10:40', '2025-12-19'),
(1863, 'New Record inserted On service_warranty_order id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 06:10:40', '2025-12-19'),
(1864, 'New Record inserted On service_warranty id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 08:54:38', '2025-12-19'),
(1865, 'New Record inserted On service_warranty_order id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 08:54:38', '2025-12-19'),
(1866, 'New Record inserted On service_warranty_order id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 08:54:38', '2025-12-19'),
(1867, 'New Record inserted On service_warranty_order id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 08:54:38', '2025-12-19'),
(1868, 'New Record inserted On service_warranty id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 08:56:47', '2025-12-19'),
(1869, 'New Record inserted On service_warranty_order id 6', 6, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 08:56:48', '2025-12-19'),
(1870, 'New Record inserted On service_warranty id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 09:28:50', '2025-12-19'),
(1871, 'New Record inserted On service_warranty_order id 7', 7, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 09:28:50', '2025-12-19'),
(1872, 'New Record inserted On service_warranty_order id 8', 8, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 09:28:50', '2025-12-19'),
(1873, 'New Record inserted On service_warranty_order id 9', 9, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 09:28:50', '2025-12-19'),
(1874, 'New Record inserted On purchase id 298', 298, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 16:13:30', '2025-12-19'),
(1875, 'New Record inserted On acc_general_ledger id 542', 542, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 16:13:30', '2025-12-19'),
(1876, 'New Record inserted On purchase_items id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 16:13:30', '2025-12-19'),
(1877, 'New Record inserted On inv_stock_item_batch id 44', 44, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 16:13:30', '2025-12-19'),
(1878, 'New Record inserted On purchase id 299', 299, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1879, 'New Record inserted On acc_general_ledger id 543', 543, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1880, 'New Record inserted On acc_general_ledger id 544', 544, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1881, 'New Record inserted On purchase_items id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1882, 'New Record inserted On purchase_item_serials id 88', 88, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1883, 'New Record inserted On purchase_items id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1884, 'New Record inserted On purchase_items id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1885, 'New Record inserted On inv_stock_item_serial id 230', 230, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1886, 'New Record inserted On inv_stock_item_batch id 45', 45, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1887, 'New Record inserted On inv_stock_item_batch id 46', 46, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:04:16', '2025-12-19'),
(1888, 'New Record inserted On sales id 127', 127, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:05:50', '2025-12-19'),
(1889, 'New Record inserted On acc_general_ledger id 545', 545, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:05:51', '2025-12-19'),
(1890, 'New Record inserted On sales_items id 127', 127, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:05:51', '2025-12-19'),
(1891, 'New Record inserted On sales_item_batch_profit_loss id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:05:51', '2025-12-19'),
(1892, 'New Record inserted On sales id 128', 128, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:16:18', '2025-12-19'),
(1893, 'New Record inserted On acc_general_ledger id 546', 546, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:16:18', '2025-12-19'),
(1894, 'New Record inserted On sales_items id 128', 128, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:16:18', '2025-12-19'),
(1895, 'New Record inserted On sales_item_batch_profit_loss id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:16:18', '2025-12-19'),
(1896, 'New Record inserted On acc_general_ledger id 547', 547, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:20:56', '2025-12-19'),
(1897, 'New Record inserted On purchase id 300', 300, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:22:54', '2025-12-19'),
(1898, 'New Record inserted On acc_general_ledger id 548', 548, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:22:55', '2025-12-19'),
(1899, 'New Record inserted On purchase_items id 112', 112, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:22:55', '2025-12-19'),
(1900, 'New Record inserted On inv_stock_item_batch id 47', 47, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-19 17:22:55', '2025-12-19'),
(1902, 'New Record inserted On purchase id 301', 301, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:51:57', '2025-12-20'),
(1903, 'New Record inserted On acc_general_ledger id 550', 550, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:51:58', '2025-12-20'),
(1904, 'New Record inserted On purchase_items id 113', 113, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:51:58', '2025-12-20'),
(1905, 'New Record inserted On purchase_item_serials id 89', 89, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:51:58', '2025-12-20'),
(1906, 'New Record inserted On inv_stock_item_serial id 231', 231, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:51:58', '2025-12-20'),
(1907, 'New Record inserted On acc_general_ledger id 551', 551, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:52:14', '2025-12-20'),
(1908, 'New Record inserted On purchase id 302', 302, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:58:55', '2025-12-20'),
(1909, 'New Record inserted On acc_general_ledger id 552', 552, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:58:55', '2025-12-20'),
(1910, 'New Record inserted On purchase_items id 114', 114, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:58:55', '2025-12-20'),
(1911, 'New Record inserted On purchase_item_serials id 90', 90, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:58:55', '2025-12-20'),
(1912, 'New Record inserted On inv_stock_item_serial id 232', 232, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 06:58:56', '2025-12-20'),
(1914, 'New Record inserted On acc_general_ledger id 554', 554, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:00:22', '2025-12-20'),
(1915, 'New Record inserted On purchase id 303', 303, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:17', '2025-12-20'),
(1916, 'New Record inserted On acc_general_ledger id 555', 555, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:18', '2025-12-20'),
(1917, 'New Record inserted On purchase_items id 115', 115, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:18', '2025-12-20'),
(1918, 'New Record inserted On purchase_item_serials id 91', 91, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:18', '2025-12-20'),
(1919, 'New Record inserted On purchase_item_serials id 92', 92, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:19', '2025-12-20'),
(1920, 'New Record inserted On inv_stock_item_serial id 233', 233, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:19', '2025-12-20'),
(1921, 'New Record inserted On inv_stock_item_serial id 234', 234, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:19', '2025-12-20'),
(1922, 'New Record inserted On acc_general_ledger id 556', 556, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 07:01:34', '2025-12-20'),
(1923, 'New Record inserted On service_warranty id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:16:55', '2025-12-20'),
(1924, 'New Record inserted On service_warranty_order id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:16:55', '2025-12-20'),
(1925, 'New Record inserted On service_warranty_order id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:16:55', '2025-12-20'),
(1926, 'New Record inserted On service_warranty id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:17:25', '2025-12-20'),
(1927, 'New Record inserted On service_warranty_order id 12', 12, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:17:25', '2025-12-20'),
(1928, 'New Record inserted On service_warranty_order id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:17:25', '2025-12-20'),
(1929, 'New Record inserted On service_warranty_order id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:17:26', '2025-12-20'),
(1930, 'New Record inserted On service_warranty_order id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 09:17:26', '2025-12-20'),
(1931, 'New Record inserted On service_warranty id 13', 13, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:25:12', '2025-12-20'),
(1932, 'New Record inserted On service_warranty_order id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:25:12', '2025-12-20'),
(1933, 'New Record inserted On service_warranty_order id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:25:13', '2025-12-20'),
(1934, 'New Record inserted On service_warranty id 14', 14, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:27:43', '2025-12-20'),
(1935, 'New Record inserted On service_warranty_order id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:27:44', '2025-12-20'),
(1936, 'New Record inserted On service_warranty_order id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:27:44', '2025-12-20'),
(1937, 'New Record inserted On service_warranty_order id 20', 20, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-20 10:27:44', '2025-12-20'),
(1938, 'New Record inserted On service_warranty id 15', 15, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:19:16', '2025-12-21'),
(1939, 'New Record inserted On service_warranty_order id 21', 21, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:19:16', '2025-12-21'),
(1940, 'New Record inserted On service_warranty_order id 22', 22, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:19:16', '2025-12-21'),
(1941, 'New Record inserted On service_warranty_order id 23', 23, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:19:16', '2025-12-21'),
(1942, 'New Record inserted On service_warranty_order id 24', 24, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:19:17', '2025-12-21'),
(1943, 'Record deleted On service_warranty id ', NULL, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:19:17', '2025-12-21'),
(1944, 'New Record inserted On purchase id 304', 304, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:57', '2025-12-21'),
(1945, 'New Record inserted On acc_general_ledger id 557', 557, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:57', '2025-12-21'),
(1946, 'New Record inserted On purchase_items id 116', 116, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:57', '2025-12-21'),
(1947, 'New Record inserted On purchase_item_serials id 93', 93, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:58', '2025-12-21');
INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1948, 'New Record inserted On purchase_item_serials id 94', 94, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:58', '2025-12-21'),
(1949, 'New Record inserted On purchase_item_serials id 95', 95, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:58', '2025-12-21'),
(1950, 'New Record inserted On purchase_item_serials id 96', 96, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:58', '2025-12-21'),
(1951, 'New Record inserted On inv_stock_item_serial id 235', 235, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:58', '2025-12-21'),
(1952, 'New Record inserted On inv_stock_item_serial id 236', 236, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:58', '2025-12-21'),
(1953, 'New Record inserted On inv_stock_item_serial id 237', 237, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:59', '2025-12-21'),
(1954, 'New Record inserted On inv_stock_item_serial id 238', 238, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:24:59', '2025-12-21'),
(1955, 'New Record inserted On sales id 129', 129, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:10', '2025-12-21'),
(1956, 'New Record inserted On acc_general_ledger id 558', 558, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:10', '2025-12-21'),
(1957, 'New Record inserted On sales_items id 129', 129, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:10', '2025-12-21'),
(1958, 'New Record inserted On sales_item_batch_profit_loss id 102', 102, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:11', '2025-12-21'),
(1959, 'New Record inserted On service_warranty id 16', 16, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:46', '2025-12-21'),
(1960, 'New Record inserted On service_warranty_order id 25', 25, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:46', '2025-12-21'),
(1961, 'New Record inserted On service_warranty_order id 26', 26, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:46', '2025-12-21'),
(1962, 'New Record inserted On service_warranty_order id 27', 27, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:46', '2025-12-21'),
(1963, 'Record deleted On service_warranty id ', NULL, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 05:25:47', '2025-12-21'),
(1964, 'New Record inserted On service_warranty id 17', 17, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 08:38:24', '2025-12-21'),
(1965, 'New Record inserted On service_warranty_order id 28', 28, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 08:38:24', '2025-12-21'),
(1966, 'Record deleted On service_warranty id ', NULL, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 08:38:24', '2025-12-21'),
(1967, 'New Record inserted On sales id 130', 130, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 09:37:55', '2025-12-21'),
(1968, 'New Record inserted On service_warranty id 18', 18, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:27:55', '2025-12-21'),
(1969, 'New Record inserted On service_warranty_order id 29', 29, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:27:55', '2025-12-21'),
(1970, 'New Record inserted On service_warranty_order id 30', 30, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:27:56', '2025-12-21'),
(1971, 'Record deleted On service_warranty id ', NULL, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:27:56', '2025-12-21'),
(1972, 'New Record inserted On sales id 131', 131, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:36:16', '2025-12-21'),
(1973, 'New Record inserted On sales id 132', 132, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:36:55', '2025-12-21'),
(1974, 'New Record inserted On sales_items id 130', 130, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:36:56', '2025-12-21'),
(1975, 'New Record inserted On sales id 133', 133, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:37:51', '2025-12-21'),
(1976, 'New Record inserted On sales_items id 131', 131, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:37:51', '2025-12-21'),
(1977, 'New Record inserted On sales id 134', 134, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:38:05', '2025-12-21'),
(1978, 'New Record inserted On sales_items id 132', 132, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:38:06', '2025-12-21'),
(1979, 'New Record inserted On sales id 135', 135, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:38:20', '2025-12-21'),
(1980, 'New Record inserted On sales_items id 133', 133, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:38:20', '2025-12-21'),
(1981, 'New Record inserted On sales id 136', 136, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:38:40', '2025-12-21'),
(1982, 'New Record inserted On sales_items id 134', 134, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:38:40', '2025-12-21'),
(1983, 'New Record inserted On sales id 137', 137, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:39:04', '2025-12-21'),
(1984, 'New Record inserted On sales_items id 135', 135, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:39:05', '2025-12-21'),
(1985, 'New Record inserted On sales id 138', 138, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:39:29', '2025-12-21'),
(1986, 'New Record inserted On sales_items id 136', 136, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:39:29', '2025-12-21'),
(1987, 'New Record inserted On sales id 139', 139, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:39:45', '2025-12-21'),
(1988, 'New Record inserted On sales_items id 137', 137, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:39:46', '2025-12-21'),
(1989, 'New Record inserted On sales id 140', 140, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:49:47', '2025-12-21'),
(1990, 'New Record inserted On sales_items id 138', 138, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:49:48', '2025-12-21'),
(1991, 'New Record inserted On sales id 141', 141, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:10', '2025-12-21'),
(1992, 'New Record inserted On sales_items id 139', 139, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:10', '2025-12-21'),
(1993, 'New Record inserted On sales_item_batch_profit_loss id 103', 103, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:10', '2025-12-21'),
(1994, 'New Record inserted On sales id 142', 142, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:29', '2025-12-21'),
(1995, 'New Record inserted On sales_items id 140', 140, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:29', '2025-12-21'),
(1996, 'New Record inserted On sales id 143', 143, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:58', '2025-12-21'),
(1997, 'New Record inserted On sales_items id 141', 141, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:51:58', '2025-12-21'),
(1998, 'New Record inserted On sales id 144', 144, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:07', '2025-12-21'),
(1999, 'New Record inserted On sales_items id 142', 142, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:07', '2025-12-21'),
(2000, 'New Record inserted On sales id 145', 145, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:26', '2025-12-21'),
(2001, 'New Record inserted On sales_items id 143', 143, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:26', '2025-12-21'),
(2002, 'New Record inserted On sales id 146', 146, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:32', '2025-12-21'),
(2003, 'New Record inserted On sales_items id 144', 144, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:32', '2025-12-21'),
(2004, 'New Record inserted On sales_item_batch_profit_loss id 104', 104, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:54:32', '2025-12-21'),
(2005, 'New Record inserted On sales id 147', 147, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:57:21', '2025-12-21'),
(2006, 'New Record inserted On sales_items id 145', 145, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:57:21', '2025-12-21'),
(2007, 'New Record inserted On sales_item_batch_profit_loss id 105', 105, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:57:22', '2025-12-21'),
(2008, 'New Record inserted On sales id 148', 148, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:59:09', '2025-12-21'),
(2009, 'New Record inserted On sales_items id 146', 146, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:59:09', '2025-12-21'),
(2010, 'New Record inserted On sales_item_batch_profit_loss id 106', 106, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 10:59:09', '2025-12-21'),
(2011, 'New Record inserted On sales id 149', 149, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 11:10:51', '2025-12-21'),
(2012, 'New Record inserted On sales_items id 147', 147, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 11:10:52', '2025-12-21'),
(2013, 'New Record inserted On sales_item_batch_profit_loss id 107', 107, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 11:10:52', '2025-12-21'),
(2014, 'New Record inserted On purchase id 305', 305, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:09', '2025-12-21'),
(2015, 'New Record inserted On acc_general_ledger id 559', 559, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:09', '2025-12-21'),
(2016, 'New Record inserted On purchase_items id 117', 117, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:09', '2025-12-21'),
(2017, 'New Record inserted On purchase_item_serials id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:09', '2025-12-21'),
(2018, 'New Record inserted On purchase_item_serials id 98', 98, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:09', '2025-12-21'),
(2019, 'New Record inserted On purchase_item_serials id 99', 99, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:10', '2025-12-21'),
(2020, 'New Record inserted On inv_stock_item_serial id 239', 239, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:10', '2025-12-21'),
(2021, 'New Record inserted On inv_stock_item_serial id 240', 240, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:10', '2025-12-21'),
(2022, 'New Record inserted On inv_stock_item_serial id 241', 241, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:47:10', '2025-12-21'),
(2023, 'New Record inserted On sales id 150', 150, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:02', '2025-12-21'),
(2024, 'New Record inserted On acc_general_ledger id 560', 560, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:02', '2025-12-21'),
(2025, 'New Record inserted On sales_items id 148', 148, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:03', '2025-12-21'),
(2026, 'New Record inserted On sales_item_batch_profit_loss id 108', 108, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:03', '2025-12-21'),
(2027, 'New Record inserted On service_warranty id 19', 19, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:39', '2025-12-21'),
(2028, 'New Record inserted On service_warranty_order id 31', 31, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:39', '2025-12-21'),
(2029, 'Record deleted On service_warranty id ', NULL, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:48:39', '2025-12-21'),
(2030, 'New Record inserted On sales id 151', 151, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:49:03', '2025-12-21'),
(2031, 'New Record inserted On acc_general_ledger id 561', 561, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:49:03', '2025-12-21'),
(2032, 'New Record inserted On sales_items id 149', 149, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:49:03', '2025-12-21'),
(2033, 'New Record inserted On sales_item_batch_profit_loss id 109', 109, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-21 17:49:03', '2025-12-21'),
(2034, 'New Record inserted On products id 10', 10, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 04:43:15', '2025-12-23'),
(2035, 'New Record inserted On purchase id 306', 306, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:08', '2025-12-23'),
(2036, 'New Record inserted On acc_general_ledger id 562', 562, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:08', '2025-12-23'),
(2037, 'New Record inserted On purchase_items id 118', 118, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:08', '2025-12-23'),
(2038, 'New Record inserted On purchase_item_serials id 100', 100, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:09', '2025-12-23'),
(2039, 'New Record inserted On purchase_item_serials id 101', 101, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:09', '2025-12-23'),
(2040, 'New Record inserted On inv_stock_item_serial id 242', 242, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:09', '2025-12-23'),
(2041, 'New Record inserted On inv_stock_item_serial id 243', 243, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:09', '2025-12-23'),
(2042, 'New Record inserted On sales id 152', 152, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:32', '2025-12-23'),
(2043, 'New Record inserted On acc_general_ledger id 563', 563, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:33', '2025-12-23'),
(2044, 'New Record inserted On sales_items id 150', 150, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:33', '2025-12-23'),
(2045, 'New Record inserted On sales_item_batch_profit_loss id 110', 110, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 05:37:33', '2025-12-23'),
(2046, 'New Record inserted On purchase id 307', 307, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:45', '2025-12-23'),
(2047, 'New Record inserted On acc_general_ledger id 564', 564, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:46', '2025-12-23'),
(2048, 'New Record inserted On purchase_items id 119', 119, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:46', '2025-12-23'),
(2049, 'New Record inserted On inv_stock_item_batch id 48', 48, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:46', '2025-12-23'),
(2050, 'New Record inserted On sales id 153', 153, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:57', '2025-12-23'),
(2051, 'New Record inserted On acc_general_ledger id 565', 565, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:57', '2025-12-23'),
(2052, 'New Record inserted On sales_items id 151', 151, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:58', '2025-12-23'),
(2053, 'New Record inserted On sales_item_batch_profit_loss id 111', 111, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 06:19:58', '2025-12-23'),
(2054, 'New Record inserted On products id 11', 11, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 07:18:04', '2025-12-23'),
(2055, 'New Record inserted On menus id 47', 47, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-23 10:35:09', '2025-12-23'),
(2056, 'New Record inserted On menus id 48', 48, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:24:51', '2025-12-27'),
(2057, 'New Record inserted On menus id 49', 49, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:25:31', '2025-12-27'),
(2058, 'New Record inserted On menus id 50', 50, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:26:14', '2025-12-27'),
(2059, 'New Record inserted On menus id 51', 51, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:26:58', '2025-12-27'),
(2060, 'New Record inserted On menus id 52', 52, 1, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:27:26', '2025-12-27'),
(2061, 'New Record inserted On service_name id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:03', '2025-12-27'),
(2062, 'Record deleted On service_name id 1', 1, 17, 'Update', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:14', '2025-12-27'),
(2063, 'Record deleted On service_name id 1', 1, 17, 'Delete', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:19', '2025-12-27'),
(2064, 'New Record inserted On service_name id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:28', '2025-12-27'),
(2065, 'New Record inserted On service_name id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:35', '2025-12-27'),
(2066, 'New Record inserted On service_name id 4', 4, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:41', '2025-12-27'),
(2067, 'New Record inserted On service_name id 5', 5, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 05:33:50', '2025-12-27'),
(2068, 'New Record inserted On service_attributes id 1', 1, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 07:17:34', '2025-12-27'),
(2069, 'New Record inserted On service_attributes id 2', 2, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 07:17:59', '2025-12-27'),
(2070, 'New Record inserted On service_attributes id 3', 3, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-12-27 07:18:16', '2025-12-27');

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
(6, 'All Products', 'products', 4, 3, 'fa fa-angle-double-right', 1, 1762055653),
(7, 'Products groups', 'products/groups', 4, 7, 'fa fa-angle-double-right', 1, 1762055754),
(8, 'Purchase', '#', 0, 7, 'fa-solid fa-cart-arrow-down', 1, 1762249847),
(9, 'All Purchase', 'purchase', 8, 4, 'fa fa-angle-double-right', 1, 1762249889),
(10, 'Partner', '#', 0, 13, 'fa-regular fa-handshake', 1, 1762402030),
(11, 'All Partner', 'partner', 10, 3, 'fa fa-angle-double-right', 1, 1762402338),
(12, 'New Purchase Order', 'purchase/create', 8, 1, '', 1, 1762599130),
(13, 'All Order', 'purchase/order', 8, 12, '', 1, 1762599200),
(14, 'Create Product', 'products/create', 4, 2, '', 1, 1762599274),
(15, 'Partner Group', 'partner/groups', 10, 11, '', 1, 1762599415),
(16, 'Create Partner', 'partner/create', 10, 3, '', 1, 1762599454),
(17, 'Inventory', '#', 0, 9, '', 1, 1762855013),
(18, 'Stock Balance', 'inventory/stockmaster', 17, 3, '', 1, 1762855248),
(19, 'Stock Item Serial', 'inventory/stockitemserial', 17, 4, '', 1, 1762855294),
(20, 'Reports', '#', 0, 56, '', 1, 1763550676),
(21, 'Purchase Reports', 'reports/purchase', 20, 2, '', 1, 1763550705),
(22, 'Sales', '#', 0, 10, '', 1, 1763972920),
(23, 'Create Sales', 'sales/create', 22, 2, '', 1, 1763972953),
(24, 'All Sales', 'sales', 22, 3, '', 1, 1763972971),
(25, 'Income Statement Report', 'reports/profit', 20, 5, '', 1, 1764416152),
(26, 'Sales Return With Item', 'sales/sreturnitem', 22, 6, '', 1, 1764999714),
(27, 'All Sales Return', 'sales/sreturn/list', 22, 8, '', 1, 1765022031),
(28, 'Sales Return Item', 'sales/salesreturn', 22, 5, '', 1, 1765097151),
(29, 'Purchase Return', 'purchase/preturn', 8, 15, '', 1, 1765269498),
(30, 'Sales Order', 'sales/order', 22, 4, '', 1, 1765269538),
(31, 'All Purchase Return', 'purchase/preturn/list', 8, 18, '', 1, 1765290640),
(32, 'Party Ledger', 'reports/partyledger', 20, 7, '', 1, 1765550846),
(33, 'Sales Return', 'sales/sreturn', 22, 7, '', 1, 1765551007),
(34, 'Quotation', '', 0, 21, '', 1, 1765622967),
(35, 'Add New Purchase', 'purchase/purchasebatch/create', 8, 1, '', 1, 1765646141),
(36, 'Add New Quotation', 'quotation', 34, 1, '', 1, 1765646325),
(37, 'All Quotation', 'quotation/list', 34, 3, '', 1, 1765646347),
(38, 'Accounts', '#', 0, 30, '', 1, 1765708485),
(39, 'Customer Received', 'accounts/customerReceived', 38, 1, '', 1, 1765708533),
(40, 'All Customer Received ', 'accounts/customerReceived/list', 38, 2, '', 1, 1765869545),
(41, 'Supplier Received', 'accounts/supplierReceived', 38, 4, '', 1, 1765869586),
(42, 'All Supplier Received ', 'accounts/supplierReceived/list', 38, 5, '', 1, 1765869608),
(43, 'RMA/Service', '#', 0, 19, '', 1, 1765963120),
(44, 'Service Categories', 'service/categories', 43, 10, '', 1, 1765963154),
(45, 'Warranty Entry', 'service/warranty/create', 43, 3, '', 1, 1765963206),
(46, 'All Warranty', 'service/warranty', 43, 2, '', 1, 1765963226),
(47, 'Print Labels', 'products/barcode', 4, 31, '', 1, 1766486109),
(48, 'Service', '#', 0, 20, '', 1, 1766813090),
(49, 'Service Name', 'service/servicename', 48, 3, '', 1, 1766813131),
(50, 'Service Attributes', 'service/serviceattributes', 48, 4, '', 1, 1766813174),
(51, ' Service List', 'service', 48, 2, '', 1, 1766813218),
(52, 'Service Bill', 'service/create', 48, 1, '', 1, 1766813246);

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
-- Table structure for table `partner_groups`
--

CREATE TABLE `partner_groups` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(8, 3, '7503', 'Nokia Mobile', 3, 3, 11, 'common', 500.00, 'Inclusive', 0.00, 0.00, 500.00, 800.00, 6, 'Month', 5, 1, 0, 1, '5', '0.png', 1, 17, 1765640124),
(9, 3, '1087', 'Smart Phone', 3, 4, 10, 'unique', 700.00, 'Inclusive', 0.00, 0.00, 700.00, 44.00, 44, 'Days', 4, 1, 0, 1, '', '0.png', 1, 17, 1765640156),
(10, 3, '5242', '22222222222222222222222222222', 3, 3, 10, 'common', 22.00, 'Inclusive', 0.00, 0.00, 0.00, 33.00, 22, 'Days', 0, 1, 0, 1, '33', '0.png', 1, 17, 1766464995),
(11, 3, '1100', 'VISION BLANDER 1100W', 5, 4, 11, 'common', 500.00, 'Inclusive', 0.00, 0.00, 500.00, 740.00, 30, 'Days', 5, 1, 0, 1, 'thos', '0.png', 1, 17, 1766474284);

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
(305, 3, 1, '', '', 1, 'GRN-0001', 1766253600, 1, 1, 3, 2100.00, 0.00, 0.00, 2100.00, 0.00, 2100.00, 1, 17, 1766339229),
(306, 3, 1, '', '', 2, 'GRN-0002', 1766426400, 1, 1, 2, 1400.00, 0.00, 0.00, 1400.00, 0.00, 1400.00, 1, 17, 1766468228),
(307, 3, 1, '', '', 3, 'GRN-0003', 1766426400, 38, 1, 16, 8000.00, 0.00, 0.00, 8000.00, 0.00, 8000.00, 1, 17, 1766470785);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice`
--

CREATE TABLE `purchase_invoice` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `invoice_code` varchar(100) NOT NULL,
  `supplier_id` int(11) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` enum('Pending','Approved') DEFAULT 'Pending',
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase_invoice`
--

INSERT INTO `purchase_invoice` (`id`, `organization_id`, `branch_id`, `invoice_code`, `supplier_id`, `remarks`, `status`, `create_user`, `create_date`) VALUES
(72, 3, 1, '21122025234649', 1, '', 'Approved', 17, 1766339214),
(73, 3, 1, '23122025113637', 1, '', 'Approved', 17, 1766468206),
(74, 3, 1, '23122025121913', 38, '', 'Approved', 17, 1766470769),
(75, 3, 1, '23122025124005', 1, '', 'Pending', 17, 1766472023),
(76, 3, 1, '24122025112346', 1, '', 'Pending', 17, 1766553836),
(77, 3, 1, '24122025115006', 1, '', 'Pending', 17, 1766555414),
(78, 3, 1, '24122025115239', 1, '', 'Pending', 17, 1766555565),
(79, 3, 1, '24122025115522', 1, '', 'Pending', 17, 1766555726),
(80, 3, 1, '24122025115536', 1, '', 'Pending', 17, 1766555740),
(81, 3, 1, '24122025120729', 1, '', 'Pending', 17, 1766556458),
(82, 3, 1, '24122025120932', 1, '', 'Pending', 17, 1766556578),
(83, 3, 1, '24122025121001', 1, '', 'Pending', 17, 1766556608),
(84, 3, 1, '24122025121141', 1, '', 'Pending', 17, 1766556710),
(85, 3, 1, '24122025121156', 1, '', 'Pending', 17, 1766556723),
(86, 3, 1, '24122025121326', 1, '', 'Pending', 17, 1766556815),
(87, 3, 1, '24122025122118', 1, '', 'Pending', 17, 1766557286),
(88, 3, 1, '24122025122318', 1, '', 'Pending', 17, 1766557407),
(89, 3, 1, '24122025122431', 1, '', 'Pending', 17, 1766557477),
(90, 3, 1, '24122025122711', 1, '', 'Pending', 17, 1766557636),
(91, 3, 1, '24122025122911', 1, '', 'Pending', 17, 1766557757),
(92, 3, 1, '24122025123006', 1, '', 'Pending', 17, 1766557811),
(93, 3, 1, '24122025123139', 1, '', 'Pending', 17, 1766557904),
(94, 3, 1, '24122025123408', 1, '', 'Pending', 17, 1766558054),
(95, 3, 1, '24122025123441', 1, '', 'Pending', 17, 1766558087),
(96, 3, 1, '24122025123607', 1, '', 'Pending', 17, 1766558173),
(97, 3, 1, '24122025123846', 1, '', 'Pending', 17, 1766558334),
(98, 3, 1, '24122025123936', 1, '', 'Pending', 17, 1766558382),
(99, 3, 1, '24122025124129', 1, '', 'Pending', 17, 1766558495);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `invoice_code` varchar(255) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `total_rebate` decimal(16,2) NOT NULL,
  `net_total` decimal(16,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) NOT NULL,
  `status` enum('Pending','Approved') NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `organization_id`, `branch_id`, `invoice_code`, `purchase_id`, `store_id`, `product_id`, `serial_type`, `purchase_price`, `sales_price`, `qty`, `sub_total`, `rebate`, `total_rebate`, `net_total`, `warrenty`, `warrenty_days`, `status`, `create_user`, `create_date`) VALUES
(117, 3, 1, '21122025234649', 305, 1, 9, 'unique', 700.00, 700.00, 3, 2100.00, 0.00, 0.00, 2100.00, 44, 'Days', 'Approved', 17, 1766339229),
(118, 3, 1, '23122025113637', 306, 1, 9, 'unique', 700.00, 700.00, 2, 1400.00, 0.00, 0.00, 1400.00, 44, 'Days', 'Approved', 17, 1766468228),
(119, 3, 1, '23122025121913', 307, 1, 8, 'common', 500.00, 500.00, 16, 8000.00, 0.00, 0.00, 8000.00, 6, 'Month', 'Approved', 17, 1766470785);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item_serials`
--

CREATE TABLE `purchase_item_serials` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `is_available` int(11) NOT NULL,
  `is_return` int(11) NOT NULL,
  `batch_number` varchar(100) NOT NULL,
  `serial_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_item_serials`
--

INSERT INTO `purchase_item_serials` (`id`, `item_id`, `serial_type`, `is_available`, `is_return`, `batch_number`, `serial_number`) VALUES
(97, 117, 'unique', 1, 0, '', 'aaa'),
(98, 117, 'unique', 1, 0, '', 'bbb'),
(99, 117, 'unique', 1, 0, '', 'ccc'),
(100, 118, 'unique', 1, 0, '', '233232'),
(101, 118, 'unique', 1, 0, '', '3333333');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `serial_type` enum('unique','common') NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_date` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `total_rebate` decimal(16,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) DEFAULT NULL,
  `barcode_serial` varchar(255) DEFAULT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `invoice_id`, `serial_type`, `product_id`, `purchase_date`, `price`, `qty`, `rebate`, `total_rebate`, `sub_total`, `sales_price`, `warrenty`, `warrenty_days`, `barcode_serial`, `create_date`) VALUES
(128, '24122025123139', 'unique', 9, 1766557905, 700.00, 2, 100.00, 0.00, 1300.00, 44.00, 44, 'Days', '', 1766557905),
(129, '24122025123408', 'unique', 9, 1766558054, 700.00, 1, 100.00, 100.00, 600.00, 44.00, 44, 'Days', '', 1766558054),
(130, '24122025123441', 'unique', 9, 1766558087, 700.00, 2, 100.00, 200.00, 1200.00, 44.00, 44, 'Days', '', 1766558087),
(131, '24122025123607', 'unique', 9, 1766558174, 700.00, 3, 100.00, 300.00, 1800.00, 44.00, 44, 'Days', '', 1766558174);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_item_serials`
--

CREATE TABLE `purchase_order_item_serials` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `serial_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchase_order_item_serials`
--

INSERT INTO `purchase_order_item_serials` (`id`, `item_id`, `serial_number`) VALUES
(66, 105, 'aaa'),
(67, 105, 'bbb'),
(68, 105, 'ccc'),
(69, 106, '233232'),
(70, 106, '3333333'),
(71, 111, ''),
(72, 111, ''),
(73, 112, 'UNIQ-1766555565179-9090'),
(74, 112, 'UNIQ-1766555655814-9848'),
(75, 112, 'UNIQ-1766555656102-7276'),
(77, 112, 'UNIQ-1766555670654-3943'),
(78, 113, 'UNIQ-1766555726072-8827'),
(79, 114, 'UNIQ-1766555740398-1902'),
(80, 117, 'UNIQ-1766556578270-2757'),
(81, 117, 'UNIQ-1766556580622-3885'),
(86, 120, 'UNIQ-1766556723879-8981'),
(87, 120, 'UNIQ-1766556729334-2777'),
(92, 122, 'UNIQ-1766557286895-6528'),
(93, 122, 'UNIQ-1766557289825-1855'),
(96, 124, 'UNIQ-1766557477151-3797'),
(97, 124, 'UNIQ-1766557479302-4155'),
(98, 124, 'UNIQ-1766557492334-3553'),
(99, 125, 'UNIQ-1766557636318-6964'),
(100, 125, 'UNIQ-1766557638894-4237'),
(101, 126, 'UNIQ-1766557757519-6842'),
(102, 126, 'UNIQ-1766557759262-9154'),
(103, 127, 'UNIQ-1766557811454-8352'),
(104, 127, 'UNIQ-1766557821885-5549'),
(105, 128, 'UNIQ-1766557904886-6783'),
(106, 128, 'UNIQ-1766557916910-3608'),
(107, 129, 'UNIQ-1766558054574-5706'),
(108, 130, 'UNIQ-1766558087550-1041'),
(109, 130, 'UNIQ-1766558093870-1493'),
(110, 131, 'UNIQ-1766558173590-3785'),
(111, 131, 'UNIQ-1766558178174-1750'),
(112, 131, 'UNIQ-1766558185382-1282'),
(113, 0, 'UNIQ-1766558334087-9613'),
(114, 0, 'UNIQ-1766558341150-9199'),
(115, 0, 'UNIQ-1766558382710-2143'),
(116, 0, 'UNIQ-1766558386951-4008'),
(117, 0, 'UNIQ-1766558392582-3985'),
(118, 0, 'UNIQ-1766558395822-8278'),
(119, 0, 'UNIQ-1766558495710-2816'),
(120, 0, 'UNIQ-1766558498670-1844'),
(121, 0, 'UNIQ-1766558505814-4610');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE `purchase_return` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `code_random` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `return_date` int(11) NOT NULL,
  `total_order` int(11) NOT NULL,
  `paid_amount` decimal(16,2) NOT NULL,
  `adjustment` decimal(16,2) NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  `due_amount` decimal(16,2) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` int(11) NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `serial_type` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NOT NULL,
  `serials` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(49, 3, 1),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
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
(25, 3, 25),
(27, 3, 27),
(31, 3, 29),
(30, 3, 30),
(32, 3, 31),
(33, 3, 32),
(34, 3, 33),
(35, 3, 34),
(36, 3, 35),
(38, 3, 36),
(37, 3, 37),
(40, 3, 38),
(41, 3, 39),
(42, 3, 40),
(43, 3, 41),
(44, 3, 42),
(45, 3, 43),
(48, 3, 44),
(47, 3, 45),
(46, 3, 46),
(50, 3, 47),
(51, 3, 48),
(54, 3, 49),
(55, 3, 50),
(53, 3, 51),
(52, 3, 52);

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
(150, 3, 1, '', '21122025234755', 1, 'INV-0001', 1766253600, 1, 1, 1, 44.00, 0.00, 0.00, 44.00, 44.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1766339282),
(151, 3, 1, '', '0', 2, 'INV-0002', 1766253600, 1, 1, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1766339343),
(152, 3, 1, '', '23122025113718', 3, 'INV-0003', 1766426400, 1, 1, 1, 900.00, 0.00, 0.00, 900.00, 900.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1766468251),
(153, 3, 1, '', '23122025121951', 4, 'INV-0004', 1766426400, 1, 1, 1, 800.00, 0.00, 0.00, 800.00, 800.00, 0.00, 1, 0, 0, 'Cash', '0', 'Cash', 1, 17, 1766470797);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice`
--

CREATE TABLE `sales_invoice` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `invoice_code` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `status` enum('Pending','Approved') NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_invoice`
--

INSERT INTO `sales_invoice` (`id`, `organization_id`, `branch_id`, `invoice_code`, `customer_id`, `remarks`, `status`, `create_user`, `create_date`) VALUES
(323, 3, 0, '21122025234755', 0, '', 'Approved', 17, 1766339280),
(324, 3, 1, '23122025113718', 1, '', 'Approved', 17, 1766468247),
(325, 3, 1, '23122025121951', 1, '', 'Approved', 17, 1766470795);

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
  `is_returned` tinyint(1) NOT NULL DEFAULT 0,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `returned_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `organization_id`, `branch_id`, `invoice_id`, `sales_id`, `store_id`, `serial_type`, `product_id`, `purchase_price`, `price`, `qty`, `sub_total`, `discount_percent`, `discount_amount`, `net_total`, `warrenty`, `warrenty_days`, `status`, `is_returned`, `create_user`, `create_date`, `returned_qty`) VALUES
(148, 3, 1, '', 150, 1, 'unique', 9, 700.00, 44.00, 1, 44.00, 0.00, 0.00, 44.00, 44, 'Days', 'Approved', 0, 17, 1766339282, 0),
(149, 3, 1, '', 151, 1, 'unique', 9, 700.00, 0.00, 1, 0.00, 0.00, 0.00, 0.00, 44, 'Days', 'Approved', 0, 17, 1766339343, 0),
(150, 3, 1, '', 152, 1, 'unique', 9, 700.00, 900.00, 1, 900.00, 0.00, 0.00, 900.00, 44, 'Days', 'Approved', 0, 17, 1766468251, 0),
(151, 3, 1, '', 153, 1, 'common', 8, 500.00, 800.00, 1, 800.00, 0.00, 0.00, 800.00, 6, 'Month', 'Approved', 0, 17, 1766470797, 0);

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
  `customer_id` int(11) NOT NULL,
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
  `create_date` int(11) NOT NULL,
  `qty_returned` int(11) DEFAULT 0,
  `is_returned` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales_item_batch_profit_loss`
--

INSERT INTO `sales_item_batch_profit_loss` (`id`, `organization_id`, `branch_id`, `sales_id`, `sales_item_id`, `customer_id`, `product_id`, `batch_id`, `batch_number`, `qty_sold`, `purchase_price`, `sales_price`, `profit_loss`, `serial_type`, `sales_date`, `create_user`, `create_date`, `qty_returned`, `is_returned`) VALUES
(108, 3, 1, 150, 148, 1, 9, 239, 'aaa', 1, 700.00, 44.00, -656.00, 'unique', 1766253600, 17, 1766339283, 0, 0),
(109, 3, 1, 151, 149, 1, 9, 240, 'bbb', 1, 700.00, 0.00, -700.00, 'unique', 1766253600, 17, 1766339343, 0, 0),
(110, 3, 1, 152, 150, 1, 9, 243, '3333333', 1, 700.00, 900.00, 200.00, 'unique', 1766426400, 17, 1766468253, 0, 0),
(111, 3, 1, 153, 151, 1, 8, 48, 'SN694A3482AEC91', 1, 500.00, 800.00, 300.00, 'common', 1766426400, 17, 1766470798, 0, 0);

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
(462, 3, '21122025234755', 'unique', 9, 700.00, 44.00, 1, 44.00, 0.00, 0.00, 44.00, 44, 'Days', 'Approved', 17, 1766339280),
(463, 3, '23122025113718', 'unique', 9, 700.00, 900.00, 1, 900.00, 0.00, 0.00, 900.00, 44, 'Days', 'Approved', 17, 1766468247),
(464, 3, '23122025121951', 'common', 8, 500.00, 800.00, 1, 800.00, 0.00, 0.00, 800.00, 6, 'Month', 'Approved', 17, 1766470795);

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
(329, 462, 0, '', 'aaa'),
(330, 463, 0, '', '3333333');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `code_random` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sales_date` int(11) DEFAULT NULL,
  `paid_amount` decimal(16,2) DEFAULT 0.00,
  `adjustment` decimal(16,2) DEFAULT 0.00,
  `total_amount` decimal(16,2) DEFAULT 0.00,
  `due_amount` decimal(16,2) DEFAULT 0.00,
  `create_user` int(11) DEFAULT NULL,
  `create_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_items`
--

CREATE TABLE `sales_return_items` (
  `id` int(11) NOT NULL,
  `sales_return_id` int(11) NOT NULL,
  `serial_type` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NOT NULL,
  `serials` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_attributes`
--

CREATE TABLE `service_attributes` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `service_name_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_checkbox` int(11) NOT NULL,
  `is_input_entry` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_attributes`
--

INSERT INTO `service_attributes` (`id`, `organization_id`, `branch_id`, `service_name_id`, `name`, `is_checkbox`, `is_input_entry`, `is_active`, `create_user`, `create_date`) VALUES
(1, 3, 1, 5, 'HARDDESK', 0, 1, 1, 17, 1766819854),
(2, 3, 1, 2, 'LCD', 0, 1, 1, 17, 1766819878),
(3, 3, 1, 2, ' PROCESSOR', 1, 1, 1, 17, 1766819895);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `organization_id`, `branch_id`, `name`, `amount`, `is_active`, `create_user`, `create_date`) VALUES
(2, 3, 0, ' WINDOWS PROBLEM ', 50.00, 1, 17, 1765962733),
(3, 3, 0, ' WINDOWS PROBLEM', 0.00, 1, 17, 1765962785),
(4, 3, 0, 'SPEAKER PROBLEM', 0.00, 1, 17, 1765962821),
(5, 3, 0, 'NO POWER', 100.00, 1, 17, 1765962838);

-- --------------------------------------------------------

--
-- Table structure for table `service_name`
--

CREATE TABLE `service_name` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_name`
--

INSERT INTO `service_name` (`id`, `organization_id`, `branch_id`, `name`, `is_active`, `create_user`, `create_date`) VALUES
(2, 3, 0, 'LAPTOP', 1, 17, 1766813608),
(3, 3, 0, 'DESKTOP', 1, 17, 1766813615),
(4, 3, 0, 'DVR', 1, 17, 1766813621),
(5, 3, 0, 'MONITOR', 1, 17, 1766813630);

-- --------------------------------------------------------

--
-- Table structure for table `service_warranty`
--

CREATE TABLE `service_warranty` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `delivery_date` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `sales_price` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NOT NULL,
  `sales_date` int(11) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `replace_serial` varchar(255) DEFAULT NULL,
  `handover_to` varchar(255) DEFAULT NULL,
  `replace_given` tinyint(1) DEFAULT 0,
  `delivered_from_stock` tinyint(1) DEFAULT 0,
  `delivered_from_supplier` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `service_warranty`
--

INSERT INTO `service_warranty` (`id`, `organization_id`, `branch_id`, `ip_address`, `invoice_no`, `purchase_id`, `product_id`, `supplier_id`, `sales_id`, `customer_id`, `serial`, `delivery_date`, `purchase_price`, `sales_price`, `total`, `sales_date`, `warrenty`, `warrenty_days`, `status`, `is_active`, `create_user`, `create_date`, `replace_serial`, `handover_to`, `replace_given`, `delivered_from_stock`, `delivered_from_supplier`) VALUES
(19, 3, 1, '', 'SE-350501129', 305, 9, 1, 150, 1, 'aaa', 1767549600, 700.00, 44.00, 0.00, 1766253600, 44, 'Days', 'Replace in Same Product', 1, 17, 1766339319, '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_warranty_order`
--

CREATE TABLE `service_warranty_order` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `service_warranty_id` int(11) NOT NULL,
  `service_categories_id` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `service_warranty_order`
--

INSERT INTO `service_warranty_order` (`id`, `organization_id`, `branch_id`, `service_warranty_id`, `service_categories_id`, `amount`, `is_active`, `create_user`, `create_date`) VALUES
(31, 3, 1, 19, 4, 0.00, 1, 17, 1766339319);

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
(10, 3, 0, '', 0, 0, '', 'Master IT', '', '', 2, '', '', '', '', '01829', '', 0, '', 1761845407, 0, '', '', '', '', '', '', '', '', 0.00, 0, 0.00, '', '', '', '', '', '', 1, '0.png', 0, 1761845407),
(11, 3, 0, '', 0, 0, '', 'Master IT', '', '', 2, '', '', '', '', 'masterit', '', 0, '', 1761845407, 0, '', '', '', '', '', '', '', '', 0.00, 0, 0.00, '', '', '', '', '', '', 1, '0.png', 0, 1761845407);

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
-- Indexes for table `acc_customer_received`
--
ALTER TABLE `acc_customer_received`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_supplier_received`
--
ALTER TABLE `acc_supplier_received`
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
-- Indexes for table `partner_groups`
--
ALTER TABLE `partner_groups`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_item_serials`
--
ALTER TABLE `purchase_order_item_serials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
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
-- Indexes for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_id` (`sales_return_id`);

--
-- Indexes for table `service_attributes`
--
ALTER TABLE `service_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_name`
--
ALTER TABLE `service_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_warranty`
--
ALTER TABLE `service_warranty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_warranty_order`
--
ALTER TABLE `service_warranty_order`
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
-- AUTO_INCREMENT for table `acc_customer_received`
--
ALTER TABLE `acc_customer_received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT for table `acc_supplier_received`
--
ALTER TABLE `acc_supplier_received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `inv_stock_history`
--
ALTER TABLE `inv_stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `inv_stock_item_batch`
--
ALTER TABLE `inv_stock_item_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `inv_stock_item_serial`
--
ALTER TABLE `inv_stock_item_serial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `inv_stock_master`
--
ALTER TABLE `inv_stock_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2071;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `partner_groups`
--
ALTER TABLE `partner_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products_groups`
--
ALTER TABLE `products_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `purchase_item_serials`
--
ALTER TABLE `purchase_item_serials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `purchase_order_item_serials`
--
ALTER TABLE `purchase_order_item_serials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `purchase_return`
--
ALTER TABLE `purchase_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `sales_item_batch_profit_loss`
--
ALTER TABLE `sales_item_batch_profit_loss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `sales_order_item_serials`
--
ALTER TABLE `sales_order_item_serials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `sales_return`
--
ALTER TABLE `sales_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `service_attributes`
--
ALTER TABLE `service_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_name`
--
ALTER TABLE `service_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_warranty`
--
ALTER TABLE `service_warranty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `service_warranty_order`
--
ALTER TABLE `service_warranty_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD CONSTRAINT `sales_return_items_ibfk_1` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_return` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2025 at 11:29 AM
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
(55, 3, 1, 'Purchase', 59, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-22', 2350.00, 0.00, 1763803327, 0, 0, 'Purchase order ', 1, 17, 1763803327, 0, 0),
(56, 3, 1, 'Supplier Rebate', 59, 0, 26, 'Rebate', 'Rebate for order', '2025-11-22', 0.00, 1.00, 1763803327, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763803327, 0, 0),
(57, 3, 1, 'Purchase', 60, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-22', 21880.00, 0.00, 1763803455, 0, 0, 'Purchase order ', 1, 17, 1763803455, 0, 0),
(58, 3, 1, 'Supplier Rebate', 60, 0, 26, 'Rebate', 'Rebate for order', '2025-11-22', 0.00, 1.00, 1763803455, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763803455, 0, 0),
(59, 3, 1, 'Purchase', 61, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-22', 21880.00, 0.00, 1763803471, 0, 0, 'Purchase order ', 1, 17, 1763803471, 0, 0),
(60, 3, 1, 'Supplier Rebate', 61, 0, 26, 'Rebate', 'Rebate for order', '2025-11-22', 0.00, 1.00, 1763803471, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763803471, 0, 0),
(61, 3, 1, 'Purchase', 62, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-22', 21880.00, 0.00, 1763804685, 0, 0, 'Purchase order ', 1, 17, 1763804685, 0, 0),
(62, 3, 1, 'Supplier Rebate', 62, 0, 26, 'Rebate', 'Rebate for order', '2025-11-22', 0.00, 1.00, 1763804685, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763804685, 0, 0),
(63, 3, 1, 'Purchase', 63, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-22', 100.00, 0.00, 1763804727, 0, 0, 'Purchase order ', 1, 17, 1763804727, 0, 0),
(64, 3, 1, 'Supplier Rebate', 63, 0, 26, 'Rebate', 'Rebate for order', '2025-11-22', 0.00, 1.00, 1763804727, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763804727, 0, 0),
(65, 3, 1, 'Purchase', 64, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-22', 2400.00, 0.00, 1763808527, 0, 0, 'Purchase order ', 1, 17, 1763808527, 0, 0),
(66, 3, 1, 'Supplier Payment', 64, 0, 26, 'Supplier Account', 'Payment for order', '2025-11-22', 0.00, 180.00, 1763808527, 0, 1, 'Payment for order ', 1, 17, 1763808527, 0, 0),
(67, 3, 1, 'Supplier Rebate', 64, 0, 26, 'Rebate', 'Rebate for order', '2025-11-22', 0.00, 1.00, 1763808527, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763808527, 0, 0),
(68, 3, 1, 'Purchase', 65, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-24', 100.00, 0.00, 1763980887, 0, 0, 'Purchase order ', 1, 17, 1763980887, 0, 0),
(69, 3, 1, 'Supplier Rebate', 65, 0, 26, 'Rebate', 'Rebate for order', '2025-11-24', 0.00, 1.00, 1763980887, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763980887, 0, 0),
(70, 3, 1, 'Purchase', 66, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-24', 200.00, 0.00, 1763981133, 0, 0, 'Purchase order ', 1, 17, 1763981133, 0, 0),
(71, 3, 1, 'Supplier Rebate', 66, 0, 26, 'Rebate', 'Rebate for order', '2025-11-24', 0.00, 1.00, 1763981133, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763981133, 0, 0),
(72, 3, 1, 'Purchase', 67, 0, 26, 'Supplier Purchase', 'Purchase for order', '2025-11-24', 253750.00, 0.00, 1763981596, 0, 0, 'Purchase order ', 1, 17, 1763981596, 0, 0),
(73, 3, 1, 'Supplier Rebate', 67, 0, 26, 'Rebate', 'Rebate for order', '2025-11-24', 0.00, 1.00, 1763981596, 0, 0, 'Payment for order with rebate and discount ', 1, 17, 1763981596, 0, 0);

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
(26, 3, 'Mintu', 'Both', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 0, 0, 'Supplier', 500.00, -333978.00, 17, 1763532091, '2025-11-19 06:01:31', '2025-11-24 10:53:16');

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
(30, 3, 1, 59, 1, 6, 0.00, 0.00, 0.00, 0, 400.00, 100.00, 300.00, 2, 1, 17, 1763803329),
(31, 3, 1, 59, 1, 4, 0.00, 0.00, 0.00, 0, 400.00, 50.00, 700.00, 3, 1, 17, 1763803329),
(32, 3, 1, 62, 1, 4, 400.00, 50.00, 700.00, 3, 450.00, 0.00, 700.00, 23, 1, 17, 1763804693),
(33, 3, 1, 62, 1, 6, 400.00, 100.00, 300.00, 2, 5765.00, 0.00, 6888.00, 2, 1, 17, 1763804693),
(34, 3, 1, 63, 1, 6, 5765.00, 0.00, 6888.00, 4, 56.00, 44.00, 6888.00, 1, 1, 17, 1763804728),
(35, 3, 1, 64, 1, 3, 0.00, 0.00, 0.00, 0, 460.00, 40.00, 1000.00, 3, 1, 17, 1763808528),
(36, 3, 1, 64, 1, 4, 450.00, 0.00, 700.00, 26, 400.00, 50.00, 700.00, 2, 1, 17, 1763808529),
(37, 3, 1, 64, 1, 2, 0.00, 0.00, 0.00, 0, 3.00, 0.00, 0.00, 1, 1, 17, 1763808529),
(38, 3, 1, 65, 1, 6, 0.00, 0.00, 0.00, 0, 90.00, 10.00, 200.00, 1, 1, 17, 1763980888),
(39, 3, 1, 66, 1, 6, 90.00, 10.00, 200.00, 1, 180.00, 20.00, 6888.00, 1, 1, 17, 1763981134),
(40, 3, 1, 67, 1, 5, 0.00, 0.00, 0.00, 0, 200.00, 0.00, 500.00, 4, 1, 17, 1763981599),
(41, 3, 1, 67, 1, 4, 0.00, 0.00, 0.00, 0, 450.00, 0.00, 700.00, 1, 1, 17, 1763981599),
(42, 3, 1, 67, 1, 3, 0.00, 0.00, 0.00, 0, 500.00, 0.00, 1000.00, 5, 1, 17, 1763981599),
(43, 3, 1, 67, 1, 2, 0.00, 0.00, 0.00, 0, 500.00, 0.00, 800.00, 1, 1, 17, 1763981599);

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
(1, 3, 1, 62, 1, 6, 5765.00, 0.00, 6888.00, 2, 1, 'common', 'SN69218615541C7', 17, 1763804685, 0, 0),
(2, 3, 1, 63, 1, 6, 56.00, 44.00, 6888.00, 1, 1, 'common', '444444444', 17, 1763804727, 0, 0),
(3, 3, 1, 64, 1, 3, 460.00, 40.00, 1000.00, 3, 1, 'common', 'SN69219510A1BE7', 17, 1763808527, 0, 0),
(4, 3, 1, 65, 1, 6, 90.00, 10.00, 200.00, 1, 1, 'common', 'assfasdsdsads', 17, 1763980887, 0, 0),
(5, 3, 1, 66, 1, 6, 180.00, 20.00, 6888.00, 1, 1, 'common', '7777777', 17, 1763981133, 0, 0),
(6, 3, 1, 67, 1, 3, 500.00, 0.00, 1000.00, 5, 1, 'common', 'dsfffffffffff', 17, 1763981596, 0, 0);

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
  `purchase_price` decimal(10,0) NOT NULL,
  `rebate` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,0) NOT NULL,
  `quanity` int(11) NOT NULL,
  `is_available` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_user` int(11) NOT NULL,
  `update_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inv_stock_item_serial`
--

INSERT INTO `inv_stock_item_serial` (`id`, `organization_id`, `branch_id`, `purchase_id`, `store_id`, `product_id`, `purchase_price`, `rebate`, `sales_price`, `quanity`, `is_available`, `serial_type`, `serial`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
(63, 3, 1, 1, 1, 4, 400, 50.00, 700, 1, 1, 'unique', 'RRRRRRRRRRRRRRR', 17, 1763803327, 0, 0),
(64, 3, 1, 59, 1, 6, 400, 100.00, 300, 1, 1, 'common', 'SN692180C0B5B2E', 17, 1763803327, 0, 0),
(65, 3, 1, 59, 1, 6, 400, 100.00, 300, 1, 1, 'common', 'SN692180C0EC5B5', 17, 1763803327, 0, 0),
(66, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921860DD8410', 17, 1763804685, 0, 0),
(67, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921860E084F9', 17, 1763804685, 0, 0),
(68, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921860E30645', 17, 1763804685, 0, 0),
(69, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921860E6DD97', 17, 1763804685, 0, 0),
(70, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921860EE89C8', 17, 1763804685, 0, 0),
(71, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ692186103E871', 17, 1763804685, 0, 0),
(72, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921861262889', 17, 1763804685, 0, 0),
(73, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218612A17F4', 17, 1763804685, 0, 0),
(74, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218612B8D1C', 17, 1763804685, 0, 0),
(75, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218612CE788', 17, 1763804685, 0, 0),
(76, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921861310667', 17, 1763804685, 0, 0),
(77, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921861336925', 17, 1763804685, 0, 0),
(78, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218613535D9', 17, 1763804685, 0, 0),
(79, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921861379AA1', 17, 1763804685, 0, 0),
(80, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218613A78DB', 17, 1763804685, 0, 0),
(81, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218613C7F6D', 17, 1763804685, 0, 0),
(82, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ6921861406E8A', 17, 1763804685, 0, 0),
(83, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218614326AF', 17, 1763804685, 0, 0),
(84, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ692186145AFBD', 17, 1763804685, 0, 0),
(85, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218614D5323', 17, 1763804685, 0, 0),
(86, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ69218614F21F4', 17, 1763804685, 0, 0),
(87, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ692186151B3F2', 17, 1763804685, 0, 0),
(88, 3, 1, 62, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'UNQ692186153A91F', 17, 1763804685, 0, 0),
(89, 3, 1, 1, 1, 4, 400, 50.00, 700, 1, 1, 'unique', '333333333333', 17, 1763808527, 0, 0),
(90, 3, 1, 1, 1, 4, 400, 50.00, 700, 1, 1, 'unique', 'fsdfdsdffsd', 17, 1763808527, 0, 0),
(91, 3, 1, 1, 1, 2, 3, 0.00, 0, 1, 1, 'unique', 'sdfffffdffd', 17, 1763808527, 0, 0),
(92, 3, 1, 1, 1, 5, 200, 0.00, 500, 1, 1, 'unique', 'sadddddddddsds', 17, 1763981596, 0, 0),
(93, 3, 1, 1, 1, 5, 200, 0.00, 500, 1, 1, 'unique', 'dfdfgfg', 17, 1763981596, 0, 0),
(94, 3, 1, 1, 1, 5, 200, 0.00, 500, 1, 1, 'unique', 'fdgfgg', 17, 1763981596, 0, 0),
(95, 3, 1, 1, 1, 5, 200, 0.00, 500, 1, 1, 'unique', 'ggdgdgdfn', 17, 1763981596, 0, 0),
(96, 3, 1, 1, 1, 4, 450, 0.00, 700, 1, 1, 'unique', 'dsffffffffffffff', 17, 1763981596, 0, 0),
(97, 3, 1, 1, 1, 2, 500, 0.00, 800, 1, 1, 'unique', '555555555555555555', 17, 1763981596, 0, 0);

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
(26, 3, 1, 1, 6, 180.00, 20.00, 6888.00, 2, 10, 'Days', 1, 17, 1763980888, 17, 1763981134),
(27, 3, 1, 1, 5, 200.00, 0.00, 500.00, 4, 0, 'Days', 1, 17, 1763981599, 0, 0),
(28, 3, 1, 1, 4, 450.00, 0.00, 700.00, 1, 0, 'Days', 1, 17, 1763981599, 0, 0),
(29, 3, 1, 1, 3, 500.00, 0.00, 1000.00, 5, 1, 'Days', 1, 17, 1763981599, 0, 0),
(30, 3, 1, 1, 2, 500.00, 0.00, 800.00, 1, 3, 'Days', 1, 17, 1763981599, 0, 0);

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
(1, 0, 0, 1, 'system', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2025-11-25 10:41:20', '2024-10-21 15:42:57', '2025-11-25 10:41:20'),
(2, 0, 0, 2, 'litan@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 1, 1, '2024-11-27 11:06:55', '2024-10-21 15:42:57', '2025-10-30 14:29:54'),
(5, 0, 0, 6, 'admin@gmail.com', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 2, 1, '2025-11-01 14:35:31', '2024-11-16 23:35:56', '2025-11-01 14:35:31'),
(17, 3, 1, 10, '01829', 'UHZVdVBOTWI0VkwrN0MvQjRRRUZkdz09', 3, 1, '2025-11-25 10:45:43', '2025-10-30 23:30:08', '2025-11-25 10:45:43');

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
(357, 'New Record inserted On inv_stock_item_serial id 97', 97, 17, 'Insert', '::1', 'Windows 10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '2025-11-24 10:53:19', '2025-11-24');

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
(24, 'Sales List', 'sales', 22, 3, '', 1, 1763972971);

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
(6, 3, '', 'HIKVISION CAMERA 2MP DS-2CE16DOT-IRPF', 4, 4, 3, 'common', 5765.00, 'Inclusive', 0.00, 0.00, 5765.00, 6888.00, 7, 'Days', 0, 0, 1, 0, 'HIKVISION CAMERA 2MP DS-2CE16DOT-IRPF', '0.png', 1, 17, 1762407945);

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
(59, 3, 1, '', '22112025151307', 1, 'GRN-0001', 1763748000, 26, 1, 5, 2350.00, 0.00, 350.00, 2000.00, 0.00, 2000.00, 1, 17, 1763803327),
(60, 3, 1, '', '22112025152209', 2, 'GRN-0002', 1763748000, 26, 1, 25, 21880.00, 0.00, 0.00, 21880.00, 0.00, 21880.00, 1, 17, 1763803455),
(61, 3, 1, '', '22112025152209', 3, 'GRN-0003', 1763748000, 26, 1, 25, 21880.00, 0.00, 0.00, 21880.00, 0.00, 21880.00, 1, 17, 1763803471),
(62, 3, 1, '', '22112025152209', 4, 'GRN-0004', 1763748000, 26, 1, 25, 21880.00, 0.00, 0.00, 21880.00, 0.00, 21880.00, 1, 17, 1763804685),
(63, 3, 1, '', '22112025154454', 5, 'GRN-0005', 1763748000, 26, 1, 1, 100.00, 0.00, 44.00, 56.00, 0.00, 56.00, 1, 17, 1763804727),
(64, 3, 1, '', '22112025162500', 6, 'GRN-0006', 1763748000, 26, 1, 6, 2403.00, 3.00, 220.00, 2180.00, 180.00, 2000.00, 1, 17, 1763808527),
(65, 3, 1, '', '24112025163805', 7, 'GRN-0007', 1763920800, 26, 1, 1, 100.00, 0.00, 10.00, 90.00, 0.00, 90.00, 1, 17, 1763980887),
(66, 3, 1, '', '24112025164128', 8, 'GRN-0008', 1763920800, 26, 1, 1, 200.00, 0.00, 20.00, 180.00, 0.00, 180.00, 1, 17, 1763981133),
(67, 3, 1, '', '24112025165159', 9, 'GRN-0009', 1763920800, 26, 1, 11, 253750.00, 0.00, 0.00, 253750.00, 0.00, 253750.00, 1, 17, 1763981596);

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
(70, 3, '22112025151307', 0, NULL, 'Approved', 17, 1763803307),
(71, 3, '22112025152209', 0, NULL, 'Approved', 17, 1763803371),
(72, 3, '22112025154454', 0, NULL, 'Approved', 17, 1763804722),
(73, 3, '22112025162500', 0, NULL, 'Approved', 17, 1763808474),
(74, 3, '24112025153131', 0, NULL, 'Pending', 17, 1763976694),
(75, 3, '24112025153229', 0, NULL, 'Pending', 17, 1763976751),
(76, 3, '24112025163805', 0, NULL, 'Approved', 17, 1763980732),
(77, 3, '24112025164128', 0, NULL, 'Approved', 17, 1763981125),
(78, 3, '24112025165159', 0, NULL, 'Approved', 17, 1763981534);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
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

INSERT INTO `purchase_items` (`id`, `invoice_id`, `serial_type`, `product_id`, `price`, `qty`, `with_total_rebate`, `rebate`, `total_rebate`, `sub_total`, `sales_price`, `warrenty`, `warrenty_days`, `serial_number`, `barcode_serial`, `create_date`) VALUES
(389, '22112025151307', 'common', 6, 500.00, 2, 0.00, 100.00, 200.00, 800.00, 300.00, 7, 'Days', NULL, '', 1763803307),
(390, '22112025151307', 'unique', 4, 450.00, 3, 0.00, 50.00, 150.00, 1200.00, 700.00, 0, 'Days', NULL, '', 1763803319),
(391, '22112025152209', 'unique', 4, 450.00, 23, 0.00, 0.00, 0.00, 10350.00, 700.00, 0, 'Days', NULL, '', 1763803372),
(392, '22112025152209', 'common', 6, 5765.00, 2, 0.00, 0.00, 0.00, 11530.00, 6888.00, 7, 'Days', NULL, '', 1763803445),
(393, '22112025154454', 'common', 6, 100.00, 1, 0.00, 44.00, 44.00, 56.00, 6888.00, 7, 'Days', NULL, '444444444', 1763804722),
(394, '22112025162500', 'common', 3, 500.00, 3, 0.00, 40.00, 120.00, 1380.00, 1000.00, 1, 'Days', NULL, '', 1763808474),
(395, '22112025162500', 'unique', 4, 450.00, 2, 0.00, 50.00, 100.00, 800.00, 700.00, 0, 'Days', NULL, '', 1763808483),
(396, '22112025162500', 'unique', 2, 3.00, 1, 0.00, 0.00, 0.00, 3.00, 0.00, 3, 'Days', NULL, '', 1763808501),
(397, '24112025153131', 'unique', 5, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0, '', NULL, '', 1763976694),
(398, '24112025163805', 'common', 6, 100.00, 1, 0.00, 10.00, 10.00, 90.00, 200.00, 7, 'Days', NULL, 'assfasdsdsads', 1763980732),
(399, '24112025164128', 'common', 6, 200.00, 1, 0.00, 20.00, 20.00, 180.00, 6888.00, 10, 'Days', NULL, '7777777', 1763981125),
(400, '24112025165159', 'unique', 5, 200.00, 4, 0.00, 0.00, 0.00, 800.00, 500.00, 0, 'Days', NULL, '', 1763981535),
(401, '24112025165159', 'unique', 4, 450.00, 1, 0.00, 0.00, 0.00, 450.00, 700.00, 0, 'Days', NULL, '', 1763981554),
(402, '24112025165159', 'common', 3, 500.00, 5, 0.00, 0.00, 0.00, 2500.00, 1000.00, 1, 'Days', NULL, 'dsfffffffffff', 1763981564),
(403, '24112025165159', 'unique', 2, 500.00, 1, 0.00, 0.00, 0.00, 250000.00, 800.00, 3, 'Days', NULL, 'dsfffffffffff', 1763981584);

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
(145, 390, 'RRRRRRRRRRRRRRR'),
(146, 395, '333333333333'),
(147, 395, 'fsdfdsdffsd'),
(148, 396, 'sdfffffdffd'),
(149, 400, 'sadddddddddsds'),
(150, 400, 'dfdfgfg'),
(151, 400, 'fdgfgg'),
(152, 400, 'ggdgdgdfn'),
(153, 401, 'dsffffffffffffff'),
(154, 403, '555555555555555555');

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
(24, 3, 24);

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

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `serial_type` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_price` decimal(16,2) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `with_total_rebate` decimal(16,2) NOT NULL,
  `rebate` decimal(16,2) NOT NULL,
  `total_rebate` decimal(16,2) NOT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `warrenty` int(11) NOT NULL,
  `warrenty_days` varchar(20) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `inv_stock_history`
--
ALTER TABLE `inv_stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `inv_stock_item_batch`
--
ALTER TABLE `inv_stock_item_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inv_stock_item_serial`
--
ALTER TABLE `inv_stock_item_serial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `inv_stock_master`
--
ALTER TABLE `inv_stock_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products_groups`
--
ALTER TABLE `products_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `purchase_item_serials`
--
ALTER TABLE `purchase_item_serials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_menu`
--
ALTER TABLE `role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

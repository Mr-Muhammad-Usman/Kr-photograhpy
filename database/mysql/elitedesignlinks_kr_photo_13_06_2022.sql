-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 13, 2022 at 06:54 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elitedesignlinks_kr_photo`
--

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `competition_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `soft_delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `title`, `competition_date`, `amount`, `status`, `url`, `created_at`, `updated_at`, `soft_delete`) VALUES
(4, 'Qui facere ut itaque', '2022-05-20', 8, 0, 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-11 09:07:42', '2022-06-01 17:51:01', '2022-06-01 17:51:01'),
(5, 'Dolorem totam conseq', '2022-05-19', 10, 0, 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-11 10:22:43', '2022-06-03 15:25:08', '2022-06-03 15:25:08'),
(19, 'ABC&DEF', '2022-06-01', 50, 0, 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-01 13:42:12', '2022-06-01 17:51:36', '2022-06-01 17:51:36'),
(20, 'ABC', '2022-06-02', 60, 0, 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-01 18:40:21', '2022-06-03 15:38:45', '2022-06-03 15:38:45'),
(21, 'DEF', '2022-06-03', 50, 0, 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-06-01 18:40:45', '2022-06-01 18:51:36', '2022-06-01 18:51:36'),
(22, 'GHI', '2022-06-05', 110, 1, 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-06-01 18:41:04', '2022-06-01 18:41:04', NULL),
(23, 'XYZ', '2022-06-09', 99, 1, 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 12:25:13', '2022-06-09 18:19:07', NULL),
(24, 'test', NULL, NULL, 0, NULL, '2022-06-07 15:10:01', '2022-06-07 18:41:44', '2022-06-07 18:41:44'),
(25, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:13:01', '2022-06-07 18:41:46', '2022-06-07 18:41:46'),
(26, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:14:02', '2022-06-07 18:41:48', '2022-06-07 18:41:48'),
(27, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:15:01', '2022-06-07 18:41:50', '2022-06-07 18:41:50'),
(28, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:16:01', '2022-06-07 18:41:52', '2022-06-07 18:41:52'),
(29, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:17:01', '2022-06-07 18:41:53', '2022-06-07 18:41:53'),
(30, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:18:01', '2022-06-07 18:41:55', '2022-06-07 18:41:55'),
(31, 'UNKNOWN', NULL, NULL, 0, NULL, '2022-06-07 15:19:02', '2022-06-07 18:41:57', '2022-06-07 18:41:57'),
(32, 'Australia 1', '2022-06-10', 99, 1, NULL, '2022-06-09 16:44:36', '2022-06-09 16:44:36', NULL),
(33, 'My New Competitions', '2022-06-10', 47, 1, 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-09 18:54:18', '2022-06-09 18:56:13', NULL),
(34, 'Boston-Day1', '2022-06-13', 20, 1, 'https://player.vimeo.com/video/712594918?h=8373aa2161&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479', '2022-06-09 23:36:09', '2022-06-13 10:04:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_codes`
--

CREATE TABLE `coupon_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `soft_delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon_codes`
--

INSERT INTO `coupon_codes` (`id`, `code`, `discount`, `competition_id`, `quantity`, `status`, `created_at`, `updated_at`, `soft_delete`) VALUES
(14, 'coupon', '100', 5, 10, 0, '2022-05-25 13:33:27', '2022-06-03 15:25:08', '2022-06-03 15:25:08'),
(16, 'coupon2nd', '70', 5, 14, 0, '2022-05-25 14:57:53', '2022-06-03 15:25:08', '2022-06-03 15:25:08'),
(21, 'couponLasts', '40', 19, 14, 0, '2022-06-01 14:14:04', '2022-06-01 17:51:36', '2022-06-01 17:51:36'),
(22, 'couponABC', '10', 20, 1, 0, '2022-06-01 18:41:36', '2022-06-03 15:38:45', '2022-06-03 15:38:45'),
(23, 'couponDEF', '100', 21, 12, 0, '2022-06-01 18:42:04', '2022-06-01 18:51:36', '2022-06-01 18:51:36'),
(24, 'couponGHI', '70', 22, 4, 1, '2022-06-01 18:42:29', '2022-06-07 18:32:51', NULL),
(25, 'couponDEF2', '80', 21, 15, 0, '2022-06-01 18:43:06', '2022-06-01 18:51:36', '2022-06-01 18:51:36'),
(26, 'couponXYZfrees', '100', 23, 0, 1, '2022-06-03 12:25:52', '2022-06-03 15:23:07', NULL),
(27, 'couponXYZ', '25', 23, 62, 1, '2022-06-03 12:26:20', '2022-06-12 06:41:58', NULL),
(28, 'MyCoupon', '50', 20, 5, 0, '2022-06-03 15:25:48', '2022-06-03 15:38:45', '2022-06-03 15:38:45'),
(29, 'FreeCoupon', '100', 34, 7, 1, '2022-06-04 11:41:37', '2022-06-12 09:33:01', NULL),
(32, 'free day', '100', 34, 0, 1, '2022-06-09 23:42:13', '2022-06-09 23:42:13', NULL),
(33, 'another', '100', 34, 9999, 1, '2022-06-09 23:44:19', '2022-06-09 23:45:39', NULL),
(34, 'Corrupti xyz', '100', 32, 3, 1, '2022-06-10 11:15:08', '2022-06-10 09:49:04', NULL),
(35, 'Officiis', '100', 33, 1, 1, '2022-06-10 11:15:56', '2022-06-10 10:16:39', NULL),
(39, 'Est aliquid eveniet', '100', 33, 675, 1, '2022-06-10 10:20:40', '2022-06-10 10:39:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_details`
--

CREATE TABLE `coupon_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon_details`
--

INSERT INTO `coupon_details` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(10, 100, 15, '2022-05-25 11:09:47', '2022-05-25 11:09:47'),
(11, 104, 11, '2022-05-25 13:04:08', '2022-05-25 13:04:08'),
(12, 109, 15, '2022-05-26 06:24:08', '2022-05-26 06:24:08'),
(13, 116, 19, '2022-05-27 12:32:56', '2022-05-27 12:32:56'),
(14, 116, 15, '2022-05-27 12:38:14', '2022-05-27 12:38:14'),
(15, 1, 19, '2022-06-01 11:55:19', '2022-06-01 11:55:19'),
(16, 117, 16, '2022-06-01 13:15:07', '2022-06-01 13:15:07'),
(17, 117, 21, '2022-06-01 15:10:20', '2022-06-01 15:10:20'),
(18, 121, 22, '2022-06-01 18:56:04', '2022-06-01 18:56:04'),
(19, 121, 24, '2022-06-01 19:00:26', '2022-06-01 19:00:26'),
(20, 114, 22, '2022-06-03 11:18:27', '2022-06-03 11:18:27'),
(21, 117, 22, '2022-06-03 11:27:54', '2022-06-03 11:27:54'),
(22, 122, 22, '2022-06-03 12:23:15', '2022-06-03 12:23:15'),
(23, 117, 27, '2022-06-03 12:34:28', '2022-06-03 12:34:28'),
(24, 123, 27, '2022-06-03 13:48:54', '2022-06-03 13:48:54'),
(25, 127, 26, '2022-06-03 15:12:35', '2022-06-03 15:12:35'),
(26, 127, 27, '2022-06-03 15:17:58', '2022-06-03 15:17:58'),
(27, 114, 26, '2022-06-03 15:23:07', '2022-06-03 15:23:07'),
(28, 128, 29, '2022-06-04 11:43:26', '2022-06-04 11:43:26'),
(29, 1, 29, '2022-06-06 10:26:33', '2022-06-06 10:26:33'),
(30, 117, 29, '2022-06-07 18:29:26', '2022-06-07 18:29:26'),
(31, 117, 24, '2022-06-07 18:32:51', '2022-06-07 18:32:51'),
(32, 114, 29, '2022-06-09 16:39:03', '2022-06-09 16:39:03'),
(33, 133, 31, '2022-06-09 19:01:12', '2022-06-09 19:01:12'),
(34, 133, 29, '2022-06-09 19:03:43', '2022-06-09 19:03:43'),
(35, 114, 31, '2022-06-09 19:07:25', '2022-06-09 19:07:25'),
(36, 134, 31, '2022-06-09 23:04:18', '2022-06-09 23:04:18'),
(37, 134, 33, '2022-06-09 23:45:39', '2022-06-09 23:45:39'),
(38, 133, 35, '2022-06-10 12:05:00', '2022-06-10 12:05:00'),
(39, 133, 35, '2022-06-10 12:09:13', '2022-06-10 12:09:13'),
(40, 133, 36, '2022-06-10 12:11:38', '2022-06-10 12:11:38'),
(41, 133, 27, '2022-06-10 12:16:10', '2022-06-10 12:16:10'),
(42, 114, 35, '2022-06-10 12:23:31', '2022-06-10 12:23:31'),
(43, 133, 39, '2022-06-10 10:23:53', '2022-06-10 10:23:53'),
(44, 135, 39, '2022-06-10 10:39:06', '2022-06-10 10:39:06'),
(45, 134, 29, '2022-06-12 09:33:01', '2022-06-12 09:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `forget_pass`
--

CREATE TABLE `forget_pass` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forget_pass`
--

INSERT INTO `forget_pass` (`id`, `user_id`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 110, '202205261653583943460', 0, '2022-05-26 11:52:23', '2022-05-26 12:34:22'),
(2, 110, '202205261653587460834', 0, '2022-05-26 12:51:00', '2022-05-26 12:52:14'),
(3, 110, '202205261653588520828', 0, '2022-05-26 13:08:40', '2022-05-26 13:09:30'),
(4, 114, '202205261653590723732', 0, '2022-05-26 18:45:23', '2022-05-26 18:48:25'),
(5, 117, '202206011654089643396', 0, '2022-06-01 13:20:43', '2022-06-01 13:22:54'),
(6, 117, '202206031654255331953', 0, '2022-06-03 11:22:11', '2022-06-03 11:23:18'),
(7, 117, '202206071654627056281', 1, '2022-06-07 18:37:36', '2022-06-07 18:37:36'),
(8, 114, '202206091654800088398', 0, '2022-06-09 18:41:28', '2022-06-09 18:42:15'),
(9, 114, '202206091654800184869', 1, '2022-06-09 18:43:04', '2022-06-09 18:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `competition_name` varchar(255) DEFAULT NULL,
  `competition_date` date DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `payer_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `redeem_code` varchar(255) DEFAULT NULL,
  `receipt_url` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `soft_delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `competition_name`, `competition_date`, `user_id`, `price`, `payer_id`, `status`, `redeem_code`, `receipt_url`, `payment_method`, `url`, `created_at`, `updated_at`, `soft_delete`) VALUES
(94, '5', '2022-05-19', '109', '0.00', NULL, 'free', '202205261653563976854882', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-26 06:19:36', '2022-06-10 11:35:43', '2022-06-10 11:35:43'),
(96, '4', '2022-05-20', '109', '8.00', 'PAYID-MKHWNMQ60P06552ND181764J', 'approved', '202205261653565117122004', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-26 06:38:37', '2022-05-26 06:38:37', NULL),
(97, '5', '2022-05-19', '114', '10.00', 'PAYID-MKH42EI55E71814KA0140107', 'approved', '202205261653591445523893', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-26 18:57:25', '2022-05-26 18:57:25', NULL),
(98, '5', '2022-05-19', '115', '0.00', NULL, 'free', '202205271653652083162985', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-27 11:48:03', '2022-05-27 11:48:03', NULL),
(109, '19', '2022-06-01', '117', '30.00', 'PAYID-MKLYCLI4RX70098N89598117', 'approved', '202206011654096220225496', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-01 15:10:20', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(110, '5', '2022-05-19', '118', '0.00', NULL, 'free', '202206011654106076930367', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-06-01 17:54:36', '2022-06-01 17:54:36', NULL),
(111, '5', '2022-05-19', '118', '0.00', NULL, 'free', '202206011654106191570197', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-06-01 17:56:31', '2022-06-01 17:56:31', NULL),
(112, '5', '2022-05-19', '120', '0.00', NULL, 'free', '202206011654108479439060', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-06-01 18:34:39', '2022-06-01 18:34:39', NULL),
(113, '21', '2022-06-03', '121', '0.00', NULL, 'free', '202206011654109422359521', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-06-01 18:50:22', '2022-06-10 11:36:38', '2022-06-10 11:36:38'),
(114, '20', '2022-06-02', '121', '54.00', 'PAYID-MKL3MJY6UV80934GT351940K', 'approved', '202206011654109764600373', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-01 18:56:04', '2022-06-01 18:56:04', NULL),
(115, '22', '2022-06-05', '121', '110.00', 'PAYID-MKL3M2A17D742907X694863K', 'approved', '202206011654109809763826', NULL, 'paypal', 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-06-01 18:56:49', '2022-06-01 18:56:49', NULL),
(116, '22', '2022-06-05', '121', '33.00', 'PAYID-MKL3OQA0EB252293P174520E', 'approved', '202206011654110026787311', NULL, 'paypal', 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-06-01 19:00:26', '2022-06-01 19:00:26', NULL),
(117, '20', '2022-06-02', '114', '54.00', 'PAYID-MKM63VA7MY79616JF8822226', 'approved', '202206031654255107551869', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-03 11:18:27', '2022-06-03 11:18:27', NULL),
(118, '20', '2022-06-02', '117', '54.00', 'PAYID-MKM67RQ2FS09695S7736190R', 'approved', '202206031654255674612919', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-03 11:27:54', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(119, '20', '2022-06-02', '122', '54.00', 'PAYID-MKM72FI2NX41619CW2068359', 'approved', '202206031654258995932569', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-03 12:23:15', '2022-06-10 11:36:40', '2022-06-10 11:36:40'),
(120, '23', '2022-06-03', '1', '0.00', NULL, 'free', '202206031654259531239109', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 12:32:11', '2022-06-03 12:32:11', NULL),
(121, '23', '2022-06-03', '117', '74.25', 'PAYID-MKM77SI8FT71294ED040100A', 'approved', '202206031654259668671172', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 12:34:28', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(122, '23', '2022-06-03', '117', '0.00', NULL, 'free', '202206031654259782678074', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 12:36:22', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(123, '23', '2022-06-03', '117', '0.00', NULL, 'free', '202206031654263754664135', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 13:42:34', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(124, '23', '2022-06-03', '117', '0.00', NULL, 'free', '202206031654263899934268', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 13:44:59', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(125, '23', '2022-06-03', '123', '99.00', 'PAYID-MKNBCBI62659647TN727180H', 'approved', '202206031654264097806182', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 13:48:17', '2022-06-10 11:36:43', '2022-06-10 11:36:43'),
(126, '23', '2022-06-03', '123', '74.25', 'PAYID-MKNBCOY26151928H2399253H', 'approved', '202206031654264134347842', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 13:48:54', '2022-06-03 13:48:54', NULL),
(127, '23', '2022-06-03', '124', '0.00', NULL, 'free', '202206031654264337557142', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 13:52:17', '2022-06-03 13:52:17', NULL),
(128, '23', '2022-06-03', '127', '0.00', NULL, 'free', '202206031654269155332709', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 15:12:35', '2022-06-03 15:12:35', NULL),
(129, '23', '2022-06-03', '127', '74.25', 'PAYID-MKNCKOI0V685515FB721705K', 'approved', '202206031654269478557295', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 15:17:58', '2022-06-03 15:17:58', NULL),
(130, '20', '2022-06-02', '114', '60.00', 'PAYID-MKNCNIQ0AE85237TM5023440', 'approved', '202206031654269697383558', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-03 15:21:37', '2022-06-03 15:21:37', NULL),
(131, '23', '2022-06-03', '114', '0.00', NULL, 'free', '202206031654269787642715', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 15:23:07', '2022-06-03 15:23:07', NULL),
(132, '23', '2022-06-03', '128', '0.00', NULL, 'free', '202206041654343006336506', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-04 11:43:26', '2022-06-10 11:46:43', '2022-06-10 11:46:43'),
(133, '23', '2022-06-03', '1', '0.00', NULL, 'free', '202206061654511193577930', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-06 10:26:33', '2022-06-06 10:26:33', NULL),
(134, '23', '2022-06-03', '117', '0.00', NULL, 'free', '202206071654626566154937', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-07 18:29:26', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(135, '22', '2022-06-05', '117', '33.00', 'PAYID-MKPZTFY6F813432N7727310G', 'approved', '202206071654626771748004', NULL, 'paypal', 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-06-07 18:32:51', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(136, '23', '2022-06-03', '114', '0.00', NULL, 'free', '202206091654792743663234', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-09 16:39:03', '2022-06-09 16:39:03', NULL),
(137, '33', '2022-06-10', '133', '0.00', NULL, 'free', '202206091654801272424358', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-09 19:01:12', '2022-06-09 19:01:12', NULL),
(138, '23', '2022-06-09', '133', '0.00', NULL, 'free', '202206091654801423572004', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-09 19:03:43', '2022-06-09 19:03:43', NULL),
(139, '33', '2022-06-10', '114', '0.00', NULL, 'free', '202206091654801645596989', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-09 19:07:25', '2022-06-09 19:07:25', NULL),
(140, '33', '2022-06-10', '132', '0.00', NULL, 'free', '202206091654815857176395', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-09 23:04:17', '2022-06-09 23:04:17', NULL),
(141, '33', '2022-06-10', '134', '0.00', NULL, 'free', '202206091654815858117172', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-09 23:04:18', '2022-06-09 23:04:18', NULL),
(142, '34', '2022-06-09', '134', '0.00', NULL, 'free', '202206091654818339477828', NULL, 'free coupon', NULL, '2022-06-09 23:45:39', '2022-06-09 23:45:39', NULL),
(143, '33', '2022-06-10', '133', '0.00', NULL, 'free', '202206101654862700681874', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 12:05:00', '2022-06-10 12:05:00', NULL),
(144, '33', '2022-06-10', '133', '0.00', NULL, 'free', '202206101654862953255352', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 12:09:13', '2022-06-10 12:09:13', NULL),
(145, '33', '2022-06-10', '133', '0.00', NULL, 'free', '202206101654863098669747', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 12:11:38', '2022-06-10 12:11:38', NULL),
(146, '23', '2022-06-09', '133', '74.25', 'PAYID-MKRTLOQ4PJ25975DD059650W', 'approved', '202206101654863370627378', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-10 12:16:10', '2022-06-10 12:16:10', NULL),
(147, '32', '2022-06-10', '114', '99.00', 'PAYID-MKRTO7A3JM906150R457752U', 'approved', '202206101654863751230597', NULL, 'paypal', NULL, '2022-06-10 12:22:31', '2022-06-10 12:22:31', NULL),
(148, '33', '2022-06-10', '114', '0.00', NULL, 'free', '202206101654863811173316', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 12:23:31', '2022-06-10 12:23:31', NULL),
(149, '33', '2022-06-10', '133', '0.00', NULL, 'free', '202206101654881833321849', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 10:23:53', '2022-06-10 10:23:53', NULL),
(150, '33', '2022-06-10', '135', '47.00', 'PAYID-MKRX5IA8B251162UY983173A', 'approved', '202206101654882027783689', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 10:27:07', '2022-06-10 10:27:07', NULL),
(151, '33', '2022-06-10', '135', '0.00', NULL, 'free', '202206101654882746376975', NULL, 'free coupon', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-10 10:39:06', '2022-06-10 10:39:06', NULL),
(152, '34', '2022-06-12', '134', '0.00', NULL, 'free', '202206121655051581673785', NULL, 'free coupon', NULL, '2022-06-12 09:33:01', '2022-06-12 09:33:01', NULL),
(153, '34', '2022-06-13', '114', '20.00', 'PAYID-MKTW4OI4L739338F48650936', 'approved', '202206131655139914794177', NULL, 'paypal', 'https://player.vimeo.com/video/712594918?h=8373aa2161&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479', '2022-06-13 10:05:14', '2022-06-13 10:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `email` varchar(550) NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(555) DEFAULT NULL,
  `user_role` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `server_IP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `soft_delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `provider_id`, `avatar`, `password`, `user_role`, `status`, `server_IP`, `created_at`, `updated_at`, `soft_delete`) VALUES
(1, 'admins', 'admin@mail.com', NULL, NULL, '$2y$10$AFOVyDyzngRmzEmusLH2vutx0Wj4Fax3usD4k9zMw5eoeWPhPGoIG', 1, 1, NULL, '2022-05-25 14:11:10', '2022-06-03 12:13:33', NULL),
(105, 'hosuruju', 'bejasa@mailinator.com', NULL, NULL, '$2y$10$.qMW88rL7efSgu43R68.9eugrjbelJPM5VnSkkDjQzm8bu7U2/7L.', 0, 1, NULL, '2022-05-25 13:05:54', '2022-06-03 11:15:12', NULL),
(109, 'MDs', 'sahifim205@steamoh.com', NULL, NULL, '$2y$10$Tli/pvRcg9ncVQgWcQtwKucOmrVGpbL6XdEsmroUSSdRT8QpL7VBy', 0, 0, NULL, '2022-05-26 06:19:13', '2022-06-10 11:35:43', '2022-06-10 11:35:43'),
(111, 'jeqav', 'pufes@mailinator.com', NULL, NULL, '$2y$10$Z1VBnXLo8UIyZRKjYsaXmeAgWX.bs1oVs8hxOnq1gVoP346WSRE32', 0, 0, NULL, '2022-05-26 12:53:14', '2022-05-26 12:53:14', NULL),
(113, 'dusiz', 'lyzo@mailinator.com', NULL, NULL, '$2y$10$gQlzwoEtBMRmXfBwAN7nUOgyW1BFiCOR5uKzLjqrShL5uzamzg/b.', 0, 0, NULL, '2022-05-26 13:02:20', '2022-05-26 13:02:20', NULL),
(114, 'devMD', 'devpetyr911@gmail.com', NULL, NULL, '$2y$10$tx8N78iFPDpzCXaxG2QCx.llfbMgSZye5v29gDjVAGkYmW16dWKi6', 0, 1, '0', '2022-05-26 13:02:59', '2022-06-13 11:32:46', NULL),
(115, 'usman', 'musmansaeed25@gmail.com', NULL, NULL, '$2y$10$3glBsB/FHU.evwimbVPLPuSRI2VTV.mlafd0Ig6l8nTTzDqrCH4Nu', 0, 1, NULL, '2022-05-27 11:47:45', '2022-06-09 18:37:49', NULL),
(116, 'billal', 'vyred@mailinator.com', NULL, NULL, '$2y$10$6AA9H5pl06qXi2QK1D1DweQJlYN3LZGRTb6NTmPjMssNvn8CxU4te', 0, 0, NULL, '2022-05-27 12:31:41', '2022-05-27 12:35:31', NULL),
(117, 'Best', 'bestsdevelopers@gmail.com', NULL, NULL, '$2y$10$44g4XRj69mYg/462mk4e3uNG.9VcYBvwB8pp1a0WWw635rr6ucR.a', 0, 1, '0', '2022-06-01 11:59:46', '2022-06-10 11:49:47', '2022-06-10 11:49:47'),
(118, 'MartinGarix', 'martingarix7878@gmail.com', NULL, NULL, '$2y$10$0Np7z2zyvg7nSeBfhJbt.OX7ZHg/1Dc/hKKbd1dVTmEUQ6u8xdddO', 0, 0, NULL, '2022-06-01 17:54:01', '2022-06-01 17:54:01', NULL),
(119, 'imran', 'IMRAN@gmail.com', NULL, NULL, '$2y$10$aMn.5WPJ4GpccES/Ox8PWeuWnsUDIbhUIRqRrjPojLnq6JQJbjLqK', 0, 0, NULL, '2022-06-01 18:32:12', '2022-06-10 11:38:17', '2022-06-10 11:38:17'),
(120, 'saad', 'saad@gmail.com', NULL, NULL, '$2y$10$5N9DcHW0ZIiOylSNf1plTehsvOm26s0UtEgfAB7yZ2Pf68KaIc4I6', 0, 0, NULL, '2022-06-01 18:34:17', '2022-06-01 18:34:17', NULL),
(121, 'dyzimox', 'mygomaqy@mailinator.com', NULL, NULL, '$2y$10$c.XrCaa63ieIY8ROrn0FNu0MEASTCOU9jFgy5xPiunmeqaIITqMZG', 0, 0, NULL, '2022-06-01 18:49:24', '2022-06-10 11:36:38', '2022-06-10 11:36:38'),
(122, 'testing', 'testing@gmail.com', NULL, NULL, '$2y$10$NdtSpt4jZd7gAVvwU02Ru.2mPLevPy1iHsnYW3bUorG.yQupt1Mr.', 0, 0, NULL, '2022-06-03 12:18:04', '2022-06-10 11:36:40', '2022-06-10 11:36:40'),
(123, 'lesewuw', 'cuqafy@mailinator.com', NULL, NULL, '$2y$10$SUq.fauLsbWAUSTmk/OTN.Kqt/vFc0Fcm24pWmbKpxEDDNos2DPUG', 0, 0, NULL, '2022-06-03 13:47:42', '2022-06-10 11:36:43', '2022-06-10 11:36:43'),
(124, 'pigedybowa', 'xoba@mailinator.com', NULL, NULL, '$2y$10$c8ozdvnvF0qtyUV6/F/sh.Uoa0EZZCyEga.olySx3t2vs.ZDucsSi', 0, 1, NULL, '2022-06-03 13:51:51', '2022-06-03 13:51:51', NULL),
(125, 'bohic', 'ruju@mailinator.com', NULL, NULL, '$2y$10$T/8otnPTWRemkuGemi.BHemxmYhXzjWBwDU40lt8wVzwufQJZTpf2', 0, 1, NULL, '2022-06-03 13:56:32', '2022-06-03 13:56:32', NULL),
(126, 'ledibes', 'roqudali@mailinator.com', NULL, NULL, '$2y$10$97O3Rat9TYnB5JG.pdnG1.TYiP20FYI8FijmX/C70jOehF3MjMVZq', 0, 1, NULL, '2022-06-03 14:08:38', '2022-06-03 14:08:38', NULL),
(127, 'jucajar', 'sipeqirop@mailinator.com', NULL, NULL, '$2y$10$FA/lhAp3zRxmYE2Wa30l6.xgzUjiasFvKgxuzDmxUsiMUCNyLwG4y', 0, 1, NULL, '2022-06-03 14:50:51', '2022-06-03 14:50:51', NULL),
(128, 'MUsamaIqbal', 'iqbalmusama737@gmail.com', NULL, NULL, '$2y$10$P2HCmnb3UMlzBgwZW8IPjeedqS.BPBXnuknfKL.8J0fsL6LUC8hsm', 0, 0, NULL, '2022-06-04 11:38:33', '2022-06-10 11:46:43', '2022-06-10 11:46:43'),
(129, 'mazukor', 'mytuqope@mailinator.com', NULL, NULL, '$2y$10$WeBkC9Otf1KZWtfX/5XDyOeLazX6zXiTWwtLiL4WZRO51t8.Kx55G', 0, 1, NULL, '2022-06-06 10:25:40', '2022-06-06 10:25:40', NULL),
(130, 'testuser', 'testuser@mail.com', NULL, NULL, '$2y$10$6ojKOpnHK.sRYdphnM0nUukXkL34DjNAgg89vKNU.WnvjmnyWRBeW', 0, 1, NULL, '2022-06-06 17:49:41', '2022-06-06 17:49:41', NULL),
(131, 'Sam', 'sam@elitedesignhub.com', NULL, NULL, '$2y$10$skjGQRHVhiiwtD2XsvCCdeyp17CN6/KfW0S1eylflxQvSt9FoAIbG', 0, 1, NULL, '2022-06-06 19:27:50', '2022-06-06 19:27:50', NULL),
(132, 'Sam', 'samaustinpm@gmail.com', NULL, NULL, '$2y$10$BNv74nu7ad4MxKd0/CPAXOIreJWzMt54LAv.6C51N8mi0MQCRlMaG', 0, 1, NULL, '2022-06-09 16:43:18', '2022-06-09 23:11:52', NULL),
(133, 'BEst', 'bestsdeveloper@gmail.com', NULL, NULL, '$2y$10$zKIeCLr8c51w4ZmvbKTcB.yrfE2ewq.EXgy1WMH0Okig1awixEVyG', 0, 1, NULL, '2022-06-09 19:00:55', '2022-06-10 10:23:28', NULL),
(134, 'Kevin', 'Kevin@krphotogs.com', NULL, NULL, '$2y$10$C8MubWOpYUkWZO5uu2BQnuIOFp4pPic9A6Jj/iX5cRIAYFAKliebq', 0, 1, NULL, '2022-06-09 22:56:46', '2022-06-12 10:08:54', NULL),
(135, 'test', 'pinabig806@game4hr.com', NULL, NULL, '$2y$10$7ijxsTwSzI.D/WgvC3EqKuXB.5qDxwI0ZMqq9brcJ0/Bhl98TmEr.', 0, 1, NULL, '2022-06-10 10:25:23', '2022-06-10 10:36:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_details`
--
ALTER TABLE `coupon_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forget_pass`
--
ALTER TABLE `forget_pass`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `coupon_details`
--
ALTER TABLE `coupon_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `forget_pass`
--
ALTER TABLE `forget_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

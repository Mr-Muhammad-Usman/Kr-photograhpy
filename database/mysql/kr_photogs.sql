-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2022 at 01:58 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kr_photogs`
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
(23, 'XYZ', '2022-06-03', 99, 1, 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-03 12:25:13', '2022-06-03 12:25:13', NULL),
(24, 'abc', NULL, NULL, 0, NULL, '2022-06-06 08:02:01', '2022-06-08 06:33:57', '2022-06-08 11:33:57'),
(25, 'abc', NULL, NULL, 0, NULL, '2022-06-06 08:03:00', '2022-06-08 06:34:06', '2022-06-08 11:34:06'),
(26, 'xyz', NULL, NULL, 0, NULL, '2022-06-06 08:08:01', '2022-06-08 06:34:08', '2022-06-08 11:34:08'),
(27, 'xyz', NULL, NULL, 0, NULL, '2022-06-06 08:09:01', '2022-06-08 06:34:09', '2022-06-08 11:34:09'),
(28, 'xyz1', NULL, NULL, 0, NULL, '2022-06-06 08:16:01', '2022-06-08 06:34:11', '2022-06-08 11:34:11'),
(29, 'xyz1', NULL, NULL, 0, NULL, '2022-06-06 08:17:01', '2022-06-08 06:34:12', '2022-06-08 11:34:12'),
(30, 'xyz23', NULL, NULL, 0, NULL, '2022-06-06 08:18:01', '2022-06-08 06:34:15', '2022-06-08 11:34:15'),
(31, 'UNKNOWNxyz23', NULL, NULL, 0, NULL, '2022-06-06 08:19:01', '2022-06-08 06:34:16', '2022-06-08 11:34:16'),
(32, 'UNKNOWNxyz23', NULL, NULL, 0, NULL, '2022-06-06 08:20:01', '2022-06-08 06:34:18', '2022-06-08 11:34:18'),
(33, 'empty', NULL, NULL, 0, NULL, '2022-06-06 09:55:00', '2022-06-08 06:34:25', '2022-06-08 11:34:25'),
(34, 'empty', NULL, NULL, 0, NULL, '2022-06-06 09:56:01', '2022-06-08 06:34:20', '2022-06-08 11:34:20'),
(35, 'empty', NULL, NULL, 0, NULL, '2022-06-06 09:57:00', '2022-06-08 06:34:21', '2022-06-08 11:34:21'),
(36, 'empty', NULL, NULL, 0, NULL, '2022-06-06 09:58:01', '2022-06-08 06:34:23', '2022-06-08 11:34:23');

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
(24, 'couponGHI', '70', 22, 5, 1, '2022-06-01 18:42:29', '2022-06-01 19:00:26', NULL),
(25, 'couponDEF2', '80', 21, 15, 0, '2022-06-01 18:43:06', '2022-06-01 18:51:36', '2022-06-01 18:51:36'),
(26, 'couponXYZfrees', '100', 23, 4, 1, '2022-06-03 12:25:52', '2022-06-08 11:51:26', NULL),
(27, 'couponXYZ', '25', 23, 47, 1, '2022-06-03 12:26:20', '2022-06-03 15:17:58', NULL),
(28, 'MyCoupon', '50', 20, 5, 0, '2022-06-03 15:25:48', '2022-06-03 15:38:45', '2022-06-03 15:38:45');

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
(28, 137, 26, '2022-06-08 06:51:26', '2022-06-08 06:51:26');

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
(6, 117, '202206031654255331953', 0, '2022-06-03 11:22:11', '2022-06-03 11:23:18');

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `competition_name`, `competition_date`, `user_id`, `price`, `payer_id`, `status`, `redeem_code`, `receipt_url`, `payment_method`, `url`, `created_at`, `updated_at`) VALUES
(97, '5', '2022-05-19', '114', '10.00', 'PAYID-MKH42EI55E71814KA0140107', 'approved', '202205261653591445523893', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-26 18:57:25', '2022-05-26 18:57:25'),
(98, '5', '2022-05-19', '115', '0.00', NULL, 'free', '202205271653652083162985', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-27 11:48:03', '2022-05-27 11:48:03'),
(113, '21', '2022-06-03', '121', '0.00', NULL, 'free', '202206011654109422359521', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-06-01 18:50:22', '2022-06-01 18:50:22'),
(114, '20', '2022-06-02', '121', '54.00', 'PAYID-MKL3MJY6UV80934GT351940K', 'approved', '202206011654109764600373', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-01 18:56:04', '2022-06-01 18:56:04'),
(115, '22', '2022-06-05', '121', '110.00', 'PAYID-MKL3M2A17D742907X694863K', 'approved', '202206011654109809763826', NULL, 'paypal', 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-06-01 18:56:49', '2022-06-01 18:56:49'),
(116, '22', '2022-06-05', '121', '33.00', 'PAYID-MKL3OQA0EB252293P174520E', 'approved', '202206011654110026787311', NULL, 'paypal', 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-06-01 19:00:26', '2022-06-01 19:00:26'),
(117, '20', '2022-06-02', '114', '54.00', 'PAYID-MKM63VA7MY79616JF8822226', 'approved', '202206031654255107551869', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-06-03 11:18:27', '2022-06-03 11:18:27'),
(132, '23', '2022-06-08', '137', '0.00', NULL, 'free', '202206081654689086460724', NULL, 'free coupon', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-06-08 06:51:26', '2022-06-08 06:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `email` varchar(550) NOT NULL,
  `password` varchar(555) DEFAULT NULL,
  `user_role` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `soft_delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `user_role`, `status`, `created_at`, `updated_at`, `soft_delete`) VALUES
(1, 'admin', 'admin@mail.com', '$2y$10$BLukItuXFiEKOxhqC3wJW.bwIWcJ.1XrtDoVlE/2yRDwvw3nFEoc2', 1, 1, '2022-06-08 05:54:59', '2022-06-08 05:56:09', NULL),
(114, 'devMDs', 'devpetyr911@gmail.com', '$2y$10$whkmLAXgLhHICy2t7LnSX.pYtX0.VOPo.8ivCmeJoKMAAA7LSi8BW', 0, 1, '2022-05-26 13:02:59', '2022-06-08 06:03:27', NULL),
(115, 'usman', 'musmansaeed25@gmail.com', '$2y$10$3glBsB/FHU.evwimbVPLPuSRI2VTV.mlafd0Ig6l8nTTzDqrCH4Nu', 0, 1, '2022-05-27 11:47:45', '2022-06-08 06:16:40', '2022-06-08 11:16:40'),
(121, 'dyzimox', 'mygomaqy@mailinator.com', '$2y$10$c.XrCaa63ieIY8ROrn0FNu0MEASTCOU9jFgy5xPiunmeqaIITqMZG', 0, 0, '2022-06-01 18:49:24', '2022-06-08 06:09:52', NULL),
(124, 'pigedybowa', 'xoba@mailinator.com', '$2y$10$c8ozdvnvF0qtyUV6/F/sh.Uoa0EZZCyEga.olySx3t2vs.ZDucsSi', 0, 0, '2022-06-03 13:51:51', '2022-06-08 06:09:57', NULL),
(125, 'bohic', 'ruju@mailinator.com', '$2y$10$T/8otnPTWRemkuGemi.BHemxmYhXzjWBwDU40lt8wVzwufQJZTpf2', 0, 0, '2022-06-03 13:56:32', '2022-06-08 06:14:14', '2022-06-08 11:14:14'),
(126, 'ledibes', 'roqudali@mailinator.com', '$2y$10$97O3Rat9TYnB5JG.pdnG1.TYiP20FYI8FijmX/C70jOehF3MjMVZq', 0, 1, '2022-06-03 14:08:38', '2022-06-08 06:13:40', '2022-06-08 11:13:40'),
(137, 'jan', 'bestsdevelopers@gmail.com', '$2y$10$eykgipqij/yC81dsJbSULe/v7D3vqLnLhpixyDTNcC13Tv9mNqG3m', 0, 1, '2022-06-08 05:58:01', '2022-06-08 06:56:58', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coupon_details`
--
ALTER TABLE `coupon_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `forget_pass`
--
ALTER TABLE `forget_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

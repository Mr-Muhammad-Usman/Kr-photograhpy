-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 08:35 PM
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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `title`, `competition_date`, `amount`, `status`, `url`, `created_at`, `updated_at`) VALUES
(4, 'Qui facere ut itaque', '2022-05-20', 8, 1, 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-11 09:07:42', '2022-05-19 12:16:08'),
(5, 'Dolorem totam conseq', '2022-05-19', 10, 1, 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-11 10:22:43', '2022-05-19 12:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_codes`
--

CREATE TABLE `coupon_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon_codes`
--

INSERT INTO `coupon_codes` (`id`, `code`, `discount`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 'code', '50', 0, 1, '2022-05-23 18:00:32', '2022-05-24 15:54:35'),
(3, 'code2', '10', 14, 1, '2022-05-24 14:57:20', '2022-05-24 15:51:03');

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
(1, 1, 1, '2022-05-24 13:51:07', '2022-05-24 13:51:07'),
(2, 85, 1, '2022-05-24 09:17:01', '2022-05-24 09:17:01'),
(3, 89, 1, '2022-05-24 10:35:26', '2022-05-24 10:35:26'),
(4, 89, 3, '2022-05-24 10:36:32', '2022-05-24 10:36:32'),
(5, 90, 1, '2022-05-24 10:48:57', '2022-05-24 10:48:57'),
(6, 90, 3, '2022-05-24 10:51:03', '2022-05-24 10:51:03'),
(7, 91, 1, '2022-05-24 10:54:35', '2022-05-24 10:54:35');

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
(66, '5', '2022-05-19', '76', '10.00', 'PAYID-MKFW2NI6NC90904KA681010T', 'approved', '202205231653304663578711', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-23 06:17:43', '2022-05-23 06:17:43'),
(67, '5', '2022-05-19', '76', '10.00', 'PAYID-MKFXIQI1UY93080GS148700D', 'approved', '202205231653306486742409', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-23 06:48:06', '2022-05-23 06:48:06'),
(68, '5', '2022-05-19', '76', '10.00', 'PAYID-MKFXK2Y0YP372729K997012T', 'approved', '202205231653306749744546', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-23 06:52:29', '2022-05-23 06:52:29'),
(69, '4', '2022-05-20', '77', '8.00', 'PAYID-MKFXVDQ4BU63223WW166063R', 'approved', '202205231653308070609062', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-23 07:14:30', '2022-05-23 07:14:30'),
(70, '5', '2022-05-19', '77', '10.00', 'PAYID-MKFX32A0FX39010T6921591F', 'approved', '202205231653308921245053', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-23 07:28:41', '2022-05-23 07:28:41'),
(71, '5', '2022-05-19', '77', '10.00', 'PAYID-MKFZJAY23043711NB100350X', 'approved', '202205231653314707137564', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-23 09:05:07', '2022-05-23 09:05:07'),
(72, '4', '2022-05-20', '77', '8.00', 'PAYID-MKFZJ4I9M208112C9609430P', 'approved', '202205231653314811589105', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-23 09:06:51', '2022-05-23 09:06:51'),
(73, '4', '2022-05-20', '77', '8.00', 'PAYID-MKFZKTA6SF17243MJ073862A', 'approved', '202205231653314902943470', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-23 09:08:22', '2022-05-23 09:08:22'),
(74, '4', '2022-05-20', '77', '8.00', 'PAYID-MKFZNZQ3BE11522T77323834', 'approved', '202205231653315312801661', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-23 09:15:12', '2022-05-23 09:15:12'),
(75, '5', '2022-05-19', '83', '5.00', 'PAYID-MKGOEDA20D64255KW677114J', 'approved', '202205241653400125139168', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 08:48:45', '2022-05-24 08:48:45'),
(76, '5', '2022-05-19', '83', '5.00', 'PAYID-MKGOG7I46R60546PV820170P', 'approved', '202205241653400455432114', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 08:54:15', '2022-05-24 08:54:15'),
(77, '4', '2022-05-20', '83', '4.00', 'PAYID-MKGOLSY2YH51553DF7253133', 'approved', '202205241653401051215608', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-24 09:04:11', '2022-05-24 09:04:11'),
(78, '4', '2022-05-20', '83', '4.00', 'PAYID-MKGOMTA69E679238C386980C', 'approved', '202205241653401176558326', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-24 09:06:16', '2022-05-24 09:06:16'),
(79, '5', '2022-05-19', '83', '5.00', 'PAYID-MKGOONI83C3573697447753G', 'approved', '202205241653401408873922', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 09:10:08', '2022-05-24 09:10:08'),
(80, '5', '2022-05-19', '85', '5.00', 'PAYID-MKGOQAI3PL73458LE628310C', 'approved', '202205241653401612879452', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 09:13:32', '2022-05-24 09:13:32'),
(81, '4', '2022-05-20', '85', '4.00', 'PAYID-MKGORPA19C62033X2686942S', 'approved', '202205241653401821906979', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-24 09:17:01', '2022-05-24 09:17:01'),
(82, '5', '2022-05-19', '89', '5.00', 'PAYID-MKGPV6I5LS63265K1552882P', 'approved', '202205241653406526696972', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 10:35:26', '2022-05-24 10:35:26'),
(83, '4', '2022-05-20', '89', '7.20', 'PAYID-MKGPW5Q45346032DT4370359', 'approved', '202205241653406592916761', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-24 10:36:32', '2022-05-24 10:36:32'),
(84, '5', '2022-05-19', '90', '5.00', 'PAYID-MKGP4XY4JE63757EW851931P', 'approved', '202205241653407337226991', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 10:48:57', '2022-05-24 10:48:57'),
(85, '4', '2022-05-20', '90', '7.20', 'PAYID-MKGP5HI2FR30369WB032862T', 'approved', '202205241653407463157579', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-24 10:51:03', '2022-05-24 10:51:03'),
(86, '5', '2022-05-19', '91', '5.00', 'PAYID-MKGP7MQ4033418507707014F', 'approved', '202205241653407675356012', NULL, 'paypal', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-24 10:54:35', '2022-05-24 10:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(555) DEFAULT NULL,
  `user_role` int(1) NOT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `provider_id`, `avatar`, `password`, `user_role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@mail.com', NULL, NULL, '$2y$10$eBzm3cEsbRSf2djUAs1P2eyT.yQlWP3XJQb737CalCQoTsdTbRvja', 1, 1, '2021-06-16 21:48:41', '2021-09-13 15:12:37'),
(75, 'fugefivyde', 'lizex@mailinator.com', NULL, NULL, '$2y$10$1AJz3EoOE.jjo6XNSAk.6.C62n5Ak.10vyO2V7GQc/Qc.l6VUQCwK', 0, 0, '2022-05-19 12:58:52', '2022-05-19 12:58:52'),
(76, 'fyqyzyh', 'dyxo@mailinator.com', NULL, NULL, '$2y$10$OH3PnFTOeUOaAE3Xx9eosu.fjqxQr/LpSn/99j5rjk8rh8aXe.iDi', 0, 0, '2022-05-23 06:16:07', '2022-05-23 06:16:07'),
(77, 'ritetikiq', 'musmansaeed25@gmail.com', NULL, NULL, '$2y$10$uQgYEs3T83V.8DlRNj6X7eub1O11MPoArRYGqxMyYBdIMPmAi4ICS', 0, 0, '2022-05-23 07:14:00', '2022-05-23 07:14:00'),
(78, 'pixejoj', 'siqocel@mailinator.com', NULL, NULL, '$2y$10$fwDU5xgRBfSB9leu90SLd.bUDBSWYSACBgst6mWO3qTnz2CUQObDy', 0, 0, '2022-05-23 13:21:59', '2022-05-23 13:21:59'),
(79, 'hesexag', 'labu@mailinator.com', NULL, NULL, '$2y$10$n4ISwzJhQRm.Y.oYArLAyOYsdNcB4Wa.Odm6gwM4lwXJilXrhZwVq', 0, 0, '2022-05-24 06:56:00', '2022-05-24 06:56:00'),
(80, 'ciwexuraza', 'logovoc@mailinator.com', NULL, NULL, '$2y$10$u.TlUQPWi2unfIAsE6rqgu0eFzEcAn7ypGG4SSVuXssFCwP37sLoC', 0, 0, '2022-05-24 07:14:35', '2022-05-24 07:14:35'),
(81, 'cavitaw', 'xejonod@mailinator.com', NULL, NULL, '$2y$10$lCUCiKOp/SX2C0Lc94mW9..WbGD2rHUaQrVfc6qUBpQLyDhr7ZULa', 0, 0, '2022-05-24 08:14:17', '2022-05-24 08:14:17'),
(82, 'geheto', 'fyxuhebof@mailinator.com', NULL, NULL, '$2y$10$hXtuy4C9sUGol3jKXt.SEOyTq07GH8Qz5O/7fWcIMYJTQ5Vvgaf/y', 0, 0, '2022-05-24 08:18:02', '2022-05-24 08:18:02'),
(83, 'hyfazoke', 'qytukivori@mailinator.com', NULL, NULL, '$2y$10$8nokN3rWCyEpTd5LNjNEy.J.dV4.ysvltNy398fRocGNYqeyUF4Fq', 0, 0, '2022-05-24 08:27:26', '2022-05-24 08:27:26'),
(84, 'qaryno', 'nevoro@mailinator.com', NULL, NULL, '$2y$10$aZGWJWrkiFz.fvAG/aNHFuQ.QfIIX5UaXknL9jC1/Q.yE6HHrsu3K', 0, 0, '2022-05-24 09:12:27', '2022-05-24 09:12:27'),
(85, 'saad', 'saad@gmail.com', NULL, NULL, '$2y$10$Fcobo/m8gPobBifQB0./OupiJ1cqKvv8IEdU4GxX7XrmMmaKCH5pu', 0, 0, '2022-05-24 09:13:03', '2022-05-24 09:13:03'),
(86, 'rexeqopine', 'kutalytuce@mailinator.com', NULL, NULL, '$2y$10$J5Jd5kkl2Ueo1aXXLqAVI.SgXwLsLkP4w082vPsWx3GckiH6/y.8q', 0, 0, '2022-05-24 09:56:18', '2022-05-24 09:56:18'),
(87, 'vepij', 'voxinah@mailinator.com', NULL, NULL, '$2y$10$Qg0Xz.455pC01zELRzmtD.9zLt6XWgwyHMrzgzSu4GMiXLI.6ytvC', 0, 0, '2022-05-24 10:02:39', '2022-05-24 10:02:39'),
(88, 'juvygyja', 'muvasa@mailinator.com', NULL, NULL, '$2y$10$J8B7Nlp7UDbCi4MrqYdsBu4Y8wuqGbHVPdGrRxewN/yKcpLS7X/hS', 0, 0, '2022-05-24 10:07:19', '2022-05-24 10:07:19'),
(89, 'vogugypaqe', 'gysenukaw@mailinator.com', NULL, NULL, '$2y$10$XD52WYLKYY44E3xMAOCMHOyDu61VzsoEnLFLqBIEJcJ4fcSxdZG9y', 0, 0, '2022-05-24 10:26:20', '2022-05-24 10:26:20'),
(90, 'niduk', 'kezow@mailinator.com', NULL, NULL, '$2y$10$v9m9Aex1QirtR6cB3NuHt..2Lr.SNWVfQo1Q/Q/puFDSR.dCM5XrW', 0, 0, '2022-05-24 10:48:36', '2022-05-24 10:48:36'),
(91, 'qogiqug', 'rary@mailinator.com', NULL, NULL, '$2y$10$TVmoQCTUFupQsEdwuZfG1uDhCGc5tgeU563QxMS22eGLbOg2bDHF2', 0, 0, '2022-05-24 10:53:59', '2022-05-24 10:53:59'),
(92, 'pacoxula', 'woxahagesy@mailinator.com', NULL, NULL, '$2y$10$Ds79mhGwPhvo.vrWStCtfejWsiJQIGyYC23vjL00389lg3BsjRd5G', 0, 0, '2022-05-24 10:55:04', '2022-05-24 10:55:04'),
(93, 'hemar', 'bupub@mailinator.com', NULL, NULL, '$2y$10$edeLbQaG/m49oaOiGIaQ8uykTufKnra07XsnFRUKnIummNEJanAku', 0, 0, '2022-05-24 12:46:16', '2022-05-24 12:46:16'),
(94, 'makevusa', 'mamuniq@mailinator.com', NULL, NULL, '$2y$10$QV1a7KdLK8I4fujOqRy5aezJRvGAdQ189tUiK9NIQUJLTkQROfhWy', 0, 0, '2022-05-24 13:03:58', '2022-05-24 13:03:58'),
(95, 'dopufuhura', 'coxujak@mailinator.com', NULL, NULL, '$2y$10$cdyJy/v6qHaDO/guypE82ePyfw6EtLlZLCAOJmE1ij9KkLMZ0Q6Iq', 0, 0, '2022-05-24 13:08:24', '2022-05-24 13:08:24'),
(96, 'gedufu', 'hita@mailinator.com', NULL, NULL, '$2y$10$QJB0D9zHSNfjx9n3LSdb8O729vMZMjTqHtteLPwOYyqmeQsc84lHq', 0, 0, '2022-05-24 13:16:26', '2022-05-24 13:16:26');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon_details`
--
ALTER TABLE `coupon_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

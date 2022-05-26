-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 08:18 PM
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
(5, 'Dolorem totam conseq', '2022-05-19', 10, 1, 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-11 10:22:43', '2022-05-19 12:00:13'),
(16, 'new competitions', '2022-05-25', 15, 1, 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-05-24 13:50:28', '2022-05-24 13:50:54');

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
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon_codes`
--

INSERT INTO `coupon_codes` (`id`, `code`, `discount`, `competition_id`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(14, 'coupon', '100', 5, 10, 1, '2022-05-25 13:33:27', '2022-05-26 10:37:33'),
(15, 'coupon1st', '10', 16, 7, 1, '2022-05-25 14:57:06', '2022-05-26 11:24:08'),
(16, 'coupon2nd', '70', 5, 15, 1, '2022-05-25 14:57:53', '2022-05-25 14:57:53');

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
(12, 109, 15, '2022-05-26 06:24:08', '2022-05-26 06:24:08');

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
(3, 110, '202205261653588520828', 0, '2022-05-26 13:08:40', '2022-05-26 13:09:30');

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
(94, '5', '2022-05-19', '109', '0.00', NULL, 'free', '202205261653563976854882', NULL, 'free coupon', 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-26 06:19:36', '2022-05-26 06:19:36'),
(95, '16', '2022-05-25', '109', '13.50', 'PAYID-MKHWF7Y0NK072047G775653N', 'approved', '202205261653564248651216', NULL, 'paypal', 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-05-26 06:24:08', '2022-05-26 06:24:08'),
(96, '4', '2022-05-20', '109', '8.00', 'PAYID-MKHWNMQ60P06552ND181764J', 'approved', '202205261653565117122004', NULL, 'paypal', 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-26 06:38:37', '2022-05-26 06:38:37');

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
  `user_role` int(1) NOT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `provider_id`, `avatar`, `password`, `user_role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@mail.com', NULL, NULL, '$2a$12$.RhVj06/bG7/sjn4bgVi0u5fJ8nfaUOD46.FuYyPuiXy/Ntfkhv6W', 1, 1, '2022-05-25 14:11:10', '2022-05-25 14:11:10'),
(75, 'fugefivyde', 'lizex@mailinator.com', NULL, NULL, '$2y$10$1AJz3EoOE.jjo6XNSAk.6.C62n5Ak.10vyO2V7GQc/Qc.l6VUQCwK', 0, 0, '2022-05-19 12:58:52', '2022-05-19 12:58:52'),
(105, 'hosuruju', 'bejasa@mailinator.com', NULL, NULL, '$2y$10$.qMW88rL7efSgu43R68.9eugrjbelJPM5VnSkkDjQzm8bu7U2/7L.', 0, 0, '2022-05-25 13:05:54', '2022-05-25 13:05:54'),
(109, 'MDs', 'sahifim205@steamoh.com', NULL, NULL, '$2y$10$Tli/pvRcg9ncVQgWcQtwKucOmrVGpbL6XdEsmroUSSdRT8QpL7VBy', 0, 0, '2022-05-26 06:19:13', '2022-05-26 06:19:13'),
(110, 'usman', 'musmansaeed25@gmail.com', NULL, NULL, '$2y$10$3utpNFFqw0ksX8lb9Y4h9.5DEtrKsdCuhR9x5YKhbsnPaOZGXDO4.', 0, 0, '2022-05-26 08:05:31', '2022-05-26 13:09:30'),
(111, 'jeqav', 'pufes@mailinator.com', NULL, NULL, '$2y$10$Z1VBnXLo8UIyZRKjYsaXmeAgWX.bs1oVs8hxOnq1gVoP346WSRE32', 0, 0, '2022-05-26 12:53:14', '2022-05-26 12:53:14'),
(113, 'dusiz', 'lyzo@mailinator.com', NULL, NULL, '$2y$10$gQlzwoEtBMRmXfBwAN7nUOgyW1BFiCOR5uKzLjqrShL5uzamzg/b.', 0, 0, '2022-05-26 13:02:20', '2022-05-26 13:02:20'),
(114, 'dev', 'devpetyr911@gmail.com', NULL, NULL, '$2y$10$h2Joo7.qqi4Q522kNk12wOSvhCUU7/94rVRCu7x64cpVcqxMUXYja', 0, 0, '2022-05-26 13:02:59', '2022-05-26 13:02:59');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `coupon_codes`
--
ALTER TABLE `coupon_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `coupon_details`
--
ALTER TABLE `coupon_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `forget_pass`
--
ALTER TABLE `forget_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

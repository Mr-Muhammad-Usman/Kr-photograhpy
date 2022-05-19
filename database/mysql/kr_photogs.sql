-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2022 at 08:37 PM
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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `competition_name` varchar(255) DEFAULT NULL,
  `competition_date` date DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
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
(64, '15', '2022-05-19', '74', '55', 'PAYID-MKDIE3Y04497521CF831815Y', 'approved', '202205191652982399643776', NULL, 'paypal', 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-05-19 12:46:39', '2022-05-19 12:46:39');

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
(75, 'fugefivyde', 'lizex@mailinator.com', NULL, NULL, '$2y$10$1AJz3EoOE.jjo6XNSAk.6.C62n5Ak.10vyO2V7GQc/Qc.l6VUQCwK', 0, 0, '2022-05-19 12:58:52', '2022-05-19 12:58:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

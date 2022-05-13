-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2022 at 05:43 PM
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
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Qui facere ut itaque', 1, '2022-05-11 09:07:42', '2022-05-11 09:07:42'),
(5, 'Dolorem totam conseq', 1, '2022-05-11 10:22:43', '2022-05-11 10:22:43'),
(7, 'Voluptatem et ipsum', 1, '2022-05-11 10:22:52', '2022-05-11 10:22:52');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `competition_name`, `competition_date`, `user_id`, `price`, `payer_id`, `status`, `redeem_code`, `receipt_url`, `created_at`, `updated_at`) VALUES
(4, 'Maxime illum tenetu', '2022-05-21', '2', '10', 'ch_3KycAHFo3JNYSfwX1TsQyKwM', 'succeeded', '202205121652362489567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KycAHFo3JNYSfwX1TsQyKwM/rcpt_Lfy6lvIs92pBhOQHAk3rXLm46oVGWTv', '2022-05-12 08:34:49', '2022-05-12 08:34:49'),
(5, 'Voluptatem et ipsum', '2022-05-13', '21', '10', 'ch_3KydPmFo3JNYSfwX1KitOEUs', 'succeeded', '202205121652367294567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydPmFo3JNYSfwX1KitOEUs/rcpt_LfzO1mpvRnfy6u1xa9ZjcfDYLL4qL7z', '2022-05-12 09:54:54', '2022-05-12 09:54:54'),
(6, 'Maxime illum tenetu', '2022-05-26', '22', '10', 'ch_3KydXEFo3JNYSfwX0ijhRgep', 'succeeded', '202205121652367756567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydXEFo3JNYSfwX0ijhRgep/rcpt_LfzWBmTcHJLm8AJKkynpGgenJXX1YsV', '2022-05-12 10:02:36', '2022-05-12 10:02:36'),
(7, 'Maxime illum tenetu', '2022-05-10', '23', '10', 'ch_3KydZMFo3JNYSfwX0J0AnOCE', 'succeeded', '202205121652367888567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydZMFo3JNYSfwX0J0AnOCE/rcpt_LfzYjC2BzUVccmZPxisvqUOdLjHplgt', '2022-05-12 10:04:48', '2022-05-12 10:04:48'),
(8, 'Maxime illum tenetu', '2022-05-20', '24', '10', 'ch_3KydaPFo3JNYSfwX0jMu4krz', 'succeeded', '202205121652367953567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydaPFo3JNYSfwX0jMu4krz/rcpt_LfzZvjKx7vFVEPq3OX2bsOPHkLmih9D', '2022-05-12 10:05:53', '2022-05-12 10:05:53'),
(9, 'Dolorem totam conseq', '2022-05-19', '29', '10', 'ch_3Kyg1RFo3JNYSfwX0AOKKfiv', 'succeeded', '202205121652377319567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kyg1RFo3JNYSfwX0AOKKfiv/rcpt_Lg25uv9kfUD98htQUDCaGwp1Shbak6d', '2022-05-12 12:41:59', '2022-05-12 12:41:59'),
(10, 'Qui facere ut itaque', '1997-03-26', '30', '10', 'ch_3KygRYFo3JNYSfwX0qngzk4E', 'succeeded', '202205121652378936567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KygRYFo3JNYSfwX0qngzk4E/rcpt_Lg2WBvKqngqApdVXeC20CaRFEbV6yz5', '2022-05-12 13:08:56', '2022-05-12 13:08:56'),
(11, 'Qui facere ut itaque', '2004-04-26', '31', '10', 'ch_3KygUCFo3JNYSfwX1hq2VVwI', 'succeeded', '202205121652379100567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KygUCFo3JNYSfwX1hq2VVwI/rcpt_Lg2Z6bZHT14QKyRGiTkRqiw6Xzc8GXr', '2022-05-12 13:11:40', '2022-05-12 13:11:40'),
(12, 'Maxime illum tenetu', '2022-05-18', '34', '10', 'ch_3KygheFo3JNYSfwX1NAQh6Ji', 'succeeded', '202205121652379934567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KygheFo3JNYSfwX1NAQh6Ji/rcpt_Lg2nIIFAYVqlCwDMM4gLUjqrG76RLRq', '2022-05-12 13:25:34', '2022-05-12 13:25:34'),
(13, 'Dolorem totam conseq', '2022-05-19', '35', '10', 'ch_3KyhJtFo3JNYSfwX1LKTbzXM', 'succeeded', '202205121652382305567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KyhJtFo3JNYSfwX1LKTbzXM/rcpt_Lg3Q5eBfyi8etHmQLzBcQpJxTQsiFCS', '2022-05-12 14:05:05', '2022-05-12 14:05:05'),
(14, 'Maxime illum tenetu', '2022-05-28', '36', '10', 'ch_3KyhNMFo3JNYSfwX1I3QEnm4', 'succeeded', '202205121652382520567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KyhNMFo3JNYSfwX1I3QEnm4/rcpt_Lg3UwML2JrCjzFl070ljbPWaBvKxBtU', '2022-05-12 14:08:40', '2022-05-12 14:08:40'),
(15, 'Maxime illum tenetu', '2022-05-21', '37', '10', 'ch_3Kyw8ZFo3JNYSfwX1zU6s78P', 'succeeded', '202205131652439265567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kyw8ZFo3JNYSfwX1zU6s78P/rcpt_LgIkr9BMptZABOHDL4Mj22wIvPMuqqN', '2022-05-13 05:54:25', '2022-05-13 05:54:25'),
(16, 'Maxime illum tenetu', '2022-05-28', '39', '10', 'ch_3Kywe6Fo3JNYSfwX1BZckVTQ', 'succeeded', '202205131652441220567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kywe6Fo3JNYSfwX1BZckVTQ/rcpt_LgJGUmcwo9N8NV6RQisa9yYBAsHoMyy', '2022-05-13 06:27:00', '2022-05-13 06:27:00'),
(17, 'Dolorem totam conseq', '2022-05-20', '40', '10', 'ch_3KywvIFo3JNYSfwX1QZw77Yq', 'succeeded', '202205131652442286567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KywvIFo3JNYSfwX1QZw77Yq/rcpt_LgJYTCuYGep7BSGw4Thn2ex8doYi734', '2022-05-13 06:44:46', '2022-05-13 06:44:46'),
(18, 'Dolorem totam conseq', '2022-05-25', '41', '10', 'ch_3Kyyj8Fo3JNYSfwX15ZpCzhh', 'succeeded', '202205131652449219567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kyyj8Fo3JNYSfwX15ZpCzhh/rcpt_LgLP9t4YfyuWWf5hWpq6bUu20JmKHCS', '2022-05-13 08:40:19', '2022-05-13 08:40:19');

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
(2, 'test', 'test123@gmail.com', NULL, NULL, 'test12345', 0, 1, '2021-06-18 18:14:13', '2021-09-10 14:42:03'),
(3, 'dev petyr', 'devpetyr911@gmail.com', '105866561827322939177', 'https://lh3.googleusercontent.com/a/AATXAJytHN79d16llvC2GrMy98m9LEXZxwv5cd5ZWDUX=s96-c', NULL, 0, 1, '2021-06-18 18:32:20', '2021-09-10 14:33:55'),
(8, 'muzz', 'muzz@gmail.com', NULL, NULL, 'password', 0, 1, '2021-06-23 04:13:26', '2021-09-10 14:34:37'),
(10, 'test', 'asd@mail.com', NULL, NULL, '123', 4, 1, '2021-06-24 11:45:41', '2022-05-13 08:46:48'),
(11, 'haris', 'haris@gmail.com', NULL, NULL, 'haris123', 3, 0, '2021-06-24 12:58:44', '2021-09-10 14:42:20'),
(12, 'muqtada work', 'muqtadawork@gmail.com', '114224599136896656093', 'https://lh3.googleusercontent.com/a/AATXAJwVUUf24hYV55HjH7Zi4H-rhbJJqJ1a48D55Ral=s96-c', NULL, 2, 1, '2021-06-24 13:08:03', '2021-09-10 14:34:50'),
(16, 'zaqowulyhy', 'hybehy@mailinator.com', NULL, NULL, NULL, 0, 0, '2022-05-11 11:59:24', '2022-05-11 11:59:24'),
(17, 'qylasagac', 'tavesub@mailinator.com', NULL, NULL, NULL, 0, 0, '2022-05-11 12:00:02', '2022-05-11 12:00:02'),
(18, 'jicatisywi', 'najinyly@mailinator.com', NULL, NULL, NULL, 2, 1, '2022-05-11 12:00:35', '2022-05-13 07:17:53'),
(19, 'kukawyjed', 'gufe@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-11 12:01:06', '2022-05-11 12:01:06'),
(20, 'saad', 'saad@gmail.com', NULL, NULL, 'saad12345', 0, 0, '2022-05-12 09:51:49', '2022-05-12 09:51:49'),
(21, 'fojazocojy', 'dowabedulo@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 09:54:18', '2022-05-12 09:54:18'),
(22, 'saeed', 'saeed@gmail.com', NULL, NULL, 'saeed12345', 0, 0, '2022-05-12 10:02:06', '2022-05-12 10:02:06'),
(23, 'pedunu', 'foqucobive@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 10:04:24', '2022-05-12 10:04:24'),
(24, 'henyfymoqu', 'qekopotoje@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 10:05:26', '2022-05-12 10:05:26'),
(25, 'mizuruxuz', 'putyg@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 10:18:59', '2022-05-12 10:18:59'),
(26, 'tuqirep', 'vyqokese@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 10:24:12', '2022-05-12 10:24:12'),
(27, 'SSA', 'sza78635@gmail.com', NULL, NULL, 'Abc123++', 0, 0, '2022-05-12 12:19:52', '2022-05-12 12:19:52'),
(28, 'lusakit', 'jyfy@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 12:23:36', '2022-05-12 12:23:36'),
(29, 'povum', 'pudigim@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 12:29:23', '2022-05-12 12:29:23'),
(30, 'kotofo', 'livazeleza@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 13:07:49', '2022-05-12 13:07:49'),
(31, 'wiqojo', 'vydig@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 13:11:11', '2022-05-12 13:11:11'),
(32, 'zazyruf', 'detunal@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 13:15:29', '2022-05-12 13:15:29'),
(33, 'tunyfok', 'vojacuq@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 13:17:07', '2022-05-12 13:17:07'),
(34, 'hizakesaqu', 'romedo@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 13:22:18', '2022-05-12 13:22:18'),
(35, 'diqyp', 'qewi@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 14:04:47', '2022-05-12 14:04:47'),
(36, 'petywaron', 'zuji@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-12 14:07:50', '2022-05-12 14:07:50'),
(37, 'camefikuw', 'fewo@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-13 05:53:48', '2022-05-13 05:53:48'),
(38, 'rytitod', 'jumaf@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-13 06:20:50', '2022-05-13 06:20:50'),
(39, 'jakipaqy', 'tozapygo@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-13 06:23:32', '2022-05-13 06:23:32'),
(40, 'jubudar', 'hyjehudy@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-13 06:44:19', '2022-05-13 06:44:19'),
(41, 'szassa', 'sajid.ali@codecreators.ca', NULL, NULL, 'Abc123++', 0, 0, '2022-05-13 08:39:07', '2022-05-13 08:39:07'),
(42, 'vadyd', 'zyvokezupu@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-13 09:58:53', '2022-05-13 09:58:53');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

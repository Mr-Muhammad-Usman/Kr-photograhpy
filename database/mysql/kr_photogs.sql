-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 09:14 PM
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
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `title`, `status`, `url`, `created_at`, `updated_at`) VALUES
(4, 'Qui facere ut itaque', 1, 'https://www.youtube.com/embed/RLtwC2hDW8c', '2022-05-11 09:07:42', '2022-05-16 12:31:57'),
(5, 'Dolorem totam conseq', 1, 'https://www.youtube.com/embed/Z9Rs9ZFcZeM', '2022-05-11 10:22:43', '2022-05-16 12:31:29'),
(7, 'Voluptatem et ipsum', 1, 'https://www.youtube.com/embed/b7FNvq11CEw', '2022-05-11 10:22:52', '2022-05-16 12:30:58'),
(10, 'Voluptatibus non par', 1, 'https://www.youtube.com/embed/TCdHr5KQ780', '2022-05-16 11:45:01', '2022-05-16 12:28:57'),
(11, 'test1', 1, 'https://www.youtube.com/embed/S2eAeMOpdeA', '2022-05-16 14:12:12', '2022-05-16 14:12:20');

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
(4, 'Maxime illum tenetu', '2022-05-21', '2', '10', 'ch_3KycAHFo3JNYSfwX1TsQyKwM', 'succeeded', '202205121652362489567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KycAHFo3JNYSfwX1TsQyKwM/rcpt_Lfy6lvIs92pBhOQHAk3rXLm46oVGWTv', NULL, '10', '2022-05-12 08:34:49', '2022-05-12 08:34:49'),
(5, 'Voluptatem et ipsum', '2022-05-13', '21', '10', 'ch_3KydPmFo3JNYSfwX1KitOEUs', 'succeeded', '202205121652367294567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydPmFo3JNYSfwX1KitOEUs/rcpt_LfzO1mpvRnfy6u1xa9ZjcfDYLL4qL7z', NULL, '7', '2022-05-12 09:54:54', '2022-05-12 09:54:54'),
(6, 'Maxime illum tenetu', '2022-05-26', '22', '10', 'ch_3KydXEFo3JNYSfwX0ijhRgep', 'succeeded', '202205121652367756567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydXEFo3JNYSfwX0ijhRgep/rcpt_LfzWBmTcHJLm8AJKkynpGgenJXX1YsV', NULL, '7', '2022-05-12 10:02:36', '2022-05-12 10:02:36'),
(7, 'Maxime illum tenetu', '2022-05-10', '23', '10', 'ch_3KydZMFo3JNYSfwX0J0AnOCE', 'succeeded', '202205121652367888567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydZMFo3JNYSfwX0J0AnOCE/rcpt_LfzYjC2BzUVccmZPxisvqUOdLjHplgt', NULL, '7', '2022-05-12 10:04:48', '2022-05-12 10:04:48'),
(8, 'Maxime illum tenetu', '2022-05-20', '24', '10', 'ch_3KydaPFo3JNYSfwX0jMu4krz', 'succeeded', '202205121652367953567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KydaPFo3JNYSfwX0jMu4krz/rcpt_LfzZvjKx7vFVEPq3OX2bsOPHkLmih9D', NULL, '5', '2022-05-12 10:05:53', '2022-05-12 10:05:53'),
(9, 'Dolorem totam conseq', '2022-05-19', '29', '10', 'ch_3Kyg1RFo3JNYSfwX0AOKKfiv', 'succeeded', '202205121652377319567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kyg1RFo3JNYSfwX0AOKKfiv/rcpt_Lg25uv9kfUD98htQUDCaGwp1Shbak6d', NULL, '4', '2022-05-12 12:41:59', '2022-05-12 12:41:59'),
(10, 'Qui facere ut itaque', '1997-03-26', '30', '10', 'ch_3KygRYFo3JNYSfwX0qngzk4E', 'succeeded', '202205121652378936567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KygRYFo3JNYSfwX0qngzk4E/rcpt_Lg2WBvKqngqApdVXeC20CaRFEbV6yz5', NULL, '4', '2022-05-12 13:08:56', '2022-05-12 13:08:56'),
(11, 'Qui facere ut itaque', '2004-04-26', '31', '10', 'ch_3KygUCFo3JNYSfwX1hq2VVwI', 'succeeded', '202205121652379100567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KygUCFo3JNYSfwX1hq2VVwI/rcpt_Lg2Z6bZHT14QKyRGiTkRqiw6Xzc8GXr', NULL, '4', '2022-05-12 13:11:40', '2022-05-12 13:11:40'),
(12, 'Maxime illum tenetu', '2022-05-18', '34', '10', 'ch_3KygheFo3JNYSfwX1NAQh6Ji', 'succeeded', '202205121652379934567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KygheFo3JNYSfwX1NAQh6Ji/rcpt_Lg2nIIFAYVqlCwDMM4gLUjqrG76RLRq', NULL, '5', '2022-05-12 13:25:34', '2022-05-12 13:25:34'),
(13, 'Dolorem totam conseq', '2022-05-19', '35', '10', 'ch_3KyhJtFo3JNYSfwX1LKTbzXM', 'succeeded', '202205121652382305567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KyhJtFo3JNYSfwX1LKTbzXM/rcpt_Lg3Q5eBfyi8etHmQLzBcQpJxTQsiFCS', NULL, '4', '2022-05-12 14:05:05', '2022-05-12 14:05:05'),
(14, 'Maxime illum tenetu', '2022-05-28', '36', '10', 'ch_3KyhNMFo3JNYSfwX1I3QEnm4', 'succeeded', '202205121652382520567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KyhNMFo3JNYSfwX1I3QEnm4/rcpt_Lg3UwML2JrCjzFl070ljbPWaBvKxBtU', NULL, '5', '2022-05-12 14:08:40', '2022-05-12 14:08:40'),
(15, 'Maxime illum tenetu', '2022-05-21', '37', '10', 'ch_3Kyw8ZFo3JNYSfwX1zU6s78P', 'succeeded', '202205131652439265567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kyw8ZFo3JNYSfwX1zU6s78P/rcpt_LgIkr9BMptZABOHDL4Mj22wIvPMuqqN', NULL, '7', '2022-05-13 05:54:25', '2022-05-13 05:54:25'),
(16, 'Maxime illum tenetu', '2022-05-28', '39', '10', 'ch_3Kywe6Fo3JNYSfwX1BZckVTQ', 'succeeded', '202205131652441220567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kywe6Fo3JNYSfwX1BZckVTQ/rcpt_LgJGUmcwo9N8NV6RQisa9yYBAsHoMyy', NULL, '10', '2022-05-13 06:27:00', '2022-05-13 06:27:00'),
(17, 'Dolorem totam conseq', '2022-05-20', '40', '10', 'ch_3KywvIFo3JNYSfwX1QZw77Yq', 'succeeded', '202205131652442286567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3KywvIFo3JNYSfwX1QZw77Yq/rcpt_LgJYTCuYGep7BSGw4Thn2ex8doYi734', NULL, '4', '2022-05-13 06:44:46', '2022-05-13 06:44:46'),
(18, 'Dolorem totam conseq', '2022-05-25', '41', '10', 'ch_3Kyyj8Fo3JNYSfwX15ZpCzhh', 'succeeded', '202205131652449219567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3Kyyj8Fo3JNYSfwX15ZpCzhh/rcpt_LgLP9t4YfyuWWf5hWpq6bUu20JmKHCS', NULL, '5', '2022-05-13 08:40:19', '2022-05-13 08:40:19'),
(19, 'Dolorem totam conseq', '2022-05-18', '43', '10', 'ch_3L01zJFo3JNYSfwX0qbrQcw1', 'succeeded', '202205161652700083567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L01zJFo3JNYSfwX0qbrQcw1/rcpt_LhQrkCIXIV16aoARvOpc3Y9gFpS7grI', NULL, '10', '2022-05-16 06:21:23', '2022-05-16 06:21:23'),
(20, 'Voluptatem et ipsum', '2022-05-19', '45', NULL, 'ch_3L02qwFo3JNYSfwX0gx62K7O', 'succeeded', '202205161652703408567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L02qwFo3JNYSfwX0gx62K7O/rcpt_LhRkUGkRJz7ZlwHB2SxncT4mu6ppz7Q', NULL, '10', '2022-05-16 07:16:48', '2022-05-16 07:16:48'),
(21, 'Dolorem totam conseq', '2022-05-20', '46', NULL, 'ch_3L02sAFo3JNYSfwX0gQPfq8n', 'succeeded', '202205161652703484567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L02sAFo3JNYSfwX0gQPfq8n/rcpt_LhRl0Zgc31dKoEjhWa8eOxztNuOYDKI', NULL, '7', '2022-05-16 07:18:04', '2022-05-16 07:18:04'),
(22, 'Voluptatem et ipsum', '2022-05-18', '2', NULL, 'ch_3L036BFo3JNYSfwX1gp64sVv', 'succeeded', '202205161652704354567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L036BFo3JNYSfwX1gp64sVv/rcpt_LhS03W5dm8TXwUr6Ubrg50EsKyqu52h', NULL, '5', '2022-05-16 07:32:34', '2022-05-16 07:32:34'),
(23, 'Dolorem totam conseq', '2022-05-14', '2', NULL, 'ch_3L03kGFo3JNYSfwX1cgiSKV4', 'succeeded', '202205161652706838567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L03kGFo3JNYSfwX1cgiSKV4/rcpt_LhSfvcTNb2MF20YlFJfbiqKNr6rZ3zA', NULL, '4', '2022-05-16 08:13:58', '2022-05-16 08:13:58'),
(24, 'Dolorem totam conseq', '2022-05-27', '2', NULL, 'ch_3L03moFo3JNYSfwX0xiw1g99', 'succeeded', '202205161652706996567891', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L03moFo3JNYSfwX0xiw1g99/rcpt_LhSiwjqygqu8uxzL7ZH7WoFKvqSokY9', NULL, '10', '2022-05-16 08:16:36', '2022-05-16 08:16:36'),
(25, 'Dolorem totam conseq', '2022-05-31', '2', NULL, 'ch_3L03oeFo3JNYSfwX1hrIomCs', 'succeeded', '202205161652707110307946', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L03oeFo3JNYSfwX1hrIomCs/rcpt_LhSkSWG87O2H1y4mgaP4LOWu75KxE0S', NULL, '5', '2022-05-16 08:18:30', '2022-05-16 08:18:30'),
(26, 'Dolorem totam conseq', '2022-05-20', '48', '10', 'PAYID-MKBGPYA1R311993T5872050J', 'approved', '202205161652714657992425', NULL, '0', '7', '2022-05-16 10:24:17', '2022-05-16 10:24:17'),
(27, 'Dolorem totam conseq', '2022-05-21', '49', '10', 'PAYID-MKBG2LA4AS25237YW771613P', 'approved', '202205161652714820334732', NULL, '0', '4', '2022-05-16 10:27:00', '2022-05-16 10:27:00'),
(28, 'Voluptatibus non par', '2022-05-20', '50', '10', 'PAYID-MKBID6I9F206740WD185393X', 'approved', '202205161652720192579314', NULL, '0', '5', '2022-05-16 11:56:32', '2022-05-16 11:56:32'),
(29, 'Voluptatem et ipsum', '2022-05-28', '51', NULL, 'ch_3L07G3Fo3JNYSfwX0NHVgeYV', 'succeeded', '202205161652720340694520', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L07G3Fo3JNYSfwX0NHVgeYV/rcpt_LhWIl0bGpfSaYGF4q4wkDlEstagepdk', NULL, '7', '2022-05-16 11:59:00', '2022-05-16 11:59:00'),
(30, 'Voluptatem et ipsum', '2022-05-17', '52', '10', 'PAYID-MKBJMVA7JC926182W555493B', 'approved', '202205161652725432395797', NULL, 'paypal', NULL, '2022-05-16 13:23:52', '2022-05-16 13:23:52'),
(31, 'Dolorem totam conseq', '2022-05-17', '53', '10', 'PAYID-MKBJO6Q88E69531C06406331', 'approved', '202205161652725636862626', NULL, 'paypal', NULL, '2022-05-16 13:27:16', '2022-05-16 13:27:16'),
(32, 'Voluptatibus non par', '2022-06-08', '53', '10', 'PAYID-MKBJQBQ7N431493PG263254E', 'approved', '202205161652725776953264', NULL, 'paypal', '10', '2022-05-16 13:29:36', '2022-05-16 13:29:36'),
(33, 'Voluptatem et ipsum', '2022-05-18', '53', NULL, 'ch_3L08hjFo3JNYSfwX0fYuOe3k', 'succeeded', '202205161652725900979071', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L08hjFo3JNYSfwX0fYuOe3k/rcpt_LhXnf4wygZZpYpBkDrwIbNqZmGPtGi8', 'stripe', '7', '2022-05-16 13:31:40', '2022-05-16 13:31:40'),
(34, 'Qui facere ut itaque', '2022-05-06', '53', '10', 'PAYID-MKBJW4Q8JV83218W0260504C', 'approved', '202205161652726653434279', NULL, 'paypal', '4', '2022-05-16 13:44:13', '2022-05-16 13:44:13'),
(35, 'Voluptatem et ipsum', '2022-05-26', '54', '10', 'PAYID-MKBJX6A68C704540R6644236', 'approved', '202205161652726815511453', NULL, 'paypal', '7', '2022-05-16 13:46:55', '2022-05-16 13:46:55'),
(36, 'Qui facere ut itaque', '2022-05-31', '54', NULL, 'ch_3L08xFFo3JNYSfwX1oUoNX2o', 'succeeded', '202205161652726862891883', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L08xFFo3JNYSfwX1oUoNX2o/rcpt_LhY3mNkVVfZ6XDMu7drCE26UyfjnEnj', 'stripe', '4', '2022-05-16 13:47:42', '2022-05-16 13:47:42'),
(37, 'Dolorem totam conseq', '2022-05-19', '55', NULL, 'ch_3L09GCFo3JNYSfwX023NsdJd', 'succeeded', '202205161652728037487587', 'https://pay.stripe.com/receipts/acct_1KnhCEFo3JNYSfwX/ch_3L09GCFo3JNYSfwX023NsdJd/rcpt_LhYMG2TLYI9pX58Kwliv8szgj8XNk6O', 'stripe', '5', '2022-05-16 14:07:17', '2022-05-16 14:07:17'),
(38, 'Voluptatem et ipsum', '2022-05-18', '55', '10', 'PAYID-MKBKB7A5M680642YG046252D', 'approved', '202205161652728081349441', NULL, 'paypal', '7', '2022-05-16 14:08:01', '2022-05-16 14:08:01'),
(39, 'Dolorem totam conseq', '2022-05-26', '55', '10', 'PAYID-MKBKCQY3VG03721878919359', 'approved', '202205161652728142275415', NULL, 'paypal', '5', '2022-05-16 14:09:02', '2022-05-16 14:09:02');

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
(2, 'test', 'test123@gmail.com', NULL, NULL, 'password', 0, 1, '2021-06-18 18:14:13', '2022-05-13 13:59:12'),
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
(42, 'vadyd', 'zyvokezupu@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-13 09:58:53', '2022-05-13 09:58:53'),
(43, 'rywivaheku', 'hifobuve@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 05:38:10', '2022-05-16 05:38:10'),
(44, 'loqodewusu', 'timixag@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 06:25:26', '2022-05-16 06:25:26'),
(45, 'qixoten', 'fosulas@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 06:27:14', '2022-05-16 06:27:14'),
(46, 'futycuv', 'joni@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 07:17:27', '2022-05-16 07:17:27'),
(47, 'dadefugy', 'zugepo@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 07:23:36', '2022-05-16 07:23:36'),
(48, 'pecewy', 'ranyxuweni@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 10:03:53', '2022-05-16 10:03:53'),
(49, 'dyjumi', 'jykacuxosa@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 10:26:31', '2022-05-16 10:26:31'),
(50, 'rigow', 'niwuxi@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 11:54:04', '2022-05-16 11:54:04'),
(51, 'lotucyna', 'zabenutam@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 11:56:59', '2022-05-16 11:56:59'),
(52, 'mujyk', 'myzaquv@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 13:21:16', '2022-05-16 13:21:16'),
(53, 'zicyve', 'cytegeta@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 13:26:59', '2022-05-16 13:26:59'),
(54, 'zukesel', 'naeem123@gmail.com', NULL, NULL, 'naeem12345', 0, 0, '2022-05-16 13:46:09', '2022-05-16 13:46:09'),
(55, 'nacuw', 'kejoxy@mailinator.com', NULL, NULL, 'Pa$$w0rd!', 0, 0, '2022-05-16 14:06:32', '2022-05-16 14:06:32');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

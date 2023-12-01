-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2023 at 10:30 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_pinkboda`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `pickup_long` float(10,6) DEFAULT NULL,
  `pickup_lat` float(10,6) DEFAULT NULL,
  `drop_long` float(10,6) DEFAULT NULL,
  `drop_lat` float(10,6) DEFAULT NULL,
  `pickup_address` varchar(255) DEFAULT NULL,
  `drop_address` varchar(255) DEFAULT NULL,
  `booking_status` enum('pending','accept','reject','cancel') DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `ride_type` enum('Ride','Delivery') DEFAULT NULL,
  `driver_gender` enum('Male','Female','Both') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `pickup_long`, `pickup_lat`, `drop_long`, `drop_lat`, `pickup_address`, `drop_address`, `booking_status`, `amount`, `ride_type`, `driver_gender`, `user_id`, `driver_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 76.717957, 30.718521, 20.655001, 25.569000, 'mohali', 'chandigarh', 'pending', 10, 'Ride', 'Male', 1, 1, '2023-09-13 06:32:00', '2023-09-13 06:32:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `sender_id`, `receiver_id`, `message`, `booking_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'hii', 1, '2023-09-13 06:32:02', '2023-09-13 06:32:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Others') DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `passport_photo` varchar(255) DEFAULT NULL,
  `vechile_insurance` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `is_admin_verified` enum('accepted','rejected','pending') DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `device_type` enum('android','apple') DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `username`, `gender`, `latitude`, `longitude`, `mobile_number`, `country_code`, `profile_image`, `license`, `id_card`, `passport_photo`, `vechile_insurance`, `model`, `license_plate`, `year`, `is_admin_verified`, `access_token`, `device_type`, `device_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'amit', 'Male', 30.713209, 76.706970, '6934567890', '+91', 'profile_image-1694070957040_528.png', 'license-1694070957038_324.png', 'id_card-1694070957039_655.png', 'passport_photo-1694070957039_579.png', 'vechile_insurance-1694070957040_333.png', '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibW9iaWxlX251bWJlciI6IjY5MzQ1Njc4OTAiLCJpYXQiOjE2OTM5MDcxNDN9.zt-waQJg6fJcNebZ3HgNd50UxZtjc_8DwGZwgebMk5I', NULL, NULL, '2023-09-05 09:45:43', '2023-09-07 07:15:57', NULL),
(2, 'user', 'Male', 30.699335, 76.715561, '7034567890', '+91', NULL, NULL, NULL, NULL, NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibW9iaWxlX251bWJlciI6IjcwMzQ5Mjc4OTAiLCJpYXQiOjE2OTQwOTgxODJ9.jJ5U-DdI9wd5p3T8NfCQT8m6YZ4mN6vL8sjH2cZ7-oY', NULL, NULL, '2023-09-05 09:46:18', '2023-09-05 09:47:03', NULL),
(3, 'user', 'Male', 30.704796, 76.710579, '7134567890', '+91', NULL, NULL, NULL, NULL, NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibW9iaWxlX251bWJlciI6IjcxMzQ5Mjc4OTAiLCJpYXQiOjE2OTQwOTg3Mzd9.b_N9T8dpXNB7LkoZ37s5Ht_7c6NNz9NtKgP1rsRUxO4', NULL, NULL, '2023-09-05 09:47:17', '2023-09-05 09:47:53', NULL),
(4, 'user', 'Male', 30.717785, 76.701996, '7334567890', '+91', NULL, NULL, NULL, NULL, NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwibW9iaWxlX251bWJlciI6IjczMzQ5Mjc4OTAiLCJpYXQiOjE2OTQwOTg4MzF9.ABzYVtY3P1Blh81zCEWsTIsb7mMRpjY-hPHQK0ILb4M', NULL, NULL, '2023-09-05 09:48:11', '2023-09-05 09:48:54', NULL),
(5, 'user', 'Male', 30.723982, 76.711952, '5834567890', '+91', NULL, NULL, NULL, NULL, NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibW9iaWxlX251bWJlciI6IjU4MzQ5Mjc4OTAiLCJpYXQiOjE2OTQwOTg4NzR9.BX3veI6LpB2MNSySoUfDVWUVbZN_KiM82p5Xwh-GG4M', NULL, NULL, '2023-09-05 09:49:14', '2023-09-05 09:49:41', NULL),
(6, 'user', 'Male', 30.742573, 76.800873, '0834567890', '+91', NULL, NULL, NULL, NULL, NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwibW9iaWxlX251bWJlciI6IjA4MzQ5Mjc4OTAiLCJpYXQiOjE2OTQwOTg5NDF9.ghjbhns_aBn2F49TWMaXIt0aNR0sWqBr3TqF02zkWyY', NULL, NULL, '2023-09-05 09:50:10', '2023-09-05 09:51:06', NULL),
(7, 'user', 'Male', 30.749359, 76.795212, '0934567890', '+91', NULL, NULL, NULL, NULL, NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywibW9iaWxlX251bWJlciI6IjA5MzQ5Mjc4OTAiLCJpYXQiOjE2OTQwOTkwMDB9.G9AGFQ3Kk8exiPGN8DN_zIm6JwE0PcvXKTZklq8u-dM', NULL, NULL, '2023-09-05 09:51:20', '2023-09-05 09:51:53', NULL),
(8, 'user', 'Male', NULL, NULL, '0934567891', '+91', NULL, 'license-1693919056304_672.png', 'id_card-1693919056304_711.png', 'passport_photo-1693919056304_484.png', NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwibW9iaWxlX251bWJlciI6IjA5MzQ1Njc4OTEiLCJpYXQiOjE2OTM5MTkwNTZ9.0M20Nb5ycTqlLMjhbFv-8tYZZDifO-Ddih_gLUKDfMY', NULL, NULL, '2023-09-05 13:04:16', '2023-09-05 13:04:16', NULL),
(9, 'user', 'Male', NULL, NULL, '0934567892', '+91', NULL, 'license-1694069825105_26.png', 'id_card-1694069825107_575.png', 'passport_photo-1694069825107_930.png', NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwibW9iaWxlX251bWJlciI6IjA5MzQ1Njc4OTIiLCJpYXQiOjE2OTQwNjk4MjV9._cA2ix0wF4ccWppUR9_oZEA7zxXVo8O5dK1jTri4GFk', NULL, NULL, '2023-09-07 06:57:05', '2023-09-07 06:57:05', NULL),
(10, 'user', 'Male', NULL, NULL, '0934567893', '+91', NULL, 'license-1694070066082_134.png', 'id_card-1694070066083_677.png', 'passport_photo-1694070066083_321.png', NULL, '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsIm1vYmlsZV9udW1iZXIiOiIwOTM0NTY3ODkzIiwiaWF0IjoxNjk0MDcwMDY2fQ.Tie0xAYAGK5qQU2ghYqGD4qQoaqS4a-Tsiq0G24CFsI', NULL, NULL, '2023-09-07 07:01:06', '2023-09-07 07:01:06', NULL),
(11, 'user', 'Male', NULL, NULL, '0934567894', '+91', NULL, 'license-1694070173860_918.png', 'id_card-1694070173862_843.png', 'passport_photo-1694070173862_240.png', 'vechile_insurance-1694070173862_286.png', '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsIm1vYmlsZV9udW1iZXIiOiIwOTM0NTY3ODk0IiwiaWF0IjoxNjk0MDcwMTczfQ.jOjezIC6piR5DzP98do_gAOLB-FT3Kx-4y_sYNk-MJw', NULL, NULL, '2023-09-07 07:02:53', '2023-09-07 07:02:53', NULL),
(12, 'user', 'Male', NULL, NULL, '0934567895', '+91', NULL, 'license-1694070207746_696.png', 'id_card-1694070207747_599.png', 'passport_photo-1694070207747_614.png', 'vechile_insurance-1694070207748_196.png', '123', 'HP2001', 2001, 'accepted', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsIm1vYmlsZV9udW1iZXIiOiIwOTM0NTY3ODk1IiwiaWF0IjoxNjk0MDcwMjA3fQ.DKZ93hOXrUYHE2Ycjp7qijc2N09CD_sS9ynx2AStC30', NULL, NULL, '2023-09-07 07:03:27', '2023-09-07 07:03:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `report_message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `driver_id`, `booking_id`, `report_message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'due to his off road driving', '2023-09-13 07:18:24', '2023-09-13 07:18:24', NULL),
(2, 1, 1, 1, 'due to his off road driving', '2023-09-13 07:28:18', '2023-09-13 07:28:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Others') DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `device_type` enum('android','apple') DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `gender`, `mobile_number`, `country_code`, `image`, `access_token`, `device_type`, `device_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user3', 'Male', '123456715', '+91', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibW9iaWxlX251bWJlciI6IjEyMzQ1NjcxNSIsImlhdCI6MTY5NDUyMzIxOX0.yMlI4ETFbW1PwD9VMKXYLBt80g_2cgheX8-yssCDzxY', 'android', 'abc', '2023-09-12 12:53:39', '2023-09-12 12:53:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

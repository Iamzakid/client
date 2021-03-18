-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2021 at 12:58 AM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asterx_client`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_report`
--

CREATE TABLE `action_report` (
  `ar_id` int(11) NOT NULL,
  `ar_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Час події',
  `ar_type` varchar(5) NOT NULL COMMENT 'Напрям події',
  `ar_number_id` int(11) NOT NULL COMMENT 'wl_id',
  `ar_letter` varchar(3) DEFAULT NULL COMMENT 'tr_letter',
  `ar_ip_data` text DEFAULT NULL COMMENT 'socket_data',
  `ar_result` varchar(12) NOT NULL COMMENT 'Результат'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Звіт по подіям дзвінків та запитів по ip socket';

--
-- Dumping data for table `action_report`
--

-- --------------------------------------------------------

--
-- Table structure for table `scheduled`
--

CREATE TABLE `scheduled` (
  `row_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `action` varchar(128) NOT NULL,
  `scheduled_time` datetime NOT NULL,
  `done_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheduled`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `access_jwt` text NOT NULL,
  `refresh_jwt` text NOT NULL,
  `server_ip` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
--
-- Indexes for table `action_report`
--
ALTER TABLE `action_report`
  ADD PRIMARY KEY (`ar_id`);

--
-- Indexes for table `scheduled`
--
ALTER TABLE `scheduled`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action_report`
--
ALTER TABLE `action_report`
  MODIFY `ar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scheduled`
--
ALTER TABLE `scheduled`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

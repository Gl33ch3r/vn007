-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2022 at 01:36 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decal`
--

-- --------------------------------------------------------

--
-- Table structure for table `bos`
--

CREATE TABLE `bos` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bos`
--

INSERT INTO `bos` (`id`, `name`) VALUES
(1, 'PHILIPPINE NAVY'),
(2, 'PHILIPPINE NAVY(M)'),
(3, 'PHILIPPINE ARMY'),
(4, 'PHILIPPINE AIRFORCE'),
(6, 'OTHERS AGENCIES, ETC');

-- --------------------------------------------------------

--
-- Table structure for table `classification`
--

CREATE TABLE `classification` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classification`
--

INSERT INTO `classification` (`id`, `name`) VALUES
(1, 'ACTIVE MILITARY PERSONNEL'),
(2, 'RETIRED MILITARY PERSONNEL'),
(3, 'RESERVIST MILITARY PERSONNEL'),
(4, 'CIVILIAN HUMAN RESOURCES'),
(5, 'CONTRACTUAL/PROJECT FUND'),
(6, 'DEPENDENT OF ACTIVE MILITARY PERSONNEL'),
(7, 'DEPENDENT OF RETIRED MILITARY PERSONNEL'),
(8, 'CONCESSIONAIRES/TRADERS/PN CONTRACTOR'),
(9, 'OFFICIAL/EMPLOYEE/MEMBER OF TENANT OR CLUB FACILITY'),
(10, 'SPONSORED CIVILIAN');

-- --------------------------------------------------------

--
-- Table structure for table `decal_application`
--

CREATE TABLE `decal_application` (
  `application_id` int NOT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `sio_id` int DEFAULT NULL,
  `vehicle_id` varchar(250) DEFAULT NULL,
  `frontid_path` text,
  `backid_path` text,
  `application_form_path` text,
  `birth_cert_path` text,
  `service_contract_path` text,
  `or_path` text,
  `cr_path` text,
  `front_path` text,
  `rear_path` text,
  `sides_path` text,
  `support_path` text,
  `decal_type` varchar(250) NOT NULL DEFAULT 'passcard',
  `status` int DEFAULT '0',
  `has_deficiency` varchar(1) NOT NULL DEFAULT '0',
  `is_claimed` varchar(11) DEFAULT '0',
  `date_claimed` datetime DEFAULT NULL,
  `claimed_by` varchar(250) DEFAULT NULL,
  `decal_number` varchar(250) DEFAULT NULL,
  `category` varchar(250) DEFAULT NULL,
  `approved_level` varchar(250) DEFAULT '4',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `endorse_by` varchar(250) DEFAULT NULL,
  `endorser_contact` varchar(250) DEFAULT NULL,
  `remarks` text,
  `rejected_by` varchar(250) DEFAULT NULL,
  `lost_decal` varchar(1) DEFAULT '0',
  `is_read` varchar(1) DEFAULT '1',
  `released_by` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `type_function` varchar(250) DEFAULT NULL,
  `other_info` varchar(250) DEFAULT NULL,
  `is_admin` varchar(1) DEFAULT NULL,
  `ipaddress` varchar(250) DEFAULT NULL,
  `logs_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_users`
--

CREATE TABLE `panel_users` (
  `id` int NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `account_name` varchar(250) DEFAULT NULL,
  `sio_id` varchar(250) DEFAULT NULL,
  `user_role` varchar(250) DEFAULT NULL,
  `profile` varchar(250) DEFAULT '../img/avatar_man.png',
  `is_enabled` varchar(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `panel_users`
--

INSERT INTO `panel_users` (`id`, `username`, `password`, `email`, `account_name`, `sio_id`, `user_role`, `profile`, `is_enabled`, `create_at`, `updated_at`) VALUES
(1, 'cibadmin', 'a4ac258e84cdb25e4e84bd507f44667d6ba9c625', NULL, 'CIB', '0', '1', '../img/avatar_man.png', '1', '2022-03-24 23:13:56', '2022-04-10 22:08:24'),
(18, 'asstcibpoic', '5e72d5e02d11c375f17fc004ed16ae00aa59396d', '', 'ASST CIB, POIC', '1', '4', '../img/avatar_man.png', '1', '2022-11-30 19:08:18', NULL),
(19, 'asstcibofficer', '9ed425fd07bf701e0f2866999e08e33a3c2ca53c', '', 'ASST CIB, OFFICER', '1', '3', '../img/avatar_man.png', '1', '2022-11-30 20:13:32', NULL),
(20, 'cibpoic', 'dfe7a17e263c567352b501934246d1a71402c603', '', 'CIB, POIC', '0', '2', '../img/avatar_man.png', '1', '2022-11-30 20:15:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `rank_id` int NOT NULL,
  `rank_name` varchar(250) NOT NULL,
  `grade` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rank_id`, `rank_name`, `grade`) VALUES
(1, 'GENERAL/ADMIRAL', 'O-10'),
(2, 'LIEUTENANT GENERAL/VICE ADMIRAL', 'O-9'),
(3, 'MAJOR GENERAL/REAR ADMIRAL', 'O-8'),
(4, 'BRIGADIER GENERAL/COMMODORE', 'O-7'),
(5, 'COLONEL/CAPTAIN', 'O-6'),
(6, 'LIEUTENANT COLONEL/COMMANDER', 'O-5'),
(7, 'MAJOR/LIEUTENANT COMMANDER', 'O-4'),
(8, 'CAPTAIN/LIEUTENANT', 'O-3'),
(9, '1ST LIEUTENANT/LIEUTENANT JUNIOR GRADE', 'O-2'),
(10, '2ST LIEUTENANT/ENSIGN', 'O-1'),
(11, 'CHIEF MASTER SERGEANT/MASTER CHIEF PETTY OFFICER', 'E-9'),
(12, 'SENIOR MASTER SERGEANT/SENIOR CHIEF PETTY OFFICER', 'E-8'),
(13, 'MASTER SERGEANT/CHIEF PETTY OFFICER', 'E-7'),
(14, 'TECHNICAL SERGEANT/PETTY OFFICER FIRST CLASS', 'E-6'),
(15, 'STAFF SERGEANT/PETTY OFFICER SECOND CLASS', 'E-5'),
(16, 'SERGEANT/PETTY OFFICER THIRD CLASS', 'E-4'),
(17, 'CORPORAL/SEAMAN FIRST CLASS/AIRMAN FIRST CLASS', 'E-3'),
(18, 'PRIVATE FIRST CLASS/SEAMAN SECOND CLASS/AIRMAN SECOND CLASS', 'E-2'),
(19, 'PRIVATE/SEAMAN APPRENTICE/RECRUIT', 'E-1');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `role_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `role_id`) VALUES
(1, 'HAWKEYE OFFICER', '1'),
(2, 'HAWKEYE POIC', '2'),
(3, 'ASST HAWKEYE OFFICER', '3'),
(4, 'ASST HAWKEYE POIC', '4'),
(5, 'OBSERVER', '5');

-- --------------------------------------------------------

--
-- Table structure for table `sios`
--

CREATE TABLE `sios` (
  `sio_id` int NOT NULL,
  `sio_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sios`
--

INSERT INTO `sios` (`sio_id`, `sio_name`) VALUES
(1, 'CIB-N2'),
(2, 'MC2-PMC'),
(3, 'NF2-NFNL'),
(4, 'NF2-NFSL'),
(5, 'NF2-NFC'),
(6, 'NF2-NFEM'),
(7, 'NF2-NFWM'),
(8, 'NF2-NFW'),
(10, 'IC2-NIC'),
(11, 'NIF-NCR'),
(12, 'T2-NETDC'),
(22, 'NR2-NRC');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` int NOT NULL,
  `admin_id` varchar(250) DEFAULT NULL,
  `what_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `what_type` varchar(1) NOT NULL DEFAULT '0',
  `application_id` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT NULL,
  `approved_level` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `middlename` varchar(250) DEFAULT NULL,
  `birthdate` varchar(250) DEFAULT NULL,
  `address` text,
  `profile_pic` varchar(250) DEFAULT './img/avatar_man.png',
  `email` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `bos` varchar(250) DEFAULT NULL,
  `rank` varchar(250) DEFAULT NULL,
  `date_enlisted` varchar(250) DEFAULT NULL,
  `date_retired` varchar(250) DEFAULT NULL,
  `dependent_of` varchar(250) DEFAULT NULL,
  `serial_number` varchar(250) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `unit_name` varchar(250) DEFAULT NULL,
  `unit_address` varchar(250) DEFAULT NULL,
  `unit_mobile` varchar(250) DEFAULT NULL,
  `classification` varchar(250) DEFAULT NULL,
  `activation` varchar(250) DEFAULT NULL,
  `is_activated` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `is_setup` int NOT NULL DEFAULT '0',
  `is_phone_verify` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_data`
--

CREATE TABLE `vehicle_data` (
  `id` int NOT NULL,
  `vehicle_model` varchar(250) DEFAULT NULL,
  `year_model` varchar(250) DEFAULT NULL,
  `vehicle_color` varchar(250) DEFAULT NULL,
  `plate_number` varchar(250) DEFAULT NULL,
  `chassis_number` varchar(250) DEFAULT NULL,
  `vehicle_maker` varchar(250) DEFAULT NULL,
  `motor_number` varchar(250) DEFAULT NULL,
  `rp_plate` varchar(250) DEFAULT NULL,
  `is_owner` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bos`
--
ALTER TABLE `bos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decal_application`
--
ALTER TABLE `decal_application`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_users`
--
ALTER TABLE `panel_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sios`
--
ALTER TABLE `sios`
  ADD PRIMARY KEY (`sio_id`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_data`
--
ALTER TABLE `vehicle_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bos`
--
ALTER TABLE `bos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classification`
--
ALTER TABLE `classification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `decal_application`
--
ALTER TABLE `decal_application`
  MODIFY `application_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=616;

--
-- AUTO_INCREMENT for table `panel_users`
--
ALTER TABLE `panel_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `rank_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sios`
--
ALTER TABLE `sios`
  MODIFY `sio_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `vehicle_data`
--
ALTER TABLE `vehicle_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

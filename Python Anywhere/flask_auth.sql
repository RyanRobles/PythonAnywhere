-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 06:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_action_history`
--

CREATE TABLE `admin_action_history` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `performed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_action_history`
--

INSERT INTO `admin_action_history` (`id`, `admin_id`, `action_type`, `description`, `target_id`, `target_type`, `performed_at`) VALUES
(1, 8, 'thesis_upload', 'Uploaded new thesis file: GEOSPATIAL_IDENTIFICATION_OF_POVERTY.jpg', 152, 'thesis_submission', '2025-05-21 00:13:25'),
(2, 8, 'thesis_approve', 'Approved and published thesis 152 as 74', 74, 'published_thesis', '2025-05-21 00:14:00'),
(3, 8, 'thesis_upload', 'Uploaded new thesis file: AN_ONLINE_VOTING_SYSTEM.jpg', 153, 'thesis_submission', '2025-05-21 00:14:16'),
(4, 8, 'thesis_approve', 'Approved and published thesis 153 as 75', 75, 'published_thesis', '2025-05-21 00:15:03'),
(5, 8, 'thesis_upload', 'Uploaded new thesis file: ENHANCING_VIRTUAL_CONFERENCING.jpg', 154, 'thesis_submission', '2025-05-21 00:15:17'),
(6, 8, 'thesis_approve', 'Approved and published thesis 154 as 76', 76, 'published_thesis', '2025-05-21 00:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `published_theses`
--

CREATE TABLE `published_theses` (
  `id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `authors` text NOT NULL,
  `school` varchar(255) NOT NULL,
  `year_made` varchar(4) NOT NULL,
  `keywords` text NOT NULL,
  `published_by` int(11) NOT NULL,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `num_pages` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `deletion_scheduled` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `published_theses`
--

INSERT INTO `published_theses` (`id`, `submission_id`, `file_path`, `title`, `authors`, `school`, `year_made`, `keywords`, `published_by`, `published_at`, `num_pages`, `is_deleted`, `deleted_at`, `deletion_scheduled`) VALUES
(74, 152, 'c:\\Users\\USER\\Documents\\GitHub\\Thesis1\\flask_auth_app\\static\\uploads\\published\\152_GEOSPATIAL_IDENTIFICATION_OF_POVERTY_AREAS_MACHINE_LEARNING_APPROACH_FOR_DSWD_IMUS.pdf', 'GEOSPATIAL IDENTIFICATION OF POVERTY AREAS: MACHINE LEARNING APPROACH FOR DSWD IMUS', 'ROMMEL M. MACAPOBRE, NIRO S. REGALADO', 'Cavite State University, Department of Computer Studies', '2024', 'AREAS, GEOSPATIAL, GEOSPATIAL IDENTIFICATION, IDENTIFICATION, LEARNING, MACHINE, MACHINE LEARNING, POVERTY, POVERTY AREAS', 8, '2025-05-20 16:14:00', 9, 0, NULL, NULL),
(75, 153, 'c:\\Users\\USER\\Documents\\GitHub\\Thesis1\\flask_auth_app\\static\\uploads\\published\\153_AN_ONLINE_VOTING_SYSTEM_FOR_CAVITE_STATE_UNIVERSITY_IMUS_CAMPUS.pdf', 'AN ONLINE VOTING SYSTEM FOR CAVITE STATE UNIVERSITY IMUS CAMPUS', 'CHRISTIAN ANDREY TURLA SALONOY, DIANA ALTAREJOS GUTIERREZ, ERICA SHEINA LANSANG BERTULFO', 'Cavite State University, Department of Computer Studies, Imus Campus', '2022', 'ONLINE, VOTING, ONLINE VOTING, VOTING SYSTEM', 8, '2025-05-20 16:15:03', 5, 0, NULL, NULL),
(76, 154, 'c:\\Users\\USER\\Documents\\GitHub\\Thesis1\\flask_auth_app\\static\\uploads\\published\\154_ENHANCING_VIRTUAL_CONFERENCING_THE_INTEGRATION_OF_GAMIFICATION_IN_AN_INTERACTIVE_3D_SPACE_ENVIRONMENT.pdf', 'ENHANCING VIRTUAL CONFERENCING: THE INTEGRATION OF GAMIFICATION IN AN INTERACTIVE 3D SPACE ENVIRONMENT', 'CHARNELLE P. ESTRIBOR, FRANZ EMSLEY L. MANIBOG, KERCHEI C. PALEN', 'Cavite State University, Department of Computer Studies', '2024', 'AN INTERACTIVE, CONFERENCING, GAMIFICATION, INTEGRATION, INTERACTIVE, THE INTEGRATION, VIRTUAL, VIRTUAL CONFERENCING', 8, '2025-05-20 16:15:56', 5, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thesis_pages`
--

CREATE TABLE `thesis_pages` (
  `id` int(11) NOT NULL,
  `thesis_id` int(11) NOT NULL,
  `page_number` int(11) NOT NULL,
  `page_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thesis_pages`
--

INSERT INTO `thesis_pages` (`id`, `thesis_id`, `page_number`, `page_text`) VALUES
(1, 74, 1, 'CamScanner\n'),
(2, 74, 2, 'CamScanner\n'),
(3, 74, 3, 'CamScanner\n'),
(4, 74, 4, 'CamScanner\n'),
(5, 74, 5, 'CamScanner\n'),
(6, 74, 6, 'CamScanner\n'),
(7, 74, 7, 'CamScanner\n'),
(8, 74, 8, 'CamScanner\n'),
(9, 74, 9, 'CamScanner\n'),
(10, 75, 1, 'CamScanner\n'),
(11, 75, 2, 'CamScanner\n'),
(12, 75, 3, 'CamScanner\n'),
(13, 75, 4, 'CamScanner\n'),
(14, 75, 5, 'CamScanner\n'),
(15, 76, 1, 'CamScanner\n'),
(16, 76, 2, 'CamScanner\n'),
(17, 76, 3, 'CamScanner\n'),
(18, 76, 4, 'CamScanner\n'),
(19, 76, 5, 'CamScanner\n');

-- --------------------------------------------------------

--
-- Table structure for table `thesis_submissions`
--

CREATE TABLE `thesis_submissions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `authors` text DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `year_made` varchar(4) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `extracted_text` longtext DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revised_file_path` varchar(255) DEFAULT NULL,
  `num_pages` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `file_persisted` tinyint(1) DEFAULT 0,
  `file_reuploaded` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thesis_submissions`
--

INSERT INTO `thesis_submissions` (`id`, `admin_id`, `file_path`, `original_filename`, `title`, `authors`, `school`, `year_made`, `keywords`, `extracted_text`, `status`, `created_at`, `updated_at`, `revised_file_path`, `num_pages`, `deleted_at`, `file_persisted`, `file_reuploaded`) VALUES
(152, 8, 'c:\\Users\\USER\\Documents\\GitHub\\Thesis1\\flask_auth_app\\static\\uploads\\submissions\\152_GEOSPATIAL_IDENTIFICATION_OF_POVERTY_.pdf', 'GEOSPATIAL_IDENTIFICATION_OF_POVERTY.jpg', 'GEOSPATIAL IDENTIFICATION OF POVERTY AREAS: MACHINE LEARNING APPROACH FOR DSWD IMUS', 'ROMMEL M. MACAPOBRE, NIRO S. REGALADO', 'Cavite State University, Department of Computer Studies', '2024', 'AREAS, GEOSPATIAL, GEOSPATIAL IDENTIFICATION, IDENTIFICATION, LEARNING, MACHINE, MACHINE LEARNING, POVERTY, POVERTY AREAS', 'GEOSPATIAL IDENTIFICATION OF POVERTY AREAS: MACHINE LEARNING\nAPPROACH FOR DSWD IMUS\n\nUndergraduate Thesis\nSubmitted to the Faculty of the\nDepartment of Computer Studies\nCavite State University\nImus, Cavite\n\nIn partial fulfilment\nof the requirements for the degree\nBachelor of Science in Computer Science\n\nROMMEL M. MACAPOBRE\nNIRO S. REGALADO\nSeptember 2024', 'approved', '2025-05-20 16:13:25', '2025-05-20 16:14:00', NULL, 9, NULL, 1, 1),
(153, 8, 'c:\\Users\\USER\\Documents\\GitHub\\Thesis1\\flask_auth_app\\static\\uploads\\submissions\\153_AN_ONLINE_VOTING_SYSTEM_FOR_CAVITE_STATE_UNIVERSITY.pdf', 'AN_ONLINE_VOTING_SYSTEM.jpg', 'AN ONLINE VOTING SYSTEM FOR CAVITE STATE UNIVERSITY IMUS CAMPUS', 'CHRISTIAN ANDREY TURLA SALONOY, DIANA ALTAREJOS GUTIERREZ, ERICA SHEINA LANSANG BERTULFO', 'Cavite State University, Department of Computer Studies, Imus Campus', '2022', 'ONLINE, VOTING, ONLINE VOTING, VOTING SYSTEM', 'AN ONLINE VOTING SYSTEM FOR CAVITE STATE UNIVERSITY IMUS CAMPUS\n\nUndergraduate Thesis\nSubmitted to the Faculty of the\nDepartment of Computer Studies\nCavite State University — Imus Campus\n\nIn partial fulfillment of the\nRequirements for the degree\nBachelor of Science in Computer Science\n\nCHRISTIAN ANDREY TURLA SALONOY\nDIANA ALTAREJOS GUTIERREZ\nERICA SHEINA LANSANG BERTULFO\n\nJune 2022', 'approved', '2025-05-20 16:14:16', '2025-05-20 16:15:03', NULL, 5, NULL, 1, 1),
(154, 8, 'c:\\Users\\USER\\Documents\\GitHub\\Thesis1\\flask_auth_app\\static\\uploads\\submissions\\154_ENHANCING_VIRTUAL_CONFERENCING.pdf', 'ENHANCING_VIRTUAL_CONFERENCING.jpg', 'ENHANCING VIRTUAL CONFERENCING: THE INTEGRATION OF GAMIFICATION IN AN INTERACTIVE 3D SPACE ENVIRONMENT', 'CHARNELLE P. ESTRIBOR, FRANZ EMSLEY L. MANIBOG, KERCHEI C. PALEN', 'Cavite State University, Department of Computer Studies', '2024', 'AN INTERACTIVE, CONFERENCING, GAMIFICATION, INTEGRATION, INTERACTIVE, THE INTEGRATION, VIRTUAL, VIRTUAL CONFERENCING', 'ENHANCING VIRTUAL CONFERENCING: THE INTEGRATION\nOF GAMIFICATION IN AN INTERACTIVE\n3D SPACE ENVIRONMENT\n\nUndergraduate Thesis\nSubmitted to the Facultyof the\nDepartment of Computer Studies\nCavite State University\nImus City, Cavite\n\nIn partial fulfillment\nOf the requirements for the degree\nBachelor of Science in Computer Science\n\nCHARNELLE P. ESTRIBOR\nFRANZ EMSLEY L. MANIBOG\nKERCHE! C. PALEN\nSeptember 2024', 'approved', '2025-05-20 16:15:17', '2025-05-20 16:15:56', NULL, 5, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `thesis_versions`
--

CREATE TABLE `thesis_versions` (
  `id` int(11) NOT NULL,
  `thesis_id` int(11) NOT NULL,
  `edited_title` varchar(255) DEFAULT NULL,
  `edited_authors` text DEFAULT NULL,
  `edited_school` varchar(255) DEFAULT NULL,
  `edited_year_made` varchar(4) DEFAULT NULL,
  `edited_keywords` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thesis_versions`
--

INSERT INTO `thesis_versions` (`id`, `thesis_id`, `edited_title`, `edited_authors`, `edited_school`, `edited_year_made`, `edited_keywords`, `notes`, `edited_by`, `created_at`) VALUES
(1, 152, 'GEOSPATIAL IDENTIFICATION OF POVERTY AREAS: MACHINE LEARNING APPROACH FOR DSWD IMUS', 'ROMMEL M. MACAPOBRE, NIRO S. REGALADO', 'Cavite State University, Department of Computer Studies', '2024', 'AREAS, GEOSPATIAL, GEOSPATIAL IDENTIFICATION, IDENTIFICATION, LEARNING, MACHINE, MACHINE LEARNING, POVERTY, POVERTY AREAS', '', 8, '2025-05-20 16:14:00'),
(2, 153, 'AN ONLINE VOTING SYSTEM FOR CAVITE STATE UNIVERSITY IMUS CAMPUS', 'CHRISTIAN ANDREY TURLA SALONOY, DIANA ALTAREJOS GUTIERREZ, ERICA SHEINA LANSANG BERTULFO', 'Cavite State University, Department of Computer Studies, Imus Campus', '2022', 'ONLINE, VOTING, ONLINE VOTING, VOTING SYSTEM', '', 8, '2025-05-20 16:15:03'),
(3, 154, 'ENHANCING VIRTUAL CONFERENCING: THE INTEGRATION OF GAMIFICATION IN AN INTERACTIVE 3D SPACE ENVIRONMENT', 'CHARNELLE P. ESTRIBOR, FRANZ EMSLEY L. MANIBOG, KERCHEI C. PALEN', 'Cavite State University, Department of Computer Studies', '2024', 'AN INTERACTIVE, CONFERENCING, GAMIFICATION, INTEGRATION, INTERACTIVE, THE INTEGRATION, VIRTUAL, VIRTUAL CONFERENCING', '', 8, '2025-05-20 16:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `email` text NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `verification_code` text DEFAULT NULL,
  `code_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `is_verified`, `verification_code`, `code_expires`) VALUES
(8, 'admin2025', 'scrypt:32768:8:1$ioJg56s33nLFUA2N$61c3ce9bbc863b712bc2ee697685f9dcdbb63688c4aedfc43a2a501fe0174c74bd77d59c8f78f740a0a69598889a2e399650481f3a403fe6b24118efaa91765f', 'admin', '', 1, NULL, NULL),
(23, 'user123', 'scrypt:32768:8:1$z2RMd25FqRkcdSI8$a953040c40bb469a8509b82e2b199e196a2b0d2f26af90f0e1df75866f192f913ce66e5ddd163d7c35d59f33d1fad2c99ce528bf798a40c15e026399912ccf13', 'user', 'ryanchristian.robles@cvsu.edu.ph', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_bookmarks`
--

CREATE TABLE `user_bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `thesis_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_view_history`
--

CREATE TABLE `user_view_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `thesis_id` int(11) NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_view_history`
--

INSERT INTO `user_view_history` (`id`, `user_id`, `thesis_id`, `viewed_at`) VALUES
(13, 8, 74, '2025-05-20 16:14:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_action_history`
--
ALTER TABLE `admin_action_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `published_theses`
--
ALTER TABLE `published_theses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `published_by` (`published_by`);
ALTER TABLE `published_theses` ADD FULLTEXT KEY `ft_title` (`title`);
ALTER TABLE `published_theses` ADD FULLTEXT KEY `ft_authors` (`authors`);
ALTER TABLE `published_theses` ADD FULLTEXT KEY `ft_keywords` (`keywords`);

--
-- Indexes for table `thesis_pages`
--
ALTER TABLE `thesis_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thesis_id` (`thesis_id`);
ALTER TABLE `thesis_pages` ADD FULLTEXT KEY `ft_page_text` (`page_text`);
ALTER TABLE `thesis_pages` ADD FULLTEXT KEY `page_text` (`page_text`);

--
-- Indexes for table `thesis_submissions`
--
ALTER TABLE `thesis_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `thesis_versions`
--
ALTER TABLE `thesis_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thesis_id` (`thesis_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_bookmarks`
--
ALTER TABLE `user_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_bookmark` (`user_id`,`thesis_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `user_view_history`
--
ALTER TABLE `user_view_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_action_history`
--
ALTER TABLE `admin_action_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `published_theses`
--
ALTER TABLE `published_theses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `thesis_pages`
--
ALTER TABLE `thesis_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `thesis_submissions`
--
ALTER TABLE `thesis_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `thesis_versions`
--
ALTER TABLE `thesis_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_bookmarks`
--
ALTER TABLE `user_bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_view_history`
--
ALTER TABLE `user_view_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_action_history`
--
ALTER TABLE `admin_action_history`
  ADD CONSTRAINT `admin_action_history_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `published_theses`
--
ALTER TABLE `published_theses`
  ADD CONSTRAINT `fk_published_submission` FOREIGN KEY (`submission_id`) REFERENCES `thesis_submissions` (`id`),
  ADD CONSTRAINT `published_theses_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `thesis_submissions` (`id`),
  ADD CONSTRAINT `published_theses_ibfk_2` FOREIGN KEY (`published_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `thesis_pages`
--
ALTER TABLE `thesis_pages`
  ADD CONSTRAINT `thesis_pages_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `published_theses` (`id`);

--
-- Constraints for table `thesis_submissions`
--
ALTER TABLE `thesis_submissions`
  ADD CONSTRAINT `thesis_submissions_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `thesis_versions`
--
ALTER TABLE `thesis_versions`
  ADD CONSTRAINT `thesis_versions_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_bookmarks`
--
ALTER TABLE `user_bookmarks`
  ADD CONSTRAINT `user_bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_bookmarks_ibfk_2` FOREIGN KEY (`thesis_id`) REFERENCES `published_theses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_view_history`
--
ALTER TABLE `user_view_history`
  ADD CONSTRAINT `user_view_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_view_history_ibfk_2` FOREIGN KEY (`thesis_id`) REFERENCES `published_theses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

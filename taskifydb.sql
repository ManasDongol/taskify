-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2025 at 01:35 PM
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
-- Database: `taskifydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_FirstName` varchar(100) NOT NULL,
  `Admin_LastName` varchar(100) NOT NULL,
  `Admin_Email` varchar(100) NOT NULL,
  `Admin_DOB` date NOT NULL,
  `Admin_Gender` varchar(10) NOT NULL,
  `Admin_ContactNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_ID` int(11) NOT NULL,
  `application_Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `Job_ID` int(10) NOT NULL,
  `Job_Name` varchar(100) NOT NULL,
  `Job_Description` varchar(100) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Salary` int(255) NOT NULL,
  `Skills_Required` int(11) NOT NULL,
  `Company_Picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `Member_ID` int(11) NOT NULL,
  `Member_FirstName` varchar(50) NOT NULL,
  `Member_LastName` varchar(100) NOT NULL,
  `Member_DOB` date NOT NULL,
  `Member_Gender` varchar(50) NOT NULL,
  `Member_Email` varchar(100) NOT NULL,
  `Member_ContactNumber` int(11) NOT NULL,
  `User_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `Profile_ID` int(11) NOT NULL,
  `Profile_Description` varchar(100) NOT NULL,
  `Display_Picture` varchar(255) NOT NULL,
  `Achievements` varchar(255) NOT NULL,
  `Experience` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(10) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `User_Type` varchar(10) NOT NULL DEFAULT 'NON-ADMIN',
  `User_Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_admins`
--

CREATE TABLE `users_admins` (
  `User_ID` int(11) NOT NULL,
  `Admin_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_members`
--

CREATE TABLE `users_members` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_members_jobs`
--

CREATE TABLE `users_members_jobs` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Job_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_members_jobs_applications`
--

CREATE TABLE `users_members_jobs_applications` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Job_ID` int(11) NOT NULL,
  `Application_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_members_profiles`
--

CREATE TABLE `users_members_profiles` (
  `User_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Profile_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`Job_ID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`Member_ID`),
  ADD KEY `User_Member_fk` (`User_ID`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`Profile_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `users_admins`
--
ALTER TABLE `users_admins`
  ADD PRIMARY KEY (`User_ID`,`Admin_ID`);

--
-- Indexes for table `users_members`
--
ALTER TABLE `users_members`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`);

--
-- Indexes for table `users_members_jobs`
--
ALTER TABLE `users_members_jobs`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`,`Job_ID`),
  ADD KEY `Users_Members_Jobs_FK2` (`Member_ID`),
  ADD KEY `Users_Members_Jobs_FK3` (`Job_ID`);

--
-- Indexes for table `users_members_profiles`
--
ALTER TABLE `users_members_profiles`
  ADD PRIMARY KEY (`User_ID`,`Member_ID`,`Profile_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `Job_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `Member_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `Profile_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `User_Member_fk` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `users_members`
--
ALTER TABLE `users_members`
  ADD CONSTRAINT `User_Member_FK1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `users_members_jobs`
--
ALTER TABLE `users_members_jobs`
  ADD CONSTRAINT `Users_Members_Jobs_FK1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `Users_Members_Jobs_FK2` FOREIGN KEY (`Member_ID`) REFERENCES `members` (`Member_ID`),
  ADD CONSTRAINT `Users_Members_Jobs_FK3` FOREIGN KEY (`Job_ID`) REFERENCES `jobs` (`Job_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

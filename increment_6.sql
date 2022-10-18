-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 03:55 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worship_tracker`
--
DROP DATABASE IF EXISTS `worship_tracker`;
CREATE DATABASE IF NOT EXISTS `worship_tracker` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `worship_tracker`;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Role_ID` int(2) NOT NULL,
  `Description` text NOT NULL,
  `Start_Date` date NOT NULL DEFAULT '2022-01-01',
  `End_Date` date DEFAULT '2030-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Role_ID`, `Description`, `Start_Date`, `End_Date`) VALUES
(1, 'Worship Leader', '2022-01-01', '0000-00-00'),
(2, 'Vocals', '2022-01-01', '0000-00-00'),
(3, 'Drums', '2022-01-01', '0000-00-00'),
(4, 'Electric Guitar', '2022-01-01', '0000-00-00'),
(5, 'Bass Guitar', '2022-01-01', '0000-00-00'),
(6, 'Keys', '2022-01-01', '2030-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `Schedule_ID` int(5) NOT NULL,
  `Worship_Date` date NOT NULL DEFAULT current_timestamp(),
  `Song_Title` varchar(30) NOT NULL,
  `Member_ID` int(5) NOT NULL,
  `Role_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`Schedule_ID`, `Worship_Date`, `Song_Title`, `Member_ID`, `Role_ID`) VALUES
(2, '2022-04-17', 'Jesus Paid it all', 1, 1),
(3, '2022-04-17', 'Egypt', 1, 1),
(4, '2022-04-17', 'Every Victory', 1, 6),
(9, '2022-01-23', 'Egypt', 1, 1),
(10, '2022-01-23', 'Battle Belongs', 1, 1),
(11, '2022-01-23', 'All Hail King Jesus', 18, 2),
(12, '2022-01-23', 'What a Beautiful Name', 18, 2),
(13, '2022-01-30', 'Won\'t Stop Now', 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs` (
  `Song_Title` varchar(30) NOT NULL,
  `Composer` varchar(30) NOT NULL,
  `Song_Key` varchar(2) NOT NULL,
  `Length` decimal(5,2) NOT NULL,
  `Total_Count` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`Song_Title`, `Composer`, `Song_Key`, `Length`, `Total_Count`) VALUES
('All Hail King Jesus', 'Bethel Music', 'E', '5.36', NULL),
('Battle Belongs', 'Phil Wickham', 'B', '5.06', NULL),
('Champion', 'Bethel Music', 'A', '5.07', NULL),
('Egypt', 'Bethel Music', 'A', '6.01', NULL),
('Every Victory', 'Danny Gokey', 'D', '4.00', NULL),
('Firm Foundation', 'Cody Carnes', 'Bb', '6.21', NULL),
('Good Grace', 'Hillsong United', 'A', '6.00', NULL),
('Hallelujah (God Be Praised)', 'Emmanuel LIVE', 'D', '7.06', NULL),
('I Thank God', 'Maverick City ', 'C', '4.31', NULL),
('Jesus At The Center', 'Israel and New Breed', 'A', '5.56', NULL),
('Jesus Paid It All', 'Worship Circle', 'D', '3.17', NULL),
('King of Kings', 'Hillsong Worship', 'D', '4.49', NULL),
('No Longer Slaves', 'Bethel Music', 'A', '4.30', NULL),
('The Heart of Worship', 'Matt Redman', 'A', '6.00', NULL),
('What a Beautiful Name', 'Hillsong Worship', 'D', '3.58', NULL),
('Won\'t Stop Now', 'Elevation Worship', 'A', '4.15', NULL),
('Worthy', 'Elevation Worship', 'D', '6.06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `worship_member`
--

DROP TABLE IF EXISTS `worship_member`;
CREATE TABLE `worship_member` (
  `Member_ID` int(5) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Phone` int(7) NOT NULL,
  `Role` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worship_member`
--

INSERT INTO `worship_member` (`Member_ID`, `LastName`, `FirstName`, `Address`, `City`, `Phone`, `Role`) VALUES
(1, 'Ramsey', 'Daniel', '1840 South Eola Drive', 'Orlando', 4024355, 1),
(13, 'Longacre', 'Jenny', '123 Oceanview Lane', 'Delray', 5468735, 2),
(14, 'Whaley', 'Ranger', '435 Michigan Ave', 'Orlando', 1863542, 3),
(15, 'Weekley', 'Emi', '234 Oak Island', 'Belle Isle', 2657936, 6),
(16, 'Albritton', 'Joshua', '6354 Orange Avenue', 'Windemere', 1786354, 5),
(17, 'Weekley', 'Emi', '4782 Lake View Lane', 'Orlando', 2973645, 6),
(18, 'Asher', 'Shelby', '375 Lakeview Road', 'Belle Isle', 3827465, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`Schedule_ID`),
  ADD KEY `Role_ID` (`Role_ID`),
  ADD KEY `Member_ID` (`Member_ID`),
  ADD KEY `Song_Title` (`Song_Title`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`Song_Title`);

--
-- Indexes for table `worship_member`
--
ALTER TABLE `worship_member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD KEY `Role` (`Role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Role_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `Schedule_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `worship_member`
--
ALTER TABLE `worship_member`
  MODIFY `Member_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Song_Title`) REFERENCES `songs` (`Song_Title`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`Member_ID`) REFERENCES `worship_member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`Role_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `worship_member`
--
ALTER TABLE `worship_member`
  ADD CONSTRAINT `worship_member_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `role` (`Role_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

GRANT ALL PRIVILEGES ON *.* TO `root`@`localhost` WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `worship_tracker`.* TO `root`@`localhost` WITH GRANT OPTION;

GRANT PROXY ON ''@'%' TO 'root'@'localhost' WITH GRANT OPTION;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2015 at 12:44 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vfu_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `ID` int(11) NOT NULL,
  `Start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `End` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Name` varchar(255) NOT NULL,
  `hall` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`ID`, `Start`, `End`, `Name`, `hall`) VALUES
(1, '2015-06-28 05:00:00', '2015-06-28 09:30:00', 'Programirane', 312),
(2, '2015-06-28 10:30:00', '2015-06-28 13:50:00', 'Law', 401),
(3, '2015-06-29 10:30:00', '2015-06-29 13:50:00', 'Analiz', 207),
(4, '2015-06-07 05:00:00', '2015-06-07 09:30:00', 'Statistics', 305);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `ID` int(11) NOT NULL,
  `form` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `specialty` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`ID`, `form`, `year`, `specialty`) VALUES
(1, 'redovno', 1, 'Informatics'),
(2, 'zadochno', 2, 'Informatics'),
(3, 'redovno', 1, 'Law'),
(4, 'redovno', 2, 'Law'),
(5, 'distant', 1, 'Psychology');

-- --------------------------------------------------------

--
-- Table structure for table `group_event`
--

CREATE TABLE IF NOT EXISTS `group_event` (
  `group_ID` int(11) NOT NULL,
  `event_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_event`
--

INSERT INTO `group_event` (`group_ID`, `event_ID`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `group_event`
--
ALTER TABLE `group_event`
  ADD UNIQUE KEY `unique_index` (`group_ID`,`event_ID`), ADD KEY `event_ID` (`event_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_event`
--
ALTER TABLE `group_event`
ADD CONSTRAINT `group_event_ibfk_1` FOREIGN KEY (`group_ID`) REFERENCES `group` (`ID`),
ADD CONSTRAINT `group_event_ibfk_2` FOREIGN KEY (`event_ID`) REFERENCES `event` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

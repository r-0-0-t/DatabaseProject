-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 05, 2019 at 10:24 AM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meal`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `ID` varchar(6) NOT NULL,
  `security_fee` decimal(3,0) DEFAULT NULL,
  `phone_no` decimal(13,0) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `religion` varchar(15) DEFAULT NULL,
  `profession` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`ID`, `security_fee`, `phone_no`, `name`, `city`, `address`, `religion`, `profession`, `email`) VALUES
('MH0001', '300', '1537009308', 'SF', 'Sylhet', 'Shah Eidgah,Sylhet', 'Islam', 'Student', 'sf@gmail.com'),
('MH0002', '300', '8801537009308', 'Kazi Tushita Tahsin', 'Sylhet', 'Samad Hall,Madina Market', 'Islam', 'Genetor', 'tushitatahsin@gmail.com'),
('MH0003', '300', '8801537009309', 'Rafa Jarin', 'Sylhet', 'First Ladies Hall,Sust', 'Islam', 'Genetor', 'rafa@gmail.com'),
('MH0004', '300', '880199999999', 'Tasmia Alamgir', 'Sylhet', 'First Ladies Hall,Sust', 'Islam', 'Lecturer', 'tasmia@gmail.com'),
('MH0005', '300', '880199999999', 'Nahiyan Nashrah', 'Sylhet', 'Second Ladies Hall,Sust', 'Islam', 'Nomad', 'nahiyan@gmail.com'),
('MH0006', '300', '880199999999', 'Nazia Nishat Chowdhury', 'Sylhet', 'Shah Eidgaah', 'Islam', 'Player', 'nishat@gmail.com'),
('MH0007', '300', '880199999999', 'Yasmi Tohabar Evon', 'Sylhet', 'Newmarket', 'Islam', 'Pupil', 'yasmi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Grocery`
--

CREATE TABLE `Grocery` (
  `item_name` varchar(50) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `price` decimal(8,4) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `day` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Meal`
--

CREATE TABLE `Meal` (
  `cost` decimal(2,0) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `customer_ID` varchar(6) DEFAULT NULL,
  `menu_ID` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Menu`
--

CREATE TABLE `Menu` (
  `ID` varchar(3) NOT NULL,
  `protein_type` varchar(10) DEFAULT NULL,
  `rice_type` varchar(10) DEFAULT NULL,
  `dal_type` varchar(10) DEFAULT NULL,
  `vegetable_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Preference`
--

CREATE TABLE `Preference` (
  `customer_ID` varchar(6) DEFAULT NULL,
  `allergic_to` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Reciept`
--

CREATE TABLE `Reciept` (
  `customer_ID` varchar(6) DEFAULT NULL,
  `month` varchar(12) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `date` decimal(2,0) DEFAULT NULL,
  `balance` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Service_Provider`
--

CREATE TABLE `Service_Provider` (
  `name` varchar(20) DEFAULT NULL,
  `ID` varchar(6) DEFAULT NULL,
  `phone_no` decimal(13,0) DEFAULT NULL,
  `salary` decimal(8,0) DEFAULT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Meal`
--
ALTER TABLE `Meal`
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `menu_ID` (`menu_ID`);

--
-- Indexes for table `Menu`
--
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Preference`
--
ALTER TABLE `Preference`
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `Reciept`
--
ALTER TABLE `Reciept`
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Meal`
--
ALTER TABLE `Meal`
  ADD CONSTRAINT `Meal_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `Customer` (`ID`),
  ADD CONSTRAINT `Meal_ibfk_2` FOREIGN KEY (`menu_ID`) REFERENCES `Menu` (`ID`);

--
-- Constraints for table `Preference`
--
ALTER TABLE `Preference`
  ADD CONSTRAINT `Preference_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `Customer` (`ID`);

--
-- Constraints for table `Reciept`
--
ALTER TABLE `Reciept`
  ADD CONSTRAINT `Reciept_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `Customer` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

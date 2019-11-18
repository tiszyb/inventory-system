-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 06:05 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(1, 'Random Customer', '', 333829832, 0, 'Ashmola', 'Ashmola', 'Ikorodu', 'Colombo', 'Active', '2019-10-31 08:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `productID` int(11) NOT NULL,
  `itemNumber` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `unitPrice` float NOT NULL DEFAULT '0',
  `imageURL` varchar(255) NOT NULL DEFAULT 'imageNotAvailable.jpg',
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`productID`, `itemNumber`, `itemName`, `discount`, `stock`, `unitPrice`, `imageURL`, `status`, `description`) VALUES
(60, 1, 'novalgin', 0, 28, 100, 'imageNotAvailable.jpg', 'Active', '2021-02-25'),
(61, 2, 'Paracetamol', 0, 5, 50, 'imageNotAvailable.jpg', 'Active', '2020-09-17'),
(62, 3, 'Flagyl', 0, 16, 200, 'imageNotAvailable.jpg', 'Active', '2020-05-01'),
(63, 4, 'Panadol', 0, 37, 100, 'imageNotAvailable.jpg', 'Active', '2020-07-02'),
(64, 5, 'Ampiclox', 0, 22, 100, 'imageNotAvailable.jpg', 'Active', '2020-05-29'),
(65, 6, 'Cofmix', 0, 18, 800, 'imageNotAvailable.jpg', 'Active', '2020-06-25'),
(66, 7, 'Flucold', 0, 14, 250, 'imageNotAvailable.jpg', 'Active', '2020-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `purchaseDate` date NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `unitPrice` float NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `vendorName` varchar(255) NOT NULL DEFAULT 'Test Vendor',
  `vendorID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseID`, `itemNumber`, `purchaseDate`, `itemName`, `unitPrice`, `quantity`, `vendorName`, `vendorID`) VALUES
(70, '3', '2019-11-18', 'Flagyl', 200, 4, 'Random Vendor', 1),
(71, '5', '2019-11-18', 'Ampiclox', 100, 12, 'Random Vendor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `saleID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `saleDate` date NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unitPrice` float(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`saleID`, `itemNumber`, `customerID`, `customerName`, `itemName`, `saleDate`, `discount`, `quantity`, `unitPrice`) VALUES
(32, '5', 1, 'Random Customer', 'Ampiclox', '2019-11-18', 0, 2, 100),
(33, '2', 1, 'Random Customer', 'Paracetamol', '2019-11-18', 0, 5, 50),
(34, '2', 1, 'Random Customer', 'Paracetamol', '2019-11-18', 0, 1, 50),
(35, '1', 1, 'Random Customer', 'novalgin', '2019-11-18', 0, 1, 100),
(36, '2', 1, 'Random Customer', 'Paracetamol', '2019-11-18', 0, 1, 50),
(37, '4', 1, 'Random Customer', 'Panadol', '2019-11-18', 0, 2, 100),
(38, '4', 1, 'Random Customer', 'Panadol', '2019-11-18', 0, 1, 100),
(39, '3', 1, 'Random Customer', 'Flagyl', '2019-11-18', 0, 1, 200),
(40, '5', 1, 'Random Customer', 'Ampiclox', '2019-11-18', 0, 1, 100),
(41, '2', 1, 'Random Customer', 'Paracetamol', '2019-11-18', 0, 1, 50),
(42, '5', 1, 'Random Customer', 'Ampiclox', '2019-11-18', 0, 1, 100),
(43, '3', 1, 'Random Customer', 'Flagyl', '0000-00-00', 0, 1, 200),
(44, '2', 1, 'Random Customer', 'Paracetamol', '0000-00-00', 0, 1, 50),
(45, '2', 1, 'Random Customer', 'Paracetamol', '2019-11-18', 0, 1, 50),
(46, '1', 1, 'Random Customer', 'novalgin', '2019-11-18', 0, 1, 100),
(47, '2', 1, 'Random Customer', 'Paracetamol', '0000-00-00', 0, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `password`, `status`) VALUES
(5, 'Guest', 'guest', '81dc9bdb52d04dc20036dbd8313ed055', 'Active'),
(6, 'ibrahim', 'ibrahim', '27705499a40b23773fd85933ca71b601', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendorID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendorID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(1, 'Random Vendor', '', 2343567, 0, '80, Ground Floor, ABC Shopping Complex', '46th Avenue', 'Kolpetty', 'Colombo', 'Active', '2018-05-05 05:48:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

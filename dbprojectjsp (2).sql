-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 06, 2021 at 01:35 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbprojectjsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `aid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `upass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`aid`, `uname`, `email`, `upass`) VALUES
(1, 'shreya kale', 'shreyakale56@gmail.com', 'shreya1998');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart1`
--

CREATE TABLE `tblcart1` (
  `carid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcart1`
--

INSERT INTO `tblcart1` (`carid`, `pid`, `qty`, `uid`, `status`) VALUES
(1, 1, 2500, 4, 0),
(2, 2, 30000, 4, 0),
(3, 3, 2500, 3, 1),
(4, 4, 2000, 3, 0),
(5, 23, 3000, 5, 0),
(6, 1, 3000, 5, 0),
(7, 1, 3200, 7, 0),
(8, 1, 3300, 7, 0),
(9, 1, 3400, 4, 0),
(10, 5, 26000, 7, 0),
(11, 24, 2600, 2, 0),
(12, 24, 32000, 4, 0),
(13, 30, 550, 16, 0),
(14, 29, 850, 7, 0),
(15, 27, 4000, 3, 0),
(16, 1, 3500, 4, 0),
(17, 3, 3000, 1, 0),
(18, 29, 900, 1, 0),
(19, 31, 650, 18, 0),
(20, 32, 5300, 18, 0),
(21, 30, 560, 23, 0),
(25, 31, 700, 30, 0),
(30, 2, 32000, 1, 0),
(31, 31, 720, 27, 0),
(32, 2, 33000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`cid`, `cname`) VALUES
(0, 'All Categories'),
(2, 'Jewelry'),
(3, 'Fashion'),
(4, 'Computer & Electronics'),
(5, 'Sports '),
(6, 'Furniture');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaint`
--

CREATE TABLE `tblcomplaint` (
  `fno` int(11) NOT NULL,
  `fdate` date NOT NULL,
  `fname` varchar(50) NOT NULL,
  `femail` varchar(30) NOT NULL,
  `fdesc` text NOT NULL,
  `prno` int(11) NOT NULL,
  `pdesc` text NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaint`
--

INSERT INTO `tblcomplaint` (`fno`, `fdate`, `fname`, `femail`, `fdesc`, `prno`, `pdesc`, `uid`) VALUES
(1, '2020-04-19', 'Ashwini Dhikle', 'ashwini56@gmail.com', 'product description', 8799, 'the product specifications are not really good', 4),
(2, '2020-06-08', 'Sanjay Kale', 'suyashakarpe@gmail.com', 'about product description', 6758, 'The description given for this product is actually wrong', 23);

-- --------------------------------------------------------

--
-- Table structure for table `tblpro`
--

CREATE TABLE `tblpro` (
  `pid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `pno` int(11) NOT NULL,
  `pmprice` float NOT NULL,
  `pstock` int(11) NOT NULL,
  `pdate` text NOT NULL,
  `ptime` time NOT NULL,
  `pdesc` text NOT NULL,
  `pimage` text NOT NULL,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpro`
--

INSERT INTO `tblpro` (`pid`, `pname`, `pno`, `pmprice`, `pstock`, `pdate`, `ptime`, `pdesc`, `pimage`, `cid`, `uid`, `count`) VALUES
(1, 'pqr', 675, 20, 7, '2020-07-07', '10:30:00', 'ghhjkkj\r\n\r\n\r\n', 'null', 0, 2, 0),
(2, 'gloves', 675, 2000, 2, '2020-07-07', '10:30:00', 'cricket gloves\r\n\r\n', 'ear1.jpg', 5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `pid` int(11) NOT NULL,
  `pname` varchar(80) NOT NULL,
  `pno` int(11) NOT NULL,
  `pmprice` int(11) NOT NULL,
  `pstock` int(11) NOT NULL,
  `pdate` date NOT NULL,
  `ptime` time NOT NULL,
  `pdesc` longtext NOT NULL,
  `pimage` text NOT NULL,
  `cid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`pid`, `pname`, `pno`, `pmprice`, `pstock`, `pdate`, `ptime`, `pdesc`, `pimage`, `cid`, `uid`, `count`, `status`) VALUES
(1, 'Jumpsuit', 45667, 2000, 5, '2020-06-05', '14:30:00', 'Slenor Striped Women Red Jumpsuit', 'jump.jpg', 3, 1, 0, 1),
(2, ' Earing', 65476, 25000, 4, '2020-07-04', '11:00:00', 'white Diamond with golden covering', 'ear1.jpg', 2, 2, 0, 0),
(3, 'Jacket', 6765, 2000, 1, '2020-08-03', '17:30:00', 'Blue Denim Jacket ', 'jacket.jpg', 3, 4, 0, 0),
(4, 'Jeans', 5467, 1500, 5, '2020-07-01', '17:30:00', ' Blue Wash Cotton Denim Regular Fit Jeans.\r\n\r\n', 'jeans4.jpg', 3, 4, 0, 0),
(5, 'Dell Laptop', 6758, 25000, 1, '2020-06-20', '16:00:00', '4GB RAM With I3 Processor', 'dell.jpeg', 4, 2, 1, 0),
(23, 'Gloves', 67678, 2500, 2, '2020-07-01', '11:18:00', 'white Cricket Gloves', 'glove.jpg', 5, 7, 0, 0),
(24, 'Lenovo laptop', 45367, 30000, 2, '2020-06-15', '15:00:00', 'Windows 7 professional 64-bit operating system .', 'lenovo.jpg', 4, 1, 0, 1),
(27, 'Watch', 8799, 3590, 2, '2020-07-03', '12:30:00', 'Titan Men\'s \'Neo\' Fashion/casual/Business Mineral Quartz Dial-Leather/Brass and silver Toned Strap', 'watch5.jpg', 1, 6, 1, 0),
(29, 'Wall Shelf', 43256, 799, 3, '2020-06-15', '13:00:00', 'Custom  Decor Mounted Shelf set of three floating interesting storage display wall shelves.', 'fur3.jpg', 6, 4, 0, 0),
(30, 'Wall Shelf', 34569, 449, 3, '2020-06-25', '13:00:00', 'Wall Decoration Straight Shelf set of Hexa designer wall Rack and Wall Shelves .', 'fur5.jpg', 6, 2, 0, 0),
(31, 'Perl Earing', 261425, 625, 2, '2020-08-02', '12:30:00', 'Pearl and shell Dangle Drop Earing', 'pearl.jpeg', 2, 23, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `upass` varchar(50) NOT NULL,
  `addr` text NOT NULL,
  `phone` bigint(11) NOT NULL,
  `State` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zcode` int(11) NOT NULL,
  `panno` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`uid`, `uname`, `email`, `upass`, `addr`, `phone`, `State`, `city`, `zcode`, `panno`) VALUES
(1, 'shree karpe', 'Shree62@gmail.com', 'shree', '			Vilholi,Nashik					\r\n', 9134567900, 'Maharashtra', 'Nashik', 57588, 'BXPCK7824C'),
(2, 'Ashwini Dhikale', 'ashwini56@gmail.com', 'Ashwini@123', 'Meerpur,Bhopal', 9953457730, 'Rajasthan', 'Bhopal', 576789, 'RXDCS3402M'),
(3, 'Shruti Amrutkar', 'shruti22@gmail.com', 'Shruti@123', 'ShivajiNagar,Pune						', 9453426778, 'Maharashtra', 'Pune', 43567, 'DCVXC4567B'),
(4, 'Shraddha Karpe', 'shraddhakarpe56@gmail.com', 'Shraddha@123', '		Egatputi,Nashik						', 992133320, 'Maharashtra', 'Nashik', 5647, 'SHTCN6789K'),
(5, 'Bhagyashri Kale', 'bhagi89@gmail.com', 'Bhagya@123', 'pimplgaon,chandigarh', 993245780, 'Punjab', 'Chandigarh', 67578, 'MNTCS3420K'),
(6, 'Disha Lawand', 'disha12@gmail.com', 'Disha@123', 'Gandhi Nagar,Jaypur', 892133330, 'Rajasthan', 'Jaypur', 65578, 'CEQPK4956K'),
(7, 'Rameshwar Karpe', 'ramesh12@gmail.com', 'Ramesh@123', 'Goregaon,Mumbai', 8788045819, 'Maharashtra', 'Mumbai', 65578, 'CEQPK4956K'),
(16, 'Madhuri Nathe', 'madhuri12@gmail.com', 'Madhuri@123', 'patherdi Phata,Nashik', 6543212345, 'Maharashtra', 'Nashik', 76678, 'CYTPK4956K'),
(18, 'Rishi Saxena', 'rishi56@gmail.com', 'Rishi@123', 'Goregaon,Mumbai', 8987045819, 'Maharashtra', 'Mumbai', 54637, 'BXDPK3402X'),
(19, 'Riya Sharma', 'riya56@gmail.com', 'Riyasharma@123', 'Vadala naka,Nashik', 5467342650, 'Maharashtra', 'Nashik', 78799, 'BXDPK3402X'),
(23, 'Sanjay Kale', 'suyashakarpe@gmail.com', 'Suyash@123', 'Sudarshan Appartment, Goregaon,Mumbai', 8687079820, 'Punjab', 'Chandigarh', 202020, 'DEPQL5845S'),
(28, 'Vidya Dhum', 'vidyadhum@gmail.com', 'Vidya@123', 'Priyadarshan colony,Satpur,Nashik', 8788095810, 'Maharashtra', 'Nashik', 564720, 'BXDPK3402M'),
(29, 'Madhuri Nathe', 'shraddhakarpe56@gmail.com', 'Shraddha1998', 'Jaypur,Rajsthan', 8687079820, 'Jammu And Kashmir', 'Hydrabad', 6557899, 'ASPPK3402Q'),
(30, 'Priya Sharma', 'priya@gmail.com', 'Priya@123', 'shree apartment,meera road,Mumbai', 9921333240, 'Maharashtra', 'Mumbai', 424040, 'MBHKS4545L'),
(32, 'kiran kale', 'kiran@gmai.com', 'Kiran@123', 'mahatma nagar,Nashik', 9912433499, 'Maharashtra', 'Nashik', 422010, 'ASJKL2345L');

-- --------------------------------------------------------

--
-- Table structure for table `try3`
--

CREATE TABLE `try3` (
  `try3id` int(11) NOT NULL,
  `hey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `try3`
--

INSERT INTO `try3` (`try3id`, `hey`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trytable`
--

CREATE TABLE `trytable` (
  `tryid` int(11) NOT NULL,
  `xid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `tblcart1`
--
ALTER TABLE `tblcart1`
  ADD PRIMARY KEY (`carid`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tblcomplaint`
--
ALTER TABLE `tblcomplaint`
  ADD PRIMARY KEY (`fno`);

--
-- Indexes for table `tblpro`
--
ALTER TABLE `tblpro`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `try3`
--
ALTER TABLE `try3`
  ADD PRIMARY KEY (`try3id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcart1`
--
ALTER TABLE `tblcart1`
  MODIFY `carid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcomplaint`
--
ALTER TABLE `tblcomplaint`
  MODIFY `fno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpro`
--
ALTER TABLE `tblpro`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `try3`
--
ALTER TABLE `try3`
  MODIFY `try3id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

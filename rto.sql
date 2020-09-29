-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2020 at 03:28 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rto`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test1` (IN `id` BIGINT)  BEGIN
INSERT INTO drivinglicense(cov,doi,usr_aadhar)
SELECT cov,T_Date,usr_aadhar
FROM learninglicence
WHERE usr_aadhar=id;
DELETE FROM learninglicence where usr_aadhar=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(25) DEFAULT NULL,
  `adminid` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `phone` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `adminid`, `password`, `phone`) VALUES
('Arjun ', 'arj36', '123xyz', 9852586478),
('Likith', 'lc001', 'wings1221', 9900475688);

-- --------------------------------------------------------

--
-- Table structure for table `controls`
--

CREATE TABLE `controls` (
  `adminid` varchar(20) DEFAULT NULL,
  `usr_aadhar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drivinglicense`
--

CREATE TABLE `drivinglicense` (
  `DLno` varchar(20) DEFAULT NULL,
  `cov` varchar(10) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `doe` date DEFAULT NULL,
  `usr_aadhar` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivinglicense`
--

INSERT INTO `drivinglicense` (`DLno`, `cov`, `doi`, `doe`, `usr_aadhar`) VALUES
('KA15532', 'LMV', '2019-10-23', '2055-11-12', 1231321112313218),
('KA219187', 'lmv', '2019-10-01', '2056-12-08', 7412589631478523),
('ad21234', 'lmv', '2019-12-02', '2034-12-08', 1234123412341234),
('KA11102', 'lmv', '2019-11-10', '2076-10-03', 4321123409877891);

-- --------------------------------------------------------

--
-- Table structure for table `learninglicence`
--

CREATE TABLE `learninglicence` (
  `LLno` varchar(20) NOT NULL,
  `cov` varchar(10) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `doe` date DEFAULT NULL,
  `usr_aadhar` bigint(20) NOT NULL,
  `T_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rc`
--

CREATE TABLE `rc` (
  `regno` varchar(10) NOT NULL,
  `engno` varchar(15) NOT NULL,
  `fuel` varchar(8) NOT NULL,
  `cov` varchar(10) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `doe` date DEFAULT NULL,
  `model` varchar(25) DEFAULT NULL,
  `ownerid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rc`
--

INSERT INTO `rc` (`regno`, `engno`, `fuel`, `cov`, `doi`, `doe`, `model`, `ownerid`) VALUES
('KA02KA7633', 'BD1CK2401340', 'petrol', 'MCWG', '2019-06-20', '2069-12-19', 'TVS Apache', 7546546824157896),
('KA05BK1511', 'KD1CK2401220', 'petrol', 'MC', '2019-08-22', '2058-10-11', 'Honda Dio', 65465416);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `t_no` int(11) NOT NULL,
  `b_id` bigint(20) DEFAULT NULL,
  `s_id` bigint(20) DEFAULT NULL,
  `regno` varchar(10) DEFAULT NULL,
  `fuel` varchar(8) DEFAULT NULL,
  `tdate` date DEFAULT NULL,
  `cov` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`t_no`, `b_id`, `s_id`, `regno`, `fuel`, `tdate`, `cov`) VALUES
(101, 7546546824157896, 1254854756986325, 'KA02KA7633', 'petrol', '2019-06-15', 'MCWG'),
(102, 65465416, 854651, 'KA05BK1511', 'petrol', '2019-05-05', 'LMV');

--
-- Triggers `transfer`
--
DELIMITER $$
CREATE TRIGGER `trig2` AFTER INSERT ON `transfer` FOR EACH ROW BEGIN
UPDATE rc set ownerid=NEW.b_id WHERE regno=NEW.regno;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT 'NULL',
  `Lname` varchar(15) DEFAULT 'NULL',
  `aadhar` bigint(20) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `phno` bigint(20) DEFAULT NULL,
  `D_Test` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Fname`, `Mname`, `Lname`, `aadhar`, `address`, `phno`, `D_Test`) VALUES
('Likith', 'Chandan', 'M', 1231321112313218, 'Rajajinagar', 9900475899, 'pass'),
('Manoj', 'ghat', 'M', 1234123412341234, 'rajaijnagar', 9900475599, 'pass'),
('Manoj', 'Prakash', 'K', 1234432156785678, 'rrnagar', 123321456, NULL),
('Navdeep', 'Singh', 'K', 4321123409877891, 'KR Market', 984890091, 'pass'),
('Arjun ', 'Reddy', 'G', 7412589631478523, 'KRpuram', 9900584799, 'pass');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `trig1` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
IF (NEW.D_Test='pass')
THEN
CALL test1(NEW.aadhar);
END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`,`password`);

--
-- Indexes for table `learninglicence`
--
ALTER TABLE `learninglicence`
  ADD PRIMARY KEY (`LLno`);

--
-- Indexes for table `rc`
--
ALTER TABLE `rc`
  ADD PRIMARY KEY (`regno`),
  ADD UNIQUE KEY `engno` (`engno`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`t_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`aadhar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

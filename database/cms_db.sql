-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2023 at 03:58 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRINT_NO_USERS` ()  DETERMINISTIC BEGIN
SELECT COUNT(*) AS TOTAL_NUMBER_OF_USERS FROM USERS WHERE type='2';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TOTAL_NO_PARCELS` ()   BEGIN
SELECT COUNT(*) AS TOTAL_NUMBER_OF_PARCELS FROM parcels;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(30) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(1, 'Branch_1', 'Fast Courier Office', 'PVS Circle, Mangaluru', 'Karnataka', '575003', 'India', '+91 9108394592', '2023-01-19 19:39:26'),
(2, 'Branch_2', 'Fast Courier Office', 'Gurugaon-New Delhi', 'Delhi NCR', '100230', 'India', '+91 8050762432', '2023-01-19 19:48:25'),
(3, 'Branch_3', 'Fast Courier Office', 'Dharmastala-main road, Ujire', 'Karnataka', '574240', 'India', '+91 9902307620', '2023-01-19 19:43:03'),
(4, 'Branch_4', 'Fast Courier Office', 'Kalasipalya-Bengaluru', 'Karnataka', '576001', 'India', '+91 8197560241', '2020-11-27 13:31:49'),
(5, 'Branch_5', 'Fast Courier Office', 'Bandra-Mumbai', 'Maharashtra', '460123', 'India', '+91 9741089115', '2023-01-19 19:46:09'),
(6, 'Branch_6', 'Fast Courier Office', 'Baker Street -London', 'London', 'NW1', 'England', '+44 8508751247', '2023-01-19 19:51:08'),
(9, 'g8VXOj2RhditzUy', 'h25', 'indore', 'madhyapradesh', '475201', 'india', '9104752145', '2023-01-29 15:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` int(30) NOT NULL,
  `to_branch_id` int(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `price`, `status`, `date_created`) VALUES
(8, '390769166663', 'Naveen', 'Mookambika auto links, near aruna theatre, Puttur,574217', '8050662432', 'Manish ', 'apartment no -7 galaxy apartments bejai', '9741089115', 2, 1, 1, '10', 2000, 9, '2023-01-19 20:38:56'),
(24, '253243212272', 'Abhishek', '139, Infantry Road, Sterling Heights, Infantry Road  Bangalore 560001  22864101', '8050662432', 'Rakshith Singh', '7, Ayyamudali Street, Chindadripet  Chennai, Tamil Nadu, 600008  44 - 28530237', '9741089115', 2, 1, 4, '50', 5050, 8, '2023-01-21 00:36:02'),
(26, '214580115156', 'Shankar', '1 3rd Floor, 4894-96 Har Shri Nath Market, Feet Road  Delhi, Delhi, 110006  23610521', '9963587412', 'Shri Krishna', 'R 474, Midc, Ttc Indl Area, Thane Belapur Rd, Rabale, Navi Mumbai  Mumbai, Maharashtra, 400701  02227694177', '7894562581', 2, 1, 2, '100', 1500, 7, '2023-01-21 00:49:21'),
(28, '494886988963', 'Atul Kulkarni', '4, Gr. Flr, Maniyar Bhavan, Tardeo Road, Tardeo  Mumbai, Maharashtra, 400034  02223510297', '9963587412', 'Shahid Khan', '175/2, 175/2,sprdblr-2, S P Road  Bangalore, Karnataka, 560002  22120863', '8478596325', 2, 1, 5, '150', 2090, 6, '2023-01-21 00:54:38'),
(29, '713712763449', 'Rajan', '202, Brigade, Annxe K R Road, Jayanagar  Bangalore, Karnataka, 560082  08026769333', '7892589632', 'Kannan', '447s G R Building, Opp Raja Theatre, Townhall  Coimbatore, Tamil Nadu, 641001  04222317191', '8794152637', 2, 1, 4, '100', 990, 5, '2023-01-21 00:56:38'),
(30, '163047915151', 'Rayappa', 'Shop No 1/a, Pahilaj Kunj, Lohar Ali,stn Rd, Thane (west)  Mumbai, Maharashtra, 400601  02225331496', '9517538524', 'Sharada', 'Opp Dukes Factory, Chembur  Mumbai, Maharashtra, 400071  02256042977', '9654789432', 2, 1, 5, '1200', 3380, 4, '2023-01-21 00:59:03'),
(32, '260166100571', 'Hithan ', 'Ground Floor, 4 Pti Building, Parliament Street  Delhi, Delhi, 110001  23736859', '7569814756', 'John Sera', 'H/20, Apmc Market,phase-ii, Sector 19, Vashi, Navi Mumbai  Mumbai, Maharashtra, 400705  02227660590', '9874561471', 2, 1, 2, '150', 980, 3, '2023-01-21 01:01:23'),
(33, '142502158339', 'Shashi', '7, Mangaldas Bldg No2, Mangaldas Road, Shamaldas Gandhi Marg, Princess Street  Mumbai, Maharashtra, 400002  02222016572', '9514785632', 'Anish', '11, Sampatrao Colony, R C Dutt Road, Opp. Circuit House  Mangaluru 571001 78954562', '8796241536', 2, 1, 3, '150', 1300, 2, '2023-01-21 01:04:00'),
(34, '718776490766', 'David bukingham', '85 Church Road London NW15 3KU', '9208965425', 'Shridhar', 'A, Ravi Industries Road, Naupada, Thane(w)  Mumbai, Maharashtra, 400602  02225438512', '7895216547', 2, 1, 6, '2000', 7000, 0, '2023-01-21 01:08:22'),
(35, '098561976015', 'David bukingham', '85 Church Road London NW15 3KU', '9208965425', 'Shridhar', 'A, Ravi Industries Road, Naupada, Thane(w)  Mumbai, Maharashtra, 400602  02225438512', '7895216547', 2, 1, 6, '8000', 10000, 1, '2023-01-21 01:08:22');

--
-- Triggers `parcels`
--
DELIMITER $$
CREATE TRIGGER `insert_trigger` AFTER INSERT ON `parcels` FOR EACH ROW BEGIN
IF NEW.status = '0' THEN
INSERT INTO parcel_tracks(parcel_id,status,stat_desc,date_created) values(NEW.id,NEW.status,'Item accepted by courier',NEW.date_created);
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_status` BEFORE UPDATE ON `parcels` FOR EACH ROW BEGIN
IF NEW.status = '0' THEN
UPDATE parcel_tracks SET stat_desc='Item accepted by courier' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '1' THEN
UPDATE parcel_tracks SET stat_desc='Collected' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '2' THEN
UPDATE parcel_tracks SET stat_desc='Shipped' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '3' THEN
UPDATE parcel_tracks SET stat_desc='In transit' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '4' THEN
UPDATE parcel_tracks SET stat_desc='Arrived At Destination' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '5' THEN
UPDATE parcel_tracks SET stat_desc='Out for Delivery' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '6' THEN
UPDATE parcel_tracks SET stat_desc='Ready to Pickup' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '7' THEN
UPDATE parcel_tracks SET stat_desc='Delivered' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '8' THEN
UPDATE parcel_tracks SET stat_desc='Picked-up' WHERE parcel_id = NEW.id;
ELSEIF NEW.status = '9' THEN
UPDATE parcel_tracks SET stat_desc=' Unsuccessfull Delivery Attempt' WHERE parcel_id = NEW.id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_tracks`
--

CREATE TABLE `parcel_tracks` (
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `stat_desc` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel_tracks`
--

INSERT INTO `parcel_tracks` (`parcel_id`, `status`, `stat_desc`, `date_created`) VALUES
(8, 9, ' Unsuccessfull Delivery Attempt', '2023-01-21 01:21:18'),
(24, 8, 'Picked-up', '2023-01-21 01:20:10'),
(26, 7, 'Delivered', '2023-01-21 01:20:02'),
(28, 6, 'Ready to Pickup', '2023-01-21 01:19:43'),
(29, 5, 'Out for Delivery', '2023-01-21 01:19:21'),
(30, 4, 'Arrived At Destination', '2023-01-21 01:28:00'),
(32, 3, 'In transit', '2023-01-21 01:26:13'),
(33, 2, 'Shipped', '2023-01-21 01:17:28'),
(34, 0, 'Item accepted by courier', '2023-01-21 01:16:18'),
(35, 1, 'Collected', '2023-01-21 01:16:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'CMS- Fast Courier', 'cms@fcms.com', '+91 9108394592', 'Fast Courier Office, PVS Circle, Mangaluru', 'C:\\xampp\\htdocs\\courier\\assets\\About');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Admin', 'admin', 'admin@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, '2023-01-19 19:56:21'),
(2, 'Abhin', 'M', 'abhin@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 2, '2023-01-19 19:57:12'),
(3, 'Aditya', 'Kadam', 'adi@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 3, '2023-01-19 19:58:06'),
(4, 'Ankit', 'Jha', 'ankit@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 4, '2023-01-19 19:58:40'),
(5, 'Charan', 'K', 'charan@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 5, '2023-01-19 19:59:18'),
(6, 'John', 'Adams', 'jadams@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 6, '2023-01-19 20:00:05'),
(7, 'sharath', 'kumar', 'sharath@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 3, '2023-01-19 21:06:30'),
(14, 'pavan', 'singh', 'pavan@fcms.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 9, '2023-01-29 15:03:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch` (`from_branch_id`),
  ADD KEY `branch1` (`to_branch_id`);

--
-- Indexes for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD PRIMARY KEY (`parcel_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_ids` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parcels`
--
ALTER TABLE `parcels`
  ADD CONSTRAINT `branch` FOREIGN KEY (`from_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch1` FOREIGN KEY (`to_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD CONSTRAINT `parcelid1` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `branch_ids` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Dec 16, 2020 at 01:30 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanly`
--

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `id_speaker` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `position` int(11) NOT NULL,
  `company` varchar(120) NOT NULL,
  `image` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`id_speaker`, `name`, `position`, `company`, `image`) VALUES
(1, 'Nguyễn Thị Nga', 1, 'Ominext Group', 'Trưởng phòng đầu tư và phát triển'),
(2, 'Đào Bích Phượng', 2, 'TTC Solutions', 'Leader Automatic Team');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `sale_qty` int(11) NOT NULL,
  `sale_value` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `name`, `price`, `description`, `sale_qty`, `sale_value`, `quantity`) VALUES
(1, 'Ngay Hoi Tuyen dung', 100000, 've co tem dan trong gia', 50000, 60000, 100000),
(2, 'Ngay Hoi Tuyen dung', 100000, 've co tem dan trong gia', 50000, 60000, 100000),
(3, 'Ngay hoi tuyen dung', 500000, 've co tem trong gia \r\ncho vip ', 400000, 300000, 450000);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `topic_image` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `stage` int(11) NOT NULL,
  `timestart` datetime(6) DEFAULT NULL,
  `timeend` datetime(6) DEFAULT NULL,
  `id_speaker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `name`, `topic_image`, `description`, `stage`, `timestart`, `timeend`, `id_speaker`) VALUES
(1, 'Viec IT', 'cong nghe 4.0 tai Viet Nam', 'Chuyen gia hang dau ve linh vuc IT', 1, '2020-12-09 07:20:18.000000', '2020-12-09 14:00:00.000000', 1),
(2, 'IT va tuyen dung', 'Cac tieu chi ve ung vien cua IT', 'Leader tuyen dung co tam\r\n', 2, '2020-12-10 08:00:00.000000', '2020-12-10 11:00:00.000000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  `phone` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `name`, `address`, `username`, `password`, `email`, `image`, `phone`) VALUES
(1, 1, 'Tran Hoa', 'Ha Noi', 'HoaT', '25d55ad283aa400af464c76d713c07ad', 'tranhoa@gmail.com', 'Nhan vien ', '0911234566'),
(3, 2, 'Do Oanh', 'Hai Phong', 'OanhD', 'o1234567', 'oanhdo@gmail.com', 'Nhan vien', '0956123458'),
(4, 2, 'Do Oanh', 'Hai Phong', 'OanhD', 'o1234567', 'oanhdo@gmail.com', 'Nhan vien', '0956123458');

-- --------------------------------------------------------

--
-- Table structure for table `user_ticket`
--

CREATE TABLE `user_ticket` (
  `id_user` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `status` varchar(120) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_ticket`
--

INSERT INTO `user_ticket` (`id_user`, `id_ticket`, `status`, `time`) VALUES
(1, 1, 'Nghe va ghi chu', '0000-00-00 00:00:00.000000'),
(4, 2, 'Nghe ', '2020-12-09 01:00:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`id_speaker`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_speaker` (`id_speaker`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_ticket`
--
ALTER TABLE `user_ticket`
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `id_speaker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`id_speaker`) REFERENCES `speaker` (`id_speaker`);

--
-- Constraints for table `user_ticket`
--
ALTER TABLE `user_ticket`
  ADD CONSTRAINT `user_ticket_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `user_ticket_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

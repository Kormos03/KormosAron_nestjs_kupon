-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Dec 15, 2023 at 09:37 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szinhaz`
--

-- --------------------------------------------------------

--
-- Table structure for table `kuponok`
--

CREATE TABLE `kuponok` (
  `id` int NOT NULL,
  `title` varchar(1000) NOT NULL,
  `percentage` int NOT NULL,
  `code` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kuponok`
--

INSERT INTO `kuponok` (`id`, `title`, `percentage`, `code`) VALUES
(1, 'Wonka', 50, 'EFJJ-528767'),
(2, 'Madagaszkár', 20, 'jgfl-364710'),
(3, 'Csibefutam', 60, 'csib-666666'),
(4, 'Hihetetlen Hulk', 15, 'hihe-623573'),
(5, 'World war Z', 81, 'warz-748592'),
(12, 'Galambharc', 30, 'kkjj-887766'),
(13, 'Rambo', 40, 'jgkl-987654'),
(52, 'Forest', 40, 'fuss-123456'),
(54, 'Lincoln hadművelet', 30, 'linc-413124');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kuponok`
--
ALTER TABLE `kuponok`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kuponok`
--
ALTER TABLE `kuponok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

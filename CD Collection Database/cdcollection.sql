-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2016 at 04:14 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdcollection`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `release_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `artist_id`, `genre_id`, `name`, `description`, `image`, `release_date`) VALUES
(1, 1, 1, 'Revolutionary Radio', '"Rock and Roll Hall of Fame inductees and Grammy Award-winning rock band GREEN DAY will release their 12th studio album, entitled REVOLUTION RADIO, on OCTOBER 7th via Reprise Records. The album is launched with the incredible and raucous first single, ‘Bang Bang’ which see the band hit the heights of their snarling and political best', 'https://images-na.ssl-images-amazon.com/images/I/71GlXDVETbL._SL1200_.jpg', '2016-10-05'),
(2, 3, 4, 'Following My Intuition', 'Proin facilisis purus sit amet nulla consectetur varius. Sed sed turpis nec ex porttitor vulputate. Suspendisse vitae efficitur velit, vestibulum fermentum urna.', 'http://a5.mzstatic.com/eu/r30/Music71/v4/4b/e0/4e/4be04eb3-0c69-1fed-1de9-6c5d1e63d571/cover170x170.jpeg', '2016-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `bio`) VALUES
(1, 'Green Day', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent facilisis gravida arcu, eget scelerisque turpis vulputate auctor. Nam ac urna pharetra, facilisis magna a, pretium enim.'),
(2, 'Barry Gibb', 'Consectetur adipiscing elit. Praesent facilisis gravida arcu, eget scelerisque turpis vulputate auctor. Nam ac urna pharetra, facilisis magna a, pretium enim.'),
(3, 'Craig David', 'Praesent facilisis gravida arcu, eget scelerisque turpis vulputate auctor. Nam ac urna pharetra, facilisis magna a, pretium enim.'),
(4, 'Twenty One Pilots', 'Turpis vulputate auctor. Nam ac urna pharetra, facilisis magna a, pretium enim.'),
(5, 'Bruce Springsteen', 'Adipiscing elit. Praesent facilisis gravida arcu, eget scelerisque turpis vulputate auctor. Nam ac urna pharetra, facilisis magna a, pretium enim.');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Rock'),
(2, 'Hip Hop'),
(3, 'Country'),
(4, 'Dance');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `artistkey` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `genrekey` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

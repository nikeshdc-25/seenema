-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 07:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seenema`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminID` int(20) NOT NULL,
  `adminName` varchar(15) NOT NULL,
  `adminPassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminID`, `adminName`, `adminPassword`) VALUES
(12, 'nikesh25', '$2y$10$PjnOcVKQPOfoxiXwjktYpecoqRiF1PH6bHNbIL7V2bDQ2p8ytQKDm'),
(19, 'hitenNapit', '$2y$10$7ys1rZvyDIwS34K9wCuKB.UdRhdisx00Bcog7lL0j6hyW9I6zhDnK');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `movieID` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `actor` varchar(30) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `country` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `poster` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `imdbVotes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieID`, `title`, `director`, `actor`, `genre`, `country`, `description`, `poster`, `release_date`, `rating`, `imdbVotes`) VALUES
(1, 'Shawshank Redemption', 'Frank Darabont', 'Tim Robbins', 'Thriller', 'America', 'Andy Dufresne, a successful banker, is arrested for the murders of his wife and her lover, and is sentenced to life imprisonment at the Shawshank prison. He becomes the most unconventional prisoner.', 'https://humanehollywood.org/app/uploads/2020/06/5KCVkau1HEl7ZzfPsKAPM0sMiKc-scaled.jpg', '2014-10-14', 9.3, 2907056),
(2, 'Harry Potter and the Philosopher\'s Stone', 'Chris Columbus', '', 'Fantasy', '', 'Harry Potter, an eleven-year-old orphan, discovers that he is a wizard and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him', 'https://images.moviesanywhere.com/143cdb987186a1c8f94d4f18de211216/fdea56fa-2703-47c1-8da8-70fc5382e1ea.jpg', '2001-11-16', 7.6, 0),
(3, 'Jatra', 'Pradip Bhattarai', '', 'Comedy', '', 'After finding a bag of money, an impoverished man divides it with two of his friends to keep it safe.\r\n', 'https://m.media-amazon.com/images/M/MV5BMTAyNWJkZWItZDY3Yi00NTg5LTk1YzUtNmExMTk0MTYwODQyXkEyXkFqcGdeQXVyNjc5Mjg4Nzc@._V1_.jpg', '2016-11-11', 8.1, 0),
(4, 'Hami Tin Bhai', 'Shiva Regmi', '', 'Action', '', 'Hami Tin Bhai, a 2004 Nepali action, comedy film directed by Shiva Regmi, is the film featuring three of biggest superstars of the late 1990s and 2000s era- Rajesh Hamal, Shree Krishna Shrestha and Nikhil Upreti in the lead roles supported by Rekha Thapa, Jharana Thapa, Nandita KC, Keshab Bhattrai, Sushila Rayamajhi, Ravi Giri etc.', 'https://upload.wikimedia.org/wikipedia/en/c/ce/Hamiteenbhaiposter.jpg', '2013-10-13', 8.8, 0),
(5, 'Hostel', ' Hem Raj BC', '', 'Drama', '', 'The film is about the struggling life of teenagers in hostel. It features love, betrayal, friendship,emotions, family ties and so on.', 'https://m.media-amazon.com/images/M/MV5BMTVmODdmODktNzQ2OC00MDk3LTllZDEtZTMzMGU5MmM2OGU3L2ltYWdlXkEyXkFqcGdeQXVyNzIzNTEyODk@._V1_.jpg', '2013-06-13', 6.2, 0),
(6, 'Jhola', 'Yadav Kumar Bhattarai', '', 'Drama', '', 'Jhola is a 2013 Nepali film based on a story by writer Krishna Dharabasi. It is about Sati culture that was prevalent in the Nepalese society until the 1920s in which wife had to immolate herself upon her husband\'s death, typically on his funeral pyre.', 'https://upload.wikimedia.org/wikipedia/en/0/02/Jhola_movie_poster.jpeg', '2013-12-07', 7.7, 0),
(15, 'Scarface', 'Brian De Palma', '', 'Action', '', 'Tony Montana and his close friend Manny, build a strong drug empire in Miami. However as his power begins to grow, so does his ego and his enemies, and his own paranoia begins to plague his empire.', 'https://m.media-amazon.com/images/M/MV5BNjdjNGQ4NDEtNTEwYS00MTgxLTliYzQtYzE2ZDRiZjFhZmNlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg', '1983-12-09', 8.3, 0),
(16, 'Agastya: Chapter 1', 'Nimesh Shrestha', '', 'Action', '', 'Agyasta: Chapter 1 is a 2024 Nepali action thriller film directed by Saurav Chaudhary under the banner of Dark Horse Entertainment and Seven Seas Entertainment. Released on 1 March 2024, the film stars Saugat Malla, Najir Husen, Nischal Basnet, Pramod Agrahari, Malika Mahat, and Bijay Baral.', 'https://m.media-amazon.com/images/M/MV5BZDI3ZGY5YWQtMGYzYi00Y2M0LWFhMGUtY2M3ZTYzZDRkNTlhXkEyXkFqcGdeQXVyNzM4ODM5NTI@._V1_.jpg', '2024-03-01', 9.0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seenepoll`
--

CREATE TABLE `seenepoll` (
  `pollID` int(11) NOT NULL,
  `movieID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `user_rating` decimal(3,1) DEFAULT NULL,
  `user_review` text NOT NULL,
  `total_votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `userID` int(11) NOT NULL,
  `userName` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `favDish` varchar(15) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `hasVoted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`userID`, `userName`, `email`, `favDish`, `userPassword`, `hasVoted`) VALUES
(1, 'nikesh25', 'nikeshdhakal@gmail.com', 'Biryani', '$2y$10$zaRp5YPrzGJDZqycAjmUYu8VYGPLdhLm5fLeMCPlkRiKrLp9wEKE2', 0),
(5, 'mandiep', 'mandiep@gmail.com', 'korean', '$2y$10$qF1Tlxi.s4ZMv7jw44I5MeYbukH1AxQ0WuhwbHbOJ0geuxhGQmkDq', 0),
(6, 'hiten', 'hiten@gmail.com', 'chiya', '$2y$10$XaBUBKtmRdxVV4sbkOu2xua/YSiffrL4a8V1GvVmOZnU9tskfqbbG', 0),
(8, 'jagdish', 'jagadish660@gmail.com', 'momo', '$2y$10$FKa7jFf.3C.yNRz1D6ljluYRChH5xPfV/wBf8yxWSgtKfc00qobJi', 0),
(9, 'Ajay', 'ajaydas@gmail.com', 'keema noodles', '$2y$10$noo/WEphd9PhTEwf2JXB9eDFod8sM5DJCHh.2dfG/un9IY/zJHycG', 0),
(10, 'Dipesh', 'dipesh10@gmail.com', 'surya', '$2y$10$oyy5KuQtc2vCqUwltxBYx.nThjjeBoW/P9hLhtIA9AhAhq/tnus5u', 0),
(11, 'yugpurush dhaka', 'yubraajdhakal7@gmail.com', 'mutton', '$2y$10$Cr7Po2fRPDWze.n48Tf9ieCdNwunuKc8y.dSmsTN988eL54OqFEkG', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD UNIQUE KEY `userID` (`userID`,`movieID`),
  ADD KEY `movieID` (`movieID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieID`),
  ADD UNIQUE KEY `unique_title` (`title`);

--
-- Indexes for table `seenepoll`
--
ALTER TABLE `seenepoll`
  ADD PRIMARY KEY (`pollID`),
  ADD UNIQUE KEY `unique_rating_per_user` (`movieID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `seenepoll`
--
ALTER TABLE `seenepoll`
  MODIFY `pollID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userdata` (`userID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`);

--
-- Constraints for table `seenepoll`
--
ALTER TABLE `seenepoll`
  ADD CONSTRAINT `seenepoll_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `seenepoll_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `userdata` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

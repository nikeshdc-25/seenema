-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2024 at 04:52 AM
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
  `movieID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `movieID`, `userID`, `comment`, `comment_date`) VALUES
(13, 2, 1, 'Best movie everrrr!!!!!!!!!!!', '2024-06-24 15:37:08'),
(16, 1, 2, 'K cha nikesh??', '2024-06-24 16:03:49'),
(20, 1, 1, 'estai cha life, clz ko project, extra classes, exams, etc... Tero k cha?', '2024-06-24 21:25:24'),
(21, 1, 2, 'Ehh hora, lala pragati gares!', '2024-06-25 07:48:19'),
(23, 1, 8, 'great movie', '2024-06-25 07:51:29'),
(26, 34, 1, 'The Godfather 2 is a brilliant movie. From Vito\'s backstory to Michael\'s present day problems, this movie has so much to offer and it was one I definitely couldn\'t refuse. I enjoyed the new characters presented such as Pentangeli and Hyman Roth. Of course, Al Pacino\'s acting was brilliant (still don\'t understand why he didn\'t win an Oscar for his performance) and De Niro didn\'t disappoint either as young Vito.', '2024-06-26 22:05:57'),
(33, 30, 1, 'Best movie hai, hernai parcha sabaile', '2024-06-28 13:02:42'),
(65, 69, 1, '****', '2024-07-10 18:57:53'),
(72, 36, 1, 'make another', '2024-07-10 19:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favoriteID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favoriteID`, `userID`, `movieID`) VALUES
(120, 1, 1),
(118, 1, 2),
(135, 1, 3),
(139, 1, 4),
(137, 1, 5),
(131, 2, 1),
(130, 2, 2),
(126, 2, 3),
(142, 2, 4),
(144, 2, 26),
(143, 2, 28),
(128, 2, 60),
(127, 2, 62);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `actor` varchar(30) NOT NULL,
  `actor2` varchar(20) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `genre2` varchar(20) NOT NULL,
  `minute` int(11) NOT NULL,
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

INSERT INTO `movies` (`movieID`, `title`, `director`, `actor`, `actor2`, `genre`, `genre2`, `minute`, `country`, `description`, `poster`, `release_date`, `rating`, `imdbVotes`) VALUES
(1, 'Shawshank Redemption', 'Frank Darabont', 'Tim Robbins', 'Morgan Freeman', 'Thriller', 'Crime', 142, 'America', 'Andy Dufresne, a successful banker, is arrested for the murders of his wife and her lover, and is sentenced to life imprisonment at the Shawshank prison. He becomes the most unconventional prisoner.', 'https://i5.walmartimages.com/seo/The-Shawshank-Redemption-DVD-Castle-Rock-Drama_e71b2ff8-1060-47df-b836-98608ca60a0a.2d720e36a9bcf80b3039a41a49f4194e.jpeg', '1994-10-14', 9.3, 2907056),
(2, 'Harry Potter and the Philosopher\'s Stone', 'Chris Columbus', 'Daniel Radcliffe', '', 'Fantasy', '', 152, 'America', 'Harry Potter, an eleven-year-old orphan, discovers that he is a wizard and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him', 'https://images.moviesanywhere.com/143cdb987186a1c8f94d4f18de211216/fdea56fa-2703-47c1-8da8-70fc5382e1ea.jpg', '2001-11-16', 7.6, 861602),
(3, 'Jatra', 'Pradip Bhattarai', 'Bipin Karki', '', 'Comedy', '', 120, 'Nepal', 'After finding a bag of money, an impoverished man divides it with two of his friends to keep it safe.\r\n', 'https://m.media-amazon.com/images/M/MV5BMTAyNWJkZWItZDY3Yi00NTg5LTk1YzUtNmExMTk0MTYwODQyXkEyXkFqcGdeQXVyNjc5Mjg4Nzc@._V1_.jpg', '2016-11-11', 8.1, 310),
(4, 'Hami Tin Bhai', 'Shiva Regmi', 'Rajesh Hamal', '', 'Action', '', 135, 'Nepal', 'Hami Tin Bhai, a 2004 Nepali action, comedy film directed by Shiva Regmi, is the film featuring three of biggest superstars of the late 1990s and 2000s era- Rajesh Hamal, Shree Krishna Shrestha and Nikhil Upreti in the lead roles supported by Rekha Thapa, Jharana Thapa, Nandita KC, Keshab Bhattrai, Sushila Rayamajhi, Ravi Giri etc.', 'https://m.media-amazon.com/images/M/MV5BZWU5Mjc3M2EtMzdjNS00NWFlLTg3OWUtYTQ1ZDg3NjFhYTI4XkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_FMjpg_UX1000_.jpg', '2004-10-13', 8.8, 510),
(5, 'Hostel', ' Hem Raj BC', 'Anmol KC', '', 'Drama', '', 120, 'Nepal', 'The film is about the struggling life of teenagers in hostel. It features love, betrayal, friendship,emotions, family ties and so on.', 'https://res.cloudinary.com/digddaiwf/images/w_720,h_960,c_scale/v1701554039/Hostel-Nepali-Movie-Poster-Nepal-FM/Hostel-Nepali-Movie-Poster-Nepal-FM.jpg?_i=AA', '2013-06-13', 6.2, 61),
(6, 'Jhola', 'Yadav Kumar Bhattarai', 'Garima Panta', '', 'Drama', '', 90, 'Nepal', 'Jhola is a 2013 Nepali film based on a story by writer Krishna Dharabasi. It is about Sati culture that was prevalent in the Nepalese society until the 1920s in which wife had to immolate herself upon her husband\'s death, typically on his funeral pyre.', 'https://m.media-amazon.com/images/M/MV5BNzFiNjAzYTEtNmVlYy00ZDU2LWJmYTUtNGQwZDZhMWQwNTlkXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2013-12-07', 7.7, 723),
(15, 'Scarface', 'Brian De Palma', 'Al Pacino', '', 'Action', '', 170, 'America', 'Tony Montana and his close friend Manny, build a strong drug empire in Miami. However as his power begins to grow, so does his ego and his enemies, and his own paranoia begins to plague his empire.', 'https://musicart.xboxlive.com/7/fa205100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080', '1983-12-09', 8.3, 923081),
(16, 'Agastya: Chapter 1', 'Nimesh Shrestha', '', '', 'Action', '', 150, '', 'Agyasta: Chapter 1 is a 2024 Nepali action thriller film directed by Saurav Chaudhary under the banner of Dark Horse Entertainment and Seven Seas Entertainment. Released on 1 March 2024, the film stars Saugat Malla, Najir Husen, Nischal Basnet, Pramod Agrahari, Malika Mahat, and Bijay Baral.', 'https://m.media-amazon.com/images/M/MV5BNDc2ZDQ1ZTItOTFiMS00YmQ4LWJiMTAtMTI0NTA2ZWE2NTI1XkEyXkFqcGdeQXVyMTY3ODkyNDkz._V1_.jpg', '2024-03-01', 9.0, 78),
(17, 'Loot', 'Nischal Basnet', 'Saugat Malla', '', 'Thriller', '', 135, 'Nepal', 'Loot is a 2012 Nepali crime thriller film that was directed and written by Nischal Basnet as his debut. The film was produced by Madhav Wagle and Narendra Maharjan with Princess Movies and Black Horse Pictures.', 'https://m.media-amazon.com/images/M/MV5BYzI0NTJiZTAtMDM2Ny00ZDZmLWJhYzQtMDUzMThkZTI1MDFjXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2013-01-13', 8.1, 984),
(18, 'Loot 2', 'Nischal Basnet', 'Saugat Malla', '', 'Crime', '', 138, 'Nepal', 'Four gang members escape from prison and plot revenge against a former colleague, the man who framed them for bank robbery.', 'https://m.media-amazon.com/images/M/MV5BMDU3YjhjNDQtZjYzZS00NGI5LTk1NmUtZmMxZTU5YzUyY2RiXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2017-02-24', 6.0, 230),
(19, 'Jatrai Jatra', 'Pradip Bhattarai', 'Bipin Karki', '', 'Comedy', '', 125, 'Nepal', 'Jatrai Jatra is a 2019 Nepalese comedy thriller film, directed by Pradip Bhattarai and written by Rhythm Paudel. Rhythm Paudel has played a huge role developing this film. The film is produced by Pawan Shrestha, Rhythm Paudel, Nigin Pun and Sudin Bikram Thapa under the banner of Shatkon Arts.', 'https://m.media-amazon.com/images/M/MV5BYWQ2Y2ZiMDktZTQzOC00NTVlLThlMDMtOTk2YTQ4NjQ5MmVlXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2019-05-17', 7.2, 178),
(20, 'Kabaddi', 'Ram Babu Gurung', 'Dayahang Rai', '', 'Romance', '', 130, 'Nepal', 'Kabaddi is a 2014 Nepali romantic drama film written and directed by Ram Babu Gurung. It portrays the story of a love triangle among three central characters. The film was produced by Raunak Bikram Kandel, Nischal Basnet and Sunil Rauniyar and starred Nischal Basnet, Dayahang Rai, Rishma Gurung and Rajan Khatiwada.', 'https://m.media-amazon.com/images/M/MV5BZDUyMzg0OTAtMzVjZC00MGJkLTk4NjQtMjdkOTdhYTE4N2YwXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2014-04-25', 8.2, 674),
(21, 'Kagbeni', 'Bhusan Dahal', 'Saugat Malla', '', 'Horror', '', 110, 'Nepal', 'Kagbeni is a 2008 Nepali movie, loosely based on W. W. Jacobs\'s 1902 horror short story The Monkey\'s Paw. Kagbeni is the directorial debut of Bhusan Dahal. The name of the movie is taken from a tourist place Kagbeni in the valley of the Kali Gandaki, which is a two-hour trek from Muktinath.', 'https://upload.wikimedia.org/wikipedia/en/d/dd/Kagbeni_%282008_film_poster%29.jpg', '2008-01-11', 7.4, 563),
(22, 'Jaari', 'Upendra Subba', 'Dayahang Rai', '', 'Drama', '', 140, 'Nepal', 'Jaari is a 2023 Nepali film written and directed by Upendra Subba under the banner of Baasuri Films. It is produced by Ram Babu Gurung. Released on April 14, 2023, the film stars Dayahang Rai, Miruna Magar, Prem Subba, Bijay Baral, Roydeep Shrestha, and Rekha Limbu.', 'https://m.media-amazon.com/images/M/MV5BNzVkMGQ0MDAtYzFmZS00YTBkLTliZWEtMzU5YTYzY2ZkZTAwXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2023-04-14', 8.5, 325),
(23, 'Bir Bikram', 'Milan Chams', 'Dayahang Rai', '', 'Comedy', '', 140, 'Nepal', 'Bir Bikram is a 2016 romantic comedy film directed by Milan Chams. This movie features Nepalese actors Dayahang Rai, Anoop Bikram Shahi, Deeya Pun, Arpan Thapa, Menuka Pun and Najir Hussain in the lead roles.', 'https://m.media-amazon.com/images/M/MV5BOGZjOTdjYjgtYTU2OS00NzQ4LThjNjItY2E5MWU5MzBlNGE0XkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_FMjpg_UX1000_.jpg', '2016-08-19', 5.9, 65),
(24, '3 Idiots', 'Rajkumar Hirani', 'Aamir Khan', '', 'Comedy', '', 170, 'India', 'In college, Farhan and Raju form a great bond with Rancho due to his refreshing outlook. Years later, a bet gives them a chance to look for their long-lost friend whose existence seems rather elusive.', 'https://musicart.xboxlive.com/7/ab3c6200-0000-0000-0000-000000000002/504/image.jpg', '2009-12-25', 8.4, 437914),
(25, 'Dangal', 'Nitesh Tiwari', 'Aamir Khan', '', 'Biography', '', 161, 'India', 'Mahavir Singh Phogat, a former wrestler, decides to fulfil his dream of winning a gold medal for his country by training his daughters for the Commonwealth Games despite the existing social stigmas.', 'https://m.media-amazon.com/images/M/MV5BZDE4YzA3MGMtNmQ1ZS00NTkzLWFkYjQtMGQ2NDlhYTU4NjgxXkEyXkFqcGdeQXVyNDI3NjU1NzQ@._V1_.jpg', '2016-12-23', 8.4, 212788),
(26, 'Baahubali: The Beginning', 'S.S. Rajamouli', 'Prabhas', '', 'Action', '', 159, 'India', 'In the kingdom of Mahishmati, Shivudu falls in love with a young warrior woman. While trying to woo her, he learns about the conflict-ridden past of his family and his true legacy.', 'https://m.media-amazon.com/images/M/MV5BYWVlMjVhZWYtNWViNC00ODFkLTk1MmItYjU1MDY5ZDdhMTU3XkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg', '2015-07-10', 7.9, 137895),
(27, 'Gully Boy', 'Zoya Akhtar', 'Ranveer Singh', '', 'Drama', '', 153, 'India', 'Murad, an underdog, struggles to convey his views on social issues and life in Dharavi through rapping. His life changes drastically when he meets a local rapper, Shrikant alias MC Sher.', 'https://m.media-amazon.com/images/M/MV5BZDkzMTQ1YTMtMWY4Ny00MzExLTkzYzEtNzZhOTczNzU2NTU1XkEyXkFqcGdeQXVyODY3NjMyMDU@._V1_FMjpg_UX1000_.jpg', '2019-02-14', 7.9, 44002),
(28, 'Drishyam', 'Nishikant Kamat', 'Ajay Devgn', '', 'Thriller', '', 163, 'India', 'When the disappearance of a policewoman\'s son threatens to ruin Vijay\'s family, he leaves no stone unturned in order to shield his family.', 'https://static.moviecrow.com/marquee/drishyam-new-poster/67289_thumb_665.jpg', '2015-07-31', 8.2, 95586),
(29, 'Lukamari', 'Shree Ram Dahal', 'Saugat Malla', '', 'Drama', '', 120, 'Nepal', 'Lukamari is 2016 crime action film written and directed by Shree Ram Dahal. The film stars Saugat Malla, Karma Shakya, Bikram Singh Tharu, Surabina Karki, and Rista Basnet in lead roles. The film is slightly based on Khyati Shrestha murder case of 2009', 'https://m.media-amazon.com/images/M/MV5BZTIyOTQ3NGYtMWZhYi00NTFjLWIxOGEtZThlMmQzYWZkMWJkXkEyXkFqcGdeQXVyNjU4MjE5OTM@._V1_.jpg', '2016-07-10', 6.8, 106),
(30, 'The Dark Knight', 'Christopher Nolan', 'Christian Bale', '', 'Action', '', 152, 'America', 'Batman has a new foe, the Joker, who is an accomplished criminal hell-bent on decimating Gotham City. Together with Gordon and Harvey Dent, Batman struggles to thwart the Joker before it is too late.', 'https://www.legendary.com/wp-content/uploads/2015/04/film_thedarkknight_featureimage_desktop_1600x9001-414x621.jpg', '2007-07-20', 9.0, 2890308),
(31, 'Pulp Fiction', 'Quentin Tarantino', 'John Travolta', '', 'Crime', '', 154, 'America', 'In the realm of underworld, a series of incidents intertwines the lives of two Los Angeles mobsters, a gangster\'s wife, a boxer and two small-time criminals.', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', '1994-10-14', 8.9, 2236224),
(32, 'Inception', 'Inception', 'Inception', '', 'Sci-Fi', '', 148, 'UK', 'Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife\'s murder and his only chance at redemption is to perform a nearly impossible task.', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p7825626_p_v8_ae.jpg', '2010-07-16', 8.8, 2567990),
(33, 'The Godfather', 'Francis Ford Coppola', 'Marlon Brando', '', 'Crime', 'Action', 175, 'USA', 'Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son, Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger.', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', '1972-03-24', 9.2, 2027179),
(34, 'The Godfather Part II', 'Francis Ford Coppola', 'Al Pacino', '', 'Crime', '', 202, 'America', 'Vito\'s popularity in the underworld is on the rise, while his son, Michael\'s career is swinging downwards. In order to redeem himself, Michael must fight his enemies, including his own brother.', 'https://m.media-amazon.com/images/I/41V2AB34KCL._AC_UF894,1000_QL80_.jpg', '1974-12-20', 9.0, 1372726),
(35, 'Schindler\'s List', 'Steven Spielberg', 'Liam Neeson', '', 'Biography', '', 195, 'America', 'Oscar Schindler, a successful and narcissistic German businessman, slowly starts worrying about the safety of his Jewish workforce after witnessing their persecution in Poland during World War II.', 'https://image.tmdb.org/t/p/original/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg', '1993-12-15', 9.0, 1460595),
(36, 'Fight Club', 'David Fincher', 'Brad Pitt', '', 'Drama', '', 139, 'Germany', 'Unhappy with his capitalistic lifestyle, a white-collared insomniac forms an underground fight club with Tyler, a careless soap salesman. Soon, their venture spirals down into something sinister.', 'https://images.justwatch.com/poster/180839658/s718/fight-club.jpg', '1999-10-15', 8.8, 2342257),
(37, 'Pashupati Prasad', 'Dipendra K. Khanal', 'Khagendra Lamichhane', '', 'Comedy', '', 130, 'Nepal', 'A man inherits his parents\' debts after they die in an earthquake. Determined to repay the debts, he travels to Kathmandu to find work.', 'https://m.media-amazon.com/images/M/MV5BNDFmOTlhNjMtZTdiMS00ZjAzLTg5ZjktYWE2MTZhNjllNjcwXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2016-01-29', 8.5, 1733),
(38, 'Chhakka Panja', 'Deepa Shree Niraula', 'Deepak Raj Giri', '', 'Comedy', '', 135, 'Nepal', 'Story of five friends Raja (Deepak Raj Giri), Saraswoti (Jeetu Nepal), Magne (Kedar Ghimire) and Buddhi (Buddhi Tamang). Raja is rich but illiterate and enjoys life and tells his friends to not get married or hold any job. However, he secretly has affairs with married women. Then one day Raja gets married to Champa (Priyanka Karki), and the story enters a serious mode.', 'https://m.media-amazon.com/images/M/MV5BZWFiZjA3OGYtZjE1Yy00YWY1LThmZTgtODQ1NzRiNzAzZDY1XkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_FMjpg_UX1000_.jpg', '2016-09-09', 6.4, 241),
(39, 'GAUN AAYEKO BATO', 'Nabin Subba', 'Dayahang Rai', '', 'Drama', '', 100, 'Nepal', 'A road constructed in a village brings development, opportunities but at some cost.', 'https://m.media-amazon.com/images/M/MV5BYjEyYmQxNjktODBmMC00NDIwLThjNDgtYjViNDY0Mjg2ZTBkXkEyXkFqcGdeQXVyMTU4MjY3NDM2._V1_FMjpg_UX1000_.jpg', '2024-06-21', 8.7, 63),
(40, 'Kabaddi Kabaddi', 'Ram Babu Gurung', 'Dayahang Rai', '', 'Comedy', '', 135, 'Nepal', 'Kaji dreams of marrying Maiya but things go wrong when Bamkaji returns to the village who also wants to marry Maiya.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BNzliYWZjMTQtM2FjZS00YmRiLWJkZWYtM2I2OTVlMGE3MDhmXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_FMjpg_UX1000_.jpg', '2015-11-27', 7.8, 521),
(41, 'Dreams', 'Bhuwan K.C.', 'Anmol K.C.', '', 'Romance', '', 120, 'Nepal', 'Aveer, in his childhood loses his father to an accident which he claims he had seen in a dream. A grown up Aveer sees a dream where his love, Kavya dies in a car accident and tries everything to let this dream not come true.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BYjBkNWFkOTItMGNlNy00MDA4LWIzYTUtYTNiYjU1ZTE4Y2QyXkEyXkFqcGdeQXVyNjc1MzY5NDU@._V1_.jpg', '2016-03-04', 5.1, 56),
(42, 'Resham Filili', 'Pranab Joshi', 'Shishir Bangde', '', 'Comedy', '', 120, 'Nepal', 'Resham Filili follows the friendship, dreams, hopes and deeds of Resham and Hariya - both whethered by bad luck and misfortunes, must at any cost beat the oddest odds to save their lives from Dorje\'s men.', 'https://m.media-amazon.com/images/M/MV5BOWM1OGJmZmItNjQ1OS00YmRjLThmYmUtNWJkYmQxZjBiYjg5XkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2015-04-24', 5.8, 115),
(43, 'Jerryy', ' Hem Raj BC', 'Anmol K.C.', '', 'Romance', '', 137, 'Nepal', 'The two youths, Xavier Rana and Akanchha fell in love in Mustang while going for a trip from Pokhara. Rana was a playboy until he meets Akanchha.\r\n\r\n', 'https://m.media-amazon.com/images/S/pv-target-images/1d8bcde5cea682b1f6a03b8da37dd2e2aa877f91dc16fb237fb6a0eaa644e0f7.jpg', '2014-11-14', 5.5, 84),
(44, 'Hostel Returns', 'Suraj Bhushal ', 'Sushil Shrestha, Najir Hussain', '', 'Drama', '', 132, 'Nepal', 'In a engineering college two best friends Rameshwor and Pratap start to fall in love with one girl but she choose to fake her love with Rameshwor to pass her engineering college exams.', 'https://m.media-amazon.com/images/M/MV5BNTg2YjE4MWItMDk2ZS00Mjc5LTllZDQtMzYzZWEyMzYxZGE2L2ltYWdlXkEyXkFqcGdeQXVyNzIzNTEyODk@._V1_.jpg', '2015-08-21', 6.5, 52),
(45, 'Gajalu', 'Hem Raj BC', 'Anmol K.C.', '', 'Drama', '', 135, 'Nepal', 'Living goddess Kumari becomes friends with six people who enjoy happy lives.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BOGU0NTY4NjUtNjE4ZS00MmZmLWI2MzEtNTc0ZTNmOTRkZTMzXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_FMjpg_UX1000_.jpg', '2016-06-10', 6.3, 35),
(46, 'Mahajatra', ' Pradeep Bhattarai', 'Bipin Karki', '', 'Comedy', '', 137, 'Nepal', 'Mahajatra unfolds the gripping tale of three men, bound by a tumultuous past, entrusted with the clandestine duty of concealing illicit funds. The film delves into the challenges, triumphs, and setbacks faced by these individuals as they navigate the complexities of safeguarding their entrusted task.', 'https://m.media-amazon.com/images/M/MV5BZGY0MTEzYjAtMzJkNS00OTFhLTg0YTctNzg0ZjMzNDNlM2I3XkEyXkFqcGdeQXVyNzYyMzc3Nzg@._V1_.jpg', '2024-03-22', 7.4, 80),
(47, 'Acharya', 'Prashant Rasaily', 'Satya Raj Acharya', '', 'Biography', '', 138, 'Nepal', 'A journey of a singer (Bhakta Raj Acharya) who grew up in extreme poverty without a father. his chances of achieving his dream of becoming a singer was slim to none, under the circumstances he was in. But, he overcame all the obstacles and became one of the greatest singers of Nepal, just finding his destiny waiting for him with a different plan. Because of a fast spreading tumor in his tongue, he had to choose between his tongue and his life. Bhakta\'s tragic musical journey is picked up by his two sons from the point where he left off.', 'https://ckcinemas.com/Modules/CineUploadFiles/Movie/image/WEBSITE%20POSTER%20CK%20CINEMAS%20AND%20ACHARYA_396580.jpg', '2024-06-21', 8.6, 83),
(48, 'Aama', 'Dipendra K. Khanal', 'Surakshya Panta', '', 'Drama', '', 135, 'Nepal', '\"Aama\" is a story behind three mothers struggling for love, support and emotions together.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BOWFiYTI1YjQtZmYxNi00MjIyLTgzMjAtOWNlMzMyMDhjOWYyXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2020-02-21', 8.1, 140),
(49, 'Gopi', 'Dipendra Lama', 'Bipin Karki', '', 'Drama', '', 130, 'Nepal', '‘Gopi’ is about a young and well-educated man named Gopi, who narrates the story of his hardship and struggle while pursuing his dream. Despite of regular pressure from his father to go to US, he runs a cow farm in Nepal and wants to be a successful entrepreneur. But he faces several obstacles in his milk-business. Fighting continuously with all the obstacles, he proves himself that, there is always an opportunity for everyone in the country.', 'https://m.media-amazon.com/images/M/MV5BMGU2ZWYwNGMtYmI2Zi00MTcwLTkxMDAtZjljZTcxMjczZDNiXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2019-02-01', 7.3, 44),
(50, 'Prasad', 'Dinesh Raut', 'Bipin Karki', '', 'Drama', '', 125, 'Nepal', 'Newly married couple face a lot of challenges when they find out they can\'t conceive.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BZjI4Y2ZjYjItODYwYi00NTI1LTljODEtMWRhNDgyODU5NmJhXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2018-12-07', 7.2, 133),
(51, 'Fulbari', 'Ram Babu Gurung', 'Bipin Karki', '', 'Drama', '', 140, 'Nepal', 'A family is challenged by a mothers health condition and the three grown sons are too busy with their own lives to truly be there for their mom and dad.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMjFiZmFjMTctMmEyMS00YzBkLWI1ODYtYjRmNzBmZDg4Y2VhXkEyXkFqcGdeQXVyMTU3MDMxMTMw._V1_.jpg', '2023-02-17', 7.1, 110),
(52, 'Ke Ghar Ke Dera', 'Dipendra K. Khanal', 'Bipin Karki', '', 'Drama', '', 142, 'Nepal', '\'\' Ke Ghar Ke Dera\'\' portrays the stories and struggle of those who have a place to call their own and those who do not in Kathmandu, in a comedic manner.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BNDM2NWEyOTYtMDJiYi00OGU3LThjNWYtZTY2NDMzYjEyN2VkXkEyXkFqcGdeQXVyNTU0NTA0MzE@._V1_FMjpg_UX1000_.jpg', '2022-10-22', 6.8, 31),
(53, 'Aina Jhyal Ko Putali', 'Sujit Bidari', 'Dinesh Khatri', '', 'Drama', '', 138, 'Nepal', 'As the studious Bidya(13) prepares for her further studies, her juvenile brother Basanta(9) distracts her with his antics. But learning, his sister is giving up on her dreams, he struggles to give Bidya the hope she desperately needs.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMzFkOGYyYjMtODdhNi00MGM1LTk0NzAtOWQ4MzI0Mzg1OTVhXkEyXkFqcGdeQXVyMTE1NTA1NDMw._V1_.jpg', '2022-11-14', 8.0, 193),
(54, 'Mahapurush', 'Pradip Bhattrai', 'Hari Bansha Acharya', '', 'Comedy', '', 135, 'Nepal', 'A society that swears by “I will show you your fathers wedding” this story is of two sons and a single father smitten in love and the struggles to get him wedded amidst the taboo.\r\n\r\n', 'https://assets.voxcinemas.com/posters/P_HO00009871.JPG', '2022-10-28', 8.8, 88),
(55, 'Boksi Ko Ghar', 'Rama Thapaliya', 'Keki Adhikari', '', 'Thriller', '', 132, 'Nepal', 'The plot follows a journalist investigating a village woman accused of witchcraft, attempting to uncover the truth behind the false accusations.\r\n\r\n', 'https://www.thefilmnepal.com/uploads/medias/boksiko-ghar.jpg', '2024-04-26', 8.2, 57),
(56, 'Jai Bhole', 'Ashok Sharma', 'Khagendra Lamichhane', '', 'Comedy', '', 128, 'Nepal', 'Friendship between two people and love.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BYjE0MDdmMmItZWE5NS00NDc5LWE2N2UtZDk2NzNkOWFiOTk5XkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2018-10-16', 7.2, 48),
(57, 'Kathaputali', 'Veemsen Lama', 'Karma Shakya', '', 'horror', '', 130, 'Nepal', 'Trapped in an abandoned royal palace, a young prince must confront the unsettling secrets of his family\'s past, escape evil forces and battle dark magic in order to survive.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BZjc3YjRiNDgtODdiNi00NTg4LTk3ZDktN2ZlZmE4YjhjMjIwXkEyXkFqcGdeQXVyNTk1MjM4Mzg@._V1_FMjpg_UX1000_.jpg', '2022-01-01', 6.6, 129),
(58, 'Prem Geet 3', 'Chhetan Gurung, Santosh Sen', 'Pradeep Khadka', '', 'Action', '', 138, 'Nepal', 'Prem, the younger prince of the Kingdom of Khazaag, born in an auspicious astrological time to be the future King goes through his biggest obstacle in life, Geet, his only love.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BZmE4MDk0ZWMtZmY1Yy00YTA3LTgzYjQtNjg1MzI1ODBmMGMxXkEyXkFqcGdeQXVyMTI2NjAyMTE5._V1_.jpg', '2022-09-23', 7.5, 2786),
(59, 'Dal Bhat Tarkari', 'Sudan K.C.', 'Hari Bansha Acharya', '', 'Comedy', '', 120, 'Nepal', 'American Dream of a middle class family.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMGIwNDhiNWMtOTQxMy00NGM3LTljYTEtNzY4MTY3ODUxMDU0XkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2019-04-26', 3.9, 50),
(60, 'Bulbul', 'Binod Paudel', 'Swastima Khadka', '', 'Drama', '', 110, 'Nepal', 'Bulbul is a story of Ranakala 26, who drives an auto rickshaw in streets of Kathmandu Valley . Her unfulfilled desires for love and loneliness lead her to be in an affair with Chopendra 29, a passenger who promises to marry her. Does Ranakala and Chopendra\'s dreams turn out into reality? Will they start a new life together? These secrets, twists, and turns in the story make \'Bulbul\' unique and engaging.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMzA0NjU0YTItMDM3Yi00ZWMzLTkzMjktNTY3NGQwZWFiZmFhXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_FMjpg_UX1000_.jpg', '2019-02-15', 6.0, 189),
(61, 'Romeo And Muna', 'Naresh Kumar Kc', 'Vinay Shrestha', '', 'Romance', '', 115, 'Nepal', 'When rich man Romeo meets poor girl from lower-class named Muna they started loving each other,with inspired by both Romeo and Juliet and Muna Madan books.\r\n\r\n', 'https://lh4.googleusercontent.com/proxy/Il5XJFtQDegXEpdEj60A33tRYkeEOXtAQXstV-dKherLFevi6-8J_hfJoB3GJ_hY7ciqPNH1wYj0zd3YKIcdofm9ZxTEoNIY9OvFhQcg1tKWclweS70', '2018-07-27', 8.2, 24),
(62, 'Selfie King', ' Bishal Sapkota', 'Bipin Karki', '', 'Comedy', '', 105, 'Nepal', 'A Nepali comedian\'s professional commitment and personal life takes turn during his journey to a far remote region of Nepal for a performance.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BNTM1ZDNlM2EtMjkxZS00OWEyLTk0MDUtOWVmOTk5N2VhZTc5XkEyXkFqcGdeQXVyMTA3NTIzODk0._V1_FMjpg_UX1000_.jpg', '2020-02-07', 7.1, 71),
(63, 'Dimag Kharab', 'Nischal Basnet', 'Khagendra Lamichhane', '', 'Drama', '', 130, 'Nepal', 'When bureaucratic barriers obstruct Indra Sharma\'s desire to work overseas, his dreams of a stable family life take a turbulent turn.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BN2YyNDkyNjctNThkZi00Zjg3LTk3YzAtMDQ1ODc4ZTc3ZDNlXkEyXkFqcGdeQXVyMTA1NjExNDk4._V1_FMjpg_UX1000_.jpg', '2023-11-10', 8.0, 125),
(64, 'Damaruko Dandibiyo', 'Chhetan Gurung', 'Khagendra Lamichhane', '', 'Drama', '', 125, 'Nepal', 'Damaru comes back to his village to revive Dandibiyo but struggles to convince his father.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BZDJlOGYyYjgtMmNlMC00MDM1LWJlY2QtZjY5YjA3YWJjMDkxXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2018-05-04', 8.3, 53),
(65, 'Prakash', 'Dinesh Raut', 'Pradeep Khadka', '', 'Drama', '', 140, 'Nepal', 'An educated young boy from remote Nepal who dreams of becoming a teacher in a government school, the story of his struggle to fulfill his dream amidst economic hardships.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BZGRhMzM4ZGEtNGRiZS00MGI1LWJjN2UtNzU0ZTdjZDk1YWIyXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_FMjpg_UX1000_.jpg', '2022-08-26', 8.7, 590),
(66, 'Pujar Sarki', ' Dinesh Raut', 'Pradeep Khadka', '', 'Drama', '', 135, 'Nepal', 'Three individuals unite against societal norms perpetuating caste discrimination, facing challenges in their collective struggle to defy the existing caste-based social order.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BZDdiNDEyMDQtNjFiZi00NmJmLTg0NDAtMzI5MzZkZTBiYTlkXkEyXkFqcGdeQXVyMTM0Mzg0NzYy._V1_.jpg', '2024-05-23', 8.4, 118),
(67, 'Farki Farki', 'Suyog Gurung', 'Anmol K.C.', '', 'Romance', '', 110, 'Nepal', 'Based on a time \'infinite time loop\' theory, a light hearted romantic comedy that showcases various aspects of our lives.\r\n\r\n', 'https://harkinsposters.imgix.net/HO00012526_poster?q=80&auto=format,compress&w=456', '2024-05-23', 7.0, 24),
(68, 'Jackie I Am 21', 'Renasha Bantawa Rai', 'Dhiraj Magar', '', 'Drama', '', 100, 'Nepal', 'After being disqualified twice from being selected for the army, Jackie a young dancer sets out to pursue his dream against his father\'s will before time runs out.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMDY4OTkxNzAtMmFjMy00MTUzLWI1NmEtYTViMDlhNGY2M2MyXkEyXkFqcGdeQXVyMTM0Mzg0NzYy._V1_.jpg', '2023-05-04', 9.7, 6),
(69, 'Captain', 'Diwakar Bhattarai', 'Anmol K.C.', '', 'Drama', '', 95, 'Nepal', 'Father\'s dedication to guiding his son to becoming a better footballer.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMGIyNTRhNWEtMjQxMi00YjA4LWEzODMtNmE4Nzc4YjVmYWQxXkEyXkFqcGdeQXVyOTcyMjQwNDI@._V1_.jpg', '2019-03-01', 1.9, 106),
(70, 'Chhadke', 'Nigam Shrestha', 'Bipin Karki', '', 'Action', '', 120, 'Nepal', 'The film tells the story of three childhood friends. The trio all had dreams to fulfill \'when they grew up\', but time and destiny seem to have other plans for them.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMjc2MzA5MDktOTBkOC00NjAwLWFjZmMtN2IxMGFlNzI5NDVmXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2013-02-22', 6.3, 117),
(71, 'Mr. Jholay', 'Ram Babu Gurung', 'Dayahang Rai', '', 'Comedy', '', 115, 'Nepal', 'A unknower (Dayahang Rai) acounters a lot of unknown stuff to him than he starts visit them with his friends while in the journey he starts to began a relationship.\r\n\r\n', 'https://m.media-amazon.com/images/M/MV5BMWYxMmNmMjMtZGRkNi00YmJlLTlhODItOWEwOWNlYzJkMDRiXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2018-01-12', 7.5, 85),
(72, 'The Social Network', 'David Fincher', 'Jesse Eisenberg', 'Andrew Garfield', 'Biography', 'Drama', 120, 'America', 'As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea, and by the co-founder who was later squeezed out of the business.', 'https://miro.medium.com/v2/resize:fit:712/1*stgfTdpOB56JoRePBapJCA.jpeg', '2010-10-01', 7.8, 765469),
(76, 'Shutter Island', 'Martin Scorsese', 'Leonardo DiCaprio', 'Emily Mortimer', 'Mystery', 'Thriller', 138, 'USA', 'In 1954, a U.S. Marshal investigates the disappearance of a murderer who escaped from a hospital for the criminally insane.', 'https://i.pinimg.com/736x/ce/fa/19/cefa1998c89d4776b2a0c36f9c80c4a2.jpg', '2010-02-19', 8.2, 1475419),
(77, 'Black Swan', 'Darren Aronofsky', 'Natalie Portman', 'Mila Kunis', 'Drama', 'Thriller', 108, 'USA', 'A committed dancer struggles to maintain her sanity after winning the lead role in a production of Tchaikovsky\'s \"Swan Lake\".', 'https://m.media-amazon.com/images/M/MV5BNzY2NzI4OTE5MF5BMl5BanBnXkFtZTcwMjMyNDY4Mw@@._V1_.jpg', '2010-12-17', 8.0, 700000),
(78, 'The King\'s Speech', 'Tom Hooper', 'Colin Firth', 'Geoffrey Rush', 'Biography', 'Drama', 118, 'UK', 'The story of King George VI, his impromptu ascension to the throne of the British Empire in 1936, and the speech therapist who helped the unsure monarch overcome his stammer.', 'https://m.media-amazon.com/images/S/pv-target-images/5d198d58f2db33ee1814ce7509647ff1332e63cf3f8e24fb330dd0592ae37791.jpg', '2010-12-25', 8.0, 600000),
(79, 'Harry Potter and the Deathly Hallows: Part 1', 'David Yates', 'Daniel Radcliffe', 'Emma Watson', 'Adventure', 'Fantasy', 146, 'UK', 'As Harry, Ron and Hermione race against time and evil to destroy the Horcruxes, they uncover the existence of the three most powerful objects in the wizarding world: the Deathly Hallows.', 'https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_.jpg', '2010-11-19', 7.7, 500000),
(80, 'How to Train Your Dragon', 'Dean DeBlois, Chris Sanders', 'Jay Baruchel', 'Gerard Butler', 'Animation', 'Adventure', 98, 'USA', 'A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.', 'https://m.media-amazon.com/images/M/MV5BMjIwMDIwNjAyOF5BMl5BanBnXkFtZTgwNDE1MDc2NTM@._V1_.jpg', '2010-03-26', 8.1, 700000),
(81, 'True Grit', 'Ethan Coen, Joel Coen', 'Jeff Bridges', 'Matt Damon', 'Drama', 'Western', 110, 'USA', 'A stubborn teenager enlists the help of a tough U.S. Marshal to track down her father\'s murderer.', 'https://m.media-amazon.com/images/M/MV5BMTU5MjU3MTI4OF5BMl5BanBnXkFtZTcwMTQxOTAxNA@@._V1_FMjpg_UX1000_.jpg', '2010-12-22', 7.6, 300000),
(82, 'The Fighter', 'David O. Russell', 'Mark Wahlberg', 'Christian Bale', 'Biography', 'Drama', 116, 'USA', 'A look at the early years of boxer Micky Ward and his brother who helped train him before going pro in the mid-1980s.', 'https://m.media-amazon.com/images/M/MV5BMTM0ODk3MjM1MV5BMl5BanBnXkFtZTcwNzc1MDIwNA@@._V1_.jpg', '2010-12-17', 7.8, 300000),
(83, '127 Hours', 'Danny Boyle', 'James Franco', 'Amber Tamblyn', 'Biography', 'Drama', 94, 'USA', 'A mountain climber becomes trapped under a boulder while canyoneering alone near Moab, Utah and resorts to desperate measures in order to survive.', 'https://m.media-amazon.com/images/M/MV5BMTc2NjMzOTE3Ml5BMl5BanBnXkFtZTcwMDE0OTc5Mw@@._V1_.jpg', '2010-11-05', 7.6, 300000),
(84, 'The Town', 'Ben Affleck', 'Ben Affleck', 'Rebecca Hall', 'Crime', 'Drama', 125, 'USA', 'A proficient group of thieves rob a bank and hold Claire, the assistant manager, hostage. Things begin to get complicated when one of the crew members falls in love with Claire.', 'https://m.media-amazon.com/images/M/MV5BZDNhMGY0M2EtYjViMS00NWQ1LWIxYjgtNDFjNzZiN2E2ODU4XkEyXkFqcGdeQXVyMjExMjk0ODk@._V1_FMjpg_UX1000_.jpg', '2010-09-17', 7.5, 400000),
(85, 'Tangled', 'Nathan Greno, Byron Howard', 'Mandy Moore', 'Zachary Levi', 'Animation', 'Comedy', 100, 'USA', 'The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.', 'https://m.media-amazon.com/images/I/91iZfoZkGXL._AC_UF894,1000_QL80_.jpg', '2010-11-24', 7.7, 400000),
(86, 'Mad Max: Fury Road', 'George Miller', 'Tom Hardy', 'Charlize Theron', 'Action', 'Adventure', 120, 'Australia', 'In a post-apocalyptic wasteland, Max teams up with a group of rebels to overthrow a tyrannical leader.', 'https://m.media-amazon.com/images/M/MV5BN2EwM2I5OWMtMGQyMi00Zjg1LWJkNTctZTdjYTA4OGUwZjMyXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg', '2015-05-15', 8.1, 600000),
(87, 'The Revenant', 'Alejandro G. Iñárritu', 'Leonardo DiCaprio', 'Tom Hardy', 'Action', 'Drama', 156, 'USA', 'A frontiersman on a quest for survival seeks revenge against those who left him for dead.', 'https://m.media-amazon.com/images/M/MV5BMDE5OWMzM2QtOTU2ZS00NzAyLWI2MDEtOTRlYjIxZGM0OWRjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg', '2015-12-25', 8.0, 450000),
(88, 'Inside Out', 'Pete Docter', 'Amy Poehler', 'Phyllis Smith', 'Animation', 'Adventure', 95, 'USA', 'The emotions of a young girl are personified as characters trying to navigate her life during a major move.', 'https://m.media-amazon.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_.jpg', '2015-06-19', 8.1, 200000),
(89, 'Jurassic World', 'Colin Trevorrow', 'Chris Pratt', 'Bryce Dallas Howard', 'Action', 'Adventure', 124, 'USA', 'A new dinosaur theme park opens with genetically modified dinosaurs, leading to chaos when things go wrong.', 'https://m.media-amazon.com/images/M/MV5BNzIxMjYwNDEwN15BMl5BanBnXkFtZTgwMzk5MDI3NTM@._V1_FMjpg_UX1000_.jpg', '2015-06-12', 7.0, 450000),
(90, 'Spectre', 'Sam Mendes', 'Daniel Craig', 'Christoph Waltz', 'Action', 'Adventure', 148, 'UK', 'James Bond uncovers a sinister organization while facing the man behind the organization.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKBEgYFGK6vpCqEOv5AiYVLweeuAd8loexLg&s', '2015-11-06', 6.8, 300000),
(91, 'The Martian', 'Ridley Scott', 'Matt Damon', 'Jessica Chastain', 'Adventure', 'Sci-Fi', 144, 'USA', 'An astronaut stranded on Mars must rely on his ingenuity to survive while awaiting rescue.', 'https://m.media-amazon.com/images/M/MV5BMTc2MTQ3MDA1Nl5BMl5BanBnXkFtZTgwODA3OTI4NjE@._V1_.jpg', '2015-10-02', 8.0, 500000),
(92, 'The Big Short', 'Adam McKay', 'Christian Bale', 'Steve Carell', 'Biography', 'Drama', 130, 'USA', 'The story of the 2008 financial crisis through the eyes of those who saw it coming and bet against the market.', 'https://m.media-amazon.com/images/M/MV5BNDc4MThhN2EtZjMzNC00ZDJmLThiZTgtNThlY2UxZWMzNjdkXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg', '2015-12-23', 7.8, 150000),
(93, 'Star Wars: The Force Awakens', 'J.J. Abrams', 'Daisy Ridley', 'John Boyega', 'Action', 'Adventure', 138, 'USA', 'A new heroine emerges as the Resistance battles the dark forces of the First Order.', 'https://m.media-amazon.com/images/I/91xZGOnCFSL._AC_UF1000,1000_QL80_.jpg', '2015-12-18', 7.8, 800000),
(94, 'Bridge of Spies', 'Steven Spielberg', 'Tom Hanks', 'Mark Rylance', 'Biography', 'Drama', 142, 'USA', 'The story of a lawyer who negotiates the exchange of spies during the Cold War.', 'https://m.media-amazon.com/images/M/MV5BMjIxOTI0MjU5NV5BMl5BanBnXkFtZTgwNzM4OTk4NTE@._V1_.jpg', '2015-10-16', 7.6, 100000),
(95, 'Straight Outta Compton', 'F. Gary Gray', 'O\'Shea Jackson Jr.', 'Corey Hawkins', 'Biography', 'Drama', 147, 'USA', 'The rise and fall of the groundbreaking rap group N.W.A.', 'https://m.media-amazon.com/images/M/MV5BMTA5MzkyMzIxNjJeQTJeQWpwZ15BbWU4MDU0MDk0OTUx._V1_FMjpg_UX1000_.jpg', '2015-08-14', 7.8, 200000),
(96, 'The Hateful Eight', 'Quentin Tarantino', 'Samuel L. Jackson', 'Kurt Russell', 'Crime', 'Drama', 187, 'USA', 'In post-Civil War Wyoming, a bounty hunter and his prisoner find themselves in a deadly standoff.', 'https://m.media-amazon.com/images/M/MV5BMjA1MTc1NTg5NV5BMl5BanBnXkFtZTgwOTM2MDEzNzE@._V1_.jpg', '2015-12-25', 7.8, 150000),
(97, 'Room', 'Lenny Abrahamson', 'Brie Larson', 'Jacob Tremblay', 'Drama', 'Thriller', 118, 'Canada', 'A young boy and his mother, who have been held captive in a room for years, plan their escape.', 'https://i.pinimg.com/originals/a4/14/6e/a4146eb068cbe850ac23d3ba36cba452.png', '2015-10-23', 8.1, 100000),
(98, 'The Danish Girl', 'Tom Hooper', 'Eddie Redmayne', 'Alicia Vikander', 'Biography', 'Drama', 120, 'UK', 'The story of Lili Elbe, one of the first known recipients of gender confirmation surgery.', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p11822719_p_v8_al.jpg', '2015-11-27', 7.1, 70000),
(99, 'The Jungle Book', 'Jon Favreau', 'Neel Sethi', 'Bill Murray', 'Adventure', 'Fantasy', 106, 'USA', 'A young boy raised by wolves in the jungle must return to human civilization.', 'https://m.media-amazon.com/images/M/MV5BMTc3NTUzNTI4MV5BMl5BanBnXkFtZTgwNjU0NjU5NzE@._V1_FMjpg_UX1000_.jpg', '2016-04-15', 7.4, 100000),
(100, 'Goosebumps', 'Rob Letterman', 'Jack Black', 'Dylan Minnette', 'Adventure', 'Comedy', 103, 'USA', 'A teenager teams up with the daughter of the horror author R.L. Stine after the writer\'s creations come to life.', 'https://m.media-amazon.com/images/M/MV5BMjA1OTUzNTQ5Ml5BMl5BanBnXkFtZTgwODQ4NDkxNjE@._V1_.jpg', '2015-10-16', 6.3, 50000),
(101, 'Steve Jobs', 'Danny Boyle', 'Michael Fassbender', 'Kate Winslet', 'Biography', 'Drama', 122, 'USA', 'The life of Apple Inc. co-founder Steve Jobs is portrayed through three key product launches.', 'https://m.media-amazon.com/images/S/pv-target-images/7e18d4cb0d70e430bd895eb969a01c53e7bdf8b41e4467e97b03f8f2df2c3522.jpg', '2015-10-23', 7.2, 75000),
(102, 'The Walk', 'Robert Zemeckis', 'Joseph Gordon-Levitt', 'Charlotte Le Bon', 'Biography', 'Drama', 123, 'USA', 'The true story of Philippe Petit\'s high-wire walk between the Twin Towers in 1974.', 'https://m.media-amazon.com/images/I/91CZEi2kmRL._AC_UF894,1000_QL80_.jpg', '2015-09-30', 7.3, 40000),
(103, 'Creed', 'Ryan Coogler', 'Michael B. Jordan', 'Sylvester Stallone', 'Drama', 'Sport', 133, 'USA', 'Adonis Johnson, the son of Apollo Creed, seeks out Rocky Balboa to train him for boxing.', 'https://m.media-amazon.com/images/M/MV5BNmZkYjQzY2QtNjdkNC00YjkzLTk5NjUtY2MyNDNiYTBhN2M2XkEyXkFqcGdeQXVyMjMwNDgzNjc@._V1_.jpg', '2015-11-25', 7.6, 85000),
(104, 'The Gift', 'Joel Edgerton', 'Jason Bateman', 'Rebecca Hall', 'Drama', 'Thriller', 108, 'USA', 'A married couple\'s life is turned upside down when an acquaintance from the husband\'s past starts making unwanted visits.', 'https://m.media-amazon.com/images/M/MV5BNGFmY2UyMmYtNDY1Yi00NTIwLTk1ZDktOGM2OTQwZDk0NjU5XkEyXkFqcGdeQXVyMjQwMjk0NjI@._V1_.jpg', '2015-08-07', 7.0, 50000),
(105, 'Burnt', 'John Wells', 'Bradley Cooper', 'Sienna Miller', 'Drama', 'Comedy', 101, 'USA', 'A chef with a complicated past works to redeem himself in the high-stakes culinary world.', 'https://m.media-amazon.com/images/M/MV5BNjEzNTk2OTEwNF5BMl5BanBnXkFtZTgwNzExMTg0NjE@._V1_FMjpg_UX1000_.jpg', '2015-10-23', 6.7, 30000),
(106, 'The Witch', 'Robert Eggers', 'Anya Taylor-Joy', 'Ralph Ineson', 'Drama', 'Horror', 92, 'USA', 'A Puritan family in 1630s New England encounters forces of evil in the woods beyond their farm.', 'https://preview.redd.it/the-witch-2015-3400x5000-by-me-v0-dfmaog8ujldb1.jpg?width=1080&crop=smart&auto=webp&s=54539ba532b8dcc1b12741aa1023ae130a127c33', '2015-02-19', 6.9, 60000),
(107, 'Sambodhan', 'Tulsi Ghimire', 'Rajesh Hamal', 'Jharana Thapa', 'Drama', 'Romance', 130, 'Nepal', 'A powerful drama highlighting the struggles of an aspiring individual.', 'https://m.media-amazon.com/images/M/MV5BZWM1NzkxYTAtNjAzMC00M2JiLTlmMmQtNjQwZDBjZWQyOTU4XkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_FMjpg_UX1000_.jpg', '1995-01-01', 8.0, 7000),
(112, 'Kalo Pothi', 'Min Bahadur Bham', 'Chetan Gurung', 'Khagendra Lamichhane', 'Drama', 'Adventure', 90, 'Nepal', 'A touching story about two boys who embark on a journey to find a black hen.', 'https://m.media-amazon.com/images/M/MV5BOGQ2ZjRhM2QtMjAzMC00NzhhLThhODYtNTcwYjM3MWVjNzBmXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg', '2015-11-15', 7.8, 6000),
(113, 'Sano Sansar', 'Alok Nembang', 'Anmol K.C.', 'Swastima Khadka', 'Drama', 'Romance', 120, 'Nepal', 'A romantic drama exploring the complexities of modern relationships.', 'https://filmsofnepal.com/wp-content/uploads/2013/02/Sano-Sansar-poster-4.jpg', '2008-11-11', 7.5, 5000),
(114, 'Gai Jatra', 'Prakash Subedi', 'Deepak Raj Giri', 'Jeetu Nepal', 'Comedy', 'Drama', 115, 'Nepal', 'A satirical comedy about societal issues and the traditional Gai Jatra festival.', 'https://m.media-amazon.com/images/M/MV5BMzE4YmNiNjQtNzgwZS00MDgxLWIzNjktNWRiZmRlMTY2ZWNiXkEyXkFqcGdeQXVyMjIxMTg1OTQ@._V1_.jpg', '2016-08-19', 7.9, 7000),
(115, 'Bato Muni Ko Phool', 'Deepak Raj Giri', 'Deepak Raj Giri', 'Jeetu Nepal', 'Drama', 'Romance', 120, 'Nepal', 'A romantic drama that explores the relationship dynamics in rural Nepal.', 'https://m.media-amazon.com/images/M/MV5BODJmZjYxYmQtNjJlZS00M2Y0LThiOTYtYzIyOTQ2YTA2YjYxXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2017-12-29', 7.6, 6000),
(116, 'Kavi', 'Yugal Gurung', 'Anmol K.C.', 'Swastima Khadka', 'Drama', 'Romance', 100, 'Nepal', 'A romantic drama exploring the emotional journey of a poet.', 'https://m.media-amazon.com/images/M/MV5BYWMwNjQ4YTgtYzU1Yy00ODg1LTkyY2EtNTFlMDQzZmNkNWQ3XkEyXkFqcGdeQXVyMjM1MzU3Mzc@._V1_.jpg', '2017-06-23', 7.8, 4000),
(117, 'Shree 5 Ambare', 'Deepak Raj Giri', 'Deepak Raj Giri', 'Jeetu Nepal', 'Comedy', 'Drama', 120, 'Nepal', 'A comedy-drama following the misadventures of five friends.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsWubdd2uuh63T932m5AZ0mRl47OiBmmFpSA&s', '2017-05-12', 8.2, 7000),
(118, 'Dui Rupaiyan', 'Deepak Raj Giri', 'Deepak Raj Giri', 'Jeetu Nepal', 'Comedy', 'Drama', 105, 'Nepal', 'A comedy about two individuals struggling with their own issues while trying to make a living.', 'https://m.media-amazon.com/images/M/MV5BM2IwYjBlMzAtZmI2MC00NTI3LWFmOWQtZjZjZDA4MDAxZTUwXkEyXkFqcGdeQXVyNzkwNzg3MjU@._V1_.jpg', '2019-02-15', 7.9, 5000),
(119, 'Chhakka Panja 2', 'Deepak Raj Giri', 'Deepak Raj Giri', 'Jeetu Nepal', 'Comedy', 'Drama', 127, 'Nepal', 'A sequel to the successful Chhakka Panja, filled with humor and drama.', 'https://m.media-amazon.com/images/M/MV5BNWRiM2NiMDctMDA5NC00ZWRjLWFlZDctYjcxZDZlNDA0ZWU1XkEyXkFqcGdeQXVyNzkwNzg3MjU@._V1_.jpg', '2017-09-08', 8.1, 7000),
(120, 'Chhakka Panja 3', 'Deepak Raj Giri', 'Deepak Raj Giri', 'Jeetu Nepal', 'Comedy', 'Drama', 120, 'Nepal', 'The third installment in the Chhakka Panja series, continuing the hilarious adventures.', 'https://m.media-amazon.com/images/M/MV5BNDhiY2VjZGQtYTE0YS00ZThkLWJjZjgtNGExNGRkMjM0YzhkXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2018-12-07', 8.3, 8000),
(121, 'Gorkha Paltan', 'Anil Kumar', 'Anmol K.C.', 'Sanjay Lama', 'Action', 'Drama', 135, 'Nepal', 'An action-packed movie about the brave Gorkha soldiers and their sacrifices.', 'https://www.muncha.com/img/l34791.jpg', '2019-05-01', 7.6, 4000),
(122, 'Lappan Chappan', 'Sanjay Lama', 'Anmol K.C.', 'Swastima Khadka', 'Comedy', 'Drama', 108, 'Nepal', 'A comedy-drama that revolves around local events and personal challenges.', 'https://m.media-amazon.com/images/M/MV5BYzk5MDAyYjYtOGEyMC00MWVhLWJlNjEtMmYwM2Y0MTRhYjJhXkEyXkFqcGdeQXVyNjc5Mjg4Nzc@._V1_.jpg', '2017-03-03', 7.9, 4000),
(123, 'La La Land', 'Damien Chazelle', 'Ryan Gosling', 'Emma Stone', 'Comedy', 'Drama', 128, 'America', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', 'https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_.jpg', '2016-12-09', 8.0, 625000),
(124, 'Moonlight', 'Barry Jenkins', 'Mahershala Ali', 'Naomie Harris', 'Drama', 'Romance', 111, 'America', 'A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.', 'https://m.media-amazon.com/images/M/MV5BNzQxNTIyODAxMV5BMl5BanBnXkFtZTgwNzQyMDA3OTE@._V1_.jpg', '2016-10-21', 7.4, 302000),
(125, 'Manchester by the Sea', 'Kenneth Lonergan', 'Casey Affleck', 'Michelle Williams', 'Drama', 'Romance', 137, 'America', 'A depressed uncle is asked to take care of his teenage nephew after the boy\'s father dies.', 'https://m.media-amazon.com/images/M/MV5BMTYxMjk0NDg4Ml5BMl5BanBnXkFtZTgwODcyNjA5OTE@._V1_.jpg', '2016-11-18', 7.8, 290000),
(126, 'Arrival', 'Denis Villeneuve', 'Amy Adams', 'Jeremy Renner', 'Drama', 'Sci-Fi', 116, 'America', 'A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.', 'https://m.media-amazon.com/images/M/MV5BMTExMzU0ODcxNDheQTJeQWpwZ15BbWU4MDE1OTI4MzAy._V1_.jpg', '2016-11-11', 7.9, 656000),
(127, 'Hacksaw Ridge', 'Mel Gibson', 'Andrew Garfield', 'Sam Worthington', 'Biography', 'Drama', 139, 'America', 'World War II American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.', 'https://m.media-amazon.com/images/M/MV5BMjQ1NjM3MTUxNV5BMl5BanBnXkFtZTgwMDc5MTY5OTE@._V1_.jpg', '2016-11-04', 8.1, 505000),
(128, 'Deadpool', 'Tim Miller', 'Ryan Reynolds', 'Morena Baccarin', 'Action', 'Comedy', 108, 'America', 'A wisecracking mercenary gets experimented on and becomes immortal but ugly, and sets out to track down the man who ruined his looks.', 'https://m.media-amazon.com/images/I/A1ilWMCLPDL._AC_UF894,1000_QL80_.jpg', '2016-02-12', 8.0, 1087000),
(129, 'Captain America: Civil War', 'Anthony Russo', 'Chris Evans', 'Robert Downey Jr.', 'Action', 'Adventure', 147, 'America', 'Political involvement in the Avengers\' affairs causes a rift between Captain America and Iron Man.', 'https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_.jpg', '2016-05-06', 7.8, 810000),
(130, 'Zootopia', 'Byron Howard', 'Ginnifer Goodwin', 'Jason Bateman', 'Animation', 'Adventure', 108, 'America', 'In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.', 'https://m.media-amazon.com/images/M/MV5BOTMyMjEyNzIzMV5BMl5BanBnXkFtZTgwNzIyNjU0NzE@._V1_FMjpg_UX1000_.jpg', '2016-03-04', 8.0, 544000),
(132, 'Get Out', 'Jordan Peele', 'Daniel Kaluuya', 'Allison Williams', 'Horror', 'Mystery', 104, 'America', 'A young African-American visits his white girlfriend\'s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.', 'https://m.media-amazon.com/images/M/MV5BMjUxMDQwNjcyNl5BMl5BanBnXkFtZTgwNzcwMzc0MTI@._V1_.jpg', '2017-02-24', 7.7, 630000),
(133, 'Dunkirk', 'Christopher Nolan', 'Fionn Whitehead', 'Barry Keoghan', 'Action', 'Drama', 106, 'America', 'Allied soldiers from Belgium, the British Empire and France are surrounded by the German Army and evacuated during a fierce battle in World War II.', 'https://m.media-amazon.com/images/M/MV5BN2YyZjQ0NTEtNzU5MS00NGZkLTg0MTEtYzJmMWY3MWRhZjM2XkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_.jpg', '2017-07-21', 7.9, 695000),
(134, 'The Shape of Water', 'Guillermo del Toro', 'Sally Hawkins', 'Octavia Spencer', 'Adventure', 'Drama', 123, 'America', 'At a top secret research facility in the 1960s, a lonely janitor forms a unique relationship with an amphibious creature that is being held in captivity.', 'https://m.media-amazon.com/images/M/MV5BNGNiNWQ5M2MtNGI0OC00MDA2LWI5NzEtMmZiYjVjMDEyOWYzXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg', '2017-12-22', 7.3, 433000),
(135, 'Blade Runner 2049', 'Denis Villeneuve', 'Harrison Ford', 'Ryan Gosling', 'Action', 'Drama', 164, 'America', 'Young Blade Runner K\'s discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who\'s been missing for thirty years.', 'https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg', '2017-10-06', 8.0, 613000),
(136, 'Logan', 'James Mangold', 'Hugh Jackman', 'Patrick Stewart', 'Action', 'Drama', 137, 'America', 'In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But when Laura, a mutant child pursued by scientists, comes to him for help, he must get her to safety.', 'https://m.media-amazon.com/images/M/MV5BYzc5MTU4N2EtYTkyMi00NjdhLTg3NWEtMTY4OTEyMzJhZTAzXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg', '2017-03-03', 8.1, 772000),
(137, 'Coco', 'Lee Unkrich', 'Anthony Gonzalez', 'Gael García Bernal', 'Animation', 'Adventure', 105, 'America', 'Aspiring musician Miguel, confronted with his family\'s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', 'https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_.jpg', '2017-11-22', 8.4, 548000),
(138, 'Lady Bird', 'Greta Gerwig', 'Saoirse Ronan', 'Laurie Metcalf', 'Comedy', 'Drama', 94, 'America', 'In 2002, an artistically inclined seventeen-year-old girl comes of age in Sacramento, California.', 'https://m.media-amazon.com/images/M/MV5BODhkZGE0NDQtZDc0Zi00YmQ4LWJiNmUtYTY1OGM1ODRmNGVkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', '2017-11-03', 7.4, 277000),
(139, 'Three Billboards Outside Ebbing, Missouri', 'Martin McDonagh', 'Frances McDormand', 'Woody Harrelson', 'Crime', 'Drama', 115, 'America', 'A mother personally challenges the local authorities to solve her daughter\'s murder when they fail to catch the culprit.', 'https://m.media-amazon.com/images/M/MV5BMjI0ODcxNzM1N15BMl5BanBnXkFtZTgwMzIwMTEwNDI@._V1_.jpg', '2017-11-10', 8.1, 487000),
(140, 'Call Me by Your Name', 'Luca Guadagnino', 'Armie Hammer', 'Timothée Chalamet', 'Drama', 'Romance', 132, 'Italy', 'In 1980s Italy, romance blossoms between a seventeen-year-old student and the older man hired as his father\'s research assistant.', 'https://m.media-amazon.com/images/M/MV5BNDk3NTEwNjc0MV5BMl5BanBnXkFtZTgwNzYxNTMwMzI@._V1_FMjpg_UX1000_.jpg', '2017-11-24', 7.8, 284000);
INSERT INTO `movies` (`movieID`, `title`, `director`, `actor`, `actor2`, `genre`, `genre2`, `minute`, `country`, `description`, `poster`, `release_date`, `rating`, `imdbVotes`) VALUES
(141, 'It', 'Andy Muschietti', 'Bill Skarsgård', 'Jaeden Martell', 'Horror', 'Thriller', 135, 'America', 'In the summer of 1989, a group of bullied kids band together to destroy a shape-shifting monster, which disguises itself as a clown and preys on the children of Derry, their small Maine town.', 'https://m.media-amazon.com/images/M/MV5BZDVkZmI0YzAtNzdjYi00ZjhhLWE1ODEtMWMzMWMzNDA0NmQ4XkEyXkFqcGdeQXVyNzYzODM3Mzg@._V1_.jpg', '2017-09-08', 7.3, 566000),
(142, 'Avengers: Infinity War', 'Anthony Russo', 'Robert Downey Jr.', 'Chris Hemsworth', 'Action', 'Adventure', 149, 'America', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg', '2018-04-27', 8.4, 1058000),
(143, 'Black Panther', 'Ryan Coogler', 'Chadwick Boseman', 'Michael B. Jordan', 'Action', 'Adventure', 134, 'America', 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.', 'https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_.jpg', '2018-02-16', 7.3, 850000),
(144, 'A Star Is Born', 'Bradley Cooper', 'Lady Gaga', 'Bradley Cooper', 'Drama', 'Music', 136, 'America', 'A musician helps a young singer find fame as age and alcoholism send his own career into a downward spiral.', 'https://m.media-amazon.com/images/M/MV5BNmE5ZmE3OGItNTdlNC00YmMxLWEzNjctYzAwOGQ5ODg0OTI0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', '2018-10-05', 7.6, 345000),
(145, 'Bohemian Rhapsody', 'Bryan Singer', 'Rami Malek', 'Lucy Boynton', 'Biography', 'Drama', 134, 'America', 'The story of the legendary British rock band Queen and lead singer Freddie Mercury, leading up to their famous performance at Live Aid (1985).', 'https://m.media-amazon.com/images/M/MV5BMTA2NDc3Njg5NDVeQTJeQWpwZ15BbWU4MDc1NDcxNTUz._V1_UY1200_CR89,0,630,1200_AL_.jpg', '2018-11-02', 8.0, 533000),
(146, 'Spider-Man: Into the Spider-Verse', 'Bob Persichetti', 'Shameik Moore', 'Jake Johnson', 'Animation', 'Action', 117, 'America', 'Teen Miles Morales becomes Spider-Man of his reality, crossing his path with five counterparts from other dimensions to stop a threat for all realities.', 'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_FMjpg_UX1000_.jpg', '2018-12-14', 8.4, 503000),
(147, 'Mission: Impossible - Fallout', 'Christopher McQuarrie', 'Tom Cruise', 'Henry Cavill', 'Action', 'Adventure', 147, 'America', 'Ethan Hunt and his IMF team, along with some familiar allies, race against time after a mission gone wrong.', 'https://m.media-amazon.com/images/M/MV5BNjRlZmM0ODktY2RjNS00ZDdjLWJhZGYtNDljNWZkMGM5MTg0XkEyXkFqcGdeQXVyNjAwMjI5MDk@._V1_.jpg', '2018-07-27', 7.7, 344000),
(148, 'Green Book', 'Peter Farrelly', 'Viggo Mortensen', 'Mahershala Ali', 'Biography', 'Drama', 130, 'America', 'A working-class Italian-American bouncer becomes the driver of an African-American classical pianist on a tour of venues through the 1960s American South.', 'https://m.media-amazon.com/images/M/MV5BYmUzZGZjOGYtYzAzYS00MmQxLWI1YzUtNjk0MGE1YjQ3YjA5XkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg', '2018-11-16', 8.2, 367000),
(149, 'Incredibles 2', 'Brad Bird', 'Craig T. Nelson', 'Holly Hunter', 'Animation', 'Action', 118, 'America', 'The Incredibles family takes on a new mission which involves a change in family roles: Bob Parr (Mr. Incredible) must manage the house while his wife Helen (Elastigirl) goes out to save the world.', 'https://m.media-amazon.com/images/I/81fs3GndzBL._AC_UF894,1000_QL80_.jpg', '2018-06-15', 7.6, 333000),
(150, 'A Quiet Place', 'John Krasinski', 'Emily Blunt', 'John Krasinski', 'Drama', 'Horror', 90, 'America', 'In a post-apocalyptic world, a family is forced to live in silence while hiding from monsters with ultra-sensitive hearing.', 'https://m.media-amazon.com/images/M/MV5BNGZmODU3ZDEtMjQwZC00NTA5LThmNWYtYzk5MmY5ZmM4NGIxXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg', '2018-04-06', 7.5, 441000),
(151, 'BlackKklansman', 'Spike Lee', 'John David Washington', 'Adam Driver', 'Biography', 'Comedy', 135, 'America', 'Ron Stallworth, an African-American police officer from Colorado Springs, CO, successfully manages to infiltrate the local Ku Klux Klan branch with the help of a Jewish surrogate who eventually becomes its leader.', 'https://m.media-amazon.com/images/M/MV5BMjUyOTE1NjI0OF5BMl5BanBnXkFtZTgwMTM4ODQ5NTM@._V1_.jpg', '2018-08-10', 7.5, 205000),
(152, 'Roma', 'Alfonso Cuarón', 'Yalitza Aparicio', 'Marina de Tavira', 'Drama', 'Romance', 135, 'Mexico', 'A year in the life of a middle-class family\'s maid in Mexico City in the early 1970s.', 'https://i.ebayimg.com/images/g/D5MAAOSwVZ1cYJ~6/s-l1200.webp', '2018-12-14', 7.7, 150000),
(153, 'Hereditary', 'Ari Aster', 'Toni Collette', 'Milly Shapiro', 'Drama', 'Horror', 127, 'America', 'A grieving family is haunted by tragic and disturbing occurrences.', 'https://m.media-amazon.com/images/M/MV5BOTU5MDg3OGItZWQ1Ny00ZGVmLTg2YTUtMzBkYzQ1YWIwZjlhXkEyXkFqcGdeQXVyNTAzMTY4MDA@._V1_.jpg', '2018-06-08', 7.3, 308000),
(154, 'First Man', 'Damien Chazelle', 'Ryan Gosling', 'Claire Foy', 'Biography', 'Drama', 141, 'America', 'A look at the life of astronaut Neil Armstrong and the legendary space mission that led him to become the first man to walk on the Moon on July 20, 1969.', 'https://m.media-amazon.com/images/M/MV5BMDBhOTMxN2UtYjllYS00NWNiLWE1MzAtZjg3NmExODliMDQ0XkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg', '2018-10-12', 7.3, 162000),
(155, 'Crazy Rich Asians', 'Jon M. Chu', 'Constance Wu', 'Henry Golding', 'Comedy', 'Drama', 120, 'America', 'This contemporary romantic comedy, based on a global bestseller, follows native New Yorker Rachel Chu to Singapore to meet her boyfriend\'s family.', 'https://m.media-amazon.com/images/M/MV5BMTYxNDMyOTAxN15BMl5BanBnXkFtZTgwMDg1ODYzNTM@._V1_.jpg', '2018-08-15', 6.9, 165000);

-- --------------------------------------------------------

--
-- Table structure for table `seenepoll`
--

CREATE TABLE `seenepoll` (
  `pollID` int(11) NOT NULL,
  `movieID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `user_rating` decimal(3,1) DEFAULT NULL,
  `review_title` varchar(50) NOT NULL,
  `user_review` text NOT NULL,
  `total_votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seenepoll`
--

INSERT INTO `seenepoll` (`pollID`, `movieID`, `userID`, `user_rating`, `review_title`, `user_review`, `total_votes`) VALUES
(13, 2, 1, 10.0, 'Best movie adaptatin ever!', 'I had not expected to for this harry potter movie adaptation to be this good. It is great to relive the thrill watching it as it was reading from the book.', 1),
(14, 1, 1, 10.0, 'Excellent Movie...', 'One of the finest films made in recent years. It\'s a poignant story about hope. Hope gets me. That\'s what makes a film like this more than a movie. It tells a lesson about life. Those are the films people talk about 50 or even 100 years from you. It\'s also a story for freedom. Freedom from isolation, from rule, from bigotry and hate.', 4),
(15, 3, 1, 8.0, 'Nepali Best comedy Movie', 'Sacchai dami movie raicha, bipin dai ko acting babaal cha.', 2),
(16, 5, 1, 5.0, 'Not bad...', 'Khasai ramro ta lagena, but still bich bich ma ramailo nai cha', 3),
(18, 5, 10, 7.0, 'Wowwww!!!', 'La sahi movie nikalni raicha yr... I love anmol kc, my life!!!\n', 1),
(19, 1, 8, 6.0, 'awesome movie', 'i like this movie very much.. Loved the movie.\nrecommended for all', 3),
(22, 1, 2, 9.0, 'Overwhelmingly Good!', 'I didnt expectec for the Morgan to play such an act that literally moves me from the inside. It is good on so many level... Most Recommended movie!', 1),
(23, 6, 8, 9.0, 'great movie', '\nloved the movie\n', 3),
(24, 3, 8, 9.0, 'babbal movie', 'i liked it', 1),
(26, 30, 1, 10.0, 'Best batman movie', 'From the director of Inception, Intersteller and Many great movies, Nolan never disappoints to deliver us great movies years and years after.', 1),
(29, 6, 1, 9.0, 'Our EVIL Custom!', 'As much as I cherish this movie for its artistic excellence and emotional depth, I also find myself repulsed by the portrayal of the Sati practice, an abhorrent custom that once plagued our culture. This inhumane tradition, which coerced widows into self-immolation on their husband\'s funeral pyre, stands as a dark chapter in our history.\n\nI am profoundly grateful to Chandra Shumsher, whose progressive leadership led to the eradication of this evil practice in 1920. His efforts not only saved countless lives but also paved the way for a more humane and just society. This historical context enriches my appreciation for the film\'s narrative, reminding us of the importance of progress and the ongoing fight against oppressive traditions.', 1),
(32, 69, 1, 1.0, '**** **** anmol ko **** ', 'yo muji **** khate **** jasto movie aaile samman dekheko chaina. **** anmol', 1),
(33, 25, 1, 9.0, 'love', 'this movie is **** good!', 1),
(34, 31, 1, 9.0, 'greatest mind twisting movie ever', 'from tarantino, this is the best movie ever seen.', 1),
(35, 4, 2, 7.0, 'sample test', 'sample test 123', 2),
(36, 4, 1, 5.0, 'test', 'test', 1);

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
(2, 'test', 'test231@gmail.com', 'raksi', '$2y$10$IelnDjltqzOl5HVNIBZreeWmNLCV7Cv3kLhlWN6KhOizV0N8d8DOO', 0),
(3, 'happy', 'happy@gmail.com', 'xyang', '$2y$10$9Oy6uR/XynLdsI2iVYBrme8lDG7.BL278tmcupdXtL2L72hz2xlri', 0),
(4, 'happy', 'happyman@gmail.com', 'chicken', '$2y$10$nr/CXryL0Im9h3P2BoPkrOfhCvwS2805RdV/WHtRpUYUz8bH/e5Ke', 0),
(5, 'mandiep', 'mandiep@gmail.com', 'korean', '$2y$10$qF1Tlxi.s4ZMv7jw44I5MeYbukH1AxQ0WuhwbHbOJ0geuxhGQmkDq', 0),
(6, 'hiten', 'hiten@gmail.com', 'chiya', '$2y$10$l0E2TFEbzOpT1Kg.BgWz0ukjSHtd5XsI9zLLrRNdAnAMV7.D0M.Wm', 0),
(7, 'nepal', 'nepal@gmail.com', 'thukpa', '$2y$10$bCmZF8N/Mu33BOP9fT9Y4Oql6iiDak1X6DDqwv2KoPlM94bgshdhi', 0),
(8, 'jagdish', 'jagadish660@gmail.com', 'momo', '$2y$10$FKa7jFf.3C.yNRz1D6ljluYRChH5xPfV/wBf8yxWSgtKfc00qobJi', 0),
(10, 'Dipesh', 'dipesh10@gmail.com', 'surya', '$2y$10$oyy5KuQtc2vCqUwltxBYx.nThjjeBoW/P9hLhtIA9AhAhq/tnus5u', 0),
(11, 'yugpurush dhaka', 'yubraajdhakal7@gmail.com', 'mutton', '$2y$10$Cr7Po2fRPDWze.n48Tf9ieCdNwunuKc8y.dSmsTN988eL54OqFEkG', 0),
(12, 'jaynepal', 'nepali@gmail.com', 'massu', '$2y$10$KFNlXs4gNCS/s0ZZrqlHneaXaJprCRwiG.gR4rIgLx/EV6/tQH4am', 0);

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
  ADD KEY `movieID` (`movieID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favoriteID`),
  ADD UNIQUE KEY `unique_favorite` (`userID`,`movieID`),
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
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favoriteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `seenepoll`
--
ALTER TABLE `seenepoll`
  MODIFY `pollID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `userdata` (`userID`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userdata` (`userID`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`);

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

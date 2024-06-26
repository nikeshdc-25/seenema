-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2024 at 09:21 AM
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
(33, 30, 1, 'Best movie hai, hernai parcha sabaile', '2024-06-28 13:02:42');

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
(1, 'Shawshank Redemption', 'Frank Darabont', 'Tim Robbins', 'Thriller', 'America', 'Andy Dufresne, a successful banker, is arrested for the murders of his wife and her lover, and is sentenced to life imprisonment at the Shawshank prison. He becomes the most unconventional prisoner.', 'https://i5.walmartimages.com/seo/The-Shawshank-Redemption-DVD-Castle-Rock-Drama_e71b2ff8-1060-47df-b836-98608ca60a0a.2d720e36a9bcf80b3039a41a49f4194e.jpeg', '1994-10-14', 9.3, 2907056),
(2, 'Harry Potter and the Philosopher\'s Stone', 'Chris Columbus', 'Daniel Radcliffe', 'Fantasy', 'America', 'Harry Potter, an eleven-year-old orphan, discovers that he is a wizard and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him', 'https://images.moviesanywhere.com/143cdb987186a1c8f94d4f18de211216/fdea56fa-2703-47c1-8da8-70fc5382e1ea.jpg', '2001-11-16', 7.6, 861602),
(3, 'Jatra', 'Pradip Bhattarai', 'Bipin Karki', 'Comedy', 'Nepal', 'After finding a bag of money, an impoverished man divides it with two of his friends to keep it safe.\r\n', 'https://m.media-amazon.com/images/M/MV5BMTAyNWJkZWItZDY3Yi00NTg5LTk1YzUtNmExMTk0MTYwODQyXkEyXkFqcGdeQXVyNjc5Mjg4Nzc@._V1_.jpg', '2016-11-11', 8.1, 310),
(4, 'Hami Tin Bhai', 'Shiva Regmi', 'Rajesh Hamal', 'Action', 'Nepal', 'Hami Tin Bhai, a 2004 Nepali action, comedy film directed by Shiva Regmi, is the film featuring three of biggest superstars of the late 1990s and 2000s era- Rajesh Hamal, Shree Krishna Shrestha and Nikhil Upreti in the lead roles supported by Rekha Thapa, Jharana Thapa, Nandita KC, Keshab Bhattrai, Sushila Rayamajhi, Ravi Giri etc.', 'https://m.media-amazon.com/images/M/MV5BZWU5Mjc3M2EtMzdjNS00NWFlLTg3OWUtYTQ1ZDg3NjFhYTI4XkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_FMjpg_UX1000_.jpg', '2004-10-13', 8.8, 510),
(5, 'Hostel', ' Hem Raj BC', 'Anmol KC', 'Drama', 'Nepal', 'The film is about the struggling life of teenagers in hostel. It features love, betrayal, friendship,emotions, family ties and so on.', 'https://res.cloudinary.com/digddaiwf/images/w_720,h_960,c_scale/v1701554039/Hostel-Nepali-Movie-Poster-Nepal-FM/Hostel-Nepali-Movie-Poster-Nepal-FM.jpg?_i=AA', '2013-06-13', 6.2, 61),
(6, 'Jhola', 'Yadav Kumar Bhattarai', 'Garima Panta', 'Drama', 'Nepal', 'Jhola is a 2013 Nepali film based on a story by writer Krishna Dharabasi. It is about Sati culture that was prevalent in the Nepalese society until the 1920s in which wife had to immolate herself upon her husband\'s death, typically on his funeral pyre.', 'https://m.media-amazon.com/images/M/MV5BNzFiNjAzYTEtNmVlYy00ZDU2LWJmYTUtNGQwZDZhMWQwNTlkXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2013-12-07', 7.7, 723),
(15, 'Scarface', 'Brian De Palma', 'Al Pacino', 'Action', 'America', 'Tony Montana and his close friend Manny, build a strong drug empire in Miami. However as his power begins to grow, so does his ego and his enemies, and his own paranoia begins to plague his empire.', 'https://musicart.xboxlive.com/7/fa205100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080', '1983-12-09', 8.3, 923081),
(16, 'Agastya: Chapter 1', 'Nimesh Shrestha', '', 'Action', '', 'Agyasta: Chapter 1 is a 2024 Nepali action thriller film directed by Saurav Chaudhary under the banner of Dark Horse Entertainment and Seven Seas Entertainment. Released on 1 March 2024, the film stars Saugat Malla, Najir Husen, Nischal Basnet, Pramod Agrahari, Malika Mahat, and Bijay Baral.', 'https://m.media-amazon.com/images/M/MV5BNDc2ZDQ1ZTItOTFiMS00YmQ4LWJiMTAtMTI0NTA2ZWE2NTI1XkEyXkFqcGdeQXVyMTY3ODkyNDkz._V1_.jpg', '2024-03-01', 9.0, 78),
(17, 'Loot', 'Nischal Basnet', 'Saugat Malla', 'Thriller', 'Nepal', 'Loot is a 2012 Nepali crime thriller film that was directed and written by Nischal Basnet as his debut. The film was produced by Madhav Wagle and Narendra Maharjan with Princess Movies and Black Horse Pictures.', 'https://m.media-amazon.com/images/M/MV5BYzI0NTJiZTAtMDM2Ny00ZDZmLWJhYzQtMDUzMThkZTI1MDFjXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2013-01-13', 8.1, 984),
(18, 'Loot 2', 'Nischal Basnet', 'Saugat Malla', 'Crime', 'Nepal', 'Four gang members escape from prison and plot revenge against a former colleague, the man who framed them for bank robbery.', 'https://m.media-amazon.com/images/M/MV5BMDU3YjhjNDQtZjYzZS00NGI5LTk1NmUtZmMxZTU5YzUyY2RiXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2017-02-24', 6.0, 230),
(19, 'Jatrai Jatra', 'Pradip Bhattarai', 'Bipin Karki', 'Comedy', 'Nepal', 'Jatrai Jatra is a 2019 Nepalese comedy thriller film, directed by Pradip Bhattarai and written by Rhythm Paudel. Rhythm Paudel has played a huge role developing this film. The film is produced by Pawan Shrestha, Rhythm Paudel, Nigin Pun and Sudin Bikram Thapa under the banner of Shatkon Arts.', 'https://m.media-amazon.com/images/M/MV5BYWQ2Y2ZiMDktZTQzOC00NTVlLThlMDMtOTk2YTQ4NjQ5MmVlXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2019-05-17', 7.2, 178),
(20, 'Kabaddi', 'Ram Babu Gurung', 'Dayahang Rai', 'Romance', 'Nepal', 'Kabaddi is a 2014 Nepali romantic drama film written and directed by Ram Babu Gurung. It portrays the story of a love triangle among three central characters. The film was produced by Raunak Bikram Kandel, Nischal Basnet and Sunil Rauniyar and starred Nischal Basnet, Dayahang Rai, Rishma Gurung and Rajan Khatiwada.', 'https://m.media-amazon.com/images/M/MV5BZDUyMzg0OTAtMzVjZC00MGJkLTk4NjQtMjdkOTdhYTE4N2YwXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2014-04-25', 8.2, 674),
(21, 'Kagbeni', 'Bhusan Dahal', 'Saugat Malla', 'Horror', 'Nepal', 'Kagbeni is a 2008 Nepali movie, loosely based on W. W. Jacobs\'s 1902 horror short story The Monkey\'s Paw. Kagbeni is the directorial debut of Bhusan Dahal. The name of the movie is taken from a tourist place Kagbeni in the valley of the Kali Gandaki, which is a two-hour trek from Muktinath.', 'https://upload.wikimedia.org/wikipedia/en/d/dd/Kagbeni_%282008_film_poster%29.jpg', '2008-01-11', 7.4, 563),
(22, 'Jaari', 'Upendra Subba', 'Dayahang Rai', 'Drama', 'Nepal', 'Jaari is a 2023 Nepali film written and directed by Upendra Subba under the banner of Baasuri Films. It is produced by Ram Babu Gurung. Released on April 14, 2023, the film stars Dayahang Rai, Miruna Magar, Prem Subba, Bijay Baral, Roydeep Shrestha, and Rekha Limbu.', 'https://m.media-amazon.com/images/M/MV5BNzVkMGQ0MDAtYzFmZS00YTBkLTliZWEtMzU5YTYzY2ZkZTAwXkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_.jpg', '2023-04-14', 8.5, 325),
(23, 'Bir Bikram', 'Milan Chams', 'Dayahang Rai', 'Comedy', 'Nepal', 'Bir Bikram is a 2016 romantic comedy film directed by Milan Chams. This movie features Nepalese actors Dayahang Rai, Anoop Bikram Shahi, Deeya Pun, Arpan Thapa, Menuka Pun and Najir Hussain in the lead roles.', 'https://m.media-amazon.com/images/M/MV5BOGZjOTdjYjgtYTU2OS00NzQ4LThjNjItY2E5MWU5MzBlNGE0XkEyXkFqcGdeQXVyNTEwOTEzNDk@._V1_FMjpg_UX1000_.jpg', '2016-08-19', 5.9, 65),
(24, '3 Idiots', 'Rajkumar Hirani', 'Aamir Khan', 'Comedy', 'India', 'In college, Farhan and Raju form a great bond with Rancho due to his refreshing outlook. Years later, a bet gives them a chance to look for their long-lost friend whose existence seems rather elusive.', 'https://musicart.xboxlive.com/7/ab3c6200-0000-0000-0000-000000000002/504/image.jpg', '2009-12-25', 8.4, 437914),
(25, 'Dangal', 'Nitesh Tiwari', 'Aamir Khan', 'Biography', 'India', 'Mahavir Singh Phogat, a former wrestler, decides to fulfil his dream of winning a gold medal for his country by training his daughters for the Commonwealth Games despite the existing social stigmas.', 'https://m.media-amazon.com/images/M/MV5BZDE4YzA3MGMtNmQ1ZS00NTkzLWFkYjQtMGQ2NDlhYTU4NjgxXkEyXkFqcGdeQXVyNDI3NjU1NzQ@._V1_.jpg', '0016-12-21', 8.4, 212788),
(26, 'Baahubali: The Beginning', 'S.S. Rajamouli', 'Prabhas', 'Action', 'India', 'In the kingdom of Mahishmati, Shivudu falls in love with a young warrior woman. While trying to woo her, he learns about the conflict-ridden past of his family and his true legacy.', 'https://m.media-amazon.com/images/M/MV5BYWVlMjVhZWYtNWViNC00ODFkLTk1MmItYjU1MDY5ZDdhMTU3XkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg', '2015-07-10', 7.9, 137895),
(27, 'Gully Boy', 'Zoya Akhtar', 'Ranveer Singh', 'Drama', 'India', 'Murad, an underdog, struggles to convey his views on social issues and life in Dharavi through rapping. His life changes drastically when he meets a local rapper, Shrikant alias MC Sher.', 'https://m.media-amazon.com/images/M/MV5BZDkzMTQ1YTMtMWY4Ny00MzExLTkzYzEtNzZhOTczNzU2NTU1XkEyXkFqcGdeQXVyODY3NjMyMDU@._V1_FMjpg_UX1000_.jpg', '2019-02-14', 7.9, 44002),
(28, 'Drishyam', 'Nishikant Kamat', 'Ajay Devgn', 'Thriller', 'India', 'When the disappearance of a policewoman\'s son threatens to ruin Vijay\'s family, he leaves no stone unturned in order to shield his family.', 'https://static.moviecrow.com/marquee/drishyam-new-poster/67289_thumb_665.jpg', '2015-07-31', 8.2, 95586),
(29, 'Lukamari', 'Shree Ram Dahal', 'Saugat Malla', 'Drama', 'Nepal', 'Lukamari is 2016 crime action film written and directed by Shree Ram Dahal. The film stars Saugat Malla, Karma Shakya, Bikram Singh Tharu, Surabina Karki, and Rista Basnet in lead roles. The film is slightly based on Khyati Shrestha murder case of 2009', 'https://m.media-amazon.com/images/M/MV5BZTIyOTQ3NGYtMWZhYi00NTFjLWIxOGEtZThlMmQzYWZkMWJkXkEyXkFqcGdeQXVyNjU4MjE5OTM@._V1_.jpg', '2016-07-10', 6.8, 106),
(30, 'The Dark Knight', 'Christopher Nolan', 'Christian Bale', 'Action', 'America', 'Batman has a new foe, the Joker, who is an accomplished criminal hell-bent on decimating Gotham City. Together with Gordon and Harvey Dent, Batman struggles to thwart the Joker before it is too late.', 'https://www.legendary.com/wp-content/uploads/2015/04/film_thedarkknight_featureimage_desktop_1600x9001-414x621.jpg', '2007-07-20', 9.0, 2890308),
(31, 'Pulp Fiction', 'Quentin Tarantino', 'John Travolta', 'Crime', 'America', 'In the realm of underworld, a series of incidents intertwines the lives of two Los Angeles mobsters, a gangster\'s wife, a boxer and two small-time criminals.', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', '1994-10-14', 8.9, 2236224),
(32, 'Inception', 'Inception', 'Inception', 'Sci-Fi', 'UK', 'Cobb steals information from his targets by entering their dreams. He is wanted for his alleged role in his wife\'s murder and his only chance at redemption is to perform a nearly impossible task.', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p7825626_p_v8_ae.jpg', '2010-07-16', 8.8, 2567990),
(33, 'The Godfather', 'Francis Ford Coppola', 'Marlon Brando', 'Crime', 'USA', 'Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son, Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger.', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', '1972-03-24', 9.2, 2027179),
(34, 'The Godfather Part II', 'Francis Ford Coppola', 'Al Pacino', 'Crime', 'America', 'Vito\'s popularity in the underworld is on the rise, while his son, Michael\'s career is swinging downwards. In order to redeem himself, Michael must fight his enemies, including his own brother.', 'https://m.media-amazon.com/images/I/41V2AB34KCL._AC_UF894,1000_QL80_.jpg', '1974-12-20', 9.0, 1372726),
(35, 'Schindler\'s List', 'Steven Spielberg', 'Liam Neeson', 'Biography', 'America', 'Oscar Schindler, a successful and narcissistic German businessman, slowly starts worrying about the safety of his Jewish workforce after witnessing their persecution in Poland during World War II.', 'https://image.tmdb.org/t/p/original/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg', '1993-12-15', 9.0, 1460595),
(36, 'Fight Club', 'David Fincher', 'Brad Pitt', 'Drama', 'Germany', 'Unhappy with his capitalistic lifestyle, a white-collared insomniac forms an underground fight club with Tyler, a careless soap salesman. Soon, their venture spirals down into something sinister.', 'https://images.justwatch.com/poster/180839658/s718/fight-club.jpg', '1999-10-15', 8.8, 2342257),
(37, 'Pashupati Prasad', 'Dipendra K. Khanal', 'Khagendra Lamichhane', 'Comedy', 'Nepal', 'A man inherits his parents\' debts after they die in an earthquake. Determined to repay the debts, he travels to Kathmandu to find work.', 'https://m.media-amazon.com/images/M/MV5BNDFmOTlhNjMtZTdiMS00ZjAzLTg5ZjktYWE2MTZhNjllNjcwXkEyXkFqcGdeQXVyNzQ3NTY5MjE@._V1_.jpg', '2016-01-29', 8.5, 1733);

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
(17, 5, 9, 8.0, 'Mahabharat', 'It reminds me of my own hostel life yr. So nostalgic!!!', 2),
(18, 5, 10, 7.0, 'Wowwww!!!', 'La sahi movie nikalni raicha yr... I love anmol kc, my life!!!\n', 1),
(19, 1, 8, 6.0, 'awesome movie', 'i like this movie very much.. Loved the movie.\nrecommended for all', 3),
(20, 1, 9, 8.0, 'babbal', 'loved it', 2),
(21, 17, 13, 9.0, 'Babaal', 'dami movie cha, maile ni ei herera bank lootna gaako theye, aaile jail bata review garirachu', 1),
(22, 1, 2, 9.0, 'Overwhelmingly Good!', 'I didnt expectec for the Morgan to play such an act that literally moves me from the inside. It is good on so many level... Most Recommended movie!', 1),
(23, 6, 8, 9.0, 'great movie', '\nloved the movie\n', 1),
(24, 3, 8, 9.0, 'babbal movie', 'i liked it', 1),
(26, 30, 1, 10.0, 'Best batman movie', 'From the director of Inception, Intersteller and Many great movies, Nolan never disappoints to deliver us great movies years and years after.', 1);

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
(6, 'hiten', 'hiten@gmail.com', 'chiya', '$2y$10$XaBUBKtmRdxVV4sbkOu2xua/YSiffrL4a8V1GvVmOZnU9tskfqbbG', 0),
(7, 'nepal', 'nepal@gmail.com', 'thukpa', '$2y$10$bCmZF8N/Mu33BOP9fT9Y4Oql6iiDak1X6DDqwv2KoPlM94bgshdhi', 0),
(8, 'jagdish', 'jagadish660@gmail.com', 'momo', '$2y$10$FKa7jFf.3C.yNRz1D6ljluYRChH5xPfV/wBf8yxWSgtKfc00qobJi', 0),
(9, 'Ajay', 'ajaydas@gmail.com', 'keema noodles', '$2y$10$noo/WEphd9PhTEwf2JXB9eDFod8sM5DJCHh.2dfG/un9IY/zJHycG', 0),
(10, 'Dipesh', 'dipesh10@gmail.com', 'surya', '$2y$10$oyy5KuQtc2vCqUwltxBYx.nThjjeBoW/P9hLhtIA9AhAhq/tnus5u', 0),
(11, 'yugpurush dhaka', 'yubraajdhakal7@gmail.com', 'mutton', '$2y$10$Cr7Po2fRPDWze.n48Tf9ieCdNwunuKc8y.dSmsTN988eL54OqFEkG', 0),
(12, 'jaynepal', 'nepali@gmail.com', 'massu', '$2y$10$KFNlXs4gNCS/s0ZZrqlHneaXaJprCRwiG.gR4rIgLx/EV6/tQH4am', 0),
(13, 'Sangat', 'sangat@gmail.com', 'raksi', '$2y$10$mmJ/Lkilt4IOVNUV5uhuuuXk/XZ/CK382voCO5FwXkvaKGzeqiEEu', 0);

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
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `seenepoll`
--
ALTER TABLE `seenepoll`
  MODIFY `pollID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
-- Constraints for table `seenepoll`
--
ALTER TABLE `seenepoll`
  ADD CONSTRAINT `seenepoll_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`),
  ADD CONSTRAINT `seenepoll_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `userdata` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 22. 03 2019 kl. 13:37:37
-- Serverversion: 10.1.38-MariaDB
-- PHP-version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chhoe17`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL,
  `titlePicture` varchar(100) DEFAULT NULL,
  `descPicture` tinytext,
  `userid` int(11) DEFAULT NULL,
  `imageFullNamePicture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `pictures`
--

INSERT INTO `pictures` (`id`, `titlePicture`, `descPicture`, `userid`, `imageFullNamePicture`) VALUES
(1, 'awf', 'awf', 12, 'uploads/catz.png'),
(2, 'th', 'th', 12, 'uploads/catz.png'),
(3, 'fwafawf', 'awfawf', 12, 'uploads/catz.png'),
(49, 'asf', 'awf', 7, 'uploads/catz.png'),
(50, 'cat', 'cat', 7, 'uploads/let-me-seduce-you-cat.png'),
(51, 'John olsen', 'pizzabakke', 12, 'uploads/123.png'),
(52, 'Jeppe', 'Ã˜l', 7, 'uploads/54798948_271530353762711_3660683858552029184_n.jpg'),
(53, 'SadCat', 'Cry', 7, 'uploads/1553163634051.jpg'),
(55, 'fawf', 'awfwf', 7, 'uploads/catz.png'),
(56, 'HELLOO', 'HELLOOHELLOOHELLOOHELLOOHELLOOHELLOOHELLOO DESCRIPTIOON', 7, 'uploads/giphy.gif'),
(57, 'Strong cat', 'THis is a description of a very swole cat with some juicy looking arms', 7, 'uploads/strongcat.jpg'),
(58, 'John Olsen', 'SPiser og har mayonaise i hovedet', 7, 'uploads/unknown.png'),
(59, 'Crazy cat', 'devilisishcat with a nice smile :)', 7, 'uploads/catz.png'),
(60, 'John', 'JohnWalking', 7, 'uploads/123.png'),
(61, 'John', 'Walking again', 7, 'uploads/123.png'),
(62, 'JuulCat', 'Cat taking a fat hit from a nice juul pod', 7, 'uploads/juulcat.jpg'),
(63, 'chhekycat', 'A very excited cat that is very happy', 7, 'uploads/cheekycat.png'),
(64, 'Bob', 'cat having fun with a nice juul', 7, 'uploads/juulcat.jpg');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(256) NOT NULL,
  `user_phone` varchar(256) NOT NULL,
  `user_email` varchar(256) NOT NULL,
  `user_zip` varchar(256) NOT NULL,
  `user_password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_phone`, `user_email`, `user_zip`, `user_password`) VALUES
(7, 'bob ross', '+61687185', 'thesneakysticky@gmail.com', '5000', '$2y$10$WmU3VpjTxNgie.TM.sHyIeo0uQnDi5Al.JlfNBRbbG8k69TZZ746C'),
(8, 'Christian Aaby', '+61687185', 'thes@hotmail123.com', '5000', '$2y$10$wvyDwTEou.ouAT52Vd9CVuwgtvdMDCsh1vsvn.IeR60W2Mjr1NWhu'),
(9, 'thomas john', '+111111111', 'thomas@hotmail123.com', '5000', '$2y$10$yXU.JvdRiFB3HFk7u.Z7.u7vGmtnnd7hkdOP7hoHuTydEGW.ZOiiK'),
(10, 'Christian Hoegh', '+45454545', 'thes@hotmail.com', '5000', '$2y$10$dy1tSvG6TaOc8Z6qrWlZXei.XgdBswCBOajcyLXXNkLP2xSMnY.0W'),
(11, 'Tom jerry', '+454541235', 'thesneakysticky@gmail.com', '2000', '$2y$10$lQTtLiwJ4sFS6wVHv69jpO/AIex8n8a2IGoL1cDSjBUCz.Kc3KKcK'),
(12, 'gunnar gunnar', '+121212112', 'thesneakysticky@gmail.com', '2222', '$2y$10$6IsNr8qhBrXUDN5sdQadPuGcVIS03wsW0H3CIrLcnQ9yYkGfPPzWq');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

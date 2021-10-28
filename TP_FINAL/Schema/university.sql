-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2021 a las 05:27:30
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `university`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `careers`
--

CREATE TABLE `careers` (
  `careerId` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `active` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `careers`
--

INSERT INTO `careers` (`careerId`, `description`, `active`) VALUES
(1, 'Yabox', '1'),
(2, 'Latz', '0'),
(3, 'Twiyo', '0'),
(4, 'Twiyo', '1'),
(5, 'Photobeam', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `companyId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneNumbre` varchar(100) NOT NULL,
  `cuit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `joboffers`
--

CREATE TABLE `joboffers` (
  `jobOfferId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `careerId` int(11) NOT NULL,
  `jobPositionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobpositions`
--

CREATE TABLE `jobpositions` (
  `jobPositionId` int(11) NOT NULL,
  `careerId` int(11) DEFAULT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jobpositions`
--

INSERT INTO `jobpositions` (`jobPositionId`, `careerId`, `description`) VALUES
(1, 2, 'Jr developer with Java Springboot, Git, MySQL technologies for booming fintech.'),
(2, 1, 'Computer security specialist with knowledge in ethical hacking and studies in related careers.'),
(3, 5, 'Jr developer with advanced studies in Engineering for a backend developer position.'),
(4, 3, 'Proactive person, committed to what we do and willing to take on interesting challenges.'),
(5, 4, 'Sr developer with strong knowledge in Angular and more than 5 years of experience for frontend position.'),
(6, 1, 'QA tester with 2 or more years of experience for remote employment.'),
(7, 4, 'Cybersecurity specialist for a project with a foreign client, with experience in networks, servers and microcomputers, among others.'),
(8, 3, 'Scrum Master in charge of acting as a facilitator for the effective operation of a software development team using agile methodology.'),
(9, 2, 'DevOps with at least 2 years of demonstrable experience and solid knowledge in Spanish and French.'),
(10, 5, 'Developer with knowledge of the following technologies: ASP.NET, .NET, Hibernate, Entity framework, MVC, NET Core, among others.'),
(11, 4, 'Machine learning engineering specialist with knowledge of business intelligence practice.'),
(12, 3, 'Data Scientist to create automated interfaces, reports and models to assist the team in decision making'),
(13, 2, 'Full Stack Programmer with more than 5 years of verifiable experience to participate in projects related to PHP, MySQL and JavaScript.'),
(14, 1, 'Jr web developer with studies in related careers for first IT job.'),
(15, 5, 'Go developer with 2/3 years of proven experience in software development in Golang for remote work.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roleId` int(11) NOT NULL,
  `value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`roleId`, `value`) VALUES
(1, 'User'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `studentId` int(11) NOT NULL,
  `fileNumber` varchar(20) NOT NULL,
  `careerId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`studentId`, `fileNumber`, `careerId`, `userId`, `active`) VALUES
(1, '33', 2, 1, 0),
(2, '1', 5, 2, 1),
(3, '89', 2, 3, 1),
(4, '72', 5, 4, 1),
(5, '74', 2, 5, 0),
(6, '33', 4, 6, 0),
(7, '54', 3, 7, 0),
(8, '10', 5, 8, 1),
(9, '78', 5, 9, 0),
(10, '35', 4, 10, 1),
(11, '91', 2, 11, 1),
(12, '33', 3, 12, 1),
(13, '24', 2, 13, 0),
(14, '8', 2, 14, 1),
(15, '11', 5, 15, 1),
(16, '95', 2, 16, 1),
(17, '53', 1, 17, 1),
(18, '2', 2, 18, 1),
(19, '84', 2, 19, 1),
(20, '12', 5, 20, 0),
(21, '39', 4, 21, 1),
(22, '3', 4, 22, 1),
(23, '79', 4, 23, 1),
(24, '81', 1, 24, 0),
(25, '3', 1, 25, 1),
(26, '14', 2, 26, 0),
(27, '17', 1, 27, 1),
(28, '37', 1, 28, 1),
(29, '50', 4, 29, 1),
(30, '88', 5, 30, 1),
(31, '62', 3, 31, 0),
(32, '88', 5, 32, 0),
(33, '56', 1, 33, 1),
(34, '12', 2, 34, 0),
(35, '14', 1, 35, 0),
(36, '37', 5, 36, 0),
(37, '65', 4, 37, 0),
(38, '55', 2, 38, 1),
(39, '6', 4, 39, 1),
(40, '82', 2, 40, 0),
(41, '48', 1, 41, 0),
(42, '66', 2, 42, 1),
(43, '69', 5, 43, 0),
(44, '54', 1, 44, 0),
(45, '85', 5, 45, 1),
(46, '38', 3, 46, 0),
(47, '88', 2, 47, 0),
(48, '97', 1, 48, 1),
(49, '32', 4, 49, 1),
(50, '38', 2, 50, 1),
(51, '73', 5, 51, 1),
(52, '55', 4, 52, 1),
(53, '12', 4, 53, 1),
(54, '43', 5, 54, 0),
(55, '64', 1, 55, 0),
(56, '16', 1, 56, 0),
(57, '21', 5, 57, 1),
(58, '41', 2, 58, 0),
(59, '12', 2, 59, 0),
(60, '23', 4, 60, 1),
(61, '21', 5, 61, 0),
(62, '35', 2, 62, 1),
(63, '22', 1, 63, 1),
(64, '43', 4, 64, 1),
(65, '63', 5, 65, 1),
(66, '41', 4, 66, 1),
(67, '93', 3, 67, 1),
(68, '68', 4, 68, 0),
(69, '89', 4, 69, 1),
(70, '18', 1, 70, 1),
(71, '84', 1, 71, 1),
(72, '68', 4, 72, 1),
(73, '33', 1, 73, 0),
(74, '60', 1, 74, 0),
(75, '87', 1, 75, 0),
(76, '67', 5, 76, 1),
(77, '29', 2, 77, 0),
(78, '74', 1, 78, 0),
(79, '46', 4, 79, 1),
(80, '28', 4, 80, 1),
(81, '28', 5, 81, 1),
(82, '86', 1, 82, 1),
(83, '45', 1, 83, 1),
(84, '18', 3, 84, 0),
(85, '56', 4, 85, 1),
(86, '87', 5, 86, 0),
(87, '24', 1, 87, 0),
(88, '32', 2, 88, 1),
(89, '69', 5, 89, 0),
(90, '67', 5, 90, 1),
(91, '95', 1, 91, 1),
(92, '10', 4, 92, 0),
(93, '55', 3, 93, 1),
(94, '49', 5, 94, 1),
(95, '30', 4, 95, 0),
(96, '76', 1, 96, 0),
(97, '65', 4, 97, 0),
(98, '66', 5, 98, 1),
(99, '96', 4, 99, 1),
(100, '96', 4, 100, 0),
(101, '74', 5, 101, 1),
(102, '10', 1, 102, 1),
(103, '29', 2, 103, 0),
(104, '31', 1, 104, 0),
(105, '95', 5, 105, 1),
(106, '44', 5, 106, 0),
(107, '85', 4, 107, 0),
(108, '39', 3, 108, 0),
(109, '37', 1, 109, 1),
(110, '34', 4, 110, 1),
(111, '65', 3, 111, 0),
(112, '5', 2, 112, 1),
(113, '73', 2, 113, 0),
(114, '95', 1, 114, 1),
(115, '62', 4, 115, 0),
(116, '3', 2, 116, 0),
(117, '72', 1, 117, 1),
(118, '49', 5, 118, 1),
(119, '65', 2, 119, 0),
(120, '54', 2, 120, 1),
(121, '13', 1, 121, 0),
(122, '8', 3, 122, 0),
(123, '18', 5, 123, 1),
(124, '1', 5, 124, 0),
(125, '24', 2, 125, 1),
(126, '27', 5, 126, 0),
(127, '22', 4, 127, 0),
(128, '29', 5, 128, 0),
(129, '61', 4, 129, 1),
(130, '0', 5, 130, 0),
(131, '83', 1, 131, 1),
(132, '4', 3, 132, 1),
(133, '27', 5, 133, 1),
(134, '63', 5, 134, 1),
(135, '65', 1, 135, 1),
(136, '20', 3, 136, 1),
(137, '37', 5, 137, 1),
(138, '37', 1, 138, 0),
(139, '85', 2, 139, 0),
(140, '1', 1, 140, 1),
(141, '31', 2, 141, 1),
(142, '52', 4, 142, 0),
(143, '18', 3, 143, 1),
(144, '19', 4, 144, 0),
(145, '0', 3, 145, 0),
(146, '38', 3, 146, 0),
(147, '49', 1, 147, 0),
(148, '78', 3, 148, 1),
(149, '90', 2, 149, 1),
(150, '33', 3, 150, 0),
(151, '19', 4, 151, 1),
(152, '79', 5, 152, 1),
(153, '55', 4, 153, 0),
(154, '41', 2, 154, 0),
(155, '34', 2, 155, 1),
(156, '54', 2, 156, 0),
(157, '39', 5, 157, 1),
(158, '55', 2, 158, 1),
(159, '0', 1, 159, 0),
(160, '7', 1, 160, 0),
(161, '43', 3, 161, 1),
(162, '99', 2, 162, 1),
(163, '23', 3, 163, 0),
(164, '39', 2, 164, 1),
(165, '7', 5, 165, 0),
(166, '43', 2, 166, 0),
(167, '16', 3, 167, 0),
(168, '96', 4, 168, 1),
(169, '72', 3, 169, 1),
(170, '67', 2, 170, 1),
(171, '91', 4, 171, 1),
(172, '21', 2, 172, 1),
(173, '18', 5, 173, 0),
(174, '8', 5, 174, 0),
(175, '70', 2, 175, 1),
(176, '92', 2, 176, 0),
(177, '10', 3, 177, 0),
(178, '57', 5, 178, 0),
(179, '24', 4, 179, 0),
(180, '49', 1, 180, 0),
(181, '99', 1, 181, 1),
(182, '60', 4, 182, 1),
(183, '61', 2, 183, 0),
(184, '55', 5, 184, 1),
(185, '30', 1, 185, 0),
(186, '13', 4, 186, 1),
(187, '70', 5, 187, 1),
(188, '58', 3, 188, 1),
(189, '15', 1, 189, 0),
(190, '91', 3, 190, 1),
(191, '93', 5, 191, 0),
(192, '23', 1, 192, 1),
(193, '20', 1, 193, 0),
(194, '14', 1, 194, 0),
(195, '49', 1, 195, 1),
(196, '66', 3, 196, 0),
(197, '48', 4, 197, 1),
(198, '29', 1, 198, 0),
(199, '38', 2, 199, 0),
(200, '43', 3, 200, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birthDay` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `roleId`, `firstName`, `lastName`, `dni`, `gender`, `birthDay`, `email`, `phoneNumber`) VALUES
(1, 1, 'Devlen', 'Douthwaite', '15-992-860', 'Genderqueer', '2021-06-28', 'ddouthwaite0@goo.gl', '849-713-4523'),
(2, 1, 'Wyatan', 'Lorant', '63-025-811', 'Non-binary', '2021-02-23', 'wlorant1@sbwire.com', '171-448-9062'),
(3, 1, 'Alanson', 'Seemmonds', '06-684-010', 'Agender', '2021-07-03', 'aseemmonds2@upenn.edu', '961-404-8720'),
(4, 1, 'Elvin', 'Diben', '25-552-706', 'Agender', '2020-09-29', 'ediben3@multiply.com', '337-480-1652'),
(5, 1, 'Darsey', 'Hasely', '38-798-862', 'Bigender', '2021-03-14', 'dhasely4@blinklist.com', '936-600-0486'),
(6, 1, 'Whitby', 'Alelsandrowicz', '85-506-842', 'Male', '2020-09-25', 'walelsandrowicz5@nasa.gov', '328-137-1386'),
(7, 1, 'Kienan', 'Witheford', '03-800-826', 'Bigender', '2021-09-15', 'kwitheford6@salon.com', '525-769-1695'),
(8, 1, 'Isidor', 'Aberdalgy', '26-149-203', 'Bigender', '2021-09-06', 'iaberdalgy7@mlb.com', '977-660-8938'),
(9, 1, 'Grier', 'Castle', '53-191-500', 'Polygender', '2021-08-30', 'gcastle8@hexun.com', '904-335-2660'),
(10, 1, 'Son', 'Forrington', '62-447-442', 'Male', '2021-03-13', 'sforrington9@webnode.com', '720-205-4748'),
(11, 1, 'Sapphire', 'Jantet', '86-635-344', 'Bigender', '2021-03-14', 'sjanteta@businessinsider.com', '860-103-9915'),
(12, 1, 'Jori', 'Doring', '81-077-985', 'Polygender', '2021-04-12', 'jdoringb@un.org', '414-609-3692'),
(13, 1, 'Jamey', 'Yaxley', '50-772-831', 'Genderqueer', '2021-03-09', 'jyaxleyc@ifeng.com', '595-862-1690'),
(14, 1, 'Sasha', 'Laxson', '05-910-708', 'Agender', '2020-10-02', 'slaxsond@squarespace.com', '174-737-9358'),
(15, 1, 'Bartholomew', 'Van Daalen', '25-669-140', 'Genderqueer', '2021-06-24', 'bvandaalene@sphinn.com', '267-278-5971'),
(16, 1, 'Annamaria', 'Crannage', '56-601-974', 'Female', '2021-08-09', 'acrannagef@baidu.com', '126-254-6195'),
(17, 1, 'Frayda', 'Gorvette', '52-405-288', 'Non-binary', '2021-07-05', 'fgorvetteg@list-manage.com', '152-846-1928'),
(18, 1, 'Ondrea', 'Webburn', '92-770-579', 'Non-binary', '2021-08-19', 'owebburnh@google.co.uk', '598-324-4986'),
(19, 1, 'Talia', 'Petersen', '66-290-759', 'Female', '2021-05-11', 'tpeterseni@nydailynews.com', '138-603-2531'),
(20, 1, 'Judie', 'Brunton', '39-063-573', 'Bigender', '2020-09-27', 'jbruntonj@imageshack.us', '241-206-2755'),
(21, 1, 'Lara', 'Syne', '58-550-219', 'Agender', '2020-10-19', 'lsynek@msn.com', '812-829-3352'),
(22, 1, 'Theda', 'Thompstone', '19-852-186', 'Female', '2021-02-06', 'tthompstonel@unblog.fr', '581-862-8307'),
(23, 1, 'Marline', 'Vasilischev', '55-935-526', 'Genderfluid', '2021-09-15', 'mvasilischevm@123-reg.co.uk', '758-919-0671'),
(24, 1, 'Kyrstin', 'Heisman', '56-875-390', 'Non-binary', '2021-05-07', 'kheismann@purevolume.com', '687-607-3859'),
(25, 1, 'Brande', 'Strivens', '10-415-456', 'Female', '2021-02-17', 'bstrivenso@surveymonkey.com', '411-285-2703'),
(26, 1, 'Rhodia', 'Haller', '54-718-300', 'Bigender', '2021-09-07', 'rhallerp@free.fr', '964-943-9988'),
(27, 1, 'Russell', 'Geipel', '18-120-522', 'Agender', '2020-10-27', 'rgeipelq@jugem.jp', '533-522-7527'),
(28, 1, 'Hersch', 'Sellen', '85-567-931', 'Genderqueer', '2021-04-16', 'hsellenr@nba.com', '425-253-5570'),
(29, 1, 'Mace', 'Bromidge', '47-216-433', 'Non-binary', '2021-02-05', 'mbromidges@smugmug.com', '306-431-3867'),
(30, 1, 'Harrison', 'Bettington', '75-405-029', 'Male', '2021-08-07', 'hbettingtont@marketwatch.com', '543-608-6067'),
(31, 1, 'Kasey', 'Littrik', '00-985-841', 'Female', '2021-08-09', 'klittriku@army.mil', '776-195-5544'),
(32, 1, 'Irina', 'Simukov', '32-573-128', 'Genderfluid', '2020-10-12', 'isimukovv@bbc.co.uk', '415-385-0195'),
(33, 1, 'Cassie', 'Fysh', '35-351-082', 'Male', '2021-06-21', 'cfyshw@mysql.com', '682-889-8851'),
(34, 1, 'Marris', 'Danzelman', '09-071-328', 'Non-binary', '2021-05-22', 'mdanzelmanx@hhs.gov', '847-391-5838'),
(35, 1, 'Wakefield', 'Dalla', '73-109-635', 'Male', '2021-03-04', 'wdallay@printfriendly.com', '767-735-0534'),
(36, 1, 'Peg', 'Johnes', '66-498-079', 'Agender', '2021-06-03', 'pjohnesz@columbia.edu', '945-808-3754'),
(37, 1, 'Kizzee', 'Offiler', '00-350-837', 'Agender', '2020-11-20', 'koffiler10@youku.com', '703-628-6849'),
(38, 1, 'Beret', 'Poyner', '50-644-338', 'Bigender', '2021-08-14', 'bpoyner11@php.net', '688-583-4742'),
(39, 1, 'Obadias', 'Louys', '42-393-738', 'Genderfluid', '2021-04-26', 'olouys12@army.mil', '365-275-7347'),
(40, 1, 'Sharia', 'Leary', '64-212-316', 'Female', '2020-11-01', 'sleary13@eventbrite.com', '343-120-7321'),
(41, 1, 'Bunny', 'Benham', '27-441-689', 'Polygender', '2020-10-17', 'bbenham14@vimeo.com', '971-848-4265'),
(42, 1, 'Gifford', 'McGarel', '24-962-377', 'Female', '2021-03-11', 'gmcgarel15@disqus.com', '371-171-1943'),
(43, 1, 'Katharyn', 'O\'Donoghue', '34-717-498', 'Female', '2020-09-29', 'kodonoghue16@vinaora.com', '675-855-8792'),
(44, 1, 'Alexi', 'Knowlys', '95-474-333', 'Female', '2021-03-30', 'aknowlys17@unicef.org', '647-835-8682'),
(45, 1, 'Marven', 'Spilsbury', '76-803-488', 'Genderqueer', '2021-01-29', 'mspilsbury18@gravatar.com', '161-726-5357'),
(46, 1, 'Esme', 'Atyeo', '96-988-154', 'Genderqueer', '2021-01-19', 'eatyeo19@nba.com', '604-138-2728'),
(47, 1, 'Gunner', 'Hilland', '10-527-691', 'Agender', '2021-04-28', 'ghilland1a@mit.edu', '708-702-4402'),
(48, 1, 'Dorie', 'Philot', '65-663-702', 'Polygender', '2021-08-11', 'dphilot1b@kickstarter.com', '168-403-8062'),
(49, 1, 'Yance', 'Raynham', '79-563-165', 'Female', '2020-11-05', 'yraynham1c@studiopress.com', '369-540-5290'),
(50, 1, 'Gerick', 'Hruska', '57-616-036', 'Polygender', '2021-07-31', 'ghruska1d@zimbio.com', '375-200-9564'),
(51, 1, 'Morgen', 'Labroue', '44-168-705', 'Non-binary', '2020-12-05', 'mlabroue1e@webeden.co.uk', '254-542-2439'),
(52, 1, 'Calypso', 'Snelgar', '36-361-061', 'Genderfluid', '2021-05-29', 'csnelgar1f@etsy.com', '511-192-9263'),
(53, 1, 'Zach', 'Jurek', '99-564-035', 'Male', '2021-07-23', 'zjurek1g@indiegogo.com', '772-700-7304'),
(54, 1, 'Darwin', 'Michurin', '53-383-166', 'Genderfluid', '2021-08-25', 'dmichurin1h@msn.com', '571-480-7716'),
(55, 1, 'Eba', 'Jeskins', '59-545-548', 'Male', '2021-06-15', 'ejeskins1i@forbes.com', '628-593-0925'),
(56, 1, 'Weidar', 'Yaxley', '58-116-655', 'Female', '2021-01-22', 'wyaxley1j@cargocollective.com', '319-587-6296'),
(57, 1, 'Thornie', 'Bassam', '62-194-862', 'Polygender', '2021-04-15', 'tbassam1k@rediff.com', '847-461-4910'),
(58, 1, 'Fran', 'Beardsley', '10-540-609', 'Polygender', '2021-07-18', 'fbeardsley1l@berkeley.edu', '128-308-3463'),
(59, 1, 'Balduin', 'Sooper', '29-897-935', 'Polygender', '2021-03-31', 'bsooper1m@nba.com', '649-524-7466'),
(60, 1, 'Binky', 'Snoden', '78-390-797', 'Male', '2021-09-22', 'bsnoden1n@nydailynews.com', '901-495-3237'),
(61, 1, 'Melody', 'Avrahamy', '60-142-167', 'Bigender', '2021-03-28', 'mavrahamy1o@mapy.cz', '186-463-5122'),
(62, 1, 'Maryjane', 'Haestier', '76-067-913', 'Genderfluid', '2020-11-29', 'mhaestier1p@constantcontact.com', '118-132-5905'),
(63, 1, 'Annissa', 'Dobing', '10-164-551', 'Genderqueer', '2020-12-30', 'adobing1q@hostgator.com', '649-157-3136'),
(64, 1, 'Gerry', 'Hullett', '86-004-072', 'Non-binary', '2020-12-16', 'ghullett1r@smugmug.com', '966-302-3954'),
(65, 1, 'Karlis', 'Izkovitz', '67-119-919', 'Genderfluid', '2021-05-11', 'kizkovitz1s@mac.com', '262-601-0659'),
(66, 1, 'Tadeo', 'Shears', '74-609-661', 'Male', '2020-11-12', 'tshears1t@icq.com', '303-218-7999'),
(67, 1, 'Aymer', 'Bruineman', '98-226-680', 'Agender', '2020-12-18', 'abruineman1u@typepad.com', '469-982-7985'),
(68, 1, 'Neel', 'Yven', '55-697-891', 'Agender', '2020-12-04', 'nyven1v@unicef.org', '106-171-8503'),
(69, 1, 'Star', 'Annis', '09-226-360', 'Bigender', '2021-04-30', 'sannis1w@cnn.com', '145-198-0335'),
(70, 1, 'Giorgi', 'Brabyn', '34-540-737', 'Bigender', '2021-08-28', 'gbrabyn1x@moonfruit.com', '969-271-8721'),
(71, 1, 'Betsey', 'Glanfield', '88-525-837', 'Bigender', '2021-03-12', 'bglanfield1y@globo.com', '903-991-3132'),
(72, 1, 'Travus', 'Stuehmeier', '35-742-860', 'Polygender', '2021-06-19', 'tstuehmeier1z@privacy.gov.au', '901-727-3778'),
(73, 1, 'Tadio', 'Millmoe', '88-893-272', 'Polygender', '2021-09-16', 'tmillmoe20@blogspot.com', '992-568-7663'),
(74, 1, 'Antonie', 'Gannicleff', '27-309-893', 'Agender', '2020-10-03', 'agannicleff21@livejournal.com', '858-907-0753'),
(75, 1, 'Gonzalo', 'De Pietri', '68-043-294', 'Non-binary', '2020-10-06', 'gdepietri22@github.io', '607-464-2013'),
(76, 1, 'Pammie', 'Friman', '37-754-247', 'Bigender', '2020-11-12', 'pfriman23@columbia.edu', '492-691-2537'),
(77, 1, 'Tracie', 'Vreiberg', '42-052-818', 'Bigender', '2021-07-14', 'tvreiberg24@state.tx.us', '569-585-2167'),
(78, 1, 'Trixy', 'Beagles', '25-872-366', 'Agender', '2021-05-31', 'tbeagles25@gov.uk', '994-971-1461'),
(79, 1, 'Aidan', 'McGlashan', '18-411-277', 'Agender', '2020-10-11', 'amcglashan26@washingtonpost.com', '488-672-3631'),
(80, 1, 'Rudiger', 'Bainbridge', '62-199-159', 'Bigender', '2021-02-10', 'rbainbridge27@delicious.com', '614-601-7046'),
(81, 1, 'Zaria', 'Shepley', '58-348-370', 'Bigender', '2021-07-22', 'zshepley28@typepad.com', '902-436-1480'),
(82, 1, 'Linnie', 'Jocic', '62-388-768', 'Polygender', '2021-01-15', 'ljocic29@economist.com', '356-793-8759'),
(83, 1, 'Charleen', 'Waylen', '29-994-063', 'Non-binary', '2021-06-22', 'cwaylen2a@princeton.edu', '526-290-6310'),
(84, 1, 'Kelbee', 'de Vaen', '38-139-848', 'Genderfluid', '2021-04-27', 'kdevaen2b@usgs.gov', '640-502-4617'),
(85, 1, 'Rafe', 'Reckhouse', '45-903-583', 'Female', '2021-08-07', 'rreckhouse2c@cnn.com', '101-527-3576'),
(86, 1, 'Beverie', 'Gilby', '21-203-542', 'Female', '2021-05-23', 'bgilby2d@usda.gov', '696-388-0069'),
(87, 1, 'Calli', 'Sutliff', '81-223-598', 'Agender', '2021-06-22', 'csutliff2e@ihg.com', '925-140-1998'),
(88, 1, 'Milissent', 'Devil', '81-313-129', 'Non-binary', '2021-01-17', 'mdevil2f@ox.ac.uk', '248-921-6676'),
(89, 1, 'Ursuline', 'Eighteen', '46-217-685', 'Male', '2021-02-28', 'ueighteen2g@twitpic.com', '820-769-0779'),
(90, 1, 'Tildy', 'Turmall', '41-971-200', 'Genderfluid', '2020-09-25', 'tturmall2h@newsvine.com', '488-931-4301'),
(91, 1, 'Bert', 'Blew', '39-342-877', 'Male', '2020-09-26', 'bblew2i@biglobe.ne.jp', '828-834-1196'),
(92, 1, 'Jennilee', 'Sabathe', '18-651-684', 'Agender', '2021-05-22', 'jsabathe2j@studiopress.com', '721-457-9122'),
(93, 1, 'Ethelyn', 'Zipsell', '20-882-412', 'Genderfluid', '2020-11-27', 'ezipsell2k@nymag.com', '188-708-3056'),
(94, 1, 'Skyler', 'Whiteside', '59-003-276', 'Genderqueer', '2020-11-27', 'swhiteside2l@pbs.org', '967-927-0327'),
(95, 1, 'Franchot', 'Stave', '62-422-418', 'Male', '2021-03-26', 'fstave2m@ezinearticles.com', '399-493-0794'),
(96, 1, 'Bettine', 'Tonner', '20-726-835', 'Non-binary', '2020-12-29', 'btonner2n@diigo.com', '120-371-4961'),
(97, 1, 'Antons', 'Colaco', '09-249-288', 'Female', '2021-07-31', 'acolaco2o@shop-pro.jp', '425-810-4447'),
(98, 1, 'Esdras', 'Dalgety', '89-007-877', 'Genderqueer', '2021-07-03', 'edalgety2p@cornell.edu', '829-518-6610'),
(99, 1, 'Kathlin', 'Bonnett', '78-552-326', 'Male', '2021-09-16', 'kbonnett2q@tmall.com', '627-902-1623'),
(100, 1, 'Fredia', 'Deave', '11-441-489', 'Genderfluid', '2021-05-28', 'fdeave2r@wix.com', '826-543-3453'),
(101, 1, 'Read', 'Crimp', '87-834-889', 'Polygender', '2021-07-20', 'rcrimp2s@posterous.com', '300-596-9167'),
(102, 1, 'Ermin', 'Goves', '42-485-482', 'Polygender', '2021-07-19', 'egoves2t@squarespace.com', '988-703-4660'),
(103, 1, 'Boyd', 'Scemp', '15-881-626', 'Genderfluid', '2021-07-20', 'bscemp2u@tumblr.com', '687-360-6606'),
(104, 1, 'Kareem', 'Burn', '28-005-814', 'Male', '2021-09-02', 'kburn2v@arstechnica.com', '530-613-3865'),
(105, 1, 'Leo', 'Spight', '17-631-688', 'Male', '2021-08-15', 'lspight2w@examiner.com', '242-192-0925'),
(106, 1, 'Herve', 'Bradder', '18-818-749', 'Non-binary', '2021-03-27', 'hbradder2x@ibm.com', '344-574-1632'),
(107, 1, 'Lynea', 'Hunn', '88-822-096', 'Non-binary', '2021-06-07', 'lhunn2y@cbslocal.com', '313-213-0165'),
(108, 1, 'Bibbie', 'Hamilton', '84-349-336', 'Female', '2020-11-24', 'bhamilton2z@ezinearticles.com', '550-811-8535'),
(109, 1, 'Liana', 'Cockill', '26-554-712', 'Polygender', '2021-08-16', 'lcockill30@time.com', '296-278-1935'),
(110, 1, 'Natty', 'Southwick', '50-122-326', 'Bigender', '2021-07-12', 'nsouthwick31@cargocollective.com', '881-814-3989'),
(111, 1, 'Aluin', 'Petran', '69-860-053', 'Bigender', '2020-11-05', 'apetran32@yahoo.com', '917-438-0078'),
(112, 1, 'Dudley', 'Shilburne', '96-041-846', 'Genderfluid', '2021-05-03', 'dshilburne33@zimbio.com', '975-792-2824'),
(113, 1, 'Malvin', 'Delhay', '74-274-541', 'Genderqueer', '2021-01-04', 'mdelhay34@irs.gov', '815-902-4143'),
(114, 1, 'Melisent', 'Sket', '10-248-407', 'Non-binary', '2021-06-02', 'msket35@dmoz.org', '131-365-3935'),
(115, 1, 'Mair', 'Kowalski', '65-226-922', 'Bigender', '2021-08-12', 'mkowalski36@hc360.com', '875-401-6852'),
(116, 1, 'Claudetta', 'Flewan', '07-965-343', 'Agender', '2021-08-21', 'cflewan37@rediff.com', '116-810-7043'),
(117, 1, 'Tirrell', 'Ethelston', '43-174-912', 'Female', '2021-07-20', 'tethelston38@samsung.com', '271-502-2244'),
(118, 1, 'Darby', 'De Simoni', '93-158-686', 'Bigender', '2020-12-06', 'ddesimoni39@surveymonkey.com', '246-502-4545'),
(119, 1, 'Hannis', 'Antic', '73-517-412', 'Female', '2021-06-14', 'hantic3a@fotki.com', '635-152-6564'),
(120, 1, 'Tadeo', 'Turbayne', '14-771-934', 'Female', '2021-05-28', 'tturbayne3b@apache.org', '323-395-0040'),
(121, 1, 'Filip', 'Bilam', '18-228-943', 'Agender', '2021-08-20', 'fbilam3c@auda.org.au', '396-536-7478'),
(122, 1, 'Betteanne', 'Honnicott', '98-149-324', 'Bigender', '2021-05-10', 'bhonnicott3d@amazon.de', '996-124-9094'),
(123, 1, 'Winny', 'Rawne', '11-079-358', 'Bigender', '2021-08-04', 'wrawne3e@phpbb.com', '784-509-5500'),
(124, 1, 'Tomlin', 'Chessum', '34-259-875', 'Male', '2021-09-19', 'tchessum3f@chicagotribune.com', '981-831-1449'),
(125, 1, 'Koralle', 'Iddison', '40-064-373', 'Male', '2020-11-12', 'kiddison3g@usnews.com', '418-438-4982'),
(126, 1, 'Cookie', 'Le Grice', '52-779-770', 'Male', '2021-09-07', 'clegrice3h@parallels.com', '642-929-9923'),
(127, 1, 'Dorthea', 'Kinkead', '69-441-287', 'Male', '2020-09-29', 'dkinkead3i@tinypic.com', '478-475-7057'),
(128, 1, 'Howey', 'Bruckstein', '36-375-178', 'Bigender', '2020-12-30', 'hbruckstein3j@ow.ly', '610-756-6491'),
(129, 1, 'Ignace', 'Mansfield', '43-252-738', 'Female', '2021-08-22', 'imansfield3k@amazonaws.com', '485-876-5605'),
(130, 1, 'Nehemiah', 'Metzke', '98-360-618', 'Genderqueer', '2021-06-11', 'nmetzke3l@cargocollective.com', '876-319-3747'),
(131, 1, 'Lynea', 'Littlechild', '89-529-123', 'Male', '2021-06-25', 'llittlechild3m@europa.eu', '460-395-6975'),
(132, 1, 'Velma', 'Iacofo', '84-140-045', 'Bigender', '2021-02-17', 'viacofo3n@github.com', '153-170-3448'),
(133, 1, 'Leland', 'Choulerton', '74-357-237', 'Female', '2021-03-07', 'lchoulerton3o@cyberchimps.com', '387-858-5444'),
(134, 1, 'Rodrick', 'D\'Alessio', '27-650-942', 'Male', '2021-04-27', 'rdalessio3p@prnewswire.com', '371-769-6875'),
(135, 1, 'Rosalynd', 'Gouny', '76-645-789', 'Male', '2021-04-01', 'rgouny3q@yellowbook.com', '146-632-7102'),
(136, 1, 'Hermon', 'Crudgington', '02-484-635', 'Male', '2020-11-02', 'hcrudgington3r@aboutads.info', '214-172-6385'),
(137, 1, 'Ranique', 'Bonus', '37-114-591', 'Bigender', '2020-10-03', 'rbonus3s@cnn.com', '530-875-5915'),
(138, 1, 'Genni', 'Fish', '73-715-237', 'Genderqueer', '2021-04-06', 'gfish3t@shutterfly.com', '250-677-4442'),
(139, 1, 'Fredericka', 'Goodey', '92-340-359', 'Genderfluid', '2021-01-16', 'fgoodey3u@bandcamp.com', '260-141-9667'),
(140, 1, 'Gabey', 'Scoggan', '37-206-031', 'Agender', '2020-11-26', 'gscoggan3v@t.co', '924-769-3310'),
(141, 1, 'Luciana', 'Penburton', '46-638-623', 'Genderqueer', '2021-09-15', 'lpenburton3w@joomla.org', '344-134-4871'),
(142, 1, 'Eugen', 'Dunphy', '65-917-417', 'Polygender', '2021-03-11', 'edunphy3x@census.gov', '165-945-4956'),
(143, 1, 'Gertrudis', 'McGillivray', '12-086-327', 'Genderqueer', '2021-06-12', 'gmcgillivray3y@mediafire.com', '833-449-3661'),
(144, 1, 'Yvor', 'Tucknott', '70-198-770', 'Agender', '2021-01-21', 'ytucknott3z@sogou.com', '370-149-7338'),
(145, 1, 'Adelle', 'Rilton', '67-791-339', 'Genderqueer', '2021-09-24', 'arilton40@merriam-webster.com', '483-562-7792'),
(146, 1, 'Saudra', 'Strongman', '29-136-142', 'Genderqueer', '2020-11-25', 'sstrongman41@skype.com', '961-561-9646'),
(147, 1, 'Gracie', 'Webb-Bowen', '83-459-897', 'Agender', '2021-03-14', 'gwebbbowen42@t.co', '836-256-7957'),
(148, 1, 'Becki', 'Mullen', '68-837-166', 'Polygender', '2021-01-26', 'bmullen43@last.fm', '641-224-2494'),
(149, 1, 'Swen', 'Thirst', '43-665-399', 'Female', '2020-10-30', 'sthirst44@comsenz.com', '797-402-2816'),
(150, 1, 'Issie', 'Gainforth', '98-422-855', 'Genderfluid', '2021-09-15', 'igainforth45@hubpages.com', '670-349-1455'),
(151, 1, 'Kaycee', 'Morfell', '91-629-313', 'Bigender', '2021-08-23', 'kmorfell46@slate.com', '915-593-9589'),
(152, 1, 'Jessie', 'Fakeley', '55-654-924', 'Non-binary', '2021-02-01', 'jfakeley47@ning.com', '807-724-1840'),
(153, 1, 'Dania', 'Lebbon', '09-468-689', 'Genderqueer', '2021-02-23', 'dlebbon48@virginia.edu', '970-161-7429'),
(154, 1, 'Robinson', 'Delamere', '97-037-897', 'Agender', '2021-01-08', 'rdelamere49@mtv.com', '459-182-2906'),
(155, 1, 'Letta', 'Costall', '80-792-088', 'Female', '2021-05-04', 'lcostall4a@alibaba.com', '107-342-4871'),
(156, 1, 'Billie', 'Cherrett', '92-009-178', 'Bigender', '2021-05-24', 'bcherrett4b@aboutads.info', '663-263-2110'),
(157, 1, 'Mannie', 'Stone', '14-352-273', 'Female', '2020-10-13', 'mstone4c@infoseek.co.jp', '821-347-9937'),
(158, 1, 'Yance', 'Henrique', '32-938-080', 'Female', '2021-03-03', 'yhenrique4d@wired.com', '238-174-5782'),
(159, 1, 'Willabella', 'Mc Harg', '40-113-701', 'Genderqueer', '2021-04-18', 'wmcharg4e@reddit.com', '848-998-3882'),
(160, 1, 'Stoddard', 'Brittlebank', '94-833-347', 'Polygender', '2021-03-09', 'sbrittlebank4f@cornell.edu', '616-391-9245'),
(161, 1, 'Grayce', 'Autin', '60-273-701', 'Polygender', '2021-07-01', 'gautin4g@ucoz.com', '615-247-7087'),
(162, 1, 'Caritta', 'Vaudin', '39-815-891', 'Polygender', '2021-06-25', 'cvaudin4h@businesswire.com', '549-755-1391'),
(163, 1, 'Riki', 'Wasselin', '94-012-087', 'Agender', '2021-04-05', 'rwasselin4i@theguardian.com', '369-853-4412'),
(164, 1, 'Betsy', 'Skrzynski', '09-812-053', 'Genderqueer', '2021-07-29', 'bskrzynski4j@feedburner.com', '612-173-5472'),
(165, 1, 'Zachariah', 'Farrans', '51-857-090', 'Polygender', '2020-11-13', 'zfarrans4k@forbes.com', '814-918-8343'),
(166, 1, 'Brewster', 'Pouton', '95-706-179', 'Male', '2020-12-09', 'bpouton4l@yellowpages.com', '616-120-6191'),
(167, 1, 'Sal', 'Goncaves', '87-220-504', 'Polygender', '2021-08-18', 'sgoncaves4m@symantec.com', '599-511-2518'),
(168, 1, 'Kareem', 'McIlmorow', '47-548-562', 'Female', '2021-08-12', 'kmcilmorow4n@yandex.ru', '650-134-2767'),
(169, 1, 'Jenda', 'Carlens', '63-318-648', 'Polygender', '2021-03-23', 'jcarlens4o@google.ca', '146-586-2597'),
(170, 1, 'Ruthy', 'Airdrie', '94-620-448', 'Female', '2020-09-27', 'rairdrie4p@topsy.com', '770-417-6639'),
(171, 1, 'Araldo', 'Nannoni', '05-894-812', 'Genderqueer', '2021-05-02', 'anannoni4q@vimeo.com', '811-955-4367'),
(172, 1, 'Angie', 'Dyas', '71-260-690', 'Male', '2021-04-13', 'adyas4r@earthlink.net', '831-473-4363'),
(173, 1, 'Sheelagh', 'Flindall', '49-368-875', 'Female', '2021-05-20', 'sflindall4s@mediafire.com', '283-860-7535'),
(174, 1, 'Jarid', 'Tidridge', '13-917-710', 'Agender', '2021-06-15', 'jtidridge4t@posterous.com', '176-889-1935'),
(175, 1, 'Syman', 'Dowglass', '90-232-208', 'Female', '2021-07-30', 'sdowglass4u@foxnews.com', '529-675-9277'),
(176, 1, 'Norine', 'Brimelow', '31-723-519', 'Bigender', '2021-06-10', 'nbrimelow4v@pagesperso-orange.fr', '265-863-6907'),
(177, 1, 'Rudolf', 'Szymonwicz', '60-389-138', 'Bigender', '2021-09-03', 'rszymonwicz4w@who.int', '545-893-1140'),
(178, 1, 'Ricky', 'Runnacles', '67-524-826', 'Bigender', '2021-09-13', 'rrunnacles4x@tripadvisor.com', '676-627-8556'),
(179, 1, 'Kimberly', 'Piris', '74-384-375', 'Bigender', '2021-01-03', 'kpiris4y@chicagotribune.com', '121-697-3551'),
(180, 1, 'Harman', 'Eckery', '73-212-259', 'Polygender', '2021-05-25', 'heckery4z@businessweek.com', '731-857-3248'),
(181, 1, 'Antoni', 'Braiden', '50-498-114', 'Polygender', '2021-03-10', 'abraiden50@hibu.com', '177-622-7559'),
(182, 1, 'Sebastien', 'Blaisdell', '98-669-886', 'Male', '2020-12-14', 'sblaisdell51@jiathis.com', '536-262-5430'),
(183, 1, 'Aubrey', 'Evanson', '76-629-609', 'Genderqueer', '2021-07-09', 'aevanson52@icq.com', '427-902-6345'),
(184, 1, 'Rorke', 'Ramos', '85-144-756', 'Genderqueer', '2021-01-10', 'rramos53@ucla.edu', '178-560-0180'),
(185, 1, 'Belle', 'Antoszczyk', '71-344-903', 'Bigender', '2020-11-19', 'bantoszczyk54@addthis.com', '931-894-0632'),
(186, 1, 'Rea', 'Langelaan', '75-497-028', 'Genderfluid', '2020-10-08', 'rlangelaan55@printfriendly.com', '917-763-3318'),
(187, 1, 'Renato', 'Mitie', '42-179-991', 'Bigender', '2021-09-23', 'rmitie56@hugedomains.com', '700-745-1419'),
(188, 1, 'Tod', 'Storry', '45-451-586', 'Bigender', '2021-09-09', 'tstorry57@google.cn', '595-495-7291'),
(189, 1, 'Frederich', 'Adelsberg', '45-650-373', 'Agender', '2021-04-15', 'fadelsberg58@about.com', '793-798-5222'),
(190, 1, 'Franciska', 'Degan', '77-753-510', 'Female', '2021-05-04', 'fdegan59@europa.eu', '831-536-2866'),
(191, 1, 'Meridith', 'Langham', '48-779-509', 'Genderqueer', '2021-07-08', 'mlangham5a@moonfruit.com', '654-825-5795'),
(192, 1, 'Essa', 'Goldsworthy', '62-206-247', 'Male', '2021-03-25', 'egoldsworthy5b@narod.ru', '518-971-3092'),
(193, 1, 'Paola', 'Maleby', '89-275-989', 'Genderqueer', '2021-04-13', 'pmaleby5c@ucoz.ru', '253-509-2968'),
(194, 1, 'Sydelle', 'Avon', '20-444-092', 'Genderfluid', '2021-02-20', 'savon5d@chicagotribune.com', '694-533-7844'),
(195, 1, 'Beaufort', 'Shorthill', '18-735-907', 'Genderqueer', '2021-02-07', 'bshorthill5e@blogs.com', '412-472-8296'),
(196, 1, 'Ronnie', 'Gummie', '53-420-642', 'Genderqueer', '2021-03-29', 'rgummie5f@xinhuanet.com', '581-207-7981'),
(197, 1, 'Tymon', 'Nazer', '40-384-793', 'Male', '2020-12-11', 'tnazer5g@google.de', '535-177-9395'),
(198, 1, 'Basilio', 'Merle', '85-589-115', 'Male', '2020-09-26', 'bmerle5h@jiathis.com', '101-915-3491'),
(199, 1, 'Terra', 'Kitson', '03-745-847', 'Polygender', '2021-06-14', 'tkitson5i@mashable.com', '633-303-0830'),
(200, 1, 'Ellary', 'Cordelette', '16-890-138', 'Bigender', '2021-04-08', 'ecordelette5j@umich.edu', '411-950-1338');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`careerId`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`companyId`);

--
-- Indices de la tabla `joboffers`
--
ALTER TABLE `joboffers`
  ADD PRIMARY KEY (`jobOfferId`),
  ADD KEY `companyId` (`companyId`),
  ADD KEY `careerId` (`careerId`),
  ADD KEY `jobPositionId` (`jobPositionId`);

--
-- Indices de la tabla `jobpositions`
--
ALTER TABLE `jobpositions`
  ADD PRIMARY KEY (`jobPositionId`),
  ADD KEY `careerId` (`careerId`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentId`),
  ADD KEY `careerId` (`careerId`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `roleId` (`roleId`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `joboffers`
--
ALTER TABLE `joboffers`
  ADD CONSTRAINT `joboffers_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`companyId`),
  ADD CONSTRAINT `joboffers_ibfk_2` FOREIGN KEY (`careerId`) REFERENCES `careers` (`careerId`),
  ADD CONSTRAINT `joboffers_ibfk_3` FOREIGN KEY (`jobPositionId`) REFERENCES `jobpositions` (`jobPositionId`);

--
-- Filtros para la tabla `jobpositions`
--
ALTER TABLE `jobpositions`
  ADD CONSTRAINT `jobpositions_ibfk_1` FOREIGN KEY (`careerId`) REFERENCES `careers` (`careerId`);

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`careerId`) REFERENCES `careers` (`careerId`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

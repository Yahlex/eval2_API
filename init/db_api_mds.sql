-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2023 at 12:20 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_api_mds`
--

-- --------------------------------------------------------

--
-- Table structure for table `adherent`
--

CREATE TABLE `adherent` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adherent`
--

INSERT INTO `adherent` (`id`, `pseudo`, `is_admin`, `password`) VALUES
(1, 'Luffy', 1, 'bef9e21a'),
(2, 'Zoro', 0, '4a255c3f'),
(3, 'Nami', 0, '7212d472'),
(4, 'Usopp', 0, 'a09ee6b1'),
(5, 'Sanji', 0, 'a154f15b'),
(6, 'Chopper', 0, 'a2cb95bf'),
(7, 'Robin', 0, '065de43e'),
(8, 'Franky', 0, 'c6148727'),
(9, 'Brook', 0, '8dd2cec0'),
(10, 'Jinbe', 0, '5724297a'),
(11, 'Ace', 0, '28a6e623'),
(12, 'Sabo', 0, 'da6d8121'),
(13, 'Law', 0, 'f23718d3'),
(14, 'Kid', 0, '638dcc4f'),
(15, 'NicoRobin', 0, '6a92df5f'),
(16, 'Shanks', 0, '79d0e75d'),
(17, 'BoaHancock', 0, '00e855e1'),
(18, 'Doflamingo', 0, 'd2769a6c'),
(19, 'Katakuri', 0, 'c5bf7f0d'),
(20, 'Mihawk', 0, 'a930ba3e'),
(21, 'admybad', 1, 'admybad');

-- --------------------------------------------------------

--
-- Table structure for table `creneaux`
--

CREATE TABLE `creneaux` (
  `id` int(11) NOT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `jour` varchar(255) DEFAULT NULL,
  `terrain_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creneaux`
--

INSERT INTO `creneaux` (`id`, `heure_debut`, `heure_fin`, `jour`, `terrain_id`, `is_active`) VALUES
(1, '10:00:00', '10:45:00', 'Lundi', 9, 1),
(2, '10:00:00', '10:45:00', 'Lundi', 10, 1),
(3, '10:00:00', '10:45:00', 'Lundi', 11, 1),
(4, '10:00:00', '10:45:00', 'Lundi', 12, 1),
(5, '10:00:00', '10:45:00', 'Mardi', 9, 1),
(6, '10:00:00', '10:45:00', 'Mardi', 10, 1),
(7, '10:00:00', '10:45:00', 'Mardi', 11, 1),
(8, '10:00:00', '10:45:00', 'Mardi', 12, 1),
(9, '10:00:00', '10:45:00', 'Mercredi', 9, 1),
(10, '10:00:00', '10:45:00', 'Mercredi', 10, 1),
(11, '10:00:00', '10:45:00', 'Mercredi', 11, 1),
(12, '10:00:00', '10:45:00', 'Mercredi', 12, 1),
(13, '10:00:00', '10:45:00', 'Jeudi', 9, 1),
(14, '10:00:00', '10:45:00', 'Jeudi', 10, 1),
(15, '10:00:00', '10:45:00', 'Jeudi', 11, 1),
(16, '10:00:00', '10:45:00', 'Jeudi', 12, 1),
(17, '10:00:00', '10:45:00', 'Vendredi', 9, 1),
(18, '10:00:00', '10:45:00', 'Vendredi', 10, 1),
(19, '10:00:00', '10:45:00', 'Vendredi', 11, 1),
(20, '10:00:00', '10:45:00', 'Vendredi', 12, 1),
(21, '10:00:00', '10:45:00', 'Samedi', 9, 1),
(22, '10:00:00', '10:45:00', 'Samedi', 10, 1),
(23, '10:00:00', '10:45:00', 'Samedi', 11, 1),
(24, '10:00:00', '10:45:00', 'Samedi', 12, 1),
(25, '10:45:00', '11:30:00', 'Lundi', 9, 1),
(26, '10:45:00', '11:30:00', 'Lundi', 10, 1),
(27, '10:45:00', '11:30:00', 'Lundi', 11, 1),
(28, '10:45:00', '11:30:00', 'Lundi', 12, 1),
(29, '10:45:00', '11:30:00', 'Mardi', 9, 1),
(30, '10:45:00', '11:30:00', 'Mardi', 10, 1),
(31, '10:45:00', '11:30:00', 'Mardi', 11, 1),
(32, '10:45:00', '11:30:00', 'Mardi', 12, 1),
(33, '10:45:00', '11:30:00', 'Mercredi', 9, 1),
(34, '10:45:00', '11:30:00', 'Mercredi', 10, 1),
(35, '10:45:00', '11:30:00', 'Mercredi', 11, 1),
(36, '10:45:00', '11:30:00', 'Mercredi', 12, 1),
(37, '10:45:00', '11:30:00', 'Jeudi', 9, 1),
(38, '10:45:00', '11:30:00', 'Jeudi', 10, 1),
(39, '10:45:00', '11:30:00', 'Jeudi', 11, 1),
(40, '10:45:00', '11:30:00', 'Jeudi', 12, 1),
(41, '10:45:00', '11:30:00', 'Vendredi', 9, 1),
(42, '10:45:00', '11:30:00', 'Vendredi', 10, 1),
(43, '10:45:00', '11:30:00', 'Vendredi', 11, 1),
(44, '10:45:00', '11:30:00', 'Vendredi', 12, 1),
(45, '10:45:00', '11:30:00', 'Samedi', 9, 1),
(46, '10:45:00', '11:30:00', 'Samedi', 10, 1),
(47, '10:45:00', '11:30:00', 'Samedi', 11, 1),
(48, '10:45:00', '11:30:00', 'Samedi', 12, 1),
(49, '11:30:00', '12:15:00', 'Lundi', 9, 1),
(50, '11:30:00', '12:15:00', 'Lundi', 10, 1),
(51, '11:30:00', '12:15:00', 'Lundi', 11, 1),
(52, '11:30:00', '12:15:00', 'Lundi', 12, 1),
(53, '11:30:00', '12:15:00', 'Mardi', 9, 1),
(54, '11:30:00', '12:15:00', 'Mardi', 10, 1),
(55, '11:30:00', '12:15:00', 'Mardi', 11, 1),
(56, '11:30:00', '12:15:00', 'Mardi', 12, 1),
(57, '11:30:00', '12:15:00', 'Mercredi', 9, 1),
(58, '11:30:00', '12:15:00', 'Mercredi', 10, 1),
(59, '11:30:00', '12:15:00', 'Mercredi', 11, 1),
(60, '11:30:00', '12:15:00', 'Mercredi', 12, 1),
(61, '11:30:00', '12:15:00', 'Jeudi', 9, 1),
(62, '11:30:00', '12:15:00', 'Jeudi', 10, 1),
(63, '11:30:00', '12:15:00', 'Jeudi', 11, 1),
(64, '11:30:00', '12:15:00', 'Jeudi', 12, 1),
(65, '11:30:00', '12:15:00', 'Vendredi', 9, 1),
(66, '11:30:00', '12:15:00', 'Vendredi', 10, 1),
(67, '11:30:00', '12:15:00', 'Vendredi', 11, 1),
(68, '11:30:00', '12:15:00', 'Vendredi', 12, 1),
(69, '11:30:00', '12:15:00', 'Samedi', 9, 1),
(70, '11:30:00', '12:15:00', 'Samedi', 10, 1),
(71, '11:30:00', '12:15:00', 'Samedi', 11, 1),
(72, '11:30:00', '12:15:00', 'Samedi', 12, 1),
(73, '12:15:00', '13:00:00', 'Lundi', 9, 1),
(74, '12:15:00', '13:00:00', 'Lundi', 10, 1),
(75, '12:15:00', '13:00:00', 'Lundi', 11, 1),
(76, '12:15:00', '13:00:00', 'Lundi', 12, 1),
(77, '12:15:00', '13:00:00', 'Mardi', 9, 1),
(78, '12:15:00', '13:00:00', 'Mardi', 10, 1),
(79, '12:15:00', '13:00:00', 'Mardi', 11, 1),
(80, '12:15:00', '13:00:00', 'Mardi', 12, 1),
(81, '12:15:00', '13:00:00', 'Mercredi', 9, 1),
(82, '12:15:00', '13:00:00', 'Mercredi', 10, 1),
(83, '12:15:00', '13:00:00', 'Mercredi', 11, 1),
(84, '12:15:00', '13:00:00', 'Mercredi', 12, 1),
(85, '12:15:00', '13:00:00', 'Jeudi', 9, 1),
(86, '12:15:00', '13:00:00', 'Jeudi', 10, 1),
(87, '12:15:00', '13:00:00', 'Jeudi', 11, 1),
(88, '12:15:00', '13:00:00', 'Jeudi', 12, 1),
(89, '12:15:00', '13:00:00', 'Vendredi', 9, 1),
(90, '12:15:00', '13:00:00', 'Vendredi', 10, 1),
(91, '12:15:00', '13:00:00', 'Vendredi', 11, 1),
(92, '12:15:00', '13:00:00', 'Vendredi', 12, 1),
(93, '12:15:00', '13:00:00', 'Samedi', 9, 1),
(94, '12:15:00', '13:00:00', 'Samedi', 10, 1),
(95, '12:15:00', '13:00:00', 'Samedi', 11, 1),
(96, '12:15:00', '13:00:00', 'Samedi', 12, 1),
(97, '13:00:00', '13:45:00', 'Lundi', 9, 1),
(98, '13:00:00', '13:45:00', 'Lundi', 10, 1),
(99, '13:00:00', '13:45:00', 'Lundi', 11, 1),
(100, '13:00:00', '13:45:00', 'Lundi', 12, 1),
(101, '13:00:00', '13:45:00', 'Mardi', 9, 1),
(102, '13:00:00', '13:45:00', 'Mardi', 10, 1),
(103, '13:00:00', '13:45:00', 'Mardi', 11, 1),
(104, '13:00:00', '13:45:00', 'Mardi', 12, 1),
(105, '13:00:00', '13:45:00', 'Mercredi', 9, 1),
(106, '13:00:00', '13:45:00', 'Mercredi', 10, 1),
(107, '13:00:00', '13:45:00', 'Mercredi', 11, 1),
(108, '13:00:00', '13:45:00', 'Mercredi', 12, 1),
(109, '13:00:00', '13:45:00', 'Jeudi', 9, 1),
(110, '13:00:00', '13:45:00', 'Jeudi', 10, 1),
(111, '13:00:00', '13:45:00', 'Jeudi', 11, 1),
(112, '13:00:00', '13:45:00', 'Jeudi', 12, 1),
(113, '13:00:00', '13:45:00', 'Vendredi', 9, 1),
(114, '13:00:00', '13:45:00', 'Vendredi', 10, 1),
(115, '13:00:00', '13:45:00', 'Vendredi', 11, 1),
(116, '13:00:00', '13:45:00', 'Vendredi', 12, 1),
(117, '13:00:00', '13:45:00', 'Samedi', 9, 1),
(118, '13:00:00', '13:45:00', 'Samedi', 10, 1),
(119, '13:00:00', '13:45:00', 'Samedi', 11, 1),
(120, '13:00:00', '13:45:00', 'Samedi', 12, 1),
(121, '13:45:00', '14:30:00', 'Lundi', 9, 1),
(122, '13:45:00', '14:30:00', 'Lundi', 10, 1),
(123, '13:45:00', '14:30:00', 'Lundi', 11, 1),
(124, '13:45:00', '14:30:00', 'Lundi', 12, 1),
(125, '13:45:00', '14:30:00', 'Mardi', 9, 1),
(126, '13:45:00', '14:30:00', 'Mardi', 10, 1),
(127, '13:45:00', '14:30:00', 'Mardi', 11, 1),
(128, '13:45:00', '14:30:00', 'Mardi', 12, 1),
(129, '13:45:00', '14:30:00', 'Mercredi', 9, 1),
(130, '13:45:00', '14:30:00', 'Mercredi', 10, 1),
(131, '13:45:00', '14:30:00', 'Mercredi', 11, 1),
(132, '13:45:00', '14:30:00', 'Mercredi', 12, 1),
(133, '13:45:00', '14:30:00', 'Jeudi', 9, 1),
(134, '13:45:00', '14:30:00', 'Jeudi', 10, 1),
(135, '13:45:00', '14:30:00', 'Jeudi', 11, 1),
(136, '13:45:00', '14:30:00', 'Jeudi', 12, 1),
(137, '13:45:00', '14:30:00', 'Vendredi', 9, 1),
(138, '13:45:00', '14:30:00', 'Vendredi', 10, 1),
(139, '13:45:00', '14:30:00', 'Vendredi', 11, 1),
(140, '13:45:00', '14:30:00', 'Vendredi', 12, 1),
(141, '13:45:00', '14:30:00', 'Samedi', 9, 1),
(142, '13:45:00', '14:30:00', 'Samedi', 10, 1),
(143, '13:45:00', '14:30:00', 'Samedi', 11, 1),
(144, '13:45:00', '14:30:00', 'Samedi', 12, 1),
(145, '14:30:00', '15:15:00', 'Lundi', 9, 1),
(146, '14:30:00', '15:15:00', 'Lundi', 10, 1),
(147, '14:30:00', '15:15:00', 'Lundi', 11, 1),
(148, '14:30:00', '15:15:00', 'Lundi', 12, 1),
(149, '14:30:00', '15:15:00', 'Mardi', 9, 1),
(150, '14:30:00', '15:15:00', 'Mardi', 10, 1),
(151, '14:30:00', '15:15:00', 'Mardi', 11, 1),
(152, '14:30:00', '15:15:00', 'Mardi', 12, 1),
(153, '14:30:00', '15:15:00', 'Mercredi', 9, 1),
(154, '14:30:00', '15:15:00', 'Mercredi', 10, 1),
(155, '14:30:00', '15:15:00', 'Mercredi', 11, 1),
(156, '14:30:00', '15:15:00', 'Mercredi', 12, 1),
(157, '14:30:00', '15:15:00', 'Jeudi', 9, 1),
(158, '14:30:00', '15:15:00', 'Jeudi', 10, 1),
(159, '14:30:00', '15:15:00', 'Jeudi', 11, 1),
(160, '14:30:00', '15:15:00', 'Jeudi', 12, 1),
(161, '14:30:00', '15:15:00', 'Vendredi', 9, 1),
(162, '14:30:00', '15:15:00', 'Vendredi', 10, 1),
(163, '14:30:00', '15:15:00', 'Vendredi', 11, 1),
(164, '14:30:00', '15:15:00', 'Vendredi', 12, 1),
(165, '14:30:00', '15:15:00', 'Samedi', 9, 1),
(166, '14:30:00', '15:15:00', 'Samedi', 10, 1),
(167, '14:30:00', '15:15:00', 'Samedi', 11, 1),
(168, '14:30:00', '15:15:00', 'Samedi', 12, 1),
(169, '15:15:00', '16:00:00', 'Lundi', 9, 1),
(170, '15:15:00', '16:00:00', 'Lundi', 10, 1),
(171, '15:15:00', '16:00:00', 'Lundi', 11, 1),
(172, '15:15:00', '16:00:00', 'Lundi', 12, 1),
(173, '15:15:00', '16:00:00', 'Mardi', 9, 1),
(174, '15:15:00', '16:00:00', 'Mardi', 10, 1),
(175, '15:15:00', '16:00:00', 'Mardi', 11, 1),
(176, '15:15:00', '16:00:00', 'Mardi', 12, 1),
(177, '15:15:00', '16:00:00', 'Mercredi', 9, 1),
(178, '15:15:00', '16:00:00', 'Mercredi', 10, 1),
(179, '15:15:00', '16:00:00', 'Mercredi', 11, 1),
(180, '15:15:00', '16:00:00', 'Mercredi', 12, 1),
(181, '15:15:00', '16:00:00', 'Jeudi', 9, 1),
(182, '15:15:00', '16:00:00', 'Jeudi', 10, 1),
(183, '15:15:00', '16:00:00', 'Jeudi', 11, 1),
(184, '15:15:00', '16:00:00', 'Jeudi', 12, 1),
(185, '15:15:00', '16:00:00', 'Vendredi', 9, 1),
(186, '15:15:00', '16:00:00', 'Vendredi', 10, 1),
(187, '15:15:00', '16:00:00', 'Vendredi', 11, 1),
(188, '15:15:00', '16:00:00', 'Vendredi', 12, 1),
(189, '15:15:00', '16:00:00', 'Samedi', 9, 1),
(190, '15:15:00', '16:00:00', 'Samedi', 10, 1),
(191, '15:15:00', '16:00:00', 'Samedi', 11, 1),
(192, '15:15:00', '16:00:00', 'Samedi', 12, 1),
(193, '16:00:00', '16:45:00', 'Lundi', 9, 1),
(194, '16:00:00', '16:45:00', 'Lundi', 10, 1),
(195, '16:00:00', '16:45:00', 'Lundi', 11, 1),
(196, '16:00:00', '16:45:00', 'Lundi', 12, 1),
(197, '16:00:00', '16:45:00', 'Mardi', 9, 1),
(198, '16:00:00', '16:45:00', 'Mardi', 10, 1),
(199, '16:00:00', '16:45:00', 'Mardi', 11, 1),
(200, '16:00:00', '16:45:00', 'Mardi', 12, 1),
(201, '16:00:00', '16:45:00', 'Mercredi', 9, 1),
(202, '16:00:00', '16:45:00', 'Mercredi', 10, 1),
(203, '16:00:00', '16:45:00', 'Mercredi', 11, 1),
(204, '16:00:00', '16:45:00', 'Mercredi', 12, 1),
(205, '16:00:00', '16:45:00', 'Jeudi', 9, 1),
(206, '16:00:00', '16:45:00', 'Jeudi', 10, 1),
(207, '16:00:00', '16:45:00', 'Jeudi', 11, 1),
(208, '16:00:00', '16:45:00', 'Jeudi', 12, 1),
(209, '16:00:00', '16:45:00', 'Vendredi', 9, 1),
(210, '16:00:00', '16:45:00', 'Vendredi', 10, 1),
(211, '16:00:00', '16:45:00', 'Vendredi', 11, 1),
(212, '16:00:00', '16:45:00', 'Vendredi', 12, 1),
(213, '16:00:00', '16:45:00', 'Samedi', 9, 1),
(214, '16:00:00', '16:45:00', 'Samedi', 10, 1),
(215, '16:00:00', '16:45:00', 'Samedi', 11, 1),
(216, '16:00:00', '16:45:00', 'Samedi', 12, 1),
(217, '16:45:00', '17:30:00', 'Lundi', 9, 1),
(218, '16:45:00', '17:30:00', 'Lundi', 10, 1),
(219, '16:45:00', '17:30:00', 'Lundi', 11, 1),
(220, '16:45:00', '17:30:00', 'Lundi', 12, 1),
(221, '16:45:00', '17:30:00', 'Mardi', 9, 1),
(222, '16:45:00', '17:30:00', 'Mardi', 10, 1),
(223, '16:45:00', '17:30:00', 'Mardi', 11, 1),
(224, '16:45:00', '17:30:00', 'Mardi', 12, 1),
(225, '16:45:00', '17:30:00', 'Mercredi', 9, 1),
(226, '16:45:00', '17:30:00', 'Mercredi', 10, 1),
(227, '16:45:00', '17:30:00', 'Mercredi', 11, 1),
(228, '16:45:00', '17:30:00', 'Mercredi', 12, 1),
(229, '16:45:00', '17:30:00', 'Jeudi', 9, 1),
(230, '16:45:00', '17:30:00', 'Jeudi', 10, 1),
(231, '16:45:00', '17:30:00', 'Jeudi', 11, 1),
(232, '16:45:00', '17:30:00', 'Jeudi', 12, 1),
(233, '16:45:00', '17:30:00', 'Vendredi', 9, 1),
(234, '16:45:00', '17:30:00', 'Vendredi', 10, 1),
(235, '16:45:00', '17:30:00', 'Vendredi', 11, 1),
(236, '16:45:00', '17:30:00', 'Vendredi', 12, 1),
(237, '16:45:00', '17:30:00', 'Samedi', 9, 1),
(238, '16:45:00', '17:30:00', 'Samedi', 10, 1),
(239, '16:45:00', '17:30:00', 'Samedi', 11, 1),
(240, '16:45:00', '17:30:00', 'Samedi', 12, 1),
(241, '17:30:00', '18:15:00', 'Lundi', 9, 1),
(242, '17:30:00', '18:15:00', 'Lundi', 10, 1),
(243, '17:30:00', '18:15:00', 'Lundi', 11, 1),
(244, '17:30:00', '18:15:00', 'Lundi', 12, 1),
(245, '17:30:00', '18:15:00', 'Mardi', 9, 1),
(246, '17:30:00', '18:15:00', 'Mardi', 10, 1),
(247, '17:30:00', '18:15:00', 'Mardi', 11, 1),
(248, '17:30:00', '18:15:00', 'Mardi', 12, 1),
(249, '17:30:00', '18:15:00', 'Mercredi', 9, 1),
(250, '17:30:00', '18:15:00', 'Mercredi', 10, 1),
(251, '17:30:00', '18:15:00', 'Mercredi', 11, 1),
(252, '17:30:00', '18:15:00', 'Mercredi', 12, 1),
(253, '17:30:00', '18:15:00', 'Jeudi', 9, 1),
(254, '17:30:00', '18:15:00', 'Jeudi', 10, 1),
(255, '17:30:00', '18:15:00', 'Jeudi', 11, 1),
(256, '17:30:00', '18:15:00', 'Jeudi', 12, 1),
(257, '17:30:00', '18:15:00', 'Vendredi', 9, 1),
(258, '17:30:00', '18:15:00', 'Vendredi', 10, 1),
(259, '17:30:00', '18:15:00', 'Vendredi', 11, 1),
(260, '17:30:00', '18:15:00', 'Vendredi', 12, 1),
(261, '17:30:00', '18:15:00', 'Samedi', 9, 1),
(262, '17:30:00', '18:15:00', 'Samedi', 10, 1),
(263, '17:30:00', '18:15:00', 'Samedi', 11, 1),
(264, '17:30:00', '18:15:00', 'Samedi', 12, 1),
(265, '18:15:00', '19:00:00', 'Lundi', 9, 1),
(266, '18:15:00', '19:00:00', 'Lundi', 10, 1),
(267, '18:15:00', '19:00:00', 'Lundi', 11, 1),
(268, '18:15:00', '19:00:00', 'Lundi', 12, 1),
(269, '18:15:00', '19:00:00', 'Mardi', 9, 1),
(270, '18:15:00', '19:00:00', 'Mardi', 10, 1),
(271, '18:15:00', '19:00:00', 'Mardi', 11, 1),
(272, '18:15:00', '19:00:00', 'Mardi', 12, 1),
(273, '18:15:00', '19:00:00', 'Mercredi', 9, 1),
(274, '18:15:00', '19:00:00', 'Mercredi', 10, 1),
(275, '18:15:00', '19:00:00', 'Mercredi', 11, 1),
(276, '18:15:00', '19:00:00', 'Mercredi', 12, 1),
(277, '18:15:00', '19:00:00', 'Jeudi', 9, 1),
(278, '18:15:00', '19:00:00', 'Jeudi', 10, 1),
(279, '18:15:00', '19:00:00', 'Jeudi', 11, 1),
(280, '18:15:00', '19:00:00', 'Jeudi', 12, 1),
(281, '18:15:00', '19:00:00', 'Vendredi', 9, 1),
(282, '18:15:00', '19:00:00', 'Vendredi', 10, 1),
(283, '18:15:00', '19:00:00', 'Vendredi', 11, 1),
(284, '18:15:00', '19:00:00', 'Vendredi', 12, 1),
(285, '18:15:00', '19:00:00', 'Samedi', 9, 1),
(286, '18:15:00', '19:00:00', 'Samedi', 10, 1),
(287, '18:15:00', '19:00:00', 'Samedi', 11, 1),
(288, '18:15:00', '19:00:00', 'Samedi', 12, 1),
(289, '19:00:00', '19:45:00', 'Lundi', 9, 1),
(290, '19:00:00', '19:45:00', 'Lundi', 10, 1),
(291, '19:00:00', '19:45:00', 'Lundi', 11, 1),
(292, '19:00:00', '19:45:00', 'Lundi', 12, 1),
(293, '19:00:00', '19:45:00', 'Mardi', 9, 1),
(294, '19:00:00', '19:45:00', 'Mardi', 10, 1),
(295, '19:00:00', '19:45:00', 'Mardi', 11, 1),
(296, '19:00:00', '19:45:00', 'Mardi', 12, 1),
(297, '19:00:00', '19:45:00', 'Mercredi', 9, 1),
(298, '19:00:00', '19:45:00', 'Mercredi', 10, 1),
(299, '19:00:00', '19:45:00', 'Mercredi', 11, 1),
(300, '19:00:00', '19:45:00', 'Mercredi', 12, 1),
(301, '19:00:00', '19:45:00', 'Jeudi', 9, 1),
(302, '19:00:00', '19:45:00', 'Jeudi', 10, 1),
(303, '19:00:00', '19:45:00', 'Jeudi', 11, 1),
(304, '19:00:00', '19:45:00', 'Jeudi', 12, 1),
(305, '19:00:00', '19:45:00', 'Vendredi', 9, 1),
(306, '19:00:00', '19:45:00', 'Vendredi', 10, 1),
(307, '19:00:00', '19:45:00', 'Vendredi', 11, 1),
(308, '19:00:00', '19:45:00', 'Vendredi', 12, 1),
(309, '19:00:00', '19:45:00', 'Samedi', 9, 1),
(310, '19:00:00', '19:45:00', 'Samedi', 10, 1),
(311, '19:00:00', '19:45:00', 'Samedi', 11, 1),
(312, '19:00:00', '19:45:00', 'Samedi', 12, 1),
(313, '19:45:00', '20:30:00', 'Lundi', 9, 1),
(314, '19:45:00', '20:30:00', 'Lundi', 10, 1),
(315, '19:45:00', '20:30:00', 'Lundi', 11, 1),
(316, '19:45:00', '20:30:00', 'Lundi', 12, 1),
(317, '19:45:00', '20:30:00', 'Mardi', 9, 1),
(318, '19:45:00', '20:30:00', 'Mardi', 10, 1),
(319, '19:45:00', '20:30:00', 'Mardi', 11, 1),
(320, '19:45:00', '20:30:00', 'Mardi', 12, 1),
(321, '19:45:00', '20:30:00', 'Mercredi', 9, 1),
(322, '19:45:00', '20:30:00', 'Mercredi', 10, 1),
(323, '19:45:00', '20:30:00', 'Mercredi', 11, 1),
(324, '19:45:00', '20:30:00', 'Mercredi', 12, 1),
(325, '19:45:00', '20:30:00', 'Jeudi', 9, 1),
(326, '19:45:00', '20:30:00', 'Jeudi', 10, 1),
(327, '19:45:00', '20:30:00', 'Jeudi', 11, 1),
(328, '19:45:00', '20:30:00', 'Jeudi', 12, 1),
(329, '19:45:00', '20:30:00', 'Vendredi', 9, 1),
(330, '19:45:00', '20:30:00', 'Vendredi', 10, 1),
(331, '19:45:00', '20:30:00', 'Vendredi', 11, 1),
(332, '19:45:00', '20:30:00', 'Vendredi', 12, 1),
(333, '19:45:00', '20:30:00', 'Samedi', 9, 1),
(334, '19:45:00', '20:30:00', 'Samedi', 10, 1),
(335, '19:45:00', '20:30:00', 'Samedi', 11, 1),
(336, '19:45:00', '20:30:00', 'Samedi', 12, 1),
(337, '20:30:00', '21:15:00', 'Lundi', 9, 1),
(338, '20:30:00', '21:15:00', 'Lundi', 10, 1),
(339, '20:30:00', '21:15:00', 'Lundi', 11, 1),
(340, '20:30:00', '21:15:00', 'Lundi', 12, 1),
(341, '20:30:00', '21:15:00', 'Mardi', 9, 1),
(342, '20:30:00', '21:15:00', 'Mardi', 10, 1),
(343, '20:30:00', '21:15:00', 'Mardi', 11, 1),
(344, '20:30:00', '21:15:00', 'Mardi', 12, 1),
(345, '20:30:00', '21:15:00', 'Mercredi', 9, 1),
(346, '20:30:00', '21:15:00', 'Mercredi', 10, 1),
(347, '20:30:00', '21:15:00', 'Mercredi', 11, 1),
(348, '20:30:00', '21:15:00', 'Mercredi', 12, 1),
(349, '20:30:00', '21:15:00', 'Jeudi', 9, 1),
(350, '20:30:00', '21:15:00', 'Jeudi', 10, 1),
(351, '20:30:00', '21:15:00', 'Jeudi', 11, 1),
(352, '20:30:00', '21:15:00', 'Jeudi', 12, 1),
(353, '20:30:00', '21:15:00', 'Vendredi', 9, 1),
(354, '20:30:00', '21:15:00', 'Vendredi', 10, 1),
(355, '20:30:00', '21:15:00', 'Vendredi', 11, 1),
(356, '20:30:00', '21:15:00', 'Vendredi', 12, 1),
(357, '20:30:00', '21:15:00', 'Samedi', 9, 1),
(358, '20:30:00', '21:15:00', 'Samedi', 10, 1),
(359, '20:30:00', '21:15:00', 'Samedi', 11, 1),
(360, '20:30:00', '21:15:00', 'Samedi', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `creneaux_id` int(11) DEFAULT NULL,
  `id_adherent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `creneaux_id`, `id_adherent`) VALUES
(3, 9, 21),
(4, 2, 21);

-- --------------------------------------------------------

--
-- Table structure for table `terrain`
--

CREATE TABLE `terrain` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `geoposition` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `terrain`
--

INSERT INTO `terrain` (`id`, `nom`, `geoposition`) VALUES
(9, 'A', '47.2173,-1.5534'),
(10, 'B', '47.2672,-1.6355'),
(11, 'C', '47.2239,-1.6200'),
(12, 'D', '47.2081,-1.5600');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Indexes for table `creneaux`
--
ALTER TABLE `creneaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `terrain_id` (`terrain_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_creneaux` (`creneaux_id`),
  ADD KEY `fk_adherent` (`id_adherent`);

--
-- Indexes for table `terrain`
--
ALTER TABLE `terrain`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `creneaux`
--
ALTER TABLE `creneaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `terrain`
--
ALTER TABLE `terrain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creneaux`
--
ALTER TABLE `creneaux`
  ADD CONSTRAINT `creneaux_ibfk_1` FOREIGN KEY (`terrain_id`) REFERENCES `terrain` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_adherent` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id`),
  ADD CONSTRAINT `fk_creneaux` FOREIGN KEY (`creneaux_id`) REFERENCES `creneaux` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

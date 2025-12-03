-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 03 déc. 2025 à 14:05
-- Version du serveur : 8.0.40
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `happytrip`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id_avis` int NOT NULL,
  `id_utilisateur` int NOT NULL,
  `code_pays` varchar(3) NOT NULL,
  `commentaire` text NOT NULL,
  `note` int DEFAULT NULL,
  `date_avis` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id_avis`, `id_utilisateur`, `code_pays`, `commentaire`, `note`, `date_avis`) VALUES
(6, 3, 'USA', 'c\'était', 5, '2025-12-03 12:39:19'),
(8, 3, 'CAN', 'trop froid', 2, '2025-12-02 18:02:41'),
(13, 3, 'BEL', 'c\'était super', 4, '2025-12-02 20:19:27'),
(15, 3, 'BGD', 'ouais tranquille', 3, '2025-12-02 20:21:53'),
(16, 3, 'IND', 'nul', 4, '2025-12-02 20:31:09'),
(18, 3, 'LVA', 'Belle découverte !', 4, '2025-12-02 23:36:05'),
(19, 3, 'ARG', 'messi est trop fort', 4, '2025-12-02 23:41:26'),
(20, 3, 'ARM', 'c\'était super je me suis régalé', 4, '2025-12-03 00:09:31');

-- --------------------------------------------------------

--
-- Structure de la table `destinations`
--

CREATE TABLE `destinations` (
  `id_destination` int NOT NULL,
  `id_utilisateur` int NOT NULL,
  `code_pays` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `villes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_depart` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_depart_approx` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `budget` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activites` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hebergement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accompagnement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priorite` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `destinations`
--

INSERT INTO `destinations` (`id_destination`, `id_utilisateur`, `code_pays`, `villes`, `date_depart`, `date_depart_approx`, `date_retour`, `budget`, `activites`, `hebergement`, `accompagnement`, `priorite`, `date_creation`) VALUES
(14, 3, 'ARG', '', NULL, NULL, NULL, '', '😊', '', '', '', '2025-12-03 12:24:19');

-- --------------------------------------------------------

--
-- Structure de la table `indicateurbonheur`
--

CREATE TABLE `indicateurbonheur` (
  `id_indicateur` int DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  `annee` int DEFAULT NULL,
  `score_bonheur` decimal(4,3) DEFAULT NULL,
  `pib_par_habitant` decimal(4,3) DEFAULT NULL,
  `soutien_social` decimal(4,3) DEFAULT NULL,
  `esperance_vie` decimal(4,3) DEFAULT NULL,
  `liberte_choix` decimal(4,3) DEFAULT NULL,
  `generosite` decimal(4,3) DEFAULT NULL,
  `perception_corruption` decimal(4,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `indicateurbonheur`
--

INSERT INTO `indicateurbonheur` (`id_indicateur`, `id_pays`, `annee`, `score_bonheur`, `pib_par_habitant`, `soutien_social`, `esperance_vie`, `liberte_choix`, `generosite`, `perception_corruption`) VALUES
(1, 1, 2019, 3.203, 0.350, 0.517, 0.361, 0.000, 0.158, 0.025),
(2, 2, 2019, 4.719, 0.947, 0.848, 0.874, 0.383, 0.178, 0.027),
(3, 3, 2019, 5.211, 1.002, 1.160, 0.785, 0.086, 0.073, 0.114),
(4, 4, 2019, 6.086, 1.092, 1.432, 0.881, 0.471, 0.066, 0.050),
(5, 5, 2019, 4.559, 0.850, 1.055, 0.815, 0.283, 0.095, 0.064),
(6, 6, 2019, 7.228, 1.372, 1.548, 1.036, 0.557, 0.332, 0.290),
(7, 7, 2019, 7.246, 1.376, 1.475, 1.016, 0.532, 0.244, 0.226),
(8, 8, 2019, 5.208, 1.043, 1.147, 0.769, 0.351, 0.035, 0.182),
(9, 9, 2019, 6.199, 1.362, 1.368, 0.871, 0.536, 0.255, 0.110),
(10, 10, 2019, 4.456, 0.562, 0.928, 0.723, 0.527, 0.166, 0.143),
(11, 11, 2019, 5.323, 1.067, 1.465, 0.789, 0.235, 0.094, 0.142),
(12, 12, 2019, 6.923, 1.356, 1.504, 0.986, 0.473, 0.160, 0.210),
(13, 13, 2019, 4.883, 0.393, 0.437, 0.397, 0.349, 0.175, 0.082),
(14, 14, 2019, 5.082, 0.813, 1.321, 0.604, 0.457, 0.370, 0.167),
(15, 15, 2019, 5.779, 0.776, 1.209, 0.706, 0.511, 0.137, 0.064),
(16, 16, 2019, 5.386, 0.945, 1.212, 0.845, 0.212, 0.263, 0.006),
(17, 17, 2019, 3.488, 1.041, 1.145, 0.538, 0.455, 0.025, 0.100),
(18, 18, 2019, 6.300, 1.004, 1.439, 0.802, 0.390, 0.099, 0.086),
(19, 19, 2019, 5.011, 1.092, 1.513, 0.815, 0.311, 0.081, 0.004),
(20, 20, 2019, 4.587, 0.331, 1.056, 0.380, 0.255, 0.177, 0.113),
(21, 21, 2019, 3.775, 0.046, 0.447, 0.380, 0.220, 0.176, 0.180),
(22, 22, 2019, 4.700, 0.574, 1.122, 0.637, 0.609, 0.232, 0.062),
(23, 23, 2019, 5.044, 0.549, 0.910, 0.331, 0.381, 0.187, 0.037),
(24, 24, 2019, 7.278, 1.365, 1.505, 1.039, 0.584, 0.285, 0.308),
(25, 25, 2019, 3.083, 0.026, 0.000, 0.105, 0.225, 0.235, 0.035),
(26, 26, 2019, 4.350, 0.350, 0.766, 0.192, 0.174, 0.198, 0.078),
(27, 27, 2019, 6.444, 1.159, 1.369, 0.920, 0.357, 0.187, 0.056),
(28, 28, 2019, 5.191, 1.029, 1.125, 0.893, 0.521, 0.058, 0.100),
(29, 29, 2019, 6.125, 0.985, 1.410, 0.841, 0.470, 0.099, 0.034),
(30, 30, 2019, 3.973, 0.274, 0.757, 0.505, 0.142, 0.275, 0.078),
(31, 31, 2019, 4.812, 0.673, 0.799, 0.508, 0.372, 0.105, 0.093),
(32, 32, 2019, 4.418, 0.094, 1.125, 0.357, 0.269, 0.212, 0.053),
(33, 33, 2019, 7.167, 1.034, 1.441, 0.963, 0.558, 0.144, 0.093),
(34, 34, 2019, 5.432, 1.155, 1.266, 0.914, 0.296, 0.119, 0.022),
(35, 35, 2019, 6.046, 1.263, 1.223, 1.042, 0.406, 0.190, 0.041),
(36, 36, 2019, 6.852, 1.269, 1.487, 0.920, 0.457, 0.046, 0.036),
(37, 37, 2019, 7.600, 1.383, 1.573, 0.996, 0.592, 0.252, 0.410),
(38, 38, 2019, 5.425, 1.015, 1.401, 0.779, 0.497, 0.113, 0.101),
(39, 39, 2019, 6.028, 0.912, 1.312, 0.868, 0.498, 0.126, 0.087),
(40, 40, 2019, 4.166, 0.913, 1.039, 0.644, 0.241, 0.076, 0.067),
(41, 41, 2019, 6.253, 0.794, 1.242, 0.789, 0.430, 0.093, 0.074),
(42, 42, 2019, 5.893, 1.237, 1.528, 0.874, 0.495, 0.103, 0.161),
(43, 43, 2019, 4.286, 0.336, 1.033, 0.532, 0.344, 0.209, 0.100),
(44, 44, 2019, 7.769, 1.340, 1.587, 0.986, 0.596, 0.153, 0.393),
(45, 45, 2019, 6.592, 1.324, 1.472, 1.045, 0.436, 0.111, 0.183),
(46, 46, 2019, 4.799, 1.057, 1.183, 0.571, 0.295, 0.043, 0.055),
(47, 47, 2019, 4.516, 0.308, 0.939, 0.428, 0.382, 0.269, 0.167),
(48, 48, 2019, 4.519, 0.886, 0.666, 0.752, 0.346, 0.043, 0.164),
(49, 49, 2019, 6.985, 1.373, 1.454, 0.987, 0.495, 0.261, 0.265),
(50, 50, 2019, 4.996, 0.611, 0.868, 0.486, 0.381, 0.245, 0.040),
(51, 51, 2019, 5.287, 1.181, 1.156, 0.999, 0.067, 0.000, 0.034),
(52, 52, 2019, 6.436, 0.800, 1.269, 0.746, 0.535, 0.175, 0.078),
(53, 53, 2019, 4.534, 0.380, 0.829, 0.375, 0.332, 0.207, 0.086),
(54, 54, 2019, 3.597, 0.323, 0.688, 0.449, 0.026, 0.419, 0.110),
(55, 55, 2019, 5.860, 0.642, 1.236, 0.828, 0.507, 0.246, 0.078),
(56, 56, 2019, 5.430, 1.438, 1.277, 1.122, 0.440, 0.258, 0.287),
(57, 57, 2019, 5.758, 1.201, 1.410, 0.828, 0.199, 0.081, 0.020),
(58, 58, 2019, 7.494, 1.380, 1.624, 1.026, 0.591, 0.354, 0.118),
(59, 59, 2019, 4.015, 0.755, 0.765, 0.588, 0.498, 0.200, 0.085),
(60, 60, 2019, 5.192, 0.931, 1.203, 0.660, 0.491, 0.498, 0.028),
(61, 61, 2019, 4.548, 1.100, 0.842, 0.785, 0.305, 0.270, 0.125),
(62, 62, 2019, 4.437, 1.043, 0.980, 0.574, 0.241, 0.148, 0.089),
(63, 63, 2019, 7.021, 1.499, 1.553, 0.999, 0.516, 0.298, 0.310),
(64, 64, 2019, 7.139, 1.276, 1.455, 1.029, 0.371, 0.261, 0.082),
(65, 65, 2019, 6.223, 1.294, 1.488, 1.039, 0.231, 0.158, 0.030),
(66, 66, 2019, 4.944, 0.569, 0.808, 0.232, 0.352, 0.154, 0.090),
(67, 67, 2019, 5.890, 0.831, 1.478, 0.831, 0.490, 0.107, 0.028),
(68, 68, 2019, 5.886, 1.327, 1.419, 1.088, 0.445, 0.069, 0.140),
(69, 69, 2019, 4.906, 0.837, 1.225, 0.815, 0.383, 0.110, 0.130),
(70, 70, 2019, 5.809, 1.173, 1.508, 0.729, 0.410, 0.146, 0.096),
(71, 71, 2019, 4.509, 0.512, 0.983, 0.581, 0.431, 0.372, 0.053),
(72, 72, 2019, 6.100, 0.882, 1.232, 0.758, 0.489, 0.262, 0.006),
(73, 73, 2019, 6.021, 1.500, 1.319, 0.808, 0.493, 0.142, 0.097),
(74, 74, 2019, 5.261, 0.551, 1.438, 0.723, 0.508, 0.300, 0.023),
(75, 75, 2019, 4.796, 0.764, 1.030, 0.551, 0.547, 0.266, 0.164),
(76, 76, 2019, 5.940, 1.187, 1.465, 0.812, 0.264, 0.075, 0.064),
(77, 77, 2019, 5.197, 0.987, 1.224, 0.815, 0.216, 0.166, 0.027),
(78, 78, 2019, 3.802, 0.489, 1.169, 0.168, 0.359, 0.107, 0.093),
(79, 79, 2019, 3.975, 0.073, 0.922, 0.443, 0.370, 0.233, 0.033),
(80, 80, 2019, 5.525, 1.044, 1.303, 0.673, 0.416, 0.133, 0.152),
(81, 81, 2019, 6.149, 1.238, 1.515, 0.818, 0.291, 0.043, 0.042),
(82, 82, 2019, 7.090, 1.609, 1.479, 1.012, 0.526, 0.194, 0.316),
(83, 83, 2019, 3.933, 0.274, 0.916, 0.555, 0.148, 0.169, 0.041),
(84, 84, 2019, 3.410, 0.191, 0.560, 0.495, 0.443, 0.218, 0.089),
(85, 85, 2019, 5.339, 1.221, 1.171, 0.828, 0.508, 0.260, 0.024),
(86, 86, 2019, 4.390, 0.385, 1.105, 0.308, 0.327, 0.153, 0.052),
(87, 87, 2019, 6.726, 1.300, 1.520, 0.999, 0.564, 0.375, 0.151),
(88, 88, 2019, 4.490, 0.570, 1.167, 0.489, 0.066, 0.106, 0.088),
(89, 89, 2019, 5.888, 1.120, 1.402, 0.798, 0.498, 0.215, 0.060),
(90, 90, 2019, 6.595, 1.070, 1.323, 0.861, 0.433, 0.074, 0.073),
(91, 91, 2019, 5.529, 0.685, 1.328, 0.739, 0.245, 0.181, 0.000),
(92, 92, 2019, 5.285, 0.948, 1.531, 0.667, 0.317, 0.235, 0.038),
(93, 93, 2019, 5.523, 1.051, 1.361, 0.871, 0.197, 0.142, 0.080),
(94, 94, 2019, 5.208, 0.801, 0.782, 0.782, 0.418, 0.036, 0.076),
(95, 95, 2019, 4.466, 0.204, 0.986, 0.390, 0.494, 0.197, 0.138),
(96, 96, 2019, 4.360, 0.710, 1.181, 0.555, 0.525, 0.566, 0.172),
(97, 97, 2019, 4.639, 0.879, 1.313, 0.477, 0.401, 0.070, 0.056),
(98, 98, 2019, 4.913, 0.446, 1.226, 0.677, 0.439, 0.285, 0.089),
(99, 99, 2019, 7.488, 1.396, 1.522, 0.999, 0.557, 0.322, 0.298),
(100, 100, 2019, 7.307, 1.303, 1.557, 1.026, 0.585, 0.330, 0.380),
(101, 101, 2019, 6.105, 0.694, 1.325, 0.835, 0.435, 0.200, 0.127),
(102, 102, 2019, 4.628, 0.138, 0.774, 0.366, 0.318, 0.188, 0.102),
(103, 103, 2019, 5.265, 0.696, 1.111, 0.245, 0.426, 0.215, 0.041),
(104, 104, 2019, 5.274, 0.983, 1.294, 0.838, 0.345, 0.185, 0.034),
(105, 105, 2019, 7.554, 1.488, 1.582, 1.028, 0.603, 0.271, 0.341),
(106, 106, 2019, 5.653, 0.677, 0.886, 0.535, 0.313, 0.220, 0.098),
(107, 107, 2019, 6.321, 1.149, 1.442, 0.910, 0.516, 0.109, 0.054),
(108, 108, 2019, 5.743, 0.855, 1.475, 0.777, 0.514, 0.184, 0.080),
(109, 109, 2019, 5.697, 0.960, 1.274, 0.854, 0.455, 0.083, 0.027),
(110, 110, 2019, 5.631, 0.807, 1.293, 0.657, 0.558, 0.117, 0.107),
(111, 111, 2019, 6.182, 1.206, 1.438, 0.884, 0.483, 0.117, 0.050),
(112, 112, 2019, 5.693, 1.221, 1.431, 0.999, 0.508, 0.047, 0.025),
(113, 113, 2019, 6.374, 1.684, 1.313, 0.871, 0.555, 0.220, 0.167),
(114, 114, 2019, 6.070, 1.162, 1.232, 0.825, 0.462, 0.083, 0.005),
(115, 115, 2019, 5.648, 1.183, 1.452, 0.726, 0.334, 0.082, 0.031),
(116, 116, 2019, 3.334, 0.359, 0.711, 0.614, 0.555, 0.217, 0.411),
(117, 117, 2019, 6.375, 1.403, 1.357, 0.795, 0.439, 0.080, 0.132),
(118, 118, 2019, 4.681, 0.450, 1.134, 0.571, 0.292, 0.153, 0.072),
(119, 119, 2019, 5.603, 1.004, 1.383, 0.854, 0.282, 0.137, 0.039),
(120, 120, 2019, 4.374, 0.268, 0.841, 0.242, 0.309, 0.252, 0.045),
(121, 121, 2019, 6.262, 1.572, 1.463, 1.141, 0.556, 0.271, 0.453),
(122, 122, 2019, 6.198, 1.246, 1.504, 0.881, 0.334, 0.121, 0.014),
(123, 123, 2019, 6.118, 1.258, 1.523, 0.953, 0.564, 0.144, 0.057),
(124, 124, 2019, 4.668, 0.000, 0.698, 0.268, 0.559, 0.243, 0.270),
(125, 125, 2019, 4.722, 0.960, 1.351, 0.469, 0.389, 0.130, 0.055),
(126, 126, 2019, 5.895, 1.301, 1.219, 1.036, 0.159, 0.175, 0.056),
(127, 127, 2019, 2.853, 0.306, 0.575, 0.295, 0.010, 0.202, 0.091),
(128, 128, 2019, 6.354, 1.286, 1.484, 1.062, 0.362, 0.153, 0.079),
(129, 129, 2019, 4.366, 0.949, 1.265, 0.831, 0.470, 0.244, 0.047),
(130, 130, 2019, 7.343, 1.387, 1.487, 1.009, 0.574, 0.267, 0.373),
(131, 131, 2019, 7.480, 1.452, 1.526, 1.052, 0.572, 0.263, 0.343),
(132, 132, 2019, 3.462, 0.619, 0.378, 0.440, 0.013, 0.331, 0.141),
(133, 133, 2019, 5.467, 0.493, 1.098, 0.718, 0.389, 0.230, 0.144),
(134, 134, 2019, 3.231, 0.476, 0.885, 0.499, 0.417, 0.276, 0.147),
(135, 135, 2019, 6.008, 1.050, 1.409, 0.828, 0.557, 0.359, 0.028),
(136, 136, 2019, 4.085, 0.275, 0.572, 0.410, 0.293, 0.177, 0.085),
(137, 137, 2019, 6.192, 1.231, 1.477, 0.713, 0.489, 0.185, 0.016),
(138, 138, 2019, 4.461, 0.921, 1.000, 0.815, 0.167, 0.059, 0.055),
(139, 139, 2019, 5.373, 1.183, 1.360, 0.808, 0.195, 0.083, 0.106),
(140, 140, 2019, 5.247, 1.052, 1.538, 0.657, 0.394, 0.244, 0.028),
(141, 141, 2019, 4.189, 0.332, 1.069, 0.443, 0.356, 0.252, 0.060),
(142, 142, 2019, 4.332, 0.820, 1.390, 0.739, 0.178, 0.187, 0.010),
(143, 143, 2019, 6.825, 1.503, 1.310, 0.825, 0.598, 0.262, 0.182),
(144, 144, 2019, 7.054, 1.333, 1.538, 0.996, 0.450, 0.348, 0.278),
(145, 145, 2019, 6.892, 1.433, 1.457, 0.874, 0.454, 0.280, 0.128),
(146, 146, 2019, 6.293, 1.124, 1.465, 0.891, 0.523, 0.127, 0.150),
(147, 147, 2019, 6.174, 0.745, 1.529, 0.756, 0.631, 0.322, 0.240),
(148, 148, 2019, 4.707, 0.960, 1.427, 0.805, 0.154, 0.064, 0.047),
(149, 149, 2019, 5.175, 0.741, 1.346, 0.851, 0.543, 0.147, 0.073),
(159, 159, 2019, 3.380, 0.287, 1.163, 0.463, 0.143, 0.108, 0.077),
(160, 160, 2019, 4.107, 0.578, 1.058, 0.426, 0.431, 0.247, 0.087),
(161, 161, 2019, 3.663, 0.366, 1.114, 0.433, 0.361, 0.151, 0.089);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int NOT NULL,
  `nom_pays` varchar(100) DEFAULT NULL,
  `continent` varchar(50) DEFAULT NULL,
  `code_iso` varchar(10) DEFAULT NULL,
  `description` text,
  `rang_bonheur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id_pays`, `nom_pays`, `continent`, `code_iso`, `description`, `rang_bonheur`) VALUES
(1, 'Afghanistan', 'Asia', 'AFG', 'L Afghanistan, pays de montagnes et de contrastes, possède une histoire ancienne et un patrimoine culturel profond. Malgré un niveau de bonheur affecté par les conflits, le peuple afghan reste reconnu pour sa résistance et son hospitalité.', 154),
(2, 'Albanie', 'Europe', 'ALB', NULL, 107),
(3, 'Algerie', 'Africa', 'DZA', 'L Algérie est un immense pays riche de paysages variés, allant du désert saharien aux montagnes verdoyantes. Sa population est réputée pour sa générosité et son sens du partage, ce qui nourrit un bonheur fortement lié aux liens familiaux. L Algérie offre aux voyageurs une expérience culturelle profonde et authentique.', 88),
(4, 'Argentine', 'South America', 'ARG', 'L Argentine propose des paysages variés allant de la Patagonie aux chutes d Iguazu. Son niveau de bonheur repose sur la passion pour la culture, le football et la gastronomie comme le célèbre asado. Une destination authentique et pleine de caractère.', 47),
(5, 'Armenie', 'Asia', 'ARM', NULL, 116),
(6, 'Australie', 'Oceania', 'AUS', 'L Australie est un pays immense offrant plages idylliques, faune unique, grandes villes modernes et déserts spectaculaires. Son haut niveau de bonheur repose sur une qualité de vie reconnue mondialement, un climat agréable et une culture décontractée. Que ce soit pour explorer la Grande Barrière de Corail ou les paysages sauvages d Outback, l Australie séduit par son équilibre entre aventure et douceur de vivre.', 11),
(7, 'Autriche', 'Europe', 'AUT', 'L Autriche est célèbre pour ses montagnes, sa musique classique et ses villes historiques. Son niveau de bonheur élevé provient d un excellent équilibre entre nature et culture. Les voyageurs apprécient son atmosphère élégante et ses paysages alpins impressionnants.', 10),
(8, 'Azerbaijan', 'Asia', 'AZE', NULL, 90),
(9, 'Bahrein', 'Asia', 'BHR', NULL, 37),
(10, 'Bangladesh', 'Asia', 'BGD', 'Le Bangladesh séduit par ses rizières, ses fleuves majestueux et son peuple chaleureux. Malgré des défis économiques, le bonheur repose sur la solidarité et la résilience. Le pays offre une immersion culturelle authentique.', 125),
(11, 'Biélorussie', 'Europe', 'BLR', 'La Biélorussie propose forêts, plaines et villes paisibles. Son niveau de bonheur repose sur la simplicité et la tranquillité. Le pays offre un tourisme calme et naturel.', 81),
(12, 'Belgique', 'Europe', 'BEL', 'La Belgique charme par ses villes médiévales, sa culture riche et sa gastronomie réputée incluant chocolats et bières. Son niveau de bonheur est stable grâce à une bonne qualité de vie. Le pays attire les visiteurs intéressés par l histoire, l art et la convivialité.', 18),
(13, 'Benin', 'Africa', 'BEN', 'Le Bénin est un pays calme et riche en traditions, notamment le vodou, qui fait partie de son identité culturelle. La population affiche un bonheur lié a la convivialité et aux liens familiaux. Le pays offre plages, histoire et spiritualité.', 102),
(14, 'Bhoutan', 'Asia', 'BTN', 'Le Bhoutan est mondialement connu pour son Indice de Bonheur National Brut. Entre monastères perchés et montagnes sacrées, il offre un mode de vie centré sur la paix intérieure et l environnement. Une destination rare et profondément inspirante.', 95),
(15, 'Bolivie', 'South America', 'BOL', 'La Bolivie présente certains des paysages les plus impressionnants du continent, dont le Salar de Uyuni et les Andes. Le bonheur repose sur la tradition, la nature et la fierté culturelle. Le pays offre une immersion intense et authentique.', 61),
(16, 'Bosnie- Herzegovine', 'Europe', 'BIH', NULL, 78),
(17, 'Botswana', 'Africa', 'BWA', 'Le Botswana est reconnu pour ses safaris exceptionnels et ses réserves animales. Le niveau de bonheur est l un des plus élevés d Afrique grâce à la stabilité et à la nature préservée. Une destination idéale pour les amoureux de faune sauvage.', 148),
(18, 'Brésil', 'South America', 'BRA', 'Le Brésil séduit par sa joie de vivre, ses plages mythiques, la forêt amazonienne et ses métropoles dynamiques comme Rio de Janeiro. Le bonheur brésilien est porté par la créativité, la musique et la convivialité. Le pays offre une immersion tropicale intense et chaleureuse.', 32),
(19, 'Bulgarie', 'Europe', 'BGR', 'La Bulgarie propose plages, montagnes et monastères historiques. Son niveau de bonheur est variable mais porté par un fort sens de la famille. Le pays offre un excellent rapport qualité voyage.', 97),
(20, 'Burkina Faso', 'Africa', 'BFA', 'Le Burkina Faso possède une culture forte, une musique reconnue et un esprit communautaire très marqué. Le bonheur repose sur la solidarité et la simplicité de la vie. Une destination authentique pour les voyageurs en quête de découvertes culturelles.', 115),
(21, 'Burundi', 'Africa', 'BDI', NULL, 145),
(22, 'Cambodge', 'Asia', 'KHM', 'Le Cambodge attire par ses temples majestueux comme Angkor Wat, ses paysages paisibles et son atmosphère chaleureuse. Malgré un passé difficile, les habitants affichent un bonheur porté par l optimisme et la solidarité. La destination est marquée par une grande douceur humaine.', 109),
(23, 'Cameroun', 'Africa', 'CMR', 'Le Cameroun, souvent appelé Afrique en miniature, offre montagnes, savanes, plages et forêts tropicales. Son bonheur reflète sa diversité culturelle et son dynamisme. Le pays attire les voyageurs en quête de variété et d authenticité.', 96),
(24, 'Canada', 'North America', 'CAN', 'Le Canada est réputé pour ses vastes espaces naturels, ses lacs immenses et ses montagnes majestueuses. Son haut niveau de bonheur reflète la qualité de vie exceptionnelle, la sécurité et la chaleur humaine de sa population. Le pays est une destination idéale pour les amoureux de nature, d aventure et de tranquillité.', 9),
(25, 'Republique centrafricaine', 'Africa', 'CAF', NULL, 155),
(26, 'Tchad', 'Africa', 'TCD', 'Le Tchad se distingue par ses paysages sauvages, allant du désert du Sahara au lac Tchad. Le bonheur est influencé par la vie communautaire et la simplicité. C est une destination pour les voyageurs avides d aventures brutes et de nature.', 132),
(27, 'Chili', 'South America', 'CHL', 'Le Chili est un pays longiligne avec une incroyable diversité de paysages, du désert d Atacama à la Patagonie. Son niveau de bonheur augmente grâce à sa stabilité et à la beauté de ses territoires. Une destination unique pour les aventuriers.', 26),
(28, 'Chine', 'Asia', 'CHN', 'La Chine est un pays immense et fascinant où traditions millénaires et modernité fulgurante coexistent. De la Grande Muraille aux mégapoles futuristes, elle offre une diversité culturelle et géographique unique. Malgré des contrastes sociaux, le niveau de bonheur reflète un fort sentiment d appartenance et une dynamique économique impressionnante.', 93),
(29, 'Colombie', 'South America', 'COL', 'La Colombie surprend par la chaleur humaine de sa population, ses paysages tropicaux et ses villes dynamiques comme Medellín. Le bonheur repose sur l optimisme et l art de vivre colombien. Une destination lumineuse et festive.', 43),
(30, 'Comores', 'Africa', 'COM', 'Les Comores offrent des plages paradisiaques, une culture métissée et une atmosphère paisible. Le bonheur repose sur la simplicité et la convivialité. L archipel séduit les voyageurs en quête de tranquillité.', 142),
(31, 'Congo, Rep.', 'Africa', 'COG', 'Le Congo offre fleuves immenses, forêts tropicales et une culture vibrante. Le bonheur provient du sens de l hospitalité et de la musique omniprésente. Le pays est idéal pour un voyage au cœur de l Afrique équatoriale.', 103),
(32, 'Congo, Dem. Rep.', 'Africa', 'COD', 'La République Démocratique du Congo est un pays d une richesse naturelle immense, notamment avec ses volcans et ses forêts. Le bonheur repose sur la solidarité et la culture. Une destination brute et intense.', 127),
(33, 'Costa Rica', 'North America', 'CRI', 'Le Costa Rica est l un des pays les plus heureux du monde, grâce à sa nature préservée, son absence d armée et son mode de vie paisible. Forêts tropicales, volcans, plages et biodiversité exceptionnelle en font un paradis écologique.', 12),
(34, 'Croatie', 'Europe', 'HRV', 'La Croatie séduit par ses plages adriatiques, ses villes historiques et sa nature préservée. Son niveau de bonheur progresse grâce à un environnement apaisant et accueillant. Le pays est parfait pour les amateurs de mer et d histoire.', 75),
(35, 'Chypre', 'Asia', 'CYP', NULL, 49),
(36, 'République tchèque', 'Europe', 'CZE', 'La Tchéquie, avec Prague comme joyau, allie architecture splendide et qualité de vie agréable. Son bonheur repose sur un équilibre entre histoire et modernité.', 20),
(37, 'Danemark', 'Europe', 'DNK', 'Le Danemark est reconnu pour son mode de vie hygge, son architecture moderne et son niveau de bonheur très élevé. Copenhague attire les voyageurs pour son ambiance détendue et créative. Le pays est un modèle de convivialité et de bien etre.', 2),
(38, 'Republique Dominicaine', 'North America', 'DOM', 'La République Dominicaine est une destination tropicale réputée pour ses plages paradisiaques, ses resorts et son ambiance festive. Le niveau de bonheur est lié à la musique, la danse et la convivialité. Un incontournable des Caraïbes.', 77),
(39, 'Equateur', 'South America', 'ECU', 'L Équateur est un petit pays mais d une richesse incroyable, allant des Andes à l Amazonie en passant par les îles Galápagos. Le bonheur y est porté par la diversité culturelle et naturelle. Une destination parfaite pour les explorateurs.', 50),
(40, 'Egypte', 'Africa', 'EGY', 'L Égypte est une destination mythique, berceau de l une des plus anciennes civilisations du monde. Entre temples majestueux, désert et navigation sur le Nil, le pays fascine depuis toujours. Le bonheur des Égyptiens est porté par un sens profond de l hospitalité et une grande richesse culturelle.', 137),
(41, 'Salvador', 'North America', 'SLV', 'Le Salvador est un pays volcanique offrant plages de surf, montagnes et villages colorés. Le bonheur local repose sur la convivialité et une culture vive. Une destination pleine de surprises.', 35),
(42, 'Estonie', 'Europe', 'EST', NULL, 55),
(43, 'Ethiopie', 'Africa', 'ETH', 'L Éthiopie offre une culture millénaire, des paysages uniques et un niveau de bonheur influencé par la spiritualité et la vie communautaire.', 134),
(44, 'Finlande', 'Europe', 'FIN', 'La Finlande, souvent classée pays le plus heureux du monde, séduit par ses lacs, ses forêts et son ambiance paisible. Ses habitants valorisent la nature, le calme et l équilibre. Le pays offre une expérience unique entre modernité et tranquillité.', 1),
(45, 'France', 'Europe', 'FRA', 'La France est l un des pays les plus visités au monde, réputé pour sa gastronomie, son patrimoine exceptionnel et sa diversité de paysages allant des plages méditerranéennes aux sommets alpins. Le pays affiche un niveau de bonheur stable, porté par une qualité de vie appréciée. Ses villes pleines de charme et ses traditions culturelles attirent chaque année des millions de voyageurs.', 24),
(46, 'Gabon', 'Africa', 'GAB', 'Le Gabon possède une biodiversité extraordinaire avec ses parcs nationaux et ses plages sauvages. Le bonheur est lié à la coexistence entre modernité et nature. Le pays séduit les amateurs d écotourisme.', 104),
(47, 'Gambie', 'Africa', 'GMB', NULL, 120),
(48, 'Georgie', 'Asia', 'GEO', NULL, 119),
(49, 'Allemagne', 'Europe', 'DEU', 'L Allemagne offre un savant mélange entre modernité, histoire et nature verdoyante. Son niveau de bonheur élevé reflète une excellente qualité de vie et une sécurité appréciée. Entre forêts, châteaux et villes innovantes, le pays attire les amoureux de culture, de technologie et de nature.', 17),
(50, 'Ghana', 'Africa', 'GHA', 'Le Ghana est connu pour sa stabilité, son sens de l accueil et ses belles plages du golfe de Guinée. Le niveau de bonheur est l un des meilleurs d Afrique de l Ouest, dominé par la convivialité. Le pays attire les visiteurs pour sa culture et sa nature tropicale.', 98),
(51, 'Grèce', 'Europe', 'GRC', 'La Grèce attired par ses îles magnifiques, son histoire ancienne et son climat méditerranéen. Son bonheur dépend de la convivialité et du rythme de vie détendu. Le pays est idéal pour un séjour ensoleillé entre culture et détente.', 82),
(52, 'Guatemala', 'North America', 'GTM', 'Le Guatemala séduit par ses volcans, ses villages mayas et ses lacs somptueux comme l Atitlán. Le bonheur repose sur la spiritualité et la force culturelle du peuple maya. Une destination mystique et chaleureuse.', 27),
(53, 'Guinée', 'Africa', 'GIN', 'La Guinée séduit par ses forêts, ses montagnes et sa musique influente. Le bonheur est porté par la convivialité et la culture. Le pays offre une authenticité rare et des paysages variés.', 118),
(54, 'Haiti', 'North America', 'HTI', 'Haïti est un pays riche en culture, en musique et en traditions. Le bonheur repose sur la résilience et la créativité de sa population. Le pays possède un patrimoine culturel unique et vibrant.', 147),
(55, 'Honduras', 'North America', 'HND', 'Le Honduras propose des îles magnifiques comme Roatán, des sites mayas et une nature luxuriante. Le bonheur est porté par la chaleur humaine. Une destination idéale pour les amateurs de plongée et d aventure.', 59),
(56, 'Hong Kong', 'Asia', 'HKG', NULL, 76),
(57, 'Hongrie', 'Europe', 'HUN', 'La Hongrie est célèbre pour Budapest, ses bains thermaux et son patrimoine architectural. Son niveau de bien etre est en progression. Le pays offre un excellent mélange de culture, détente et histoire.', 62),
(58, 'Islande', 'Europe', 'ISL', 'L Islande séduit avec ses paysages volcaniques, ses cascades et ses aurores boréales. Son niveau de bonheur élevé reflète une société paisible et connectée à la nature. Le pays offre une expérience de voyage rare et spectaculaire.', 4),
(59, 'Inde', 'Asia', 'IND', 'L Inde émerveille par sa diversité culturelle, ses temples, ses couleurs et sa spiritualité omniprésente. Ses paysages varient des montagnes de l Himalaya aux plages tropicales. Le niveau de bonheur repose sur la vie communautaire et un profond attachement aux traditions, offrant aux visiteurs une immersion intense et inoubliable.', 140),
(60, 'Indonesie', 'Asia', 'IDN', 'L Indonésie, archipel de plus de 17 000 îles, offre plages paradisiaques, volcans, jungles et cultures variées. Bali, Java ou Sumatra séduisent chaque année des millions de voyageurs. Le bonheur indonésien repose sur la spiritualité, la nature et la convivialité.', 92),
(61, 'Iran', 'Asia', 'IRN', 'L Iran séduit par son architecture majestueuse, ses bazars et sa culture millénaire. Les Iraniens sont réputés pour leur hospitalité sincère, et le bonheur s exprime dans la richesse des traditions. Le pays offre un voyage culturel fascinant.', 117),
(62, 'Irak', 'Asia', 'IRQ', NULL, 126),
(63, 'Irlande', 'Europe', 'IRL', 'L Irlande offre des paysages verdoyants, une culture chaleureuse et une musique traditionnelle vivante. Son niveau de bonheur est porté par une grande convivialité. Le pays attire les amoureux de nature, de légendes et d atmosphères authentiques.', 16),
(64, 'Israel', 'Asia', 'ISR', NULL, 13),
(65, 'Italie', 'Europe', 'ITA', 'L Italie séduit par son patrimoine antique, sa cuisine mondialement connue et ses paysages variés qui s étendent des Dolomites aux plages de Sicile. Son niveau de bonheur repose sur une forte culture familiale et un art de vivre apprécié. Le pays attire les passionnés d histoire et de romantisme.', 36),
(66, 'Côte d/Ivoire', 'Africa', 'CIV', 'La Côte d Ivoire est une destination vibrante, riche en gastronomie, musique et plages. Le bonheur y est porté par la fête, la solidarité et la diversité culturelle. Abidjan et ses alentours offrent une énergie unique et vivante.', 99),
(67, 'Jamaique', 'North America', 'JAM', 'La Jamaïque est le berceau du reggae et un pays tropical réputé pour ses plages et sa culture vibrante. Le bonheur y est fortement lié à la musique et à la philosophie rasta. Une destination colorée et énergique.', 56),
(68, 'Japon', 'Asia', 'JPN', 'Le Japon combine harmonieusement innovation technologique et traditions ancestrales. Temples, jardins zen, gastronomie raffinée et villes ultra modernes en font une destination unique. Son niveau élevé de bien etre se traduit par une société respectueuse, sécurisée et paisible.', 58),
(69, 'Jordanie', 'Asia', 'JOR', 'La Jordanie est un joyau du Moyen Orient avec Petra, le désert du Wadi Rum et la mer Morte. Son niveau de bonheur est influencé par une grande hospitalité. Une destination incontournable pour les passionnés d histoire et de nature.', 101),
(70, 'Kazakhstan', 'Asia', 'KAZ', 'Le Kazakhstan propose steppes immenses, paysages futuristes et traditions nomades. Son niveau de bonheur progresse grâce à une stabilité croissante. Le pays attire les voyageurs curieux de grands espaces et de cultures d Asie centrale.', 60),
(71, 'Kenya', 'Africa', 'KEN', 'Le Kenya séduit par ses safaris, ses plages et son ambiance chaleureuse, avec un bien etre lié a un fort sens de la communauté.', 121),
(72, 'Kosovo', 'Europe', 'XKX', NULL, 46),
(73, 'Koweit', 'Asia', 'KWT', NULL, 51),
(74, 'Kirghizistan', 'Asia', 'KGZ', 'Le Kirghizistan est un paradis pour les amoureux de montagne. Ses traditions nomades et ses paysages immenses créent une atmosphère paisible. Le bonheur local repose sur un rythme de vie simple et harmonieux avec la nature.', 86),
(75, 'Laos', 'Asia', 'LAO', 'Le Laos est l un des pays les plus paisibles d Asie du Sud Est. Montagnes, cascades et monastères lui donnent une atmosphère spirituelle unique. Le niveau de bonheur repose sur un rythme de vie lent, simple et authentique.', 105),
(76, 'Lettonie', 'Europe', 'LVA', NULL, 53),
(77, 'Liban', 'Asia', 'LBN', NULL, 91),
(78, 'Lesotho', 'Africa', 'LSO', NULL, 144),
(79, 'Liberia', 'Africa', 'LBR', 'Le Liberia possède des plages sauvages, des forêts et une culture chaleureuse. Le bonheur repose sur la solidarité et l énergie positive de sa population. Le pays offre une expérience naturelle unique.', 141),
(80, 'Libye', 'Africa', 'LBY', 'La Libye possède un patrimoine antique exceptionnel et de vastes paysages désertiques. Son niveau de bonheur est affecté par des contextes instables, mais la richesse culturelle de sa population demeure marquante. Le pays recèle des destinations historiques uniques pour les voyageurs curieux.', 72),
(81, 'Lituanie', 'Europe', 'LTU', NULL, 42),
(82, 'Luxembourg', 'Europe', 'LUX', 'Le Luxembourg, petit pays au cœur de l Europe, est réputé pour sa stabilité, ses paysages vallonnés et son niveau de vie très élevé. Le bonheur y est l un des plus hauts du continent. Sa taille modeste en fait une destination paisible, raffinée et surprenante.', 14),
(83, 'Madagascar', 'Africa', 'MDG', 'Le Madagascar est une île unique avec une biodiversité exceptionnelle et des paysages variés. Le bonheur repose sur la joie de vivre de sa population et un lien fort avec la nature. Une destination rare et dépaysante.', 143),
(84, 'Malawi', 'Africa', 'MWI', 'Le Malawi est surnommé le cœur chaleureux de l Afrique en raison de l hospitalité de sa population. Ses paysages lacustres et ses montagnes séduisent les voyageurs en quête de nature et de simplicité. Le bonheur y repose sur la convivialité.', 150),
(85, 'Malaisie', 'Asia', 'MYS', 'La Malaisie combine modernité, jungles luxuriantes et îles paradisiaques. Sa population multiculturelle lui confère une richesse unique. Le niveau de bonheur reflète un équilibre entre diversité culturelle, nature et confort moderne.', 80),
(86, 'Mali', 'Africa', 'MLI', 'Le Mali est un pays d Afrique de l Ouest célèbre pour ses traditions musicales et son histoire. Le niveau de bonheur repose sur la force des liens communautaires. Le pays propose des paysages sahéliens et une culture profonde pour les voyageurs curieux.', 128),
(87, 'Malte', 'Europe', 'MLT', NULL, 22),
(88, 'Mauritanie', 'Africa', 'MRT', NULL, 122),
(89, 'Maurice', 'Africa', 'MUS', 'L Île Maurice est une destination tropicale de premier plan, réputée pour ses plages, sa sécurité et son niveau de bonheur élevé. Le pays offre un mélange harmonieux de cultures et un art de vivre apaisant.', 57),
(90, 'Mexique', 'North America', 'MEX', 'Le Mexique est un pays vibrant mêlant plages paradisiaques, culture précolombienne et gastronomie renommée. Son niveau de bonheur repose sur la convivialité et l énergie festive de sa population. Entre sites mayas, eaux turquoise et villes colorées, c est une destination incontournable.', 23),
(91, 'Moldavie', 'Europe', 'MDA', NULL, 71),
(92, 'Mongolie', 'Asia', 'MNG', NULL, 83),
(93, 'Montenegro', 'Europe', 'MNE', NULL, 73),
(94, 'Maroc', 'Africa', 'MAR', 'Le Maroc est un pays aux multiples visages, allant des dunes dorées du Sahara aux montagnes de l Atlas et aux médinas colorées. Sa culture chaleureuse et son sens de l hospitalité contribuent a un bon niveau de bonheur social. Le pays attire les voyageurs en quête de dépaysement, d artisanat authentique et de traditions vivantes.', 89),
(95, 'Mozambique', 'Africa', 'MOZ', 'Le Mozambique est réputé pour son littoral magnifique, ses eaux turquoise et sa culture métissée. Le bonheur y est influencé par la musique, la mer et une ambiance chaleureuse. Une destination tropicale encore préservée.', 123),
(96, 'Myanmar', 'Asia', 'MMR', 'Le Myanmar fascine par ses pagodes d or, ses paysages fluviaux et son calme. Le niveau de bonheur, malgré les défis politiques, est porté par une spiritualité très présente. Le pays reste l un des plus authentiques d Asie.', 131),
(97, 'Namibie', 'Africa', 'NAM', 'La Namibie est un paradis pour les amateurs de paysages désertiques spectaculaires comme le Namib et ses dunes rouges. Son niveau de bonheur est porté par le calme et la connexion à la nature. Une destination inoubliable.', 113),
(98, 'Nepal', 'Asia', 'NPL', 'Le Népal est célèbre pour l Himalaya et des treks parmi les plus beaux du monde. Sa spiritualité bouddhiste et hindouiste crée une atmosphère apaisante. Son niveau de bonheur repose sur la simplicité et la connexion à la nature.', 100),
(99, 'Pays-Bas', 'Europe', 'NLD', 'Les Pays Bas sont un pays moderne, connu pour ses canaux, ses vélos et son esprit d ouverture. Leur niveau de bonheur élevé reflète une société harmonieuse et progressive. Idéal pour les voyageurs en quête de culture, de nature et de villes innovantes.', 5),
(100, 'Nouvelle-Zélande', 'Oceania', 'NZL', 'La Nouvelle Zélande est célèbre pour ses paysages mythiques entre montagnes, fjords et forêts, ainsi que pour sa population chaleureuse. Son niveau de bonheur est parmi les plus élevés du monde, lié a un mode de vie paisible et tourné vers la nature. Une destination privilégiée pour les amateurs de randonnée, d aventures et de grands espaces.', 8),
(101, 'Nicaragua', 'North America', 'NIC', 'Le Nicaragua offre une ambiance paisible, des volcans, des lacs et une culture accueillante. Le bonheur repose sur un mode de vie simple et chaleureux. Une destination authentique et naturelle.', 45),
(102, 'Niger', 'Africa', 'NER', 'Le Niger est un pays sahélien offrant des paysages désertiques spectaculaires et une population chaleureuse. Le bonheur y est porté par la résilience et les valeurs communautaires. Le pays propose une immersion authentique dans la vie traditionnelle du désert.', 114),
(103, 'Nigeria', 'Africa', 'NGA', 'Le Nigeria, pays le plus peuplé d Afrique, possède une énergie vibrante, une culture riche et une créativité foisonnante. Le bonheur dépend fortement de la dynamique sociale et familiale. Lagos et Abuja attirent les voyageurs curieux de modernité africaine.', 85),
(104, 'Macedoine du Nord', 'Europe', 'MKD', NULL, 84),
(105, 'Norvège', 'Europe', 'NOR', 'La Norvège est célèbre pour ses fjords spectaculaires, ses montagnes et son niveau de bonheur exceptionnel. Sa qualité de vie et sa nature grandiose attirent les voyageurs en quête d authenticité et de calme. Le pays incarne l harmonie entre homme et nature.', 3),
(106, 'Pakistan', 'Asia', 'PAK', 'Le Pakistan propose montagnes impressionnantes, vallées verdoyantes et patrimoine historique riche. Le bonheur local est porté par une profonde hospitalité et un esprit communautaire. Le pays attire les voyageurs en quête d authenticité.', 67),
(107, 'Panama', 'North America', 'PAN', 'Le Panama est un pays moderne reliant deux océans, connu pour son canal, ses plages et sa nature tropicale. Le bonheur dépend d un bon niveau de sécurité et d un mode de vie détendu. Une destination énergique et contrastée.', 31),
(108, 'Paraguay', 'South America', 'PRY', 'Le Paraguay est un pays authentique et discret, apprécié pour sa tranquillité, sa nature et une forte cohésion sociale. Le bonheur y repose sur la simplicité de vie et l hospitalité. Une destination encore préservée du tourisme de masse.', 63),
(109, 'Perou', 'South America', 'PER', 'Le Pérou est une terre d histoire, célèbre pour le Machu Picchu, les Andes et sa cuisine parmi les meilleures au monde. Le bonheur péruvien est influencé par la richesse culturelle et la fierté nationale. Le pays offre un voyage intense et mémorable.', 65),
(110, 'Philippines', 'Asia', 'PHL', 'Les Philippines offrent plages tropicales, îles paradisiaques et une hospitalité chaleureuse. La joie de vivre de sa population contribue fortement au niveau de bonheur. Le pays est idéal pour les amateurs de plongée et d aventures marines.', 69),
(111, 'Pologne', 'Europe', 'POL', 'La Pologne combine histoire, modernité et paysages variés. Son niveau de bonheur augmente grâce à un dynamisme culturel et social. Le pays attire les visiteurs curieux de patrimoine et de nature.', 40),
(112, 'Portugal', 'Europe', 'PRT', 'Le Portugal offre un climat doux, des villages pittoresques et un rythme de vie apaisant. Son niveau de bonheur élevé reflète une grande qualité de vie et un peuple accueillant. Des plages de l Algarve aux rues de Lisbonne, le pays attire ceux qui recherchent authenticité et tranquillité.', 66),
(113, 'Qatar', 'Asia', 'QAT', 'Le Qatar est un pays moderne du Golfe où traditions et innovations coexistent. Le niveau de bonheur est élevé grâce à un haut niveau de vie. Les voyageurs apprécient son architecture, sa sécurité et ses musées.', 29),
(114, 'Roumanie', 'Europe', 'ROU', 'La Roumanie offre châteaux, Carpates et villages traditionnels. Son niveau de bonheur est porté par la simplicité et la nature. Le pays séduit les voyageurs en quête d authenticité.', 48),
(115, 'Russie', 'Europe', 'RUS', 'La Russie surprend par son immense diversité culturelle et naturelle, avec un bonheur qui varie selon les régions mais une richesse incomparable.', 68),
(116, 'Rwanda', 'Africa', 'RWA', 'Le Rwanda, pays des mille collines, est un exemple de renaissance et d harmonie. Son niveau de bonheur progresse grâce à la stabilité et à la beauté de ses paysages. Une destination émouvante et inspirante.', 152),
(117, 'Arabie Saoudite', 'Asia', 'SAU', 'L Arabie Saoudite propose déserts majestueux, oasis et un patrimoine historique riche. Le niveau de bonheur évolue avec les réformes modernes du pays. Une destination culturelle en plein essor.', 28),
(118, 'Senegal', 'Africa', 'SEN', NULL, 111),
(119, 'Serbie', 'Europe', 'SRB', 'La Serbie propose une culture riche, une gastronomie savoureuse et une hospitalité chaleureuse. Son niveau de bonheur est porté par un mode de vie convivial. Le pays attire les voyageurs curieux d authenticité et de traditions.', 70),
(120, 'Sierra Leone', 'Africa', 'SLE', 'La Sierra Leone possède de magnifiques plages et une nature généreuse. Le bonheur des habitants repose sur la résilience et un esprit communautaire fort. La destination reste encore méconnue, ce qui en fait un lieu préservé.', 129),
(121, 'Singapour', 'Asia', 'SGP', 'Singapour est une cité État moderne, propre et très sécurisée. Son niveau de bonheur élevé provient d une qualité de vie exceptionnelle. Mélange de cultures, jardins futuristes et gastronomie variée en font une destination moderne et surprenante.', 34),
(122, 'Slovaquie', 'Europe', 'SVK', 'La Slovaquie propose des montagnes, des châteaux et une culture accueillante. Son niveau de bonheur est en progression grâce à un environnement naturel préservé.', 38),
(123, 'Slovenie', 'Europe', 'SVN', 'La Slovénie est un joyau vert de l Europe, offrant montagnes, lacs et une qualité de vie impressionnante. Son niveau de bonheur reflète une société paisible et proche de la nature.', 44),
(124, 'Somalie', 'Africa', 'SOM', NULL, 112),
(125, 'Afrique du Sud', 'Africa', 'ZAF', 'L Afrique du Sud séduit par ses paysages spectaculaires et sa diversité culturelle, avec un niveau de bonheur contrasté mais une énergie unique.', 106),
(126, 'Corée du Sud', 'Asia', 'KOR', 'La Corée du Sud est un pays dynamique mêlant culture pop, technologie et patrimoine historique. Montagnes, palais anciens et cuisine savoureuse en font une destination captivante. Son niveau de bonheur progresse grâce à une qualité de vie en constante amélioration.', 54),
(127, 'Soudan du Sud', 'Africa', 'SSD', 'Le Soudan du Sud possède une nature préservée, de vastes savanes et des traditions ancestrales. Malgré des difficultés internes, le peuple affiche une grande chaleur humaine. Le pays offre une immersion rare dans un environnement authentique.', 156),
(128, 'Espagne', 'Europe', 'ESP', 'L Espagne est réputée pour son climat ensoleillé, ses plages, son ambiance festive et ses villes riches en patrimoine. Le pays présente un bon niveau de bonheur, nourri par une culture de convivialité et de détente. Il séduit les voyageurs en quête de soleil et de traditions méditerranéennes.', 30),
(129, 'Sri Lanka', 'Asia', 'LKA', 'Le Sri Lanka enchante par ses plages, ses temples, ses plantations de thé et sa faune luxuriante. Son niveau de bonheur reflète la douceur de vivre et la chaleur de sa population. Un paradis pour les amoureux de nature et de culture.', 130),
(130, 'Suède', 'Europe', 'SWE', 'La Suède se démarque par ses forêts immenses, son design moderne et son bien etre élevé. Sa société harmonieuse et sa nature préservée offrent un cadre idéal pour un voyage serein. Le pays allie innovation et respect de l environnement.', 7),
(131, 'Suisse', 'Europe', 'CHE', 'La Suisse offre des paysages alpins majestueux, des lacs cristallins et un niveau de bonheur parmi les plus élevés au monde. Le pays est synonyme de sérénité, de qualité de vie et de précision. Ses villes élégantes et sa nature intacte attirent les voyageurs exigeants.', 6),
(132, 'Syrie', 'Asia', 'SYR', NULL, 149),
(133, 'Tajikistan', 'Asia', 'TJK', 'Le Tadjikistan est un pays montagneux où les traditions persanes sont encore vivantes. Son bonheur repose sur une grande solidarité et un lien fort avec la nature. Les paysages y sont parmi les plus sauvages d Asie centrale.', 74),
(134, 'Tanzanie', 'Africa', 'TZA', NULL, 153),
(135, 'Thailande', 'Asia', 'THA', 'La Thaïlande est célèbre pour son ambiance chaleureuse, ses temples dorés, ses îles tropicales et sa cuisine savoureuse. Le pays est souvent associé au sourire, reflet d un bonheur simple et partagé. Une destination parfaite pour la détente et l aventure.', 52),
(136, 'Togo', 'Africa', 'TGO', 'Le Togo propose plages, collines et marchés colorés. Le bonheur dépend de la chaleur humaine et d un rythme de vie modéré. Le pays attire les visiteurs en quête de simplicité et de rencontres authentiques.', 139),
(137, 'Trinité-et-Tobago', 'North America', 'TTO', 'Trinidad et Tobago offrent une culture vibrante, des plages tropicales et une scène musicale très riche. Le bonheur repose sur l énergie festive et multiculturelle du pays. Parfait pour les voyageurs en quête d authenticité caribéenne.', 39),
(138, 'Tunisie', 'Africa', 'TUN', 'La Tunisie charme par ses plages méditerranéennes, ses oasis et ses sites archéologiques. Son niveau de bonheur repose sur une vie sociale riche et un climat agréable. Le pays séduit les visiteurs par sa douceur de vivre, sa cuisine parfumée et son patrimoine historique.', 124),
(139, 'Turquie', 'Asia', 'TUR', 'La Turquie offre un mélange unique d Europe et d Asie, de paysages variés et d hospitalité, avec un bonheur influencé par sa culture chaleureuse.', 79),
(140, 'Turkmenistan', 'Asia', 'TKM', 'Le Turkménistan, marqué par ses déserts et ses villes modernes, propose une culture unique. Son niveau de bonheur est influencé par la tradition et le calme de ses paysages. Un pays mystérieux et captivant.', 87),
(141, 'Ouganda', 'Africa', 'UGA', NULL, 136),
(142, 'Ukraine', 'Europe', 'UKR', 'L Ukraine possède une culture profonde, des paysages variés et un fort esprit communautaire. Malgré des défis, son bonheur repose sur la solidarité. Le pays attire les voyageurs pour son patrimoine et son authenticité.', 133),
(143, 'Emirats arabes unis', 'Asia', 'ARE', 'Les Émirats Arabes Unis allient luxe, modernité et tradition. Dubai et Abu Dhabi offrent confort, sécurité et un niveau de bien etre élevé. Le pays attire les voyageurs à la recherche de modernité et de soleil.', 21),
(144, 'Royaume-Uni', 'Europe', 'GBR', 'Le Royaume Uni offre un mélange unique de traditions, de culture moderne et de paysages verdoyants, avec un niveau de bonheur stable qui charme les voyageurs.', 15),
(145, 'États-Unis', 'North America', 'USA', 'Les États Unis offrent une diversité incroyable de paysages, allant des grands parcs nationaux aux mégalopoles iconiques comme New York et Los Angeles. Le bonheur y varie selon les régions, mais le pays reste l un des plus influents et dynamiques au monde. Sa richesse culturelle, sa créativité et ses possibilités infinies en font une destination fascinante pour tous les types de voyageurs.', 19),
(146, 'Uruguay', 'South America', 'URY', 'L Uruguay est un pays calme et moderne, réputé pour son niveau de bonheur élevé, ses plages tranquilles et son mode de vie paisible. Il séduit les voyageurs en quête de sérénité, de nature et d une ambiance décontractée.', 33),
(147, 'Ouzbekistan', 'Asia', 'UZB', 'L Ouzbékistan émerveille par ses villes de la Route de la Soie, ses mosquées bleues et ses traditions millénaires. Le bonheur repose sur un fort sens de l hospitalité. Le pays est idéal pour un voyage culturel d exception.', 41),
(148, 'Venezuela', 'South America', 'VEN', 'Le Venezuela possède des paysages spectaculaires comme l Angel Falls et la Gran Sabana. Malgré des défis internes, le bonheur repose sur la solidarité et le sens de la fête. Le pays offre une nature grandiose.', 108),
(149, 'Vietnam', 'Asia', 'VNM', 'Le Vietnam offre une grande diversité de paysages, des rizières en terrasses aux baies spectaculaires. Sa culture riche et sa cuisine appréciée dans le monde entier séduisent les voyageurs. Son niveau de bonheur est porté par la solidarité et la douceur de vivre.', 94),
(159, 'Yemen', 'Asia', 'YEM', NULL, 151),
(160, 'Zambie', 'Africa', 'ZMB', 'La Zambie est une destination de safaris réputée, avec une population accueillante et une nature abondante. Le bonheur est influencé par la tranquillité et les paysages majestueux. Le pays séduit les amateurs d aventures.', 138),
(161, 'Zimbabwe', 'Africa', 'ZWE', 'Le Zimbabwe possède des paysages variés, notamment les célèbres chutes Victoria. Son bonheur repose sur la chaleur humaine et la fierté culturelle. Le pays offre une nature spectaculaire.', 146);

-- --------------------------------------------------------

--
-- Structure de la table `tourisme`
--

CREATE TABLE `tourisme` (
  `id_tourisme` int NOT NULL,
  `id_pays` int DEFAULT NULL,
  `annee` int DEFAULT NULL,
  `nombre_touristes` float DEFAULT NULL,
  `revenus_tourisme` float DEFAULT NULL,
  `sans_emplois` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `tourisme`
--

INSERT INTO `tourisme` (`id_tourisme`, `id_pays`, `annee`, `nombre_touristes`, `revenus_tourisme`, `sans_emplois`) VALUES
(1, 1, 2019, NULL, 5.60775, NULL),
(2, 2, 2019, 6406000, 50.9706, 11.466),
(3, 3, 2019, 2371000, 0.363152, NULL),
(4, 4, 2019, 7399000, 7.07064, 9.843),
(5, 5, 2019, 1894000, 26.6849, 9.794),
(6, 6, 2019, 9466000, 14.0137, 5.159),
(7, 7, 2019, 31884000, 10.4768, 4.56),
(8, 8, 2019, 3170000, 8.47878, 5),
(9, 9, 2019, 11061000, 12.8411, NULL),
(10, 10, 2019, 323000, 0.869642, NULL),
(11, 11, 2019, 11832000, 3.07327, 4.165),
(12, 12, 2019, 9343000, 2.37596, 5.364),
(13, 13, 2019, 337000, 6.71867, 1.214),
(14, 14, 2019, 316000, 15.4335, 2.72),
(15, 15, 2019, 1239000, 9.51212, 3.682),
(16, 16, 2019, 1198000, 14.9415, 15.692),
(17, 17, 2019, NULL, 11.4374, 20.094),
(18, 18, 2019, 6353000, 2.36723, 11.936),
(19, 19, 2019, 12552000, 10.9738, 4.23),
(20, 20, 2019, 143000, 3.87226, 1.56),
(21, 21, 2019, NULL, NULL, NULL),
(22, 22, 2019, 6611000, 25.2083, 0.499),
(23, 23, 2019, 1021000, 8.80892, NULL),
(24, 24, 2019, 32430000, NULL, 5.69),
(25, 25, 2019, 87000, NULL, NULL),
(26, 26, 2019, 81000, NULL, NULL),
(27, 27, 2019, 5431000, 4.2444, 7.493),
(28, 28, 2019, 162538000, NULL, 5.15),
(29, 29, 2019, 4531000, 13.218, 10.28),
(30, 30, 2019, 45100, 51.1217, NULL),
(31, 31, 2019, NULL, NULL, NULL),
(32, 32, 2019, NULL, NULL, NULL),
(33, 33, 2019, 3366000, 18.8266, 10.807),
(34, 34, 2019, 60021000, 38.0023, 6.617),
(35, 35, 2019, 4117000, 16.3599, 7.155),
(36, 36, 2019, 37202000, 4.25843, 2.015),
(37, 37, 2019, 33093000, NULL, 5.018),
(38, 38, 2019, 7550000, NULL, 6.356),
(39, 39, 2019, 2108000, 8.82388, 3.812),
(40, 40, 2019, 13026000, 26.6355, 7.851),
(41, 41, 2019, 2639000, 20.6536, 4.17),
(42, 42, 2019, 6103000, 10.0644, 4.514),
(43, 43, 2019, 812000, 46.5065, NULL),
(44, 44, 2019, 3290000, 5.48083, 6.695),
(45, 45, 2019, 217877000, 7.98827, 8.415),
(46, 46, 2019, NULL, NULL, NULL),
(47, 47, 2019, 620000, 43.5859, NULL),
(48, 48, 2019, 7726000, 37.1986, 11.565),
(49, 49, 2019, 39563000, 3.47314, 3.163),
(50, 50, 2019, NULL, 5.82205, NULL),
(51, 51, 2019, 34005000, 28.3344, 17.045),
(52, 52, 2019, 2560000, 9.02512, 2.193),
(53, 53, 2019, NULL, 0.257379, 5.018),
(54, 54, 2019, 938000, NULL, NULL),
(55, 55, 2019, 2315000, 7.67638, 5.698),
(56, 56, 2019, 55913000, 5.06906, 2.917),
(57, 57, 2019, 61397000, 7.6467, 3.419),
(58, 58, 2019, 2202000, NULL, 3.507),
(59, 59, 2019, 17914000, 5.79837, 6.51),
(60, 60, 2019, 16107000, 9.19805, 3.59),
(61, 61, 2019, 9107000, NULL, 10.74),
(62, 62, 2019, NULL, 4.04149, NULL),
(63, 63, 2019, 10951000, 2.77221, 4.95),
(64, 64, 2019, 4905000, 7.24817, 3.731),
(65, 65, 2019, 95399000, 8.15999, 9.952),
(66, 66, 2019, 2070000, 3.99182, 2.401),
(67, 67, 2019, 4233000, NULL, 4.987),
(68, 68, 2019, 31881000, 5.43967, 2.351),
(69, 69, 2019, 5361000, 41.8364, 16.801),
(70, 70, 2019, 8515000, 4.34202, 4.8),
(71, 71, 2019, 2049000, 15.3601, 5.014),
(72, 72, 2019, NULL, NULL, 25.069),
(73, 73, 2019, 8565000, 1.64485, NULL),
(74, 74, 2019, 8508000, 22.7821, 4.295),
(75, 75, 2019, 4791000, 13.9438, NULL),
(76, 76, 2019, 8342000, NULL, 6.312),
(77, 77, 2019, 1936000, 47.8735, 11.301),
(78, 78, 2019, 1142000, NULL, 16.876),
(79, 79, 2019, NULL, NULL, NULL),
(80, 80, 2019, NULL, NULL, NULL),
(81, 81, 2019, 6150000, NULL, 6.255),
(82, 82, 2019, 1041000, 3.92733, 5.592),
(83, 83, 2019, 486000, 23.2998, NULL),
(84, 84, 2019, NULL, 4.28567, NULL),
(85, 85, 2019, 26101000, 9.3136, 3.26),
(86, 86, 2019, 217000, NULL, 3.29),
(87, 87, 2019, 3519000, NULL, 3.627),
(88, 88, 2019, NULL, 0.542632, 10.416),
(89, 89, 2019, 1418000, 38.4924, 6.331),
(90, 90, 2019, 97406000, 5.11718, 3.477),
(91, 91, 2019, 174000, 14.3911, 1.466),
(92, 92, 2019, 637000, 7.18905, 9.024),
(93, 93, 2019, 2510000, 52.6263, 15.128),
(94, 94, 2019, 13109000, 22.5867, NULL),
(95, 95, 2019, 2033000, 5.66652, NULL),
(96, 96, 2019, 4364000, 14.2724, 0.407),
(97, 97, 2019, 1651000, 9.84112, NULL),
(98, 98, 2019, 1197000, 29.3813, NULL),
(99, 99, 2019, 20129000, 2.9935, 3.379),
(100, 100, 2019, 3888000, NULL, 4.109),
(101, 101, 2019, 1455000, NULL, NULL),
(102, 102, 2019, 192000, 9.37508, 0.532),
(103, 103, 2019, NULL, 2.10363, 10.695),
(104, 104, 2019, 758000, 5.14079, 17.414),
(105, 105, 2019, 5879000, 4.81268, 3.684),
(106, 106, 2019, NULL, 3.23442, 4.83),
(107, 107, 2019, 2494000, 24.848, 6.409),
(108, 108, 2019, 4368000, 2.85636, 6.595),
(109, 109, 2019, 5275000, 8.60157, 3.379),
(110, 110, 2019, 8261000, 12.0909, 2.237),
(111, 111, 2019, 88515000, 4.95492, 3.267),
(112, 112, 2019, 17283000, 23.4554, 6.464),
(113, 113, 2019, 2136500, 16.9991, 0.1),
(114, 114, 2019, 12815000, 4.20213, 3.912),
(115, 115, 2019, 24419000, 3.57805, 4.513),
(116, 116, 2019, 1634000, 28.2036, 11.236),
(117, 117, 2019, 20292000, 6.94361, 5.636),
(118, 118, 2019, NULL, NULL, 2.863),
(119, 119, 2019, 1847000, 7.65486, 10.395),
(120, 120, 2019, 71000, NULL, NULL),
(121, 121, 2019, 19116000, NULL, 3.1),
(122, 122, 2019, NULL, 3.44717, 5.761),
(123, 123, 2019, 4702000, 7.36662, 4.446),
(124, 124, 2019, NULL, NULL, 18.828),
(125, 125, 2019, 14797000, 8.5644, 28.468),
(126, 126, 2019, 17503000, 3.85401, 3.746),
(127, 127, 2019, NULL, NULL, NULL),
(128, 128, 2019, 126170000, NULL, 14.105),
(129, 129, 2019, 2027000, 24.0184, 4.67),
(130, 130, 2019, 7616000, NULL, 6.833),
(131, 131, 2019, 11818000, 4.44238, 4.394),
(132, 132, 2019, 2424000, NULL, NULL),
(133, 133, 2019, NULL, 14.403, NULL),
(134, 134, 2019, 1527000, 27.1728, NULL),
(135, 135, 2019, 39916000, 19.8751, 0.716),
(136, 136, 2019, 876000, 15.8546, 2.036),
(137, 137, 2019, 480000, 5.02832, 3.523),
(138, 138, 2019, 9429000, 19.5251, 17.153),
(139, 139, 2019, 51747000, 16.3138, 13.73),
(140, 140, 2019, NULL, NULL, NULL),
(141, 141, 2019, 1543000, 22.6838, 2.563),
(142, 142, 2019, 13710000, 4.08301, 8.194),
(143, 143, 2019, 25282000, NULL, 2.331),
(144, 144, 2019, 40857000, NULL, 3.657),
(145, 145, 2019, 165478000, 9.4038, 3.669),
(146, 146, 2019, 3480000, 13.4266, 8.836),
(147, 147, 2019, 6749000, 9.86154, 8.98),
(148, 148, 2019, NULL, NULL, NULL),
(149, 149, 2019, 18009000, 4.21257, 1.681),
(159, 159, 2019, NULL, NULL, NULL),
(160, 160, 2019, 1266000, NULL, 5.542),
(161, 161, 2019, 2294000, 5.41111, 7.373);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `email`, `mot_de_passe`, `nom`) VALUES
(1, 'faizambre@gmail.com', '$2y$10$ppqlSO2cQBxjRk1dM68YdufQIq7SoyA17cvFHAIhq2aECpWAae86.', 'faiz'),
(2, 'aya@gmail.com', '$2y$10$vfYNsVSwPoaLYsp7BfA1H..qAv16QOFDnkgFavMCKOQAZhyGtes8u', 'aya'),
(3, 'victor.croenne16@gmail.com', '$2y$10$2N55MvjFM5m3.oWVPR5I8.K74LYM1V8IMdsD3aePVMcypqYkkDMou', 'Victor CROENNE');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id_avis`),
  ADD UNIQUE KEY `id_utilisateur` (`id_utilisateur`,`code_pays`);

--
-- Index pour la table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id_destination`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Index pour la table `tourisme`
--
ALTER TABLE `tourisme`
  ADD PRIMARY KEY (`id_tourisme`),
  ADD KEY `id_pays` (`id_pays`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id_avis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id_destination` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `tourisme`
--
ALTER TABLE `tourisme`
  ADD CONSTRAINT `tourisme_ibfk_1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

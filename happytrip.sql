SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Base de données : `HappyTrip`
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
) ;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id_avis`, `id_utilisateur`, `code_pays`, `commentaire`, `note`, `date_avis`) VALUES
(1, 1, 'MEX', 'c\'était super', 5, '2025-11-29 18:59:46'),
(3, 1, 'BRA', 'c\'était trop bien.', 4, '2025-11-29 20:04:34');

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
(1, 'Afghanistan', 'Asia', 'AFG', NULL, 154),
(2, 'Albania', 'Europe', 'ALB', NULL, 107),
(3, 'Algeria', 'Africa', 'DZA', NULL, 88),
(4, 'Argentina', 'South America', 'ARG', NULL, 47),
(5, 'Armenia', 'Asia', 'ARM', NULL, 116),
(6, 'Australia', 'Oceania', 'AUS', 'L’Australie est un vaste pays-continent de l’hémisphère sud, célèbre pour ses paysages spectaculaires, sa faune unique et son mode de vie détendu. Des plages paradisiaques de la Gold Coast aux déserts du Centre Rouge en passant par la Grande Barrière de corail, l’Australie offre un environnement naturel exceptionnel. Sydney et Melbourne sont des villes dynamiques et multiculturelles, tandis que l’Outback révèle une culture aborigène millénaire. Destination prisée, le pays séduit par sa nature, son climat et sa qualité de vie.', 11),
(7, 'Austria', 'Europe', 'AUT', NULL, 10),
(8, 'Azerbaijan', 'Asia', 'AZE', NULL, 90),
(9, 'Bahrain', 'Asia', 'BHR', NULL, 37),
(10, 'Bangladesh', 'Asia', 'BGD', NULL, 125),
(11, 'Belarus', 'Europe', 'BLR', NULL, 81),
(12, 'Belgium', 'Europe', 'BEL', NULL, 18),
(13, 'Benin', 'Africa', 'BEN', NULL, 102),
(14, 'Bhutan', 'Asia', 'BTN', NULL, 95),
(15, 'Bolivia', 'South America', 'BOL', 'La Bolivie est un pays d’Amérique du Sud riche en cultures indigènes et en paysages spectaculaires. Elle abrite des sites naturels uniques comme le Salar d’Uyuni, le plus grand désert de sel du monde, ainsi que les montagnes des Andes et l’Altiplano. Ses villes historiques comme La Paz, perchée à plus de 3 500 mètres d’altitude, et Sucre, capitale constitutionnelle, témoignent d’un héritage culturel fort. La Bolivie est une destination authentique où traditions, nature sauvage et diversité ethnique se rencontrent.', 61),
(16, 'Bosnia and Herzegovina', 'Europe', 'BIH', NULL, 78),
(17, 'Botswana', 'Africa', 'BWA', NULL, 148),
(18, 'Brazil', 'South America', 'BRA', NULL, 32),
(19, 'Bulgaria', 'Europe', 'BGR', NULL, 97),
(20, 'Burkina Faso', 'Africa', 'BFA', NULL, 115),
(21, 'Burundi', 'Africa', 'BDI', NULL, 145),
(22, 'Cambodia', 'Asia', 'KHM', NULL, 109),
(23, 'Cameroon', 'Africa', 'CMR', NULL, 96),
(24, 'Canada', 'North America', 'CAN', NULL, 9),
(25, 'Central African Republic', 'Africa', 'CAF', NULL, 155),
(26, 'Chad', 'Africa', 'TCD', NULL, 132),
(27, 'Chile', 'South America', 'CHL', NULL, 26),
(28, 'China', 'Asia', 'CHN', NULL, 93),
(29, 'Colombia', 'South America', 'COL', NULL, 43),
(30, 'Comoros', 'Africa', 'COM', NULL, 142),
(31, 'Congo, Rep.', 'Africa', 'COG', NULL, 103),
(32, 'Congo, Dem. Rep.', 'Africa', 'COD', NULL, 127),
(33, 'Costa Rica', 'North America', 'CRI', NULL, 12),
(34, 'Croatia', 'Europe', 'HRV', NULL, 75),
(35, 'Cyprus', 'Asia', 'CYP', NULL, 49),
(36, 'Czech Republic', 'Europe', 'CZE', NULL, 20),
(37, 'Denmark', 'Europe', 'DNK', NULL, 2),
(38, 'Dominican Republic', 'North America', 'DOM', NULL, 77),
(39, 'Ecuador', 'South America', 'ECU', NULL, 50),
(40, 'Egypt', 'Africa', 'EGY', NULL, 137),
(41, 'El Salvador', 'North America', 'SLV', NULL, 35),
(42, 'Estonia', 'Europe', 'EST', NULL, 55),
(43, 'Ethiopia', 'Africa', 'ETH', NULL, 134),
(44, 'Finland', 'Europe', 'FIN', NULL, 1),
(45, 'France', 'Europe', 'FRA', 'La France est un pays d’Europe de l’Ouest reconnu pour la richesse de son patrimoine culturel, sa gastronomie et ses paysages variés. De la Tour Eiffel aux plages de la Côte d’Azur, en passant par les vignobles de Bordeaux, les montagnes des Alpes et les villages provençaux, le pays offre une diversité unique. Paris, capitale mondiale de l’art et de la mode, attire chaque année des millions de visiteurs. La France est également réputée pour son histoire, ses musées, sa culture et son art de vivre, faisant d’elle l’une des destinations touristiques les plus populaires au monde.', 24),
(46, 'Gabon', 'Africa', 'GAB', NULL, 104),
(47, 'Gambia', 'Africa', 'GMB', NULL, 120),
(48, 'Georgia', 'Asia', 'GEO', NULL, 119),
(49, 'Germany', 'Europe', 'DEU', NULL, 17),
(50, 'Ghana', 'Africa', 'GHA', NULL, 98),
(51, 'Greece', 'Europe', 'GRC', NULL, 82),
(52, 'Guatemala', 'North America', 'GTM', NULL, 27),
(53, 'Guinea', 'Africa', 'GIN', NULL, 118),
(54, 'Haiti', 'North America', 'HTI', NULL, 147),
(55, 'Honduras', 'North America', 'HND', NULL, 59),
(56, 'Hong Kong', 'Asia', 'HKG', NULL, 76),
(57, 'Hungary', 'Europe', 'HUN', NULL, 62),
(58, 'Iceland', 'Europe', 'ISL', NULL, 4),
(59, 'India', 'Asia', 'IND', NULL, 140),
(60, 'Indonesia', 'Asia', 'IDN', NULL, 92),
(61, 'Iran', 'Asia', 'IRN', NULL, 117),
(62, 'Iraq', 'Asia', 'IRQ', NULL, 126),
(63, 'Ireland', 'Europe', 'IRL', NULL, 16),
(64, 'Israel', 'Asia', 'ISR', NULL, 13),
(65, 'Italy', 'Europe', 'ITA', NULL, 36),
(66, 'Ivory Coast', 'Africa', 'CIV', NULL, 99),
(67, 'Jamaica', 'North America', 'JAM', NULL, 56),
(68, 'Japan', 'Asia', 'JPN', NULL, 58),
(69, 'Jordan', 'Asia', 'JOR', NULL, 101),
(70, 'Kazakhstan', 'Asia', 'KAZ', NULL, 60),
(71, 'Kenya', 'Africa', 'KEN', NULL, 121),
(72, 'Kosovo', 'Europe', 'XKX', NULL, 46),
(73, 'Kuwait', 'Asia', 'KWT', NULL, 51),
(74, 'Kyrgyzstan', 'Asia', 'KGZ', NULL, 86),
(75, 'Laos', 'Asia', 'LAO', NULL, 105),
(76, 'Latvia', 'Europe', 'LVA', NULL, 53),
(77, 'Lebanon', 'Asia', 'LBN', NULL, 91),
(78, 'Lesotho', 'Africa', 'LSO', NULL, 144),
(79, 'Liberia', 'Africa', 'LBR', NULL, 141),
(80, 'Libya', 'Africa', 'LBY', NULL, 72),
(81, 'Lithuania', 'Europe', 'LTU', NULL, 42),
(82, 'Luxembourg', 'Europe', 'LUX', NULL, 14),
(83, 'Madagascar', 'Africa', 'MDG', NULL, 143),
(84, 'Malawi', 'Africa', 'MWI', NULL, 150),
(85, 'Malaysia', 'Asia', 'MYS', NULL, 80),
(86, 'Mali', 'Africa', 'MLI', NULL, 128),
(87, 'Malta', 'Europe', 'MLT', NULL, 22),
(88, 'Mauritania', 'Africa', 'MRT', NULL, 122),
(89, 'Mauritius', 'Africa', 'MUS', NULL, 57),
(90, 'Mexico', 'North America', 'MEX', NULL, 23),
(91, 'Moldova', 'Europe', 'MDA', NULL, 71),
(92, 'Mongolia', 'Asia', 'MNG', NULL, 83),
(93, 'Montenegro', 'Europe', 'MNE', NULL, 73),
(94, 'Morocco', 'Africa', 'MAR', NULL, 89),
(95, 'Mozambique', 'Africa', 'MOZ', NULL, 123),
(96, 'Myanmar', 'Asia', 'MMR', NULL, 131),
(97, 'Namibia', 'Africa', 'NAM', NULL, 113),
(98, 'Nepal', 'Asia', 'NPL', NULL, 100),
(99, 'Netherlands', 'Europe', 'NLD', NULL, 5),
(100, 'New Zealand', 'Oceania', 'NZL', NULL, 8),
(101, 'Nicaragua', 'North America', 'NIC', NULL, 45),
(102, 'Niger', 'Africa', 'NER', NULL, 114),
(103, 'Nigeria', 'Africa', 'NGA', NULL, 85),
(104, 'North Macedonia', 'Europe', 'MKD', NULL, 84),
(105, 'Norway', 'Europe', 'NOR', NULL, 3),
(106, 'Pakistan', 'Asia', 'PAK', NULL, 67),
(107, 'Panama', 'North America', 'PAN', NULL, 31),
(108, 'Paraguay', 'South America', 'PRY', NULL, 63),
(109, 'Peru', 'South America', 'PER', NULL, 65),
(110, 'Philippines', 'Asia', 'PHL', NULL, 69),
(111, 'Poland', 'Europe', 'POL', NULL, 40),
(112, 'Portugal', 'Europe', 'PRT', NULL, 66),
(113, 'Qatar', 'Asia', 'QAT', NULL, 29),
(114, 'Romania', 'Europe', 'ROU', NULL, 48),
(115, 'Russia', 'Europe', 'RUS', NULL, 68),
(116, 'Rwanda', 'Africa', 'RWA', NULL, 152),
(117, 'Saudi Arabia', 'Asia', 'SAU', NULL, 28),
(118, 'Senegal', 'Africa', 'SEN', NULL, 111),
(119, 'Serbia', 'Europe', 'SRB', NULL, 70),
(120, 'Sierra Leone', 'Africa', 'SLE', NULL, 129),
(121, 'Singapore', 'Asia', 'SGP', NULL, 34),
(122, 'Slovakia', 'Europe', 'SVK', NULL, 38),
(123, 'Slovenia', 'Europe', 'SVN', NULL, 44),
(124, 'Somalia', 'Africa', 'SOM', NULL, 112),
(125, 'South Africa', 'Africa', 'ZAF', NULL, 106),
(126, 'South Korea', 'Asia', 'KOR', NULL, 54),
(127, 'South Sudan', 'Africa', 'SSD', NULL, 156),
(128, 'Spain', 'Europe', 'ESP', NULL, 30),
(129, 'Sri Lanka', 'Asia', 'LKA', NULL, 130),
(130, 'Sweden', 'Europe', 'SWE', NULL, 7),
(131, 'Switzerland', 'Europe', 'CHE', NULL, 6),
(132, 'Syria', 'Asia', 'SYR', NULL, 149),
(133, 'Tajikistan', 'Asia', 'TJK', NULL, 74),
(134, 'Tanzania', 'Africa', 'TZA', NULL, 153),
(135, 'Thailand', 'Asia', 'THA', NULL, 52),
(136, 'Togo', 'Africa', 'TGO', NULL, 139),
(137, 'Trinidad & Tobago', 'North America', 'TTO', NULL, 39),
(138, 'Tunisia', 'Africa', 'TUN', NULL, 124),
(139, 'Turkey', 'Asia', 'TUR', NULL, 79),
(140, 'Turkmenistan', 'Asia', 'TKM', NULL, 87),
(141, 'Uganda', 'Africa', 'UGA', NULL, 136),
(142, 'Ukraine', 'Europe', 'UKR', NULL, 133),
(143, 'United Arab Emirates', 'Asia', 'ARE', NULL, 21),
(144, 'United Kingdom', 'Europe', 'GBR', NULL, 15),
(145, 'United States', 'North America', 'USA', 'Les États-Unis forment un vaste pays d’Amérique du Nord connu pour la diversité de ses paysages, sa puissance économique et son influence culturelle mondiale. Du Grand Canyon aux gratte-ciel de New York, en passant par les plages de Californie, les parcs nationaux, Miami ou encore Las Vegas, chaque région possède une identité forte. Terre d’innovation, de diversité et d’opportunités, le pays attire des millions de visiteurs grâce à ses grandes métropoles, ses routes mythiques et ses lieux naturels emblématiques.', 19),
(146, 'Uruguay', 'South America', 'URY', NULL, 33),
(147, 'Uzbekistan', 'Asia', 'UZB', NULL, 41),
(148, 'Venezuela', 'South America', 'VEN', NULL, 108),
(149, 'Viet nam', 'Asia', 'VNM', NULL, 94),
(159, 'Yemen', 'Asia', 'YEM', NULL, 151),
(160, 'Zambia', 'Africa', 'ZMB', NULL, 138),
(161, 'Zimbabwe', 'Africa', 'ZWE', NULL, 146);

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
(1, 'victor.croenne16@gmail.com', '$2y$10$5HfcODc1/mF.M4t5cc8SeOsIM3MJgb2OEMrZLv/dqqR3D2bsqOCTS', 'Victor Croenne');

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
  MODIFY `id_avis` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `tourisme`
--
ALTER TABLE `tourisme`
  ADD CONSTRAINT `tourisme_ibfk_1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`);
COMMIT;


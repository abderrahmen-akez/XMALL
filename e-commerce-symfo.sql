-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 01 jan. 2026 à 19:38
-- Version du serveur :  8.0.28-0ubuntu0.20.04.3
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce-symfo`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(2, 2, 'Test', 'fffs', 'Colemansqdf', 'Mcdowell Trujillo Associates', '9 rue Ut qui voluptas nobi', '15554', 'Dolorum voluptas per', 'HN', '+1 (707) 437-6409'),
(3, 18, 'Noelani Hubbard', 'Laura', 'Meadows', 'Miranda and Mathis Plc', 'Rem officiis in sed', 'Voluptas do sed corr', 'Laudantium est ex d', 'MT', '+1 (993) 958-2319'),
(4, 18, 'Keefe Delgado', 'Shaeleigh', 'Banks', 'Hernandez England LLC', 'Dolore sit libero d', 'Illo voluptas quam o', 'Labore veniam culpa', 'QA', '+1 (714) 646-6032'),
(5, 18, 'Chase Farmer', 'Alexandra', 'York', 'Hays Dixon Co', 'Nostrud dolorum eius', 'Cupidatat numquam en', 'Quam eum voluptatem', 'LR', '+1 (147) 666-1511'),
(6, 27, 'Kevyn Meyers', 'Claudia', 'Shaffer', 'Gross Cameron LLC', 'Aut accusamus dolore', '33510', 'Ander', 'LK', '+1 (714) 559-5162');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Chronopost', 'Livraison standard à domicile en 2 jours ouvrés.', 400),
(2, 'La Poste', 'Si vous préférez trouver dans votre boite à lettres un avis de passage à la place de votre commande.', 190);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'Manteaux'),
(3, 'Echarpes'),
(4, 'Bonnets'),
(5, 'T-shirts'),
(6, 'Chaussures'),
(7, 'Lunettes'),
(8, 'Chapeaux'),
(9, 'Casquettes');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220216090224', '2026-02-16 09:02:53', 195),
('DoctrineMigrations\\Version20220216094827', '2026-02-16 09:48:41', 54),
('DoctrineMigrations\\Version20220218171218', '2026-02-18 17:12:29', 198),
('DoctrineMigrations\\Version20220219105301', '2026-02-19 10:53:16', 221),
('DoctrineMigrations\\Version20220220215719', '2026-02-20 21:57:28', 237),
('DoctrineMigrations\\Version20220222211707', '2026-02-22 21:17:36', 172),
('DoctrineMigrations\\Version20220226160703', '2026-02-26 16:07:11', 356),
('DoctrineMigrations\\Version20220227163839', '2026-02-27 16:38:48', 677),
('DoctrineMigrations\\Version20220227195406', '2026-03-06 19:10:19', 59),
('DoctrineMigrations\\Version20220320164349', '2026-03-20 17:43:57', 34),
('DoctrineMigrations\\Version20220321141846', '2026-03-21 15:18:54', 55),
('DoctrineMigrations\\Version20220329100058', '2026-03-29 12:01:11', 128),
('DoctrineMigrations\\Version20220401085112', '2026-04-01 10:51:23', 128),
('DoctrineMigrations\\Version20220401092032', '2026-04-01 11:20:39', 28);

-- --------------------------------------------------------

--
-- Structure de la table `headers`
--

CREATE TABLE `headers` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `headers`
--

INSERT INTO `headers` (`id`, `title`, `content`, `btn_title`, `btn_url`, `image`) VALUES
(3, 'Accessoires pour toutes les saisons', 'Laissez vous tenter par nos lunettes, chapeaux aussi bien que nos bonnets ou nos écharpes !', 'Nos articles', '/articles', '2bdbe8484b1ba1c36d19137a2c6b44a314cfdbb8.jpg'),
(4, 'Livraison rapide', 'Profitez de nos services de livraison express, mais aussi de nos retours gratuits ! Essayez, adoptez ou échangez !', 'Je commande', '/articles', '4ba7091fffbc5fa736faa53e65ce7b1d47dd4f8e.jpg'),
(5, 'Chic et élégant', 'Nos derniers articles soldés sur la collection automne', 'Voir', '/articles', 'a92c95e83126727c338110afae40dddb1608e9c4.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `binded_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `binded_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(76, 40, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(77, 40, 'Manteau chaud', 1, 5800, 5800),
(78, 41, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(79, 41, 'Manteau chaud', 1, 5800, 5800),
(80, 42, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(81, 42, 'Manteau chaud', 1, 5800, 5800),
(82, 43, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(83, 43, 'Manteau chaud', 1, 5800, 5800),
(84, 44, 'Manteau chaud', 3, 5800, 17400),
(85, 44, 'Bonnet Rouge et Bleu Pompom', 2, 1600, 3200),
(86, 45, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(87, 46, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(88, 47, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(89, 48, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(90, 50, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(91, 51, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(92, 52, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(93, 53, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(94, 54, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(95, 55, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(96, 56, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(97, 57, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(98, 58, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(99, 59, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(100, 60, 'T-Shirt Moulant', 3, 15800, 47400),
(101, 61, 'Bonnet Rouge Pompom', 1, 1800, 1800),
(102, 61, 'T-shirt Blanc', 1, 1800, 1800),
(103, 62, 'Bonnet Rouge Pompom', 2, 1800, 3600),
(104, 62, 'T-shirt Blanc', 1, 1800, 1800),
(105, 63, 'Bonnet Rouge Pompom', 2, 1800, 3600);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `is_in_home` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `image`, `subtitle`, `description`, `price`, `is_in_home`) VALUES
(2, 4, 'Bonnet Rouge Pompom', 'bonnet-rouge-pompom', 'e0b7e89b60de57f1e4451fd9831be26a102081e4.jpg', 'Restez au chaud avec style', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid.', 1800, 0),
(3, 4, 'Bonnet Rouge et Bleu Pompom', 'bonnet-rouge-et-bleu-pompom', '8bf330b14aefcec1ab92b7c3f475290fd7940275.jpg', 'Restez au chaud avec style (encore)', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut!', 1600, 0),
(4, 3, 'Echarpe Rouge', 'echarpe-rouge', '9ec1111e99942243bf2157e2fbeaa2aec0a485ac.jpg', 'Pour le ski ou la ville', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum!', 1400, 0),
(5, 2, 'Manteau chaud', 'manteau-chaud', '5cf449463c611b07451480da81fa048f208fc974.jpg', 'Pour les hivers rudes', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid.\r\nLorem ipsum dolor sit amet consectetur adipisicing elit.', 5800, 0),
(6, 5, 'T-shirt Blanc', 't-shirt-blanc', 'ee40d9f7990aead7e8695f2eb4599ea1dbb0b1b1.jpg', 'Simple, basique', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum!', 1800, 0),
(7, 3, 'Echarpe Rayée', 'echarpe-rayee', '2153f235c1175c595860b612a4d2657402184a04.jpg', 'La classe à Annemasse', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid.', 1500, 0),
(8, 5, 'T-Shirt Moulant', 't-shirt-moulant', '00a9e824e1a5ba119d9964cc2798fdc3e27b9a84.jpg', 'Pour les bogoss\'', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum!', 15800, 0),
(9, 7, 'Lunettes new aviator', 'lunettes-new-aviator', '9b63b18c0cde83590b9e36eaaac34092e430712c.jpg', 'Intemporel', 'Lunettes sombres unisexe, printemps, été ou automne.', 2400, 0),
(10, 7, 'Lunettes Wayfarer style', 'lunettes-wayfarer-style', 'dc0f8d0f37e4866c5882c01e0841b7f8b271e49d.jpg', 'Promis ce sont des vraies', 'Souvent imitées, jamais égalées, on a la classe ou ne l\'a pas', 9800, 1),
(11, 9, 'Casquette orange', 'casquette-orange', '242b2cf61210f43c231c6fdec081a554c6757e95.jpg', 'Contre le soleil et le bon gout', 'Superbe casquette orange, il faut aimer le orange.', 400, 1),
(12, 6, 'Chaussures Mike', 'chaussures-mike', '985fc0c43bac9473286fd1f4fabe1d14c21485e7.jpg', 'Mieux que l\'originale', 'Pour faire du skate ou pour rien faire sinon c\'est bien aussi rien faire.', 14900, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'qila@mailinator.com', '[]', '$2y$13$XJ6eO87g5wbbYo1VVGsSa.K3ZoY3nxb/AP7jesP.B4pQ5uCTPnWta', 'Abel', 'Cook'),
(2, 'bewebokyt@mailinator.com', '[]', '$2y$13$hbsvJpSPsTAifkSz7EKdnek5JELREFm7AcAD2waapW.CGbPPb9/Xa', 'Cameran', 'Santana'),
(3, 'zohova@mailinator.com', '[]', '$2y$13$V8gb44ppyH26z1aGFrrrg.YHVwNCrO2uoDCODyAqkKb3IehWYw/de', 'Demetrius', 'Barron'),
(5, 'pybozy@mailinator.com', '[]', '$2y$13$TIqH1opO82k7lhHZIQx3RuJcMOOZd4wgpILAC8BQ7Fm0L31Lhrop2', 'Benedict', 'Parker'),
(6, 'doqyre@mailinator.com', '[]', '$2y$13$aS8uwK/U422zKIQPZVan6.xxXHbKDLe0QBu3BrA6cv3bT8NJydCFi', 'Kaseem', 'Boyd'),
(7, 'admin@admin.com', '[]', '$2y$13$sfixY8eaiATRLoXXOsAPHeONkAzCrsnP9tdIOBRgnpxc3ROBgvREW', 'Sierra', 'Michael'),
(8, 'zofyd@mailinator.com', '[]', '$2y$13$5eh2MdTTmp3saxjVSdSDpuuI1U4OFVbfj9rLOMK0MZOeatvcPciSa', 'Portia', 'Rasmussen'),
(9, 'qijab@mailinator.com', '[]', '$2y$13$kZAwoyXojOm5KZWhSGH3aeAaYe1DU3pBkqHnD7Qz328dpbPHuu1L6', 'Ivana', 'Roberson'),
(10, 'suvymez@mailinator.com', '[]', '$2y$13$ygkBzDRFAqErEjNg84CwEOeN3UjCE.QaaGALDmykqQBvP/WIuKF4.', 'Selma', 'Rice'),
(11, 'lykeho@mailinator.com', '[]', '$2y$13$rYh3reJhPHOthgfaKhz/e..5ghtSb0RgIDZQT98iJLyvjmwRhMl0G', 'Amity', 'Myers'),
(12, 'tygemu@mailinator.com', '[]', '$2y$13$nYHb/cULNrIAdteSAtJSiOy4wkZbxfYeAY4los.C9BOBBczF09P0e', 'Alexis', 'Underwood'),
(14, 'wozowiwydi@mailinator.com', '[]', '$2y$13$AFkNQqYChQC6bDQWuO0eVeIhu9jnEMpSCk4e0bT.Cc6gCGWoXHZEi', 'Dustin', 'Collins'),
(16, 'maqatoked@mailinator.com', '[]', '$2y$13$gxSZ/IWhSlUbOeMJpA.qBejCfpRgj1Zz4YgQ0Q7OII51YwzVFjBpW', 'Imani', 'Hodge'),
(17, 'vimelabe@mailinator.com', '[]', '$2y$13$3kJHAAwcWz8/UY7EBPFeIOkfzwrz9HXv2vOZjiA/veXiZr14XGeTi', 'Imogene', 'Mccormick'),
(18, 'dakyridut@mailinator.com', '[\"ROLE_ADMIN\"]', '$2y$13$hi0ATGo5E4HiBtd98kjEoud.CYeEwTUg07dP0vZHVayIYttmK0yqy', 'Gregory', 'Garcia'),
(19, 'kepuxonybu@mailinator.com', '[]', '$2y$13$/RrdovSw1MccwGOhMACuAu1SJYnj1IE3C2lTzjSTgn56Nb99ALCN6', 'Dominic', 'Miles'),
(20, 'xowogavibe@mailinator.com', '[]', '$2y$13$qflQJ4yFJ0xtHsd.el.BYezdsmxTiMifkhcaB.Y.JcpAeBqggUt86', 'Trevor', 'Durham'),
(25, 'pureni@mailinator.com', '[]', '$2y$13$k5rLWE3mYj5ky4oZV1KUNuSSmUQAa.yEOYcNAqOv7FJ9FIaRIy8Ny', 'Lewis', 'Love'),
(26, 'mykopynena@mailinator.com', '[]', '$2y$13$G4nys/saDA5GRlTouafl/O8jXA.PUbCwh9iao.ZSvRJH889HliHn.', 'Willow', 'Rice'),
(27, 'bonnal.tristan91@gmail.com', '[]', '$2y$13$7L4y2VHPe6dqXhCjfSzybO1BWzeYC0usC06KRdycu6xScOvWaJJuS', 'Ainsley', 'Burris'),
(28, 'tegyzob@mailinator.com', '[]', '$2y$13$hdW4kLBteLo0LC5sftuN2.XfJ8mQEuR/ccq.pfBJha46xY8cG1lm.', 'Brendan', 'Cardenas'),
(29, 'wemuj@mailinator.com', '[]', '$2y$13$/JPcAgc9.rFAs/gZRXKEZugbFC23hY1F5P1cRSio3U9PkrxEIb0Ai', 'Lois', 'Levy');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `headers`
--
ALTER TABLE `headers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C17C78A4E3` (`binded_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `headers`
--
ALTER TABLE `headers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C17C78A4E3` FOREIGN KEY (`binded_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

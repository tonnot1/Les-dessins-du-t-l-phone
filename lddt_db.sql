-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2017 at 05:06 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lddt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Humour'),
(2, 'Sport'),
(3, 'Chelou'),
(4, 'Animaux'),
(5, 'Instagram');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `code`) VALUES
(1, 'rouge', 'FF0000'),
(2, 'bleu', '000FFF'),
(3, 'noir', '000000');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `id_draw` int(11) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_critic` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `id_draw`, `pseudo`, `content`, `created_at`, `updated_at`, `id_critic`) VALUES
(1, 33, NULL, 'salut le dessin chaussure', '2017-06-26 14:21:09', '2017-06-26 14:21:09', 4),
(2, 41, NULL, 'salut', '2017-06-27 16:41:23', '2017-06-27 16:41:23', 1),
(3, 41, NULL, 'test', '2017-06-27 16:42:50', '2017-06-27 16:42:50', 1),
(4, 41, NULL, 'trtert', '2017-06-27 16:46:39', '2017-06-27 16:46:39', 1),
(5, 41, NULL, 'youpi', '2017-06-27 16:47:07', '2017-06-27 16:47:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `draw`
--

CREATE TABLE IF NOT EXISTS `draw` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `draw_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_pic` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `draw`
--

INSERT INTO `draw` (`id`, `title`, `draw_path`, `is_online`, `avatar_path`, `author_name`, `created_at`, `updated_at`, `id_category`, `id_pic`, `id_user`, `id_instagram`) VALUES
(32, 'cochonou', NULL, 1, 'marie-ico.jpg', 'marie', '2017-06-23 13:17:23', '2017-06-23 13:17:23', 2, 20, 3, NULL),
(33, 'chaussure', NULL, 1, NULL, NULL, '2017-06-26 11:24:45', '2017-06-26 11:24:45', 2, 25, 3, NULL),
(34, 'lost', NULL, 1, NULL, NULL, '2017-06-26 12:26:38', '2017-06-26 12:26:38', 1, 27, 4, NULL),
(35, 'voiture carré', NULL, 1, NULL, NULL, '2017-06-27 09:22:33', '2017-06-27 09:22:33', 1, 29, 3, NULL),
(36, 'Fred', NULL, 1, NULL, NULL, '2017-06-27 11:23:53', '2017-06-27 11:23:53', 4, 31, 6, NULL),
(39, NULL, NULL, 1, NULL, NULL, '2017-06-27 15:18:56', '2017-06-27 15:18:56', 5, 34, 3, '788536037357371802_1463064591'),
(40, NULL, NULL, 1, NULL, NULL, '2017-06-27 15:18:56', '2017-06-27 15:18:56', 5, 35, 3, '787547144441020928_1463064591'),
(41, NULL, NULL, 1, NULL, NULL, '2017-06-27 15:49:05', '2017-06-27 15:49:05', 5, 36, 3, '1546450836372504976_1463064591');

-- --------------------------------------------------------

--
-- Table structure for table `draw_color`
--

CREATE TABLE IF NOT EXISTS `draw_color` (
  `draw_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `draw_color`
--

INSERT INTO `draw_color` (`draw_id`, `color_id`) VALUES
(32, 1),
(33, 1),
(33, 2),
(33, 3),
(34, 1),
(34, 2),
(35, 3),
(36, 1),
(36, 2);

-- --------------------------------------------------------

--
-- Table structure for table `draw_tag`
--

CREATE TABLE IF NOT EXISTS `draw_tag` (
  `draw_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `draw_tag`
--

INSERT INTO `draw_tag` (`draw_id`, `tag_id`) VALUES
(33, 9),
(35, 10),
(36, 11);

-- --------------------------------------------------------

--
-- Table structure for table `pic`
--

CREATE TABLE IF NOT EXISTS `pic` (
  `id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pic`
--

INSERT INTO `pic` (`id`, `path`) VALUES
(18, 'e058b3eab9392bcf0fe4a40d94e83d43701cd006.jpeg'),
(19, '1c2f8072dc8976c2381ab30fa788783d6a747e56.jpeg'),
(20, 'a4459ad443e7efd4cac9c781b1ffe31a0d8c4478.jpeg'),
(21, 'ba084dba901de79d89882ee6e44df47a62da6ce6.jpeg'),
(22, '28ad45a72e5f0a1b8d2fdd75d3a5b99d55d46926.jpeg'),
(23, 'cdfb4170669ca160028bd87de2287e443f05977a.jpeg'),
(24, '9cb04a8808d8abbb14ac7ff94ee7d63638d410b9.jpeg'),
(25, '42d2bc2b39d0777803cd443bb3e63751ad828fc5.jpeg'),
(26, '7c319537c2848756b2e143b61d5e511399cf2d65.jpeg'),
(27, 'c8f352e76b0368fcd46eccf426100ac7b2589a5d.jpeg'),
(28, '03ae095b35da0c2182cf2c56e716b51952716813.jpeg'),
(29, '500bbfc1c8d29114e64c7066bce14c4f7fd8b240.jpeg'),
(30, '3a20099d3e2c9f3a2ffa5739a3b32c0e66eadf74.jpeg'),
(31, '422d703d68dcf83c7fc1d12c23bb905ff946effc.jpeg'),
(32, 'https://scontent.cdninstagram.com/t51.2885-15/e15/10623601_808717655826783_1637421023_n.jpg'),
(33, 'https://scontent.cdninstagram.com/t51.2885-15/e15/10584567_1452691911659089_1093379851_n.jpg'),
(34, 'https://scontent.cdninstagram.com/t51.2885-15/e15/10623601_808717655826783_1637421023_n.jpg'),
(35, 'https://scontent.cdninstagram.com/t51.2885-15/e15/10584567_1452691911659089_1093379851_n.jpg'),
(36, 'https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/19428961_1386377778122338_7657047401588326400_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'truc'),
(2, 'bic'),
(3, 'tt'),
(4, 'rrzerrze'),
(5, 'test'),
(6, 'titi'),
(7, 'bic'),
(8, 'd'),
(9, 'tag chaussure'),
(10, 'vroom'),
(11, 'coucou');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `id_avatar` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `instagram_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_avatar`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `instagram_username`, `instagram_id`) VALUES
(1, NULL, 'titi2000', 'titi2000', 'm.de.ubeda@gmail.com', 'm.de.ubeda@gmail.com', 1, NULL, '$2y$13$k1foi1GLi7GDV8syAF0kIefxm2TWneOmfPfqKWgCDu3FRD37rMJG2', '2017-06-27 17:00:48', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'lesdessinsdutelephone', '1463064591'),
(2, NULL, 'salut', 'salut', 'm.de.ubeda@gmail.fr', 'm.de.ubeda@gmail.fr', 1, NULL, '$2y$13$UqMuolcZsUVRPpOOkQ4aBOn93vyYlSJybKDta1MUciC0CDluVY7xO', '2017-06-23 16:30:47', NULL, NULL, 'a:0:{}', 'lesdessinsdutelephone', NULL),
(3, 24, 'toto2000', 'toto2000', 'toto@gmail.com', 'toto@gmail.com', 1, NULL, '$2y$13$exD3Yj/FFR.x8Lz8tti7IeXCTXPccgsakR9rVSPdjjxBskGKtD7ya', '2017-06-27 11:24:21', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'lesdessinsdutelephone', NULL),
(4, 26, 'marie', 'marie', 'marie@gmail.com', 'marie@gmail.com', 1, NULL, '$2y$13$PS/aWeBLzptVEuglRfmFK.zUopMaZbB3a1fuoJEHNH.Mv0YMF55Gm', '2017-06-26 12:29:41', NULL, NULL, 'a:0:{}', 'lesdessinsdutelephone', NULL),
(5, 28, 'toto4000', 'toto4000', 'toto4000@gmail.com', 'toto4000@gmail.com', 1, NULL, '$2y$13$ryQO/34W46rdindEDtiRRewDtzWITH79g/tglhbh196hMT50Vd1.W', '2017-06-26 16:51:43', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'lesdessinsdutelephone', NULL),
(6, 30, 'maried', 'maried', 'marie@via-internet.fr', 'marie@via-internet.fr', 1, NULL, '$2y$13$b6k/KuqWLWOFXNbFjyiMeu1Wuu1KvVOXh02EbsN08n8dy3aRMriXG', '2017-06-27 11:23:28', NULL, NULL, 'a:0:{}', 'lesdessinsdutelephone', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CFBD2A10D` (`id_draw`),
  ADD KEY `IDX_9474526CEFD5421C` (`id_critic`);

--
-- Indexes for table `draw`
--
ALTER TABLE `draw`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_70F2BD0F5590B914` (`id_pic`),
  ADD KEY `IDX_70F2BD0F5697F554` (`id_category`),
  ADD KEY `IDX_70F2BD0F6B3CA4B` (`id_user`);

--
-- Indexes for table `draw_color`
--
ALTER TABLE `draw_color`
  ADD PRIMARY KEY (`draw_id`,`color_id`),
  ADD KEY `IDX_8DF16C796FC5C1B8` (`draw_id`),
  ADD KEY `IDX_8DF16C797ADA1FB5` (`color_id`);

--
-- Indexes for table `draw_tag`
--
ALTER TABLE `draw_tag`
  ADD PRIMARY KEY (`draw_id`,`tag_id`),
  ADD KEY `IDX_AD88216F6FC5C1B8` (`draw_id`),
  ADD KEY `IDX_AD88216FBAD26311` (`tag_id`);

--
-- Indexes for table `pic`
--
ALTER TABLE `pic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`),
  ADD UNIQUE KEY `UNIQ_8D93D6493040C7C2` (`id_avatar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `draw`
--
ALTER TABLE `draw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `pic`
--
ALTER TABLE `pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CEFD5421C` FOREIGN KEY (`id_critic`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9474526CFBD2A10D` FOREIGN KEY (`id_draw`) REFERENCES `draw` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `draw`
--
ALTER TABLE `draw`
  ADD CONSTRAINT `FK_70F2BD0F5590B914` FOREIGN KEY (`id_pic`) REFERENCES `pic` (`id`),
  ADD CONSTRAINT `FK_70F2BD0F5697F554` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_70F2BD0F6B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `draw_color`
--
ALTER TABLE `draw_color`
  ADD CONSTRAINT `FK_8DF16C796FC5C1B8` FOREIGN KEY (`draw_id`) REFERENCES `draw` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8DF16C797ADA1FB5` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `draw_tag`
--
ALTER TABLE `draw_tag`
  ADD CONSTRAINT `FK_AD88216F6FC5C1B8` FOREIGN KEY (`draw_id`) REFERENCES `draw` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AD88216FBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6493040C7C2` FOREIGN KEY (`id_avatar`) REFERENCES `pic` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

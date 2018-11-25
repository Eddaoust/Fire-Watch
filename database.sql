-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  jeu. 08 nov. 2018 à 08:26
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `ed-symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `img`, `description`) VALUES
                                                                   (22, 'Men\'s Watches', 'home_Men.png', 'Sit nam beatae repudiandae quis quia et quo.'),
                                                                   (23, 'Women\'s Watches', 'home_Women.png', 'Et delectus occaecati et voluptatem magnam sequi illo.'),
                                                                   (24, 'Kid\'s Watches', 'home_Kid.png', 'Earum laboriosam consequatur qui vero cum ea eligendi.');

-- --------------------------------------------------------

--
-- Structure de la table `messenger`
--

CREATE TABLE `messenger` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger`
--

INSERT INTO `messenger` (`id`, `user_id`, `message`, `date`, `username`) VALUES
                                                                                (1, 6, 'Mon premier message sur la messagerie de firewatch en ajax!', '2018-10-26 21:03:48', 'panz'),
                                                                                (2, 6, 'le deuxième messge en test c\'est génial ajax lol', '2018-10-26 21:28:36', 'ed'),
                                                                                (3, 6, 'ça tue mais je n\'arrive pas a chopper le nom d\'utilisateur, c\'est lourd loli', '2018-10-26 21:29:47', 'lol'),
                                                                                (4, 6, 'test avec le username', '2018-10-29 11:59:42', 'panzertitan'),
                                                                                (5, 6, 'test simplify', '2018-10-30 11:51:25', 'panzertitan'),
                                                                                (6, 6, 'test simplify', '2018-10-30 11:52:13', 'panzertitan'),
                                                                                (7, 6, 'wesh', '2018-10-30 11:52:24', 'panzertitan'),
                                                                                (32, 6, 'Allez', '2018-10-30 12:03:15', 'panzertitan'),
                                                                                (33, 4, 'c\'est papa', '2018-10-30 12:03:53', 'papa'),
                                                                                (34, 4, 'c\'est mama', '2018-10-30 12:04:51', 'papa'),
                                                                                (35, 4, 'encore un test', '2018-10-30 12:06:44', 'papa'),
                                                                                (36, 4, 'encore un test', '2018-10-30 12:07:13', 'papa'),
                                                                                (37, 6, 'alors, c\'est ok?', '2018-11-05 07:24:18', 'panzertitan'),
                                                                                (38, 6, 'alors, c\'est ok?', '2018-11-05 07:24:30', 'panzertitan'),
                                                                                (39, 6, 'alors, c\'est ok?', '2018-11-05 07:24:37', 'panzertitan'),
                                                                                (40, 6, 'test yo', '2018-11-05 07:29:58', 'panzertitan'),
                                                                                (41, 6, 'test yo', '2018-11-05 07:30:01', 'panzertitan'),
                                                                                (42, 6, 'lea', '2018-11-05 07:36:34', 'panzertitan'),
                                                                                (43, 6, 'lol', '2018-11-06 11:53:59', 'panzertitan'),
                                                                                (44, 6, 'papapa', '2018-11-06 11:54:05', 'panzertitan'),
                                                                                (45, 6, 'papapa', '2018-11-06 11:54:22', 'panzertitan'),
                                                                                (46, 6, 'papapa', '2018-11-06 11:54:27', 'panzertitan'),
                                                                                (47, 6, 'papapa', '2018-11-06 11:54:28', 'panzertitan'),
                                                                                (48, 6, 'rydydr', '2018-11-08 08:14:52', 'panzertitan'),
                                                                                (49, 4, 'LOL', '2018-11-08 08:16:52', 'papa'),
                                                                                (50, 6, 'rydydr\n', '2018-11-08 08:16:59', 'panzertitan');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
                                                    ('20181004090043'),
                                                    ('20181004114900'),
                                                    ('20181004183218'),
                                                    ('20181018104425'),
                                                    ('20181018104951'),
                                                    ('20181018110409'),
                                                    ('20181025094219'),
                                                    ('20181025100617'),
                                                    ('20181025204340'),
                                                    ('20181025213012'),
                                                    ('20181026194310'),
                                                    ('20181026200748'),
                                                    ('20181026203101'),
                                                    ('20181029115406');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `img`, `promo`, `published`, `category_id`) VALUES
                                                                                                 (591, 'Ankunding-Grimes', 978.14, '8.png', 28, 1, 22),
                                                                                                 (592, 'Ortiz Inc', 880.47, '15.png', 45, 1, 22),
                                                                                                 (593, 'Tremblay, Goyette and Stoltenberg', 458.29, '2.png', 43, 1, 22),
                                                                                                 (594, 'Bailey, Baumbach and Keeling', 133.47, '8.png', 49, 1, 22),
                                                                                                 (595, 'Boyle-West', 470.86, '13.png', 41, 1, 22),
                                                                                                 (596, 'Larkin, Quitzon and Medhurst', 500, '9.png', 19, 0, 23),
                                                                                                 (597, 'Thompson-Robel', 384.3, '6.png', 26, 1, 22),
                                                                                                 (598, 'Zieme-Koss', 782.78, '16.png', 23, 1, 22),
                                                                                                 (599, 'Tremblay Ltd', 235.68, '19.png', 6, 1, 22),
                                                                                                 (600, 'Christiansen, Wuckert and Ledner', 457.64, '16.png', 26, 1, 22),
                                                                                                 (601, 'Dooley LLC', 355.54, '4.png', 50, 1, 23),
                                                                                                 (602, 'Ryan, Larkin and Champlin', 387.3, '14.png', 11, 1, 23),
                                                                                                 (603, 'O\'Hara-Daugherty', 379.22, '17.png', 46, 1, 23),
                                                                                                 (604, 'Goyette, Jones and Mosciski', 431.23, '13.png', 28, 1, 23),
                                                                                                 (605, 'Yundt and Sons', 240.01, '12.png', 45, 1, 23),
                                                                                                 (606, 'Fritsch Group', 660.33, '4.png', 46, 1, 23),
                                                                                                 (607, 'Wilderman LLC', 155.86, '8.png', 15, 1, 23),
                                                                                                 (608, 'Hodkiewicz, Jast and Collins', 987.58, '6.png', 50, 1, 23),
                                                                                                 (609, 'Homenick, West and Pacocha', 847.9, '14.png', 11, 1, 23),
                                                                                                 (610, 'POrn Group', 10, '7.png', 20, 0, 23),
                                                                                                 (611, 'Wintheiser Group', 496.69, '4.png', 41, 1, 23),
                                                                                                 (612, 'Hauck, Harris and O\'Connell', 443.43, '19.png', 5, 1, 23),
                                                                                                 (613, 'Farrell-Grimes', 935.76, '15.png', 45, 1, 23),
                                                                                                 (614, 'Zulauf-McClure', 131.77, '17.png', 38, 0, 23),
                                                                                                 (615, 'Lubowitz Inc', 751.46, '8.png', 33, 1, 23),
                                                                                                 (616, 'Kshlerin, Schoen and Halvorson', 879.92, '19.png', 22, 1, 24),
                                                                                                 (617, 'Tremblay Inc', 249.04, '6.png', 32, 1, 24),
                                                                                                 (618, 'Kunde-Ratke', 367.01, '3.png', 37, 1, 24),
                                                                                                 (619, 'Romaguera, Quitzon and Beer', 594.36, '16.png', 14, 1, 24),
                                                                                                 (620, 'Osinski and Sons', 297.76, '5.png', 31, 1, 24),
                                                                                                 (621, 'Medhurst, Gutmann and Reinger', 578.17, '7.png', 25, 1, 24),
                                                                                                 (622, 'Emard, Muller and Littel', 263.1, '18.png', 28, 1, 24),
                                                                                                 (623, 'Herzog-Koss', 567.09, '4.png', 7, 1, 24),
                                                                                                 (624, 'Macejkovic and Sons', 588.35, '3.png', 30, 1, 24),
                                                                                                 (625, 'Cormier Inc', 137.93, '18.png', 16, 1, 24),
                                                                                                 (626, 'Hackett-Trantow', 281, '7.png', 22, 1, 24),
                                                                                                 (627, 'Heaney-Hahn', 86.67, '14.png', 5, 1, 24),
                                                                                                 (628, 'Jacobi-Baumbach', 140.31, '6.png', 10, 1, 24),
                                                                                                 (629, 'Watsica LLC', 450.18, '4.png', 20, 1, 24),
                                                                                                 (630, 'Streich, Stanton and Wiegand', 280.71, '7.png', 50, 1, 24),
                                                                                                 (631, 'Wesh Couzin', 10000, '1.png', 90, 1, 22),
                                                                                                 (632, 'Grosse DeLuxe', 20000, '1.png', 10, 1, 24);

-- --------------------------------------------------------

--
-- Structure de la table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` double NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchase`
--

INSERT INTO `purchase` (`id`, `user_id`, `total`, `date`) VALUES
                                                                 (1, 6, 742.84, '2018-10-26 20:17:16'),
                                                                 (2, 4, 584.75, '2018-10-26 20:17:58'),
                                                                 (3, 4, 1495.97, '2018-10-26 20:18:19'),
                                                                 (4, 6, 1477.6, '2018-11-06 11:53:01'),
                                                                 (5, 6, 1472.23, '2018-11-08 08:12:59');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `birthdate`, `created`) VALUES
                                                                                                  (3, 'camille', 'camille@daoust.be', '$2y$13$il3cnuRUo6XYtXUqF99DpeQ3xjnQk2Ofi9H14rTUsg6d1x9VJi.bC', 'ROLE_ADMIN', '1988-02-12 00:00:00', '2018-10-18 11:08:25'),
                                                                                                  (4, 'papa', 'papa@daoust.be', '$2y$13$OS/c.R1kKhb0zwpDK35PxOQaSJiWhklAZdOEVmLGDaRmgVS1zhQwG', 'ROLE_USER', '1948-05-05 00:00:00', '2018-10-19 13:09:05'),
                                                                                                  (6, 'panzertitan', 'ed@daoust.be', '$2y$13$LiYh47uurQRef905hFacXOPiYlcJQ3m/eCjvyDKgF3czGCWf.vxrq', 'ROLE_ADMIN', '1987-07-08 00:00:00', '2018-10-19 13:51:04');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger`
--
ALTER TABLE `messenger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E22A4301A76ED395` (`user_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6117D13BA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `messenger`
--
ALTER TABLE `messenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=633;

--
-- AUTO_INCREMENT pour la table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `messenger`
--
ALTER TABLE `messenger`
  ADD CONSTRAINT `FK_E22A4301A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `FK_6117D13BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

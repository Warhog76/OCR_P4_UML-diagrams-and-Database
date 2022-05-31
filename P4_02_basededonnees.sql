-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 10 déc. 2021 à 08:54
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ExpressoFood_P4_OCR`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `idadresse` int(11) NOT NULL,
  `voie` varchar(45) NOT NULL,
  `complement_de_voie` varchar(45) DEFAULT NULL,
  `code_postal` varchar(5) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `compte_idcompte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idadresse`, `voie`, `complement_de_voie`, `code_postal`, `ville`, `latitude`, `longitude`, `compte_idcompte`) VALUES
(1, '93 boulevard de Strasbourg', NULL, '76600', 'Le Havre', '49.492444', '0.111867', 1);

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

CREATE TABLE `chef` (
  `idchef` int(11) NOT NULL,
  `pedigree` varchar(255) NOT NULL,
  `compte_idcompte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`idchef`, `pedigree`, `compte_idcompte`) VALUES
(1, '3 étoiles', 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idclient` int(11) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `compte_idcompte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idclient`, `mail`, `compte_idcompte`) VALUES
(1, 'jp123@aol.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idcommande` int(11) NOT NULL,
  `numero_commande` varchar(45) NOT NULL,
  `heure_commande` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2) ON UPDATE CURRENT_TIMESTAMP(2),
  `compte_idcompte` int(11) NOT NULL,
  `ligne_commande_idligne_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcommande`, `numero_commande`, `heure_commande`, `compte_idcompte`, `ligne_commande_idligne_commande`) VALUES
(1, '01', '2021-12-07 17:18:16.00', 1, 1),
(2, '01', '2021-12-08 08:55:31.00', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `idcompte` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `login` varchar(60) DEFAULT NULL,
  `mot_de_passe` varchar(60) DEFAULT NULL,
  `type_compte_idtype_compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`idcompte`, `nom`, `prenom`, `telephone`, `login`, `mot_de_passe`, `type_compte_idtype_compte`) VALUES
(1, 'Jean', 'Pierre', '0123456789', '29af908a49983717e9fe731d16a6a6f375398d62', 'dbb141add629833e8a37715634b10e5c9b7158f9', 1),
(2, 'Momo', 'Durand', '0987456321', 'd82398b205de02bc821017fedb8c220508a6b82d', '2d8296550c238d4bc05536399701090484dd91f1', 2),
(3, 'Paul', 'Bocuse', '0147852369', 'a092b2d4c9d52807932bfedae96b01210db7e06b', '9c74416b130c850c9b27ab3a33bbb401dc5093f8', 3);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `idfacture` int(11) NOT NULL,
  `numero_facture` varchar(45) NOT NULL,
  `heure_facture` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2) ON UPDATE CURRENT_TIMESTAMP(2),
  `prix` decimal(5,2) NOT NULL,
  `commande_idcommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`idfacture`, `numero_facture`, `heure_facture`, `prix`, `commande_idcommande`) VALUES
(1, '0001', '2021-12-07 17:22:51.00', '38.76', 1),
(2, '0001', '2021-12-08 08:56:30.00', '23.92', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `idligne_commande` int(11) NOT NULL,
  `quantite` smallint(2) NOT NULL,
  `produit_idproduit1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`idligne_commande`, `quantite`, `produit_idproduit1`) VALUES
(1, 3, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `idlivraison` int(11) NOT NULL,
  `numero_livraison` varchar(45) NOT NULL,
  `heure_livraison` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2) ON UPDATE CURRENT_TIMESTAMP(2),
  `commande_idcommande` int(11) NOT NULL,
  `status_livraison_idstatus_livraison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`idlivraison`, `numero_livraison`, `heure_livraison`, `commande_idcommande`, `status_livraison_idstatus_livraison`) VALUES
(1, '01', '2021-12-07 17:19:23.82', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `idlivreur` int(11) NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `compte_idcompte` int(11) NOT NULL,
  `status_livreur_idstatus_livreur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`idlivreur`, `latitude`, `longitude`, `compte_idcompte`, `status_livreur_idstatus_livreur`) VALUES
(1, '49.493913', '0.109292', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idproduit` int(11) NOT NULL,
  `numero_produit` varchar(45) NOT NULL,
  `nom` varchar(55) NOT NULL,
  `descriptif` varchar(255) NOT NULL,
  `composition` mediumtext,
  `prix_unit_ht` decimal(5,2) NOT NULL,
  `taux_tva` decimal(5,2) NOT NULL,
  `compte_idcompte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idproduit`, `numero_produit`, `nom`, `descriptif`, `composition`, `prix_unit_ht`, `taux_tva`, `compte_idcompte`) VALUES
(1, '0001', 'Spaghetti carbonara', 'Pates délicieuses pour les grands et les petits.', 'Spaghetti - Lardon - oeuf - parmesan', '10.80', '19.60', 3),
(2, '0002', 'pizza', 'un delice', 'pate, tomate, anchois', '10.00', '19.60', 3);

-- --------------------------------------------------------

--
-- Structure de la table `status_livraison`
--

CREATE TABLE `status_livraison` (
  `idstatus_livraison` int(11) NOT NULL,
  `status_livraison` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `status_livraison`
--

INSERT INTO `status_livraison` (`idstatus_livraison`, `status_livraison`) VALUES
(1, 'en préparation'),
(2, 'en livraison'),
(3, 'livrée'),
(4, 'annulée');

-- --------------------------------------------------------

--
-- Structure de la table `status_livreur`
--

CREATE TABLE `status_livreur` (
  `idstatus_livreur` int(11) NOT NULL,
  `status_livreur` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `status_livreur`
--

INSERT INTO `status_livreur` (`idstatus_livreur`, `status_livreur`) VALUES
(1, 'disponible'),
(2, 'en livraison'),
(3, 'en rechargement');

-- --------------------------------------------------------

--
-- Structure de la table `type_compte`
--

CREATE TABLE `type_compte` (
  `idtype_compte` int(11) NOT NULL,
  `type_compte` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_compte`
--

INSERT INTO `type_compte` (`idtype_compte`, `type_compte`) VALUES
(1, 'client'),
(2, 'chef'),
(3, 'livreur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`idadresse`),
  ADD KEY `fk_adresse_compte1_idx` (`compte_idcompte`);

--
-- Index pour la table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`idchef`,`compte_idcompte`),
  ADD KEY `fk_chef_compte_idx` (`compte_idcompte`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idclient`,`compte_idcompte`),
  ADD KEY `fk_client_compte1_idx` (`compte_idcompte`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idcommande`),
  ADD KEY `fk_commande_compte1_idx` (`compte_idcompte`),
  ADD KEY `fk_commande_ligne_commande1_idx` (`ligne_commande_idligne_commande`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`idcompte`),
  ADD KEY `fk_compte_type_compte1_idx` (`type_compte_idtype_compte`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`idfacture`),
  ADD KEY `fk_facture_commande1_idx` (`commande_idcommande`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`idligne_commande`),
  ADD KEY `fk_ligne_commande_produit1_idx` (`produit_idproduit1`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`idlivraison`),
  ADD KEY `fk_livraison_commande1_idx` (`commande_idcommande`),
  ADD KEY `fk_livraison_status_livraison1_idx` (`status_livraison_idstatus_livraison`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`idlivreur`,`compte_idcompte`),
  ADD KEY `fk_livreur_compte1_idx` (`compte_idcompte`),
  ADD KEY `fk_livreur_status_livreur1_idx` (`status_livreur_idstatus_livreur`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idproduit`),
  ADD KEY `fk_produit_compte1_idx` (`compte_idcompte`);

--
-- Index pour la table `status_livraison`
--
ALTER TABLE `status_livraison`
  ADD PRIMARY KEY (`idstatus_livraison`);

--
-- Index pour la table `status_livreur`
--
ALTER TABLE `status_livreur`
  ADD PRIMARY KEY (`idstatus_livreur`);

--
-- Index pour la table `type_compte`
--
ALTER TABLE `type_compte`
  ADD PRIMARY KEY (`idtype_compte`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_compte1` FOREIGN KEY (`compte_idcompte`) REFERENCES `compte` (`idcompte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `fk_chef_compte` FOREIGN KEY (`compte_idcompte`) REFERENCES `compte` (`idcompte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_compte1` FOREIGN KEY (`compte_idcompte`) REFERENCES `compte` (`idcompte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_compte1` FOREIGN KEY (`compte_idcompte`) REFERENCES `compte` (`idcompte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_ligne_commande1` FOREIGN KEY (`ligne_commande_idligne_commande`) REFERENCES `ligne_commande` (`idligne_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `fk_compte_type_compte1` FOREIGN KEY (`type_compte_idtype_compte`) REFERENCES `type_compte` (`idtype_compte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_facture_commande1` FOREIGN KEY (`commande_idcommande`) REFERENCES `commande` (`idcommande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_produit1` FOREIGN KEY (`produit_idproduit1`) REFERENCES `produit` (`idproduit`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_commande1` FOREIGN KEY (`commande_idcommande`) REFERENCES `commande` (`idcommande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livraison_status_livraison1` FOREIGN KEY (`status_livraison_idstatus_livraison`) REFERENCES `status_livraison` (`idstatus_livraison`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_compte1` FOREIGN KEY (`compte_idcompte`) REFERENCES `compte` (`idcompte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_status_livreur1` FOREIGN KEY (`status_livreur_idstatus_livreur`) REFERENCES `status_livreur` (`idstatus_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_compte1` FOREIGN KEY (`compte_idcompte`) REFERENCES `compte` (`idcompte`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

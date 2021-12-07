DROP DATABASE IF EXISTS `filRouge`;
CREATE DATABASE `filRouge`;
USE `filRouge`;


CREATE TABLE categories(
   cat_id INT,
   cat_nom VARCHAR(50) NOT NULL,
   cat_parent_id INT,
   PRIMARY KEY(cat_id),
   FOREIGN KEY(cat_parent_id) REFERENCES categories(cat_id)
);

INSERT INTO `categories` (`cat_id`, `cat_nom`, `cat_parent_id`) VALUES
(1, 'Guit/Bass', NULL),
(2, 'Batteries', NULL),
(3, 'Clavier', NULL),
(4, 'Studio', NULL),
(5, 'Sono', NULL),
(6, 'Eclairage', NULL),
(7, 'DJ', NULL),
(8, 'Cases', NULL),
(9, 'Accessoires', NULL),
(10, 'Guitares Electriques', 1),
(11, 'Guitares Classiques', 1),
(12, 'Guitares Acous­tiques & Elec­tro-Acous­tiques', 1),
(13, 'Basses electriques', 1),
(14, 'Basses acoustiques', 1),
(15, 'Batteries Acous­tiques', 2),
(16, 'Batteries Electtroniques', 2),
(17, 'Cymbales', 2),
(18, 'Ba­guettes & Maillets', 2),
(19, 'Cla­viers Ar­ran­geurs', 3),
(20, 'Cla­viers Maîtres', 3);

	

CREATE TABLE produit(
   pro_id INT,
   pro_libelle VARCHAR(200) NOT NULL,
   pro_description VARCHAR(1000),
   prix_achat_HT DECIMAL(5,2) NOT NULL,
   Taux_TVA DECIMAL(2,2) NOT NULL,
   prix_vente DECIMAL(5,2) NOT NULL,
   pro_photo VARCHAR(4),
   pro_stock INT,
   cat_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id)
);

INSERT INTO `produit` (`pro_id`, `pro_libelle`, `pro_description`, `prix_achat_HT`, `Taux_TVA`, `prix_vente`, `pro_photo`, `pro_stock`, `cat_id`) VALUES 
(1, 'Harley Benton', 'Guitare électrique, Harley Benton ST-20HSS CA Standard Set 1', 100, 20, 179, 'jpg', 5, 10),
(2, 'Thomann Guitar', 'Guitare électrique, Thomann Guitar Set G13 White', 70, 20, 149, 'jpg', 2, 10),
(3, 'Fender', 'Guitare électrique, Fender SQ Aff. Strat HSS MN PACK LPB', 150, 20, 299, 'jpg', 1, 10),
(4, 'Startone', 'Guitare classique, Startone CG 851 1/8', 10, 20, 37, 'jpg', 15, 11),
(5, 'Yamaha', 'Guitare classique, Yamaha GL1 Tobacco Brown Sunburst', 25, 20, 88, 'jpg', 8, 11),
(6, 'La Mancha', 'Guitare classique, La Mancha Rubinito CM/47', 100, 20, 211, 'jpg', 6, 11),
(7, 'Ortega', 'Guitare classique, Ortega R122-1/4', 60, 20, 145, 'jpg', 4, 11),
(8, 'Epiphone', 'Guitares Acous­tiques & Elec­tro-Acous­tiques, Epiphone J-15 EC Deluxe NA', 160, 20, 258, 'jpg', 2, 12),
(9, 'Baton Rouge', 'Guitares Acous­tiques & Elec­tro-Acous­tiques, Baton Rouge X11LS/D-W-SCC', 99, 20, 195, 'jpg', 7, 12),
(10, 'Gibson', 'Guitares Acous­tiques & Elec­tro-Acous­tiques, Gibson G-45 Natural Generation', 700, 20, 1088, 'jpg', 3, 12);



CREATE TABLE commercial(
   commercial_id INT,
   commercial_nom VARCHAR(50) NOT NULL,
   commercial_prenom VARCHAR(50) NOT NULL,
   commercial_type VARCHAR(50) NOT NULL,
   PRIMARY KEY(commercial_id)
);

INSERT INTO `commercial` (`commercial_id`, `commercial_nom`, `commercial_prenom`, `commercial_type`) VALUES 
(1, 'Martin', 'Léo', 'particulier'),
(2, 'Bernard', 'Gabriel', 'professionnel'),
(3, 'Thomas', 'Raphaël', 'professionnel'),
(4, 'Petit', 'Arthur', 'professionnel'),
(5, 'Robert', 'Louis', 'professionnel');



CREATE TABLE client(
   cli_référence INT,
   cli_nom VARCHAR(50) NOT NULL,
   cli_prenom VARCHAR(50) NOT NULL,
   cli_categorie VARCHAR(50) NOT NULL,
   cli_tel VARCHAR(15) NOT NULL,
   cli_email VARCHAR(255) NOT NULL,
   cli_mdp VARCHAR(255) NOT NULL,
   cli_coefficient DECIMAL(2,2),
   commercial_id INT NOT NULL,
   PRIMARY KEY(cli_référence),
   FOREIGN KEY(commercial_id) REFERENCES commercial(commercial_id)
);

INSERT INTO `client` (`cli_référence`, `cli_nom`, `cli_prenom`, `cli_categorie`, `cli_tel`, `cli_email`, `cli_mdp`, `cli_coefficient`, `commercial_id`) VALUES 
(1, 'Richard', 'Jules', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.2, 2),
(2, 'Durand', 'Adam', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.15, 3),
(3, 'Dubois', 'Lucas', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.1, 4),
(4, 'Moreau', 'Hugo', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.2, 2),
(5, 'Laurent', 'Gabin', 'particulier', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.3, 1),
(6, 'Simon', 'Paul', 'particulier', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.2, 1),
(7, 'Michel', 'Nathan', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.1, 2),
(8, 'Lefebvre', 'Leon', 'particulier', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.15, 1),
(9, 'Leroy', 'Marius', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.3, 5),
(10, 'Roux', 'Victor', 'professionnel', 0751250810, 'nijatmajidli@gmail.com', 12345, 0.25, 3);



CREATE TABLE commande(
   com_id INT,
   com_date DATE NOT NULL,
   mode_paiement VARCHAR(50) NOT NULL,
   expedition VARCHAR(50) NOT NULL,
   date_facturation DATE,
   date_livraison DATE,
   cli_référence INT NOT NULL,
   PRIMARY KEY(com_id),
   FOREIGN KEY(cli_référence) REFERENCES client(cli_référence)
);

INSERT INTO `commande` (`com_id`, `com_date`, `mode_paiement`, `expedition`, `date_facturation`,  `date_livraison`, `cli_référence`) VALUES 
(1, '2021-06-03', 'en différé', 'complet', '2021-06-06', '2021-06-12', 1),
(2, '2021-07-23', 'en différé', 'complet', '2021-07-29', '2021-07-31', 2),
(3, '2021-07-18', 'en différé', 'complet', '2021-07-23', '2021-07-25', 3),
(4, '2021-08-05', 'en différé', 'complet', '2021-08-10', '2021-08-15', 4),
(5, '2021-09-11', 'à la commande', 'complet', '2021-09-12', '2021-09-14', 5),
(6, '2021-10-06', 'à la commande', 'complet', '2021-10-08', '2021-10-07', 6),
(7, '2021-10-21', 'en différé', 'partiellement', '2021-10-30', NULL, 7),
(8, '2021-11-02', 'à la commande', 'partiellement', '2021-11-02', NULL, 8);







CREATE TABLE adresse(
   id INT,
   type VARCHAR(50) NOT NULL,
   adresse VARCHAR(255) NOT NULL,
   code_postal VARCHAR(15) NOT NULL,
   ville VARCHAR(50) NOT NULL,
   pays VARCHAR(50) NOT NULL,
   cli_référence INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(cli_référence) REFERENCES client(cli_référence)
);

INSERT INTO `adresse` (`id`, `type`, `adresse`, `code_postal`, `ville`, `pays`, `cli_référence`) VALUES 
(1, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 1),
(2, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 2),
(3, 'livraison', '4 rue Richard Wagner', '60100', 'Creil', 'France', 3),
(4, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 4),
(5, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 5),
(6, 'livraison', '4 rue Richard Wagner', '60100', 'Creil', 'France', 6),
(7, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 7),
(8, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 8),
(9, 'livraison', '4 rue Richard Wagner', '60100', 'Creil', 'France', 9),
(10, 'facturation', '4 rue Richard Wagner', '60100', 'Creil', 'France', 10);



CREATE TABLE concerne(
   pro_id INT,
   com_id INT,
   quantité INT,
   remise INT,
   PRIMARY KEY(pro_id, com_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id)
);


CREATE TABLE facture(
   com_id INT,
   id INT,
   PRIMARY KEY(com_id, id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id),
   FOREIGN KEY(id) REFERENCES adresse(id)
);


CREATE TABLE livre(
   com_id INT,
   id INT,
   PRIMARY KEY(com_id, id),
   FOREIGN KEY(com_id) REFERENCES commande(com_id),
   FOREIGN KEY(id) REFERENCES adresse(id)
);





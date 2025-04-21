-- Insertion pour la table Utilisateurs
INSERT INTO utilisateurs (id, nom, email, role) VALUES (1, 'Omar Elalami', 'omar@gmail.com', 'freelance');
INSERT INTO utilisateurs (id, nom, email, role) VALUES (2, 'Sara Benyahia', 'sara@gmail.com', 'client');
INSERT INTO utilisateurs (id, nom, email, role) VALUES (3, 'Reda Hajjami', 'reda@gmail.com', 'freelance');
INSERT INTO utilisateurs (id, nom, email, role) VALUES (4, 'Latifa Skalli', 'latifa@gmail.com', 'client');
INSERT INTO utilisateurs (id, nom, email, role) VALUES (5, 'Yassir Amrani', 'yassir@gmail.com', 'freelance');
INSERT INTO utilisateurs (id, nom, email, role) VALUES (6, 'Hamzat', 'Hamzat@gmail.com', 'client');

-- Insertion pour la table Profils
INSERT INTO profils (id, utilisateur_id, bio, tarif_horaire, disponible) VALUES (1, 1, 'Dév web fullstack', 150, TRUE);
INSERT INTO profils (id, utilisateur_id, bio, tarif_horaire, disponible) VALUES (2, 3, 'UI/UX Designer', 120, FALSE);
INSERT INTO profils (id, utilisateur_id, bio, tarif_horaire, disponible) VALUES (3, 5, 'Devops & Cloud', 180, TRUE);
INSERT INTO profils (id, utilisateur_id, bio, tarif_horaire, disponible) VALUES (4, 5, 'Mobile Dev', 90, TRUE);

-- Insertion pour la table Compétences
INSERT INTO competences (id, nom) VALUES (1, 'Laravel');
INSERT INTO competences (id, nom) VALUES (2, 'ReactJS');
INSERT INTO competences (id, nom) VALUES (3, 'Figma');
INSERT INTO competences (id, nom) VALUES (4, 'AWS');
INSERT INTO competences (id, nom) VALUES (5, 'Docker');

-- Insertion pour la table Profil_Compétences
INSERT INTO profil_competence (profil_id, competence_id) VALUES (1, 1);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (1, 2);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (2, 1);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (2, 2);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (2, 3);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (2, 4);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (3, 4);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (3, 5);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (1, 3);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (1, 4);
INSERT INTO profil_competence (profil_id, competence_id) VALUES (1, 5);

-- Insertion pour la table Projets
INSERT INTO projets (id, client_id, titre, budget, statut) VALUES (1, 2, 'Site E-commerce', 12000, 'ouvert');
INSERT INTO projets (id, client_id, titre, budget, statut) VALUES (2, 4, 'Dashboard RH', 15000, 'en cours');
INSERT INTO projets (id, client_id, titre, budget, statut) VALUES (3, 4, 'Refonte site UX', 8000, 'terminé');
INSERT INTO projets (id, client_id, titre, budget, statut) VALUES (4, 2, 'Disctop App', 15500, 'ouvert');

-- Insertion pour la table Offres
INSERT INTO offres (id, projet_id, freelance_id, prix_propose) VALUES (1, 1, 1, 11000);
INSERT INTO offres (id, projet_id, freelance_id, prix_propose) VALUES (2, 2, 3, 14500);
INSERT INTO offres (id, projet_id, freelance_id, prix_propose) VALUES (3, 3, 5, 7800);
INSERT INTO offres (id, projet_id, freelance_id, prix_propose) VALUES (4, 4, 1, 5200);
INSERT INTO offres (id, projet_id, freelance_id, prix_propose) VALUES (5, 1, 1, 2300);
INSERT INTO offres (id, projet_id, freelance_id, prix_propose) VALUES (6, 1, 1, 10200);

-- Insertion pour la table Missions
INSERT INTO missions (id, offre_id, statut) VALUES (1, 2, 'livré');
INSERT INTO missions (id, offre_id, statut) VALUES (2, 3, 'validé');

-- Insertion pour la table Factures
INSERT INTO factures (id, mission_id, montant, paye) VALUES (1, 1, 14500, TRUE);
INSERT INTO factures (id, mission_id, montant, paye) VALUES (2, 2, 7800, FALSE);

-- Insertion pour la table Évaluations
INSERT INTO evaluations (id, mission_id, note, commentaire) VALUES (1, 1, 5, 'Excellent travail');
INSERT INTO evaluations (id, mission_id, note, commentaire) VALUES (2, 2, 3, 'Travail correct');
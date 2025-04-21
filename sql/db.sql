CREATE DATABASE IF NOT EXISTS freelance_platform;
USE freelance_platform;

-- TABLE UTILISATEURS
CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(255),
    role ENUM('client', 'freelance'),
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- TABLE PROFILS
CREATE TABLE profils (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    bio TEXT,
    tarif_horaire DECIMAL(8,2),
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- TABLE COMPETENCES
CREATE TABLE competences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100)
);

-- TABLE PROFIL_COMPETENCE
CREATE TABLE profil_competence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profil_id INT,
    competence_id INT,
    FOREIGN KEY (profil_id) REFERENCES profils(id),
    FOREIGN KEY (competence_id) REFERENCES competences(id)
);

-- TABLE PROJETS
CREATE TABLE projets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    titre VARCHAR(255),
    description TEXT,
    budget DECIMAL(10,2),
    delai INT,
    statut ENUM('ouvert', 'en cours', 'terminé') DEFAULT 'ouvert',
    date_publication DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES utilisateurs(id)
);

-- TABLE OFFRES
CREATE TABLE offres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projet_id INT,
    freelance_id INT,
    prix_propose DECIMAL(10,2),
    delai_propose INT,
    message TEXT,
    date_envoi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (projet_id) REFERENCES projets(id),
    FOREIGN KEY (freelance_id) REFERENCES utilisateurs(id)
);

-- TABLE MISSIONS
CREATE TABLE missions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    offre_id INT,
    date_debut DATE,
    date_fin DATE,
    statut ENUM('en cours', 'livré', 'validé', 'refusé'),
    FOREIGN KEY (offre_id) REFERENCES offres(id)
);

-- TABLE FACTURES
CREATE TABLE factures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mission_id INT,
    montant DECIMAL(10,2),
    date_emission DATE,
    paye BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (mission_id) REFERENCES missions(id)
);

-- TABLE TRANSACTIONS
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    facture_id INT,
    moyen_paiement VARCHAR(50),
    date_transaction DATE,
    montant DECIMAL(10,2),
    FOREIGN KEY (facture_id) REFERENCES factures(id)
);

-- TABLE EVALUATIONS
CREATE TABLE evaluations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mission_id INT,
    note INT CHECK(note BETWEEN 1 AND 5),
    commentaire TEXT,
    date_evaluation DATE,
    FOREIGN KEY (mission_id) REFERENCES missions(id)
);

-- TABLE CATEGORIES
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100)
);

-- TABLE PROJET_CATEGORIE
CREATE TABLE projet_categorie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projet_id INT,
    categorie_id INT,
    FOREIGN KEY (projet_id) REFERENCES projets(id),
    FOREIGN KEY (categorie_id) REFERENCES categories(id)
);

-- TABLE LANGUES
CREATE TABLE langues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);

-- TABLE PROFIL_LANGUE
CREATE TABLE profil_langue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profil_id INT,
    langue_id INT,
    niveau ENUM('débutant', 'intermédiaire', 'avancé'),
    FOREIGN KEY (profil_id) REFERENCES profils(id),
    FOREIGN KEY (langue_id) REFERENCES langues(id)
);

-- TABLE PAYS
CREATE TABLE pays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100)
);

-- TABLE ADRESSES
CREATE TABLE adresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    pays_id INT,
    ville VARCHAR(100),
    code_postal VARCHAR(20),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (pays_id) REFERENCES pays(id)
);

-- TABLE NOTIFICATIONS
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    message TEXT,
    date_notification DATETIME DEFAULT CURRENT_TIMESTAMP,
    lu BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- TABLE HISTORIQUE_CONNEXIONS
CREATE TABLE historique_connexions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    date_connexion DATETIME,
    ip VARCHAR(45),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- TABLE SESSIONS
CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    token VARCHAR(255),
    date_expiration DATETIME,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- TABLE MESSAGES
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    expediteur_id INT,
    destinataire_id INT,
    contenu TEXT,
    date_envoi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (expediteur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (destinataire_id) REFERENCES utilisateurs(id)
);
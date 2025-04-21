
-- ====== Utilisateurs & Profils
-- Afficher les freelances qui parlent l’anglais (langues.nom = 'Anglais') avec un niveau avancé.
SELECT utilisateurs.nom, profil_langue.niveau FROM utilisateurs
INNER JOIN profils ON profils.utilisateur_id = utilisateurs.id
INNER JOIN profil_langue ON profil_langue.profil_id = profils.id
INNER JOIN langues ON langues.id = profil_langue.langue_id
WHERE utilisateurs.role = 'freelance' AND langues.nom = 'Anglais';

-- Lister les freelances ayant plus de 3 compétences.
SELECT utilisateurs.nom, COUNT(competences.id) as nombreCompetance FROM utilisateurs
INNER JOIN profils ON profils.utilisateur_id = utilisateurs.id
INNER JOIN profil_competence ON profil_competence.profil_id = profils.id
INNER JOIN competences ON competences.id = profil_competence.competence_id
HAVING nombreCompetance > 3;

-- Afficher les freelances disponibles, leur tarif horaire et leur ville.
SELECT utilisateurs.nom, profils.tarif_horaire, adresses.ville  
FROM utilisateurs
INNER JOIN profils ON profils.utilisateur_id = utilisateurs.id
INNER JOIN adresses ON adresses.utilisateur_id = utilisateurs.id
WHERE utilisateurs.role = 'freelance' AND profils.disponible = 0;

-- Lister tous les utilisateurs qui ne possèdent pas encore de profil.
SELECT utilisateurs.nom 
FROM utilisateurs
LEFT JOIN profils ON profils.utilisateur_id = utilisateurs.id
WHERE profils.id is null

-- Afficher les clients qui n'ont jamais publié de projet.
SELECT utilisateurs.nom 
FROM utilisateurs
LEFT JOIN projets ON projets.client_id = utilisateurs.id
WHERE utilisateurs.role = 'client' AND projets.id is null

-- ======= Projets & Offres

-- Afficher les projets ouverts avec leur budget et leur nombre total d’offres reçues
SELECT projets.titre, projets.budget, COUNT(offres.id) FROM projets
INNER JOIN offres ON offres.projet_id = projets.id
WHERE projets.statut = 'ouvert'
GROUP BY projets.titre, projets.budget

-- Lister les offres envoyées par des freelances dont le tarif horaire est inférieur à 100 MAD.

SELECT offres.* FROM offres
INNER JOIN utilisateurs ON utilisateurs.id = offres.freelance_id
INNER JOIN profils ON profils.utilisateur_id = utilisateurs.id
WHERE profils.tarif_horaire < 100;

-- Afficher les projets qui ont reçu au moins 3 offres.
SELECT projets.titre, COUNT(offres.id) as nombreOffre FROM projets
INNER JOIN offres ON offres.projet_id = projets.id
GROUP BY projets.titre
HAVING nombreOffre >= 3;

-- Afficher les freelances qui ont postulé sur plus de 5 projets différents.
-- ???????

-- Afficher les projets terminés avec les dates de début et de fin des missions associées.
SELECT projets.*, missions.date_debut, missions.date_fin  FROM projets
INNER JOIN offres ON offres.projet_id = projets.id
INNER JOIN missions ON missions.offre_id = offres.id
WHERE projets.statut = 'terminé';

-- ======= Facturation & Transactions
-- Lister les factures payées avec le nom du freelance, le montant, et le moyen de paiement.
SELECT utilisateurs.nom, factures.montant, transactions.moyen_paiement  FROM factures
INNER JOIN transactions ON transactions.facture_id = factures.id
INNER JOIN missions ON missions.id = factures.mission_id
INNER JOIN offres ON offres.id = missions.offre_id
INNER JOIN utilisateurs ON utilisateurs.id = offres.freelance_id
WHERE factures.paye = 1;

-- Afficher le total des gains par freelance (somme des factures payées).
SELECT utilisateurs.nom,factures.paye, SUM(factures.montant) FROM factures
INNER JOIN transactions ON transactions.facture_id = factures.id
INNER JOIN missions ON missions.id = factures.mission_id
INNER JOIN offres ON offres.id = missions.offre_id
INNER JOIN utilisateurs ON utilisateurs.id = offres.freelance_id
GROUP BY utilisateurs.nom, factures.paye
HAVING factures.paye = 1;

-- Lister les missions validées dont le paiement n’a pas encore été effectué.
SELECT * FROM missions
INNER JOIN factures ON factures.mission_id = missions.id
WHERE factures.paye = 0 AND missions.statut = 'validé' ;

-- Afficher les freelances qui ont généré plus de 20 000 MAD de chiffre d’affaires.
SELECT * FROM utilisateurs
INNER JOIN offres ON offres.freelance_id = utilisateurs.id
INNER JOIN missions ON missions.offre_id = offres.id
INNER JOIN factures ON factures.mission_id = missions.id
WHERE utilisateurs.role = 'freelance' AND factures.montant > 20000;

-- Afficher les clients dont les projets ont généré plus de 10 000 MAD de dépenses.
SELECT * FROM utilisateurs
INNER JOIN offres ON offres.freelance_id = utilisateurs.id
INNER JOIN missions ON missions.offre_id = offres.id
INNER JOIN factures ON factures.mission_id = missions.id
WHERE utilisateurs.role = 'client' AND factures.montant > 10000;


-- ========== Évaluations & Qualité
-- Afficher la note moyenne obtenue par chaque freelance.